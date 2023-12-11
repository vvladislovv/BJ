local Zone = require(game.ServerScriptService.Zone)
local Data = require(game.ServerScriptService.Server.Data)
local MobsVariables = require(game.ReplicatedStorage.Mobs.MobsVariables)
local BeeMove = game.ReplicatedStorage.Assets.BeesAnimations:WaitForChild('Move')
local Remotes = game.ReplicatedStorage.Remotes
--local Amulets = require(game.ServerScriptService.Modules.Amulets)
local AmuletsModule = require(game.ReplicatedStorage.Modules.AmuletsModule)
local Amulets = require(game.ServerScriptService.Modules.Amulets)

local module = {}

local function WaitUntilReached(BeeModel, Magnitude)
	if BeeModel and BeeModel:FindFirstChild("Body") then
		repeat wait() if not BeeModel or not BeeModel:FindFirstChild("Body") or not BeeModel:FindFirstChild("Positioner") then break end
		until (BeeModel.Body.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7)
	else
		return
	end
end

function Animate(Mob)
	if Mob.Name ~= "Silkworm" then
		spawn(function()
			local humanoid = Mob:FindFirstChild('Humanoid')
			local Body = Mob:FindFirstChild("Body")
			if Body then
				local BodyGyro = Body:FindFirstChild("BodyGyro")
				local anim = humanoid:LoadAnimation(BeeMove)
				anim:Play()
				spawn(function()
					while Mob do wait()
						if Mob then
							wait(0.2)
							BodyGyro.CFrame *= CFrame.Angles(0, 0, math.rad(-15))
							wait(0.2)
							BodyGyro.CFrame *= CFrame.Angles(0, 0, math.rad(-15))
							wait(0.2)
							BodyGyro.CFrame *= CFrame.Angles(0, 0, math.rad(15))
							wait(0.2)
							BodyGyro.CFrame *=  CFrame.Angles(0, 0, math.rad(15))
						else
							break
						end
					end
				end)
			end
		end)
	elseif Mob.Name == "Silkworm" then
		spawn(function()
			local humanoid = Mob:FindFirstChild('Humanoid')
			local Body = Mob:FindFirstChild("Body")
			if Body then
				local BodyGyro = Body:FindFirstChild("BodyGyro")
				local anim = humanoid:LoadAnimation(Mob:FindFirstChild("Animation"))
				anim:Play()
				spawn(function()
					while Mob do wait()
						if Mob then
							wait(0.5)
							BodyGyro.CFrame *= CFrame.Angles(math.rad(-15), math.rad(-15), math.rad(-15))
							wait(0.5)
							BodyGyro.CFrame *= CFrame.Angles(math.rad(-15), math.rad(-15), math.rad(-15))
							wait(0.5)
							BodyGyro.CFrame *= CFrame.Angles(math.rad(15), math.rad(15), math.rad(15))
							wait(0.5)
							BodyGyro.CFrame *=  CFrame.Angles(math.rad(15), math.rad(15), math.rad(15))
						else
							break
						end
					end
				end)
			end
		end)
	end
end

function RotationToPlayer(Mob, Rotation, Player)
	spawn(function()
		while Mob do
			wait(0.1)
			if Rotation then
				if game.Workspace:FindFirstChild(Player.Name) then
					local Character = game.Workspace:FindFirstChild(Player.Name)
					if Mob and Mob:FindFirstChild("Body") then
						Mob:FindFirstChild("Body").BodyGyro.CFrame = CFrame.new(Mob.Body.Position, Character.PrimaryPart.Position) * CFrame.Angles(0, math.rad(180), 0)
					else
						break
					end
				else
					Mob:Destroy()
					break
				end
			end
		end
	end)
end

function module.GetRewards(Mob, Player, Field)
	local PData = Data:Get(Player)
	PData.Cooldowns2[Field] = {Time = MobsVariables.Mobs[Mob.Name].Cooldown + os.time()}
	game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Player, {"Cooldowns2", PData.Cooldowns2})
	PData.Vars.Attack = false
	game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Player, {"Vars", PData.Vars})
	if Mob.Name == "Frog" then
		PData.IStats.FrogKills += 1
		game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
	elseif Mob.Name == "MolyCricket" then
		PData.IStats.MolyCricketKills += 1
		game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
	end
	for i,v in pairs(AmuletsModule.Amulets) do
		if string.find(i, Mob.Name) then
			if PData.IStats[Mob.Name.."Kills"] then
				print("AA")
			else
				warn("LASFPKADLGK:LAKGLADK:GADLGLKALDGKAD:LGKLADK:GKL")
			end
		end
	end
	for i,v in pairs(MobsVariables.Mobs[Mob.Name].Loot) do
		if i ~= "Battle Points" then
			local Chance = math.random(1,1000)
			if Chance <= v.Chance then
				local Amount 
				if type(v.Amount) == "table" then
					Amount = math.random(1, #v.Amount)
				else
					Amount = v.Amount + math.random(1,v.Amount)
				end
				PData[v.Type][i] += Amount
				game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Player, {v.Type, PData[v.Type]})
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..Amount.." "..i.." (from "..Mob.Name..")"
				})
			end
		else
			PData.Badges.Battle.Amount += v.Amount
			Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "+"..v.Amount.." Battle Points (from "..Mob.Name..")"
			})
		end
	end
end

function UpdateGui(Mob, Configuration, Player, Field)
	Configuration.HP.Changed:Connect(function(Health)
		if Mob and Mob.PrimaryPart then
			Mob.PrimaryPart:FindFirstChild("BG").Bar.TextLabel.Text = "HP:"..Health
			Mob.PrimaryPart:FindFirstChild("BG").Bar.FB.Size = UDim2.new(Configuration.HP.Value / Configuration.MaxHP.Value,0,1,0)
			
			if Health <= 0 then
				local PData = Data:Get(Player)
				if PData.Vars.Attack then
					PData.Vars.Attack = false
					module.GetRewards(Mob, Player, Field.Name)
					
					Mob:FindFirstChild("Positioner"):Destroy()
					if Mob.PrimaryPart then
						Mob.PrimaryPart:FindFirstChild("BG").Enabled = false
					end
					wait(1)
					Mob:Destroy()
				end
			end
		end
	end)
end

function module.AttackLikeBee(Mob, Rotation, Player, Field, Attack)
	
	Animate(Mob)
	RotationToPlayer(Mob, Rotation,Player)

	spawn(function()
		while Mob do
			if Mob and Mob:FindFirstChild("Positioner") then
				if game.Workspace:FindFirstChild(Player.Name) then
					local Character = game.Workspace:FindFirstChild(Player.Name)
					local Positioner = Mob:FindFirstChild("Positioner")
					local Flowers = workspace.Fields[Field.Name]:GetChildren()
					local Flower = Flowers[math.random(1,#Flowers)]
					local PData = Data:Get(Player)

					spawn(function()
						local MaxSpeed = MobsVariables.Mobs[Mob.Name].Speed + math.random(-5,15)
						Mob:FindFirstChild("AlignPosition").MaxVelocity = 0
						repeat
							if Attack == false and Mob:FindFirstChild("AlignPosition") then
								Mob:FindFirstChild("AlignPosition").MaxVelocity += 2
								wait(0.05)
							else
								break
							end
						until
						Mob:FindFirstChild("AlignPosition").MaxVelocity >= MaxSpeed
						if Attack == false then
							Mob:FindFirstChild("AlignPosition").MaxVelocity = MaxSpeed
						end
					end)

					Mob:FindFirstChild("AlignPosition").MaxVelocity = MobsVariables.Mobs[Mob.Name].Speed + math.random(-5,15)
					Positioner.Position = Flower.Position + Vector3.new(0,math.random(10,20),0)
					WaitUntilReached(Mob, 1)
					wait(math.random(0.1,1.5))
					local A = math.random(1,100)
					if A <= 33 then
						spawn(function()
							Attack = true
							if Mob and Mob:FindFirstChild("AlignPosition") then
								Mob:FindFirstChild("AlignPosition").MaxVelocity = 0
								Rotation = false
								repeat
									if Mob and Mob:FindFirstChild("AlignPosition") then
										Mob:FindFirstChild("AlignPosition").MaxVelocity += 4
										wait(0.05)
									else
										break
									end
								until
								not Mob or Mob:FindFirstChild("AlignPosition").MaxVelocity == (MobsVariables.Mobs[Mob.Name].Speed * 4)
							end
						end)
						Positioner.Position = Character.PrimaryPart.Position
						WaitUntilReached(Mob, 2)
						Rotation = true
						Attack = false
						if Mob and Mob:FindFirstChild("Positioner") and Character then
						if (Positioner.Position - Character.PrimaryPart.Position).Magnitude <= 10 then
								Character.Humanoid.Health -= MobsVariables.Mobs[Mob.Name].Damage
								if Character.Humanoid.Health <= 0 then
									PData.Vars.Attack = false

									Mob:FindFirstChild("Positioner"):Destroy()
									if Mob.PrimaryPart then
										Mob.PrimaryPart:FindFirstChild("BG").Enabled = false
									end
									wait(1)
									Mob:Destroy()
								end
							end
						end
					end
				else
					Mob:Destroy()
					break
				end
			else
				break
			end
		end
	end)
end

function module.CreateMob(Player, Field)
	spawn(function()
	local Rotation = true
	local Attack = false
	local PData = Data:Get(Player)
	local Mob = game.ReplicatedStorage.Mobs:FindFirstChild(Field.Monster.Value):Clone()
	if not game.Workspace.PlayerMonsters:FindFirstChild(Player.Name) then
		local Folder = Instance.new("Folder")
		Folder.Name = Player.Name
		Folder.Parent = game.Workspace.PlayerMonsters
	end
		PData.Vars.Attack = true
		game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Player, {"Vars", PData.Vars})
		local Configuration = script.Configuration:Clone()
		Configuration.Parent = Mob
		Configuration.Player.Value = Player.Name
		Configuration.Level.Value = Field.Level.Value
		Configuration.MaxHP.Value = Field.HP.Value
		Configuration.HP.Value = Configuration.MaxHP.Value
		Mob.Parent = game.Workspace.PlayerMonsters:FindFirstChild(Player.Name)
		Mob:MoveTo(Field:FindFirstChild("Pos").WorldPosition)
		
		local BG = script.BillboardGui:Clone()
		BG.Parent = Mob.PrimaryPart
		BG.MobName.Text = Mob.Name.." (Lvl "..Configuration.Level.Value..")"
		BG.Bar.TextLabel.Text = "HP:"..Configuration.MaxHP.Value
		BG.Bar.FB.Size = UDim2.new(1,0,1,0)
		BG.Name = "BG"
		BG.StudsOffsetWorldSpace = Vector3.new(0,Mob.PrimaryPart.Size.Y, 0)
		BG.AlwaysOnTop = true
		BG.MaxDistance = MobsVariables.Mobs[Mob.Name].Dist * 1.5
		
		if Mob.Name ~= "MolyCricket" then
			module.AttackLikeBee(Mob, Rotation, Player, Field, Attack)
		else
			print(Mob.Name)
		end
		
		UpdateGui(Mob, Mob:FindFirstChild("Configuration"), Player, Field)
	end)
end

function module.StartZones()
	for _,v in pairs(workspace.MonsterZones:GetChildren()) do
		local Zone = Zone.new(v)
		Zone.playerEntered:Connect(function(Player)
			local PData = Data:Get(Player)
			if not PData.Cooldowns2[v.Name] then
				local Character = game.Workspace:FindFirstChild(Player.Name)
				module.CreateMob(Player, v)
				
			elseif PData.Cooldowns2[v.Name] then
				if PData.Cooldowns2[v.Name].Time - os.time() <= 0 then
					local Character = game.Workspace:FindFirstChild(Player.Name)
					module.CreateMob(Player, v)
				end
			end
			
		end)
		Zone.playerExited:Connect(function(Player)
			local PData = Data:Get(Player)
			PData.Vars.Attack = false
			PData.Vars.AttackObj = nil
			game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Player, {"Vars", PData.Vars})
			if #game.Workspace.PlayerMonsters:FindFirstChild(Player.Name):GetChildren() > 0 then
				for i,b in pairs(game.Workspace.PlayerMonsters:FindFirstChild(Player.Name):GetChildren()) do
					spawn(function()
						if b and b:FindFirstChild("Positioner") then
							b:FindFirstChild("Positioner"):Destroy()
							if b.PrimaryPart then
								b.PrimaryPart:FindFirstChild("BG").Enabled = false
							end
							wait(0.5)
							b:Destroy()
						end
					end)
				end
			end
		end)
	end
end

return module
