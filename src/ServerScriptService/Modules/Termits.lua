_G.Termits = false
local MainFolder = game.Workspace.Map.TermiteHollow
local Data = require(game.ServerScriptService.Server.Data)
local Levels = require(game.ReplicatedStorage.Modules.TermitLevels)
--local Gui = MainFolder.Gui.SurfaceGui
local Mobs = require(game.ServerScriptService.Modules.Monsters)
local MobsVariables = require(game.ReplicatedStorage.Mobs.MobsVariables)
local Utils = require(game.ReplicatedStorage.Modules.Utils)
local Utilities = require(game.ReplicatedStorage.Utilities)
local TS = game:GetService("TweenService")
local Items = require(game.ReplicatedStorage.Modules.Items)
local BeeLevels = require(game.ReplicatedStorage.Modules.BeeLevels)

local PhysService = game:GetService("PhysicsService")
local TermitCollisionGroup = PhysService:CreateCollisionGroup("grp")
PhysService:CollisionGroupSetCollidable("grp","grp",false)

local module = {}

local PollenPerLevel = 25000

module.Table = {
	Player = "",
	Points = 0,
	Pollen = 0,
	KilledTermits = 0,
	Level = 1,
	Time = 0,
}

local function WaitUntilReached(BeeModel, Magnitude, HRP)
	if BeeModel and BeeModel.PrimaryPart then
		repeat wait() if not BeeModel.PrimaryPart then break end
		until (BeeModel.PrimaryPart.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7)
	else
		return
	end
end

local function UpdateGui()
	local Gui = MainFolder.Gui.SurfaceGui
	Gui.Level.Text = "Level - "..module.Table.Level
	Gui.Points.Text = "Points: "..module.Table.Points
	Gui.Time.Text = "Time: \n"..Utilities:FormatTime(module.Table.Time - os.time())
	Gui.Bar.TxT.Text = Utils:CommaNumber(math.round(module.Table.Pollen)).."/"..Utils:CommaNumber(math.round(module.Table.Level * PollenPerLevel))
	Gui.Bar.Bar.Size = UDim2.new(math.round(module.Table.Pollen) / math.round(module.Table.Level * PollenPerLevel),0,1,0)
end

local function NoCollide(model)
	spawn(function()
		for k,v in pairs(model:GetChildren()) do
			if v:IsA"BasePart" then
				PhysService:SetPartCollisionGroup(v,"grp")
			end
		end
	end)
end

function module.TermitMove(Termit, Wall, Player)
	if script:FindFirstChild(Termit.Name) then
		local anim = Termit.Humanoid:LoadAnimation(script[Termit.Name]):Play()
	end
	if Termit.Name == "Termit" then
		spawn(function()
			while Termit do
				wait()
				if Termit and Termit.PrimaryPart then
					local Character = Player.Character
					if (Termit.PrimaryPart.Position - Character.PrimaryPart.Position).Magnitude > 10 then
						Termit:FindFirstChild("Humanoid"):MoveTo(Character.PrimaryPart.Position )
					elseif (Termit.PrimaryPart.Position - Character.PrimaryPart.Position).Magnitude <= 10 then
						Termit.Humanoid.Jump = true
						if (Termit.PrimaryPart.Position - Character.PrimaryPart.Position).Magnitude <= 5 then
							if Character and Character:FindFirstChild("Humanoid") then
								Character.Humanoid.Health -= MobsVariables.Mobs["Termit"].Damage
								wait(1)
							end
						end
					end
				end
			end
		end)
	elseif Termit.Name == "Soldier Termit" then
		spawn(function()
			while Termit do
				wait()
				if Termit and Termit.PrimaryPart then
					local Character = Player.Character
						if (Termit.PrimaryPart.Position - Character.PrimaryPart.Position).Magnitude > 5 then
							Termit:FindFirstChild("Humanoid"):MoveTo(Character.PrimaryPart.Position)
						elseif (Termit.PrimaryPart.Position - Character.PrimaryPart.Position).Magnitude <= 5 then
							Termit.Humanoid.Jump = true
							if (Termit.PrimaryPart.Position - Character.PrimaryPart.Position).Magnitude <= 10 then
								if Character and Character:FindFirstChild("Humanoid") then
									Character.Humanoid.Health -= MobsVariables.Mobs["Termit"].Damage
									wait(4)
								end
							end
						end
					end
				end
		end)
	elseif Termit.Name == "Pipe Termit" then
		spawn(function()
			while Termit do
				wait()
				if Termit and Termit.PrimaryPart then
					local Character = Player.Character
					if (Termit.PrimaryPart.Position - Character.PrimaryPart.Position).Magnitude > 45 then
						Termit:FindFirstChild("Humanoid"):MoveTo(Character.PrimaryPart.Position)
					elseif (Termit.PrimaryPart.Position - Character.PrimaryPart.Position).Magnitude <= 45 then
						Termit.PrimaryPart.Anchored = true
						local Part = Instance.new("Part")
						Part.Parent = workspace
						Part.Anchored = true
						Termit.PrimaryPart.CFrame = CFrame.lookAt(Termit.PrimaryPart.Position, Character.PrimaryPart.Position)
						Part.CFrame = Termit.PrimaryPart.CFrame * CFrame.new(0,0,-65)
						local Pos = Part.Position
						Part:Destroy()
						local Poison = script.Poison:Clone()
						Poison.Parent = workspace.ServerEffects
						Poison.Position = Termit.PrimaryPart.Position
						Poison.Touched:Connect(function(Hit)
							if Hit.Parent and game.Players:FindFirstChild(Hit.Parent.Name) then
								if Hit.Parent.Name == module.Table.Player and Character.Name == module.Table.Player then
									Poison.ParticleEmitter.Enabled = false
									Poison.ParticleEmitter1.Enabled = false
									Poison.Transparency = 1
									Poison.CanTouch = false
									spawn(function()
										wait(1.6)
										if Poison then
											Poison:Destroy()
										end
									end)
									Character.Humanoid.Health -= MobsVariables.Mobs["Pipe Termit"].Damage
								end
							end
						end)
						local Anim = TS:Create(Poison, TweenInfo.new(4, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = Pos}):Play()
						wait(3)
						if Poison and Poison:FindFirstChild("ParticleEmitter") and Poison:FindFirstChild("ParticleEmitter1") then
						Poison.ParticleEmitter.Enabled = false
						Poison.ParticleEmitter1.Enabled = false
						Poison.Transparency = 1
						Poison.CanTouch = false
						spawn(function()
							wait(1.6)
							if Poison then
								Poison:Destroy()
							end
							end)
						else
							if Poison then
								Poison:Destroy()
							end
						end
						if Termit and Termit.PrimaryPart then
							Termit.PrimaryPart.Anchored = false
						end
					end
				end
			end
		end)
	elseif Termit.Name == "Flying Termit" then
		spawn(function()
			while Termit do
				wait()
				if Termit and Termit.PrimaryPart then
					local Character = game.Workspace:FindFirstChild(Player.Name)
					if Character and Character.PrimaryPart then
						local BG = Termit.PrimaryPart:FindFirstChild("BG")
						BG.CFrame = CFrame.new(Termit.PrimaryPart.Position, Character.PrimaryPart.Position)
					else
						break
					end
				else
					break
				end
			end
		end)
		spawn(function()
			while Termit do
				wait()
				if Termit and Termit.PrimaryPart then
				local Positioner = Termit:FindFirstChild("Positioner")
				Positioner.Position = MainFolder.FootPrints.Main.Position + Vector3.new(math.random(-36,36), math.random(-5,5), math.random(-70,70))
				local Rand = math.random(1,100)
				if Rand <= 30 then
					local Character = game.Workspace:FindFirstChild(Player.Name)
					if Character and Character.PrimaryPart then
					Positioner.Position = Character.PrimaryPart.Position
					local BasicVelocity = Termit.AlignPosition.MaxVelocity
					Termit.AlignPosition.MaxVelocity = BasicVelocity * 6
					WaitUntilReached(Termit, 1)
					if Termit and Termit.PrimaryPart then
					Termit.AlignPosition.MaxVelocity = BasicVelocity
					if (Character.PrimaryPart.Position - Positioner.Position).Magnitude <= 5 then
						Character.Humanoid.Health -= MobsVariables.Mobs["Flying Termit"].Damage
					end
					else
					break
					end
					else
					break
					end
					end
					WaitUntilReached(Termit, 15)
				else
					break
				end
			end
		end)
	end
end

local function CreateGui(Termit, Player)
	local Configuration = game.ServerScriptService.Modules.Monsters.Configuration:Clone()
	Configuration.Parent = Termit
	Configuration.Player.Value = Player.Name
	local Level = MobsVariables.Mobs[Termit.Name].Level + math.round(module.Table.Level / 6)
	if Level > #BeeLevels.Levels then
		Level = #BeeLevels.Levels
	end
	Configuration.Level.Value = Level
	Configuration.MaxHP.Value = MobsVariables.Mobs[Termit.Name].Health * Configuration.Level.Value
	Configuration.HP.Value = Configuration.MaxHP.Value
	
	local BG = game.ServerScriptService.Modules.Monsters.BillboardGui:Clone()
	BG.Parent = Termit.PrimaryPart
	BG.MobName.Text = Termit.Name.." (Lvl "..Configuration.Level.Value..")"
	BG.Bar.TextLabel.Text = "HP:"..Configuration.MaxHP.Value
	BG.Bar.FB.Size = UDim2.new(1,0,1,0)
	BG.Name = "BG"
	BG.StudsOffsetWorldSpace = Vector3.new(0,Termit.PrimaryPart.Size.Y, 0)
	BG.AlwaysOnTop = true
	BG.MaxDistance = MobsVariables.Mobs[Termit.Name].Dist * 1.5
	
	Configuration.HP.Changed:Connect(function()
		BG.Bar.TextLabel.Text = "HP:"..Configuration.HP.Value
		BG.Bar.FB.Size = UDim2.new(Configuration.HP.Value / Configuration.MaxHP.Value,0,1,0)
		if Configuration.HP.Value <= 0 then
			Termit:Destroy()
			module.Table.Points += 1
			UpdateGui()
			
			local Termits = false
			for i,v in pairs(game.Workspace.PlayerMonsters[Player.Name]:GetChildren()) do
				if string.find(v.Name, "Termit") then
					Termits = true
					break
				end
			end
			
			if not Termits then
				local PData = Data:Get(Player)
				PData.Vars.Attack = false
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Vars", PData.Vars})
			end
			
		end
	end)
end

function module.SpawnTermits(Player)
	spawn(function()
	local PData = Data:Get(Player)
	PData.Vars.Attack = true
		
	if not workspace.PlayerMonsters:FindFirstChild(Player.Name) then
		local Folder = Instance.new("Folder")
		Folder.Name = Player.Name
		Folder.Parent = workspace.PlayerMonsters
	end
		
	local TermitsAmount = math.round(module.Table.Level / 6)
	if TermitsAmount <= 0 then
		TermitsAmount = 1
	end
	game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Vars", PData.Vars})
	for count = 1, math.random(1, TermitsAmount) do
		local Wall = MainFolder.Holes:GetChildren()[math.random(1, #MainFolder.Holes:GetChildren())]
		local Termit = game.ReplicatedStorage.Mobs.Termit:Clone()
		Termit.Parent = workspace.PlayerMonsters[Player.Name]
		Termit:SetPrimaryPartCFrame(Wall.Pos.Attachment.WorldCFrame)
		module.TermitMove(Termit, Wall.Pos, Player)
		CreateGui(Termit, Player)
		NoCollide(Termit)
		Termit.Humanoid.WalkSpeed = MobsVariables.Mobs["Termit"].Speed
	end
		for count = 1, math.random(1, TermitsAmount) do
			local Rand = math.random(1,100)
			if Rand <= 30 then
				local Wall = MainFolder.Holes:GetChildren()[math.random(1, #MainFolder.Holes:GetChildren())]
				local Termit = game.ReplicatedStorage.Mobs["Flying Termit"]:Clone()
				Termit.Parent = workspace.PlayerMonsters[Player.Name]
				Termit:SetPrimaryPartCFrame(Wall.Pos.Attachment.WorldCFrame)
				module.TermitMove(Termit, Wall, Player)
				CreateGui(Termit, Player)
				NoCollide(Termit)
				Termit.AlignPosition.MaxVelocity = MobsVariables.Mobs["Flying Termit"].Speed
			end
		end
		for count = 1, math.random(1, TermitsAmount) do
			local Rand = math.random(1,100)
			if Rand <= 30 then
				local Wall = MainFolder.Holes:GetChildren()[math.random(1, #MainFolder.Holes:GetChildren())]
				local Termit = game.ReplicatedStorage.Mobs["Soldier Termit"]:Clone()
				Termit.Parent = workspace.PlayerMonsters[Player.Name]
				Termit:SetPrimaryPartCFrame(Wall.Pos.Attachment.WorldCFrame)
				module.TermitMove(Termit, Wall, Player)
				CreateGui(Termit, Player)
				NoCollide(Termit)
				Termit.Humanoid.WalkSpeed = MobsVariables.Mobs["Soldier Termit"].Speed
			end
		end
		for count = 1, math.random(1, TermitsAmount) do
			local Rand = math.random(1,100)
			if Rand <= 30 then
				local Wall = MainFolder.Holes:GetChildren()[math.random(1, #MainFolder.Holes:GetChildren())]
				local Termit = game.ReplicatedStorage.Mobs["Pipe Termit"]:Clone()
				Termit.Parent = workspace.PlayerMonsters[Player.Name]
				Termit:SetPrimaryPartCFrame(Wall.Pos.Attachment.WorldCFrame)
				module.TermitMove(Termit, Wall, Player)
				CreateGui(Termit, Player)
				NoCollide(Termit)
				Termit.Humanoid.WalkSpeed = MobsVariables.Mobs["Pipe Termit"].Speed
			end
		end
	end)
end

function module.FightEnd()
	if module.Table.Player ~= "" then
		local Player = game.Players:FindFirstChild(module.Table.Player)
		if Player then
			local Character = game.Workspace:FindFirstChild(Player.Name)
			if Character then
				local PData = Data:Get(Player)
				Character:SetPrimaryPartCFrame(MainFolder.FightOverPos.CFrame)
				PData.Vars.Attack = false
				MainFolder.Gui.SurfaceGui.Enabled = false
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Vars", PData.Vars})
				for i,v in pairs(workspace.PlayerMonsters[module.Table.Player]:GetChildren()) do
					if string.find(v.Name, "Termit") then
						v:Destroy()
					end
				end
				if module.Table.Points > PData.IStats.TermiteScores then
					PData.IStats.TermiteScores = module.Table.Points
				end
				module.Table.Points = 0
				module.Table.Player = ""
				module.Table.Pollen = 0
				module.Table.Level = 1
				module.Table.Time = 0
				module.Table.KilledTermits = 0
				PData.Boosts["Termit Hollow"] = nil
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Boosts", PData.Boosts})
				
				wait(5)
				MainFolder.Fight.Value = false
			end
		end
	end
end

function module.CheckPlayer(Amount, Player)
	if module.Table.Player == Player.Name then
		module.Table.Pollen += math.round(Amount)
		UpdateGui()
		if math.round(module.Table.Pollen) >= math.round(module.Table.Level * PollenPerLevel) then
			module.Table.Pollen = 0
			module.Table.Level += 1
			module.Table.Points += 3
			module.SpawnTermits(Player)
		end
	end
end

function module.Start()
	MainFolder.Gui.SurfaceGui.Enabled = false
	
	game.Players.PlayerRemoving:Connect(function(Player)
		if module.Table.Player == Player.Name then
			MainFolder.Gui.SurfaceGui.Enabled = false
			MainFolder.Fight.Value = false
			module.Table.Player = ""
			module.Table.Pollen = 0
			module.Table.Points = 0
			module.Table.KilledTermits = 0
			module.Table.Level = 1
			module.Table.Time = 0
		end
	end)

	game.ReplicatedStorage.Remotes.BuyTermitPass.OnServerEvent:Connect(function(Player, Paid)
		local PData = Data:Get(Player)
		if not Paid then
			if not PData.Cooldowns2["Free Termit Pass"] and PData.Inventory["Termit Pass"] < Items.Eggs["Termit Pass"].Limit then
				PData.Cooldowns2["Free Termit Pass"] = {Time = 7200 + os.time()}
				PData.Inventory["Termit Pass"] += 1
				game.ReplicatedStorage.Remotes.DataUpdated:FireClient(Player, {"Inventory", "Termit Pass", PData.Inventory["Termit Pass"]})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Cooldowns2", PData.Cooldowns2})
				game.ReplicatedStorage.Remotes.SSound:FireClient(Player, "Purchase",1,true)
				game.ReplicatedStorage.Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+1 Termit Pass"
				})
			end
		else
			if PData.Inventory["Ticket"] >= workspace.Map.Toys.TicketTermitPass.Cost.Value and PData.Inventory["Termit Pass"] < Items.Eggs["Termit Pass"].Limit then
				PData.Inventory["Ticket"] -= workspace.Map.Toys.TicketTermitPass.Cost.Value
				PData.Inventory["Termit Pass"] += 1
				game.ReplicatedStorage.Remotes.DataUpdated:FireClient(Player, {"Inventory", "Termit Pass", PData.Inventory["Termit Pass"]})
				game.ReplicatedStorage.Remotes.DataUpdated:FireClient(Player, {"Inventory", "Ticket", PData.Inventory["Ticket"]})
				game.ReplicatedStorage.Remotes.SSound:FireClient(Player, "Purchase",1,true)
				game.ReplicatedStorage.Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+1 Termit Pass"
				})
			end
		end
	end)
	
	game.ReplicatedStorage.Remotes.EnterTermiteHollow.OnServerEvent:Connect(function(Player)
		if MainFolder.Fight.Value == false and module.Table.Player == "" then
			local PData = Data:Get(Player)
			if PData.Inventory["Termit Pass"] > 0 then
				PData.Inventory["Termit Pass"] -= 1
				game.ReplicatedStorage.Remotes.DataUpdated:FireClient(Player, {"Inventory", "Termit Pass", PData.Inventory["Termit Pass"]})
				game.ReplicatedStorage.Remotes.AlertClient:FireClient(Player, {
					Color = "Red",
					Msg = "-1 Termit Pass"
				})
				MainFolder.Fight.Value = true
				MainFolder.Gui.SurfaceGui.Enabled = true
				UpdateGui()
				local Character = Player.Character
				Character:SetPrimaryPartCFrame(MainFolder.SpawnPos.CFrame)
				module.Table.Player = Player.Name
				module.Table.Pollen = 0
				module.Table.Points = 0
				module.Table.KilledTermits = 0
				module.Table.Level = 1
				module.Table.Time = 300 + os.time()
					
				PData.Vars.Attack = true
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Vars", PData.Vars})
				--Empty Backpack
				if PData.IStats.Pollen > 0 then
				PData.IStats.Honey += PData.IStats.Pollen
				game.ReplicatedStorage.Remotes.Visual:FireClient(Player, {Pos = Player.Character.PrimaryPart, Amount = PData.IStats.Pollen, Color = "Honey"})
				game.ReplicatedStorage.Remotes.SSound:FireClient(Player, "Purchase",1,true)
				PData.IStats.Pollen = 0
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
				end
				--Start
				module.SpawnTermits(Player)
				--Timer
				spawn(function()
					for count = 1,module.Table.Time - os.time() + 5 do
						local Character = game.Workspace:FindFirstChild(Player.Name)
						if Character and Character.PrimaryPart then
							if module.Table.Time - os.time() > 0 then
								UpdateGui()
								wait(1)
							else
								module.FightEnd()
								break
							end
						else
							break
						end
					end
				end)
					
				Character.Humanoid.Died:Connect(function()
					if module.Table.Player == Character.Name then
						module.FightEnd()
					end
				end)
			end
		end
		end)
end

return module
