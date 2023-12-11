
_G.chps = false

for _, v in pairs(script.Parent:GetChildren()) do
	if v:IsA("Frame") then
		v.Button.MouseButton1Click:Connect(function()
			if script.Parent.Parent:FindFirstChild(v.Name) then
				if not _G.chps then
					_G.chps = true
					script.Parent.Parent:FindFirstChild(v.Name):TweenPosition(UDim2.new(0,0,0,0), "Out", "Back", 0.2, true)
				end
			end
		end)
	end
end