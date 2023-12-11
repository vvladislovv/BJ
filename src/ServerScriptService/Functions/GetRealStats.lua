local badges = require(game.ReplicatedStorage.Modules.Badges).Badges
--local AmuletsStats = require(game.ReplicatedStorage.Modules.AmuletStats)
local BeesPass = require(game.ReplicatedStorage.Modules.Beespass)
local A = {
	["Instant"] = true,
	["Red Instant"] = true,
	["Blue Instant"] = true,
	["White Instant"] = true,
	["Movement Collection"] = true,
	["Critical Chance"] = true,
	["Bomb Instant"] = true,
	["White Bomb Instant"] = true,
	["Red Bomb Instant"] = true,
	["Total Converts"] = true,
	["Blue Bomb Instant"] = true,
	["Bee's Attack"] = true,
	["Red Bee's Attack"] = true,
	["Colorless Bee's Attack"] = true,
	["Blue Bee's Attack"] = true,
	["Convert Amount"] = true,
}

local BoostsHandler = {} do
	
	function BoostsHandler.GetRealStats(Player, PData)
		local NewStats = {}
		for Name, Am in pairs(PData.AllStats) do
			if not A[Name] then
				NewStats[Name] = 100
			else
				NewStats[Name] = 0
			end
		end
		NewStats["Capacity"] = 100
		local newcap = 0
			local Items = require(game.ReplicatedStorage.Modules.Items)
			for EqType, Eq in pairs(PData.Equipment) do
			if Eq ~= "" and Items.Accessorys[Eq] then
				if Items.Accessorys[Eq].Capacity then
					newcap += Items.Accessorys[Eq].Capacity
				end
					if Items.Accessorys[Eq].Buffs then
						for i,v in pairs(Items.Accessorys[Eq].Buffs) do
							if v[2] == "Percent" then
								NewStats[v[1]] += v[3]
							elseif v[2] == "Multiplier" then
								if not A[v[1]] then
								NewStats[v[1]] *= v[3]
							end
							end
						end
					end
				end
			end
		
			local Bees = {}
			for i,v in pairs(PData.Bees) do
				if v.BeeName ~= "" and v.Gifted == true then
					if not table.find(Bees, v.BeeName) then
					local BeeModule = require(game.ReplicatedStorage.Bees:FindFirstChild(v.BeeName))
					
					if BeeModule.GiftedBonus[2] == "Percent" then
						NewStats[BeeModule.GiftedBonus[1]] += BeeModule.GiftedBonus[3]
					elseif BeeModule.GiftedBonus[2] == "Mult" then
						NewStats[BeeModule.GiftedBonus[1]] *= BeeModule.GiftedBonus[3]
					elseif BeeModule.GiftedBonus[2] == "Add" then
						NewStats[BeeModule.GiftedBonus[1]] += BeeModule.GiftedBonus[3]
					end
					table.insert(Bees, v.BeeName)
					end
				end
		end
		--Amulets
		for i,v in pairs(PData.Books) do
			if i == v.ID and v.Equipped then
				for _, stat in pairs(v.Content) do
					if stat[2] == "%" then
						NewStats[stat[1]] += stat[3]
					elseif stat[2] == "*" then
						NewStats[stat[1]] *= stat[3]
					end
				end
			end
		end
		--for i,v in pairs(PData.Amulets) do
		--	for d,b in pairs(v) do
		--		if b ~= "Type" then
		--			if b[2] == "%" then
		--				NewStats[d] += b[1]
		--			elseif b[2] == "*"  then
		--				NewStats[d] *= b[1]
		--			end
		--		end
		--	end
		--end
		--Beespass
			for i,v in pairs(BeesPass.Free) do
				if table.find(PData.BeespassRewards.Free, i) then
					for b,d in pairs(v.Rewards) do
						if d.Type == "AllStats" then
							if d.P == "Percent" then
								NewStats[b] += d.Amount
							elseif d.P == "Mult" then
								NewStats[b] *= d.Amount
							end
						end
					end
				end
			end
			if PData.Beespass.Paid == true then
				for i,v in pairs(BeesPass.Paid) do
					if table.find(PData.BeespassRewards.Paid, i) then
						for b,d in pairs(v.Rewards) do
							if d.Type == "AllStats" then
								if d.P == "Percent" then
									NewStats[b] += d.Amount
								elseif d.P == "Mult" then
									NewStats[b] *= d.Amount
								end
							end
						end
					end
				end
			end
		
			--Boosts Count
			if PData.Boosts ~= {} then
			for BoostName, Info in pairs(PData.Boosts) do
				if game.ReplicatedStorage.Boosts:FindFirstChild(Info.Name) then
					local BoostInfo = require(game.ReplicatedStorage.Boosts[Info.Name])
					for i,v in pairs(BoostInfo.Boosts) do
						if v.Mod == "Percent" and NewStats[v.Type] ~= nil and v.Amount ~= nil then
							NewStats[v.Type] += (v.Amount * Info.Amount)
						elseif v.Mod == "Mult" and NewStats[v.Type] ~= nil and v.Amount ~= nil then
							if not A[v.Type] then
								if Info.Amount < 1 then
									if v.Amount <= 1 then
										NewStats[v.Type] *= ((Info.Amount + 1) * v.Amount)
									else
										NewStats[v.Type] *= ((Info.Amount + 1) * 1)
									end
								else
									NewStats[v.Type] *= (Info.Amount * v.Amount)
								end
							end
						elseif v.Mod == "Add" and NewStats[v.Type] ~= nil and v.Amount ~= nil then
							NewStats[v.Type] += (v.Amount * Info.Amount)
						elseif v.Mod == "MinusPercent" and NewStats[v.Type] ~= nil and v.Amount ~= nil then
						NewStats[v.Type] -= (v.Amount * Info.Amount)
						end
					end
					end
				end
			end
			--badges counts
			for g,h in pairs(PData.Badges) do
				if h.Tier > 1 then
					if badges[g] then
						if badges[g][h.Tier - 1].BuffType == "Percent" then
							NewStats[badges[g].BuffType] += badges[g][h.Tier - 1].BuffAmount
						else
							if not A[badges[g].BuffType] then
								NewStats[badges[g].BuffType] *= math.round(badges[g][h.Tier - 1].BuffAmount * badges[g][h.Tier - 1].BuffAmount)
							end
						end
					end
				end
		end
		
		for Name, Am in pairs(PData.AllStats) do
			if NewStats[Name] < 0 then
				NewStats[Name] = 0
			end
		end
		
		for NameQ, AmQ in pairs(PData.AllStats) do
			
			PData.AllStats[NameQ] = math.round(NewStats[NameQ])
			
			if NameQ == "Bee Movespeed" then
				if workspace.Bees:FindFirstChild(Player.Name) then
					for _, Bee in pairs(workspace.Bees[Player.Name]:GetChildren()) do
					local BeeData = PData.Bees[tonumber(Bee.Name)]
					if BeeData.BeeName ~= "" then
					local BeeMod = require(game.ReplicatedStorage.Bees[BeeData.BeeName])
					local BeeSpeed = BeeMod.Speed + BeeData.Properties.MoveX
					Bee.AlignPosition.MaxVelocity = BeeSpeed * (PData.AllStats["Bee Movespeed"] / 100)
						end
					end
				end
			end
			
			if game.Players:FindFirstChild(Player.Name) then
				spawn(function()
				if game.Players:FindFirstChild(Player.Name) then
				local Player = game.Players:FindFirstChild(Player.Name)
				local Character = game.Workspace:FindFirstChild(Player.Name)
				if Player and Player:FindFirstChild("PlayerGui") and Character then
				local PlayerGui = Player.PlayerGui:FindFirstChild("UI")
				local Tabs = PlayerGui:FindFirstChild("Tabs")
				local StatsFrame = Tabs:FindFirstChild("Settings"):FindFirstChild("Player")
				local Scrolling = StatsFrame:FindFirstChild("Buffs")
				
				if Scrolling and Player then
					if Scrolling:FindFirstChild(NameQ) then
						local TextLabel = Scrolling:FindFirstChild(NameQ)
							if string.find(NameQ, "Instant") then
								TextLabel.Text = NameQ.." Conversion:"
							else
								TextLabel.Text = NameQ..":"
							end
							if string.find(NameQ, "Total") then
								TextLabel.TXT.Text = math.round(NewStats[NameQ])
							else
								TextLabel.TXT.Text = math.round(NewStats[NameQ]).."%"
							end
							if string.find(NameQ, "Bee's Attack") then
								TextLabel.TXT.Text = math.round(NewStats[NameQ])
							end
						end
						
						if Character then
							local TextLabel = Scrolling:FindFirstChild("Movespeed")
							TextLabel.Text = "Walk Speed:"
							TextLabel.TXT.Text = math.round(Character:FindFirstChild("Humanoid").WalkSpeed)
							
							local TextLabel = Scrolling:FindFirstChild("JumpPower")
							TextLabel.Text = "Jump Power:"
							TextLabel.TXT.Text = math.round(Character:FindFirstChild("Humanoid").JumpHeight)
						end
						end
						end
					end
				end)
			end

				if NameQ == "Player Movespeed" then
					if game.Players:FindFirstChild(Player.Name) then
						Player.Character:FindFirstChild("Humanoid").WalkSpeed = 16 * (PData.AllStats["Player Movespeed"] / 100)
					end
				end
			
			PData.IStats.Capacity = newcap * (PData.AllStats["Capacity"] / 100)

			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", "Capacity", PData["IStats"]["Capacity"]})
			end
				if NameQ == "Jump Power" then
				if game.Players:FindFirstChild(Player.Name) then
					Player.Character:FindFirstChild("Humanoid").JumpHeight = 7.2 * (PData.AllStats["Jump Power"] / 100)
					end
				end
			end
		--end)
	end
end

return BoostsHandler