local Players = game:GetService("Players")
local SSS = game:GetService("ServerScriptService")
local Rep = game.ReplicatedStorage
local Remotes = Rep.Remotes
local Modules = Rep.Modules
local Data = require(script.Parent.Data)
local Items = require(Modules.Items)
local ts = game:GetService("TweenService")
local Utils = require(game.ReplicatedStorage.Modules.Utils)
local Hydrants = require(SSS.Modules.HydrantBuilder)
local Night = require(SSS.Modules.NightEvent)
local CaramelHandler = require(SSS.Modules.CaramelHandler)
local Utilities = require(game.ReplicatedStorage.Utilities)

game.ReplicatedStorage.Remotes.Death.OnServerEvent:Connect(function(Player2)
	wait(5)
	local PData = Data:Get(Player2)
end)

local function UseSprout(Player, Item, PData)
	if game.Players:FindFirstChild(Player.Name) then
	Remotes.Sprout:Fire(Player, Item)
	PData.Inventory[Item] -= 1
	game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", Item, PData.Inventory[Item]})
	PData.Cooldowns2["Sprout"] = {Time = 10 + os.time()}
	game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Cooldowns2", PData.Cooldowns2})
	end
end

local ItemsHandler = {} do
	
	function QuestRoad(Client, PData, Item)
		for _, NPC in pairs(PData.Quests2) do
			for i, Task in pairs(NPC) do
				if Task.Type == "UseItem" then
					if Item == Task.Item then
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
	
	function Make(Item, Att)
		spawn(function()
			local ui = script.ui:Clone()
			ui.Parent = Att
			ui.Icon.Image = Item.Image
			ui.Icon:TweenPosition(UDim2.new(0.5, 0, 0.575, 0), "Out", "Back", 0.5, true)
			ui.Icon:TweenSize(UDim2.new(0.5, 0, 0.5, 0), "Out", "Back", 0.15, true)
			wait(1.5)
			ui.Icon:TweenPosition(UDim2.new(0.5, 0, 1, 0), "In", "Back", 0.5, true)
			ui.Icon:TweenSize(UDim2.new(0, 0, 0, 0), "Out", "Back", 0.15, true)
			ui:Destroy()
		end)
	end
	
	Remotes.Item.OnServerEvent:Connect(function(Player, Item)
		if game.Players:FindFirstChild(Player.Name) then
		local PData = Data:Get(Player)
		if PData.Inventory[Item] >= 1 then
			if not Items.Eggs[Item].Removed then
					if Items.Eggs[Item].Type == "Buff" then
						if Item ~= "Fertilizer" then
							Remotes.SSound:FireClient(Player, "UseBuffItem",1.5,true)
							Remotes.Boost:Fire(Player, Item, 1)
							Make(Items.Eggs[Item], Player.Character.Head.HairAttachment)
							PData.Inventory[Item] -= 1
							game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", Item, PData.Inventory[Item]})
						elseif Item == "Fertilizer" then
							if PData.Vars.Field ~= "" and PData.Vars.Field ~= "Termit Hollow" then
								if not PData.Cooldowns2["Fertilizer"] then
									PData.Cooldowns2["Fertilizer"] = {Time = 1200 + os.time()}
									Remotes.Boost:Fire(Player, PData.Vars.Field.." Field Boost", 1)
									Make(Items.Eggs[Item], Player.Character.Head.HairAttachment)
									PData.Inventory[Item] -= 1
									game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Cooldowns2", Item, PData.Cooldowns2[Item]})
									game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", Item, PData.Inventory[Item]})
								else
									Remotes.AlertClient:FireClient(Player, {
										Color = "Red",
										Msg = "Fertilizer on cooldown "..Utilities:FormatTime(PData.Cooldowns2["Fertilizer"].Time - os.time())
									})
								end
							elseif PData.Vars.Field == "Termit Hollow" then
								Remotes.AlertClient:FireClient(Player, {
									Color = "Red",
									Msg = "You can't Fertilize a Termite Field"
								})
							elseif PData.Vars.Field == "" then
								Remotes.AlertClient:FireClient(Player, {
									Color = "Red",
									Msg = "You have to be in the Field to use the Fertilizer"
								})
							end
						end
							
					QuestRoad(Player, PData, Item)
				elseif Items.Eggs[Item].Type == "Sprout" and PData.Vars.Field ~= "" and not workspace.FieldZones[PData.Vars.Field]:FindFirstChild("Sprout") and not PData.Cooldowns2["Sprout"] then
					UseSprout(Player,Item,PData)
					QuestRoad(Player, PData, Item)
					Make(Items.Eggs[Item], Player.Character.Head.HairAttachment)
				elseif Items.Eggs[Item].Type == "Sprout" and PData.Vars.Field ~= "" and not workspace.FieldZones[PData.Vars.Field]:FindFirstChild("Sprout") and PData.Cooldowns2["Sprout"] then
					if PData.Cooldowns2["Sprout"].Time then
						Remotes.AlertClient:FireClient(Player, {
						Color = "Red",
						Msg = "Sprout on Cooldown "..PData.Cooldowns2["Sprout"].Time - os.time().." sec"
						})
					end
				elseif Items.Eggs[Item].Type == "Sprout" and PData.Vars.Field == "" then
					Remotes.AlertClient:FireClient(Player, {
						Color = "Red",
						Msg = "You have to be in the Field to use the Sprout"
					})	
				elseif Item == "Instant Converter" then
					if PData.IStats.Pollen > 0 then
					Make(Items.Eggs[Item], Player.Character.Head.HairAttachment)
					local Pollen = PData.IStats.Pollen
					PData.IStats.Honey += Pollen
					PData.IStats.TotalHoney += PData.IStats.Pollen
					PData.IStats.Pollen = 0
							
					PData.Inventory[Item] -= 1
					Remotes.SSound:FireClient(Player, "Purchase",1,true)
					Remotes.AlertClient:FireClient(Player, {
						Color = "Blue",
						Msg = "+"..Utils:CommaNumber(math.round(Pollen)).." Honey From Instant Converter"
					})
					Remotes.Visual:FireClient(Player, {Pos = Player.Character.PrimaryPart, Amount = math.round(Pollen), Color = "Honey"})
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", Item, PData.Inventory[Item]})
					elseif PData.IStats.Pollen <= 0 then
						Remotes.AlertClient:FireClient(Player, {
						Color = "Red",
						Msg = "You need to Fill your backpack before using the Instant Converter"
						})
						end
				elseif Item == "Bee-Pass" then
					if PData.Beespass.Paid == false then
						PData.Beespass.Paid = true
						PData.Inventory[Item] -= 1
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", Item, PData.Inventory[Item]})
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Beespass", PData.Beespass})
						Remotes.SSound:FireAllClients("BeePass",1,true)
						Remotes.GetBeespassReward:FireClient(Player)
						Remotes.GetBeePassVisual:FireClient(Player)
						Remotes.AlertClient:FireAllClients({
							TextColor = "BeePass",
							Color = "BeePass",
							Msg = Player.Name.." has opened the Bee-Pass Season!!🐝"
						})
					else
						Remotes.AlertClient:FireClient(Player, {
							Color = "Red",
							Msg = "This Season is Already available to You!"
						})
					end
				elseif Items.Eggs[Item].Type == "Sprout" and PData.Vars.Field ~= "" and workspace.FieldZones[PData.Vars.Field]:FindFirstChild("Sprout") then
					Remotes.AlertClient:FireClient(Player, {
						Color = "Red",
						Msg = "There is already a Sprout on this Field"
					})
				elseif Items.Eggs[Item].Type == "FieldEffect" then
					if Item == "Caramel" and not PData.Cooldowns2["Caramel"] then
						PData.Inventory[Item] -= 1
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", Item, PData.Inventory[Item]})
						PData.Cooldowns2["Caramel"] = {Time = 5 + os.time()}
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Cooldowns2", "Caramel", PData.Cooldowns2["Caramel"]})
						Make(Items.Eggs[Item], Player.Character.Head.HairAttachment)
						CaramelHandler:UseCaramel(Player.Character.PrimaryPart)
						QuestRoad(Player, PData, Item)
					elseif Item == "Caramel" and PData.Cooldowns2["Caramel"] then
						Remotes.AlertClient:FireClient(Player, {
							Color = "Red",
							Msg = "Caramel on Cooldown - "..PData.Cooldowns2["Caramel"].Time - os.time().." sec"
						})
					end
					elseif Items.Eggs[Item].Type == "Hydrant Builder" and PData.Vars.Field ~= "" and PData.Equipment.Hydrant ~= "" then
						Hydrants.PlaceHydrant(Player, PData)
						Make(Items.Eggs[Item], Player.Character.Head.HairAttachment)
					elseif Items.Eggs[Item].Type == "SummonNight" then
						if _G.NightTime == true and _G.NightReady == false then
							Remotes.AlertClient:FireClient(Player, {
								Color = "Red",
								Msg = "The Night Time has Already Come!"
							})
						else
							PData.Inventory[Item] -= 1
							Make(Items.Eggs[Item], Player.Character.Head.HairAttachment)
							game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", Item, PData.Inventory[Item]})
							Night.SummonNight(Player)
						end
					end
				end
			end
		end
	end)
end

return ItemsHandler