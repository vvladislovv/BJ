
local ts = game:GetService("TweenService")
script.Parent.MouseButton1Click:Connect(function()
	script.Parent.Parent:TweenPosition(UDim2.new(0.5, 0, 2, 0), "Out", "Back", 0.2, true)
	script.Parent.Parent:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Back", 0.2, true)
end)

script.Parent.MouseEnter:Connect(function()
	ts:Create(script.Parent, TweenInfo.new(0.2), {Rotation = 5}):Play()
	script.Parent:TweenSize(UDim2.new(0.29, 0, 0.106, 0), "Out", "Back", 0.2, true)
end)

script.Parent.MouseLeave:Connect(function()
	ts:Create(script.Parent, TweenInfo.new(0.2), {Rotation = 0}):Play()
	script.Parent:TweenSize(UDim2.new(0.265, 0, 0.081, 0), "Out", "Back", 0.2, true)
end)