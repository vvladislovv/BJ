local TS = game:GetService("TweenService")
local FlowerRegister = require(game.ServerScriptService.Server.FlowerRegister)
local GenerateFields = require(game.ServerScriptService.Server.GenerateFields)

local module = {}

function module:SpawnBubble(Player, Flower, Field, PData, Boost)
	local Bubble = game.ReplicatedStorage.Assets.Bubble:Clone()
	local BubbleSize = Bubble.Size
	Bubble.Size = Vector3.new(0,0,0)
	Bubble.Parent = game.Workspace.ServerEffects
	Bubble.Position = Flower.Position + Vector3.new(0,2,0)
	TS:Create(Bubble, TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Size = BubbleSize}):Play()
	local Pos = Bubble.Position
	Bubble.Player.Value = Player.Name
	Bubble.Field.Value = Field
	if Boost and Boost == true then
		Bubble.Boost.Value = true
	end
end

function module:SpawnFireRing(Player, Field, Pos, PData)
	spawn(function()
	local FireRing = game.ServerStorage.Assets.Stamps.FireRing:Clone()
	FireRing.Parent = workspace.ServerEffects
	FireRing:SetPrimaryPartCFrame(Pos.CFrame)
	local CenterPos = FireRing.PrimaryPart.Position
	for i,v in pairs(FireRing:GetChildren()) do
		if v ~= FireRing.PrimaryPart then
			module:SpawnFire(Player, v, Field, PData, CenterPos)
		end
	end
	FireRing:Destroy()
	end)
end

function module:SpawnFire(Player, Part, Field, PData, CenterPos)
	spawn(function()
	local Fire = script.FirePart:Clone()
	Fire.Parent = workspace.ServerEffects
	Fire.Position = Part.Position
	Fire.Name = "Fire"
	local Flowers = game.Workspace.Fields[Field]:GetChildren()
	
	local ray = RaycastParams.new()
	ray.FilterDescendantsInstances = {game.Workspace.Fields}
	ray.FilterType = Enum.RaycastFilterType.Whitelist
	local raycast = workspace:Raycast(Fire.Position + Vector3.new(0,15,0), Vector3.new(0,-100,0), ray)
	
	if raycast and raycast.Instance then
	local Hit = raycast.Instance
	if Hit.Name == "Flower" then
	Fire.Position = Hit.Position + Vector3.new(0,1,0)
	game.ReplicatedStorage.Remotes.ChangeFireColor:FireAllClients("Dark", Fire)
	game.ReplicatedStorage.Remotes.ChangeFireColor:FireClient(Player, "Bright", Fire)
		spawn(function()
			while Fire.Parent do
				wait(1)
				if Fire.Parent then
					FlowerRegister:CollectFlower(Player, PData, Hit, CenterPos, {
						Color = "Red",
						Powers = 0.3,
						Pollen = math.round(6 * (PData.AllStats["Pollen From Flames"] / 100)),
					}, nil)
					for d,b in (Flowers) do
						if (b.Position - Hit.Position).Magnitude <= 3 then
							spawn(function()
								FlowerRegister:CollectFlower(Player, PData, b, CenterPos, {
									Color = "Red",
									Powers = 0.3,
									Pollen = math.round(6 * (PData.AllStats["Pollen From Flames"] / 100)),
								}, nil)
							end)
							end
						end
					else
						break
					end
				end
			end)
		end
		spawn(function()
			while Fire.Parent do wait()
				if Fire then
					local Character = game.Workspace:FindFirstChild(Player.Name)
					if Character then
						if (Fire.Position - Character.PrimaryPart.Position).Magnitude <= 2 then
							game.ReplicatedStorage.Remotes.Boost:Fire(Player, "Flames", 1)
							wait(0.1)
						end
					else
						break
					end
				else
					break
				end
			end
		end)
	end
	
	spawn(function()
		wait(6 * (PData.AllStats["Flame Duration"] / 100))
		Fire.ParticleEmitter.Enabled = false
		wait(1)
		Fire:Destroy()
		end)
	end)
end

return module
