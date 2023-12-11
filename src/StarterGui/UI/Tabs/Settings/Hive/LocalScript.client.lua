wait(5)
local UI = script.Parent.Parent.Parent.Parent
local HoverInfo = require(game.ReplicatedStorage.Modules.InfoHover)
local UserInputService = game:GetService("UserInputService")
local CanUpdate = false
Scale = UI.AbsoluteSize.Y / 1080 * 1.1

local Remotes = game.ReplicatedStorage.Remotes
local DUI = script.Parent.Design

for _, ColorT in pairs(DUI.Colors:GetChildren()) do
	ColorT.MouseButton1Click:Connect(function()
		Remotes.HiveCPCM:FireServer("Color", ColorT.Name)
	end)
end

for _, PColorT in pairs(DUI.PremiumColors:GetChildren()) do
	PColorT.MouseButton1Click:Connect(function()
		Remotes.HiveCPCM:FireServer("PColor", PColorT.Name)
	end)
end

for _, MaterialT in pairs(DUI.Materials:GetChildren()) do
	MaterialT.MouseButton1Click:Connect(function()
		Remotes.HiveCPCM:FireServer("Material", MaterialT.Name)
	end)
end