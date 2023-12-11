wait(3)
local Boost = script.Parent
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local Tween = game:GetService("TweenService")
--local ySize = math.clamp(BoostTime / Boosts[Boost.Name].Time, 0, 1)
--script.Parent.Bar.Size = UDim2.new(1,0,ySize,0)
-- Modules
local ClientUtilities = require(ReplicatedStorage.ClientUtilities)
local Utilities = require(ReplicatedStorage.Utilities)
local Items = require(ReplicatedStorage.Modules.Items)
local Modules = ReplicatedStorage.Modules
-- Constants
local UI = script.Parent.Parent.Parent

local Remotes = ReplicatedStorage.Remotes
local Boosts = game.ReplicatedStorage.Boosts

local UIScale = UI:WaitForChild("UIScale")

-- Variables
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local HoverInfo = require(ReplicatedStorage.Modules.InfoHover)
local Data
local Utils = require(ReplicatedStorage.Modules.Utils)
Scale = UI.AbsoluteSize.Y / 1080 * 1.1
local CanUpdate = false
local HoverText = Items.Accessorys[script.Parent.Name].Desc


Boost.MouseEnter:Connect(function()
	HoverInfo:UpdateText(HoverText)
	CanUpdate = true
	HoverInfo:Move(UDim2.new(0, UserInputService:GetMouseLocation().X / Scale, 0, UserInputService:GetMouseLocation().Y / (Scale * 1.1)), Scale, Vector2.new(0,0.5))
end)
Boost.MouseLeave:Connect(function()
	CanUpdate = false
	HoverInfo:Remove()
end)
Boost.MouseMoved:Connect(function()
	HoverInfo:Move(UDim2.new(0, UserInputService:GetMouseLocation().X / Scale, 0, UserInputService:GetMouseLocation().Y / (Scale * 1.1)), Scale, Vector2.new(0,0.5))
end)
