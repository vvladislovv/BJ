-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local TS = game:GetService("TweenService")

-- Modules
local FieldsModule = require(script.Parent.GenerateFields)
local FLModule = require(script.Parent.FlowerRegister)
local MFields = require(game.ServerScriptService.Server.GenerateFields)

-- Constants
local Items = require(game.ReplicatedStorage.Modules.Items)
--local Utils = require(game.ReplicatedStorage.Modules.Utils)
local Monsters = require(game.ReplicatedStorage.Mobs.MobsVariables)
local Hives = workspace.Hives
local BeesData = ReplicatedStorage.Bees
local Assets = ServerStorage.Assets
local Remotes = game:GetService("ReplicatedStorage").Remotes
local VisualEvent = game.ReplicatedStorage.Remotes:FindFirstChild("Visual")

local Fields = workspace.Fields

local BeeMove = game.ReplicatedStorage.Assets.BeesAnimations:WaitForChild('Move')

local function GetBeesFolder(PlayerName)
	if workspace.Bees:FindFirstChild(PlayerName) then
		return workspace.Bees:FindFirstChild(PlayerName)
	else
		local NewFolder = Instance.new("Folder")
		NewFolder.Name = PlayerName
		NewFolder.Parent = workspace.Bees
		return NewFolder
	end
end

local function PositionerDist(Positioner, HRP)
	if (HRP.Position - Positioner.Position).Magnitude <= 25 then
		return true
	else
		return false
	end
end

local function WaitUntilReached(BeeModel, Magnitude, HRP)
	if BeeModel and BeeModel.PrimaryPart then
		repeat wait() if not BeeModel.PrimaryPart then break end
		until (BeeModel.PrimaryPart.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7)
	else
		return
	end
end
local function WaitUntilMob(BeeModel, Magnitude, Mob)
	if BeeModel and BeeModel.PrimaryPart then
		repeat wait() if not BeeModel.PrimaryPart or not Mob then break end
		until (BeeModel.PrimaryPart.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7)
	else
		return
	end
end
local function WaitUntilFight(BeeModel, Magnitude, PData)
	if BeeModel and BeeModel.PrimaryPart then
		repeat wait() if not BeeModel.PrimaryPart or not PData.Vars.Attack then break end
		until (BeeModel.PrimaryPart.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7)
	else
		return
	end
end
local function WaitUntilNearMob(BeeModel, Magnitude, HRP)
	if BeeModel and BeeModel.PrimaryPart then
		repeat wait() if not BeeModel.PrimaryPart or not HRP.PrimaryPart or (BeeModel.PrimaryPart.Position - HRP.PrimaryPart.Position).Magnitude > Magnitude then break end
		until (BeeModel.PrimaryPart.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7)
	else
		return
	end
end
local function WaitUntilInField(BeeModel, Magnitude, HRP, PData)
	if BeeModel and BeeModel.PrimaryPart then
		repeat wait() if not BeeModel.PrimaryPart or PData.Vars.Field == "" then break end
		until (BeeModel.PrimaryPart.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7)
	else
		return
	end
end
local function WaitUntilHoneyMaking(BeeModel, Magnitude, HRP, PData)
	if BeeModel and BeeModel.PrimaryPart then
		repeat wait() if not BeeModel.PrimaryPart or PData.Vars.Making == false then break end
		until (BeeModel.PrimaryPart.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7)
	else
		return
	end
end

local function WaitUntilReached2(BeeModel, Magnitude, HRP, Character)
	if BeeModel and BeeModel.PrimaryPart then
		repeat wait() if not BeeModel.PrimaryPart or Character.Humanoid.MoveDirection.Magnitude > 0 or Character.Humanoid.Health <= 0 then break end
		until (BeeModel.PrimaryPart.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7)
	else
		return
	end
end

local function GetDist(Flower, BeeModel)
	if (BeeModel.PrimaryPart.Position - Flower.Position).Magnitude <= 20 then
		return true
	else
		return false
	end
end

local function PlatformDist(Hive, HRP)
	if (HRP.Position - Hive.Position).Magnitude <= 10 then
		return true
	else
		return false
	end
end

local function CreateBeam(Character, BeeModel)
	if BeeModel and Character then
	if not BeeModel:FindFirstChild("Beam") and BeeModel:FindFirstChild("Body") and BeeModel:FindFirstChild("Body"):FindFirstChild("Root") then
	local Root = BeeModel:FindFirstChild("Body"):FindFirstChild("Root")
			
	local NewBeam = Assets.Beam:Clone()
	NewBeam.Parent = BeeModel

	NewBeam.Attachment0 = Character.PrimaryPart:FindFirstChild("RootRigAttachment")
	NewBeam.Attachment1 = Root
	NewBeam.Enabled = false

	return NewBeam
		end
	end
end

local function HoneyRotation(BeeModel, Timer, PData, Character)
	if BeeModel and BeeModel:FindFirstChild("Body") then
		local BodyGyro = BeeModel:FindFirstChild("Body"):FindFirstChild("BodyGyro")
		local a = 0
		repeat
			wait(0.18)
			a += 0.18
			if not BeeModel or not BeeModel:FindFirstChild("Body") or PlatformDist(workspace.Hives[PData.Vars.Hive].Pad.Circle, Character.HumanoidRootPart) == false then break end
			BodyGyro.CFrame *= CFrame.Angles(0, 180, 0)
		until
		a >= Timer
	end
end

local function Rotation(BeeModel, Timer)
	if BeeModel and BeeModel:FindFirstChild("Body") then
	local BodyGyro = BeeModel:FindFirstChild("Body"):FindFirstChild("BodyGyro")
	local a = 0
	repeat
		wait(0.18)
		a += 0.18
		if not BeeModel or not BeeModel:FindFirstChild("Body") then break end
		BodyGyro.CFrame *= CFrame.Angles(0, 180, 0)
	until
	a >= Timer
	end
end

local function AttackRotation(BeeModel)
	for count = 1,4 do
		wait(0.18)
		if BeeModel and BeeModel:FindFirstChild("Body") then
			local BodyGyro = BeeModel:FindFirstChild("Body"):FindFirstChild("BodyGyro")
			BodyGyro.CFrame *= CFrame.Angles(-180, 0, 0)
		end
	end
end

local Data = require(game.ServerScriptService.Server.Data)
_G.Bees = {}
local BeeController = {}
BeeController.__index = BeeController

function BeeController.new(Player, Honeycomb, Bee, Gifted)
	local NewBee = {}
	local PData = Data:Get(Player)
	NewBee.PData = Data:Get(Player)
	NewBee.Player = Player
	NewBee.Character = Player.Character or Player.CharacterAdded:Wait()
	NewBee.Honeycomb = Honeycomb
	NewBee.TokenDebounce = false

	NewBee.FlyPos = Vector3.new(math.random(-10, 10), 1, math.random(-10, 10))
	NewBee.Animation = true
	--NewBee.Pause = false
	NewBee.Monster = nil
	
	local BeeName = Bee
	local BeeData = BeesData:WaitForChild(BeeName)

	if BeeData and require(BeeData) then
		local BeeModel
		NewBee.PBeeData = PData.Bees[tonumber(NewBee.Honeycomb.Name)]
		if Gifted then
			BeeModel = ReplicatedStorage.GiftedBees:FindFirstChild(Bee):Clone()
		else
			BeeModel = BeeData.Model:Clone()
		end
		if BeeModel ~= nil then
		BeeModel.Name = BeeName
		BeeModel.Parent = GetBeesFolder(Player.Name)

		BeeData = require(BeeData)

		BeeModel:SetPrimaryPartCFrame(Honeycomb.CFrame * CFrame.Angles(0,math.rad(90),0))
		local BeeSpeed = BeeData.Speed + NewBee.PBeeData.Properties.MoveX
		if PData.AllStats["Bee Movespeed"] < 100 then
			PData.AllStats["Bee Movespeed"] = 100
		end
		BeeModel.AlignPosition.MaxVelocity = (BeeSpeed * (PData.AllStats["Bee Movespeed"] / 100))
		BeeModel:FindFirstChild("Body").BodyGyro.D = 350
		NewBee.Model = BeeModel
		NewBee.Model.Name = Honeycomb.Name
		NewBee.BeeData = BeeData
		NewBee.PBeeData.Gifted = Gifted
		
		local LeftGui = ReplicatedStorage.Assets:FindFirstChild("Left"):Clone()
		LeftGui.Parent = NewBee.Model:FindFirstChild("L")
		local RightGui = ReplicatedStorage.Assets:FindFirstChild("Right"):Clone()
		RightGui.Parent = NewBee.Model:FindFirstChild("R")
		
		if NewBee.PBeeData.Level > 0 then
			LeftGui.TextLabel.Text = NewBee.PBeeData.Level
			RightGui.TextLabel.Text = NewBee.PBeeData.Level
		else
			LeftGui.TextLabel.Text = ""
			RightGui.TextLabel.Text = ""
			end
		end
	end

	setmetatable(NewBee, BeeController)
	return NewBee
end

local function RandomDropType(Info)
	local Data = Info
	local TotalWeight = 0

	for i,v in pairs(Data) do
		TotalWeight += v.Chance
	end
	local Chance = math.random(1, TotalWeight)
	local coun = 0
	for i,v in pairs(Data) do
		coun += v.Chance
		if coun >= Chance then
			return v
		end
	end
end

local function RandomDropTypePH(Folder)
	local TotalWeight = 0

	for i,v in pairs(Folder:GetChildren()) do
		if v.Name ~= "Honey" then
			TotalWeight += v.Chance.Value
		end
	end
	local Chance = math.random(1, TotalWeight)
	local coun = 0
	for i,v in pairs(Folder:GetChildren()) do
		if v.Name ~= "Honey" then
			coun += v.Chance.Value
			if coun >= Chance then
				return v
			end
		end
	end
end

function BeeController:SpawnToken()
	if self.BeeData.Tokens and self.TokenDebounce == false then
		if self.Model and self.Model:FindFirstChild("Body") then
			local Body = self.Model:FindFirstChild("Body")
			local Positioner = self.Model:FindFirstChild("Positioner")
			local BodyGyro = Body:FindFirstChild("BodyGyro")
			local Character = self.Character
			local Effect = ReplicatedStorage.Assets.Particles.BeeToken:Clone()
			local rand = math.random(1,100)
			
			local RandToken = self.BeeData.Tokens[math.random(1,#self.BeeData.Tokens)]
			if Items.Tokens[RandToken] then
		
				if self.PData.Vars.Field == "" and not self.PData.Vars.Attack then
					if rand <= Items.Tokens[RandToken].Chance and Items.Tokens[RandToken].Idle == true and not Items.Tokens[RandToken].Attack then
						Effect.Parent = Body
						self.Animation = false
						Rotation(self.Model,5)
						self.Animation = true
						wait(0.5)
						Effect:Destroy()
						if Character and self.Player then
							self.TokenDebounce = true
							local tknid = "Token:"..math.random(-99999999,99999999).."D:"..math.random(-99999999,99999999).."G:"..math.random(-99999999,99999999)
							Remotes.SpawnBeeToken:FireClient(self.Player,Body, {
								Pos = Body.Position + Vector3.new(0,1,0),
								Image = Items.Tokens[RandToken].Image,
								Time = Items.Tokens[RandToken].Time,
								TKColor = Items.Tokens[RandToken].TKColor,
								Player = self.Player,
								TokenType = RandToken,
								BeeInfo = self.PBeeData,
								Resourse = "",
								ColorT = Items.Tokens[RandToken].ColorT,
								ID = tknid,
								Type = Items.Tokens[RandToken].Type,
								Bee = tonumber(self.Model.Name),
							})
							self.PData.Vars.Tokens[tknid] = true
						end
						spawn(function()
							wait(Items.Tokens[RandToken].Debounce / (self.PData.AllStats["Ability Rate"] / 100))
							self.TokenDebounce = false
						end)
					end
				elseif self.PData.Vars.Field ~= "" and not self.PData.Vars.Attack then
					if rand <= Items.Tokens[RandToken].Chance and not Items.Tokens[RandToken].Attack then
						Effect.Parent = Body
						self.Animation = false
						Rotation(self.Model,5)
						self.Animation = true
						wait(0.5)
						Effect:Destroy()
						if Character and self.Player then
							self.TokenDebounce = true
							local tknid = "Token:"..math.random(-99999999,99999999).."D:"..math.random(-99999999,99999999).."G:"..math.random(-99999999,99999999)
							Remotes.SpawnBeeToken:FireClient(self.Player,Body, {
								Pos = Body.Position + Vector3.new(0,1,0),
								Image = Items.Tokens[RandToken].Image,
								Time = Items.Tokens[RandToken].Time,
								TKColor = Items.Tokens[RandToken].TKColor,
								Player = self.Player,
								TokenType = RandToken,
								BeeInfo = self.PBeeData,
								Resourse = "",
								ColorT = Items.Tokens[RandToken].ColorT,
								ID = tknid,
								Type = Items.Tokens[RandToken].Type,
								Bee = tonumber(self.Model.Name),
							})
							self.PData.Vars.Tokens[tknid] = true
						end
						spawn(function()
							wait(Items.Tokens[RandToken].Debounce / (self.PData.AllStats["Ability Rate"] / 100))
							self.TokenDebounce = false
						end)
					elseif rand > Items.Tokens[RandToken].Chance and not Items.Tokens[RandToken].Attack then
						local GiftRandom = math.random(1,100)
						if GiftRandom <= 1 then
							Effect.Parent = Body
							self.Animation = false
							Rotation(self.Model,5)
							self.Animation = true
							wait(0.5)
							Effect:Destroy()
							if Character and self.Player then
								local tknid = "Token:"..math.random(-99999999,99999999).."D:"..math.random(-99999999,99999999).."G:"..math.random(-99999999,99999999)
								Remotes.SpawnBeeToken:FireClient(self.Player,Body, {
									Pos = Body.Position + Vector3.new(0,1,0),
									Image = Items.Tokens["Star-Talent"].Image,
									Time = Items.Tokens["Star-Talent"].Time,
									TKColor = Items.Tokens["Star-Talent"].TKColor,
									Player = self.Player,
									TokenType = "Star-Talent",
									BeeInfo = self.PBeeData,
									Resourse = "",
									ColorT = Items.Tokens["Star-Talent"].ColorT,
									ID = tknid,
									Type = Items.Tokens["Star-Talent"].Type,
									Bee = tonumber(self.Model.Name),
								})
								self.PData.Vars.Tokens[tknid] = true
							end
						end
					end
				elseif self.PData.Vars.Attack then
					if rand <= Items.Tokens[RandToken].Chance and Items.Tokens[RandToken].Attack then
						Positioner.Position = Character.PrimaryPart.Position + Vector3.new(math.random(-7,7),0,math.random(-7,7))
						BodyGyro.CFrame = CFrame.new(Body.Position, Positioner.Position) * CFrame.Angles(0, math.rad(180), 0)
						WaitUntilFight(self.Model, 0.7, self.PData)
						if self.PData.Vars.Attack then
						Effect.Parent = Body
						self.Animation = false
						Rotation(self.Model,5)
						self.Animation = true
						wait(0.5)
						Effect:Destroy()
						if Character and self.Player then
							self.TokenDebounce = true
							local tknid = "Token:"..math.random(-99999999,99999999).."D:"..math.random(-99999999,99999999).."G:"..math.random(-99999999,99999999)
							Remotes.SpawnBeeToken:FireClient(self.Player,Body, {
								Pos = Body.Position + Vector3.new(0,1,0),
								Image = Items.Tokens[RandToken].Image,
								Time = Items.Tokens[RandToken].Time,
								TKColor = Items.Tokens[RandToken].TKColor,
								Player = self.Player,
								TokenType = RandToken,
								BeeInfo = self.PBeeData,
								Resourse = "",
								ColorT = Items.Tokens[RandToken].ColorT,
								ID = tknid,
								Type = Items.Tokens[RandToken].Type,
								Bee = tonumber(self.Model.Name),
							})
							self.PData.Vars.Tokens[tknid] = true
						end
						spawn(function()
							wait(Items.Tokens[RandToken].Debounce / (self.PData.AllStats["Ability Rate"] / 100))
							self.TokenDebounce = false
							end)
						end
					end
				end
			end
		end
	end
end

function BeeController:StartAttack(Monster, Attack, Crit)
	local NewPos = Monster.PrimaryPart.Position
	local PrimaryPart = Monster.PrimaryPart
	local Positioner = self.Model:FindFirstChild("Positioner")
	local Body = self.Model:FindFirstChild("Body")
	local BodyGyro = Body:FindFirstChild("BodyGyro")
	
	self:SpawnToken()
	Positioner.Position = NewPos
	BodyGyro.CFrame = CFrame.new(Body.Position, NewPos) * CFrame.Angles(0, math.rad(180), 0)
	
	if (Body.Position - NewPos).Magnitude <= 6 then
		if Monster:IsA("Model") then
			if Monster.PrimaryPart then
				NewPos = Monster.PrimaryPart.Position + Vector3.new(math.random(-5,5),math.random(5,10),math.random(-5,5))
				PrimaryPart = Monster.PrimaryPart
			end
		else
			NewPos = Monster.Position + Vector3.new(math.random(-5,5),math.random(5,10),math.random(-5,5))
			PrimaryPart = Monster
		end
		Positioner.Position = NewPos
		BodyGyro.CFrame = CFrame.new(Body.Position, NewPos) * CFrame.Angles(0, math.rad(180), 0)
		WaitUntilNearMob(self.Model, 0.3, Monster)
		BodyGyro.CFrame = CFrame.new(Body.Position, PrimaryPart.Position) * CFrame.Angles(0, math.rad(180), 0)

		if (Body.Position - PrimaryPart.Position).Magnitude <= 20 then
			if Monster:FindFirstChild("Configuration") then
				local HP = Monster:FindFirstChild("Configuration"):FindFirstChild("HP")
				local Level = Monster:FindFirstChild("Configuration").Level.Value
				if Level <= self.PBeeData.Level then
					AttackRotation(self.Model)
					BodyGyro.CFrame = CFrame.new(Body.Position, PrimaryPart.Position) * CFrame.Angles(0, math.rad(180), 0)
					HP.Value -= Attack
					VisualEvent:FireClient(self.Player, {Pos = PrimaryPart, Amount = Attack, Color = "Damage", Crit = Crit})
					--wait(0.5)
				else
					local random = math.random(0, Level * 3)
					if random <= self.PBeeData.Level then
						AttackRotation(self.Model)
						BodyGyro.CFrame = CFrame.new(Body.Position, PrimaryPart.Position) * CFrame.Angles(0, math.rad(180), 0)
						HP.Value -= Attack
						VisualEvent:FireClient(self.Player, {Pos = PrimaryPart, Amount = Attack, Color = "Damage", Crit = Crit})
						--wait(0.5)
					else
						AttackRotation(self.Model)
						BodyGyro.CFrame = CFrame.new(Body.Position, PrimaryPart.Position) * CFrame.Angles(0, math.rad(180), 0)
						VisualEvent:FireClient(self.Player, {Pos = PrimaryPart, Amount = 0, Color = "Damage", Crit = Crit})
						--wait(0.5)
					end
				end
			end
		end
	end
end

function BeeController:Attack(Player)
	if self.BeeData.Attack > 0 then
		local Attack = math.round(self.BeeData.Attack * (self.PData.AllStats["Attack"] / 100))
		Attack += self.PData.AllStats["Bee's Attack"]
		if self.BeeData.Color == "Colorless" then
			Attack += self.PData.AllStats["Colorless Bee's Attack"]
		elseif self.BeeData.Color == "Blue" then
			Attack += self.PData.AllStats["Blue Bee's Attack"]
		elseif self.BeeData.Color == "Red" then
			Attack += self.PData.AllStats["Red Bee's Attack"]
		end
		if self.PBeeData.Gifted == true then
			Attack = math.round(Attack * 1.5)
		end
		local Crit
		local CritRandom = math.random(1,100)
		if CritRandom <= self.PData.AllStats["Critical Chance"] then
			Crit = true
			Attack = math.round(Attack * (self.PData.AllStats["Critical Power"] / 100))
		end
		
		if workspace.PlayerMonsters:FindFirstChild(Player.Name) then
			local Folder = workspace.PlayerMonsters:FindFirstChild(Player.Name)
			if #game.Workspace.ServerMonsters:GetChildren() <= 0 then
				if #Folder:GetChildren() > 0 then
					if self.Monster == nil or self.Monster.Parent == nil then
						self.Monster = Folder:GetChildren()[math.random(1, #Folder:GetChildren())]
					end
					if self.Monster:IsA("Model") and self.Monster.PrimaryPart ~= nil then
						if (self.Character.PrimaryPart.Position - self.Monster.PrimaryPart.Position).Magnitude <= Monsters.Mobs[self.Monster.Name].Dist  then
							self:StartAttack(self.Monster, Attack, Crit)
						else
							local Body = self.Model:FindFirstChild("Body")
							local BodyGyro = Body:FindFirstChild("BodyGyro")
							local Positioner = self.Model:FindFirstChild("Positioner")
							Positioner.Position = self.Character.PrimaryPart.Position + Vector3.new(math.random(-15,15),0,math.random(-15,15))
							BodyGyro.CFrame = CFrame.new(Body.Position, Positioner.Position) * CFrame.Angles(0, math.rad(180), 0)
							if (self.Character.PrimaryPart.Position - self.Monster.PrimaryPart.Position).Magnitude > Monsters.Mobs[self.Monster.Name].Dist then
								wait(math.random(1,2.5))
							end
						end
					end
				end
			end
		end
	else
		local Body = self.Model:FindFirstChild("Body")
		local BodyGyro = Body:FindFirstChild("BodyGyro")
		local Positioner = self.Model:FindFirstChild("Positioner")
		Positioner.Position = self.Character.PrimaryPart.Position + Vector3.new(math.random(-15,15),0,math.random(-15,15))
		BodyGyro.CFrame = CFrame.new(Body.Position, Positioner.Position) * CFrame.Angles(0, math.rad(180), 0)
		if (Body.Position - self.Character.PrimaryPart.Position).Magnitude <= 40 then
			wait(math.random(1,2.5))
		end
	end
end

function BeeController:Animate()
	local humanoid = self.Model:FindFirstChild('Humanoid')
	local Body = self.Model:FindFirstChild("Body")
	if Body then
	local BodyGyro = Body:FindFirstChild("BodyGyro")
	local anim = humanoid:LoadAnimation(BeeMove)
	
	spawn(function()
		while self.Model do wait()
				if self.Animation == true then
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
				else
				if anim.IsPlaying then
					BodyGyro.CFrame = CFrame.Angles(0, 0, 0)
					anim:Stop()
				end
			end
		end
	end)
	end
end

function BeeController:MakeHoney(Player, Hive)
	if self.Model and self.Model:FindFirstChild("Body") and self.PData.IStats.Pollen > 0 then
		local Character = self.Character
		local Body = self.Model:FindFirstChild("Body")
		local Positioner = self.Model:FindFirstChild("Positioner")
		local BodyGyro = self.Model:FindFirstChild("Body"):FindFirstChild("BodyGyro")
		
		local Conversion
		if self.PData.AllStats["Total Converts"] < self.PData.IStats.Pollen and self.PData.Vars.Making then
			Conversion = math.round((self.BeeData.Converts + self.PData.AllStats["Convert Amount"] + ((self.BeeData.Converts / 4) * self.PBeeData.Level)) * (self.PData.AllStats["Convert Rate"] / 100))
			if self.PBeeData.Gifted == true then
				Conversion = math.round(Conversion * 1.5)
			end
		else
			Conversion = math.round(self.PData.IStats.Pollen)
		end
		
		local NewPos = Character.HumanoidRootPart.Position + self.FlyPos
		
		if Conversion > 0 and self.PData.IStats.Pollen > 0 then
			
			BodyGyro.CFrame = CFrame.new(Body.Position, Character.PrimaryPart.Position) * CFrame.Angles(0, math.rad(180), 0)
			Positioner.Position = Character.PrimaryPart.Position
			WaitUntilHoneyMaking(self.Model, 0.3, Character.PrimaryPart, self.PData)
			
			if Conversion < self.PData.IStats.Pollen and self.PData.Vars.Making then
				if self.PData.IStats.Pollen > 0 then
					
				local Beam = CreateBeam(Character, self.Model)
				BodyGyro.CFrame = CFrame.new(Body.Position, self.Honeycomb.Position) * CFrame.Angles(0, math.rad(180), 0)
				Positioner.Position = self.Honeycomb.Position
			
				--self.PBeeData.Energy -= 1
				self.PData.IStats.Pollen -= Conversion
				game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(self.Player, {"IStats", "Pollen", self.PData.IStats.Pollen})
				WaitUntilHoneyMaking(self.Model, 0.3, self.Honeycomb, self.PData)
			
					if self.PData.Vars.Making then
						self.Animation = false
					if Beam then
						Beam.Enabled = true
					end
					wait(0.5)
					if self.PData.Vars.Making then
					HoneyRotation(self.Model, 3, self.PData, self.Character)
					if self.PData.Vars.Making then
					self.Animation = true
					self.PData.IStats.Honey += Conversion
						self.PData.IStats.TotalHoney += Conversion
						self.PData.Badges["Honey"].Amount += math.round(Conversion)
						if Beam then
							Beam:Destroy()
						end
						game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(self.Player, {"Badges","Honey", self.PData.Badges["Honey"]})
						game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(self.Player, {"IStats", "TotalHoney", self.PData.IStats.TotalHoney})
						game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(self.Player, {"IStats", "Honey", self.PData.IStats.Honey})
								
						VisualEvent:FireClient(self.Player, {Pos = Character.PrimaryPart, Amount = Conversion, Color = "Honey"})
						self.Animation = true
						Positioner.Position = NewPos
						BodyGyro.CFrame = CFrame.new(Body.Position, NewPos) * CFrame.Angles(0, math.rad(180), 0)
						else
							if Beam then
								Beam:Destroy()
								end
								Positioner.Position = NewPos
								self.PData.IStats.Pollen += Conversion
								game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(self.Player, {"IStats", "Pollen", self.PData.IStats.Pollen})
								BodyGyro.CFrame = CFrame.new(Body.Position, NewPos) * CFrame.Angles(0, math.rad(180), 0)
								self.Animation = true
								--self:Animate()
							end
						else
						if Beam then
							Beam:Destroy()
						end
							Positioner.Position = NewPos
							self.PData.IStats.Pollen += Conversion
							game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(self.Player, {"IStats", "Pollen", self.PData.IStats.Pollen})
							BodyGyro.CFrame = CFrame.new(Body.Position, NewPos) * CFrame.Angles(0, math.rad(180), 0)
							self.Animation = true
						end
					else
						if Beam then
							Beam:Destroy()
						end
						Positioner.Position = NewPos
						self.PData.IStats.Pollen += Conversion
						game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(self.Player, {"IStats", "Pollen", self.PData.IStats.Pollen})
						BodyGyro.CFrame = CFrame.new(Body.Position, NewPos) * CFrame.Angles(0, math.rad(180), 0)
						self.Animation = true
					end
				end
			elseif Conversion >= self.PData.IStats.Pollen and self.PData.Vars.Making and self.PData.IStats.Pollen > 0 then
				local Beam = CreateBeam(Character, self.Model)
				local ConvertAmount = self.PData.IStats.Pollen
				BodyGyro.CFrame = CFrame.new(Body.Position, self.Honeycomb.Position) * CFrame.Angles(0, math.rad(180), 0)
				Positioner.Position = self.Honeycomb.Position

				--self.PBeeData.Energy -= 1
				self.PData.IStats.Pollen -= ConvertAmount
				game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(self.Player, {"IStats", "Pollen", self.PData.IStats.Pollen})
				WaitUntilHoneyMaking(self.Model, 0.3, self.Honeycomb, self.PData)

				if self.PData.Vars.Making then
					self.Animation = false
					if Beam then
						Beam.Enabled = true
					end
					wait(0.5)
					if self.PData.Vars.Making then
						Rotation(self.Model, 3)
						wait(0.5)
						self.PData.IStats.Honey += ConvertAmount
						self.PData.IStats.TotalHoney += ConvertAmount
						if Beam then
							Beam:Destroy()
						end

						game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(self.Player, {"IStats", "TotalHoney", self.PData.IStats.TotalHoney})
						game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(self.Player, {"IStats", "Honey", self.PData.IStats.Honey})

						self.Animation = true
						VisualEvent:FireClient(self.Player, {Pos = Character.PrimaryPart, Amount = Conversion, Color = "Honey"})
						self.Animation = true
						Positioner.Position = NewPos
						BodyGyro.CFrame = CFrame.new(Body.Position, NewPos) * CFrame.Angles(0, math.rad(180), 0)
						self.PData.Vars.Making = false
						
					else
						if Beam then
							Beam:Destroy()
						end
						Positioner.Position = NewPos
						self.PData.IStats.Pollen += ConvertAmount
						game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(self.Player, {"IStats", "Pollen", self.PData.IStats.Pollen})
						BodyGyro.CFrame = CFrame.new(Body.Position, NewPos) * CFrame.Angles(0, math.rad(180), 0)
						self.Animation = true
					end
				else
					if Beam then
						Beam:Destroy()
					end
					Positioner.Position = NewPos
					self.PData.IStats.Pollen += ConvertAmount
					game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(self.Player, {"IStats", "Pollen", self.PData.IStats.Pollen})
					BodyGyro.CFrame = CFrame.new(Body.Position, NewPos) * CFrame.Angles(0, math.rad(180), 0)
					self.Animation = true
				end
			end
		end
	end
end

function BeeController:CollectPollen()
	if self.Model and self.Model:FindFirstChild("Body") then
		local Body = self.Model:FindFirstChild("Body")
		local BodyGyro = self.Model:FindFirstChild("Body"):FindFirstChild("BodyGyro")
		local Positioner = self.Model:FindFirstChild("Positioner")
		local Field = Fields:FindFirstChild(self.PData.Vars.Field)
		local Character = self.Character
		
		if Field and Positioner.CollisionGroupId <= 0 then
			Field = Field:GetChildren()
			local Flower = Field[math.random(1, #Field)]
			local NewPos = Character.HumanoidRootPart.Position + self.FlyPos
			
			if GetDist(Flower, Character) == true and self.PData.Vars.Field ~= "" then
				Positioner.Position = Flower.Position + Vector3.new(0, 2, 0)
				BodyGyro.CFrame = CFrame.new(Body.Position, Positioner.Position) * CFrame.Angles(0, math.rad(180), 0)
				WaitUntilInField(self.Model, 0.3, Positioner, self.PData)
				
				if self.PData.Vars.Field ~= ""  then
					self:SpawnToken()
					BodyGyro.CFrame *= CFrame.Angles(math.rad(55), 0, 0)
					wait(self.BeeData.CollectTime)
					
					local Stamp = Assets.Stamps.BeeDummy:Clone()
					Stamp.Parent = self.Model
					Stamp.Position = Body.Position + Vector3.new(0,0.5,0)
					self.Animation = true
					
					Stamp.Touched:Connect(function(Part)
						if Part.Name == "Flower" and self.PData.Vars.Field ~= "" then
							Stamp.CanTouch = false
							Stamp:Destroy()
							FLModule:CollectFlower(self.Player, self.PData, Part, Part.Position, self.BeeData, self.PBeeData)
							--self.PBeeData.Energy -= 1
						end
					end)
				end
			end
		end
	end
end

function BeeController:Sleep()
	local Body = self.Model:FindFirstChild("Body")
	local BodyGyro = Body:FindFirstChild("BodyGyro")
	local Positioner = self.Model:FindFirstChild("Positioner")
	local Player = self.Player
	
	Positioner.Position = self.Honeycomb.Position
	BodyGyro.CFrame = CFrame.new(Body.Position, Positioner.Position) * CFrame.Angles(0, math.rad(180), 0)
	WaitUntilReached(self.Model, 0.1, self.Honeycomb)
	self.Animation = false
	BodyGyro.CFrame = CFrame.Angles(math.rad(math.random(-180,180)),math.rad(math.random(-180,180)),math.rad(math.random(-180,180)))
	self.Character = Player.CharacterAdded:Wait()
	
	local Time = math.round(self.PBeeData.ELimit / self.PBeeData.Energy)
	if Time > 10 then
		Time = 10
	end
	
	wait(6)
	if self.Character.Humanoid and self.Character.Humanoid.Health > 0 then
		self.Animation = true
		self.PBeeData.Energy = self.PBeeData.ELimit
	else
		self:Sleep()
	end
end

function BeeController:EnableAI()
	local Body = self.Model:FindFirstChild("Body")
	local BodyGyro = Body:FindFirstChild("BodyGyro")
	local Positioner = self.Model:FindFirstChild("Positioner")
	local Character = self.Character
	local Player = self.Player
		
	self:Animate()
		
	self.Character.Humanoid.Died:Connect(function()
		self:Sleep()
	end)
	
	spawn(function()
		while self.Model do wait()
			Character = Player.Character or Player.CharacterAdded:Wait()
			if self.Model and self.Model:FindFirstChild("Body") and self.Model:FindFirstChild("Positioner") and Character then
				if self.PBeeData.Energy > 0 and Character.Humanoid.Health > 0 and not self.PData.Vars.Attack and not self.PData.Vars.Making and self.PData.Vars.Field == "" or not self.PData.Vars.Attack and not self.PData.Vars.Making and self.PData.IStats.Pollen >= self.PData.IStats.Capacity or self.PData.Vars.Making and self.PData.IStats.Pollen <= 0 then
					if Positioner.CollisionGroupId <= 0 then
						local NewPos = Character.HumanoidRootPart.Position + self.FlyPos
						if Character.Humanoid.MoveDirection.Magnitude > 0 and Character.Humanoid.Health > 0 and Positioner then
							self.Animation = true
							Positioner.Position = NewPos
							BodyGyro.CFrame = CFrame.new(Body.Position, NewPos) * CFrame.Angles(0, math.rad(180), 0)
							elseif Character.Humanoid.MoveDirection.Magnitude <= 0 and Character.Humanoid.Health > 0 and Positioner then
							NewPos = Character.HumanoidRootPart.Position + Vector3.new(math.random(-15,15), 0, math.random(-15,15))
							self.Animation = true
							Positioner.Position = NewPos
							BodyGyro.CFrame = CFrame.new(Body.Position, NewPos) * CFrame.Angles(0, math.rad(180), 0)
							WaitUntilReached2(self.Model, 0.1, Character.PrimaryPart, Character)
							if (Body.Position - Positioner.Position).Magnitude <= 1 and Character.Humanoid.Health > 0 then
								BodyGyro.CFrame = Character.HumanoidRootPart.CFrame * CFrame.Angles(0, math.rad(180), 0)
							end
							if Character.Humanoid.MoveDirection.Magnitude <= 0 and Character.Humanoid.Health > 0 and self.PData.Vars.HP > 0 then
								wait(math.random(1.25,3))
								if not self.Model then break end
								self:SpawnToken()
							elseif Character.Humanoid.MoveDirection.Magnitude > 0 and Character.Humanoid.Health > 0 then
								wait(math.random(1,2.5))
								if not self.Model then break end
							end
						end
					end
				elseif self.PBeeData.Energy > 0 and Character.Humanoid.Health > 0 and self.PData.Vars.Attack and not self.PData.Vars.Making then
						self:Attack(self.Player)
				elseif self.PBeeData.Energy > 0 and Character.Humanoid.Health > 0 and not self.PData.Vars.Attack and self.PData.Vars.Field ~= "" and not self.PData.Vars.Making and self.PData.IStats.Pollen < self.PData.IStats.Capacity then
						self:CollectPollen()
				elseif self.PBeeData.Energy > 0 and Character.Humanoid.Health > 0 and not self.PData.Vars.Attack and self.PData.Vars.Making and self.PData.IStats.Pollen > 0 then
						self:MakeHoney()
				elseif self.PBeeData.Energy <= 0 or Character.Humanoid.Health <= 0 then
						self:Sleep()
					end
			else
					break
				end
			end
			self = nil
			return
	end)
	end

_G.Bees.new = function(Client, Comb, BeeN, Gifted)
	local Bee = BeeController.new(Client, Comb, BeeN, Gifted)
	Bee:EnableAI(Bee)
end

return BeeController
