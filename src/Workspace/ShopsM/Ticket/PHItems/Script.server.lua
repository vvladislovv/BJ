while true do
	for _, Bee in pairs(script.Parent:GetChildren()) do
		if Bee:IsA("Model") then
			if Bee:FindFirstChild("Body") then
				if Bee.Body:FindFirstChild("BodyGyro") then
					Bee.Body:FindFirstChild("BodyGyro").CFrame *= CFrame.Angles(0, math.rad(5), 0)
				end
			end
		end
	end
	wait(0.01)
end