wait(5)
local plr = game.Players.LocalPlayer
local remote = game.ReplicatedStorage.GiftRemote
local items = require(game.ReplicatedStorage.Modules.Items)
local gift
local ts = game:GetService("TweenService")
local sc = script.Parent
local ui = script.Parent.Parent.Parent.Parent.Parent
local blur = game.Lighting.Blur

local function ef()
	blur.Enabled = true
	ui.RobuxShop.Visible = false
	ui.Boosts.Visible = false
	ui.Tabs.Visible = false
	ui.Menu.Visible = false
	ui.Metters.Visible = false
	ui.Pass.Visible = false
	
	local item = items.Eggs[gift[1]]
	ui.whatthe.Image = item.Image
	ui.whatthe.Visible = true
	ui.whatthe:TweenPosition(UDim2.new(0.5,0,0.45,0), "Out", "Elastic", 0.25, true)
	ui.whatthe:TweenSize(UDim2.new(0.167,0,0.34,0), "Out", "Back", 0.25, true)
	ts:Create(ui.whatthe, TweenInfo.new(0.25), {Rotation = -5}):Play()
	wait(0.25)
	ui.whatthe:TweenSize(UDim2.new(0.139,0,0.283,0), "Out", "Back", 0.25, true)
	wait(0.25)
	ui.whatthe:TweenSize(UDim2.new(0.167,0,0.34,0), "Out", "Back", 0.25, true)
	ts:Create(ui.whatthe, TweenInfo.new(0.25), {Rotation = 0}):Play()
	wait(0.25)
	ui.whatthe:TweenPosition(UDim2.new(0.5,0,2,0), "Out", "Back", 0.25, true)
	wait(0.25)
	
	blur.Enabled = false
	ui.RobuxShop.Visible = true
	ui.Boosts.Visible = true
	ui.Tabs.Visible = true
	ui.Menu.Visible = true
	ui.Metters.Visible = true
	ui.Pass.Visible = true
end

sc.Gift.MouseButton1Click:Connect(function()
	if gift[3] then
		ef()
		remote:FireServer()
	end
end)

game:GetService("RunService").RenderStepped:Connect(function()
	gift = _G.PData.IStats.ShopGift
	if gift[3] then
		local item = items.Eggs[gift[1]]
		sc.Visible = true
		sc.Gift.Image = item.Image
		sc.Am.Text = "x"..gift[2]
	else
		gift = nil
		sc.Visible = false
	end
end)