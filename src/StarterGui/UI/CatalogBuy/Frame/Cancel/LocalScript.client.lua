local ItemsStatement = script.Parent.Parent.Parent
local ts = game:GetService("TweenService")
script.Parent.MouseButton1Click:Connect(function()
ItemsStatement.Visible = false
end)

script.Parent.MouseEnter:Connect(function()
	ts:Create(script.Parent, TweenInfo.new(0.2), {Rotation = 5}):Play()
	script.Parent:TweenSize(UDim2.new(0.29, 0, 0.237, 0), "Out", "Back", 0.2, true)
end)

script.Parent.MouseLeave:Connect(function()
	ts:Create(script.Parent, TweenInfo.new(0.2), {Rotation = 0}):Play()
	script.Parent:TweenSize(UDim2.new(0.265, 0, 0.212, 0), "Out", "Back", 0.2, true)
end)