local open = false
local debounce = true

script.Parent.MouseButton1Click:Connect(function()
	if open == false and debounce == true then
		open = true
		debounce = false
		script.Parent.Parent.Frame:TweenPosition(UDim2.new(-0.514, 0,0.174, 0), "Out", "Sine", 0.1)
		wait(0.01)
		debounce = true
	elseif open == true and debounce == true then
		open = false
		debounce = false
		script.Parent.Parent.Frame:TweenPosition(UDim2.new(-0.001,0,0.157,0), "Out", "Sine", 0.1)
		wait(0.01)
		debounce = true
	end
end)