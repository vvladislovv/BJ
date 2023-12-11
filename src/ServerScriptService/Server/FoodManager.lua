local Players = game:GetService("Players")
local SSS = game:GetService("ServerScriptService")
local Rep = game.ReplicatedStorage
local Remotes = Rep.Remotes
local Modules = Rep.Modules
local Data = require(script.Parent.Data)
local Items = require(Modules.Items)
local Fields = require(script.Parent.GenerateFields)
local Utilities = require(game.ReplicatedStorage.Utilities)
local ts = game:GetService("TweenService")
local Utils = require(Modules.Utils)
local Bees = game.ReplicatedStorage.Bees
local Levels = require(Modules.BeeLevels)
local GetRealStats = require(game.ServerScriptService.Functions.GetRealStats)
local PopUp = require(game.ReplicatedStorage.Modules.Guis.PopUp)
local HivesManager = require(game.ReplicatedStorage.Modules.Guis.HivesManager)

local BoostsHandler = {} do
	Remotes.FoodBee.OnServerEvent:Connect(function(Player, Item, Slot, Type, ItemAmount)
		local IFM = Items.Eggs
		local PData = Data:Get(Player)
		local BeeData = PData.Bees[tonumber(Slot.Name)]
		local BeeModule = require(Bees[BeeData.BeeName])
		if PData.Inventory[Item] >= ItemAmount and Slot.BeeN.Value ~= "" and ItemAmount > 0 then
			if Type == "Food" then
				if BeeData.Level < 15 then
				local BondAmount = IFM[Item].Amount * ItemAmount
				if BeeModule.FavoriteFood == Item then
				BondAmount = BondAmount * 2
					Remotes.AlertClient:FireClient(Player, {
						Color = "Purple2",
						Msg = "Your "..BeeData.BeeName.." Bee loves a "..Item.."s!!!😊💖"
					})
				end
				BeeData.Bond += BondAmount
				PData.Inventory[Item] -= ItemAmount
					Remotes.AlertClient:FireClient(Player, {
						Color = "Purple",
						Msg = "The Bond of "..BeeData.BeeName.." Bee increased by "..Utils:CommaNumber(IFM[Item].Amount * ItemAmount).."."
					})
					Remotes.AlertClient:FireClient(Player, {
						Color = "Purple",
						Msg = "("..Utils:CommaNumber(BeeData.Bond).."/"..Utils:CommaNumber(Levels.Levels[BeeData.Level].Amount)..")"
					})
					
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Bees", PData.Bees})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", Item, PData.Inventory[Item]})
				if BeeData.Bond >= Levels.Levels[BeeData.Level].Amount then
					local Compensation = BeeData.Bond - Levels.Levels[BeeData.Level].Amount
					if Compensation >= 0 then
						BeeData.Bond = Compensation
					else
						BeeData.Bond = 0
					end
						
						BeeData.Level += 1
						
						if game.Players:FindFirstChild(Player.Name) then
							local Bee = game.Workspace.Bees:FindFirstChild(Player.Name):FindFirstChild(tonumber(Slot.Name))
							Bee:FindFirstChild("L"):FindFirstChild("Left").TextLabel.Text = BeeData.Level
							Bee:FindFirstChild("R"):FindFirstChild("Right").TextLabel.Text = BeeData.Level
						end
						
					local PollenXAmount = (BeeData.Level / 4)
					BeeData.Properties.PollenX += PollenXAmount
					local MoveXAmount = (BeeData.Level / 5)
					BeeData.Properties.MoveX += MoveXAmount
					if BeeData.Attack > 0 then
						BeeData.Attack += 1
					end
					Slot.Level.UI.Lbl.Text = BeeData.Level
					local BeeSpeed = BeeModule.Speed + BeeData.Properties.MoveX
					workspace.Bees[Player.Name][Slot.Name].AlignPosition.MaxVelocity = BeeSpeed * (PData.AllStats["Bee Movespeed"] / 100)
					Remotes.FoodBee:FireClient(Player, BeeData.Level, BeeData.BeeName, PollenXAmount, BeeData.Attack, MoveXAmount)
					Remotes.AlertClient:FireClient(Player, {
						Color = "Purple2",
						Msg = "Your "..BeeData.BeeName.." Bee has Reached a New "..BeeData.Level.." Level!!"
					})
						
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Bees", tonumber(Slot.Name), PData.Bees[tonumber(Slot.Name)]})
					end	
				end
			elseif Type == "EffectFood" then
				if Item == "Spoiled Cookie" then
					local Bee = BeeData.BeeName
					PData.Inventory[Item] -= 1
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", Item, PData.Inventory[Item]})
					local BeeModule = require(game.ReplicatedStorage.Bees[Bee])
					if BeeModule.Rarity == "Event" and game.Players:FindFirstChild(Player.Name) then
						PData.Inventory[Bee.." Bee Egg"] += 1
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", Bee.." Bee Egg", PData.Inventory[Bee.." Bee Egg"]})
						Remotes.AlertClient:FireClient(Player, {
							Color = "Blue",
							Msg = "+1 "..Bee.." Bee Egg"
						})
					end
					PData.TotalBees -= 1
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"TotalBees", PData.TotalBees})
					workspace.Bees[Player.Name][Slot.Name]:Destroy()

					PData.Bees[tonumber(Slot.Name)] = {
						Properties = {
							PollenX = 0,
							MoveX = 0,
						},
						BeeName = "", Slot = 0, ELimit = 0, Energy = 0, Gifted = false, Bond = 0, Level = 0, Effect = "", EffectTime = 0}
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Bees", tonumber(Slot.Name), PData.Bees[tonumber(Slot.Name)]})
					GetRealStats.GetRealStats(Player, PData)

					local OL = Slot.Outline
					local DC = Slot.Dc
					DC:Destroy()
					OL:Destroy()
					Slot.Level:Destroy()
					if Slot:FindFirstChild("GFTDOutline") then
						GetRealStats.GetRealStats(Player, PData)
						Slot:FindFirstChild("GFTDOutline"):Destroy()
					end

					Slot.Color = Color3.fromRGB(25, 25, 25)
					Slot.Transparency = 0.5
					Slot.BeeN.Value = ""
					Remotes.CreateBeeSlot:FireClient(Player, PData, Bee)
			elseif Item == "Debug Cookie" then
					if BeeData.Level < 15 then
					BeeData.Level = #Levels.Levels + 1
					PData.Inventory[Item] -= 1
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", Item, PData.Inventory[Item]})
						
					if BeeData.Attack > 0 then
						BeeData.Attack += 15
					end
						
					if game.Players:FindFirstChild(Player.Name) then
						local Bee = game.Workspace.Bees:FindFirstChild(Player.Name):FindFirstChild(tonumber(Slot.Name))
						Bee:FindFirstChild("L"):FindFirstChild("Left").TextLabel.Text = BeeData.Level
						Bee:FindFirstChild("R"):FindFirstChild("Right").TextLabel.Text = BeeData.Level
					end
					
					Remotes.AlertClient:FireClient(Player, {
						Color = "Purple",
						Msg = "The Bond of "..BeeData.BeeName.." Bee increased by Max."
					})
					
					local PollenXAmount = (BeeData.Level / 4)
					BeeData.Properties.PollenX += PollenXAmount
					local MoveXAmount = (BeeData.Level / 5)
					BeeData.Properties.MoveX += MoveXAmount
					BeeData.Attack += 1
					Slot.Level.UI.Lbl.Text = BeeData.Level
					local BeeSpeed = BeeModule.Speed + BeeData.Properties.MoveX
					workspace.Bees[Player.Name][Slot.Name].AlignPosition.MaxVelocity = BeeSpeed * (PData.AllStats["Bee Movespeed"] / 100)
					Remotes.FoodBee:FireClient(Player, BeeData.Level, BeeData.BeeName, PollenXAmount, BeeData.Attack, MoveXAmount)
					Remotes.AlertClient:FireClient(Player, {
						Color = "Purple2",
						Msg = "Your "..BeeData.BeeName.." Bee has Reached a New "..BeeData.Level.." Level!!"
					})

					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Bees", PData.Bees})
					end
				elseif Item == "Star Cookie" then
					PData.Inventory[Item] -= 1
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", Item, PData.Inventory[Item]})
					HivesManager.ChangeBee(Slot, BeeData.BeeName, Player, true, PData)
					PopUp.PopUp(Player, BeeData.BeeName, Item, true, Slot, false)
				end
			end
		end
	end)
end

return BoostsHandler