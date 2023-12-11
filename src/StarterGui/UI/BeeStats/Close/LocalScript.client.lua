script.Parent.MouseButton1Click:Connect(function()
	script.Parent.Parent:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Back, 0.15, true)
	wait(0.15)
	script.Parent.Parent.Visible = false
end)