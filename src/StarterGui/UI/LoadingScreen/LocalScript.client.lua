local ts = game:GetService("TweenService")
local plr = game.Players.LocalPlayer
local ui = script.Parent
local now = ui.TextLabel
local char = plr.Character
local ps = plr.PlayerScripts

local sp = script.Parent.Speed
local rd = script.Parent.Rd

local Text

script.Parent.Visible = true

spawn(function()
	script.Parent.Background.BC.Size = UDim2.new(0,0,0,0)
	script.Parent.Background.BC.TXT.Size = UDim2.new(0,0,0,0)
	ts:Create(script.Parent.Background.BC, TweenInfo.new(2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Rotation = 0}):Play()
	script.Parent.Background.BC:TweenSize(UDim2.new(0.428,0,0.428,0), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 3)
	wait(0.5)
	script.Parent.Background.BC.TXT:TweenSize(UDim2.new(1,0,1,0), Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 1.5)
end)

Text = "Getting ready to loading"
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false)
game.StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.EmotesMenu, false)
local function Upd()
	local Pr = ui.Pr
	local bar = ui.Percent
	local fill = bar.Fill
	local am = math.clamp(rd.Value/100, 0, 1)
	fill:TweenSize(UDim2.new(am,0,1,0), "Out", "Linear", 0.35, true)
	Pr.Text = rd.Value.."%"
end
wait()
rd.Value += 10
Upd()

sp.Value = 30
Text = "Requesting Assets Manager"
repeat _G.RS = game:GetService("ReplicatedStorage") wait() until _G.RS
rd.Value += 10
Upd()

sp.Value = 15
Text = "Requesting Events"
repeat _G.Remotes = _G.RS:WaitForChild("Remotes") wait() until _G.Remotes
rd.Value += 5
Upd()

sp.Value = 10
Text = "Requesting Data Store"
repeat _G.PData = _G.Remotes.GetPlayerData:InvokeServer() wait(0.1) until _G.PData
rd.Value += 10 -- 65%
Upd()

sp.Value = 20
Text = "Init Hover Handler"
require(game.ReplicatedStorage.Modules.InfoHover).Init()
wait()
rd.Value += 10
Upd()

sp.Value = 5
Text = "Init Some Libraries"
--ps.Visual.Disabled = false
--ps.SoundRegions.Disabled = false
--ps.ClientFunctions.Disabled = false
ps.SpawnBeeToken.Disabled = false
wait()
rd.Value += 20
Upd()

sp.Value = 10
Text = "Init Sounds Handler"
require(game.ReplicatedStorage.Modules.InfoHover).Init()
wait()
rd.Value += 5
Upd()

sp.Value = 5
Text = "Init Sounds Handler"
_G.Remotes.SSound.OnClientEvent:Connect(function(Type, Speed, Play)
	if Play then
		script[Type].PlaybackSpeed = Speed
		script[Type]:Play()
	else
		script[Type]:Stop()
	end
end)

wait()
rd.Value += 5
Upd()

sp.Value = 5
Text = "Init Main Interface"
script.Parent.Parent.ActionScript.Disabled = false
wait()
rd.Value += 15
Upd()

sp.Value = 50
Text = "Stalling for time"
wait()
rd.Value += 10
Upd()

--wait(3)
script.Parent.Pr.UIStroke.Enabled = false
script.Parent.TextLabel.UIStroke.Enabled = false
script.Parent.Percent.UIStroke.Enabled = false
--require(script.Parent.Parent.Tabs.Settings.Amulets.List.Update).Update()
script.Parent.Background.BC:TweenPosition(UDim2.new(0.5,0,2,0), Enum.EasingDirection.In, Enum.EasingStyle.Back, 1)
wait(0.7)
ts:Create(script.Parent.Background, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
wait(1)
script.Parent.Visible = false