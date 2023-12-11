local Remotes = game:GetService("ReplicatedStorage").Remotes
local Bookss = require(game.ReplicatedStorage.Modules.HALLOWEEN)
local Data = require(game:GetService("ServerScriptService").Server.Data)

local module = {} do
	
	--function RandomT(TableTT)
	--	print(TableTT)
	--	local TotalWeight = 0
	--	for i,v in pairs(TableTT) do
	--		TotalWeight += v
	--		print(i,v)
	--	end
	--	local Chance = math.random(1, TotalWeight)
	--	local coun = 0
	--	for i,v in pairs(TableTT) do
	--		coun += v
	--		if coun >= Chance then
	--			return i
	--		end
	--	end
	--end
	function RandomT(TableTT)
		return TableTT[math.random(1,#TableTT)]
	end
	function RandomAmount(Drop)
		local rty = 0
		if Drop[3] == "Count" then
			rty = Drop[2][math.random(1,#Drop[2])]
		else
			rty = math.random(Drop[2][1], Drop[2][2])
		end
		return rty
	end
	function FindLevel(am)
		for _, Level in pairs(Bookss.Progression) do
			if am == Level.Goal then
				return Level.Rewards
			end
		end
	end
	Remotes.DonatePumpkin.OnServerEvent:Connect(function(Player)
		local PData = Data:Get(Player)
		PData.Inventory["Pumpkin"] = 0
		if PData.Inventory["Pumpkin"] >= 1 then
			PData.Inventory["Pumpkin"] -= 1
			PData.IStats.Donations += 1
			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", "Pumpkin", PData.Inventory.Pumpkin})
			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", "Donations", PData.IStats.Donations})
			Remotes.AlertClient:FireClient(Player, {
				Color = "Purple2",
				Msg = "+1 Donation"
			})
			if FindLevel(PData.IStats.Donations) then
				local Reward = FindLevel(PData.IStats.Donations)
				PData[Reward[1][1]][Reward[1][2]] += Reward[1][3]
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {Reward[1][1], Reward[1][2], PData[Reward[1][1]][Reward[1][2]]})
				Remotes.AlertClient:FireClient(Player, {
					Color = "Purple",
					Msg = "+"..Reward[1][3].." "..Reward[1][2]
				})
			end
		end
	end)
	Remotes.HatchSkull.OnServerInvoke = function(Player, Ind)
		local PData = Data:Get(Player)
		PData.Inventory[Ind] = 0
		if PData.Inventory[Ind] >= 1 then
			Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "Hatching "..Ind.."..."
			})
			wait(0.25)
			Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "Hatching "..Ind..".."
			})
			wait(0.25)
			Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "Hatching "..Ind.."."
			})
			wait(0.25)
			Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "Hatching "..Ind..".."
			})
			wait(0.25)
			Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "Hatching "..Ind.."..."
			})
			wait(1.5)
			local TableCC = Bookss.Cases[Ind].GDrop
			local Drop = RandomT(TableCC)
			local ItemT = Drop[1]
			local AmountT = RandomAmount(Drop)
			PData[Drop[4]][ItemT] += AmountT
			PData.Inventory[Ind] -= 1
			Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "+"..AmountT.." "..ItemT.." (from "..Ind..")"
			})
			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", ItemT, PData.Inventory[ItemT]})
			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", Ind, PData.Inventory[Ind]})
			return {ItemT, AmountT}
		end
	end
end

return module
