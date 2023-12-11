local Lighting = game:GetService("Lighting")
local DayTime = 1080
local NightTime = 180
local Night = false
local SpawnPos = game.Workspace.Map:FindFirstChild("FireflySpawnPoint")
local Firefly = script.F
local BeeMove = game.ReplicatedStorage.Assets.BeesAnimations:WaitForChild('Move')
local TokensManager = require(game.ServerScriptService.Modules.TokensManager)
--local FireflyShop = game.ReplicatedStorage.FireflyShop
local TS = game:GetService("TweenService")
_G.NightTime = false
_G.NightReady = true

local module = {}

local function GetRandomField()
	local Fields = workspace.FieldZones:GetChildren()
	return Fields[math.random(1,#Fields)]
end

local function WaitUntilReached(BeeModel, Magnitude)
	if BeeModel and BeeModel:FindFirstChild("Body") then
		repeat wait() if not BeeModel or not BeeModel:FindFirstChild("Body") then break end
		until (BeeModel.Body.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7) --or PositionerDist(BeeModel.Positioner, HRP)
	else
		return
	end
end

local function Rotation(BeeModel, Timer)
	if BeeModel and BeeModel:FindFirstChild("Body") then
		local a = 0
		BeeModel.Body.BodyGyro.CFrame = CFrame.Angles(0,0,0)
		repeat
			wait(0.2)
			a = a + 0.2
			if not BeeModel or not BeeModel:FindFirstChild("Body") then break end
			if BeeModel and BeeModel:FindFirstChild("Body") then
				BeeModel:FindFirstChild("Body").BodyGyro.CFrame *= CFrame.Angles(0, 180, 0)
			end
		until
		a >= Timer
	end
end

function Check(Effect, Bee)
	if _G.NightTime == true then
	if Bee and Bee:FindFirstChild("Body") then
	local Chance = math.random(1,100)
	if Chance <= 25 then
		wait(0.5)
		if Bee and Bee:FindFirstChild("Body") and _G.NightTime == true then
		Effect.Enabled = true
		Rotation(Bee,5)
		if Bee and Bee:FindFirstChild("Body") and _G.NightTime == true then
		TokensManager.SpawnToken({
			Position = Bee.Body.Position,
			Cooldown = 15,
			Token = {
				Item = "Firefly Vial",
				Amount = 1,
				Type = "Drop",
			},
			Resourse = "Firefly",
		})
		wait(1)
		Effect.Enabled = false
			end
			end
		end
		end
	end
end

function module.SummonNight(Player)
	if _G.NightTime == false then
		_G.NightTime = true
		_G.NightReady = false
		spawn(function()
			--FireflyShop.Firefly.Parent = workspace.ShopsM
			--FireflyShop.Bee2.Parent = workspace
			if game.Workspace.Map.Decor:FindFirstChild("NightDoor") then
				game.Workspace.Map.Decor.NightDoor.Hand.Transparency = 1
				game.Workspace.Map.Decor.NightDoor.D.Transparency = 1
				game.Workspace.Map.Decor.NightDoor.D.CanCollide = false
				for i,v in pairs(game.Workspace.Map.Decor.NightDoor.D:GetChildren()) do
					if v:IsA("Texture") then
						v.Transparency = 1
					end
				end
				game.Workspace.Map.Decor.NightDoor.Month.Decal.Transparency = 1
				game.Workspace.Map.Decor.NightDoor.Month.Decal1.Transparency = 1
			end
		end)
		game.ReplicatedStorage.Remotes.SSound:FireAllClients("SummonNight", 1, true)
		if Player ~= nil then
			game.ReplicatedStorage.Remotes.AlertClient:FireAllClients({
				Color = "Night",
				Msg = "🌙"..Player.Name.." Caused the Night Time!🌙"
			})
		end
		spawn(function()
			wait(NightTime)
			spawn(function()
				local NightStart = TS:Create(Lighting, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {FogColor = Color3.fromRGB(53,53,53)}):Play()
				for count = 1,200 do
					wait(0.025)
					Lighting.ClockTime += 0.1
					Lighting.EnvironmentDiffuseScale += 0.01
					Lighting.FogEnd += 2
					Lighting.FogStart += 1
					if Lighting.ClockTime >= 12.2 then
						Lighting.FogEnd = 600
						Lighting.FogStart = 250
						Lighting.ClockTime = 12.5
						Lighting.EnvironmentDiffuseScale = 1
						_G.NightReady = true
						break
					end
				end
			end)
			wait(5)
			spawn(function()
				--FireflyShop.Firefly.Parent = game.ReplicatedStorage.FireflyShop
				--FireflyShop.Bee2.Parent = game.ReplicatedStorage.FireflyShop
				if game.Workspace.Map.Decor:FindFirstChild("NightDoor") then
					game.Workspace.Map.Decor.NightDoor.Hand.Transparency = 0
					game.Workspace.Map.Decor.NightDoor.D.Transparency = 0
					game.Workspace.Map.Decor.NightDoor.D.CanCollide = true
					for i,v in pairs(game.Workspace.Map.Decor.NightDoor.D:GetChildren()) do
						if v:IsA("Texture") then
							v.Transparency = 0.9
						end
					end
					game.Workspace.Map.Decor.NightDoor.Month.Decal.Transparency = 0
					game.Workspace.Map.Decor.NightDoor.Month.Decal1.Transparency = 0
				end
			end)
			_G.NightTime = false
		end)
		
		spawn(function()
			local NightStop = TS:Create(Lighting, TweenInfo.new(5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {FogColor = Color3.fromRGB(0,0,0)}):Play()
			for count = 1,200 do
				wait(0.025)
				Lighting.ClockTime -= 0.1
				Lighting.EnvironmentDiffuseScale -= 0.01
				Lighting.FogEnd -= 2
				Lighting.FogStart -= 1
				if Lighting.ClockTime <= 0.1 then
					Lighting.FogEnd = 350
					Lighting.FogStart = 130
					Lighting.ClockTime = 0
					Lighting.EnvironmentDiffuseScale = 0
					break
				end
			end
		end)
		wait(4)
		spawn(function()
			for count = 1,15 do
				wait(0.25)
				spawn(function()
				local Field = GetRandomField()
				local Flowers = workspace.Fields[Field.Name]:GetChildren()
				local Flower = Flowers[math.random(1,#Flowers)]
				local Flower2 = Flowers[math.random(1,#Flowers)]
				local Flower3 = Flowers[math.random(1,#Flowers)]
					
				local Bee = Firefly:Clone()
				Bee.Parent = workspace.Fireflies
				Bee:SetPrimaryPartCFrame(CFrame.new(SpawnPos.Position))
				Bee:FindFirstChild("Body"):FindFirstChild("Sound"):Play()
				Bee.Humanoid:LoadAnimation(BeeMove):Play()
				local Effect = game.ReplicatedStorage.Assets.Particles.BeeToken:Clone()
				Effect.Parent = Bee.Body
				Effect.Enabled = false
				
				local Collected1 = false
				local Collected2 = false
				local Collected3 = false
				local Appear = true
					
				spawn(function()
					wait(NightTime - (count / 4))
					Bee.Positioner.Position = SpawnPos.Position
					Bee.Body.BodyGyro.CFrame = CFrame.new(Bee.Body.Position, Bee.Positioner.Position) * CFrame.Angles(0, math.rad(180), 0)
					WaitUntilReached(Bee, 1)
					Bee:Destroy()
				end)
					
				if _G.NightTime == true then
				Bee.Positioner.Position = Flower.Position + Vector3.new(0,1.65,0)
				Bee.Body.BodyGyro.CFrame = CFrame.new(Bee.Body.Position, Bee.Positioner.Position) * CFrame.Angles(0, math.rad(180), 0)
				WaitUntilReached(Bee, 1)
				if _G.NightTime == true then
				Flower:GetPropertyChangedSignal("Position"):Connect(function()
					if Collected1 == false then
						Collected1 = true
						if _G.NightTime == true then
						Check(Effect, Bee)
						if _G.NightTime == true then
						Bee.Positioner.Position = Flower.Position + Vector3.new(0,25,0)
						Bee.Body.BodyGyro.CFrame = CFrame.new(Bee.Body.Position, Bee.Positioner.Position) * CFrame.Angles(0, math.rad(180), 0)
						wait(2.5)
						if _G.NightTime == true then
						Bee.Positioner.Position = Flower2.Position + Vector3.new(0,1.65,0)
						Bee.Body.BodyGyro.CFrame = CFrame.new(Bee.Body.Position, Bee.Positioner.Position) * CFrame.Angles(0, math.rad(180), 0)
						WaitUntilReached(Bee, 1)
						if _G.NightTime == true then
						Flower2:GetPropertyChangedSignal("Position"):Connect(function()
							if Collected1 == true and Collected2 == false then
								Collected2 = true
								if _G.NightTime == true then
								Check(Effect,Bee)
								if _G.NightTime == true then
								Bee.Positioner.Position = Flower2.Position + Vector3.new(0,25,0)
								Bee.Body.BodyGyro.CFrame = CFrame.new(Bee.Body.Position, Bee.Positioner.Position) * CFrame.Angles(0, math.rad(180), 0)
								wait(2.5)
								if _G.NightTime == true then
								Bee.Positioner.Position = Flower3.Position + Vector3.new(0,1.65,0)
								Bee.Body.BodyGyro.CFrame = CFrame.new(Bee.Body.Position, Bee.Positioner.Position) * CFrame.Angles(0, math.rad(180), 0)
								WaitUntilReached(Bee, 1)
								if _G.NightTime == true then
								Flower3:GetPropertyChangedSignal("Position"):Connect(function()
									if Collected2 == true and Collected3 == false then
										Collected3 = true
										if _G.NightTime == true then
										Check(Effect,Bee)
										if _G.NightTime == true then
										Bee.Positioner.Position = Flower3.Position + Vector3.new(0,25,0)
										Bee.Body.BodyGyro.CFrame = CFrame.new(Bee.Body.Position, Bee.Positioner.Position) * CFrame.Angles(0, math.rad(180), 0)
										wait(2.5)
										if _G.NightTime == true then
										Bee.Positioner.Position = SpawnPos.Position
										Bee.Body.BodyGyro.CFrame = CFrame.new(Bee.Body.Position, Bee.Positioner.Position) * CFrame.Angles(0, math.rad(180), 0)
										WaitUntilReached(Bee, 1)
										if Bee then
											Bee:Destroy()
										end
										end
										end
										end
										end
										end)
										end
										end
										end
										end
										end
										end)
										end
										end
										end
									end
								end
							end)
						end
					end
				end)
			end
		end)
	end
end

return module
