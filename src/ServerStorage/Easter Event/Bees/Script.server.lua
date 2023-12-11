wait(1)
local BeeMove = game.ReplicatedStorage.Assets.BeesAnimations:WaitForChild('Move')
coroutine.wrap(function()
	while true do
		for _, Bee in pairs(script.Parent:GetChildren()) do
			if Bee:IsA("Model") then
				Bee.Body.BodyGyro.CFrame *= CFrame.Angles(0, 0, math.rad(-15))
				wait(0.2)
				Bee.Body.BodyGyro.CFrame *= CFrame.Angles(0, 0, math.rad(-15))
				wait(0.2)
				Bee.Body.BodyGyro.CFrame *= CFrame.Angles(0, 0, math.rad(15))
				wait(0.2)
				Bee.Body.BodyGyro.CFrame *= CFrame.Angles(0, 0, math.rad(15))
				wait(0.2)
			end
		end
	end
end) ()
local function WaitUntilReached(BeeModel, Magnitude)
	repeat wait() if not BeeModel.PrimaryPart then break end
	until (BeeModel.PrimaryPart.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7) --or PositionerDist(BeeModel.Positioner, HRP)
end
for _, Bee in pairs(script.Parent:GetChildren()) do
	if Bee:IsA("Model") then
		Bee.Humanoid:LoadAnimation(BeeMove):Play()
	end
end
while true do
	for _, Bee in pairs(script.Parent:GetChildren()) do
		if Bee:IsA("Model") then
			local NewPos = script.Parent.Poss[math.random(1,#script.Parent.Poss:GetChildren())].Position
			Bee.Body.BodyGyro.CFrame = CFrame.new(Bee.Body.Position, NewPos) * CFrame.Angles(0, math.rad(180), 0)
			Bee.Positioner.Position = NewPos
			WaitUntilReached(Bee, 0.5)
			Bee.Body.BodyGyro.CFrame = script.Parent.Poss[1].CFrame * CFrame.Angles(0, math.rad(180), 0)
		end
	end
	wait(math.random(1,4))
end