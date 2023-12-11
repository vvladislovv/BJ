local BeespassRewards = require(game.ReplicatedStorage.Modules.Beespass)
local Remotes = game.ReplicatedStorage.Remotes
local Data = require(game.ServerScriptService.Server.Data)

local module = {}

function module.Check(Player, PData, Amount)
	PData.Beespass.Xp += Amount
	Remotes.AlertClient:FireClient(Player, {
		Color = "Blue",
		Msg = "+"..Amount.." XP"
	})
	spawn(function()
	repeat
		if PData.Beespass.Xp >= BeespassRewards.Free[PData.Beespass.TotalLevels].Xp then
			PData.Beespass.Xp -= BeespassRewards.Free[PData.Beespass.TotalLevels].Xp
			if PData.Beespass.Xp <= 0 then
				PData.Beespass.Xp = 0
			end
			PData.Beespass.TotalLevels += 1
			Remotes.DataUpdated:FireClient(Player, {"Beespass", PData.Beespass})
			Remotes.GetBeespassReward:FireClient(Player)
			Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "Level "..PData.Beespass.TotalLevels.." BeePass achieved!🎉"
			})
			wait(0.25)
		end
	until
		PData.Beespass.Xp <= 0 or PData.Beespass.Xp < BeespassRewards.Free[PData.Beespass.TotalLevels].Xp
		Remotes.DataUpdated:FireClient(Player, {"Beespass", PData.Beespass})
		Remotes.GetBeespassReward:FireClient(Player)
	end)
end

function module.Start()
Remotes.GetBeespassReward.OnServerEvent:Connect(function(Player, Reward, Type)
local PData = Data:Get(Player)
	if Type == "Paid" then
		if PData.Beespass.Paid then
			if not PData.BeespassRewards[Type][Reward] then
				PData.BeespassRewards[Type][Reward] = true
				Remotes.SSound:FireClient(Player, "Claim",1.5,true)
				for i,v in pairs(BeespassRewards[Type][Reward].Rewards) do
					if v.Type ~= "AllStats" then
					PData[v.Type][i] += v.Amount
					Remotes.DataUpdated:FireClient(Player, {v.Type, i, PData[v.Type][i]})
					Remotes.AlertClient:FireClient(Player, {
						Color = "Blue",
						Msg = "+"..v.Amount.." "..i.." from Bees-Pass"
					})
					else
						if v.P == "Percent" then
						Remotes.AlertClient:FireClient(Player, {
							Color = "Blue",
							Msg = "+"..v.Amount.."% "..i.." from Bees-Pass"
						})
						elseif v.P == "Mult" then
						Remotes.AlertClient:FireClient(Player, {
							Color = "Blue",
							Msg = "x"..v.Amount.." "..i.." from Bees-Pass"
						})
						end
					require(game.ServerScriptService.Functions.GetRealStats).GetRealStats(Player, PData)
						end
					end
					Remotes.DataUpdated:FireClient(Player, {"BeespassRewards", PData.BeespassRewards})
					Remotes.GetBeespassReward:FireClient(Player)
				end
			end
		else
			if not PData.BeespassRewards[Type][Reward] then
				PData.BeespassRewards[Type][Reward] = true
				Remotes.SSound:FireClient(Player, "Claim",1.5,true)
				for i,v in pairs(BeespassRewards[Type][Reward].Rewards) do
					if v.Type ~= "AllStats" then
						PData[v.Type][i] += v.Amount
						Remotes.DataUpdated:FireClient(Player, {v.Type, i, PData[v.Type][i]})
						Remotes.AlertClient:FireClient(Player, {
							Color = "Blue",
							Msg = "+"..v.Amount.." "..i.." from Bees-Pass"
						})
					else
						if v.P == "Percent" then
							Remotes.AlertClient:FireClient(Player, {
								Color = "Blue",
								Msg = "+"..v.Amount.."% "..i.." from Bees-Pass"
							})
						elseif v.P == "Mult" then
							Remotes.AlertClient:FireClient(Player, {
								Color = "Blue",
								Msg = "x"..v.Amount.." "..i.." from Bees-Pass"
							})
						end
						require(game.ServerScriptService.Functions.GetRealStats).GetRealStats(Player, PData)
					end
				end
				Remotes.DataUpdated:FireClient(Player, {"BeespassRewards", PData.BeespassRewards})
				Remotes.GetBeespassReward:FireClient(Player)
			end
		end
	end)
Remotes.SkipPassLevel.OnServerEvent:Connect(function(Player)
		local PData = Data:Get(Player)
		if PData.Beespass.TotalLevels < 50 then
			if PData.Inventory.Ticket >= 70 then
				PData.Inventory.Ticket -= 70
				PData.Beespass.TotalLevels += 1
				PData.Beespass.Xp = 0
				Remotes.DataUpdated:FireClient(Player, {"Beespass", PData.Beespass})
				Remotes.DataUpdated:FireClient(Player, {"Inventory","Ticket", PData.Inventory["Ticket"]})
				Remotes.GetBeespassReward:FireClient(Player)
				Remotes.SSound:FireClient(Player, "Purchase", 1, true)
				Remotes.AlertClient:FireClient(Player, {
					Color = "Red",
					Msg = "-30 Tickets"
				})
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "Level "..PData.Beespass.TotalLevels.." BeePass achieved!🎉"
				})
			end
		end
end)
end

return module
