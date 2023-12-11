local ts = game:GetService("TweenService")

while wait(1) do
	ts:Create(script.Parent, TweenInfo.new(1), {BackgroundColor3 = Color3.fromRGB(255, 83, 83)}):Play()
	wait(1)
	ts:Create(script.Parent, TweenInfo.new(1), {BackgroundColor3 = Color3.fromRGB(255, 167, 67)}):Play()
	wait(1)
	ts:Create(script.Parent, TweenInfo.new(1), {BackgroundColor3 = Color3.fromRGB(255, 243, 75)}):Play()
	wait(1)
	ts:Create(script.Parent, TweenInfo.new(1), {BackgroundColor3 = Color3.fromRGB(70, 255, 85)}):Play()
	wait(1)
	ts:Create(script.Parent, TweenInfo.new(1), {BackgroundColor3 = Color3.fromRGB(94, 255, 237)}):Play()
	wait(1)
	ts:Create(script.Parent, TweenInfo.new(1), {BackgroundColor3 = Color3.fromRGB(89, 100, 255)}):Play()
	wait(1)
	ts:Create(script.Parent, TweenInfo.new(1), {BackgroundColor3 = Color3.fromRGB(172, 70, 255)}):Play()
end