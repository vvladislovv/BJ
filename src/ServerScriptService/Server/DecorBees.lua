local BeeMove = game.ReplicatedStorage.Assets.BeesAnimations:WaitForChild('Move')

local module = {}

local function WaitUntilReached(BeeModel, Magnitude, HRP)
	if BeeModel and BeeModel.PrimaryPart then
		repeat wait() if not BeeModel.PrimaryPart then break end
		until (BeeModel.PrimaryPart.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7)
	else
		return
	end
end

local function Animate(Model)
	local humanoid = Model:FindFirstChild('Humanoid')
	local Body = Model:FindFirstChild("Body")
	if Body then
		local BodyGyro = Body:FindFirstChild("BodyGyro")
		local anim = humanoid:LoadAnimation(BeeMove)

		spawn(function()
			while Model do wait()
				if not anim.IsPlaying then
					anim:Play()
				end
				BodyGyro.CFrame *= CFrame.Angles(0, 0, math.rad(15))
				wait(0.2)
				BodyGyro.CFrame *= CFrame.Angles(0, 0, math.rad(-15))
				wait(0.2)
				BodyGyro.CFrame *= CFrame.Angles(0, 0, math.rad(-15))
				wait(0.2)
				BodyGyro.CFrame *=  CFrame.Angles(0, 0, math.rad(15))
				wait(0.2)
			end
		end)
	end
end

if #workspace.DecorBees:GetChildren() > 0 then
	for i,v in pairs(workspace.DecorBees:GetChildren()) do
		if #v:GetChildren() > 0 then
			if v:FindFirstChild("Center") then
				for d,b in pairs(v:GetChildren()) do
					if b:IsA("Model") and b:FindFirstChild("Humanoid") then
						spawn(function()
							Animate(b)
							while wait() do
								local NewPos = v:FindFirstChild("Center").Position + Vector3.new(math.random(-15,15),math.random(-15,15),math.random(-15,15))
								local Positioner = b:FindFirstChild("Positioner")
								local Body = b:FindFirstChild("Body")
								local BodyGyro = Body:FindFirstChild("BodyGyro")

								Positioner.Position = NewPos
								BodyGyro.CFrame = CFrame.new(Body.Position, NewPos) * CFrame.Angles(0, math.rad(180), 0)
								WaitUntilReached(b, 1)
								BodyGyro.CFrame = CFrame.new(Body.Position, v:FindFirstChild("Center").Position) * CFrame.Angles(0, math.rad(180), 0)
								wait(math.random(1,3))
							end
						end)
					end
				end
			end
		end
	end
end

return module
