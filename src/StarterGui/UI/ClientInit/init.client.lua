print("Place Version - "..game.PlaceVersion)
_G.Talking = false
_G.MarketUI = false
_G.JoinedMC = false
_G.OpenedShop = false
local Talking = _G.Talking
local Remotes = game.ReplicatedStorage.Remotes
-- Services

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
repeat _G.PData = Remotes.GetPlayerData:InvokeServer() until _G.PData
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)
--local Tween = game:GetService("TweenService")
-- Modules
local ClientUtilities = require(ReplicatedStorage.ClientUtilities)
local Utilities = require(ReplicatedStorage.Utilities)
local Items = require(ReplicatedStorage.Modules.Items)
require(game.ReplicatedStorage.Modules.InfoHover).Init()
-- Constants
local UI = script.Parent

local Qurst = require(script.Quests)

local UIScale = UI:WaitForChild("UIScale")

local HUD = UI.Metters

local ActionBar = UI.ActionBar

-- Variables
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Data
local Controls = require(script.Controls)
local Utils = require(ReplicatedStorage.Modules.Utils)

local SmallScreen = false
local Scale
local Action
local ActionParams = {}

local Action2
local ActionParams2 = {}

local HideKey = false

local OnHover
local Camera = workspace.Camera
local OpenedMenu = "None"
local TweenTime = 0.1
local OpenedShop = false
local Shop
local ShopItems
local List
local Index = 1
local ShopUI = UI.Shop
local LeftProd = ShopUI.Center.Prev
local RightProd = ShopUI.Center.Next

local Tabs = UI:WaitForChild("Tabs")
local Menu = UI:WaitForChild("Menu").List

