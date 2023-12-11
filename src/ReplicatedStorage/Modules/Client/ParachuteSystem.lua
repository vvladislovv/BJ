local UIS = game:GetService("UserInputService")

local module = {}

function module.Start(Player)
	local Character = Player.Character or Player.CharacterAdded:Wait()
	local Humanoid = Character:WaitForChild("Humanoid")
	local gliding = false
	local opened = false
	
	Humanoid.StateChanged:Connect(function(oldstate, newState)
		local RootPart = Character:WaitForChild("HumanoidRootPart")
		if newState == Enum.HumanoidStateType.Freefall then
			if gliding == false then
				wait(0.2)
				gliding = true
			end
		else
			if gliding == true then
				gliding = false
				opened = false
				if RootPart:FindFirstChild("GliderVelocity") then
					RootPart:FindFirstChild("GliderVelocity"):Destroy()
				end
			end
		end
	end)

	local Gliders = {
		["Wings"] = {Speed = 30, Vel = -18},
		["Aero Wings"] = {Speed = 65, Vel = -15},
	}

	UIS.JumpRequest:Connect(function()
		if _G.PData.Equipment.Glider ~= "" then
			local RootPart = Character:FindFirstChild("HumanoidRootPart")
			if gliding == true and opened == false then
				opened = true
				if not RootPart:FindFirstChild("GliderVelocity") then
					local bodyVel = Instance.new("BodyVelocity")
					bodyVel.Name = "GliderVelocity"
					bodyVel.MaxForce = Vector3.new(100000, 100000, 100000)
					bodyVel.P = 1250
					bodyVel.Parent = RootPart
					game.ReplicatedStorage.Remotes.OpenGlider:FireServer(Humanoid, true)
					spawn(function()
						repeat
							wait(0.1)
							bodyVel.Velocity = RootPart.CFrame.lookVector * Gliders[_G.PData.Equipment.Glider].Speed + Vector3.new(0, Gliders[_G.PData.Equipment.Glider].Vel, 0)
						until
						gliding == false
						bodyVel:Destroy()
					end)
				else
					local bodyVel = RootPart:FindFirstChild("GliderVelocity")
					bodyVel.Name = "GliderVelocity"
					bodyVel.MaxForce = Vector3.new(100000, 100000, 100000)
					bodyVel.P = 1250
					bodyVel.Parent = RootPart
					game.ReplicatedStorage.Remotes.OpenGlider:FireServer(Humanoid, true)
					spawn(function()
						repeat
							wait(0.1)
							bodyVel.Velocity = RootPart.CFrame.lookVector * Gliders[_G.PData.Equipment.Glider].Speed + Vector3.new(0, Gliders[_G.PData.Equipment.Glider].Vel, 0)
						until
						gliding == false
						bodyVel:Destroy()
					end)
				end
			else
				game.ReplicatedStorage.Remotes.OpenGlider:FireServer(Humanoid, false)
				if RootPart:FindFirstChild("GliderVelocity") then
					RootPart:FindFirstChild("GliderVelocity"):Destroy()
				end
				opened = false
			end
		end
	end)
end

return module
