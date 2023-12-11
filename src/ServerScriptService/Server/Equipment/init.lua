local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")
local PhysService = game:GetService("PhysicsService")
local PlayerGroup = PhysService:CreateCollisionGroup("p")
PhysService:CollisionGroupSetCollidable("p","p",false)
local Items = RS:FindFirstChild("Assets")
local Assets = game.ServerStorage:FindFirstChild("Assets")
local Data = require(script.Parent.Data)
local Utils = require(RS:FindFirstChild("Modules").Utils)
local GetStatsModule = require(script.Parent.Parent.Functions.GetRealStats)
local MarketPlace = game:GetService("MarketplaceService")
local HG = require(game.ServerScriptService.Modules.HG)

local Equipment = {} do
	
	function NoCollide(model)
		spawn(function()
			model:WaitForChild("Humanoid")
			model:WaitForChild("HumanoidRootPart")
			model:WaitForChild("Head")
			for k,v in pairs(model:GetChildren()) do
				if v:IsA"BasePart" then
					PhysService:SetPartCollisionGroup(v,"p")
				end
			end
		end)
	end
	
	function LoadImages(Player, PData)
		local Blacklist = {
			["Tool"] = true,
			["Tools"] = true,
			["Bag"] = true,
			["Bags"] = true,
			["Belts"] = true,
			["Boots"] = true,
			["Hats"] = true,
			["Glider"] = true,
			["Gliders"] = true,
			["Hydrant"] = true,
			["Hydrants"] = true,
			["LeftGuards"] = true,
			["RightGuards"] = true,
		}
		for EqType, Eq in pairs(PData.Equipment) do
			if not Blacklist[EqType] and Eq ~= "" then
				game.ReplicatedStorage.Remotes.UIEquip:FireClient(Player, Eq, "Create")
			end
		end
	end
	
	function GetGamepasses(Player, PData)
		spawn(function()
			if MarketPlace:UserOwnsGamePassAsync(Player.UserId, 49998955) then
				if PData.Boosts["x2 Convert Rate Pass"] == nil then
					game.ReplicatedStorage.Remotes.Boost:Fire(Player, "x2 Convert Rate Pass", 1)
				end
			end
			if MarketPlace:UserOwnsGamePassAsync(Player.UserId, 50000061) then
				if PData.Boosts["x2 Pollen from Bees Pass"] == nil then
					game.ReplicatedStorage.Remotes.Boost:Fire(Player, "x2 Pollen from Bees Pass", 1)
				end
			end
			if MarketPlace:UserOwnsGamePassAsync(Player.UserId, 50000000) then
				if PData.Boosts["x2 Pollen from Tools Pass"] == nil then
					game.ReplicatedStorage.Remotes.Boost:Fire(Player, "x2 Pollen from Tools Pass", 1)
				end
			end
		end)
	end
	
	function CheckEventBees(PData, Player)
		local co = {}
		for _, Bee in pairs(PData.Bees) do
			if Bee.BeeName ~= "" then
				if not co[Bee.BeeName] and require(game.ReplicatedStorage.Bees[Bee.BeeName]).Rarity == "Event" then
					co[Bee.BeeName] = true
				elseif co[Bee.BeeName] and require(game.ReplicatedStorage.Bees[Bee.BeeName]).Rarity == "Event" then
					Bee.BeeName = "Basic"
				end
			end
		end
		
		if MarketPlace:UserOwnsGamePassAsync(Player.UserId, 40341207) then
			local HaveBear = false
			for Item, Amount in pairs(PData.Inventory) do
				if Item == "Bear Bee Egg" and Amount <= 0 then
					for _, Bee in pairs(PData.Bees) do
						if Bee.BeeName ~= "Bear" then
							HaveBear = false
						else
							HaveBear = true
							break
						end
					end
				end
			end
			if HaveBear == false then
				PData.Inventory["Bear Bee Egg"] = 1
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", PData.Inventory})
				game.ReplicatedStorage.Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+1 Bear Bee Egg"
				})
				HaveBear = true
			else
				PData.IStats["Special1qwertyuiopBEAR"] = true
			end
		end
		
		local cb = 0
		for _, Bee in pairs(PData.Bees) do
			if Bee.BeeName ~= "" then
				cb += 1
			end
		end
		PData.TotalBees = cb
		
		local HaveBees = {}
		local EventBees = {
			["Ladybug"] = true,
			["Rhino"] = true,
			["Bear"] = true,
			["Caramel"] = true,
			["Firefly"] = true,
			["Toothy"] = true,
			}
		for Name, _ in pairs(EventBees) do
			if PData.BPBees[Name.." Bee Egg"] and not PData.TypeBees[Name] and not PData.Inventory[Name.." Bee Egg"] then
				PData.BPBees[Name.." Bee Egg"] = false
			end
		end
	end
	
	function GetTotalSlots(PData)
		spawn(function()
			local BIT = 0
			for i,v in pairs(PData.Bees) do
				BIT += 1
			end
			wait(0.5)
			if BIT < PData.TotalSlots then
				for i = 1, PData.TotalSlots - BIT do
					if i <= PData.TotalSlots - BIT then
						PData.Bees[i + 25] = {
						Properties = {
							PollenX = 1,
							MoveX = 1,
						},
						Attack = 1, BeeName = "", Slot = 0, ELimit = 10, Energy = 10, Gifted = false, Bond = 0, Level = 1, Effect = "", EffectTime = 0}
					end
				end
			end
		end)
	end
	
	function makegift()
		local itemst = {
			{"Basic Egg", {1}},
			{"Silver Egg", {1}},
			{"Golden Egg", {1}},
			{"Diamond Egg", {1}},
			{"Mythic Egg", {1}},
			{"Ticket", {1,5,10,25,50}},
			{"Fertilizer", {1,3}},
			{"Gifted Jelly", {1}},
			{"Energy Drink", {1,3,5}},
			{"Strawberry Juice", {1,3,5}},
			{"Blueberry Juice", {1,3,5}},
			{"Butter", {1,3,5}},
			{"Caramel Bottle", {1,3,5}},
			{"Caramel", {5,15,25,50,100}},
			{"Cookie", {50,150,300,500,1000}},
			{"Sugar", {10,25,50,150}},
			{"Sprout", {1,3,5}},
			{"Rare Sprout", {1,3,5}},
			{"Epic Sprout", {1,3}},
			{"Legendary Sprout", {1,3}},
		}

		local chs = itemst[math.random(1,#itemst)]
		local item = chs[1]
		local amount = chs[2]math.random(1, #chs[2])
		local realamount = amount[math.random(1,#amount)]
		return {item, realamount}
	end
	
	function GetRewards(Player, PData)
		local Winners = { 
			[427304978] = {"SummerPack7", 1},
			[540156907] = {"SummerPack7", 1},
			[1011660385] = {"SummerPack6", 1},
			[632061267] = {"SummerPack6", 1},
			[478783286] = {"SummerPack5", 1},
			[968759339] = {"SummerPack5", 1},
			[540114622] = {"SummerPack5", 1},
			[1098158015] = {"SummerPack5", 1},
			[655777561] = {"SummerPack5", 1},
			[717139913] = {"SummerPack5", 1},
			[1089631637] = {"SummerPack5", 1},
			[1104006686] = {"Bear Pack", 1},
		}

		local Donations = require(game.ReplicatedStorage.Modules.Donations)
		if Winners[Player.UserId] and not PData.IStats.Giveaway5Way then
			PData.IStats["Giveaway5Way"] = true
			game.ReplicatedStorage.Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "Take it"
			})
			game.ReplicatedStorage.Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "Congratulations!"
			})
			if not Donations[Winners[Player.UserId][1]] then
				PData.Inventory[Winners[Player.UserId][1]] += Winners[Player.UserId][2]
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", Winners[Player.UserId][1], PData.Inventory[Winners[Player.UserId][1]]})
				end
				game.ReplicatedStorage.Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..Winners[Player.UserId][2].." "..Winners[Player.UserId][1].." Your Tickets Sir :)"
				})
			else
				Donations[Winners[Player.UserId][1]].Func(Player, PData)
			end
		end
	end
	
	function Equipment:StartTimers(Player, PData)
		spawn(function()
			while Player do wait(1)
				PData.Badges.Playtime.Amount += 1
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Badges", "Playtime", PData.Badges.Playtime})

				for NpcName, NPC in pairs(PData.Quests2) do
					for i, Task in pairs(NPC) do
						local GetCompleted = Utils.GetTableNum(NPC, "StartAmount")
						local GetNeeds = Utils.GetTableNum(NPC, "NeedAmount")
						if GetCompleted >= GetNeeds and PData.QuestsGivers[NpcName].CompletedNow == false then
							PData.QuestsGivers[NpcName].CompletedNow = true
							if game.Players:FindFirstChild(Player.Name) then
								game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"QuestsGivers", PData.QuestsGivers})
							end
						end
					end
				end

				if PData.IStats.GiftTime <= 0 then
					PData.IStats.GiftTime = os.time() + 86400
					local gift = makegift()
					PData.IStats.ShopGift = {gift[1], gift[2], true}
					PData.IStats["RSAlert"] = false
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", "RSAlert", PData.IStats["RSAlert"]})
					if game.Players:FindFirstChild(Player.Name) then
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
					end
				else
					if os.time() >= PData.IStats.GiftTime then
						PData.IStats.GiftTime = 0
					end
					if game.Players:FindFirstChild(Player.Name) then
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
					end
				end

				for i,v in pairs(PData.Cooldowns2) do
					if v and v.Time then
						if v.Time - os.time() <= 0 then
							PData.Cooldowns2[i] = nil
							if game.Players:FindFirstChild(Player.Name) then
								game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Cooldowns2", PData.Cooldowns2})
							end
						end
					end
				end

				if PData.Boosts ~= {} then
					for i,v in pairs(PData.Boosts) do
						if v then
							if os.time() >= v.Time then
								PData.Boosts[v.Name] = nil
								if game.Players:FindFirstChild(Player.Name) then
									game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Boosts", PData.Boosts})
								end
								GetStatsModule.GetRealStats(Player, PData)
								if Player and Player.Character and Player.Character:FindFirstChild("Humanoid") then
									Player.Character.Humanoid.WalkSpeed = 16 * (PData.AllStats["Player Movespeed"] / 100)
									Player.Character.Humanoid.JumpHeight = 7.2 * (PData.AllStats["Jump Power"] / 100)
								end
							end
						end
					end
				end
			end
		end)
	end

	local function GetGrant(PData,Player,Folder)
		if Folder.Name == Player.Name then
			if not PData.IStats[Folder.GiftID.Value] then
				PData.IStats[Folder.GiftID.Value] = true
				for _, Item in pairs(Folder:GetChildren()) do
					if Item.Name ~= "GiftID" and Item.Name ~= "Xp" then
						if not require(game.ReplicatedStorage.Modules.Donations)[Item.Name] then
							if PData.Inventory[Item.Name] then
								PData.Inventory[Item.Name] += Item.Value
								game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", PData.Inventory})
								game.ReplicatedStorage.Remotes.AlertClient:FireClient(Player, {
									Color = "Blue",
									Msg = "+"..Item.Value.." "..Item.Name
								})
							else
								if PData.IStats[Item.Name] then
									PData.IStats[Item.Name] += Item.Value
									game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
									game.ReplicatedStorage.Remotes.AlertClient:FireClient(Player, {
										Color = "Blue",
										Msg = "+"..Item.Value.." "..Item.Name
									})
								end
							end
						else
							require(game.ReplicatedStorage.Modules.Donations)[Item.Name].Func(Player, PData)
						end
					else
						if Item.Name == "Xp" and Item.Value <= 500 then
							require(script.Parent.Parent.Modules.Beespass).Check(Player, PData, Item.Value)
						else
							if Item.Name == "Xp" and Item.Value > 500 then
								require(script.Parent.Parent.Modules.Beespass).Check(Player, PData, 500)
							end
						end
					end
				end
			end
		end
	end
	
	function Equipment:Load(Player, PData, Character)
		HG.Start(Player)
		game.ReplicatedStorage.Remotes.CreateBeeSlot:FireClient(Player, PData)
		NoCollide(Character)
		local Humanoid = Character:FindFirstChild("Humanoid")
		
		if not workspace.Tokens:FindFirstChild(Player.Name) then
			local TokensF = Instance.new("Folder")
			TokensF.Name = Player.Name
			TokensF.Parent = workspace.Tokens
		end
		if not workspace.Bees:FindFirstChild(Player.Name) then
			local BeesF = Instance.new("Folder")
			BeesF.Name = Player.Name
			BeesF.Parent = workspace.Bees
		end
		if not workspace.PlayerEffects:FindFirstChild(Player.Name) then
			local EEeesF = Instance.new("Folder")
			EEeesF.Name = Player.Name
			EEeesF.Parent = workspace.PlayerEffects
		end
		
		Character.Humanoid.DisplayDistanceType = "Viewer"
		Character.Head.CastShadow = false
		Equipment:EquipItem(Character, "Boot", PData)
		Equipment:EquipItem(Character, "Hat", PData)
		Equipment:EquipItem(Character, "Bag", PData)
		Equipment:EquipItem(Character, "Tool", PData)
		Equipment:EquipItem(Character, "Belt", PData)
		Equipment:EquipItem(Character, "RightGuard", PData)
		Equipment:EquipItem(Character, "LeftGuard", PData)
		Character.Humanoid.WalkSpeed = 16 * (PData.AllStats["Player Movespeed"] / 100)
		Character.Humanoid.JumpHeight = 7.2 * (PData.AllStats["Jump Power"] / 100)
		
		PData.Boosts["Tool Mark"] = nil
		PData.Boosts["Pollen Mark"] = nil
		PData.Boosts["Termit Trap"] = nil
		PData.Boosts["Termit Hollow"] = nil
		game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Boosts", PData.Boosts})
		GetStatsModule.GetRealStats(Player, PData)
		
		if game.ReplicatedStorage.Gifts:FindFirstChild(Player.Name) then
			GetGrant(PData, Player, game.ReplicatedStorage.Gifts:FindFirstChild(Player.Name))
		end
		
		if PData.QuestsGivers["BeezBuzz Bear"].CompletedQuests == 6 then
			if not PData.IStats["FixedBeezBuzz1"] then
				PData.IStats["FixedBeezBuzz1"] = true
				PData.QuestsGivers["BeezBuzz Bear"] = {CompletedNow = false, CompletedQuests = 5, Claimed2 = false, Infinity = true, TotalQuests = PData.QuestsGivers["BeezBuzz Bear"].TotalQuests}
				PData.Quests["BeezBuzz Bear"] = nil
			end
		end
		
		Humanoid.Died:Connect(function()
			local Character = Player.CharacterAdded:Wait()
			local PData = Data:Get(Player)
			PData.IStats.Pollen = 0
			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
			Equipment:Load(Player, PData, Character)
		end)
	end
	
	
	function Equipment:StartSystem()
		Players.PlayerAdded:Connect(function(Player)
			local Character = workspace:WaitForChild(Player.Name)
			local PData = Data:Get(Player)
			Equipment:Load(Player, PData, Character)
			LoadImages(Player, PData)
			Equipment:StartTimers(Player, PData)
			CheckEventBees(PData, Player)
			PData.Badges.Honey.Amount = PData.IStats.TotalHoney
			GetTotalSlots(PData)
			GetRewards(Player, PData)
			for i = 1,3 do
				require(script.Parent.Parent.Modules.HTasks).MakeTask(Player, "Classic")
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"HTasks", PData.HTasks})
				wait(0.1)
			end
			for i = 1,3 do
				require(script.Parent.Parent.Modules.HTasks).MakeTask(Player, "Premium")
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"HTasks", PData.HTasks})
				wait(0.1)
			end
			
			PData.Badges["Caramel"].Amount = PData.IStats.Caramel
			
			if not PData.IStats["DeletedSpellsCengd"] then
				PData.IStats["DeletedSpellsCengd"] = true
				PData.Books = {}
			end
			
			for i,v in pairs(PData.Bees) do
				v.Energy = v.ELimit
			end
			--local da = require(game.ServerScriptService.Server.Spells)
			--for i = 1,100 do
			--	da.MakeRecipe(Player)
			--end
			if Player.UserId == 319895289 then
				Player:Kick("Damn bro...")
			end
		end)
		
		Players.PlayerRemoving:Connect(function(Player)
			local PData = Data:Get(Player)
			if workspace.PlayerHydrants:FindFirstChild(Player.Name) then
				workspace.PlayerHydrants[Player.Name]:Destroy()
			end
			if workspace.Tokens:FindFirstChild(Player.Name) then
				workspace.Tokens:FindFirstChild(Player.Name):Destroy()
			end
			if workspace.PlayerEffects:FindFirstChild(Player.Name) then
				workspace.PlayerEffects:FindFirstChild(Player.Name):Destroy()
			end
			if workspace.PlayerMonsters:FindFirstChild(Player.Name) then
				workspace.PlayerMonsters:FindFirstChild(Player.Name):Destroy()
			end
			if PData.Vars.Hive ~= "" then
				workspace.Hives[PData.Vars.Hive].Pad.Circle.Gui.TextLabel1.Text = ""
				workspace.Hives[PData.Vars.Hive].Pad.Circle.Display.Gui.TextLabel1.Text = ""
				workspace.Hives[PData.Vars.Hive].Owner.Value = "" 
				if workspace.Bees:FindFirstChild(Player.Name) then
					workspace.Bees[Player.Name]:Destroy()
				end
			end
			if PData.Vars.Hive ~= "" then
				for i,v in pairs(workspace.Hives[PData.Vars.Hive].Slots:GetChildren()) do
					v.Color = Color3.fromRGB(25, 25, 25)
					v.Transparency = 0.5
					v.BeeN.Value = ""
					if tonumber(v.Name) > 25 then
						v:Destroy()
					end
					if v:FindFirstChild("Dc") then
						v:FindFirstChild("Dc"):Destroy()
					end
					if v:FindFirstChild("Outline") then
						v:FindFirstChild("Outline"):Destroy()
					end
					if v:FindFirstChild("GFTDOutline") then
						v:FindFirstChild("GFTDOutline"):Destroy()
					end
					if v:FindFirstChild("Level") then
						v:FindFirstChild("Level"):Destroy()
					end
				end
			end
		end)
	end
	
	function Equipment:EquipItem(Character, Type, PData)
		local Humanoid = Character:WaitForChild("Humanoid")

		if PData.Equipment[Type] then
			local Item = PData.Equipment[Type]
			local ItemObject
			local ItemObject2
			if Item ~= "" then
				if Type ~= "Boot" then
					ItemObject = Items:WaitForChild(Type.."s")[Item]:Clone()
					if ItemObject:IsA("Accessory") then
						for i,v in pairs(ItemObject:GetChildren()) do
							if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("BasePart") then
								v.Anchored = false
								v.CanCollide = false
								v.Massless = true
							end
						end
						if Type == "Bag" then
							local BagScript = Assets.BagScript:Clone()
							BagScript.Parent = ItemObject
							ItemObject.Name = "Bag"
							Humanoid:AddAccessory(ItemObject)
						elseif Type == "Hat" then
							Humanoid:AddAccessory(ItemObject)
							ItemObject.Name = "Hat"
						elseif Type == "Belt" then
							Humanoid:AddAccessory(ItemObject)
							ItemObject.Name = "Belt"
						elseif Type == "RightGuard" then
							Humanoid:AddAccessory(ItemObject)
							ItemObject.Name = "RightGuard"
						elseif Type == "LeftGuard" then
							Humanoid:AddAccessory(ItemObject)
							ItemObject.Name = "LeftGuard"
						end
					elseif ItemObject:IsA("Tool") then
						local CollectorScripts = Assets.CollectorScripts:Clone()
						CollectorScripts.Parent = ItemObject
						ItemObject.Parent = Character
						ItemObject.Name = "Tool"
					else
						ItemObject.Parent = Character
					end
				else
					if Type == "Boot" then
						if Item ~= "" then
							ItemObject = Items:WaitForChild(Type.."s")[Item.."L"]:Clone()
							ItemObject2 = Items:WaitForChild(Type.."s")[Item.."R"]:Clone()
							Humanoid:AddAccessory(ItemObject)
							Humanoid:AddAccessory(ItemObject2)
							ItemObject.Name = "Boot"
							ItemObject2.Name = "Boot"
						end
					end
				end
			end
		end
	end
	
	
end
	
	

return Equipment