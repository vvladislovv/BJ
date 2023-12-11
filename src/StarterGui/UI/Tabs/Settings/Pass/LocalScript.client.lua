wait(5)
local UI = script.Parent.Parent.Parent.Parent
local HoverInfo = require(game.ReplicatedStorage.Modules.InfoHover)
local UserInputService = game:GetService("UserInputService")

local Utils = require(game.ReplicatedStorage.Modules.Utils)
local Module = require(game.ReplicatedStorage.Modules.Guis.Beespass)["Act 1"]
local items = require(game.ReplicatedStorage.Modules.Items).Eggs

--// Generate [Free] \\--

for _, Tier in pairs(Module.Free) do
	local T_UI = script.Type:Clone()

	T_UI.Icon.Image = items[Tier.Item].Image
	T_UI.Desc.Text = items[Tier.Item].Description
	T_UI.Item.Text = Tier.Item.." [x"..Tier.Am.."]"
	
	local x = math.clamp(_G.PData.Beespass["Act 1"]["Free"][_G.PData.Beespass["Act 1"].Level].Xp / Tier.Xp, 0, 1)
	T_UI.Bar.Fill.Size = UDim2.new(x,0,1,0)
	T_UI.Bar.Item.Text = (x*100).."%"
	
	T_UI.Name = Tier.Tier
	T_UI.Level.Text = "#"..Tier.Tier
	T_UI.Exp.Text = Utils:AbNumber(_G.PData.Beespass["Act 1"]["Free"][_G.PData.Beespass["Act 1"].Level].Xp).."/"..Utils:AbNumber(Tier.Xp).." XP"
	
	T_UI.Parent = script.Parent.Lvls
end
wait(3)
script.Parent.Lvls.CanvasSize = UDim2.new(0,0,0,script.Parent.Lvls:FindFirstChild("UIListLayout").AbsoluteContentSize.Y / (UI.AbsoluteSize.Y / 1080 * 1.075))