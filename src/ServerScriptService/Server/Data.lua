local Data = {}

local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local Remotes = game.ReplicatedStorage:WaitForChild("Remotes")
local Modules = game.ReplicatedStorage:WaitForChild("Modules")
local Items = require(Modules.Items)

Data.PlayerData = {}

function Data.new(Player)
	local PData = {}
	
	PData.ActiveMobs = {
	}
	
	PData.Vars = {
		Making = false,
		CollectingBees = true,
		Hive = "",
		Field = "",
		LastField = "",
		Rolling = false,
		Attack = false,
		
		PTotem = false,
		TTotem = false,
		
		PlacedHydrants = 0,
		HP = 100,
		
		AttackObj = nil,
		RewardFromTotem = false,
		
		Tokens = {}
	}
	PData.TotalSlots = 25
	PData.DisClaimed = false
	PData.SprinklerType = ""

	PData.Boosts = {}

	PData.Binds = {
		[1] = {
			Item = "",
		},
		[2] = {
			Item = "",
		},
		[3] = {
			Item = "",
		},
		[4] = {
			Item = "",
		},
		[5] = {
			Item = "",
		},
	}
	
	PData.HPremTasks = {
		["PTask1"] = {
			Locked = false,
			TaskID = 0,
			Progress = 0,
		},
		["PTask2"] = {
			Locked = false,
			TaskID = 0,
			Progress = 0,
		},
		["PTask3"] = {
			Locked = false,
			TaskID = 0,
			Progress = 0,
		},
	}
	
	PData.HTasks = {
		["Task1"] = {
			Locked = false,
			TaskID = 0,
			Progress = 0,
		},
		["Task2"] = {
			Locked = false,
			TaskID = 0,
			Progress = 0,
		},
		["Task3"] = {
			Locked = false,
			TaskID = 0,
			Progress = 0,
		},
	}

	PData.Enchants = {}
	
	PData.Books = {
		
	}
	
	PData.BookSlots = {
		[1] = {BookID = 0, Input = true, Buy = false},
		[2] = {BookID = 0, Input = true, Buy = false},
		[3] = {BookID = 0, Input = false, Buy = true},
		[4] = {BookID = 0, Input = false, Buy = false},
		[5] = {BookID = 0, Input = false, Buy = false},
		[6] = {BookID = 0, Input = false, Buy = false},
	}

	PData.Passives = {}
	
	--PData.Progression = {
	--	{0,0,0,0,0,0,0,0,0,0}
	--}
	
	PData.Amuletes = {}
	PData.OldAmuletes = {}

	PData.BPBees = {}
	PData.Quests2 = {}
	PData.QuestsGivers = {
		["Black Bear"] = {CompletedNow = false, CompletedQuests = 1, Claimed2 = false, Infinity = false, TotalQuests = 0},-- Infinity = false},
		--["Brown Bear"] = {CompletedNow = false, CompletedQuests = 1, Claimed = false,Infinity = true, TotalQuests = 0},
		["Brown Bear2"] = {CompletedNow = false, CompletedQuests = 1, Claimed2 = false, Infinity = true, TotalQuests = 0},
		["Hermit Bear"] = {CompletedNow = false, CompletedQuests = 1, Claimed2 = false, Infinity = true, TotalQuests = 0},
		["Resin Bear"] = {CompletedNow = false, CompletedQuests = 1, Claimed2 = false, Infinity = false, TotalQuests = 0, Boosts = true},
		["Caramel Bear"] = {CompletedNow = false, CompletedQuests = 1, Claimed2 = false, Infinity = false, TotalQuests = 0},
		["Cengdop Bear"] = {CompletedNow = false, CompletedQuests = 1, Claimed2 = false, Infinity = false, TotalQuests = 0},
		["Sand Dog"] = {CompletedNow = false, CompletedQuests = 1, Claimed2 = false, Infinity = false, TotalQuests = 0},

		["BeezBuzz Bear"] = {CompletedNow = false, CompletedQuests = 1, Claimed2 = false, Infinity = true, TotalQuests = 0},
		["Worm Ethan"] = {CompletedNow = false, CompletedQuests = 1, Claimed2 = false, Infinity = false, TotalQuests = 0},
		--["Bear1"] = {CompletedNow = false, CompletedQuests = 1, Claimed = false,Infinity = true, TotalQuests = 0},
		--["Easter Bear"] = {CompletedNow = false, CompletedQuests = 1, Claimed = false},
	}
	
	PData.Craft = false
	PData.Crafting = {}
	
	PData.HiveDesign = {
		["OnSlots"] = "",
	}
	
	PData.IStats = {
		FixedQuests = false,
		FixedEventBees = false,
		FixedData1 = false,
		FixedStats = false,
		NewBeeLevels = false,
		Capacity = 200,
		
		BeePoint = 0,
		Premium = true,
		
		AP = 0,
		AdminRank = "Player",

		Donations = 0,
		
		Pollen = 0,
		Honey = 0,
		TotalHoney = 0,
		Caramel = 0,
		DailyHoney = 0,
		TotalRed = 0,
		TotalBlue = 0,
		TotalWhite = 0,
		["Battle Points"] = 0,
		MarketCostMult = 1,
		BasicEggs = 1,
		ActiveAmulets = 0,
		CraftedItems = 0,
		TicketCosts2 = 10000,
		JellyCosts2 = 10000,
		Dum = 0,
		Jelly = 0,
		AutoJelly = "Off",
		ActivePortableHives = {},
		PurchasedSowers = {},
		Catalog1 = {},
		RedBees = 0,
		WhiteBees = 0,
		BlueBees = 0,
		Giveaway2Way = false,
		Tutorial = false,
		TotalBadges = 0,
		
		TermiteScores = 0,
		
		ShopGift = {"", 0, false},
		GiftTime = 0,
		
		FrogHealth = 25000000,
		FrogKills = 0,
		
		MolyCricketKills = 0,
	}

	PData.Equipment = {
		Hydrant = "",
		Hydrants = {},
		Tool = "Honey Cutter",
		Bag = "United Bag",
		Belt = "",
		Boot = "",
		Hat = "",
		Glider = "",
		LeftGuard = "",
		RightGuard = "",
		Tools = {["Honey Cutter"] = true},
		Bags = {["United Bag"] = true},
		RightGuards = {},
		LeftGuards = {},
		Belts = {},
		Boots = {},
		Hats = {},
		Gliders = {},
	}
	PData.Cooldowns2 = {}
	
	PData.TotalBees = 25
	PData.ObtainedBees = 0

	PData.Bees = {}
	PData.Codes = {}
	
	PData.TypeBees = {}
	PData.GiftedBees = {}
	
	for Slot = 1, 50 do
		PData.Bees[Slot] = {
			Properties = {
				PollenX = 0,
				MoveX = 0,
			},
		Attack = 0, BeeName = "", Slot = 0, ELimit = 0, Energy = 0, Gifted = false, Bond = 0, Level = 0, Effect = "", EffectTime = 0}
	end
	

	PData.AllStats = {
		--Pollen
		["Red Pollen"] = 100,
		["Blue Pollen"] = 100,
		["White Pollen"] = 100,
		["Pollen"] = 100,
		["Honey Bonus"] = 100,
		["Pollen From Tools"] = 100,
		["Pollen From Bees"] = 100,
		--Instant
		["Instant"] = 0,
		["Red Instant"] = 0,
		["Blue Instant"] = 0,
		["White Instant"] = 0,
		--Boots
		["Movement Collection"] = 0,
		--Crit
		["Critical Chance"] = 0,
		["Critical Power"] = 1000,
		--Bees
		["Attack"] = 100,
		["Bee's Attack"] = 0,
		["Red Bee's Attack"] = 0,
		["Colorless Bee's Attack"] = 0,
		["Blue Bee's Attack"] = 0,
		["Convert Rate"] = 100,
		["Bee Movespeed"] = 100,
		["Total Converts"] = 0,
		["Convert Amount"] = 0,
		["Ability Rate"] = 100,
		--Misc
		["Capacity"] = 100,
		["Caramel"] = 100,
		["Tools Speed"] = 100,
		["Honey From Tokens"] = 100,
		["Loot Luck"] = 100,
		["Flame Duration"] = 100,
		["Pollen From Bubbles"] = 100,
		["Pollen From Flames"] = 100,
		--Bombs
		["Bomb Pollen"] = 100,
		["White Bomb Pollen"] = 100,
		["Blue Bomb Pollen"] = 100,
		["Red Bomb Pollen"] = 100,
		
		["Bomb Instant"] = 0,
		["White Bomb Instant"] = 0,
		["Blue Bomb Instant"] = 0,
		["Red Bomb Instant"] = 0,
		
		-- Charater
		["Player Movespeed"] = 100,
		["Jump Power"] = 100,
		
		--Fields
		["Mushroom"] = 100,
		["Sunflower"] = 100,
		["Blue Flowers"] = 100,
		["Red Flowers"] = 100,
		["Strawberry"] = 100,
		["Pumpkin"] = 100,
		["Daisy"] = 100,
		["Cactus"] = 100,
		["Cattail"] = 100,
		["Pine Tree"] = 100,
		["Dandelion"] = 100,
		["Mountain Top"] = 100,
		["Clover"] = 100,
		["Stump"] = 100,
		["Termit Hollow"] = 100,
	}
	
	PData.Beespass = {
		Free = true,
		Paid = false,
		TotalLevels = 1,
		Xp = 0,
	}
	PData.BeespassRewards = {
		["Free"] = {},
		["Paid"] = {},
	}
	
	PData.Badges = {
		["Honey"] = {
			Tier = 1,
			Amount = 0,
		},
		["Battle"] = {
			Tier = 1,
			Amount = 0,
		},
		["Playtime"] = {
			Tier = 1,
			Amount = 0,
		},
		["Caramel"] = {
			Tier = 1,
			Amount = 0,
		},
	}
	
	for _, Field in pairs(workspace.FieldZones:GetChildren()) do
		PData.Badges[Field.Name.." Field"] = {
			Tier = 1,
			Amount = 0,
		}
	end
	
	PData.Inventory = {}
	
	PData.Treasures = {}
	PData.Settings = {
		["Pollen Text"] = true,
		["Music"] = true,
	}

	for i,v in pairs(Items.Eggs) do
		PData.Inventory[i] = 0
		PData.Inventory["Basic Egg"] = 1
	end
	
	--PData.Amulets = {}
	--PData.OldAmulets = {}

	Data.PlayerData[Player.Name] = PData
	return PData
end

function Data:Get(Player)
	if game:GetService("RunService"):IsServer() then
		return Data.PlayerData[Player.Name]
	else
		return Remotes.GetPlayerData:InvokeServer()
	end
end

local AutoSaves = {}

local MainKey = 'DataMainServerWtfs1'
local ClientKey = 'DataMainClientWtfs1'

local DataStore2 = require(game.ServerScriptService.DataStore2)

function LoadData(Client)
	DataStore2.Combine(MainKey, ClientKey)
	local PData = Data.new(Client)
	local DataStorage = DataStore2(ClientKey, Client):GetTable(PData)
	PData = GetDataFromDataStorage(Client, DataStorage)
	AutoSaves[Client.Name] = Client
end

function SaveData(client, PData)
	DataStore2(ClientKey, client):Set(PData)
end

function GetDataFromDataStorage(Client, DataStorage)
	local PData = Data:Get(Client)
	PData.Boosts = DataStorage.Boosts

	PData.DisClaimed = DataStorage.DisClaimed
	PData.TotalSlots = DataStorage.TotalSlots
	PData.ObtainedBees = DataStorage.ObtainedBees
	PData.SprinklerType = DataStorage.SprinklerType
	PData.TypeBees = DataStorage.TypeBees
	PData.GiftedBees = DataStorage.GiftedBees
	PData.TotalBees = DataStorage.TotalBees
	PData.Beespass = DataStorage.Beespass
	PData.BeespassRewards = DataStorage.BeespassRewards
	
	PData.Passives = DataStorage.Passives
	PData.Codes = DataStorage.Codes
	PData.BPBees = DataStorage.BPBees
	
	PData.Cooldowns2 = DataStorage.Cooldowns2

	PData.Treasures = DataStorage.Treasures
	
	PData.Crafting = DataStorage.Crafting
	PData.Craft = DataStorage.Craft
	for i,v in pairs(DataStorage.Books) do
		PData.Books[i] = DataStorage.Books[i]
	end
	for i,v in pairs(DataStorage.BookSlots) do
		PData.BookSlots[i] = DataStorage.BookSlots[i]
	end

	for i,v in pairs(DataStorage.Binds) do
		PData.Binds[i] = DataStorage.Binds[i]
	end
	
	for i,v in pairs(DataStorage.QuestsGivers) do
		PData.QuestsGivers[i] = DataStorage.QuestsGivers[i]
	end
	
	for i,v in pairs(DataStorage.Quests2) do
		PData.Quests2[i] = DataStorage.Quests2[i]
	end
	
	for i,v in pairs(DataStorage.Inventory) do
		PData.Inventory[i] = DataStorage.Inventory[i]
	end

	for i,v in pairs(DataStorage.IStats) do
		PData.IStats[i] = DataStorage.IStats[i]
	end

	for i,v in pairs(DataStorage.Equipment) do
		PData.Equipment[i] = DataStorage.Equipment[i]
	end

	for i,v in pairs(DataStorage.AllStats) do
		PData.AllStats[i] = DataStorage.AllStats[i]
	end

	for i,v in pairs(DataStorage.Badges) do
		PData.Badges[i] = DataStorage.Badges[i]
	end

	--for i,v in pairs(DataStorage.Achievements) do
	--	PData.Achievements[i].Amount = DataStorage.Achievements[i].Amount
	--	PData.Achievements[i].Opened = DataStorage.Achievements[i].Opened
	--	PData.Achievements[i].Claimed = DataStorage.Achievements[i].Claimed
	--end
	--for i,v in pairs(DataStorage.FieldTotems) do
	--	PData.FieldTotems[i].Time = DataStorage.FieldTotems[i].Time
	--	PData.FieldTotems[i].Active = DataStorage.FieldTotems[i].Active
	--end
	--if #DataStorage.Amulets > 0 then
	--	for i,v in pairs(DataStorage.Amulets) do
	--		PData.Amulets[i] = DataStorage.Amulets[i]
	--	end
	--end
	--if #DataStorage.OldAmulets > 0 then
	--	for i,v in pairs(DataStorage.OldAmulets) do
	--		PData.OldAmulets[i] = DataStorage.OldAmulets[i]
	--	end
	--end
	
	for i,v in pairs(DataStorage.Bees) do
		if PData.Bees[i] then
		PData.Bees[i].Attack = DataStorage.Bees[i].Attack
		PData.Bees[i].BeeName = DataStorage.Bees[i].BeeName
		PData.Bees[i].Energy = DataStorage.Bees[i].Energy
		PData.Bees[i].ELimit = DataStorage.Bees[i].ELimit
		PData.Bees[i].Gifted = DataStorage.Bees[i].Gifted
		PData.Bees[i].Bond = DataStorage.Bees[i].Bond
		PData.Bees[i].Level = DataStorage.Bees[i].Level
		PData.Bees[i].Slot = DataStorage.Bees[i].Slot

		PData.Bees[i].Properties.MoveX = DataStorage.Bees[i].Properties.MoveX
		PData.Bees[i].Properties.PollenX = DataStorage.Bees[i].Properties.PollenX
		end
	end
end

do
	Players.PlayerAdded:Connect(LoadData)
	Players.PlayerRemoving:Connect(function(Client)
		SaveData(Client, Data:Get(Client))
		AutoSaves[Client.Name] = nil
	end)
	--Players.PlayerRemoving:Connect(function(Client) SaveData(Client, Data:Get(Client)) AutoSaves[Client.Name] = nil end)

	game.ReplicatedStorage.Remotes.GetPlayerData.OnServerInvoke = function(client)
		local PData = Data:Get(client)
		return PData
	end
end

local TotalDelta = 0
spawn(function()
	while wait(2) do
		for _, Player in pairs(AutoSaves) do
			local PData = Data:Get(Player)
			SaveData(Player, PData)
		end
	end
end)

return Data
