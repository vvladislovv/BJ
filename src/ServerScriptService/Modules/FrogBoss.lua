local Data = require(game.ServerScriptService.Server.Data)
local StumpFolder = workspace:FindFirstChild("StumpFrog")
local Stump = StumpFolder:FindFirstChild("Stump")
local Utils = require(game.ReplicatedStorage.Modules.Utils)
local Mobs = require(game.ReplicatedStorage.Mobs.MobsVariables)
local Monsters = require(game.ServerScriptService.Modules.Monsters)

local module = {}

local function WaitUntilReached(Model, Magnitude, HRP)
	if Model and Model.PrimaryPart then
		repeat wait() if not Model or not Model.PrimaryPart then break end
		until (Model.PrimaryPart.Position - Model.Positioner.Position).Magnitude <= (Magnitude or 0.7)
	else
		return
	end
end

function module.SummonFrog(Player)
	local PData = Data:Get(Player)
	if not PData.Cooldowns2["Frog"] then
		spawn(function()
			local Frog = game.ReplicatedStorage.Mobs.Frog:Clone()
			local Pos1 = Stump:FindFirstChild("Pos1")
			local Pos2 = Stump:FindFirstChild("Pos2")
			local Pos3 = Stump:FindFirstChild("Pos3")
			local Positioner = Frog:FindFirstChild("Positioner")
			local Character = game.Workspace:FindFirstChild(Player.Name)
			if not workspace.PlayerMonsters:FindFirstChild(Player.Name) then
				local Folder = Instance.new("Folder")
				Folder.Name = Player.Name
				Folder.Parent = workspace.PlayerMonsters
			end
			Frog.Parent = workspace.PlayerMonsters:FindFirstChild(Player.Name)
			Frog.Player.Value = Player.Name
			Frog:SetPrimaryPartCFrame(workspace.StumpFrog.Stump.Pos1.WorldCFrame)
			Frog.Name = "Frog"
			local Jump = Frog:FindFirstChild("Humanoid"):LoadAnimation(script.FrogJump)
			Jump:Play()
			Positioner.Position = Pos1.WorldPosition
			Frog.PrimaryPart:FindFirstChild("BG").CFrame = CFrame.Angles(0, 0, 0)
			wait(0.3)
			if Frog and Frog.PrimaryPart then
				Positioner.Position = Pos2.WorldPosition
				Frog.PrimaryPart:FindFirstChild("BG").CFrame = CFrame.Angles(0, 0, 0)
				game.ReplicatedStorage.Remotes.SSound:FireClient(Player, "FrogWaterSplash",1,true)
				wait(0.3)
				if Frog and Frog.PrimaryPart then
					Frog.AlignPosition.Responsiveness = 50
					Positioner.Position = Pos3.WorldPosition
					wait(1.5)
					if Frog and Frog.PrimaryPart then
						Frog.PrimaryPart:FindFirstChild("BG").CFrame = CFrame.Angles(0, 0, 0)
						local Gui = game.ServerScriptService.Modules.Monsters.BillboardGui:Clone()
						Gui.Size = UDim2.new(20,0,6,0)
						Gui.Parent = Frog:FindFirstChild("Head")
						local Configuration = game.ServerScriptService.Modules.Monsters.Configuration:Clone()
						Configuration.Parent = Frog
						Configuration.Level.Value = 6
						Configuration.MaxHP.Value = Mobs.Mobs.Frog.Health
						Configuration.Player.Value = Player.Name
						Configuration.HP.Value = PData.IStats.FrogHealth
						PData.Vars.Attack = true
						game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Player, {"Vars", PData.Vars})
						Gui.MobName.Text = "Frog (Lvl "..Configuration.Level.Value..")"
						Gui.Bar.TextLabel.Text = "HP:"..Utils:CommaNumber(Configuration.HP.Value)
						Gui.Bar.FB.Size = UDim2.new(Configuration.HP.Value / Configuration.MaxHP.Value,0,1,0)
						Gui.StudsOffset = Vector3.new(0,17,0)
						
						Configuration.HP.Changed:Connect(function(HP)
							if Frog and Gui then
								Gui.Bar.TextLabel.Text = "HP:"..Utils:CommaNumber(HP)
								Gui.Bar.FB.Size = UDim2.new(Configuration.HP.Value / Configuration.MaxHP.Value,0,1,0)
								if HP <= 0 then
									Monsters.GetRewards(Frog, Player, Frog)
									Frog:Destroy()
									PData.IStats.FrogHealth = Mobs.Mobs.Frog.Health
									game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
								end
							end
						end)
						spawn(function()
							wait(3)
							if Frog and Frog:FindFirstChild("Humanoid") then
							local POST = 1
							local FrogMove = Frog:FindFirstChild("Humanoid"):LoadAnimation(script.FrogMove)
							FrogMove.Looped = true
							FrogMove:Play()
							if Frog and Frog:FindFirstChild("AlignPosition") then
								Frog.PrimaryPart:FindFirstChild("BG").D = 1500
								Frog:FindFirstChild("AlignPosition").MaxVelocity = 5
								while Frog do
									if Frog and Frog.PrimaryPart and Frog:FindFirstChild("Positioner") and Frog.PrimaryPart:FindFirstChild("BG") then
										local Rand = math.random(1,100)
										if Rand <= 15 then
											Frog.PrimaryPart:FindFirstChild("BG").D = 100
											Frog:FindFirstChild("AlignPosition").MaxVelocity = 250
											FrogMove:Stop()
											Jump.TimePosition = 0
											Jump:AdjustSpeed(2)
											Jump:Play()
											POST += 3
											if POST > 24 then
												POST = 1
											end
											wait(0.05)
											Frog.Positioner.Position = Stump:FindFirstChild("Ring"..POST).WorldPosition + Vector3.new(0,15,0)
											Frog.PrimaryPart:FindFirstChild("BG").CFrame = CFrame.new(Frog.PrimaryPart.Position, Frog.Positioner.Position) * CFrame.Angles(0,math.rad(180),0)
											WaitUntilReached(Frog, 1)
											POST += 2
											if POST > 24 then
												POST = 1
											end
											Frog.Positioner.Position = Stump:FindFirstChild("Ring"..POST).WorldPosition
											Frog.PrimaryPart:FindFirstChild("BG").CFrame = CFrame.new(Frog.PrimaryPart.Position, Frog.Positioner.Position) * CFrame.Angles(0,math.rad(180),0)
											WaitUntilReached(Frog, 1)
											Frog:FindFirstChild("AlignPosition").MaxVelocity = 5
											Jump:Stop()
											Frog.PrimaryPart:FindFirstChild("BG").D = 1500
											FrogMove:Play()
										else
											Frog:FindFirstChild("AlignPosition").MaxVelocity = 5
											POST += 1
											if POST > 24 then
												POST = 1
											end
											Frog.Positioner.Position = Stump:FindFirstChild("Ring"..POST).WorldPosition
											Frog.PrimaryPart:FindFirstChild("BG").CFrame = CFrame.new(Frog.PrimaryPart.Position, Frog.Positioner.Position) * CFrame.Angles(0,math.rad(180),0)
											WaitUntilReached(Frog, 1)
										end
									else
										break
									end
								end
								end
							end
						end)
					end
				end
			end
		end)
	end
end

function module.RemoveFrog(Player)
	spawn(function()
		if game.Workspace.PlayerMonsters:FindFirstChild(Player.Name) then
			local Folder = game.Workspace.PlayerMonsters:FindFirstChild(Player.Name)
			if #Folder:GetChildren() > 0 then
				for Count, Monster in pairs(Folder:GetChildren()) do
					if Monster.Name == "Frog" then
						local PData = Data:Get(Player)
						if Monster:FindFirstChild("Configuration") then
							PData.IStats.FrogHealth = Monster:FindFirstChild("Configuration").HP.Value
							game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
						end
						PData.Vars.Attack = false
						game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Player, {"Vars", PData.Vars})
						Monster:Destroy()
					end
				end
			end
		end
	end)
end



return module
