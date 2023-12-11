wait(1)
local BeeMove = game.ReplicatedStorage.Assets.BeesAnimations:WaitForChild('Move')
local Bee = script.Parent.Model
coroutine.wrap(function()
	while true do
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
end)

local function WaitUntilReached(BeeModel, Magnitude)
	repeat wait() if not BeeModel.PrimaryPart then break end
	until (BeeModel.PrimaryPart.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7) --or PositionerDist(BeeModel.Positioner, HRP)
end

Bee.Humanoid:LoadAnimation(BeeMove):Play()

while true do
		if Bee:IsA("Model") then
			local NewPos = script.Parent.Poss[math.random(1,#script.Parent.Poss:GetChildren())]
			Bee.Body.BodyGyro.CFrame = CFrame.new(Bee.Body.Position, NewPos.Position) * CFrame.Angles(0, math.rad(180), 0)
			Bee.Positioner.Position = NewPos.Position
			WaitUntilReached(Bee, 0.5)
			Bee.Body.BodyGyro.CFrame = NewPos.CFrame * CFrame.Angles(0, math.rad(90), 0)
	end
	wait(math.random(1,4))
	end