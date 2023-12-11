wait(3)
-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Tween = game:GetService("TweenService")

-- Modules
--local ClientUtilities = require(ReplicatedStorage.ClientUtilities)
local Utilities = require(ReplicatedStorage.Utilities)
local Items = require(ReplicatedStorage.Modules.Items)

local Modules = ReplicatedStorage.Modules

local Remotes = ReplicatedStorage.Remotes


-- Variables
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Data
--local Utils = require(ReplicatedStorage.Modules.Utils)

local Alerts = require(ReplicatedStorage.Modules.Alerts)

----------------------------------------------------------

----------------------------------------------------------

local Menu = script.Parent.Menu
local Item = Menu.ItemImage
local Functions = Menu.Functions

function GetItemIDs(Items)
	local T = {}
	for _, Item in pairs(Items) do
		T[Item.CraftIndex] = Item
	end
	return T
end

function GetItemIDs2(Items)
	local T = {}
	for name, amount in pairs(Items) do
		T[name] = amount
	end
	return T
end

local CountItems = 1

local function checkIngridients(Ingridients)
	local ingridientsCompleted = 0

	for name, amount in pairs(Ingridients) do
		if _G.PData.Inventory[name] >= amount * CountItems then
			ingridientsCompleted += 1
		end
	end

	return ingridientsCompleted
end

local Index = 1
local AvaibleItems = {}
local ChoosedItem = ""

for i, Item in pairs(Items.Eggs) do
	if Item.Crafting then
		AvaibleItems[i] = Item
	end
end

AvaibleItems = GetItemIDs(AvaibleItems)

Menu.Functions.Donate.MouseButton1Click:Connect(function()
	Remotes.Donate:FireServer("Basic Egg", 1)
	Alerts.Alert({
		Color = "Blue",
		Msg = "Donated"
	})
	script.Parent.Visible = false
end)
