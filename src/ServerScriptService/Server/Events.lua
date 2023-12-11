local Remotes = game.ReplicatedStorage.Remotes
local Data = require(game.ServerScriptService.Server.Data)
local Items = require(game.ReplicatedStorage.Modules.Items)
local owners = {"1223182303", "2263740947"}
local HiveDebounce = false
local Utils = require(game.ReplicatedStorage.Modules.Utils)
local GetRealStats = require(game.ServerScriptService.Functions.GetRealStats)
local PopUp = require(game.ReplicatedStorage.Modules.Guis.PopUp)
local HivesManager = require(game.ReplicatedStorage.Modules.Guis.HivesManager)

local Events = {} do
	local function find(tab,itm)
		for i,v in pairs(tab) do
			if v == itm then
				return v
			end
		end
	end
	
	function RandomBee(Item, Player)
		if Item ~= "Star Egg" then
			local Data = require(game.ReplicatedStorage.Modules.Eggs).Eggs[Item]
			local TotalWeight = 0
		
			for i,v in pairs(Data) do
				TotalWeight += v.Rarity
			end
			local Chance = math.random(1, TotalWeight)
			local coun = 0
			for i,v in pairs(Data) do
				coun += v.Rarity
				if coun >= Chance then
					local Chance2 = math.random(1,250)
					if string.find(Item, "Gifted") then
						v.Gifted = true
						Remotes.SSound:FireClient(Player, "GiftedBee" ,1,true)
					end
					if Chance2 <= 1 then
						v.Gifted = true
						Remotes.SSound:FireClient(Player, "GiftedBee" ,1,true)
						return v
					else
						return v
					end
				end
			end
		else
			local BData = require(game.ReplicatedStorage.Modules.Eggs).Eggs["Basic Egg"]
			local PData = Data:Get(Player)
			local TotalWeight = 0
			
			local coun = 0
			local BlackList = {}
			
			for b,d in pairs(PData.Bees) do
				if d.BeeName ~= "" and not BlackList[d.BeeName] and d.Gifted then
					BlackList[d.BeeName] = d.BeeName
				end
			end
			
			for i,v in pairs(BData) do
				if not table.find(BlackList, v.Name) then
					TotalWeight += v.Rarity
				end
			end
			
			if TotalWeight > 0 then
			local Chance = math.random(1, TotalWeight)
			
			for i,v in pairs(BData) do
				if not table.find(BlackList, v.Name) then
				coun += v.Rarity
				if coun >= Chance then
					v.Gifted = true
					Remotes.SSound:FireClient(Player, "GiftedBee" ,1,true)
					return v
					end
				end
				end
			else
				Remotes.AlertClient:FireClient(Player, {
					Color = "Red",
					Msg = "You Already have all Gifted Bees!"
				})
			end
		end
	end
	
	function GetHiveOwner(UI, UI2, Client, PData)
		UI.TextLabel1.Text = Client.Name
		UI2.TextLabel1.Text = Client.Name
	end

	function CheckMagnitude(Client, Platform)
		if (Platform.Position-Client.Character:GetPrimaryPartCFrame().Position) then
			print("FFF")
			return true
		end
		return false
	end

	function QuestRoad(Client, PData, Dis)
		for _, NPC in pairs(PData.Quests2) do
			for i, Task in pairs(NPC) do
				if Task.Type == "UseDispenser" then
					if Dis == Task.Dispenser then
						NPC[i].StartAmount += 1
						if NPC[i].StartAmount >= NPC[i].NeedAmount then
							NPC[i].StartAmount = NPC[i].NeedAmount
						end
					end
				end
			end
			if game.Players:FindFirstChild(Client.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Quests2", PData.Quests2})
			end
		end
	end
	
	Remotes.OpenFoodGui.OnServerEvent:Connect(function(Player, Treat)
		Remotes.OpenFoodGui:FireClient(Player, Treat)
	end)
	
	Remotes.OpenCraftGui.OnServerEvent:Connect(function(Player, A)
		Remotes.OpenCraftGui:FireClient(Player, A)
	end)
	
	Remotes.UseCode2.OnServerEvent:Connect(function(plr, CodePlayer)
		local Code = CodePlayer
		local PData = Data:Get(plr)
		
		local Codes444 = {
			["53VYVQ1M8PJW"] = {
				Name = "53VYVQ1M8PJW",
				{"Inventory", "Ticket", 25},
			},
			["V6EOCZAST9G3"] = {
				Name = "V6EOCZAST9G3",
				{"Inventory", "Ticket", 25},
			},
			["J3GIZIVXCVKV"] = {
				Name = "J3GIZIVXCVKV",
				{"Inventory", "Ticket", 25},
			},
			["OZCESTLWG1XR"] = {
				Name = "OZCESTLWG1XR",
				{"Inventory", "Ticket", 25},
			},
			["ITWZRL6MF11V"] = {
				Name = "ITWZRL6MF11V",
				{"Inventory", "Ticket", 25},
			},
			["G6SQNH2W978M"] = {
				Name = "G6SQNH2W978M",
				{"Inventory", "Ticket", 25},
			},
			["WTSHJP1G9HDG"] = {
				Name = "WTSHJP1G9HDG",
				{"Inventory", "Ticket", 25},
			},
			["1TEE1DTF7FE7"] = {
				Name = "1TEE1DTF7FE7",
				{"Inventory", "Ticket", 25},
			},
			["JIFJABF2QN2Y"] = {
				Name = "JIFJABF2QN2Y",
				{"Inventory", "Ticket", 25},
			},
			["K8M6DQVS9XP6"] = {
				Name = "K8M6DQVS9XP6",
				{"Inventory", "Ticket", 25},
			},
			
			--100

			["L181IH95HCM3"] = {
				Name = "L181IH95HCM3",
				{"Inventory", "Ticket", 100},
			},
			["IMY4G5VF7YQB"] = {
				Name = "IMY4G5VF7YQB",
				{"Inventory", "Ticket", 100},
			},
			["OUX35VLX7748"] = {
				Name = "OUX35VLX7748",
				{"Inventory", "Ticket", 100},
			},
			["W9OXZQ0TVON3"] = {
				Name = "W9OXZQ0TVON3",
				{"Inventory", "Ticket", 100},
			},
			["MTHW7XSGTKHO"] = {
				Name = "MTHW7XSGTKHO",
				{"Inventory", "Ticket", 100},
			},
			["P9QGVT3K3NBZ"] = {
				Name = "P9QGVT3K3NBZ",
				{"Inventory", "Ticket", 100},
			},
			["RT9RCTS8IELB"] = {
				Name = "RT9RCTS8IELB",
				{"Inventory", "Ticket", 100},
			},
			["VEZ97JFFQY4O"] = {
				Name = "VEZ97JFFQY4O",
				{"Inventory", "Ticket", 100},
			},
			["5YUY17RSZD4F"] = {
				Name = "5YUY17RSZD4F",
				{"Inventory", "Ticket", 100},
			},
			["NE39FEDV90KM"] = {
				Name = "NE39FEDV90KM",
				{"Inventory", "Ticket", 100},
			},
			
			--500

			["QDASLLS5BYG8"] = {
				Name = "QDASLLS5BYG8",
				{"Inventory", "Ticket", 500},
			},
			["J1LN7GTHS6Q8"] = {
				Name = "J1LN7GTHS6Q8",
				{"Inventory", "Ticket", 500},
			},
			["AKKQO3CROK2C"] = {
				Name = "AKKQO3CROK2C",
				{"Inventory", "Ticket", 500},
			},
			["ITBNHEVSPP1B"] = {
				Name = "ITBNHEVSPP1B",
				{"Inventory", "Ticket", 500},
			},
			["2W5G61B95UOD"] = {
				Name = "2W5G61B95UOD",
				{"Inventory", "Ticket", 500},
			},
			["HUOF7YMYYLEG"] = {
				Name = "HUOF7YMYYLEG",
				{"Inventory", "Ticket", 500},
			},
			["G6I2YLZYPSUI"] = {
				Name = "G6I2YLZYPSUI",
				{"Inventory", "Ticket", 500},
			},
			["KPP0B2J9P4GA"] = {
				Name = "KPP0B2J9P4GA",
				{"Inventory", "Ticket", 500},
			},
			["45K9ASKYTK99"] = {
				Name = "45K9ASKYTK99",
				{"Inventory", "Ticket", 500},
			},
			["L235ACJC7NNF"] = {
				Name = "L235ACJC7NNF",
				{"Inventory", "Ticket", 500},
			},
		}
		
		local Codes = {
			G53VYVQ1M8PJW = {
				Am = 1,
				Name = "G53VYVQ1M8PJW",
				Func = function(plr, PData)
					Remotes.AlertClient:FireClient(plr, {
						Color = "Blue",
						Msg = "Test"
					})
				end,
			}
		}
		
		if Codes[Code] and not PData.Codes[Code] then
			PData.Codes[Code] = true
			Remotes.AlertClient:FireClient(plr, {
				Color = "Blue",
				Msg = "Redeemed Promo-code ''"..Codes[Code].Name.."''"
			})
			Remotes.AlertClient:FireClient(plr, {
				Color = "Blue",
				Msg = "Something's going on..."
			})
			Codes[Code].Func(plr, PData)
		else
			if not Codes[Code] then
				Remotes.AlertClient:FireClient(plr, {
					Color = "Red",
					Msg = "Code Invalid"
				})
			elseif Codes[Code] and PData.Codes[Codes[Code].Name] then
				Remotes.AlertClient:FireClient(plr, {
					Color = "Red",
					Msg = "The code has already been redeemed"
				})
			end
		end
	end)
	
	Remotes.UseCode.OnServerEvent:Connect(function(plr, CodePlayer)
		local Code = CodePlayer
		local PData = Data:Get(plr)
		local Codes = {
			["advertise"] = {
				Name = "Advertise",
				{"Boost", "Daisy Field Boost", 2},
				{"Boost", "Mushroom Field Boost", 2},
				{"Boost", "Blue Flowers Field Boost", 2},
				{"Boost", "Energy Drink", 1},
				{"Boost", "Blueberry Juice", 1},
				{"Boost", "Strawberry Juice", 1},
				{"IStats", "Honey", 5000},
				{"Boost", "Haste", 10},
				{"Inventory", "Ticket", 5},
				{"Inventory", "Strawberry", 3},
				{"Inventory", "Blueberry", 3},
				{"Inventory", "Seed", 3},
				{"Inventory", "Royal Jelly", 5},
				{"Inventory", "Sprout", 1},
				{"Inventory", "Sugar", 10},
				{"Inventory", "Caramel", 5},
			},
			["123321"] = {
				Name = "123321",
				{"IStats", "Honey", 123},
				{"Inventory", "Sugar", 32},
				{"Inventory", "Caramel", 12},
				{"Inventory", "Energy Drink", 3},
				{"Inventory", "Caramel Bottle", 2},
				{"Inventory", "Epic Sprout", 1},
			},
			
			["25429"] = {
				Name = "25429",
				{"IStats", "Honey", 1000},
				{"Inventory", "Ticket", 5},
			},
			["updatesoon"] = {
				Name = "UpdateSoon",
				{"IStats", "Honey", 7},
				{"IStats", "Honey", 7},
				{"IStats", "Honey", 7},
				{"Inventory", "Ticket", 7},
				{"Inventory", "Basic Egg", 1},
				{"Inventory", "Gifted Jelly", 1},
				{"Inventory", "Night-Bell", 1},
				{"Inventory", "Book", 7},
				{"Boost", "Firefly Vial", 7},
				{"Boost", "Haste", 7},
				{"Boost", "Support", 1},
				{"Boost", "Fenix Blessing", 1},
				{"Boost", "Star-Talent", 8},
				{"Boost", "Bee Speed", 1},
				{"Boost", "Brown Bear Morph", 1},
				{"Boost", "Black Bear Morph", 1},
				{"Boost", "Resin Bear Morph", 1},
				{"Boost", "Cumback Boost", 1},
				{"Boost", "Bubble Boost", 7},
				{"Boost", "Clover Field Boost", 7},
				{"Boost", "Dandelion Field Boost", 7},
				{"Boost", "Blue Flowers Field Boost", 7},
				{"Boost", "Daisy Field Boost", 7},
				{"Boost", "Mushroom Field Boost", 7},
				{"Boost", "Strawberry Field Boost", 7},
				{"Inventory", "Caramel", 77},
				{"Inventory", "Ticket", 7},
				{"Inventory", "Instant Converter", 7},
				{"Inventory", "Instant Converter", 7},
				{"IStats", "Honey", 777},
				{"IStats", "Honey", 777},
				{"IStats", "Honey", 777},
				{"IStats", "Honey", 777},
			},
			["4kfavorites"] = {
				Name = "4KFavorites",
				{"IStats", "Honey", 15000},
				{"Inventory", "Ticket", 15},
				{"Inventory", "Butter", 5},
				{"Inventory", "Instant Converter", 3},
				{"Boost", "Capacity Boost", 1},
				{"Inventory", "Sugar", 25},
				{"Inventory", "Caramel", 15},
			},
			["bananagames"] = {
				Name = "BananaGames",
				{"IStats", "Honey", 1202},
				{"Inventory", "Ticket", 7},
				{"Inventory", "Golden Egg", 1},
				{"Inventory", "Instant Converter", 3},
				{"Inventory", "Hardworker Bee Jelly", 1},
				{"Boost", "Bear Morph", 1},
				{"Boost", "Butter", 1},
				{"Boost", "Caramel Bottle", 1},
				{"Boost", "Energy Drink", 1},
				{"Boost", "Firefly Vial", 10},
			},
			["rebootsx"] = {
				Name = "RebootsX",
				{"IStats", "Honey", 1},
				{"Inventory", "Ticket", 3},
				{"Inventory", "Instant Converter", 3},
				{"Boost", "Clover Field Boost", 3},
			},
			["kostyapaupau"] = {
				Name = "kostyapaupau",
				{"IStats", "Honey", 1313},
				{"Inventory", "Ticket", 3},
				{"Inventory", "Royal Jelly", 3},
				{"Inventory", "Sprout", 1},
				{"Inventory", "Sugar", 3},
				{"Inventory", "Caramel", 3},
				{"Inventory", "Strawberry", 3},
				{"Inventory", "Blueberry", 3},
				{"Inventory", "Seed", 3},
				{"Inventory", "Spoiled Cookie", 3},
				{"Inventory", "Cookie", 67},
				{"Inventory", "Firefly Vial", 1},
				{"Inventory", "Epic Sprout", 1},
				{"Boost", "Firefly Vial", 3},
				{"Boost", "Daisy Field Boost", 1},
				{"Boost", "Mushroom Field Boost", 1},
				{"Boost", "Energy Drink", 1},
			},
			["freediamondegg"] = {
				Name = "FreeDiamondEgg",
				{"Inventory", "Diamond Egg", 1},
			},
			["95151"] = {
				Name = "95151",
				{"IStats", "Honey", 1000},
				{"Inventory", "Ticket", 5},
			},
			["beesjourneyweekends"] = {
				Name = "BeesJourneyWeekends",
				{"Inventory", "Strawberry", 1},
				{"Inventory", "Blueberry", 1},
				{"Inventory", "Seed", 1},
				{"Boost", "Sunflower Field Boost", 1},
				{"Boost", "Haste", 10},
				{"Boost", "Bee Speed", 1},
				{"Boost", "Cactus Field Boost", 1},
			},
			["thousands"] = {
				Name = "Thousands",
				{"IStats", "Honey", 1000},
				{"Inventory", "Ticket", 5},
				{"Inventory", "Strawberry", 5},
			},
			["frenzycaramel"] = {
				Name = "FrenzyCaramel",
				{"Boost", "Cactus Field Boost", 2},
				{"Inventory", "Caramel", 5},
				{"Inventory", "Sugar", 15},
				{"IStats", "Honey", 5000},
				{"IStats", "Pollen", 1},
				{"Inventory", "Ticket", 5},
			},
			["hyped"] = {
				Name = "Hyped",
				{"Inventory", "Sugar", 15},
				{"IStats", "Honey", 1500},
				{"Inventory", "Ticket", 5},
			},
			["fenixyojorney"] = {
				Name = "FenixYoJorney",
				{"Inventory", "Sugar", 33},
				{"Inventory", "Caramel", 11},
				{"Inventory", "Golden Egg", 1},
				{"IStats", "Honey", 2424},
				{"IStats", "Capacity", 100},
				{"Inventory", "Ticket", 11},
				{"Inventory", "Royal Jelly", 11},
				{"Inventory", "Seed", 4},
				{"Inventory", "Strawberry", 5},
				{"Inventory", "Blueberry", 6},
				{"Boost", "Haste", 3},
				{"Boost", "Energy Drink", 1},
				{"Boost", "Mushroom Field Boost", 2},
				{"Boost", "Cactus Field Boost", 2},
			},
			["291511501"] = {
				Name = "291511501",
				{"Inventory", "Sprout", 1},
			},
			["freemythic"] = {
				Name = "FreeMythic",
				{"Inventory", "Mythic Egg", 1},
			},
			["100kvisits"] = {
				Name = "100KVisits",
				{"Boost", "Daisy Field Boost", 3},
				{"Boost", "Blueflowers Field Boost", 2},
				{"Boost", "Strawberry Field Boost", 2},
				{"Boost", "Celebrate Event", 1},
				{"Boost", "Haste", 5},
				{"Boost", "Strawberry Juice", 1},
				{"Boost", "Blueberry Juice", 1},
				{"Boost", "Bear Morph", 1},
				{"Boost", "Butter", 1},
				{"Inventory", "Sugar", 100},
				{"Inventory", "Caramel", 3},
				{"IStats", "Honey", 100},
				{"Inventory", "Ticket", 10},
				{"Inventory", "Royal Jelly", 5},
				{"Inventory", "Caramel Bottle", 1},
				{"Inventory", "Seed", 1},
				{"Inventory", "Strawberry", 2},
				{"Inventory", "Blueberry", 3},
				{"Inventory", "Instant Converter", 5},
			},
			["summervibe"] = {
				Name = "SummerVibe",
				{"Boost", "Sunflower Field Boost", 1},
				{"Boost", "Haste", 5},
				{"Inventory", "Sugar", 100},
				{"IStats", "Honey", 100},
				{"Inventory", "Ticket", 5},
				{"Inventory", "Royal Jelly", 5},
				{"Inventory", "Butter", 1},
				{"Inventory", "Instant Converter", 1},
			},
			["ichaos1b"] = {
				Name = "iChaos1B",
				{"Boost", "Sunflower Field Boost", 3},
				{"Boost", "Mushroom Field Boost", 3},
				{"Boost", "Clover Field Boost", 3},
				{"Boost", "Strawberry Juice", 1},
				{"Boost", "Blueberry Juice", 1},
				{"Boost", "Support", 1},
				{"Boost", "Haste", 10},
				{"Inventory", "Sugar", 2},
				{"IStats", "Honey", 100},
				{"Inventory", "Ticket", 10},
				{"Inventory", "Royal Jelly", 5},
				{"Inventory", "Butter", 1},
				{"Inventory", "Caramel Bottle", 1},
				{"Inventory", "Instant Converter", 3},
			},
			["group3k"] = {
				Name = "Group3K",
				{"Boost", "Clover Field Boost", 3},
				{"Boost", "Daisy Field Boost", 3},
				{"Boost", "Energy Drink", 1},
				{"Boost", "Butter", 1},
				{"Boost", "Haste", 3},
				{"Boost", "Firefly Vial", 3},
				{"Inventory", "Sugar", 3},
				{"Inventory", "Silver Egg", 1},
				{"IStats", "Honey", 3000},
				{"Inventory", "Ticket", 3},
				{"Inventory", "Royal Jelly", 3},
				{"Inventory", "Instant Converter", 3},
			},
			["hypeforbjupdate"] = {
				Name = "HypeForBJupdate",
				{"Inventory", "Ticket", 3},
				{"Inventory", "Royal Jelly", 3},
				{"Inventory", "Caramel", 3},
				{"Inventory", "Caramel Bottle", 1},
			},
			["presentfromdog"] = {
				Name = "PresentFromDog",
				{"IStats", "Honey", 5000},
				{"Inventory", "Sugar", 10},
				{"Inventory", "Ticket", 10},
				{"Inventory", "Instant Converter", 1},
				{"Inventory", "Blueberry Juice", 1},
			},
			["roxi"] = {
				Name = "Roxi",
				{"Boost", "Mushroom Field Boost", 1},
				{"Boost", "Energy Drink", 1},
				{"IStats", "Honey", 253},
				{"Inventory", "Sugar", 33},
				{"Inventory", "Ticket", 1},
				{"Inventory", "Instant Converter", 1},
				{"Inventory", "Blueberry", 5},
				{"Inventory", "Butter", 2},
			},
			["wormethan"] = {
				Name = "WormEthan",
				{"Boost", "Mushroom Field Boost", 5},
				{"Boost", "Energy Drink", 1},
				{"Boost", "Strawberry Juice", 1},
				{"IStats", "Honey", 5},
				{"Inventory", "Sugar", 25},
				{"Inventory", "Caramel", 10},
				{"Inventory", "Book", 10},
				{"Inventory", "Ticket", 10},
				{"Inventory", "Instant Converter", 5},
			},
			["phoenixsummer"] = {
				Name = "PhoenixSummer",
				{"Boost", "Firefly Vial", 10},
				{"Boost", "Haste", 10},
				{"Boost", "Support", 1},
				{"Boost", "Cattail Field Boost", 1},
				{"Boost", "Dandelion Field Boost", 1},
				{"Boost", "Blue Flowers Field Boost", 2},
				{"IStats", "Honey", 1},
				{"Inventory", "Sugar", 1},
				{"Inventory", "Ticket", 1},
				{"Inventory", "Instant Converter", 2},
				{"Inventory", "Strawberry Juice", 1},
			},
			["phoenixends"] = {
				Name = "PhoenixEnds",
				{"Boost", "Firefly Vial", 20},
				{"Boost", "Haste", 3},
				{"Boost", "Support", 2},
				{"Boost", "Attacksss", 1000},
				{"Boost", "Fenix Blessing", 1},
				{"Boost", "Capacity Boost", 1},
				{"Boost", "Hermit Bear Morph", 1},
				{"Boost", "Star-Talent", 51},
				{"Boost", "Mushroom Field Boost", 3},
				{"Boost", "Dandelion Field Boost", 2},
				{"Boost", "Blue Flowers Field Boost", 2},
				{"IStats", "Honey", 1},
				{"Inventory", "Sugar", 51},
				{"Inventory", "Ticket", 51},
				{"Inventory", "Instant Converter", 7},
				{"Inventory", "Strawberry Juice", 7},
				{"Inventory", "Blueberry Juice", 7},
			},
			["hlwn"] = {
				Name = "HlWn",
				{"Boost", "Firefly Vial", 6},
				{"Boost", "Haste", 6},
				{"Boost", "Support", 6},
				{"Boost", "Attacksss", 666},
				{"Boost", "Fenix Blessing", 1},
				{"Boost", "Capacity Boost", 1},
				{"Boost", "Hermit Bear Morph", 1},
				{"Boost", "Star-Talent", 66},
				{"Boost", "Mushroom Field Boost", 6},
				{"Boost", "Dandelion Field Boost", 6},
				{"Boost", "Blue Flowers Field Boost", 6},
				{"IStats", "Honey", 666},
				{"IStats", "Honey", 666},
				{"IStats", "Honey", 666},
				{"IStats", "Honey", 666},
				{"IStats", "Honey", 666},
				{"IStats", "Honey", 666},
				{"Inventory", "Sugar", 66},
				{"Inventory", "Ticket", 66},
				{"Inventory", "Instant Converter", 6},
				{"Inventory", "Strawberry Juice", 6},
				{"Inventory", "Blueberry Juice", 6},
			},
			["bjcumback"] = {
				Name = "BJcumback",
				{"Boost", "Firefly Vial", 10},
				{"Boost", "Haste", 10},
				{"Boost", "Support", 1},
				{"Boost", "Celebrate Event", 1},
				{"Boost", "Fenix Blessing", 1},
				{"Boost", "Sprout Blessing", 10},
				{"Boost", "Star-Talent", 100},
				{"Boost", "Bee Speed", 1},
				{"Boost", "Brown Bear Morph", 1},
				{"Boost", "Cumback Boost", 1},
				{"Boost", "Bubble Boost", 50},
				{"Boost", "Cattail Field Boost", 4},
				{"Boost", "Dandelion Field Boost", 4},
				{"Boost", "Blue Flowers Field Boost", 4},
				{"Boost", "Daisy Field Boost", 4},
				{"Boost", "Mushroom Field Boost", 4},
				{"IStats", "Honey", 1900},
				{"Inventory", "Caramel", 150},
				{"Inventory", "Ticket", 10},
				{"Inventory", "Instant Converter", 15},
				{"Inventory", "Strawberry Juice", 1},
				{"Inventory", "Blueberry Juice", 1},
				{"Inventory", "Butter", 1},
				{"Inventory", "Night-Bell", 1},
				{"Inventory", "Gifted Jelly", 1},
				{"Inventory", "Gifted Silver Egg", 1},
			},
		}
		if Codes[Code] and not PData.Codes[Code] then
			PData.Codes[Code] = true
			Remotes.AlertClient:FireClient(plr, {
				Color = "Blue",
				Msg = "Redeemed Promo-code ''"..Codes[Code].Name.."''"
			})
			for i, v in pairs(Codes[Code]) do
				if v[1] ~= "Boost" and i ~= "Name" then
					PData[v[1]][v[2]] += v[3]
					if v[2] == "Honey" then
						PData.Badges.Honey.Amount += v[3]
						PData.IStats.TotalHoney += v[3]
					end
					local StringAmount = ""
					if v[3] < 100000000000000 then
						StringAmount = Utils:CommaNumber(v[3])
					else
						StringAmount = Utils:AbNumber(v[3])
					end
					if game.Players:FindFirstChild(plr.Name) then
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(plr, {v[1], PData[v[1]]})
					end
					Remotes.AlertClient:FireClient(plr, {
						Color = "Blue",
						Msg = "+"..StringAmount.." "..v[2]
					})
				elseif v[1] == "Boost" then
					Remotes.Boost:Fire(plr, v[2], v[3])
				end
			end
		else
			if not Codes[Code] then
				Remotes.AlertClient:FireClient(plr, {
					Color = "Red",
					Msg = "Code Invalid"
				})
			elseif Codes[Code] and PData.Codes[Codes[Code].Name] then
				Remotes.AlertClient:FireClient(plr, {
					Color = "Red",
					Msg = "The code has already been redeemed"
				})
			end
		end
	end)
	
	--Remotes.Boss.OnServerEvent:Connect(function(Player, Boss, A)
	--	if not A then
	--	if Boss == "MolyCricket" then
	--	local PData = Data:Get(Player)
			--require(game.ServerScriptService.BossAI["MolyCricket"]).Summon(Player)
	--		end
	--	end
	--end)
	
	Remotes.OpenGlider.OnServerEvent:Connect(function(Humanoid, a, b)
		local PData = Data:Get(Humanoid)
		local Glider = game.Workspace:FindFirstChild(Humanoid.Name):FindFirstChild("Glider") or game.ReplicatedStorage.Assets.Gliders[PData.Equipment.Glider]:Clone()
		if b == true then
			game.Workspace:FindFirstChild(Humanoid.Name):FindFirstChild("Humanoid"):AddAccessory(Glider)
		else
			Glider:Destroy()
		end

		game.Workspace:FindFirstChild(Humanoid.Name):FindFirstChild("Humanoid").StateChanged:Connect(function(oldstate, newState)
			if newState ~= Enum.HumanoidStateType.Freefall then
				Glider:Destroy()
			end
		end)
	end)
	
	Remotes.Parent.ChangeSetting.OnServerEvent:Connect(function(plr, Type)
		local PData = Data:Get(plr)
		if PData.Settings[Type] then
			PData.Settings[Type] = false
		else
			PData.Settings[Type] = true
		end
	end)
	
	local HTTP = game:GetService("HttpService")
	local webhookurl = "https://discord.com/api/webhooks/989924752351174726/PyRFNkvUDrvzJ4ymET-kIJQZpXBowETUnB7TT4i0psofOO3dUa0_BnXMmA5cqm01T2ZZ"
	
	Remotes.AdminCommand.OnServerEvent:Connect(function(Player, Info)
		if find(owners,tostring(Player.UserId)) then
			local DataStore2 = require(game.ServerScriptService.DataStore2)
			local Modules = game.ReplicatedStorage:WaitForChild("Modules")
			local Donations = require(Modules.Donations)
			local u1 = {}
			local GData = Data:Get(game.Players[Info.Player]) 
			local hookdata
			
			function u1.DataReset(GData, Info)
				local GPlayer = game.Players[Info.Player]
				DataStore2('DataMainClientWtf21552312', GPlayer):Set(nil)
				GPlayer:Kick("Your Progress Has Been Reset")
				hookdata = {
					["embeds"] = {{
						["author"] = {
							["name"] = Player.Name,
							["icon_url"] = "https://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&username="..Player.Name
						},
						["description"] = "Reset Data for "..GPlayer.Name,
						["color"] = tonumber(0xFFFAFA),
					}},
				}
			end
			
			function u1.Kick(GData, Info)
				game.Players[Info.Player]:Kick("Kicked")
				hookdata = {
					["embeds"] = {{
						["author"] = {
							["name"] = Player.Name,
							["icon_url"] = "https://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&username="..Player.Name
						},
						["description"] = "Kick "..game.Players[Info.Player].Name,
						["color"] = tonumber(0xFFFAFA),
					}},
				}
			end
			
			function u1.GivePack(GData, Info)
				local GPlayer = game.Players:FindFirstChild(Info.Player)
				GData = Data:Get(GPlayer)
				Donations[Info.PackType].Func(GPlayer, GData)
				hookdata = {
					["embeds"] = {{
						["author"] = {
							["name"] = Player.Name,
							["icon_url"] = "https://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&username="..Player.Name
						},
						["description"] = 'Grant the pack "'..Info.PackType..'" for '..game.Players[Info.Player].Name,
						["color"] = tonumber(0xFFFAFA),
					}},
				}
			end
			
			function u1.Inventory(GData, Info)
				for Item, Amount in pairs(Info.Items) do
					GData["Inventory"][Item] += Amount
					Remotes.AlertClient:FireClient(game.Players[Info.Player], {
						Color = "Blue",
						Msg = "+"..Amount.." "..Item
					})
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", Item, GData["Inventory"][Item]})
				end
				
				local Desc = ""
				
				for i, v in pairs(Info.Items) do
					if (i ~= 1) then
						Desc = Desc.. ', '
					end
					Desc = Desc.. i.." x"..v
				end
				hookdata = {
					["embeds"] = {{
						["author"] = {
							["name"] = Player.Name,
							["icon_url"] = "https://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&username="..Player.Name
						},
						["description"] = 'Give some items: '..Desc..' for '..game.Players[Info.Player].Name,
						["color"] = tonumber(0xFFFAFA),
					}},
				}
			end
			
			function u1.Values(GData, Info)
				local GPlayer = game.Players:FindFirstChild(Info.Player)
				GData = Data:Get(GPlayer)
				hookdata = {
					["embeds"] = {{
						["author"] = {
							["name"] = Player.Name,
							["icon_url"] = "https://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&username="..Player.Name
						},
						["description"] = 'Change Stat '..' for '..game.Players[Info.Player].Name,
						["color"] = tonumber(0xFFFAFA),
						
						["fields"] = {
							{
								["name"] = "Before:",
								["value"] = Info.Type.." = "..GData.IStats[Info.Type],
								["inline"] = true
							},
							{
								["name"] = "After:",
								["value"] = Info.Type.." = "..Info.Amount,
								["inline"] = true
							}
						}
					}},
				}
				GData.IStats[Info.Type] = Info.Amount
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(GPlayer, {"IStats", GData.IStats})
				
				
			end
			
			function u1.Equipment(GData, Info)
				if workspace[Info.Player]:FindFirstChild(Info.Category) then
					workspace[Info.Player]:FindFirstChild(Info.Category):Destroy()
				end
				
				GData["Equipment"][Info.Category] = Info.Tool
				Remotes.AlertClient:FireClient(game.Players[Info.Player], {
					Color = "Blue",
					Msg = "Received "..Info.Tool
				})
				require(game.ServerScriptService.Server.Equipment):EquipItem(Player.Character, Info.Category, GData)
				
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Equipment", Info.Category, GData["Equipment"][Info.Category]})
				
				GetRealStats.GetRealStats(game.Players[Info.Player], GData)
				hookdata = {
					["embeds"] = {{
						["author"] = {
							["name"] = Player.Name,
							["icon_url"] = "https://www.roblox.com/Thumbs/Avatar.ashx?x=100&y=100&username="..Player.Name
						},
						["description"] = game.Players[Info.Player].Name.." has receive the "..Info.Tool.." from Admin "..Player.Name,
						["color"] = tonumber(0xFFFAFA),
					}},
				}
			end
			
			u1[Info.Operation](Data:Get(game.Players[Info.Player]), Info)
			wait(1)
			local finaldata = HTTP:JSONEncode(hookdata)
			if webhookurl and finaldata then
				HTTP:PostAsync(webhookurl, finaldata)
			end
		end
	end)
	Remotes.Parent.AlertBtn.OnServerEvent:Connect(function(Player)
		local PData = Data:Get(Player)
		PData.IStats["RSAlert"] = true
		game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", "RSAlert", PData.IStats["RSAlert"]})
	end)
	local disdeb = false
	Remotes.Dis.OnServerEvent:Connect(function(Player, Dispenser)
		if not disdeb then
			disdeb = true
			if game.Players:FindFirstChild(Player.Name) then
				if (game.Workspace:FindFirstChild(Player.Name).PrimaryPart.Position - game.Workspace.Map.Toys[Dispenser].Pad.Circle.Position).Magnitude <= 15 then
					local PData = Data:Get(Player)
					if Dispenser == "Honey" then
						if not PData.Cooldowns2["HoneyDis"] or PData.Cooldowns2["HoneyDis"].Time - os.time() < 0 and game.Players:FindFirstChild(Player.Name) then
							if Player:IsInGroup(10847461) then
								PData.Cooldowns2["HoneyDis"] = {Time = os.time() + 21600}
								game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Cooldowns2", PData.Cooldowns2})
								local Am = math.round(PData.IStats.TotalHoney / 1000)
								if Am < 100 then
									PData.IStats.Honey += 100
									PData.IStats.TotalHoney += 100
									PData.IStats.DailyHoney += 100
									game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
									Remotes.SSound:FireClient(Player, "Purchase",1,true)
									Remotes.AlertClient:FireClient(Player, {
										Color = "Blue",
										Msg = "+100 Honey (from Honey Dispenser)"
									})
								else
									PData.IStats.Honey += Am
									PData.IStats.TotalHoney += Am
									PData.IStats.DailyHoney += Am
									game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
									Remotes.SSound:FireClient(Player, "Purchase",1,true)
									Remotes.AlertClient:FireClient(Player, {
										Color = "Blue",
										Msg = "+"..Utils:CommaNumber(Am).." Honey (from Honey Dispenser)"
									})
								end
								QuestRoad(Player, PData, "Honey Dispenser")
							end
						elseif PData.Cooldowns2["HoneyDis"].Time - os.time() <= 0 and game.Players:FindFirstChild(Player.Name) then
							PData.Cooldowns2["HoneyDis"] = nil
							game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Cooldowns2", PData.Cooldowns2})
							Remotes.Dis:FireClient(Player)
						end
					elseif Dispenser == "Strawberry" then
						if not PData.Cooldowns2["StrawberryDis"] or PData.Cooldowns2["StrawberryDis"].Time - os.time() < 0 and game.Players:FindFirstChild(Player.Name) then
							if Player:IsInGroup(10847461) then
								PData.Cooldowns2["StrawberryDis"] = {Time = os.time() + 16200}
								game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Cooldowns2", PData.Cooldowns2})
								local Am = math.random(15,50)
								PData.Inventory["Strawberry"] += Am
								game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", PData.Inventory})
								spawn(function()
									for count = 1,10 do
										wait(0.1)
										Remotes.Boost:Fire(Player, ("Haste"), 1)
										Remotes.Boost:Fire(Player, ("Red Boost"), 1)
									end
								end)
								Remotes.SSound:FireClient(Player, "Purchase",1,true)
								Remotes.AlertClient:FireClient(Player, {
									Color = "Blue",
									Msg = "+"..Am.." Strawberry (from Strawberry Dispenser)"
								})
								Remotes.AlertClient:FireClient(Player, {
									Color = "Blue",
									Msg = "x10 Haste Boost (from Strawberry Dispenser)"
								})
								Remotes.AlertClient:FireClient(Player, {
									Color = "Blue",
									Msg = "x10 Red Pollen Boost (from Strawberry Dispenser)"
								})
								QuestRoad(Player, PData, "Strawberry Dispenser")
							end
						elseif PData.Cooldowns2["StrawberryDis"].Time - os.time() <= 0 and game.Players:FindFirstChild(Player.Name) then
							PData.Cooldowns2["StrawberryDis"] = nil
							game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Cooldowns2", PData.Cooldowns2})
							Remotes.Dis:FireClient(Player)
						end
					elseif Dispenser == "Blueberry" then
						if not PData.Cooldowns2["BlueberryDis"] or PData.Cooldowns2["BlueberryDis"].Time - os.time() < 0 and game.Players:FindFirstChild(Player.Name) then
							if Player:IsInGroup(10847461) then
								PData.Cooldowns2["BlueberryDis"] = {Time = os.time() + 16200}
								game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Cooldowns2", PData.Cooldowns2})
								local Am = math.random(15,50)
								PData.Inventory["Blueberry"] += Am
								game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", PData.Inventory})
								spawn(function()
									for count = 1,10 do
										wait(0.1)
										Remotes.Boost:Fire(Player, ("Haste"), 1)
										Remotes.Boost:Fire(Player, ("Blue Boost"), 1)
									end
								end)
								Remotes.SSound:FireClient(Player, "Purchase",1,true)
								Remotes.AlertClient:FireClient(Player, {
									Color = "Blue",
									Msg = "+"..Am.." Blueberry (from Blueberry Dispenser)"
								})
								Remotes.AlertClient:FireClient(Player, {
									Color = "Blue",
									Msg = "x10 Haste Boost (from Blueberry Dispenser)"
								})
								Remotes.AlertClient:FireClient(Player, {
									Color = "Blue",
									Msg = "x10 Blue Pollen Boost (from Blueberry Dispenser)"
								})
								QuestRoad(Player, PData, "Blueberry Dispenser")
							end
						elseif PData.Cooldowns2["BlueberryDis"].Time - os.time() <= 0 and game.Players:FindFirstChild(Player.Name) then
							PData.Cooldowns2["BlueberryDis"] = nil
							game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Cooldowns2", PData.Cooldowns2})
							Remotes.Dis:FireClient(Player)
						end
					end
					--coroutine.wrap(function()
						wait(2)
						disdeb = false
					--end) ()
				end
			else
				Player:Kick("Cheats are Bad")
			end
		end

	end)
	

	Remotes.BoosterF.OnServerEvent:Connect(function(Player, Type)
	if game.Players:FindFirstChild(Player.Name) then
		local PData = Data:Get(Player)
		local WF = {{"Daisy", 3}, {"Sunflower", 3}, {"Clover", 3}, {"Pumpkin", 2}, {"Cactus", 2}, {"Dandelion", 1}}
		local BF = {{"Blue Flowers", 3}, {"Pine Tree", 2}, {"Cattail", 1}}
		local RF = {{"Mushroom", 3}, {"Strawberry", 2}, {"Red Flowers", 1}}
		if Type == "White" and game.Players:FindFirstChild(Player.Name) then
			if not PData.Cooldowns2["WhiteBooster"] or PData.Cooldowns2["WhiteBooster"].Time - os.time() <= 0 then
				PData.Cooldowns2["WhiteBooster"] = {Time = os.time() + 7200}
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Cooldowns2", PData.Cooldowns2})
				local RandF = WF[math.random(1,#WF)]
				Remotes.Boost:Fire(Player, (RandF[1].." Field Boost"), RandF[2])
				Remotes.SSound:FireClient(Player, "FieldBooster",1,true)
			end
		elseif Type == "Blue" and game.Players:FindFirstChild(Player.Name) then
			if not PData.Cooldowns2["BlueBooster"] or PData.Cooldowns2["BlueBooster"].Time - os.time() <= 0 then
				PData.Cooldowns2["BlueBooster"] = {Time = os.time() + 7200}
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Cooldowns2", PData.Cooldowns2})
				local RandF = BF[math.random(1,#BF)]
				Remotes.Boost:Fire(Player, (RandF[1].." Field Boost"), RandF[2])
				Remotes.SSound:FireClient(Player, "FieldBooster",1,true)
			end
		elseif Type == "Red" and game.Players:FindFirstChild(Player.Name) then
			if not PData.Cooldowns2["RedBooster"] or PData.Cooldowns2["RedBooster"].Time - os.time() <= 0 then
				PData.Cooldowns2["RedBooster"] = {Time = os.time() + 7200}
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Cooldowns2", PData.Cooldowns2})
				local RandF = RF[math.random(1,#RF)]
				Remotes.Boost:Fire(Player, (RandF[1].." Field Boost"), RandF[2])
				Remotes.SSound:FireClient(Player, "FieldBooster",1,true)
			end
			end
		end
	end)
	
	Remotes.ClaimHive.OnServerEvent:Connect(function(Client, Hive)
		if game.Players:FindFirstChild(Client.Name) then
		print(Client.Name)
		local PData = Data:Get(Client)
		if not HiveDebounce and game.Players:FindFirstChild(Client.Name) then
			--HiveDebounce = false
			if PData.Vars.Hive == "" and Hive.Owner.Value == "" and CheckMagnitude(Client, Hive.Pad.Circle) and game.Players:FindFirstChild(Client.Name) then
					Hive.Owner.Value = Client.Name
					
					
					--require(game.ServerScriptService.Modules.Amulets).RegisterAmulet(Client, PData, {Amulet = "Test", Rank = "Bronze", Bonuses = {{"Pollen", "%", 25}, {"Convert Rate", "%", 150}}})
				GetHiveOwner(Hive.Pad.Circle.Gui, Hive.Pad.Circle.Display.Gui, Client, PData)
					PData.Vars.Hive = Hive.Name
					if game.Players:FindFirstChild(Client.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Vars", "Hive", PData.Vars.Hive})
					end
				local needsslots = PData.TotalSlots - 25
				local nowslot = 25
				if needsslots >= 2 then
					for i = 1, needsslots do
						HivesManager.NewSlot(PData, needsslots, nowslot)
						needsslots -= 1
						nowslot += 1
						wait()
					end
				elseif needsslots == 1 then
					HivesManager.NewSlot(PData, 1, nowslot)
				end
				if needsslots <= 1 then
					HivesManager.GetSlots(Client)
				end
				end
				if game.Players:FindFirstChild(Client.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Vars", PData.Vars})
				end
			wait(0.05)
			--HiveDebounce = false
			end
		end
	end)
	
	Remotes.ConvertPollen.OnServerEvent:Connect(function(Client, OffOrOn)
		local PData = Data:Get(Client)
		PData.Vars.Making = OffOrOn
	end)
	
	Remotes.CreateBeeSlot.OnServerEvent:Connect(function(Player, Item, Slot)
		if game.Players:FindFirstChild(Player.Name) then
		local PData = Data:Get(Player)
		if PData.Inventory[Item] >= 1 and Slot.BeeN.Value == "" and Items.Eggs[Item].Type == "Egg" and game.Players:FindFirstChild(Player.Name) then
			local BeeT = RandomBee(Item, Player)
			if BeeT ~= nil then
			local Gifted = false
			if BeeT.Gifted then
				Gifted = true
			end
			local Bee = BeeT.Name
			PData.Inventory[Item] -= 1
			PData.TotalBees += 1
			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"TotalBees", PData.TotalBees})
			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", Item, PData.Inventory[Item]})
				
			local New
			local NewUI
			if not Player.PlayerGui.UI:FindFirstChild("BeePopUp") then
				NewUI = false
			else
				NewUI = true
			end
			if not PData.TypeBees[Bee] then
				PData.ObtainedBees += 1
				PData.TypeBees[Bee] = true
				New = true
			end
			--Functions
			--PData Save
			local BeeModule = require(game.ReplicatedStorage.Bees[Bee])
			if BeeModule.Rarity == "Legendary" then
				game.ReplicatedStorage.Remotes.SSound:FireClient(Player, "LegendaryBee",1,true)
			end
			PData.Bees[tonumber(Slot.Name)].BeeName = Bee
			PData.Bees[tonumber(Slot.Name)].Slot = tonumber(Slot.Name)
			PData.Bees[tonumber(Slot.Name)].ELimit = BeeModule.Energy
			PData.Bees[tonumber(Slot.Name)].Energy = BeeModule.Energy
			PData.Bees[tonumber(Slot.Name)].Attack = BeeModule.Attack + (5 * (PData.Bees[tonumber(Slot.Name)].Level / 100))
			PopUp.PopUp(Player, Bee, Item, Gifted, Slot, New, PData)
			HivesManager.CreateSlot(Slot, Bee, Player, Gifted, PData.Bees[tonumber(Slot.Name)], PData)
			Remotes.CreateBeeSlot:FireClient(Player, PData)
			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Bees", tonumber(Slot.Name), PData.Bees[tonumber(Slot.Name)]})
			end
		elseif PData.Inventory[Item] >= 1 and Slot.BeeN.Value ~= "" and Items.Eggs[Item].Type == "Jelly" and game.Players:FindFirstChild(Player.Name) then
			local OBeeModule = require(game.ReplicatedStorage.Bees[Slot.BeeN.Value])
			local OldBee = Slot.BeeN.Value
				local OldGifted = false
				
				if PData.Bees[tonumber(Slot.Name)].Gifted == true then
					OldGifted = true
				end
				
			if OBeeModule.Rarity == "Event" then
				PData.Inventory[OBeeModule.Name.." Bee Egg"] = 1
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", OBeeModule.Name.." Bee Egg", 1})
			end
			local BeeT = RandomBee(Item, Player)
			if BeeT ~= nil then
			local Bee = BeeT.Name
			PData.Inventory[Item] -= 1
			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", Item, PData.Inventory[Item]})
				
			local Gifted = false
			if BeeT.Gifted then
				Gifted = true
			end
			local New
			local NewUI
			if not Player.PlayerGui.UI:FindFirstChild("BeePopUp") then
				NewUI = false
			else
				NewUI = true
			end
			if not PData.TypeBees[Bee] then
				PData.ObtainedBees += 1
				PData.TypeBees[Bee] = true
				New = true
			end
				
			--local OldBee = Slot.BeeN.Value

			local BeeModule = require(game.ReplicatedStorage.Bees[Bee])
			if BeeModule.Rarity == "Legendary" then
				game.ReplicatedStorage.Remotes.SSound:FireClient(Player, "LegendaryBee",1,true)
			end
			PData.Bees[tonumber(Slot.Name)] = {
			Properties = {
			PollenX = 0,
			MoveX = 0,
			},
			BeeName = "", Slot = 0, ELimit = 0, Energy = 0, Gifted = false, Bond = 0, Level = 0, Effect = "", EffectTime = 0}
					
			PData.Bees[tonumber(Slot.Name)].BeeName = Bee
			PData.Bees[tonumber(Slot.Name)].Slot = tonumber(Slot.Name)
			PData.Bees[tonumber(Slot.Name)].ELimit = BeeModule.Energy
			PData.Bees[tonumber(Slot.Name)].Energy = BeeModule.Energy
			PData.Bees[tonumber(Slot.Name)].Attack = BeeModule.Attack + (5 * (PData.Bees[tonumber(Slot.Name)].Level / 100))
				
			PopUp.PopUp(Player, Bee, Item, Gifted, Slot, New, PData)
			HivesManager.ChangeBee(Slot, Bee, Player, Gifted, PData, OldBee)
			Remotes.CreateBeeSlot:FireClient(Player, PData)
			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Bees", tonumber(Slot.Name), PData.Bees[tonumber(Slot.Name)]})
			end
		elseif PData.Inventory[Item] >= 1 and Slot.BeeN.Value ~= "" and Items.Eggs[Item].Type == "EffectFood" and game.Players:FindFirstChild(Player.Name) then
			print("Da")
			end
		end
	end)
end

return Events