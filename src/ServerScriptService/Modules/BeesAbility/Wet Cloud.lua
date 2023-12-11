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
		
		local Cloud = script.Cloud:Clone()
		local BeeData = p3.PData.Bees[p3.BeeName]
		local Field = workspace.FieldZones[p3.PData.Vars.LastField]
		local BeeModel = script.Bee:Clone()
		Cloud.Parent = workspace.PlayerEffects[Player.Name]
		BeeModel.Parent = workspace.PlayerEffects[Player.Name]
		BeeModel:SetPrimaryPartCFrame(Field.CFrame)
		BeeModel.Humanoid:LoadAnimation(BeeMove):Play()
		Cloud.Position = BeeModel.Positioner.Position + Vector3.new(0,50,0)
		Cloud.Orientation = Vector3.new(0,90,0)
		BeeModel.Positioner.Position += Vector3.new(0,20,0)
		BeeModel.Body.BodyGyro.CFrame = CFrame.new(BeeModel.Body.Position, BeeModel.Positioner.Position + Vector3.new(0,20,0)) * CFrame.Angles(0, math.rad(180), 0)
		--Remotes.SSound:FireClient(Player, "Whoosh", 1.7)
		ts:Create(Cloud, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = Vector3.new(73, 25, 49)}):Play()
		WaitUntilReached(BeeModel, 0.5)
		
		for i = 1,15 do
			local FB = script.First:Clone()
			local FieldS = workspace.Fields[p3.PData.Vars.LastField]
			local RandomFlower = FieldS:GetChildren()[math.random(1, #FieldS:GetChildren())]
			BeeModel.Body.BodyGyro.CFrame = CFrame.new(BeeModel.Body.Position, RandomFlower.Position) * CFrame.Angles(0, math.rad(180), 0)
			wait(0.05)
			FB.Parent = workspace.PlayerEffects[Player.Name]
			FB.Position = RandomFlower.Position + Vector3.new(0,math.random(40,50),0)
			FB.Anchored = false
			ts:Create(FB, TweenInfo.new(0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Size = Vector3.new(7.5,3.75,3.75)}):Play()
			wait(0.1)
			FB.CanTouch = true
			
			FB.Touched:Connect(function(part)
				if part == RandomFlower then
					FB.CanTouch = false
					FB.Anchored = true
					FB.Position = part.Position + Vector3.new(0,1,0)
					ts:Create(FB, TweenInfo.new(0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.In), {Size = Vector3.new(2, 7, 6)}):Play()
					local Effect = script.Effect:Clone()
					Effect.Parent = workspace.PlayerEffects[Player.Name]
					Effect.Position = FB.Position + Vector3.new(0,1,0)
					ts:Create(Effect, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = Vector3.new(14, 0.05, 14)}):Play()
					local Stamp = script.Stamp:Clone()
					Stamp.Parent = FB
					Stamp.Position = FB.Position
					Stamp.Anchored = false
					Stamp.Touched:Connect(function(flow)
						if flow.Name == "Flower" then
							FlowerRegister:CollectFlower(Player, p3.PData, flow, flow, {
								Color = "Red",
								Powers = 0.5,
								Pollen = 32,
							}, nil)
						end
						spawn(function()
						wait(0.3)
						FB.Anchored = false
						ts:Create(Effect, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = Vector3.new(0, 0, 0)}):Play()
						wait(0.6)
						Stamp:Destroy()
						FB:Destroy()
						Effect:Destroy()
						end)
					end)
					end
				end)
			end
		wait(1)
		--Remotes.SSound:FireClient(Player, "Whoosh", 1)
		ts:Create(Cloud, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = Vector3.new(0, 0, 0)}):Play()
		BeeModel.Positioner.Position += Vector3.new(0,-30,0)
		BeeModel.Body.BodyGyro.CFrame = CFrame.new(BeeModel.Body.Position, BeeModel.Positioner.Position + Vector3.new(0,20,0)) * CFrame.Angles(0, math.rad(180), 0)
		WaitUntilReached(BeeModel, 0.5)
		BeeModel:Destroy()
		Cloud:Destroy()
	end)()
end


return v1