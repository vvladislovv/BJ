local Players = game:GetService("Players")
local SSS = game:GetService("ServerScriptService")
local Rep = game.ReplicatedStorage
local Remotes = Rep.Remotes
local Modules = Rep.Modules
local Data = require(script.Parent:WaitForChild("Data"))
local Items = require(Modules.Items)
local Utils = require(Modules.Utils)
local Equipment = require(game.ServerScriptService.Server.Equipment)

local TokensM = require(Modules:WaitForChild("TokensManager"))

local BoostsHandler = {} do
	function RandomDropType(Table)
		local Data = Table
		local TotalWeight = 0

		for i,v in pairs(Data) do
			TotalWeight += v.Chance
		end
		local Chance = math.random(1, TotalWeight)
		local coun = 0
		for i,v in pairs(Data) do
			coun += v.Chance
			if coun >= Chance then
				return v.Name
			end
		end
	end
		
	local function GetDist(Pos1, Pos2, Dist)
		if (Pos1 - Pos2).Magnitude <= Dist then
			return true
		else
			return false
		end
	end
	
	Remotes.CollectHive.OnServerEvent:Connect(function(Player, PH)
		local PData = Data:Get(Player)
		if PData.IStats.ActivePortableHives[1].ID == PH.Name then
			if PData.IStats.ActivePortableHives[1].Percent >= 100 then
				local Position = PH.Main.Position
				local Table = PData.IStats.ActivePortableHives[1]
				PH:Destroy()
				PData.IStats.ActivePortableHives[1] = nil
				local Percent = PData.AllStats["Instant"]
				local Convert = math.round(Table.Pollen * (Percent / 100))
				if Percent >= 100 then
					Percent = 100
				end
				local PollenAdd = Table.Pollen - Convert
				if PollenAdd < 0 then
					PollenAdd = 0
				end
				local HoneyAdd = Convert
				PData.Inventory[Table.HiveType.." Sower"] = 1
				PData.IStats.Pollen += PollenAdd
				PData.IStats.Honey += HoneyAdd
				PData.IStats.TotalHoney += HoneyAdd
				PData.IStats["DailyHoney"] += HoneyAdd
				local TotalDrop = 0
				local BuffAmount = 1
				local BuffType = ""
				if Table.FieldColor == Table.SowerColor then
					BuffAmount = 2
				end
				if Table.FieldColor == "White" then
					BuffType = "Wind Power"
				elseif Table.FieldColor == "Blue" then
					BuffType = "Polar Power"
				elseif Table.FieldColor == "Red" then
					BuffType = "Heat Power"
				end
				Remotes.Boost:Fire(Player, BuffType, BuffAmount)
				repeat
					local RandomToken = RandomDropType(Items.SowersConfig[Table.HiveType].Drop[Table.FieldColor])
					local Flowers = workspace.Fields[Table.Field]:GetChildren()
					local RandomFlower = Flowers[math.random(1, #Flowers)]
					if GetDist(Position, RandomFlower.Position, 15) then
						TotalDrop += 1
						TokensM.SpawnToken({
							Position = RandomFlower.Position,
							Cooldown = 30,
							Token = {
								Item = RandomToken,
								Amount = Items.SowersConfig[Table.HiveType].Drop[Table.FieldColor][RandomToken].APT,
								Type = "Drop",
							},
							Resourse = "Sower",
						})
						wait(0.005)
					else
						GetDist(Position, RandomFlower.Position, 25)
					end
				until TotalDrop >= Table.Drops
			end
		end
	end)
	
	Remotes.SetHive.Event:Connect(function(Player, Item)
		local PData = Data:Get(Player)
		local Char = Player.Character.HumanoidRootPart
		if not PData.IStats.ActivePortableHives[1] then
			local PortHiveID = "PH"..math.random(1,999999)
			local HiveModel = Rep.Assets.Sowers[Items.Eggs[Item].AAAType]:Clone()
			HiveModel:SetPrimaryPartCFrame(Char.CFrame * CFrame.Angles(math.rad(0),0,0))
			HiveModel.Name = PortHiveID
			HiveModel.Parent = workspace.Sowers

			PData.IStats.ActivePortableHives[1] = {
				HiveType = Items.Eggs[Item].AAAType,
				Percent = 0,
				SowerColor = Items.SowersConfig[Items.Eggs[Item].AAAType].Color,
				Pollen = Items.SowersConfig[Items.Eggs[Item].AAAType].Capacity,
				Timer = 0,
				TimerMax = Items.SowersConfig[Items.Eggs[Item].AAAType].Timer,
				SpeedBoost = 1,
				Field = PData.Vars.Field,
				Drops = Items.SowersConfig[Items.Eggs[Item].AAAType].Rewards,
				FieldColor = workspace.FieldZones[PData.Vars.Field].FColor.Value,
				CFValue = Char.CFrame * CFrame.Angles(0,0,0),
				ID = PortHiveID,
			}
			
			if PData.IStats.ActivePortableHives[1].SowerColor == PData.IStats.ActivePortableHives[1].FieldColor then
				PData.IStats.ActivePortableHives[1].SpeedBoost = 50
			end
		end
		
	end)
end

return BoostsHandler