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
local Levels = require(Modules.BeeLevels)
local Bees = game.ReplicatedStorage.Bees
--game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", PData.Inventory})
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
	Remotes.SetBind.OnServerEvent:Connect(function(Player, Type, ci)
		local PData = Data:Get(Player)
		PData.Binds[tonumber(ci)].Item = Type
	end)
	
	local Colors = {
		["Blue"] = Color3.fromRGB(77, 102, 245),
		["Dark"] = Color3.fromRGB(39, 39, 39),
		["Red"] = Color3.fromRGB(245, 68, 71),
		["Green"] = Color3.fromRGB(99, 208, 82),
		["White"] = Color3.fromRGB(245, 245, 245),
		["Yellow"] = Color3.fromRGB(245, 205, 48),
	}

	local PColors = {
		["Brown"] = Color3.fromRGB(159, 113, 80),
		["DarkPurple"] = Color3.fromRGB(118, 76, 208),
		["Orange"] = Color3.fromRGB(245, 131, 50),
		["Pink"] = Color3.fromRGB(245, 177, 177),
		["Purple"] = Color3.fromRGB(210, 128, 245),
		["Turq"] = Color3.fromRGB(119, 255, 205),
	}

	local Materials = {
		["Brick"] = Enum.Material.Brick,
		["Ice"] = Enum.Material.Ice,
		["Marble"] = Enum.Material.Marble,
		["Neon"] = Enum.Material.Neon,
		["Plastic"] = Enum.Material.Plastic,
		["Wood"] = Enum.Material.Wood,
	}
	
	Remotes.HiveCPCM.OnServerEvent:Connect(function(Player, Type, Task)
		local PData = Data:Get(Player)
		if 2 == 1 then
			if PData.Vars.Hive ~= "" then
				if Type == "Color" then
					if Colors[Task] then
						workspace.Hives[PData.Vars.Hive].Pilar.Color = Colors[Task]
					end
				elseif Type == "PColor" then
					if not PData.IStats.Premium then
						if PColors[Task] then
							workspace.Hives[PData.Vars.Hive].Pilar.Color = PColors[Task]
						end
					end
				elseif Type == "Material" then
					if not PData.IStats.Premium then
						if Materials[Task] then
							workspace.Hives[PData.Vars.Hive].Pilar.Material = PColors[Task]
						end
					end
				end
			end
		end
	end)
	
	Remotes.HiveDesignCommand.OnServerEvent:Connect(function(Player, Info)
		if game.Players:FindFirstChild(Player.Name) then
			local PData = Data:Get(Player)
			if PData.Inventory["Cookie"] > 0 then
			if Info.Act == "FAL" then
				local IFM = Items.Eggs
				local CPB = math.round((IFM["Cookie"].Amount * PData.Inventory["Cookie"]) / PData.TotalBees)
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "-"..Utils.CommaNumber(PData.Inventory["Cookie"]).." Cookies"
				})
				PData.Inventory["Cookie"] = 0
				for i,BeeData in pairs(PData.Bees) do
					if BeeData.BeeName ~= "" then
					local Slot = workspace.Hives[PData.Vars.Hive].Slots[i]
					local BeeModule = require(Bees[BeeData.BeeName])
					BeeData.Bond += CPB
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
						BeeData.Attack += 1
						Slot.Level.UI.Lbl.Text = BeeData.Level
						local BeeSpeed = BeeModule.Speed + BeeData.Properties.MoveX
						workspace.Bees[Player.Name][Slot.Name].AlignPosition.MaxVelocity = BeeSpeed * (PData.AllStats["Bee Movespeed"] / 100)
						Remotes.FoodBee:FireClient(Player, BeeData.Level, BeeData.BeeName, PollenXAmount, BeeData.Attack, MoveXAmount)
						Remotes.AlertClient:FireClient(Player, {
							Color = "Purple2",
							Msg = "Your "..BeeData.BeeName.." Bee has Reached a New "..BeeData.Level.." Level!!"
						})

						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Bees", tonumber(Slot.Name), PData.Bees[tonumber(Slot.Name)]})
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", PData.Inventory})
					end
					end
				end
				end
			end
		end
	end)
end

return BoostsHandler