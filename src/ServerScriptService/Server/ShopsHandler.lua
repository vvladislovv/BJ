local Players = game:GetService("Players")
local SSS = game:GetService("ServerScriptService")
local Rep = game.ReplicatedStorage
local Remotes = Rep.Remotes
local Modules = Rep.Modules
local Data = require(script.Parent.Data)
local Items = require(Modules.Items)
local Utils = require(Modules.Utils)
local Equipment = require(game.ServerScriptService.Server.Equipment)
local GetStatsModule = require(SSS.Functions.GetRealStats)
local GetCapacityModule = require(SSS.Functions.GetCapacity)

local function getHFolder(Player)
	if not workspace.PlayerHydrants:FindFirstChild(Player.Name) then
		local gb = Instance.new("Folder", workspace.PlayerHydrants)
		gb.Name = Player.Name
		return gb
	else
		return workspace.PlayerHydrants:FindFirstChild(Player.Name)
	end
end
local BoostsHandler = {} do
	local Blacklist = {
		["Tool"] = true,
		["Tools"] = true,
		["Hydrant"] = true,
		["Hydrants"] = true,
		["Glider"] = true,
		["Gliders"] = true,
		["Bag"] = true,
		["Bags"] = true,
		["Belts"] = true,
		["Boots"] = true,
		["Hats"] = true,
		["RightGuards"] = true,
		["BlueGuards"] = true,
	}
	function DeleteItems(HRP, ItemType, ItemName, PData)
		local Player = game.Players:FindFirstChild(HRP.Name)
		if HRP:FindFirstChild(ItemType) then
			HRP:FindFirstChild(ItemType):Destroy()
			if Items.Accessorys[ItemName] then
				if Items.Accessorys[ItemName].Buffs then
					RemoveStats(Player, PData)
				end
			end
		end
	end
	
	function AddStats2(Item, PData)
		local ItemStats = Items.Accessorys[Item].Buffs
		for i = 1, #ItemStats do
			if ItemStats[i][2] == "Percent" then
				PData.AllStats[ItemStats[i][1]] += ItemStats[i][3]
			elseif ItemStats[i][2] == "Multiplier" then
				PData.AllStats[ItemStats[i][1]] = PData.AllStats[ItemStats[i][1]] * ItemStats[i][3]
			end
		end
	end
	function AddStats(Player, PData)
		GetStatsModule.GetRealStats(Player, PData)
	end
	function RemoveStats(Player, PData)
		GetStatsModule.GetRealStats(Player, PData)
	end
	
	function RemoveStats2(Item, PData)
		local ItemStats = Items.Accessorys[Item].Buffs
		for i = 1, #ItemStats do
			if ItemStats[i][2] == "Percent" then
				if PData.AllStats[ItemStats[i][1]] > 0 then
					PData.AllStats[ItemStats[i][1]] -= ItemStats[i][3]
					if PData.AllStats[ItemStats[i][1]] < 0 then
						PData.AllStats[ItemStats[i][1]] = 0
					end
				end
				elseif ItemStats[i][2] == "Multiplier" then
				if PData.AllStats[ItemStats[i][1]] > 0 then
					PData.AllStats[ItemStats[i][1]] = PData.AllStats[ItemStats[i][1]] / ItemStats[i][3]
					if PData.AllStats[ItemStats[i][1]] < 0 then
						PData.AllStats[ItemStats[i][1]] = 0
					end
				end
			end
			wait(0.1)
			if i >= #ItemStats then
				return true
			end
		end
	end
	
	local function checkIngridients(Ingridients, PData)
		local ingridientsCompleted = 0

		for _, amount in pairs(Ingridients:GetChildren()) do
			if PData.Inventory[amount.Name] >= amount.Amount.Value then
				ingridientsCompleted += 1
			end
		end

		return ingridientsCompleted
	end
	
	function NewSlot(PData)
		local UpPos = 1.529
		local AllSlots = workspace.Hives[PData.Vars.Hive].Slots
		local Template = game.ServerStorage.Assets.SlotTemplate:Clone()

		if PData.TotalSlots <= 30 then
			if PData.TotalSlots % 2 == 0 and PData.TotalSlots % 5 ~= 0 then
				PData.TotalSlots += 1
				Template.Name = PData.TotalSlots
				Template.Position = AllSlots[PData.TotalSlots - 1].Position + Vector3.new(3.141,1.529,0)
				Template.Parent = AllSlots
			
			elseif PData.TotalSlots % 2 ~= 0 and PData.TotalSlots % 5 ~= 0 then
				PData.TotalSlots += 1
				Template.Name = PData.TotalSlots
				Template.Position = AllSlots[PData.TotalSlots - 1].Position + Vector3.new(3.141,-1.529,0)
				Template.Parent = AllSlots

			elseif PData.TotalSlots % 5 == 0 then
				PData.TotalSlots += 1
				Template.Name = PData.TotalSlots
				Template.Position = AllSlots[PData.TotalSlots - 1].Position + Vector3.new(-3.141 * 4,1.529 * 2,0)
				Template.Parent = AllSlots
				workspace.Hives[PData.Vars.Hive].Pad.Circle.Display.Position += Vector3.new(0,1.529 * 2,0)
			end
		else
			if PData.TotalSlots % 2 == 0 and PData.TotalSlots % 5 ~= 0 then
				PData.TotalSlots += 1
				Template.Name = PData.TotalSlots
				local UpPos = -1.529
				if PData.TotalSlots >= 36 and PData.TotalSlots <= 41 then
					UpPos = 1.529
				elseif PData.TotalSlots >= 40 and PData.TotalSlots <= 46 then
					UpPos = -1.529
				elseif PData.TotalSlots >= 46 and PData.TotalSlots <= 50 then
					UpPos = 1.529
				elseif PData.TotalSlots >= 52 then
					UpPos = -1.529
				end
				Template.Position = AllSlots[PData.TotalSlots - 1].Position + Vector3.new(3.141,UpPos,0)
				Template.Parent = AllSlots
			elseif PData.TotalSlots % 2 ~= 0 and PData.TotalSlots % 5 ~= 0 then
				PData.TotalSlots += 1
				Template.Name = PData.TotalSlots
				local UpPos = 1.529
				if PData.TotalSlots >= 36 and PData.TotalSlots <= 40 then
					UpPos = -1.529
				elseif PData.TotalSlots >= 41 and PData.TotalSlots <= 46 then
					UpPos = 1.529
				elseif PData.TotalSlots >= 46 and PData.TotalSlots <= 50 then
					UpPos = -1.529
				elseif PData.TotalSlots >= 52 then
					UpPos = 1.529
				end
				Template.Position = AllSlots[PData.TotalSlots - 1].Position + Vector3.new(3.141,UpPos,0)
				Template.Parent = AllSlots
			elseif PData.TotalSlots % 5 == 0 then
				PData.TotalSlots += 1
				Template.Name = PData.TotalSlots
				Template.Position = AllSlots[PData.TotalSlots - 1].Position + Vector3.new(-3.141 * 4,1.529 * 2,0)
				Template.Parent = AllSlots
				workspace.Hives[PData.Vars.Hive].Pad.Circle.Display.Position += Vector3.new(0,1.529 * 2,0)
			end
		end
		PData.Bees[PData.TotalSlots] = {
			Properties = {
				PollenX = 1,
				MoveX = 1,
		},
		Attack = 1, BeeName = "", Slot = 0, ELimit = 10, Energy = 10, Gifted = false, Bond = 0, Level = 0, Effect = "", EffectTime = 0}
	end
	
	Remotes.Shop.OnServerEvent:Connect(function(Player, Item)
		if game.Players:FindFirstChild(Player.Name) then
		local PData = Data:Get(Player)
		--local CostType
		--local Cost
		if Item:FindFirstChild("Bee") and Item:FindFirstChild("Bee").Value == "BPBee" then
				if not PData.BPBees[Item.ItemType.Value] then
					if Item:FindFirstChild("Craft") then
						if PData[Item.CostAType.Value][Item.CostType.Value] >= Item.Cost.Value and checkIngridients(Item:WaitForChild("Craft"), PData) >= #Item.Craft:GetChildren() then
							PData[Item.ItemAType.Value][Item.ItemType.Value] += Item.ItemAmount.Value
							PData[Item.CostAType.Value][Item.CostType.Value] -= Item.Cost.Value
							game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {Item.CostAType.Value, Item.CostType.Value, PData[Item.CostAType.Value][Item.CostType.Value]})
							game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {Item.ItemAType.Value, Item.ItemType.Value, PData[Item.ItemAType.Value][Item.ItemType.Value]})
							PData.BPBees[Item.ItemType.Value] = true
							Remotes.SSound:FireClient(Player, "Purchase", 1, true)
							Remotes.SSound:FireAllClients("BuyEventBee", 1, true)
							Remotes.AlertClient:FireClient(Player, {
								Color = "Blue",
								Msg = "+"..Utils:CommaNumber(Item.ItemAmount.Value).." "..Item.ItemType.Value
							})
							Remotes.AlertClient:FireAllClients({
								Color = "Blue",
								Msg = Player.Name.." bought a "..Item.ItemType.Value
							})
							if Item:FindFirstChild("Craft") then
								for _, amount in pairs(Item.Craft:GetChildren()) do
									PData.Inventory[amount.Name] -= amount.Amount.Value
									game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", amount.Name, amount.Amount.Value})
									Remotes.AlertClient:FireClient(Player, {
										Color = "Blue",
										Msg = "-"..Utils:CommaNumber(amount.Amount.Value).." "..amount.Name
									})
								end
							end
						end
					else
						if PData[Item.CostAType.Value][Item.CostType.Value] >= Item.Cost.Value then
							PData[Item.ItemAType.Value][Item.ItemType.Value] += Item.ItemAmount.Value
							PData[Item.CostAType.Value][Item.CostType.Value] -= Item.Cost.Value
							game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {Item.CostAType.Value, Item.CostType.Value, PData[Item.CostAType.Value][Item.CostType.Value]})
							game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {Item.ItemAType.Value, Item.ItemType.Value, PData[Item.ItemAType.Value][Item.ItemType.Value]})
							PData.BPBees[Item.ItemType.Value] = true
							Remotes.SSound:FireClient(Player, "Purchase", 1, true)
							Remotes.SSound:FireAllClients("BuyEventBee", 1, true)
							Remotes.AlertClient:FireClient(Player, {
								Color = "Blue",
								Msg = "+"..Utils:CommaNumber(Item.ItemAmount.Value).." "..Item.ItemType.Value
							})
							Remotes.AlertClient:FireAllClients({
								Color = "Blue",
								Msg = Player.Name.." bought a "..Item.ItemType.Value
							})
						end
					end
				end
		end
			
		if Item.ItemType.Value == "Basic Egg" then
			--CostType = Item.CostType.Value
			if PData.IStats.BasicEggs < 25 then
				Item.Cost.Value = Items.EggCosts[tostring(PData.IStats.BasicEggs)]
			else
				Item.Cost.Value = Items.EggCosts["25"]
			end
			if PData[Item.CostAType.Value][Item.CostType.Value] >= Item.Cost.Value and game.Players:FindFirstChild(Player.Name) then
				PData.IStats.BasicEggs += 1
				PData.Inventory["Basic Egg"] += 1
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", "Basic Egg", PData.Inventory["Basic Egg"]})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", "BasicEggs", PData.IStats["BasicEggs"]})
				PData[Item.CostAType.Value][Item.CostType.Value] -= Item.Cost.Value
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {Item.CostAType.Value, Item.CostType.Value, PData[Item.CostAType.Value][Item.CostType.Value]})
				Remotes.SSound:FireClient(Player, "Purchase",1, true)
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+1 Basic Egg" 
				})
			end
			
		elseif Item.ItemType.Value == "Ticket" then
			--Cost = Item.Cost.Value
			--CostType = Item.CostType.Value
			Item.Cost.Value = PData.IStats.TicketCosts2
			if PData[Item.CostAType.Value][Item.CostType.Value] >= Item.Cost.Value and game.Players:FindFirstChild(Player.Name) then
				PData.Inventory["Ticket"] += 1
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", "Ticket", PData.Inventory["Ticket"]})
				PData[Item.CostAType.Value][Item.CostType.Value] -= Item.Cost.Value
				Item.Cost.Value = math.round(Item.Cost.Value * 1.05)
				PData.IStats.TicketCosts2 = Item.Cost.Value
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", "Honey", PData.IStats.Honey})
				Remotes.SSound:FireClient(Player, "Purchase",1, true)
					Remotes.AlertClient:FireClient(Player, {
						Color = "Blue",
						Msg = "+1 Ticket"
				})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", "TicketCosts2", PData.IStats.TicketCosts2})
			end
		elseif Item.ItemType.Value == "HiveSlot" and PData.TotalSlots < 50 and game.Players:FindFirstChild(Player.Name) then
			local Cost = Items.SlotCosts[PData.TotalSlots - 24]
			if PData.IStats.Honey >= Items.SlotCosts[PData.TotalSlots - 24] then
				NewSlot(PData)
				PData.IStats.Honey -= Items.SlotCosts[PData.TotalSlots - 25]
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", "Honey", PData.IStats.Honey})
				Remotes.SSound:FireClient(Player, "Purchase",1, true)
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "-"..Utils:CommaNumber(Items.SlotCosts[PData.TotalSlots - 25]).." Honey"
				})
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+1 Hive Slot"
				})
			end
		elseif Item.ItemType.Value == "Royal Jelly" and game.Players:FindFirstChild(Player.Name) then
			--Cost = Item.Cost.Value
			--CostType = Item.CostType.Value
			if PData.IStats.JellyCosts2 < 100000 then
			Item.Cost.Value = PData.IStats.JellyCosts2
				if PData[Item.CostAType.Value][Item.CostType.Value] >= Item.Cost.Value then
					PData.Inventory["Royal Jelly"] += 1
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", "Royal Jelly", PData.Inventory["Royal Jelly"]})
					PData[Item.CostAType.Value][Item.CostType.Value] -= Item.Cost.Value
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {Item.CostAType.Value, Item.CostType.Value, PData[Item.CostAType.Value][Item.CostType.Value]})
					Item.Cost.Value = math.round(Item.Cost.Value * 1.05)
					PData.IStats.JellyCosts2 = Item.Cost.Value
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", "JellyCosts2", PData.IStats.JellyCosts2})
				Remotes.SSound:FireClient(Player, "Purchase",1, true)
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+1 Royal Jelly" 
					})
				end
			elseif PData.IStats.JellyCosts2 >= 100000 then
				Item.Cost.Value = 100000
				if PData[Item.CostAType.Value][Item.CostType.Value] >= Item.Cost.Value and game.Players:FindFirstChild(Player.Name) then
					PData.Inventory["Royal Jelly"] += 1
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", "Royal Jelly", PData.Inventory["Royal Jelly"]})
					PData[Item.CostAType.Value][Item.CostType.Value] -= Item.Cost.Value
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {Item.CostAType.Value, Item.CostType.Value, PData[Item.CostAType.Value][Item.CostType.Value]})
					Item.Cost.Value = 100000
					Remotes.SSound:FireClient(Player, "Purchase",1, true)
					Remotes.AlertClient:FireClient(Player, {
						Color = "Blue",
						Msg = "+1 Royal Jelly" 
					})
				end
			end
		elseif Item.ItemAType.Value == "Inventory" and not Item:FindFirstChild("Bee") and game.Players:FindFirstChild(Player.Name) then
			if not string.find(Item.ItemType.Value, "Sower") then
				if Item:FindFirstChild("Craft") then
					if checkIngridients(Item:WaitForChild("Craft"), PData) >= #Item.Craft:GetChildren() then
						if PData[Item.CostAType.Value][Item.CostType.Value] >= Item.Cost.Value then
							PData[Item.ItemAType.Value][Item.ItemType.Value] += Item.ItemAmount.Value
							PData[Item.CostAType.Value][Item.CostType.Value] -= Item.Cost.Value
							game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {Item.ItemAType.Value, Item.ItemType.Value, PData[Item.ItemAType.Value][Item.ItemType.Value]})
							game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {Item.CostAType.Value, Item.CostType.Value, PData[Item.CostAType.Value][Item.CostType.Value]})
							for _, amount in pairs(Item.Craft:GetChildren()) do
								PData.Inventory[amount.Name] -= amount.Amount.Value
								game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", amount.Name, amount.Amount.Value})
								Remotes.AlertClient:FireClient(Player, {
									Color = "Blue",
									Msg = "-"..Utils:CommaNumber(amount.Amount.Value).." "..amount.Name
								})
							end
							Remotes.SSound:FireClient(Player, "Purchase",1, true)
							Remotes.AlertClient:FireClient(Player, {
								Color = "Blue",
								Msg = "+"..Utils:CommaNumber(Item.ItemAmount.Value).." "..Item.ItemType.Value
							})
						end
					end
				else
					if PData[Item.CostAType.Value][Item.CostType.Value] >= Item.Cost.Value then
						PData[Item.ItemAType.Value][Item.ItemType.Value] += Item.ItemAmount.Value
						PData[Item.CostAType.Value][Item.CostType.Value] -= Item.Cost.Value
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {Item.ItemAType.Value, Item.ItemType.Value, PData[Item.ItemAType.Value][Item.ItemType.Value]})
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {Item.CostAType.Value, Item.CostType.Value, PData[Item.CostAType.Value][Item.CostType.Value]})
						--game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {Item.CostAType.Value, Item.CostType.Value, PData[Item.CostAType.Value][Item.CostType.Value]})
						Remotes.SSound:FireClient(Player, "Purchase",1, true)
						Remotes.AlertClient:FireClient(Player, {
							Color = "Blue",
							Msg = "+"..Utils:CommaNumber(Item.ItemAmount.Value).." "..Item.ItemType.Value
						})
					end
				end
			end
		elseif Item.ItemAType.Value == "Equipment" and not Item:FindFirstChild("Bee") and game.Players:FindFirstChild(Player.Name) then
			if PData.Equipment[Item.ItemCType.Value.."s"][Item.ItemType.Value] and PData.Equipment[Item.ItemCType.Value] ~= Item.ItemType.Value then

					DeleteItems(Player.Character, Item.ItemCType.Value, Item.ItemType.Value, PData)
				if PData.Equipment[Item.ItemCType.Value] ~= "" and not Blacklist[Item.ItemCType.Value] then
					game.ReplicatedStorage.Remotes.UIEquip:FireClient(Player, PData.Equipment[Item.ItemCType.Value], "Remove Item")
				end
				if Item.ItemCType.Value == "Bag" then
					--PData.IStats.Capacity = Items.Accessorys[PData.Equipment[Item.ItemCType.Value]].Capacity
					PData.Equipment[Item.ItemCType.Value] = Item.ItemType.Value
					PData.Equipment[Item.ItemCType.Value.."s"][Item.ItemType.Value] = true
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Equipment", Item.ItemCType.Value, Item.ItemType.Value})
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Equipment", Item.ItemCType.Value.."s", Item.ItemType.Value, true})
					GetStatsModule.GetRealStats(Player, PData)
				else
					PData.Equipment[Item.ItemCType.Value] = Item.ItemType.Value
					PData.Equipment[Item.ItemCType.Value.."s"][Item.ItemType.Value] = true
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Equipment", Item.ItemCType.Value, Item.ItemType.Value})
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Equipment", Item.ItemCType.Value.."s", Item.ItemType.Value, true})
					end
					if Item.ItemCType.Value == "Hydrant" then
						PData.Inventory["Hydrant Builder"] = 1
						PData.Vars.PlacedHydrants = 0
						getHFolder(Player):ClearAllChildren()
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", "Hydrant Builder", PData.Inventory["Hydrant Builder"]})
					end
				if Items.Accessorys[Item.ItemType.Value] then
					if Items.Accessorys[Item.ItemType.Value].Buffs then
						AddStats(Player, PData)
					end
				end
				if PData.Equipment[Item.ItemCType.Value] ~= "" and not Blacklist[Item.ItemCType.Value] then
					game.ReplicatedStorage.Remotes.UIEquip:FireClient(Player, PData.Equipment[Item.ItemCType.Value], "Create")
					end
					
					if Item.ItemCType.Value ~= "Hydrant" then
						Equipment:EquipItem(Player.Character, Item.ItemCType.Value, PData)
					end
			elseif PData[Item.CostAType.Value][Item.CostType.Value] >= Item.Cost.Value and not PData.Equipment[Item.ItemCType.Value.."s"][Item.ItemType.Value] and PData.Equipment[Item.ItemCType.Value] ~= Item.ItemType.Value and not Item:FindFirstChild("Craft") then
				DeleteItems(Player.Character, Item.ItemCType.Value, Item.ItemType.Value, PData)
				if PData.Equipment[Item.ItemCType.Value] ~= "" and not Blacklist[Item.ItemCType.Value] then
					game.ReplicatedStorage.Remotes.UIEquip:FireClient(Player, PData.Equipment[Item.ItemCType.Value], "Remove Item")
				end
				if Item.ItemCType.Value == "Bag" then
					--PData.IStats.Capacity -= Items.Accessorys[PData.Equipment[Item.ItemCType.Value]].Capacity
					PData.Equipment[Item.ItemCType.Value] = Item.ItemType.Value
					PData.Equipment[Item.ItemCType.Value.."s"][Item.ItemType.Value] = true
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Equipment", Item.ItemCType.Value, Item.ItemType.Value})
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Equipment", Item.ItemCType.Value.."s", Item.ItemType.Value, true})
					GetStatsModule.GetRealStats(Player, PData)
					else
						--print(PData.Equipment)
						--print(Item)
					PData.Equipment[Item.ItemCType.Value] = Item.ItemType.Value
					PData.Equipment[Item.ItemCType.Value.."s"][Item.ItemType.Value] = true
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Equipment", Item.ItemCType.Value, Item.ItemType.Value})
						
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Equipment", Item.ItemCType.Value.."s", Item.ItemType.Value, true})
						--print(PData.Equipment)
					end
					PData[Item.CostAType.Value][Item.CostType.Value] -= Item.Cost.Value
					if Item.ItemCType.Value == "Hydrant" then
						PData.Inventory["Hydrant Builder"] = 1
						PData.Vars.PlacedHydrants = 0
						getHFolder(Player):ClearAllChildren()
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", "Hydrant Builder", PData.Inventory["Hydrant Builder"]})
					end
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {Item.CostAType.Value, Item.CostType.Value, PData[Item.CostAType.Value][Item.CostType.Value]})
				if PData.Equipment[Item.ItemCType.Value] ~= "" and not Blacklist[Item.ItemCType.Value] then
					game.ReplicatedStorage.Remotes.UIEquip:FireClient(Player, PData.Equipment[Item.ItemCType.Value], "Create")
					end
					if Item.ItemCType.Value ~= "Hydrant" then
						Equipment:EquipItem(Player.Character, Item.ItemCType.Value, PData)
					end
				if Items.Accessorys[Item.ItemType.Value] then
					if Items.Accessorys[Item.ItemType.Value].Buffs then
						AddStats(Player, PData)
					end
				end
			elseif PData[Item.CostAType.Value][Item.CostType.Value] >= Item.Cost.Value and not PData.Equipment[Item.ItemCType.Value.."s"][Item.ItemType.Value] and PData.Equipment[Item.ItemCType.Value] ~= Item.ItemType.Value and Item:FindFirstChild("Craft") then
				if checkIngridients(Item.Craft, PData) >= #Item.Craft:GetChildren() then
					DeleteItems(Player.Character, Item.ItemCType.Value, Item.ItemType.Value, PData)
					if PData.Equipment[Item.ItemCType.Value] ~= "" and not Blacklist[Item.ItemCType.Value] then
						game.ReplicatedStorage.Remotes.UIEquip:FireClient(Player, PData.Equipment[Item.ItemCType.Value], "Remove Item")
					end
					if Item.ItemCType.Value == "Bag" then
						--PData.IStats.Capacity -= Items.Accessorys[PData.Equipment[Item.ItemCType.Value]].Capacity
						PData.Equipment[Item.ItemCType.Value] = Item.ItemType.Value
						PData.Equipment[Item.ItemCType.Value.."s"][Item.ItemType.Value] = true
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Equipment", Item.ItemCType.Value, Item.ItemType.Value})
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Equipment", Item.ItemCType.Value.."s", Item.ItemType.Value, true})
						GetStatsModule.GetRealStats(Player, PData)
					else
						PData.Equipment[Item.ItemCType.Value] = Item.ItemType.Value
						PData.Equipment[Item.ItemCType.Value.."s"][Item.ItemType.Value] = true
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Equipment", Item.ItemCType.Value, Item.ItemType.Value})
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Equipment", Item.ItemCType.Value.."s", Item.ItemType.Value, true})
					end
					PData[Item.CostAType.Value][Item.CostType.Value] -= Item.Cost.Value
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {Item.CostAType.Value, Item.CostType.Value, PData[Item.CostAType.Value][Item.CostType.Value]})
					
					for _, amount in pairs(Item.Craft:GetChildren()) do
						PData.Inventory[amount.Name] -= amount.Amount.Value
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", amount.Name, PData.Inventory[amount.Name]})
						end

					if PData.Equipment[Item.ItemCType.Value] ~= "" and not Blacklist[Item.ItemCType.Value] then
						game.ReplicatedStorage.Remotes.UIEquip:FireClient(Player, PData.Equipment[Item.ItemCType.Value], "Create")
					end
						
					Equipment:EquipItem(Player.Character, Item.ItemCType.Value, PData)
					GetStatsModule.GetRealStats(Player, PData)
						
					Remotes.SSound:FireClient(Player, "Purchase",1, true)
					Remotes.AlertClient:FireClient(Player, {
						Color = "Blue",
						Msg = "Recieved "..Item.ItemType.Value
						})
						if Items.Accessorys[Item.ItemType.Value] then
							if Items.Accessorys[Item.ItemType.Value].Buffs then
								AddStats(Player, PData)
							end
						end
				end
			end
			end
		end
	end)
end

return BoostsHandler