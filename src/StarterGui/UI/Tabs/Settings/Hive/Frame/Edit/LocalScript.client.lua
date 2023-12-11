local ts = game:GetService("TweenService")
local plr = game.Players.LocalPlayer
local rep = game.ReplicatedStorage
local rem = rep.Remotes
local modules = rep.Modules

local UI = script.Parent.Parent.Parent.Parent.Parent.Parent.Parent

local Utils = require(rep.Modules.Utils)

--{0.407, 0},{0.095, 0}
--{0.427, 0},{0.115, 0}
local bt = script.Parent

bt.MouseEnter:Connect(function()
	ts:Create(bt, TweenInfo.new(0.3), {Rotation = 3}):Play()
	bt:TweenSize(UDim2.new(0.427,0,0.115,0), "Out", "Elastic", 0.3, true)
end)

bt.MouseLeave:Connect(function()
	ts:Create(bt, TweenInfo.new(0.3), {Rotation = 0}):Play()
	bt:TweenSize(UDim2.new(0.407,0,0.095,0), "Out", "Elastic", 0.3, true)
end)

bt.MouseButton1Click:Connect(function()
	if _G.PData.Vars.Hive ~= "" then
		local Hive = workspace.Hives[_G.PData.Vars.Hive].Pilar
		Utils:TweenCam(nil, CFrame.new(Hive["1"].WorldPosition, Hive.Position - Vector3.new(0,10,0)))
		
		UI.Metters:TweenPosition(UDim2.new(0.5,0,1.5,0), "Out", "Elastic", 1, true)

		UI.Menu:TweenPosition(UDim2.new(0,0,0,-300), "Out", "Elastic", 1, true)
		UI.Menu2:TweenPosition(UDim2.new(1,0,0,-300), "Out", "Elastic", 1, true)

		UI.Tabs:TweenPosition(UDim2.new(0,10,0,-600), "Out", "Elastic", 1, true)
		UI.Tabs2:TweenPosition(UDim2.new(1,0,0,-600), "Out", "Elastic", 1, true)
		
		UI.AInv:TweenPosition(UDim2.new(0.1, 0, 0.515, 0), "Out", "Elastic", 1, true)
	end
end)