local v1 = {}
local SSS = game:GetService("ServerScriptService")
local Debris = game:GetService("Debris")
local Fields = require(SSS:WaitForChild("Server").GenerateFields)
local FlowerRegister = require(SSS:WaitForChild("Server").FlowerRegister)
local ts = game:GetService("TweenService")
local BeeMove = game.ReplicatedStorage.Assets.BeesAnimations:WaitForChild('Move')
local Remotes = game:GetService("ReplicatedStorage").Remotes


local function WaitUntilReached(BeeModel, Magnitude)
	repeat wait() if not BeeModel.PrimaryPart then break end
	until (BeeModel.PrimaryPart.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7) --or PositionerDist(BeeModel.Positioner, HRP)
end
function v1.Spawn(p3, Player)
	coroutine.wrap(function()
		if p3.PData.Vars.LastField ~= "" then
		local BeeData = p3.PData.Bees[p3.BeeName]
		local Field = workspace.FieldZones[p3.PData.Vars.LastField]
		
		local BeeModel = script.Bee:Clone()
		local FieldS = workspace.Fields[p3.PData.Vars.LastField]
		local RandomFlower = FieldS:GetChildren()[math.random(1, #FieldS:GetChildren())]
		BeeModel.Parent = workspace.PlayerEffects[Player.Name]
		BeeModel:SetPrimaryPartCFrame(RandomFlower.CFrame)
		BeeModel.Humanoid:LoadAnimation(BeeMove):Play()
		--Remotes.SSound:FireClient(Player, "Whoosh", 1.7)
		WaitUntilReached(BeeModel, 0.5)
		spawn(function()
			BeeModel.Body.Touched:Connect(function(part)
				if part.Name == "Flower" then
					FlowerRegister:CollectFlower(Player, p3.PData, part, part, {
						Color = "Blue",
						Powers = 0.5,
						Pollen = 20,
					}, nil)
				end
			end)
		end)
		for i = 1, 15 do
			local RandomFlower = FieldS:GetChildren()[math.random(1, #FieldS:GetChildren())]
			if BeeModel then
			if BeeModel:FindFirstChild("Body") and BeeModel:FindFirstChild("Positioner") then
			local Body = BeeModel:FindFirstChild("Body")
			local Positioner = BeeModel:FindFirstChild("Positioner")
			local BodyGyro = BeeModel:FindFirstChild("Body"):FindFirstChild("BodyGyro")
			BodyGyro.CFrame = CFrame.new(Body.Position, RandomFlower.Position) * CFrame.Angles(math.rad(10), math.rad(180), 0)
			Positioner.Position = RandomFlower.Position + Vector3.new(0,1,0)
			BodyGyro.CFrame = CFrame.new(Body.Position, Positioner.Position + Vector3.new(0,-10,0)) * CFrame.Angles(0, math.rad(180), 0)
			WaitUntilReached(BeeModel, 0.5)
			if i >= 15 then
				Positioner.Position -= Vector3.new(35,35,0)
				BodyGyro.CFrame = CFrame.new(Body.Position, Positioner.Position - Vector3.new(0,35,0)) * CFrame.Angles(0, math.rad(180), 0)
				wait(1)
				BeeModel:Destroy()
				end
				end
			end
			end
			end
	end) ()
end

return v1