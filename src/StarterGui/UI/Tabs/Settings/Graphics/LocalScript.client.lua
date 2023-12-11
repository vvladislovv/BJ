wait(5)
local UI = script.Parent.Parent.Parent.Parent
local HoverInfo = require(game.ReplicatedStorage.Modules.InfoHover)
local UserInputService = game:GetService("UserInputService")
local CanUpdate = false
local mouse = game.Players.LocalPlayer:GetMouse()
Scale = UI.AbsoluteSize.Y / 1080 * 1.1

local sunrays = script.Parent.Frame.sunrays
local shadows = script.Parent.Frame.shadows
local br = script.Parent.Frame.bright
local brvalue = 1
local Player = game.Players.LocalPlayer
local PlayerGui = Player.PlayerGui.UI

sunrays.bt.MouseButton1Click:Connect(function()
	if sunrays.onoff.Text == "ON" then
		sunrays.onoff.Text = "OFF"
		sunrays.BackgroundColor3 = Color3.fromRGB(0,0,0)
		sunrays.onoff:TweenPosition(UDim2.new(0.05,0,0.5,0), "Out", "Linear", 0.15, true)
		game.Lighting.SunRays.Enabled = false
	elseif sunrays.onoff.Text == "OFF" then
		sunrays.onoff.Text = "ON"
		sunrays.BackgroundColor3 = Color3.fromRGB(81, 216, 57)
		sunrays.onoff:TweenPosition(UDim2.new(0.55,0,0.5,0), "Out", "Linear", 0.15, true)
		game.Lighting.SunRays.Enabled = true
	end
end)

shadows.bt.MouseButton1Click:Connect(function()
	if shadows.onoff.Text == "ON" then
		shadows.onoff.Text = "OFF"
		shadows.BackgroundColor3 = Color3.fromRGB(0,0,0)
		shadows.onoff:TweenPosition(UDim2.new(0.05,0,0.5,0), "Out", "Linear", 0.15, true)
		game.Lighting.GlobalShadows = false
	elseif shadows.onoff.Text == "OFF" then
		shadows.onoff.Text = "ON"
		shadows.BackgroundColor3 = Color3.fromRGB(81, 216, 57)
		shadows.onoff:TweenPosition(UDim2.new(0.55,0,0.5,0), "Out", "Linear", 0.15, true)
		game.Lighting.GlobalShadows = true
	end
end)

br.MouseWheelForward:Connect(function()
	if brvalue < 1 then
		brvalue += 0.05
	else
		brvalue = 1
	end
	br.FIll:TweenSize(UDim2.new(brvalue,0,1,0), "Out", "Back", 0.1, true)
	PlayerGui.Black.Transparency = brvalue
end)

br.ind.MouseButton1Click:Connect(function()
	if brvalue < 1 then
		brvalue += 0.05
	else
		brvalue = 1
	end
	br.FIll:TweenSize(UDim2.new(brvalue,0,1,0), "Out", "Back", 0.1, true)
	PlayerGui.Black.Transparency = brvalue
end)

br.MouseWheelBackward:Connect(function()
	if brvalue > 0.05 then
		brvalue -= 0.05
	else
		brvalue = 0.05
	end
	br.FIll:TweenSize(UDim2.new(brvalue,0,1,0), "Out", "Back", 0.1, true)
	PlayerGui.Black.Transparency = brvalue
end)

br.de.MouseButton1Click:Connect(function()
	if brvalue > 0.05 then
		brvalue -= 0.05
	else
		brvalue = 0.05
	end
	br.FIll:TweenSize(UDim2.new(brvalue,0,1,0), "Out", "Back", 0.1, true)
	PlayerGui.Black.Transparency = brvalue
end)