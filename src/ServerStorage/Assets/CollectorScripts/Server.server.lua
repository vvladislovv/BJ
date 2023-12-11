local SSS = game:GetService("ServerScriptService")
local Debris = game:GetService("Debris")
local Fields = require(SSS:WaitForChild("Server").GenerateFields)
local FlowerRegister = require(SSS:WaitForChild("Server").FlowerRegister)
local Remotes = game.ReplicatedStorage.Remotes

local Tools = require(game.ReplicatedStorage:WaitForChild("Modules").Items).Collectors
local Stamps = game.ServerStorage:WaitForChild("Assets").Stamps
--local Notifycations = require(game.ReplicatedStorage:WaitForChild("AlertBoxes"))

local Data = require(SSS:WaitForChild("Server").Data)

local function GetRotation(Character)
	local Orientation
	local HOrient = Character.PrimaryPart.Orientation

	if HOrient.Magnitude >= 50 and HOrient.Magnitude < 110 then
		Orientation = CFrame.Angles(0, math.rad(90), 0)
	end

	if HOrient.Magnitude > -90 and HOrient.Magnitude < 90 then
		Orientation = CFrame.Angles(0, math.rad(-90), 0)
	end

	if HOrient.Magnitude > 0 and HOrient.Magnitude < 50 then
		Orientation = CFrame.Angles(0, math.rad(-180), 0)
	end

	if HOrient.Magnitude <= 110 and HOrient.Magnitude >= 180 then
		Orientation = CFrame.Angles(0, math.rad(0), 0)
	end

	if HOrient.Magnitude > 110 and HOrient.Magnitude < 180 then
		Orientation = CFrame.Angles(0, math.rad(0), 0)
	end

	return Orientation
end

function lookAt(target, eye)
	local forwardVector = (eye - target).Unit
	local upVector = Vector3.new(0, 1, 0)
	local rightVector = forwardVector:Cross(upVector)
	local upVector2 = rightVector:Cross(forwardVector)
	return CFrame.fromMatrix(eye, rightVector, upVector2)
end
local TotalClicks = 0
local Cooldowns = {}

script.Collect.OnServerEvent:Connect(function(Player, RootPart)
	local PData = Data:Get(Player)
	if PData.IStats.Pollen >= PData.IStats.Capacity then
		Remotes.AlertClient:FireClient(Player, {
			Color = "Red",
			Msg = "The backpack is full"
		})
	end
	local Character = RootPart.Parent
	local tool = script.Parent.Parent
	local moduletool = Tools[PData.Equipment.Tool]
	if PData.IStats.Pollen < PData.IStats.Capacity and not Cooldowns[Player.Name] then
		Cooldowns[Player.Name] = true

		local need = nil
		local scoop = false
		local collect = false
		local pos = Character:GetPrimaryPartCFrame().Position
		local ToolStamp = Stamps[moduletool.Stamp]:Clone()
		ToolStamp.Parent = tool
		ToolStamp.Name = "ToolStamp"
		ToolStamp:SetPrimaryPartCFrame(CFrame.new(pos))
		local hit = Instance.new("Part")
		hit.Name = "Hit"
		hit.Size = Vector3.new(0.1,0.1,0.1)
		hit.Anchored = false
		hit.CanCollide = false
		hit.Massless = true
		hit.Transparency = 0.5
		hit.Parent = tool
		hit.Position = pos
		
		hit.Touched:Connect(function(part)
			if part.Name == "Flower" then
				spawn(function()
				for _, Object in pairs(ToolStamp:GetChildren()) do
					Object.Anchored = false
				end
				ToolStamp:SetPrimaryPartCFrame(CFrame.new(part.Position) * GetRotation(Character))
				
				wait(0.1)
				
				for _, Object in pairs(ToolStamp:GetChildren()) do
					Object.Anchored = true
				end
				
				wait(0.1)
				pcall(function()
					ToolStamp:SetPrimaryPartCFrame(CFrame.new(RootPart.Position))
					end)
				end)
			end
		end)
		hit.Position = hit.Position + Vector3.new(0,-2.48,0)
		wait()
		hit:Destroy()
		if PData.Vars.Field ~= "" then
			TotalClicks += 1
		end
		--print(TotalClicks, moduletool.PassiveReq)
		if moduletool.Passive and TotalClicks >= moduletool.PassiveReq then
			spawn(function()
				if game.ReplicatedStorage.Boosts:FindFirstChild(moduletool.Passive) then
					Remotes.Boost:Fire(Player, moduletool.Passive, 1)
				else
					require(game.ServerScriptService.Modules.ToolPassives:FindFirstChild(moduletool.Passive))
				end
			end)
			TotalClicks = 0
		end
		local FoodAmount
		
		local Flowers = {}
		for _, Object in pairs(ToolStamp:GetChildren()) do
			if Object.Name ~= "Root" then
				Object.Touched:Connect(function(part)
					if part.Name == "Flower" and PData.Vars.Field ~= "" then
						if not table.find(Flowers, part) then
							table.insert(Flowers, part)
							FlowerRegister:CollectFlower(Player, PData, part, Character.PrimaryPart.Position, nil, nil, true)
						end
					end
				end)
			end
		end
		local weldhit = Instance.new("WeldConstraint", hit)
		weldhit.Part0 = RootPart
		weldhit.Part1 = hit
		wait()
		hit:Destroy()
		tool.ToolStamp:Destroy()
		wait(moduletool.Cooldown - 0.2)
		Cooldowns[Player.Name] = false
		end
	--end)
end)