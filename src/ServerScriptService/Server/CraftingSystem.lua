local Remotes = game:GetService("ReplicatedStorage").Remotes
local Data = require(game:GetService("ServerScriptService").Server.Data)
local CraftItems = require(game.ReplicatedStorage.Modules.CraftingItems)

local TimePerOne = 300

local module = {} do
	
	Remotes.CraftItem.OnServerEvent:Connect(function(Player, Item, Amount)
		local PData = Data:Get(Player)
		
		if not PData.Craft and Amount > 0 then
		
		local CanCraft
		for Item, IAmount in pairs(CraftItems.Items[Item].Ingredients) do
			for InvItem, InvAmount in pairs(PData.Inventory) do
				if InvItem == Item then
					if InvAmount >= IAmount * Amount then
						CanCraft = true
					else
						CanCraft = false
					end
				end
			end
		end
		
		if CanCraft == true then
			PData.Craft = true
			--if not PData.Crafting[Item] then
				for Item, IAmount in pairs(CraftItems.Items[Item].Ingredients) do
					PData.Inventory[Item] -= (IAmount * Amount)
					Remotes.AlertClient:FireClient(Player, {
						Color = "Blue",
						Msg = "-"..(IAmount * Amount).." "..Item
					})
				end
				PData.Crafting[Item] = {Time = (TimePerOne * Amount) + os.time(), ItemAmount = Amount}
				spawn(function()
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Crafting", PData.Crafting})
					wait(0.05)
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Craft", PData.Craft})
					wait(0.05)
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", PData.Inventory})
				end)
				
			end
			--end
		end
	end)
	
	
	Remotes.GetItemsFromCraft.OnServerEvent:Connect(function(Player, Item)
		local PData = Data:Get(Player)
		
		if PData.Craft == true then
			if PData.Crafting[Item] then
				if PData.Crafting[Item].Time - os.time() <= 0 then
					PData.Craft = false
					
					--PData.IStats.CraftedItems += PData.Crafting[Item].ItemAmount
					
					PData.Inventory[Item] += PData.Crafting[Item].ItemAmount
					Remotes.AlertClient:FireClient(Player, {
						Color = "Blue",
						Msg = "+"..PData.Crafting[Item].ItemAmount.." "..Item.." From Mixer!"
					})
					
					PData.Crafting = {}
					spawn(function()
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Crafting", PData.Crafting})
						wait(0.05)
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Craft", PData.Craft})
						wait(0.05)
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", PData.Inventory})
					end)
				end
			end
		end
	end)
	
	Remotes.CancelCraft.OnServerEvent:Connect(function(Player, Item)
		local PData = Data:Get(Player)
		
		if PData.Craft == true and PData.Crafting[Item] then
			PData.Craft = false
			
			local CraftingItems = math.round((PData.Crafting[Item].Time - os.time()) / TimePerOne)
			
			local ItemAmount = PData.Crafting[Item].ItemAmount
			
			local GivedResources = ItemAmount - CraftingItems
			
			if GivedResources > 0 then
				PData.Inventory[Item] += GivedResources
				--PData.IStats.CraftedItems += GivedResources
				
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..(GivedResources).." "..Item.." Crafted before Cancellation"
				})
			end
			for DItem, IAmount in pairs(CraftItems.Items[Item].Ingredients) do
				PData.Inventory[DItem] += (IAmount * CraftingItems)
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..(IAmount * CraftingItems).." "..DItem.." From Cancellation of Crafting"
				})
			end
			
			PData.Crafting = {}
			
			--game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
			spawn(function()
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Crafting", PData.Crafting})
				wait(0.05)
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Craft", PData.Craft})
				wait(0.05)
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", PData.Inventory})
			end)
			
		end
	end)
end

return module
