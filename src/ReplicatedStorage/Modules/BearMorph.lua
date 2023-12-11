local v1 = {}
local SSS = game:GetService("ServerScriptService")
local Debris = game:GetService("Debris")
local Fields = require(SSS:WaitForChild("Server").GenerateFields)
local FlowerRegister = require(SSS:WaitForChild("Server").FlowerRegister)
local FlowerRegister = require(SSS:WaitForChild("Server").FlowerRegister)

function v1.Spawn(p3, Bear, Player)
	local Player = Player.Character
	
	if Player:FindFirstChild("MorphFolder") then
		Player:FindFirstChild("MorphFolder"):Destroy()
	end

	local MorphFolder = Instance.new("Folder")
	MorphFolder.Name = "MorphFolder"
	MorphFolder.Parent = Player
	
	for _, v in pairs(Player:GetChildren()) do
		if v:IsA("Part") or v:IsA("MeshPart") then
			if v.Name ~= "HumanoidRootPart" then
				
				v.Transparency = 1
				
				local Part = script:FindFirstChild(Bear):FindFirstChild(v.Name):Clone()
				Part.Name = "Bear"..v.Name
				Part.Parent = MorphFolder
				Part.CFrame = v.CFrame
				Part.Anchored = false
				Part.Massless = true
				Part.CanCollide = false
				local Weld = Instance.new("WeldConstraint")
				Weld.Parent = Part
				Weld.Part0 = Part
				Weld.Part1 = v
			end
			
		elseif v:IsA("Accessory") and v.Name == "Hat" or v.Name == "Boot" then
			v.Parent = game.ReplicatedStorage
			spawn(function()
				wait(30)
				if Player and Player:FindFirstChild("Humanoid") then
					Player:FindFirstChild("Humanoid"):AddAccessory(v)
				end
			end)
		end
	end
	
	spawn(function()
		wait(30)
		MorphFolder:Destroy()
		
		for _,v in pairs(Player:GetChildren()) do
			if v:IsA("Part") or v:IsA("MeshPart") then
				if v.Name ~= "HumanoidRootPart" then
					v.Transparency = 0
				end
			end
		end
	end)
	
end

return v1