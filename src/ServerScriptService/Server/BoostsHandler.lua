local Players = game:GetService("Players")
local SSS = game:GetService("ServerScriptService")
local Rep = game.ReplicatedStorage
local Remotes = Rep.Remotes
local Modules = Rep.Modules
local Data = require(script.Parent.Data)
local Items = require(Modules.Items)
local GetStatsModule = require(SSS.Functions.GetRealStats)

local BoostsHandler = {} do
	Remotes.Boost.Event:Connect(function(Player, BoostType, BoostAmount)
		if game.Players:FindFirstChild(Player.Name) then
			local PData = Data:Get(Player)
			local Boost
		if not Rep.Boosts:FindFirstChild(BoostType) then
			Boost = require(Rep.Boosts.Haste)
		else
			Boost = require(Rep.Boosts:FindFirstChild(BoostType))
		end
		if Rep.Boosts:FindFirstChild(BoostType) then
				if not Boost.Passive then
					
					if game.ReplicatedStorage.Modules.BearMorph:FindFirstChild(BoostType) then
						require(game.ReplicatedStorage.Modules["BearMorph"]).Spawn({
							PData = PData,
						},BoostType, Player)
					end
					
					if string.find(BoostType, "Field") then
						Remotes.FieldBoostVisual:FireClient(Player, BoostType)
					end
			
					if not PData.Boosts[BoostType] then
						
					local BoostTime
					if Boost.Time > 0 then
						 BoostTime = os.time() + Boost.Time
						else
						 BoostTime = math.huge
					end
						
					local BoostTable = {Time = BoostTime, Amount = math.round(BoostAmount), Name = BoostType, BoostType = BoostType}
						PData.Boosts[BoostType] = BoostTable
						
						if Boost.Min then
							spawn(function()
								local Break = false
								Remotes.Boost.Event:Connect(function(Player2, BoostType2, BoostAmount2)
									if Player2 == Player and BoostType == BoostType2 then
										Break = true
									end
								end)
								repeat
									if not Break and PData.Boosts[BoostType] then
										local Time = PData.Boosts[BoostType].Time - os.time()
										local Amount = PData.Boosts[BoostType].Amount
										local Period = Time / Amount
										wait(Period)
										if not Break and PData.Boosts[BoostType] then
											PData.Boosts[BoostType].Amount -= 1
											Remotes.UpdateClientBoost:FireClient(Player, BoostType, BoostAmount, Time)
											Remotes.DataUpdated:FireClient(Player, {"Boosts", PData.Boosts})
											if PData.Boosts[BoostType].Amount <= 0 then
												PData.Boosts[BoostType] = nil
												Remotes.UpdateClientBoost:FireClient(Player, BoostType, BoostAmount, Time)
												Remotes.DataUpdated:FireClient(Player, {"Boosts", PData.Boosts})
												break
											end
										else
											break
										end
									else
										break
									end
								until
								not PData.Boosts[BoostType] or Break
							end)
						end
					Remotes.UpdateClientBoost:FireClient(Player, BoostType, BoostAmount, PData.Boosts[BoostType].Time - os.time())
					Remotes.DataUpdated:FireClient(Player, {"Boosts", PData.Boosts})
					for i, v in pairs(Boost.Boosts) do
						if v.Mod == "Percent" then
							PData.AllStats[v.Type] += (v.Amount * math.round(BoostAmount))
							if v.Type == "Player Movespeed" then
									Player.Character.Humanoid.WalkSpeed = 16 * (PData.AllStats["Player Movespeed"] / 100)
							end
							if v.Type == "Jump Power" then
									Player.Character.Humanoid.JumpPower = 50 * (PData.AllStats["Jump Power"] / 100)
							end
							if v.Type == "Bee Movespeed" then
								for _, Bee in pairs(workspace.Bees[Player.Name]:GetChildren()) do
									local BeeData = PData.Bees[tonumber(Bee.Name)]
									local BeeMod = require(game.ReplicatedStorage.Bees[BeeData.BeeName])
									local BeeSpeed = BeeMod.Speed + BeeData.Properties.MoveX
									Bee.AlignPosition.MaxVelocity = BeeSpeed * (PData.AllStats["Bee Movespeed"] / 100)
									--Bee.AlignPosition.Responsiveness = BeeSpeed * (PData.AllStats["Bee Movespeed"] / 100)
								end
							end
							elseif v.Mod == "Mult" then
								if PData.AllStats[v.Type] >= 100 then
									PData.AllStats[v.Type] *= (v.Amount * math.round(BoostAmount))
								end
								if v.Type == "Player Movespeed" then
									Player.Character.Humanoid.WalkSpeed = 16 * (PData.AllStats["Player Movespeed"] / 100)
								end
								if v.Type == "Jump Power" then
									Player.Character.Humanoid.JumpPower = 50 * (PData.AllStats["Jump Power"] / 100)
								end
								if v.Type == "Bee Movespeed" then
									for _, Bee in pairs(workspace.Bees[Player.Name]:GetChildren()) do
										local BeeData = PData.Bees[tonumber(Bee.Name)]
										local BeeMod = require(game.ReplicatedStorage.Bees[BeeData.BeeName])
										local BeeSpeed = BeeMod.Speed + BeeData.Properties.MoveX
										Bee.AlignPosition.MaxVelocity = BeeSpeed * (PData.AllStats["Bee Movespeed"] / 100)
										--Bee.AlignPosition.Responsiveness = BeeSpeed * (PData.AllStats["Bee Movespeed"] / 100)
									end
								end
						end
					end
				elseif PData.Boosts[BoostType] and PData.Boosts[BoostType].Amount < Boost.MaxStack then
					if not Boost.MaxTime then
						PData.Boosts[BoostType].Time = os.time() + Boost.Time
					else
						if PData.Boosts[BoostType].Time >= Boost.MaxTime then
							PData.Boosts[BoostType].Time += Boost.Time
						end
					end
						PData.Boosts[BoostType].Amount += math.round(BoostAmount)
						
						if Boost.Min then
							spawn(function()
								local Break = false
								Remotes.Boost.Event:Connect(function(Player2, BoostType2, BoostAmount2)
									if Player2 == Player and BoostType == BoostType2 then
										Break = true
									end
								end)
								repeat
									if not Break and PData.Boosts[BoostType] then
										local Time = PData.Boosts[BoostType].Time - os.time()
										local Amount = PData.Boosts[BoostType].Amount
										local Period = Time / Amount
										wait(Period)
										if not Break and PData.Boosts[BoostType] then
										PData.Boosts[BoostType].Amount -= 1
										Remotes.UpdateClientBoost:FireClient(Player, BoostType, BoostAmount, Time)
										Remotes.DataUpdated:FireClient(Player, {"Boosts", PData.Boosts})
										if PData.Boosts[BoostType].Amount <= 0 then
											PData.Boosts[BoostType] = nil
											Remotes.UpdateClientBoost:FireClient(Player, BoostType, BoostAmount, Time)
											Remotes.DataUpdated:FireClient(Player, {"Boosts", PData.Boosts})
											break
											end
										else
											break
										end
									else
										break
									end
								until
								not PData.Boosts[BoostType] or Break
							end)
						end
						
						Remotes.UpdateClientBoost:FireClient(Player, BoostType, BoostAmount, PData.Boosts[BoostType].Time - os.time())
						Remotes.DataUpdated:FireClient(Player, {"Boosts", PData.Boosts})
						
						for i, v in pairs(Boost.Boosts) do
							if v.Mod == "Percent" then
								PData.AllStats[v.Type] += (v.Amount * math.round(BoostAmount))
								if v.Type == "Player Movespeed" then
									Player.Character.Humanoid.WalkSpeed = 16 * (PData.AllStats["Player Movespeed"] / 100)
								end
								if v.Type == "Jump Power" then
									Player.Character.Humanoid.JumpPower = 50 * (PData.AllStats["Jump Power"] / 100)
								end
								if v.Type == "Bee Movespeed" then
									for _, Bee in pairs(workspace.Bees[Player.Name]:GetChildren()) do
										local BeeData = PData.Bees[tonumber(Bee.Name)]
										local BeeMod = require(game.ReplicatedStorage.Bees[BeeData.BeeName])
										local BeeSpeed = BeeMod.Speed + BeeData.Properties.MoveX
										Bee.AlignPosition.MaxVelocity = BeeSpeed * (PData.AllStats["Bee Movespeed"] / 100)
										--Bee.AlignPosition.Responsiveness = BeeSpeed * (PData.AllStats["Bee Movespeed"] / 100)
									end
								end
							elseif v.Mod == "Mult" then
								if PData.AllStats[v.Type] >= 100 then
									PData.AllStats[v.Type] *= (v.Amount * math.round(BoostAmount))
								end
								if v.Type == "Player Movespeed" then
									Player.Character.Humanoid.WalkSpeed = 16 * (PData.AllStats["Player Movespeed"] / 100)
								end
								if v.Type == "Jump Power" then
									Player.Character.Humanoid.JumpPower = 50 * (PData.AllStats["Jump Power"] / 100)
								end
								if v.Type == "Bee Movespeed" then
									for _, Bee in pairs(workspace.Bees[Player.Name]:GetChildren()) do
										local BeeData = PData.Bees[tonumber(Bee.Name)]
										local BeeMod = require(game.ReplicatedStorage.Bees[BeeData.BeeName])
										local BeeSpeed = BeeMod.Speed + BeeData.Properties.MoveX
										Bee.AlignPosition.MaxVelocity = BeeSpeed * (PData.AllStats["Bee Movespeed"] / 100)
										--Bee.AlignPosition.Responsiveness = BeeSpeed * (PData.AllStats["Bee Movespeed"] / 100)
									end
								end
							end
						end
				elseif PData.Boosts[BoostType] and PData.Boosts[BoostType].Amount >= Boost.MaxStack then
					PData.Boosts[BoostType].Time = os.time() + Boost.Time
					PData.Boosts[BoostType].Amount = Boost.MaxStack
					Remotes.UpdateClientBoost:FireClient(Player, BoostType, BoostAmount, PData.Boosts[BoostType].Time - os.time())
					Remotes.DataUpdated:FireClient(Player, {"Boosts", PData.Boosts})
				end
				GetStatsModule.GetRealStats(Player, PData)
			else
				local BoostTable = {Time = math.huge, Amount = math.round(BoostAmount), Name = BoostType}
				PData.Boosts[BoostType] = BoostTable
				Remotes.UpdateClientBoost:FireClient(Player, BoostType, BoostAmount, PData.Boosts[BoostType].Time - os.time())
				Remotes.DataUpdated:FireClient(Player, {"Boosts", PData.Boosts})
				GetStatsModule.GetRealStats(Player, PData)
			end
			else
			warn("suck my asypus (please)")
			end
		end
	end)
	
end

return BoostsHandler