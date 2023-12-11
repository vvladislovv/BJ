local Remotes = game:GetService("ReplicatedStorage").Remotes
local Bookss = require(game.ReplicatedStorage.Modules.Books).MakeSpell
local Data = require(game:GetService("ServerScriptService").Server.Data)

local module = {} do
	
	local chances = {
		["Default"] = 500,
		["Rare"] = 300,
		["Epic"] = 150,
		["Legendary"] = 49,
		["Mythic"] = 1,
	}
	
	function RandomB(TTT)
		local TotalWeight = 0

		for i,v in pairs(TTT) do
			TotalWeight += v
		end
		local Chance = math.random(1, TotalWeight)
		local coun = 0
		for i,v in pairs(TTT) do
			coun += v
			if coun >= Chance then
				return i
			end
		end
	end
	
	function RandomT(TableTT)
		local TotalWeight = 0
		for i,v in pairs(TableTT) do
			TotalWeight += v
		end
		local Chance = math.random(1, TotalWeight)
		local coun = 0
		for i,v in pairs(TableTT) do
			coun += v
			if coun >= Chance then
				return i
			end
		end
	end
	
	function MakeContent(Book)
		local tabletype = {}
		local regs = {}
		
		local RealStats = {}
		
		for i,v in pairs(Book.AvaibledStats) do
			RealStats[i] = 100
		end
		
		for i = 1, Book.Count do
			local da = RandomT(RealStats)
			local Stat = Book.AvaibledStats[da]
			RealStats[da] = nil
			local Percent = math.random(Stat[1], Stat[2])
			
			tabletype[i] = {da, "%", Percent}
		end
		
		return tabletype
	end
	
	function module.MakeRecipe(Player, Ind)
		local PData = Data:Get(Player)
		
		local BookRank = RandomB(Bookss[Ind].Chance)
		local Book = require(game.ReplicatedStorage.Modules.Books).Books[BookRank]
		if PData.Inventory["Book"] > 0 then
			PData.Inventory["Book"] -= 1
			PData.Inventory.Ticket -= Bookss[Ind].Cost
			PData.Books[#PData.Books + 1] = {
				ID = #PData.Books + 1,
				BookType = "Book",
				Rank = BookRank,
				Equipped = false,
				Content = MakeContent(Book),
			}
			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Books", PData.Books})
			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", PData.Inventory})
			Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "New Spell!"
			})
			Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "You received "..BookRank.." Rank Book"
			})
			Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "You will be able to see your spells very soon!"
			})
			Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "Have nice day"
			})
		end
	end
	
	local function GetSlot(PData)
		for i, v in pairs(PData.BookSlots) do
			if v.Buy then
				return i
			end
		end
	end
	local costs = {
		["3"] = {Ticket = 500, Robux = 299},
		["4"] = {Ticket = 1000, Robux = 799},
		["5"] = {Ticket = 1500, Robux = 1399},
		["6"] = {Ticket = 2000, Robux = 2399},
	}
	
	Remotes.CraftSpells.OnServerEvent:Connect(function(Player, Ind)
		local PData = Data:Get(Player)
		if PData.Inventory.Ticket >= Bookss[Ind].Cost then
			module.MakeRecipe(Player, Ind)
		end
	end)
	
	Remotes.BuySpell.OnServerEvent:Connect(function(Player)
		local PData = Data:Get(Player)
		local Cost = costs[tostring(GetSlot(PData))].Ticket
		if PData.Inventory.Ticket >= Cost then
			PData.Inventory.Ticket -= Cost
			local now = GetSlot(PData)
			PData.BookSlots[now].Input = true
			PData.BookSlots[now].Buy = false
			if now < 6 then
				PData.BookSlots[now + 1].Input = false
				PData.BookSlots[now + 1].Buy = true
			end

			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"BookSlots", PData.BookSlots})
			Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "Purchased Slot!"
			})
		end
	end)
	Remotes.MakeSpell.OnServerEvent:Connect(function(Player, Slot, Book)
		local PData = Data:Get(Player)
		if Book ~= 0 then
			if not PData.Books[Book].Equipped and PData.BookSlots[Slot].BookID == 0 and PData.BookSlots[Slot].Input then
				PData.BookSlots[Slot].BookID = Book
				PData.Books[Book].Equipped = true
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Books", PData.Books})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"BookSlots", PData.BookSlots})
				require(game.ServerScriptService.Functions.GetRealStats).GetRealStats(Player, PData)
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "Equipped Book on "..Slot.." Slot!"
				})
			end
		else
			if PData.Books[PData.BookSlots[Slot].BookID].Equipped and PData.BookSlots[Slot].BookID > 0 and PData.BookSlots[Slot].Input then
				PData.Books[PData.BookSlots[Slot].BookID].Equipped = false
				PData.BookSlots[Slot].BookID = 0
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Books", PData.Books})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"BookSlots", PData.BookSlots})
				require(game.ServerScriptService.Functions.GetRealStats).GetRealStats(Player, PData)
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "Unequipped Book on "..Slot.." Slot!"
				})
			end
		end
	end)
end

return module
