local MainFolder = workspace:WaitForChild("MolyCricket")
local PlayerSpawnPos = MainFolder:FindFirstChild("SpawnPos")
local Remotes = game:GetService("ReplicatedStorage"):WaitForChild("Remotes")
--local MolyCricket = require(game.ReplicatedStorage.BossAI.MolyCricket)
local Data = require(game.ServerScriptService.Server.Data)
local MobsVariables = require(game.ReplicatedStorage.Mobs.MobsVariables)
local TS = game:GetService("TweenService")
local Utils = require(game.ReplicatedStorage.Modules.Utils)
local Mobs = require(game.ServerScriptService.Modules.Monsters)

local module = {}

local Fight = false
local Waiting = false
local Intermission = false

local function JoinedAlerts(JoinedPlayers, Player, MaxPlayers)
	if Fight == false then
	local JoinedAmount = 0
	if not table.find(JoinedPlayers, Player.Name) then
		table.insert(JoinedPlayers, Player.Name)
	end
	for Count, Player in pairs(JoinedPlayers) do
		JoinedAmount += 1
	end
	Remotes.AlertClient:FireAllClients({
		Color = "Cave",
		Msg = Player.Name.." went into the cave of the Moly Cricket ("..JoinedAmount.."/"..MaxPlayers..")"
	})
	end
end

local function LeavedAlerts(JoinedPlayers, Player, MaxPlayers)
	local JoinedAmount = 0
	if table.find(JoinedPlayers, Player.Name) then
		for Count, Player2 in pairs(JoinedPlayers) do
			if Player2 == Player.Name then
				table.remove(JoinedPlayers, Count)
				local PData = Data:Get(Player)
				PData.Vars.Attack = false
				game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Player, {"Vars", PData.Vars})
				JoinedAmount -= 1
				if game.Workspace.Bees:FindFirstChild(Player.Name) then
					for Count, Bee in pairs(game.Workspace.Bees:FindFirstChild(Player.Name):GetChildren()) do
						Bee:SetPrimaryPartCFrame(workspace.Map.Main.SpawnLocation.Attachment.WorldCFrame)
					end
				end
			end
			JoinedAmount += 1
		end
		if Fight == false then
		Remotes.AlertClient:FireAllClients({
			Color = "Cave2",
			Msg = Player.Name.." came out of the cave of the Moly Cricket ("..JoinedAmount.."/"..MaxPlayers..")"
		})
		else
			for d, Player in pairs(JoinedPlayers) do
				local Client = game.Players:FindFirstChild(Player)
				if Client then
					Remotes.AlertClient:FireClient(Client, {
						Color = "Blue",
						Msg = Player.Name.." died in battle ("..JoinedAmount.."/"..MaxPlayers..")"
					})
				end
			end
		end
		if #JoinedPlayers <= 0 then
			Intermission = false
			game.ReplicatedStorage.Remotes.DarkAmbience:FireClient(Player, false)
			if Fight == true then
			Fight = false
			if game.Workspace.ServerMonsters:FindFirstChild("MolyCricket") then
				game.Workspace.ServerMonsters:FindFirstChild("MolyCricket"):Destroy()
			end
			Remotes.AlertClient:FireAllClients({
				Color = "Cave",
				Msg = "The Fight is Over. All Players are Eliminated⛔️"
				})
			end
		end
	end
end

local function SummonRocks(X, Z, Xr, Zr, Amount, Boss)
	if Fight == true then
		spawn(function()
			for count = 1, Amount do
				if Fight == true then
					wait(0.1)
					local Rock = script.Rock:Clone(workspace)
					local Circle = script.Circle:Clone()
					Circle.Size = Vector3.new(0,0,0)
					Circle.Parent = MainFolder.Attacks
					--Y = 151
					Circle.Position = Boss.Main.Position + Vector3.new(math.random(X,Z), 2, math.random(Xr,Zr))
					local CirclePosition = Circle.Position
					spawn(function()
						TS:Create(Circle, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = Vector3.new(0.694,math.random(15,37), math.random(15,37))}):Play()
						wait(3)
						Rock.Parent = MainFolder.Attacks
						Rock.Size = Vector3.new(0,0,0)
						Rock.Position = Circle.Position + Vector3.new(0,math.random(55,75),0)
						Rock.Orientation = Vector3.new(math.random(-90,90),math.random(-90,90),math.random(-90,90))
						Rock.Anchored = false
						Rock.Velocity = Vector3.new(0,-25,0)
						TS:Create(Rock, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = Vector3.new((Circle.Size.Y + Circle.Size.Z) / 2, Circle.Size.Y, Circle.Size.Z)}):Play()
						wait(0.5)
						Rock.Anchored = false
						local deb = false
						Rock.Touched:Connect(function(Hit)
							if Hit.Parent and game.Players:FindFirstChild(Hit.Parent.Name) then
								if deb == false then
									local Character = game.Workspace:FindFirstChild(Hit.Parent.Name)
									local PData = Data:Get(game.Players[Hit.Parent.Name])
									deb = true
									if (CirclePosition - Character.PrimaryPart.Position).Magnitude <= (Circle.Size.Y + Circle.Size.Z) / 2 then
										Character.Humanoid.Health -= 15
									end
								end
							end
						end)
						wait(0.5)
						Circle:Destroy()
					end)
				end
			end
		end)
	end
end

local function GetRandomPlayer(Players)
	if #Players > 0 then
		local Character = Players[math.random(1, #Players)]
		return game.Workspace:FindFirstChild(Character)
	end
end

local function StopAllAnims(Anim, Anims)
	if Fight == true then
		Anims.IdleAnim:Play()
		spawn(function()
			if Fight == true then
				for i,v in pairs(Anims) do
					if Fight then
						if i == Anim then
							Anims[i]:Play()
						else
							Anims[i]:Stop()
						end
					end
				end
			end
		end)
	end
end

local function Attack2(Anim, Rotated, Anims, Boss)
	if Fight == true then
		Rotated = false
		Anims.IdleAnim:Play()
		Boss.PrimaryPart:FindFirstChild("BodyGyro").CFrame = CFrame.new(MainFolder.MainBossPart.Position)
		wait(1)

		Boss.PrimaryPart.Anchored = true

		StopAllAnims(Anim, Anims)
		wait(3.9)
		Anims.Idle2Anim:Play()
		for i,Hand in pairs(MainFolder.Hands:GetChildren()) do
			local Door = MainFolder.HandDoors:FindFirstChild(tostring(Hand.Name))
			if Fight == true then
				spawn(function()
					Door.Material = Enum.Material.Neon
					TS:Create(Door, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Color = Color3.fromRGB(255,89,89)}):Play()
					wait(1)
					Hand:FindFirstChild("Humanoid"):LoadAnimation(script.Hand1):Play()
					spawn(function()
						wait(1.3)
						if Fight == true then
							local Position = Hand.RightHand.Position
							for i, Player in pairs(game.Players:GetChildren()) do
								if game.Workspace:FindFirstChild(Player.Name) then
									spawn(function()
										local Character = game.Workspace:FindFirstChild(Player.Name)
										local PData = Data:Get(Player)
										if Character and Character.PrimaryPart then
											if (Position - Character.PrimaryPart.Position).Magnitude <= 35 and Fight == true then
												Character.Humanoid.Health -= 20
												local BodyVelocity = Instance.new("BodyVelocity")
												BodyVelocity.Parent = Character.PrimaryPart
												BodyVelocity.MaxForce = Vector3.new(1000000,1000000,1000000)
												BodyVelocity.Velocity = Vector3.new(0,75,0)
												wait(0.1)
												BodyVelocity:Destroy()
											end
										end
									end)
								end
							end
						end
						wait(0.7)
						if Fight == true then
							local Position = Hand.RightHand.Position
							for i, Player in pairs(game.Players:GetChildren()) do
								if game.Workspace:FindFirstChild(Player.Name) then
									spawn(function()
										local Character = game.Workspace:FindFirstChild(Player.Name)
										local PData = Data:Get(Player)
										if Character and Character.PrimaryPart then
											if (Position - Character.PrimaryPart.Position).Magnitude <= 35 and Fight == true then
												Character.Humanoid.Health -= 20
												local BodyVelocity = Instance.new("BodyVelocity")
												BodyVelocity.Parent = Character.PrimaryPart
												BodyVelocity.MaxForce = Vector3.new(1000000,1000000,1000000)
												BodyVelocity.Velocity = Vector3.new(0,75,0)
												wait(0.1)
												BodyVelocity:Destroy()
											end
										end
									end)
								end
							end
						end
					end)
					wait(3)
					TS:Create(Door, TweenInfo.new(0.5, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Color = Color3.fromRGB(0,0,0)}):Play()
					Door.Material = Enum.Material.Plastic
				end)
			end
			wait(4)
		end
		Boss.PrimaryPart.Anchored = false
		Rotated = true
		StopAllAnims("IdleAnim", Anims)
	end
end

local function Attack(Anim, Rotated, Boss, Anims, Players)
	if Fight == true then
		StopAllAnims("IdleAnim", Anims)
		Rotated = false
		if Boss and Boss:FindFirstChild("RightHand") then
			Boss.RightHand:FindFirstChild("Trail").Enabled = true
		end
		if Fight then
			wait(0.5)
			local Position
			if Fight then
				spawn(function()
					if Fight then
						local MainPart = Boss:FindFirstChild("Main")
						MainPart.Orientation = Boss.PrimaryPart.Orientation
						local Part = script.Union:Clone()
						Part.Anchored = true
						Part.Parent = MainFolder.Attacks
						Part.CFrame = (MainPart.CFrame * CFrame.new(115,0,75)) * CFrame.Angles(0,math.rad(-120),0)
						Position = Part.Position
						wait(1.5)
						Part.Anchored = false
						wait(1)
						Part:Destroy()
					end
				end)
				if Fight then
					wait(1)
					StopAllAnims(Anim, Anims)
					if Fight then
						spawn(function()
							if Fight then
								wait(1.3)
								for i,v in pairs(Players) do
									if game.Players:FindFirstChild(v) then
										Remotes.SSound:FireClient(game.Players:FindFirstChild(v), "HandWhoosh",1,true)
										Remotes.CameraShake:FireClient(game.Players:FindFirstChild(v))
									end
								end
								wait(0.2)
								--wait(1.5)
								for i, Player in pairs(game.Players:GetChildren()) do
									if game.Workspace:FindFirstChild(Player.Name) then
										spawn(function()
											local Character = game.Workspace:FindFirstChild(Player.Name)
											local PData = Data:Get(Player)
											if Character and Character.PrimaryPart then
												if (Position - Character.PrimaryPart.Position).Magnitude <= 45 and Fight then
													Character.Humanoid.Health -= 25
													local BodyVelocity = Instance.new("BodyVelocity")
													BodyVelocity.Parent = Character.PrimaryPart
													BodyVelocity.MaxForce = Vector3.new(1000000,1000000,1000000)
													BodyVelocity.Velocity = Vector3.new(0,150,-150)
													wait(0.1)
													BodyVelocity:Destroy()
												end
											end
										end)
									end
								end
							end
						end)
						if Fight then
							wait(3.2)
							Rotated = true
							StopAllAnims("IdleAnim", Anims)
							if Boss and Boss:FindFirstChild("RightHand") then
								Boss.RightHand:FindFirstChild("Trail").Enabled = false
							end
						end
					end
				end
			end
		end
	end
end

local function Attack3(Anim, Boss, Rotated, Anims)
	if Fight == true then
		Boss.PrimaryPart.Anchored = true
		Rotated = false
		StopAllAnims(Anim, Anims)
		spawn(function()
			local First = 5
			local Two = 15
			local Three = 30
			SummonRocks(-100,100,-165,-130, First, Boss)
			SummonRocks(120,155,-100,100, First, Boss)
			SummonRocks(-165,-130,-100,100, First, Boss)
			SummonRocks(-100,100,120,155, First, Boss)
			wait(5)
			SummonRocks(-100,100,-165,-130, Two, Boss)
			SummonRocks(120,155,-100,100, Two, Boss)
			SummonRocks(-165,-130,-100,100, Two, Boss)
			SummonRocks(-100,100,120,155, Two, Boss)
			wait(5)
			SummonRocks(-100,100,-165,-130, Three, Boss)
			SummonRocks(120,155,-100,100, Three, Boss)
			SummonRocks(-165,-130,-100,100, Three, Boss)
			SummonRocks(-100,100,120,155, Three, Boss)
		end)
		wait(12.12)
		Rotated = true
		Boss.PrimaryPart.Anchored = false
		StopAllAnims("IdleAnim", Anims)
	end
end

function module.FightJoin()
	local MaxPlayers = 5
	local JoinedPlayers = {}
	Remotes.MolyCricketJoin.OnServerEvent:Connect(function(Player)
	if not Fight then
	spawn(function()
	local Character = game.Workspace:FindFirstChild(Player.Name)
		if Character then
			Character:SetPrimaryPartCFrame(workspace.Map.Main.SpawnLocation.Attachment.WorldCFrame)
			JoinedAlerts(JoinedPlayers, Player, MaxPlayers)
			game.Players.PlayerRemoving:Connect(function(Player)
				LeavedAlerts(JoinedPlayers, Player, MaxPlayers)
			end)
			Character:FindFirstChild("Humanoid").Died:Connect(function()
				LeavedAlerts(JoinedPlayers, Player, MaxPlayers)
			end)
		end
		end)
		if not Intermission then
			Intermission = true
			spawn(function()
				if #JoinedPlayers > 0 then
					for Count = 1,60 do
						if #JoinedPlayers > 0 and Intermission then
							for d, Player in pairs(JoinedPlayers) do
								local Client = game.Players:FindFirstChild(Player)
								if Client then
									Remotes.AlertClient:FireClient(Client, {
										Color = "Blue",
										Msg = "Remaining Time: "..61 - Count.." sec."
									})
								end
							end
							wait()
							if #JoinedPlayers <= 0 or not Intermission then
								break
							end
						else
							break
						end
					end
					if Intermission and #JoinedPlayers > 0 then
						for d, Player in pairs(JoinedPlayers) do
							local Client = game.Players:FindFirstChild(Player)
							if Client then
								Remotes.AlertClient:FireClient(Client, {
									Color = "Red",
									Msg = "The battle has begun!💀"
								})
							end
						end
						local PCount = 0
						for Count, Player in pairs(JoinedPlayers) do
							PCount += 1
						end
						if PCount > 0 then
							module.FightStart(JoinedPlayers, PCount)
						end
					end
				end
			end)
			end
		end
	end)
	Remotes.MolyCricketExit.OnServerEvent:Connect(function(Player)
		LeavedAlerts(JoinedPlayers, Player, MaxPlayers)
	end)
end

function module.FightStart(Players, PCount)
	Fight = true
	local Rotated = true
	local Stop = false
	for i,v in pairs(Players) do
		if game.Workspace:FindFirstChild(v) then
			local Character = game.Workspace:FindFirstChild(v)
			if Character then
				spawn(function()
					game.ReplicatedStorage.Remotes.DarkAmbience:FireClient(game.Players:FindFirstChild(v), true)
					wait(2)
					Character:SetPrimaryPartCFrame(PlayerSpawnPos.CFrame)
				end)
			end
			if game.Workspace.Bees:FindFirstChild(v) then
				spawn(function()
				wait(2)
				for Count, Player in pairs(Players) do
					if game.Workspace.Bees:FindFirstChild(Player) then
						if game.Workspace:FindFirstChild(Player) then
							spawn(function()
								for Count, Bee in pairs(game.Workspace.Bees:FindFirstChild(Player):GetChildren()) do
									if game.Workspace:FindFirstChild(Player).PrimaryPart then
										Bee:SetPrimaryPartCFrame(game.Workspace:FindFirstChild(Player).PrimaryPart.CFrame)
										if Bee:FindFirstChild("Positioner") then
											Bee:FindFirstChild("Positioner").Position = Bee.PrimaryPart.Position
										end
									else
										break
									end
								end
							end)
						end
					end
				end
				end)
			end
		end
	end
	local MainFolder = workspace:FindFirstChild("MolyCricket")
	local MBoss = game.ReplicatedStorage.Mobs.MolyCricket:Clone()
	MBoss.Parent = workspace.ServerMonsters
	MBoss.Name = "MolyCricket"
	MBoss:SetPrimaryPartCFrame(MainFolder:FindFirstChild("BossSpawnPos").CFrame + Vector3.new(0,-150,0))
	MBoss.PrimaryPart.Anchored = true
	MBoss.PrimaryPart.AlignPosition.Attachment1 = MainFolder.MainBossPart.Attachment
	MBoss:FindFirstChild("Main").Position = MainFolder.MainBossPart.MainPart.WorldPosition
	
	local Configuration = game.ServerScriptService.Modules.Monsters.Configuration:Clone()
	Configuration.Parent = MBoss
	Configuration.Level.Value = MobsVariables.Mobs["MolyCricket"].Level
	Configuration.MaxHP.Value = MobsVariables.Mobs["MolyCricket"].Health
	Configuration.HP.Value = Configuration.MaxHP.Value
	
	local BG = game.ServerScriptService.Modules.Monsters.BillboardGui:Clone()
	BG.Parent = MBoss.Head
	BG.MobName.Text = "Moly Cricket (Lvl "..Configuration.Level.Value..")"
	BG.Bar.TextLabel.Text = "HP:"..Utils:CommaNumber(Configuration.HP.Value)
	BG.Bar.FB.Size = UDim2.new(1,0,1,0)
	BG.Name = "BG"
	BG.StudsOffset = Vector3.new(0,35,0)
	BG.Size = UDim2.new(40,0,12,0)
	
	for Count, Player in pairs(Players) do
		if game.Workspace:FindFirstChild(Player) and game.Players:FindFirstChild(Player) then
			spawn(function()
				local Character = game.Workspace:FindFirstChild(Player)
				local Client = game.Players:FindFirstChild(Player)
				Character:FindFirstChild("Humanoid").Died:Connect(function()
					LeavedAlerts(Players, Player, 5)
				end)
			end)
		else
			table.remove(Players, Count)
		end
	end
	game.Players.PlayerRemoving:Connect(function(Player)
		LeavedAlerts(Players, Player, 5)
	end)
	
	Configuration.HP.Changed:Connect(function(Health)
		if MBoss and MBoss.PrimaryPart then
			MBoss.Head:FindFirstChild("BG").Bar.TextLabel.Text = "HP:"..Utils:CommaNumber(Health)
			MBoss.Head:FindFirstChild("BG").Bar.FB.Size = UDim2.new(Configuration.HP.Value / Configuration.MaxHP.Value,0,1,0)

			if Health <= 0 and Fight == true then
				Fight = false
				if MBoss then
					for Count, Player in pairs(Players) do
						if game.Players:FindFirstChild(Player) then
							spawn(function()
								local Client = game.Players:FindFirstChild(Player)
								Mobs.GetRewards(MBoss, Client, "MolyCricket")
								_G.JoinedMC = false
								spawn(function()
									wait(5)
									for Count, Player in pairs(Players) do
										if game.Workspace:FindFirstChild(Player) then
											spawn(function()
												local Character = game.Workspace:FindFirstChild(Player)
												game.ReplicatedStorage.Remotes.DarkAmbience:FireClient(game.Players:FindFirstChild(Player), false)
												wait(2)
												Character:SetPrimaryPartCFrame(game.Workspace.Map.Main.SpawnLocation.Attachment.WorldCFrame)
												if game.Workspace.Bees:FindFirstChild(Player) then
													for i, Bee in pairs(game.Workspace.Bees:FindFirstChild(Player):GetChildren()) do
														Bee:SetPrimaryPartCFrame(game.Workspace.Map.Main.SpawnLocation.Attachment.WorldCFrame)
														if Bee:FindFirstChild("Positioner") then
															Bee:FindFirstChild("Positioner").Position = game.Workspace.Map.Main.SpawnLocation.Attachment.WorldPosition
														end
													end
												end
											end)
										end
									end
								end)
							end)
						end
					end
					MBoss:Destroy()
				end
			end
		end
	end)
	
	local Character = GetRandomPlayer(Players)
	
	local Anims = {
		FirstAnim = MBoss:FindFirstChild("Humanoid"):LoadAnimation(script.First),
		SecondAnim = MBoss:FindFirstChild("Humanoid"):LoadAnimation(script.Two),
		ThirdAnim = MBoss:FindFirstChild("Humanoid"):LoadAnimation(script.Third),
		FourAnim = MBoss:FindFirstChild("Humanoid"):LoadAnimation(script.Four),
		FifthAnim = MBoss:FindFirstChild("Humanoid"):LoadAnimation(script.Fifth),
		Attack1Anim = MBoss:FindFirstChild("Humanoid"):LoadAnimation(script.Attack),
		IdleAnim = MBoss:FindFirstChild("Humanoid"):LoadAnimation(script.Idle),
		Idle2Anim = MBoss:FindFirstChild("Humanoid"):LoadAnimation(script.Idle2),
		SixAnim = MBoss:FindFirstChild("Humanoid"):LoadAnimation(script.Six),
		JumpAnim = MBoss:FindFirstChild("Humanoid"):LoadAnimation(script.Jump),
	}

	Anims.ThirdAnim.Looped = true
	Anims.IdleAnim.Looped = true
	Anims.Idle2Anim.Looped = true
	
	spawn(function()
		while MBoss do wait()
			if Rotated and Fight then
				if Character ~= nil and MBoss and MBoss.PrimaryPart then
					MBoss.PrimaryPart:FindFirstChild("BodyGyro").CFrame = CFrame.new(MBoss.PrimaryPart.Position, Vector3.new(Character.PrimaryPart.Position.X, MBoss.PrimaryPart.Position.Y, Character.PrimaryPart.Position.Z)) * CFrame.Angles(0,math.rad(125),0)
				else
					Character = GetRandomPlayer(Players)
				end
			elseif Stop == true then
				break
			end
		end
	end)
	
	Rotated = false
	for i,v in pairs(Players) do
		if game.Players:FindFirstChild(v) then
			game.ReplicatedStorage.Remotes.DarkAmbience:FireClient(game.Players:FindFirstChild(v), true)
		end
	end
	MBoss.PrimaryPart.Anchored = false
	Anims.FirstAnim:Play()
	wait(3.9)
	Anims.SecondAnim:Play()
	wait(1.15)
	Anims.ThirdAnim:Play()
	wait(7)
	Rotated = true
	
	spawn(function()
		for i, Player in pairs(Players) do
			if game.Players:FindFirstChild(Player) then
				local PData = Data:Get(game.Players:FindFirstChild(Player))
				PData.Vars.Attack = true
				game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(game.Players:FindFirstChild(Player), {"Vars", PData.Vars})
			end
		end
	end)
	
	repeat
		for count = 1,5 do
			Rotated = false
			Attack("Attack1Anim", Rotated, MBoss, Anims, Players)
			Rotated = true
			Character = GetRandomPlayer(Players)
			wait(1)
		end
		Rotated = false
		Attack2("SixAnim",Rotated, Anims, MBoss)
		Rotated = true
		wait(1)
		for count = 1,5 do
			Rotated = false
			Attack("Attack1Anim", Rotated, MBoss, Anims, Players)
			Rotated = true
			Character = GetRandomPlayer(Players)
			wait(1)
		end
		Rotated = false
		Attack3("JumpAnim", MBoss, Rotated, Anims)
		Rotated = true
		wait(1)
	until
	Fight == false
	
end

return module
