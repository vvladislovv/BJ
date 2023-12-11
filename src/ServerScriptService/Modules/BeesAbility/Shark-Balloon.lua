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
	local Math = math.random(1,3)
	local Math2 = math.random(1,4)
	local X, Xz
	if Math2 == 1 then
		X = 20
		Xz = 20
	elseif Math2 == 2 then
		X = -20
		Xz = -20
	elseif Math2 == 3 then
		X = 20
		Xz = -20
	elseif Math2 == 4 then
		X = -20
		Xz = 20
	end
	spawn(function()
	local Rotation = true
	local Balloon = script["Shark"..Math]:Clone()
	local Character = game.Workspace:FindFirstChild(Player.Name)
	local Beam = script.Beam:Clone()
	Beam.Parent = Balloon
	Beam.Attachment0 = Character.PrimaryPart:FindFirstChild("RootRigAttachment")
	Balloon.Parent = game.Workspace.PlayerEffects
	Balloon:SetPrimaryPartCFrame(CFrame.new(Character.PrimaryPart.Position))
	local Attachment = Instance.new("Attachment")
	Attachment.Parent = Character.PrimaryPart
	local Position = Character.PrimaryPart.Position
	Attachment.WorldPosition = Position + Vector3.new(X,20,Xz)
	Beam.Attachment1 = Balloon.PrimaryPart:FindFirstChild("Center")
	Balloon.PrimaryPart.AlignPosition.Attachment1 = Attachment
	local Sploosh = script.Sploosh:Clone()
	Sploosh.Parent = Balloon.PrimaryPart
	local Summon = script.Summon:Clone()
	Summon.Parent = Balloon.PrimaryPart
	Summon:Play()
		
	spawn(function()
		while Balloon do wait()
			if Rotation == true and Balloon and Balloon.PrimaryPart then
				Balloon.PrimaryPart:FindFirstChild("BodyGyro").CFrame =  CFrame.lookAt(Balloon.PrimaryPart.Position, Character.PrimaryPart.Position) * CFrame.Angles(0, math.rad(180), 0)
			end
		end
	end)

	for count = 1,5 do
		wait(2)
		Rotation = false
		local Collecting = true
		wait(0.5)
		local Position = Character.PrimaryPart.Position
		Attachment.WorldPosition = Position + Vector3.new(0,15,0)
		Balloon.PrimaryPart.BodyGyro.CFrame =  CFrame.lookAt(Balloon.PrimaryPart.Position, Attachment.WorldPosition) * CFrame.Angles(0, math.rad(180), 0)
		wait(0.5)
		local Position = Character.PrimaryPart.Position
		Attachment.WorldPosition = Position - Vector3.new(0,65,0)
		Balloon.PrimaryPart.BodyGyro.CFrame =  CFrame.lookAt(Balloon.PrimaryPart.Position, Attachment.WorldPosition) * CFrame.Angles(0, math.rad(180), 0)
		local Flowers = {}
		Balloon.PrimaryPart.Touched:Connect(function(Hit)
		if Hit.Name == "Flower" and Collecting and not table.find(Flowers, Hit) then
			if not Sploosh.IsPlaying then
				Sploosh:Play()
			end
			table.insert(Flowers, Hit)
			FlowerRegister:CollectFlower(Player, p3.PData, Hit, Hit, {
				Color = "Blue",
				Powers = 0.5,
				Pollen = 54,
				}, nil)
			end
		end)
		wait(1)
		local Position = Character.PrimaryPart.Position
		Collecting = false
		Attachment.WorldPosition = Position + Vector3.new(X,20,Xz)
		Balloon.PrimaryPart.BodyGyro.CFrame =  CFrame.lookAt(Balloon.PrimaryPart.Position, Attachment.WorldPosition) * CFrame.Angles(0, math.rad(180), 0)
		Rotation = true
		end
		Attachment:Destroy()
		wait(1)
		Balloon:Destroy()
	end)
end


return v1