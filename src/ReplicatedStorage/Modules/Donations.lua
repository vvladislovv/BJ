local Remotes = game.ReplicatedStorage.Remotes



local module = {
	["GiveawayPack"] = {
		ID = 0,
		Type = "Gamepass",

		Func = function(Player, PData)
			local Awards = {
				["Sprout"] = 5,
				["Diamond Egg"] = 1,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},

	["SB"] = {
		ID = 0,
		Type = "Product",

		Content1 = "+13 Tickets \n +1 Pumpkin \n +1 Book \n +5 Sugar \n +3 Caramels",
		Content2 = "",

		Func = function(Player, PData)
			local Awards = {
				["Ticket"] = 13,
				["Pumpkin"] = 1,
				["Book"] = 1,
				["Sugar"] = 5,
				["Caramel"] = 3,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	["SP"] = {
		ID = 0,
		Type = "Product",

		Content1 = "+131 Tickets \n +13 Pumpkins \n +13 Bookы \n +131 Sugar \n +66 Caramels",
		Content2 = "+13 Energy Drinks \n +13 Fertilizer \n +1 Night-Bell \n +13 Firefly Vial",

		Func = function(Player, PData)
			local Awards = {
				["Ticket"] = 13,
				["Pumpkin"] = 1,
				["Book"] = 1,
				["Sugar"] = 5,
				["Caramel"] = 3,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	["SP2"] = {
		ID = 0,
		Type = "Product",

		Content1 = "+666 Tickets \n +13 Pumpkins \n +13 Bookы \n +131 Sugar \n +66 Caramels",
		Content2 = "+13 Energy Drinks \n +13 Fertilizer \n +1 Night-Bell \n +13 Firefly Vial",

		Func = function(Player, PData)
			local Awards = {
				["Ticket"] = 13,
				["Pumpkin"] = 1,
				["Book"] = 1,
				["Sugar"] = 5,
				["Caramel"] = 3,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["BoostBundle"] = {
		ID = 1271138019,
		Type = "Product",

		Func = function(Player, PData)
			
			local Boosts = {
				["Mushroom Field Boost"] = 1,
				["Blue Flowers Field Boost"] = 1,
				["Daisy Field Boost"] = 1,

				["Energy Drink"] = 1,
				["Strawberry Juice"] = 1,
				["Blueberry Juice"] = 1,
				
				["Capacity50"] = 1,
			}
			
			local Items = {
				["Instant Converter"] = 25,
				["Caramel"] = 75,
			}
			
			for i,v in pairs(Boosts) do
				Remotes.Boost:Fire(Player, i, v)
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "Activated "..i.." x"..v
				})
			end

		end,
	},

	["Special1"] = {
		ID = 1296549979,
		Type = "Product",
		String = "+1 Star Cookie \n +500 Instant Converters (or Star Egg and Mythic Egg if you have already bought this bundle)",
		Func = function(Player, PData)

			if not PData.IStats["Special1qwertyuiop"] then
				PData.IStats["Special1qwertyuiop"] = true

				local Awards = {
					["Star Cookie"] = 1,
					["Instant Converter"] = 500,
				}

				for i,v in pairs(Awards) do
					PData.Inventory[i] += v
					if game.Players:FindFirstChild(Player.Name) then
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
					end
					Remotes.AlertClient:FireClient(Player, {
						Color = "Blue",
						Msg = "+"..v.." "..i
					})
				end
			else
				local Awards = {
					["Star Egg"] = 1,
					["Mythic Egg"] = 1,
				}

				for i,v in pairs(Awards) do
					PData.Inventory[i] += v
					if game.Players:FindFirstChild(Player.Name) then
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
					end
					Remotes.AlertClient:FireClient(Player, {
						Color = "Blue",
						Msg = "+"..v.." "..i
					})
				end
			end

		end,
	},

	["Special2"] = {
		ID = 1296550058,
		Type = "Product",
		String = "+1 Bear Bee Egg \n (or 800 Tickets if you have Bear Bee) \n\n limit 1 per player.",
		Func = function(Player, PData)

			if not PData.IStats["Special1qwertyuiopBEAR"] then
				PData.IStats["Special1qwertyuiopBEAR"] = true

				local Awards = {
					["Bear Bee Egg"] = 1,
				}

				for i,v in pairs(Awards) do
					PData.Inventory[i] += v
					if game.Players:FindFirstChild(Player.Name) then
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
					end
					Remotes.AlertClient:FireClient(Player, {
						Color = "Blue",
						Msg = "+"..v.." "..i
					})
				end
			else
				local Awards = {
					["Ticket"] = 800,
				}

				for i,v in pairs(Awards) do
					PData.Inventory[i] += v
					if game.Players:FindFirstChild(Player.Name) then
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
					end
					Remotes.AlertClient:FireClient(Player, {
						Color = "Blue",
						Msg = "+"..v.." "..i
					})
				end
			end

		end,
	},


	["Slot3"] = {
		ID = 1297601789,
		Type = "Product",
		String = "3th Spell Slot",
		Func = function(Player, PData)
			PData.BookSlots[3].Input = true
			PData.BookSlots[3].Buy = false

			PData.BookSlots[4].Input = false
			PData.BookSlots[4].Buy = true

			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"BookSlots", PData.BookSlots})
		end,
	},

	["Slot4"] = {
		ID = 1297630378,
		Type = "Product",
		String = "4th Spell Slot",
		Func = function(Player, PData)
			PData.BookSlots[4].Input = true
			PData.BookSlots[4].Buy = false

			PData.BookSlots[5].Input = false
			PData.BookSlots[5].Buy = true

			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"BookSlots", PData.BookSlots})
		end,
	},

	["Slot5"] = {
		ID = 1297630463,
		Type = "Product",
		String = "5th Spell Slot",
		Func = function(Player, PData)
			PData.BookSlots[5].Input = true
			PData.BookSlots[5].Buy = false

			PData.BookSlots[6].Input = false
			PData.BookSlots[6].Buy = true

			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"BookSlots", PData.BookSlots})
		end,
	},
	
	["Slot6"] = {
		ID = 1297630534,
		Type = "Product",
		String = "6th Spell Slot",
		Func = function(Player, PData)
			PData.BookSlots[6].Input = true
			PData.BookSlots[6].Buy = false

			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"BookSlots", PData.BookSlots})
		end,
	},

	
	
	["x2P"] = {
		ID = 50000000,
		Type = "Gamepass",
		String = "Inf.",
		Func = function(Player, PData)

			if not PData.IStats["x2P"] then
				PData.IStats["x2P"] = true

				Remotes.Boost:Fire(Player, "x2 Pollen from Tools Pass", 1)

				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "Activated x2 Pollen from Tools Pass (inf)"
				})
			end

		end,
	},
	
	
	["x2PFB"] = {
		ID = 50000061,
		Type = "Gamepass",
		String = "Inf.",
		Func = function(Player, PData)

			if not PData.IStats["x2PFB"] then
				PData.IStats["x2PFB"] = true

				Remotes.Boost:Fire(Player, "x2 Pollen from Bees Pass", 1)

				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "Activated x2 Pollen from Bees Pass (inf)"
				})
			end

		end,
	},
	
	["x2CR"] = {
		ID = 49998955,
		Type = "Gamepass",
		String = "Inf.",
		Func = function(Player, PData)

			if not PData.IStats["x2CR"] then
				PData.IStats["x2CR"] = true

				Remotes.Boost:Fire(Player, "x2 Convert Rate Pass", 1)

				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "Activated x2 Convert Rate Pass (inf)"
				})
			end

		end,
	},
	
	["Sprout"] = {
		ID = 1258240826,
		Type = "Product",
		String = "+1 Sprout",
		Func = function(Player, PData)
			local Awards = {
				["Sprout"] = 1,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["HoneyP"] = {
		ID = 0,
		Type = "Product",

		Func = function(Player, PData)
			PData.IStats.Honey += 5500000
			PData.IStats.TotalHoney += 5500000
			PData.IStats["DailyHoney"] += 5500000
		end,
	},
	
	["Golden Egg"] = {
		ID = 1258352670,
		Type = "Product",
		String = "+1 Golden Egg",
		Func = function(Player, PData)
			local Awards = {
				["Golden Egg"] = 1,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["Star Egg"] = {
		ID = 1286928572 ,
		Type = "Product",
		String = "+1 Star Egg",
		Func = function(Player, PData)
			local Awards = {
				["Star Egg"] = 1,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["Silver Egg"] = {
		ID = 1286926969 ,
		Type = "Product",
		String = "+1 Silver Egg",

		Func = function(Player, PData)
			local Awards = {
				["Silver Egg"] = 1,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["Diamond Egg"] = {
		ID = 1258352816,
		Type = "Product",
		String = "+1 Diamond Egg",
		Func = function(Player, PData)
			local Awards = {
				["Diamond Egg"] = 1,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["Epic Sprout"] = {
		ID = 1258352432,
		Type = "Product",
		String = "+1 Epic Sprout",
		Func = function(Player, PData)
			local Awards = {
				["Epic Sprout"] = 1,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["Legendary Sprout"] = {
		ID = 1258352560,
		Type = "Product",
		String = "+1 Legendary Sprout",
		Func = function(Player, PData)
			local Awards = {
				["Legendary Sprout"] = 1,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["3 Sprouts"] = {
		ID = 1286908641 ,
		Type = "Product",
		String = "+3 Sprouts",
		Func = function(Player, PData)
			local Awards = {
				["Sprout"] = 3,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["Ticket"] = {
		ID = 1286910209,
		Type = "Product",
		String = "+1 Ticket",
		Func = function(Player, PData)
			local Awards = {
				["Ticket"] = 1,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["Ticket 10"] = {
		ID = 1258240381,
		Type = "Product",
		String = "+10 Tickets",
		Func = function(Player, PData)
			local Awards = {
				["Ticket"] = 10,
			}
			for i,v in pairs(Awards) do
				print(PData)
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["Ticket 100"] = {
		ID = 1258240382,
		Type = "Product",
		String = "+100 Tickets",
		Func = function(Player, PData)
			local Awards = {
				["Ticket"] = 100,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["Ticket 500"] = {
		ID = 1258240865,
		Type = "Product",
		String = "+500 Tickets",
		Func = function(Player, PData)
			local Awards = {
				["Ticket"] = 500,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["Ticket 1000"] = {
		ID = 1258240825,
		Type = "Product",
		String = "+1,000 Tickets",
		Func = function(Player, PData)
			local Awards = {
				["Ticket"] = 1000,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["Bear Pack"] = {
		ID = 40341207,
		Type = "Gamepass",

		Func = function(Player, PData)
			local Awards = {
				["Bear Bee Egg"] = 1,
				["Ticket"] = 100,
				["Spoiled Cookie"] = 1,
				["Cookie"] = 500,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
--	["Fast Pack"] = {
--		ID = 39003900,
--		Type = "Gamepass",
--
	--	Func = function(Player, PData)
	--		PData.IStats.Honey += 650000
	--		PData.IStats.TotalHoney += 650000
	--		local Awards = {
	--			["Diamond Egg"] = 3,
	--			["Golden Egg"] = 3,
	--			["Ticket"] = 2000,
	--			["Energy Drink"] = 30,
	--			["Strawberry Juice"] = 10,
	--			["Blueberry Juice"] = 10,
	--			["Epic Sprout"] = 10,
	--			["Sprout"] = 30,
	--			["Rare Sprout"] = 15,
	--			["Legendary Sprout"] = 3,
	--			["Ticket Sprout"] = 1,
	--			["Royal Jelly"] = 2000,
	--			["Sugar"] = 500,
	--			["Spoiled Cookie"] = 50,
	--			["Strawberry"] = 500,
	--			["Seed"] = 500,
	--			["Blueberry"] = 500,
	--		}
	--		for i,v in pairs(Awards) do
	--			PData.Inventory[i] += v
	--			Remotes.AlertClient:FireClient(Player, {
	--				Color = "Blue",
	--				Msg = "+"..v.." "..i
	--			})
	--		end
	--	end,
	--},
	["Showdown Pack"] = {
		ID = 39185830,
		Type = "Gamepass",

		Func = function(Player, PData)
			PData.IStats.Honey += 500000
			PData.IStats.TotalHoney += 500000
			PData.IStats["DailyHoney"] += 500000

			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
			end
			local Awards = {
				["Diamond Egg"] = 1,
				["Golden Egg"] = 2,
				["Ticket"] = 500,
				["Legendary Sprout"] = 5,
				["Sprout"] = 15,
				["Royal Jelly"] = 150,
				["Strawberry"] =  1000,
				["Blueberry"] = 1000,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["SummerPack1"] = {
		ID = 1270011376,
		Type = "Product",

		Func = function(Player, PData)
			PData.IStats.Honey += 10000
			PData.IStats.TotalHoney += 10000
			PData.Badges.Honey.Amount += 10000

			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Badges", PData.Badges})
			end
			local Awards = {
				["Spoiled Cookie"] = 1,
				["Ticket"] = 50,
				["Seed"] = 50,
				["Strawberry"] =  50,
				["Blueberry"] = 50,
				["Energy Drink"] = 1,
				["Sprout"] = 1,
				["Royal Jelly"] = 10,
				["Cookie"] = 50,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["SummerPack2"] = {
		ID = 1270011690,
		Type = "Product",

		Func = function(Player, PData)
			PData.IStats.Honey += 150000
			PData.IStats.TotalHoney += 150000
			PData.Badges.Honey.Amount += 150000

			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Badges", PData.Badges})
			end
			local Awards = {
				["Ticket"] = 150,
				["Energy Drink"] = 3,
				["Caramel Bottle"] = 1,
				["Butter"] = 1,
				["Rare Sprout"] = 1,
				["Royal Jelly"] = 50,
				["Silver Egg"] = 1,
				["Instant Converter"] = 2,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["SummerPack3"] = {
		ID = 1270011820,
		Type = "Product",

		Func = function(Player, PData)
			PData.IStats.Honey += 500000
			PData.IStats.TotalHoney += 500000
			PData.Badges.Honey.Amount += 500000

			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Badges", PData.Badges})
			end
			local Awards = {
				["Ticket"] = 250,
				["Energy Drink"] = 10,
				["Caramel Bottle"] = 10,
				["Strawberry Juice"] = 10,
				["Blueberry Juice"] = 10,
				["Butter"] = 5,
				["Epic Sprout"] = 5,
				["Royal Jelly"] = 150,
				["Golden Egg"] = 1,
				["Instant Converter"] = 5,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["SummerPack4"] = {
		ID = 1270011514,
		Type = "Product",

		Func = function(Player, PData)

			local Awards = {
				["Ticket"] = 100,
				["Queen Bee Jelly"] = 1,
				["Hardworker Bee Jelly"] = 1,
				["Bumble Bee Jelly"] = 1,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["SummerPack5"] = {
		ID = 1270011962,
		Type = "Product",

		Func = function(Player, PData)
			PData.IStats.Honey += 1500000
			PData.IStats.TotalHoney += 1500000
			PData.Badges.Honey.Amount += 1500000

			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Badges", PData.Badges})
			end
			local Awards = {
				["Ticket"] = 500,
				["Instant Converter"] = 15,
				["Diamond Egg"] = 1,
				["Caramel Bottle"] = 20,
				["Butter"] = 20,
				["Sprout"] = 15,
				["Legendary Sprout"] = 3,
				["Royal Jelly"] = 500,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["SummerPack6"] = {
		ID = 1270012047,
		Type = "Product",

		Func = function(Player, PData)
			PData.IStats.Honey += 3500000
			PData.IStats.TotalHoney += 3500000
			PData.Badges.Honey.Amount += 3500000

			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Badges", PData.Badges})
			end
			local Awards = {
				["Ticket"] = 1000,
				["Instant Converter"] = 25,
				["Diamond Egg"] = 1,
				["Golden Egg"] = 1,
				["Caramel Bottle"] = 35,
				["Butter"] = 55,
				["Strawberry Juice"] = 75,
				["Blueberry Juice"] = 75,
				["Energy Drink"] = 55,
				["Cookie"] = 10000,
				["Royal Jelly"] = 1000,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},

	["SummerPack7"] = {
		ID = 1270523321,
		Type = "Product",

		Func = function(Player, PData)
			PData.IStats.Honey += 10000000
			PData.IStats.TotalHoney += 10000000
			PData.Badges.Honey.Amount += 10000000

			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Badges", PData.Badges})
			end
			local Awards = {
				["Ticket"] = 2250,
				["Instant Converter"] = 50,
				["Diamond Egg"] = 3,
				["Golden Egg"] = 3,
				["Caramel Bottle"] = 50,
				["Butter"] = 50,
				["Strawberry Juice"] = 50,
				["Blueberry Juice"] = 50,
				["Energy Drink"] = 75,
				["Caramel"] = 2500,
				["Cookie"] = 50000,
				["Epic Sprout"] = 10,
				["Legendary Sprout"] = 10,
				["Rare Sprout"] = 10,
				["Sprout"] = 50,
				["Royal Jelly"] = 3000,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},	
	

	["MythP1"] = {
		ID = 1290501532,
		Type = "Product",
		String = "+25.000 Honey \n +1 Instant Converter \n +50 Tickets \n +3 Energy Drinks \n +50 Strawberries \n +50 Blueberries \n +5 Sprouts \n +10 Royal Jelly \n +1 Gifted Royal Jelly",
		Func = function(Player, PData)
			PData.IStats.Honey += 25000
			PData.IStats.TotalHoney += 25000
			PData.Badges.Honey.Amount += 25000

			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Badges", PData.Badges})
			end
			local Awards = {
				["Ticket"] = 50,
				["Instant Converter"] = 1,
				["Strawberry"] = 50,
				["Blueberry"] = 50,
				["Energy Drink"] = 3,
				["Sprout"] = 5,
				["Royal Jelly"] = 10,
				["Gifted Jelly"] = 1,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	["MythP2"] = {
		ID = 1290629384,
		Type = "Product",
		String = "+150.000 Honey \n +1 Silver Egg \n +150 Tickets \n +7 Energy Drinks \n +1 Night-Bell \n +3 Fertilizer \n +3 Rare Sprouts \n +3 Gifted Royal Jelly",
		Func = function(Player, PData)
			PData.IStats.Honey += 150000
			PData.IStats.TotalHoney += 150000
			PData.Badges.Honey.Amount += 150000

			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Badges", PData.Badges})
			end
			local Awards = {
				["Ticket"] = 150,
				["Silver Egg"] = 1,
				["Fertilizer"] = 3,
				["Night-Bell"] = 1,
				["Energy Drink"] = 7,
				["Rare Sprout"] = 3,
				["Gifted Jelly"] = 3,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	["MythP3"] = {
		ID = 1290629619,
		Type = "Product",
		String = "+500.000 Honey \n +15 Instant Converter \n +400 Tickets \n +15 Energy Drinks \n +15 Caramel Bottle \n +15 Butter \n +5 Fertilizer \n +15 Sprouts \n +5 Gifted Royal Jelly",
		Func = function(Player, PData)
			PData.IStats.Honey += 150000
			PData.IStats.TotalHoney += 150000
			PData.Badges.Honey.Amount += 150000

			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Badges", PData.Badges})
			end
			local Awards = {
				["Ticket"] = 400,
				["Instant Converter"] = 15,
				["Fertilizer"] = 5,
				["Energy Drink"] = 15,
				["Caramel Bottle"] = 15,
				["Butter"] = 15,
				["Sprout"] = 15,
				["Gifted Jelly"] = 5,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	["MythP4"] = {
		ID = 1290635313,
		Type = "Product",
		String = "+1.000.000 Honey \n +25 Instant Converters \n +750 Tickets \n +100 Firefly Vials \n +1 Night-Bell \n +1,000 Caramels \n +1 Diamond Egg \n +5 Epic Sprouts \n +30 Fertilizer",
		Func = function(Player, PData)
			PData.IStats.Honey += 1000000
			PData.IStats.TotalHoney += 1000000
			PData.Badges.Honey.Amount += 1000000

			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Badges", PData.Badges})
			end
			local Awards = {
				["Ticket"] = 750,
				["Instant Converter"] = 25,
				["Firefly Vial"] = 100,
				["Night-Bell"] = 1,
				["Caramel"] = 1000,
				["Diamond Egg"] = 1,
				["Fertilizer"] = 30,
				["Epic Sprout"] = 5,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	["MythP5"] = {
		ID = 1290643100,
		Type = "Product",
		String = "+1 Star Egg \n +50 Instant Converters \n +1,250 Tickets \n +50 Butters \n +50 Energy Drinks \n +50 Fertilizer \n +10 Gifted Jellies \n +5 Legendary Sprouts",
		Func = function(Player, PData)
			local Awards = {
				["Ticket"] = 1250,
				["Instant Converter"] = 50,
				["Butter"] = 50,
				["Energy Drink"] = 50,
				["Star Egg"] = 1,
				["Fertilizer"] = 50,
				["Legendary Sprout"] = 5,
				["Gifted Jelly"] = 10,
				["Bee-Pass"] = 1,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	["MythP6"] = {
		ID = 1290691403,
		Type = "Product",
		String = "+1 Gifted Silver Egg \n +1 Gifted Golden Egg \n +1 Gifted Diamond Egg \n +1 Gifted Mythic Egg \n +80 Instant Converters \n +1,900 Tickets \n +80 Butters \n +80 Energy Drinks \n +80 Strawberry Juice \n +80 Blueberry Juice  \n +80 Fertilizer \n +20 Gifted Jellies \n +10 Legendary Sprouts \n +100 Sprouts",
		Func = function(Player, PData)
			local Awards = {
				["Ticket"] = 1900,
				["Gifted Silver Egg"] = 1,
				["Gifted Golden Egg"] = 1,
				["Gifted Diamond Egg"] = 1,
				["Gifted Mythic Egg"] = 1,
				["Instant Converter"] = 80,
				["Butter"] = 80,
				["Energy Drink"] = 80,
				["Strawberry Juice"] = 80,
				["Blueberry Juice"] = 80,
				["Fertilizer"] = 80,
				["Legendary Sprout"] = 10,
				["Sprout"] = 100,
				["Night-Bell"] = 5,
				["Gifted Jelly"] = 20,
				["Bee-Pass"] = 1,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["410MHGHO"] = {
		ID = 0000,
		Type = "Gamepass",

		Func = function(Player, PData)
			PData.IStats.Honey += 410000000
			PData.IStats.TotalHoney += 410000000
			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
			end
			Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "+410,000,000 Honey"
			})
		end,
	},
	["test"] = {
		ID = 1,
		Type = "Gamepass",

		Func = function(Player, PData)
			PData.IStats.Honey += 500000000000
			PData.IStats.TotalHoney += 500000000000
			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
			end
			Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "+500,000,000,000 Honey"
			})
		end,
	},
	["Glided Pack"] = {
		ID = 39187530,
		Type = "Gamepass",

		Func = function(Player, PData)
			PData.IStats.Honey += 100000
			PData.IStats.TotalHoney += 100000
			PData.IStats["DailyHoney"] += 100000
			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
			end
			local Awards = {
				["Golden Egg"] = 1,
				["Ticket"] = 300,
				["Epic Sprout"] = 5,
				["Strawberry Juice"] = 3,
				["Blueberry Juice"] = 3,
				["Royal Jelly"] = 80,
				["Caramel"] = 100,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	["Harvest Pack"] = {
		ID = 39187675,
		Type = "Gamepass",

		Func = function(Player, PData)
			PData.IStats.Honey += 25000
			PData.IStats.TotalHoney += 25000
			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
			end
			PData.IStats["DailyHoney"] += 25000
			local Awards = {
				["Silver Egg"] = 1,
				["Ticket"] = 100,
				["Energy Drink"] = 3,
				["Sprout"] = 10,
				["Sugar"] = 50,
				["Royal Jelly"] = 10,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["Caramel1Tier"] = {
		ID = 1260356808,
		Type = "Product",

		Func = function(Player, PData)
			PData.IStats.Honey += 500000
			PData.IStats.TotalHoney += 500000
			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
			end
			PData.IStats["DailyHoney"] += 500000
			local Awards = {
				["Caramel"] = 100,
				["Sugar"] = 250,
				["Sprout"] = 5,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["Caramel2Tier"] = {
		ID = 1260356847,
		Type = "Product",

		Func = function(Player, PData)
			PData.IStats.Honey += 1000000
			PData.IStats.TotalHoney += 1000000
			PData.IStats["DailyHoney"] += 1000000
			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
			end
			local Awards = {
				["Rare Sprout"] = 1,
				["Royal Jelly"] = 100,
				["Firefly Vial"] = 35,
				["Ticket"] = 100,
				["Golden Egg"] = 1,
				["Strawberry"] = 250,
				["Blueberry"] = 250,
				["Seed"] = 250,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["Caramel3Tier"] = {
		ID = 1260356880,
		Type = "Product",

		Func = function(Player, PData)
			PData.IStats.Honey += 2000000
			PData.IStats.TotalHoney += 2000000
			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
			end
			PData.IStats["DailyHoney"] += 2000000
			local Awards = {
				["Caramel"] = 300,
				["Sugar"] = 500,
				["Legendary Sprout"] = 1,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	
	["Caramel4Tier"] = {
		ID = 1260356908,
		Type = "Product",

		Func = function(Player, PData)
			PData.IStats.Honey += 2500000
			PData.IStats.TotalHoney += 2500000
			PData.IStats["DailyHoney"] += 2500000
			if game.Players:FindFirstChild(Player.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
			end
			local Awards = {
				["Caramel"] = 50,
				["Sugar"] = 250,
				["Legendary Sprout"] = 10,
				["Royal Jelly"] = 1000,
				["Sprout"] = 30,
				["Firefly Vial"] = 100,
				["Ticket"] = 1000,
				["Diamond Egg"] = 1,
			}
			for i,v in pairs(Awards) do
				PData.Inventory[i] += v
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", i, PData.Inventory[i]})
				end
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..v.." "..i
				})
			end
		end,
	},
	--["Eggs Bundle"] = {
	--	ID = 39187856,
	--	Type = "Gamepass",

	--	Func = function(Player, PData)
	--		PData.Inventory["Basic Egg"] += 1
	--		PData.Inventory["Silver Egg"] += 1
	--		PData.Inventory["Golden Egg"] += 1
	--		PData.Inventory["Diamond Egg"] += 1
	--	end,
	--},
}

return module
