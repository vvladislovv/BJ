local v1 = {}
local SSS = game:GetService("ServerScriptService")
local Debris = game:GetService("Debris")
local Fields = require(SSS:WaitForChild("Server").GenerateFields)
local FlowerRegister = require(SSS:WaitForChild("Server").FlowerRegister)
local FlowerRegister = require(SSS:WaitForChild("Server").FlowerRegister)
local Remotes = game:GetService("ReplicatedStorage").Remotes
local Generator = require(SSS.Server.GenerateFields)
local BeesLevels = require(game.ReplicatedStorage.Modules.BeeLevels)

local Tween = game:GetService("TweenService")

local function WaitUntilReached(BeeModel, Magnitude, HRP)
	if BeeModel and BeeModel.PrimaryPart then
		repeat wait() if not BeeModel.PrimaryPart then break end
		until (BeeModel.PrimaryPart.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7)
	else
		return
	end
end

local function GetRandomFlowerPosition(p3)
	if p3.PData.Vars.Field ~= "" then
		local Field = workspace.Fields[p3.PData.Vars.Field]:GetChildren()
		local Flower = Field[math.random(1, #Field)]
		
		return Flower.Position
	end
end

function v1.Spawn(p3, Player)
	if p3.PData.Vars.Field ~= "" then
	local Field = p3.PData.Vars.Field
	if p3.PData.IStats.Pollen < p3.PData.IStats.Capacity then
	local Bee = game.Workspace.Bees[Player.Name]:FindFirstChild(p3.Bee)
	local BodyGyro = Bee.PrimaryPart:FindFirstChild("BodyGyro")
	Bee.Positioner.CollisionGroupId = 1
	Bee.Positioner.Position = p3.TokenPos + Vector3.new(0,15,0)
	local Magnitude = 7
	if p3.PData.Bees[tonumber(Bee.Name)].Gifted == true then
		Magnitude = 11
	end
	BodyGyro.CFrame = CFrame.new(Bee.PrimaryPart.Position, Bee.Positioner.Position) * CFrame.Angles(0, math.rad(180), 0)
	WaitUntilReached(Bee,0.5)
	wait(0.5)
	local Bonus = math.round(p3.PData.Bees[tonumber(Bee.Name)].Level / 5)
	for count = 1, 5+Bonus do
		spawn(function()
		local Attach1 = Instance.new("Attachment")
		Attach1.Parent = Bee.PrimaryPart
		local Attach2 = Instance.new("Attachment")
		local Part = Instance.new("Part")
		Part.Parent = workspace
		Attach2.Parent = Part
		Part.Anchored = true
		Part.Size = Vector3.new(1,1,1)
		Part.CanCollide = false
		Part.Position = Bee.PrimaryPart.Position
		Part.Transparency = 1
		local Beam = Instance.new("Beam")
		Beam.Parent = Part
		Beam.Attachment0 = Attach2
		Beam.Attachment1 = Attach1
		Beam.FaceCamera = true
		Beam.Width0 = 0.3
		Beam.Width1 = 0.7
		Beam.Transparency = NumberSequence.new{
			NumberSequenceKeypoint.new(0,0),
			NumberSequenceKeypoint.new(1,0)
		}
		local Pos = GetRandomFlowerPosition(p3)
		Tween:Create(Part, TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = Pos}):Play()
		wait(0.05)
		BodyGyro.CFrame = CFrame.new(Bee.PrimaryPart.Position, Part.Position) * CFrame.Angles(0, math.rad(180), 0)
		wait(0.1)
		Attach1.Parent = Part
		local PollenFromPatch = math.round(7 * ((100 + (p3.PData.Bees[tonumber(Bee.Name)].Level * 10))/ 100))
		if PollenFromPatch > math.round(7 * ((100 + ((#BeesLevels.Levels + 1) * 10)) / 100)) then
			PollenFromPatch = math.round(7 * ((100 + ((#BeesLevels.Levels + 1) * 10))/ 100))
		end
		Tween:Create(Attach1, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {WorldPosition = Pos}):Play()
		local Position = Part.Position
			spawn(function()
				for i,v in pairs(workspace.Fields:FindFirstChild(Field):GetChildren()) do
					if (v.Position - Position).Magnitude <= 7 then
						FlowerRegister:CollectFlower(Player, p3.PData, v, v, {
							Color = "",
							Powers = 0.2,
							Pollen = PollenFromPatch,
						}, nil)
						local Particle = game.ReplicatedStorage.Effect.WhiteFlower:Clone()
						if string.find(v.Name, "Blue") then
							local BlueParticle = game.ReplicatedStorage.Effect.BlueFlower:Clone()
							BlueParticle.Parent = v
						end
						Particle.Parent = v
						Generator:UpdateFlower(v)
						spawn(function()
							wait(1)
							Particle.Enabled = false
							if v:FindFirstChild("BlueFlower") then
								v:FindFirstChild("BlueFlower").Enabled = false
							end
							wait(3)
							Particle:Destroy()
							if v:FindFirstChild("BlueFlower") then
								v:FindFirstChild("BlueFlower"):Destroy()
							end
						end)
					end
				end
			end)
		wait(0.25)
		Part:Destroy()
		Attach1:Destroy()
		end)
		wait(0.25)
	end
	wait(0.5)
	if Bee then
		Bee.Positioner.CollisionGroupId = 0
		end
		end
	end
end

return v1