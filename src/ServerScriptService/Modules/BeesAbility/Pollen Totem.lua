local v1 = {}
local SSS = game:GetService("ServerScriptService")
local Debris = game:GetService("Debris")
local Fields = require(SSS:WaitForChild("Server").GenerateFields)
local FlowerRegister = require(SSS:WaitForChild("Server").FlowerRegister)
local FlowerRegister = require(SSS:WaitForChild("Server").FlowerRegister)
local Remotes = game:GetService("ReplicatedStorage").Remotes
local Utils = require(game.ReplicatedStorage.Modules.Utils)
local TS = game:GetService("TweenService")
local GetStatsModule = require(SSS.Functions.GetRealStats)
local deb = false
local spawned = false

function CheckNearTotems(Player, Totem)
	for i,NearTotem in pairs(game.Workspace.PlayerEffects:FindFirstChild(Player.Name):GetChildren()) do
		if NearTotem.Name == "Totem" and NearTotem ~= Totem then
		if (Totem.PrimaryPart.Position - NearTotem.PrimaryPart.Position).Magnitude <= 22 then
			NearTotem:FindFirstChild("Ring"):FindFirstChild("SurfaceGui"):FindFirstChild("ImageLabel").ImageTransparency = 0
		else
			NearTotem:FindFirstChild("Ring"):FindFirstChild("SurfaceGui"):FindFirstChild("ImageLabel").ImageTransparency = 0.7
			end
		end
	end
end

function v1.Spawn(p3, Player)
	local Flower = workspace.Fields[p3.PData.Vars.Field]:GetChildren()[math.random(1,#workspace.Fields[p3.PData.Vars.Field]:GetChildren())]
	local Character = game.Workspace:FindFirstChild(Player.Name)
	local Totem = script.Totem:Clone()
	Totem.Parent = game.Workspace.PlayerEffects:FindFirstChild(Player.Name)
	local Ring = Totem:FindFirstChild("Ring")
	Ring.Size = Vector3.new(0,0,0)
	Totem:SetPrimaryPartCFrame(CFrame.new(Flower.Position - Vector3.new(0,10,0)) * CFrame.Angles(0,math.rad(math.random(-180,180)),math.rad(-90)))
	wait(0.3)
	Utils:TweenModel(Totem, Totem.PrimaryPart.CFrame + Vector3.new(0,12,0) , TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out))
	TS:Create(Ring, TweenInfo.new(2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Size = Vector3.new(0.1, 24, 24)}):Play()
	
	spawn(function()
		wait(25)
		Utils:TweenModel(Totem, Totem.PrimaryPart.CFrame + Vector3.new(0,-12,0) , TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out))
		wait(1)
		Totem:Destroy()
	end)
	
	local Zone = require(game.ServerScriptService.Zone)
	
	
	for _, Totem in pairs(game.Workspace.PlayerEffects:FindFirstChild(Player.Name):GetChildren()) do
		local Zone = Zone.new(Totem:FindFirstChild("Ring"))
		Zone.playerEntered:Connect(function(Player)
			Totem:FindFirstChild("Ring"):FindFirstChild("SurfaceGui"):FindFirstChild("ImageLabel").ImageTransparency = 0
			if game.Players:FindFirstChild(Player.Name) then
				if p3.PData.Vars["PTotem"] == false then
					p3.PData.Vars["PTotem"] = true
					Remotes.Boost:Fire(Player, Totem:FindFirstChild("BoostType").Value, 1)
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Vars", p3.PData.Vars})
				end
			end
		end)

		Zone.playerExited:Connect(function(Player)
			Totem:FindFirstChild("Ring"):FindFirstChild("SurfaceGui"):FindFirstChild("ImageLabel").ImageTransparency = 0.7
			if p3.PData.Vars["PTotem"] == true then
				p3.PData.Vars["PTotem"] = false
				p3.PData.Boosts["Pollen Mark"] = nil
				--if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Boosts", p3.PData.Boosts})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Vars", p3.PData.Vars})
				--end
			end
		end)
	end
	
end
return v1