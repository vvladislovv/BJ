local Data
local FlowerRegister
local GenerateFields
local TS = game:GetService("TweenService")
spawn(function()
	Data = require(game.ServerScriptService.Server.Data)
	FlowerRegister = require(game.ServerScriptService.Server.FlowerRegister)
	GenerateFields = require(game.ServerScriptService.Server.GenerateFields)
end)

local module = {}

local function PlatformDist(Hive, HRP)
	if (HRP.Position - Hive.Position).Magnitude <= 10 then
		return true
	else
		return false
	end
end

function module.Start(Player)
	wait(1)
	if Data ~= nil and FlowerRegister ~= nil then
	spawn(function()
	local Flowers = {}
	local Character = Player.Character or Player.CharacterAdded:Wait()
	local Touched = false
	local PData = Data:Get(Player)
	Character.RightUpperLeg.Touched:Connect(function(Flower)
		if Flower.Name == "Flower" and PData.Field ~= "" then
			if Character.Humanoid.MoveDirection.Magnitude > 0 and PData.AllStats["Movement Collection"] > 0 then
				if PData.IStats.Pollen < PData.IStats.Capacity then
					if not table.find(Flowers, Flower) and Touched == false then
						Touched = true
						table.insert(Flowers, Flower)
						FlowerRegister:CollectFlower(Player, PData, Flower, Character.PrimaryPart.Position)
						wait(0.025)
						table.clear(Flowers)
						Touched = false
					end
				end
			end
		end
			end)
			

	spawn(function()
		local PData = Data:Get(Player)
		while Character do wait(0.001)
			if PData.Vars.Making == true then
				if PData.Vars.Hive ~= "" then
					if PlatformDist(workspace.Hives[PData.Vars.Hive].Pad.Circle, Character.HumanoidRootPart) == false or Character.Humanoid.Health < 0 then
						if PData.Vars.Making then
							PData.Vars.Making = false
							game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Player, {"Vars", PData.Vars})
						end
					end
				end
			end
		end
	end)
		end)
	else
		return
	end
	
	game.Workspace.ServerEffects.ChildAdded:Connect(function(Part)
		if Part.Name == "Bubble" then
		local Character = game.Workspace:FindFirstChild(Player.Name)
		if Character and Character.PrimaryPart then
		Character.PrimaryPart.Touched:Connect(function(Hit)
			if Hit == Part then
				local Bubble = Hit
				local BubbleSize = Bubble.Size
				Bubble.CanTouch = false
				spawn(function()
				TS:Create(Bubble, TweenInfo.new(0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Size = BubbleSize + Vector3.new(2,2,2)}):Play()
				TS:Create(Bubble, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Transparency = 1}):Play()
				TS:Create(Bubble, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Color = Color3.fromRGB(137, 254, 255)}):Play()
				wait(0.3)
				Bubble:Destroy()
				end)
				if Bubble.Boost and Bubble.Boost.Value == true then
					game.ReplicatedStorage.Remotes.Boost:Fire(game.Players:FindFirstChild(Bubble.Player.Value), "Bubble Boost", 1)
				end
				local PData = Data:Get(game.Players:FindFirstChild(Bubble.Player.Value))
				for i,v in pairs(game.Workspace.Fields[Bubble.Field.Value]:GetChildren()) do
					if (v.Position - Bubble.Position).Magnitude <= 8 then
						spawn(function()
							FlowerRegister:CollectFlower(Player, PData, v, v, {
								Color = "Blue",
								Powers = 0,
								Pollen = math.round(12 * (PData.AllStats["Pollen From Bubbles"] / 100)),
							}, nil)
							v.Position = Vector3.new(v.Position.X,GenerateFields.Flowers[v.FlowerID.Value].MaxPosition,v.Position.Z)
						end)
					end
				end
			end
				end)
			end
		end
	end)
end

return module
