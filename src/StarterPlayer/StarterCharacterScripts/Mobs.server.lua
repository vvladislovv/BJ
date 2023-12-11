wait(6)

-- Services
local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")
local HRP = script.Parent.UpperTorso
local ts = game:GetService("TweenService")
-- Modules
local Zone = require(game.ServerScriptService.Zone)

-- Constants
local Character = script.Parent
local Client = game.Players:GetPlayerFromCharacter(Character)
local Items = require(game.ReplicatedStorage.Modules.Items)
local FieldZones = workspace.FieldZones
local Fields = workspace.Fields
local MFields = require(game.ServerScriptService.Server.GenerateFields)
local Stamps = ServerStorage.Assets.Stamps
local Data = require(game.ServerScriptService.Server.Data)
local Equipment = require(game.ServerScriptService.Server.Equipment)
local PData = Data:Get(Client)
local PS = game:GetService("PhysicsService")
local Utils = require(game.ReplicatedStorage.Modules.Utils)
local Remotes = game:GetService("ReplicatedStorage").Remotes

function GetFolder()
	if not workspace.PlayerMonsters:FindFirstChild(Client.Name) then
		local f = Instance.new("Folder", workspace.PlayerMonsters)
		f.Name = Client.Name
		return f
	else
		return workspace.PlayerMonsters[Client.Name]
	end
end

function GetMonsterSpawnPos(Monster)
	return workspace.MonsterZones[Monster].Pos.WorldPosition
end

function WaitUntilReached(Pos1, Pos2)
	repeat wait()
	until (Pos1 - Pos2).Magnitude <= 5
end

function MobCreate(Zone)
	
	local Monster = game.ReplicatedStorage.Mobs[Zone.Monster.Value]:Clone()
	
	Monster.Name = Zone.Name
	Monster:SetPrimaryPartCFrame(CFrame.new(GetMonsterSpawnPos(Monster.Name)))
	Monster.Parent = GetFolder()
	
	local Gui = Monster.PrimaryPart:FindFirstChild("BillboardGui")
	local Configuration = Monster:FindFirstChild("Configuration")
	Configuration.HP.Value = Configuration.MaxHP.Value
	Gui.MobName.Text = Monster.Name.."("..Configuration.Level.Value.." Level)"
	Gui.Bar.TextLabel.Text = "❤️ "..Utils:AbNumber(Configuration.HP.Value).."/"..Utils:AbNumber(Configuration.MaxHP.Value)
	
	PData.Vars.AttackObj = Monster
	
	mobAI(Monster)
	
end

function Smoke(Pos)
	spawn(function()
		local vfx = game.ReplicatedStorage.Effect.VFX:Clone()
	vfx.Parent = workspace
	vfx.Position = Pos
		wait(1.33)
		vfx:Destroy()
	end)
end

function RandomDropTypePH(Folder)
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

function Attack(Mob, Character)
	local AttackAnim = Mob.Humanoid:LoadAnimation(Mob.Attack)
	if Mob then
	Mob.PrimaryPart.Anchored = true
	Mob.PrimaryPart.CFrame = CFrame.new(Mob.PrimaryPart.Position, Vector3.new(Character.PrimaryPart.Position.X ,Mob.PrimaryPart.Position.Y ,Character.PrimaryPart.Position.Z))
	AttackAnim:Play()
	if Mob then
	wait(0.6)
	if Mob then
	if (Character.PrimaryPart.Position - Mob.PrimaryPart.Position).Magnitude <= 17 and Mob then
		Character.Humanoid.Health -= Mob:FindFirstChild("Configuration").Damage.Value
	end
	AttackAnim:Stop()
	wait(1)
	if Mob then
	Mob.PrimaryPart.Position += Vector3.new(0,1,0)
	Mob.PrimaryPart.Anchored = false
	end
	end
	end
	end
end

function mobAI(Mob)
	
	local Configuration = Mob:FindFirstChild("Configuration")
	
	local Rewards = false
	
	spawn(function()
	Configuration.HP.Changed:Connect(function(Damage)
		
		local Gui = Mob.PrimaryPart:FindFirstChild("BillboardGui")
		local Configuration = Mob:FindFirstChild("Configuration")
		
		if Configuration.HP.Value < 0 then
			Configuration.HP.Value = 0
			if Rewards == false then
				Rewards = true
				local MobRewards = Mob:FindFirstChild("Rewards")
				
				Remotes.AlertClient:FireClient(Client, {
					Color = "Blue",
					Msg = "Defeated "..Mob.DisplayName.Value.."!"
				})

				--local da = math.random(1)
				local Honey = math.random(MobRewards.Honey.Min.Value, MobRewards.Honey.Max.Value)
				PData.Cooldowns2[Mob.Name] = {Time = os.time() + Mob.Cooldown.Value}
				game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Client, {"Cooldowns2", PData.Cooldowns2})
				local reward = RandomDropTypePH(MobRewards)
				local amount = math.random(reward.Min.Value, reward.Max.Value)
				PData.Inventory[reward.Name] += amount
				PData.IStats["Honey"] += Honey
				PData.IStats["TotalHoney"] += Honey
				PData.Badges["Honey"].Amount += Honey
				game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Client, {"IStats","Honey", PData.IStats["Honey"]})
				game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Client, {"IStats","TotalHoney", PData.IStats["TotalHoney"]})
				game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Client, {"Badges","Honey", PData.Badges["Honey"]})
				Remotes.AlertClient:FireClient(Client, {
					Color = "Blue",
					Msg = "+"..amount.." "..reward.Name.." (from "..Mob.DisplayName.Value..")"
				})
				Remotes.AlertClient:FireClient(Client, {
					Color = "Blue",
					Msg = "+"..Honey.." Honey (from "..Mob.DisplayName.Value..")"
				})
				PData.Badges["Battle"].Amount += Mob.Points.Value
				Remotes.AlertClient:FireClient(Client, {
					Color = "Blue",
					Msg = "+"..Mob.Points.Value.." Battle Point (from "..Mob.DisplayName.Value..")"
				})
				
				Mob:Destroy()
				
				PData.ActiveMobs[Mob.Name] = false
				PData.Vars.Attack = false
				PData.Vars.AttackObj = nil
				
				if GetFolder():GetChildren() ~= 0 then
					for i,v in pairs(GetFolder():GetChildren()) do
						PData.ActiveMobs[v.Name] = true
						PData.Vars.Attack = true
						PData.Vars.AttackObj = v
					end
				end
			end
		end
		if Mob then
		Gui.Bar.TextLabel.Text = "❤️ "..Utils:AbNumber(Configuration.HP.Value).."/"..Utils:AbNumber(Configuration.MaxHP.Value)
		Gui.Bar.FB.Size = UDim2.new(Configuration.HP.Value/Configuration.MaxHP.Value,0,1,0)
		end
		end)
	end)
	
	local WalkAnim = Mob:FindFirstChild("Humanoid"):LoadAnimation(Mob.Move)
	WalkAnim:Play()
	
	while Mob do wait()
		if Mob then
		local CHumanoid = Character:FindFirstChild("Humanoid")
		local Configuration = Mob:FindFirstChild("Configuration")
		local MobHumanoid = Mob:FindFirstChild("Humanoid")
		local HP = Mob:FindFirstChild("Configuration"):FindFirstChild("HP")
			if PData.ActiveMobs[Mob.Name] and PData.Vars.HP > 0 and HP.Value > 0 then
			MobHumanoid:MoveTo(Character.PrimaryPart.Position)
			if (Mob.PrimaryPart.Position - Character.PrimaryPart.Position).Magnitude <= 15 then
				WalkAnim:Stop()
				Attack(Mob, Character)
			else
				WalkAnim:Play()
				Mob.PrimaryPart.Anchored = false
			end
			
			elseif not PData.ActiveMobs[Mob.Name] or PData.Vars.HP <= 0 then
				if HP.Value <= 0 then
				spawn(function()
				PData.ActiveMobs[Mob.Name] = false
				PData.Vars.Attack = false
				PData.Vars.AttackObj = nil
				Smoke(Mob.PrimaryPart.Position)
				Mob:Destroy()
				end)
				break
			else
				spawn(function()
				MobHumanoid:MoveTo(GetMonsterSpawnPos(Mob.Name))
				PData.ActiveMobs[Mob.Name] = false
				PData.Vars.Attack = false
				PData.Vars.AttackObj = nil
				MobHumanoid.MoveToFinished:Connect(function()
				Smoke(Mob.PrimaryPart.Position)
				Mob:Destroy()
					end)
				end)
				break
			end
		end
	end
end

end

for i,v in pairs(workspace.MonsterZones:GetChildren()) do
	local Zone = Zone.new(v)

	Zone.playerExited:Connect(function(Player)
		local PData = Data:Get(Player)
		if Player.Name == Client.Name then
			PData.ActiveMobs[v.Name] = false
			PData.Vars.Attack = false
			PData.Vars.AttackObj = nil
		end
	end)

	Zone.playerEntered:Connect(function(Player)
		local PData = Data:Get(Player)
		if Player.Name == Client.Name then
			if not PData.Cooldowns2[v.Name] and not GetFolder():FindFirstChild(v.Name) then
				PData.ActiveMobs[v.Name] = true
				PData.Vars.Attack = true
				MobCreate(v)
			end
		end
	end)
end