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

local function GetRandomFlower(p3)
	if p3.PData.Vars.Field ~= "" then
		local Field = workspace.Fields[p3.PData.Vars.Field]:GetChildren()
		local Flower = Field[math.random(1, #Field)]
		return Flower
	end
end

local Fields = {}

function v1.Spawn(p3, Player)
	if p3.PData.Vars.Field ~= "" then
		local Field = game.Workspace.FieldZones[p3.PData.Vars.Field]
		if not table.find(Fields, Field.Name) then
			table.insert(Fields, Field.Name)
			local Part = script.Part:Clone()
			Part.Parent = workspace
			Part.Name = "PollenBarrier"
			Part.Position = Field.Position + Vector3.new(0,6,0)
			Part.Size = Vector3.new(Field.Size.X, Part.Size.Y, Field.Size.Z)
			spawn(function()
				wait(180)
				Fields[Field.Name] = nil
			end)
		local Flowers = game.Workspace.Fields[p3.PData.Vars.Field]:GetChildren()
		for count = 1,30 do
			for b = 1,30 do
				spawn(function()
					local Flower = Flowers[math.random(1,#Flowers)]
					local Particle = game.ReplicatedStorage.Effect.WhiteFlower:Clone()
					Particle.Parent = Flower
					Generator:UpdateFlower(Flower)
					spawn(function()
						wait(1)
						Particle.Enabled = false
						wait(3)
						Particle:Destroy()
					end)
				end)
			end
			wait(1)
			end
			Part.Anchored = false
			wait(3)
			Part:Destroy()
		else
			require(game.ServerScriptService.Modules.BeesAbility["Threads"]).Spawn({
				PData = p3.PData,
				TokenPos = p3.TokenPos,
				Bee = p3.Bee,
				Tokens = p3.Tokens
			}, Player)
		end
	end
end


return v1