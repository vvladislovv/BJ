local Bee = script.Parent
while true do
	if Bee.Body then
		if Bee:IsA("Model") then
			if Bee.Body then
				Bee.Body.BodyGyro.CFrame *= CFrame.Angles(0, 0, math.rad(-15))
				wait(0.2)
				if Bee.Body then
					Bee.Body.BodyGyro.CFrame *= CFrame.Angles(0, 0, math.rad(-15))
					wait(0.2)
					if Bee.Body then
						Bee.Body.BodyGyro.CFrame *= CFrame.Angles(0, 0, math.rad(15))
						wait(0.2)
						if Bee.Body then
							Bee.Body.BodyGyro.CFrame *= CFrame.Angles(0, 0, math.rad(15))
							wait(0.2)
						end
					end
				end
			end
		end
	end
end