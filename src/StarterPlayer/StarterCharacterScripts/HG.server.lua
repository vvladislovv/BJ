 wait(0.1)

-- Services
local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")
local HRP = script.Parent.UpperTorso
local ts = game:GetService("TweenService")
local SSS = game:GetService("ServerScriptService")
-- Modules

-- Constants
local Character = script.Parent
local Client = game.Players:GetPlayerFromCharacter(Character)
local Items = require(game.ReplicatedStorage.Modules.Items)
local Data = require(game.ServerScriptService.Server.Data)
--local Equipment = require(game.ServerScriptService.Server.Equipment)
--local Utilities = require(game.ReplicatedStorage.Utilities)
local PData = Data:Get(Client)
local FlowerRegister = require(SSS:WaitForChild("Server").FlowerRegister)
local Remotes = game:GetService("ReplicatedStorage").Remotes

local Touched = false
local Flowers = {}

local function PlatformDist(Hive, HRP)
	if (HRP.Position - Hive.Position).Magnitude <= 10 then
		return true
	else
		return false
	end
end

HRP.Parent.RightUpperLeg.Touched:Connect(function(Flower)
	if Flower.Name == "Flower" and PData.Field ~= "" then
		if Character.Humanoid.MoveDirection.Magnitude > 0 and PData.AllStats["Movement Collection"] > 0 then
			if PData.IStats.Pollen < PData.IStats.Capacity then
				if not table.find(Flowers, Flower) and Touched == false then
					Touched = true
					table.insert(Flowers, Flower)
					FlowerRegister:CollectFlower(Client, PData, Flower, Character.PrimaryPart.Position)
					wait(0.025)
					table.clear(Flowers)
					Touched = false
				end
			end
		end
	end
end)

spawn(function()
	local PData = Data:Get(Client)
	while Character do wait(0.001)
		if PData.Vars.Making == true then
		if PData.Vars.Hive ~= "" then
		if PlatformDist(workspace.Hives[PData.Vars.Hive].Pad.Circle, Character.HumanoidRootPart) == false or PData.Vars.HP < 0 then
			if PData.Vars.Making then
				PData.Vars.Making = false
				game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Client, {"Vars", PData.Vars})
			end
			end
			end
		end
	end
end)

function AddStats(Item)
	local ItemStats = Items.Accessorys[Item].Buffs
	for i = 1, #ItemStats do
		if ItemStats[i][2] == "Percent" then
			PData.AllStats[ItemStats[i][1]] += ItemStats[i][3]
		end
	end
end

function RemoveStats(Item)
	local ItemStats = Items.Accessorys[Item].Buffs
	for i = 1, #ItemStats do
		if ItemStats[i][2] == "Percent" then
			PData.AllStats[ItemStats[i][1]] -= ItemStats[i][3]
		end
		wait(0.1)
		if i >= #ItemStats then
			return true
		end
	end
end

local ItemDeb = false

