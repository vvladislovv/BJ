local v1 = {}
local SSS = game:GetService("ServerScriptService")
local Debris = game:GetService("Debris")
local MFields = require(SSS:WaitForChild("Server").GenerateFields)
local FlowerRegister = require(SSS:WaitForChild("Server").FlowerRegister)
local ts = game:GetService("TweenService")
local BeeMove = game.ReplicatedStorage.Assets.BeesAnimations:WaitForChild('Move')
local Remotes = game:GetService("ReplicatedStorage").Remotes
local Tween = game:GetService("TweenService")
local Utils = require(game.ReplicatedStorage.Modules.Utils)

local function WaitUntilReached(BeeModel, Magnitude)
	repeat wait() if not BeeModel.PrimaryPart then break end
	until (BeeModel.PrimaryPart.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7) --or PositionerDist(BeeModel.Positioner, HRP)
end


function v1.Spawn(p3, Player)
	coroutine.wrap(function()
		if p3.PData.Vars.Field ~= nil then
		if not workspace.FieldZones[p3.PData.Vars.Field]:FindFirstChild("Lamp") then
			local Model = script.Lamp:Clone()
			Model:SetPrimaryPartCFrame(CFrame.new(workspace.FieldZones[p3.PData.Vars.Field].Position - Vector3.new(0,30,0)))
			Model.Parent = workspace.FieldZones[p3.PData.Vars.Field]
			Utils:TweenModel(Model, Model.PrimaryPart.CFrame + Vector3.new(0,30,0) , TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out))
			local FieldModel = workspace.Fields[p3.PData.Vars.Field]
			local FieldInfo = MFields[p3.PData.Vars.Field]
			for i = 1,30 do
				if i < 30 then
					for _, Pollen in pairs(FieldModel:GetChildren()) do
						if Pollen:IsA("BasePart") then
							FieldInfo = MFields.Flowers[Pollen.FlowerID.Value]
							if Pollen.Position.Y <= FieldInfo.MinPosition then
								Pollen.Position = Vector3.new(Pollen.Position.X, FieldInfo.MinPosition, Pollen.Position.Z)
							end
							if Pollen.Position.Y < FieldInfo.MaxPosition then
								local DistanceToMax = tonumber(FieldInfo.MaxPosition - Pollen.Position.Y)
								Pollen.TopTexture.Transparency = (MFields.Flowers[Pollen.FlowerID.Value].MaxPosition-Pollen.Position.Y)/2.5

								if DistanceToMax < 0.45 then
									Pollen.Position += Vector3.new(0, DistanceToMax, 0)
								else
									Pollen.Position += Vector3.new(0, 0.45, 0)
								end
								if Pollen.Position.Y > FieldInfo.MaxPosition then
									Pollen.Position = Vector3.new(Pollen.Position.X, FieldInfo.MaxPosition, Pollen.Position.Z)
								end
							end
						end
					end
					wait(2)
				end
			end
			Utils:TweenModel(Model, Model.PrimaryPart.CFrame + Vector3.new(0,-30,0) , TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.In))
			wait(1)
			Model:Destroy()
			end
		end
	end)()
end


return v1