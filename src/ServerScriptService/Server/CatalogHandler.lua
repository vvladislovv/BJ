local Players = game:GetService("Players")
local SSS = game:GetService("ServerScriptService")
local Rep = game.ReplicatedStorage
local Remotes = Rep.Remotes
local Modules = Rep.Modules
local Data = require(script.Parent.Data)
local Items = require(Modules.Items)
local Utils = require(Modules.Utils)
local Catalog = require(Modules.Guis.CatalogItems)
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
	
	function CheckBearBee(PData)
		
	end
	
	local function checkIngridients(Ingridients, PData)
		local ingridientsCompleted = 0

		for _, amount in pairs(Ingridients) do
			if PData.Inventory[amount.ItemType] >= amount.ItemAmount then
				ingridientsCompleted += 1
			end
		end

		return ingridientsCompleted
	end
	
	
	Remotes.CatalogBuy.OnServerEvent:Connect(function(Player, Offer)
		if game.Players:FindFirstChild(Player.Name) then
			local PData = Data:Get(Player)
			
			local OfferInfo = Catalog[Offer]
			local OfferCost = OfferInfo.Cost
			if not PData.IStats.Catalog1[Offer] and checkIngridients(OfferCost, PData) >= #OfferCost then
				PData.IStats.Catalog1[Offer] = true
				for _, CostItem in pairs(OfferInfo.Cost) do
					PData.Inventory[CostItem.ItemType] -= CostItem.ItemAmount
					Remotes.AlertClient:FireClient(Player, {
						Color = "Blue",
						Msg = "-"..CostItem.ItemAmount.." "..CostItem.ItemType
					})
				end
				for _, Item in pairs(OfferInfo.Content) do
					PData.Inventory[Item.ItemType] += Item.ItemAmount
					Remotes.AlertClient:FireClient(Player, {
						Color = "Blue",
						Msg = "+"..Item.ItemAmount.." "..Item.ItemType
					})
				end
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", PData.Inventory})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", "Catalog1", PData.IStats.Catalog1})
			end
		end
	end)
end

return BoostsHandler