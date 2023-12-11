local module = {} do
	--local Data = require(script.Parent.Data)
	local Fields = require(script.Parent.GenerateFields)
	local ReplicatedStorage = game:GetService("ReplicatedStorage")
	local Modules = ReplicatedStorage.Modules
	local Items = require(Modules.Items)
	local TokensM = require(game.ServerScriptService.Modules.TokensManager)
	local Blowballs = require(game.ServerScriptService.Modules.BlowballMechanic)
	local VisualEvent = game.ReplicatedStorage.Remotes.Visual
	local Termits = require(game.ServerScriptService.Modules.Termits)
	
	function RToken(Field)
		local Data = Items.FieldsDrop[Field]
		local TotalWeight = 0

		for i,v in pairs(Data) do
			TotalWeight += v.Rarity
		end
		local Chance = math.random(1, TotalWeight)
		local coun = 0
		for i,v in pairs(Data) do
			coun += v.Rarity
			if coun >= Chance then
				return v.Name
			end
		end
	end
	
	function QuestRoad(Client, PData, White, Blue, Red, Honey, Caramel)
		for ty, NPC in pairs(PData.Quests2) do
			for i, Task in pairs(NPC) do
				if Task.Type == "FieldPollen" then
					if PData.Vars.Field == Task.Field then
						if Task.Color then
							if Task.Color == "White" then
								NPC[i].StartAmount += White
							elseif Task.Color == "Blue" then
								NPC[i].StartAmount += Blue
							elseif Task.Color == "Red" then
								NPC[i].StartAmount += Red
							end
							if NPC[i].StartAmount >= NPC[i].NeedAmount then
								NPC[i].StartAmount = NPC[i].NeedAmount
							end
							game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Quests2", ty, PData.Quests2[ty]})
						else
							NPC[i].StartAmount += (White + Blue + Red)
							if NPC[i].StartAmount >= NPC[i].NeedAmount then
								NPC[i].StartAmount = NPC[i].NeedAmount
							end
							game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Quests2", ty, PData.Quests2[ty]})
						end
					end
					end
					if Task.Type == "PollenColor" then
						if Task.NColor == "Red" then
							NPC[i].StartAmount += Red
						elseif Task.NColor == "White" then
							NPC[i].StartAmount += White
						elseif Task.NColor == "Blue" then
							NPC[i].StartAmount += Blue
						end
						if NPC[i].StartAmount >= NPC[i].NeedAmount then
							NPC[i].StartAmount = NPC[i].NeedAmount
						end
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Quests2", ty, PData.Quests2[ty]})
					end
						
					if Task.Type == "AnyPollen" then
						NPC[i].StartAmount += (White + Blue + Red)
						if NPC[i].StartAmount >= NPC[i].NeedAmount then
							NPC[i].StartAmount = NPC[i].NeedAmount
						end
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Quests2", ty, PData.Quests2[ty]})
					end
	
					if Task.Type == "AnyCaramel" then
						NPC[i].StartAmount += Caramel
						if NPC[i].StartAmount >= NPC[i].NeedAmount then
							NPC[i].StartAmount = NPC[i].NeedAmount
						end
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Quests2", ty, PData.Quests2[ty]})
					end
					
					if Task.Type == "CaramelField" then
						if PData.Vars.Field == Task.Field then
							NPC[i].StartAmount += Caramel
							if NPC[i].StartAmount >= NPC[i].NeedAmount then
								NPC[i].StartAmount = NPC[i].NeedAmount
							end
						end
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Quests2", ty, PData.Quests2[ty]})
					end
					
					if Task.Type == "CaramelColor" then
					if Task.NColor == "White" then
						if Caramel > 0 then
							NPC[i].StartAmount += Caramel
						end
						elseif Task.NColor == "Red" then
						if Caramel > 0 then
							NPC[i].StartAmount += Caramel
						end
						elseif Task.NColor == "Blue" then
						if Caramel > 0 then
							NPC[i].StartAmount += Caramel
						end
						end
						if NPC[i].StartAmount >= NPC[i].NeedAmount then
							NPC[i].StartAmount = NPC[i].NeedAmount
						end
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Quests2", ty, PData.Quests2[ty]})
					end
					
			end
		end
	end
	
	function CheckBlowballs(Player, Flower, FoodAmount)
		if #game.Workspace.Blowballs:GetChildren() > 0 then
			for i,v in pairs(game.Workspace.Blowballs:GetChildren()) do
				if (Flower.Position - v.PrimaryPart.Position).Magnitude <= 15 then
				if v then
				local Blwball = Blowballs.Balls[v:FindFirstChild("ID").Value]
				if Blwball then
					if Blwball.HP < Blwball.HPMax then
						Blwball.HP += FoodAmount
						Blowballs.UV(v)
					elseif Blwball.HP >= Blwball.HPMax and Blwball.Deb == false then
						Blwball.HP = Blwball.HPMax
						Blwball.Deb = true
						Blowballs.UV(v)
						Blowballs.DestroyB(v, v:FindFirstChild("ID").Value)
						end
					end
					end
				end
			end
		end
	end
	
	function QuestRoad2(Client, PData, Flower, Amount, Caramel)
		for ty, NPC in pairs(PData.Quests2) do
			for i, Task in pairs(NPC) do
				if Task.Type == "FieldPollen" then
					if PData.Vars.Field == Task.Field then
						if Task.Color then
							if Flower.Color == Task.Color then
								NPC[i].StartAmount += Amount
								if NPC[i].StartAmount >= NPC[i].NeedAmount then
									NPC[i].StartAmount = NPC[i].NeedAmount
								end
							end
						else
						NPC[i].StartAmount += Amount
						if NPC[i].StartAmount >= NPC[i].NeedAmount then
							NPC[i].StartAmount = NPC[i].NeedAmount
							end
						end
						if game.Players:FindFirstChild(Client.Name) then
							game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Quests2", ty, PData.Quests2[ty]})
						end
					end
				elseif Task.Type == "PollenColor" then
					if Flower.Color == Task.NColor then
						NPC[i].StartAmount += Amount
						if NPC[i].StartAmount >= NPC[i].NeedAmount then
							NPC[i].StartAmount = NPC[i].NeedAmount
						end
						if game.Players:FindFirstChild(Client.Name) then
							game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Quests2", ty, PData.Quests2[ty]})
						end
					end
				elseif Task.Type == "AnyPollen" then
					NPC[i].StartAmount += Amount
					if NPC[i].StartAmount >= NPC[i].NeedAmount then
						NPC[i].StartAmount = NPC[i].NeedAmount
					end
					if game.Players:FindFirstChild(Client.Name) then
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Quests2", ty, PData.Quests2[ty]})
					end
				elseif Task.Type == "AnyCaramel" then
					NPC[i].StartAmount += Caramel
					if NPC[i].StartAmount >= NPC[i].NeedAmount then
						NPC[i].StartAmount = NPC[i].NeedAmount
					end
					if game.Players:FindFirstChild(Client.Name) then
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Quests2", ty, PData.Quests2[ty]})
					end
				elseif Task.Type == "CaramelField" then
					if PData.Vars.Field == Task.Field then
						NPC[i].StartAmount += Caramel
						if NPC[i].StartAmount >= NPC[i].NeedAmount then
							NPC[i].StartAmount = NPC[i].NeedAmount
						end
					end
					if game.Players:FindFirstChild(Client.Name) then
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Quests2", ty, PData.Quests2[ty]})
					end
				elseif Task.Type == "CaramelColor" then
					if Flower.Color == Task.NColor then
						NPC[i].StartAmount += Caramel
						if NPC[i].StartAmount >= NPC[i].NeedAmount then
							NPC[i].StartAmount = NPC[i].NeedAmount
						end
					end
					if game.Players:FindFirstChild(Client.Name) then
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Quests2", ty, PData.Quests2[ty]})
					end
				end
			end
		end
	end
	
	local Tabs = {}
	
	game.Players.PlayerAdded:Connect(function(Player)
		Tabs[Player.Name] = {White = 0, Blue = 0, Honey = 0, Red = 0}
	end)
	game.Players.PlayerRemoving:Connect(function(Player)
		Tabs[Player.Name] = nil
	end)
	
	local Time = 0
	
	function module:CollectFlower(plr, PData, Flower, Position, StatsModule, BeeData)
		if Flower and PData and PData.Vars.Field ~= "" and (Flower.Position.Y - Fields.Flowers[Flower.FlowerID.Value].MinPosition) > 0.2 then
			local CanScoop = true
			local v1 = 0
			local v2 = 0
	
			if PData.IStats.Pollen < PData.IStats.Capacity and CanScoop == true then
				local Start = tick()
				local Type = PData.Equipment.Tool
				local FieldName = PData.Vars.Field
				local FlowerColor = Fields.Flowers[Flower.FlowerID.Value].Color
				local FlowerSize = Fields.Flowers[Flower.FlowerID.Value].Stat.Value
				local DecreaseAmount
				local SS
				local FoodAmount
				local Crit
				
				local Percent = math.round(PData.AllStats[FlowerColor.." Instant"] + PData.AllStats["Instant"])
				if Percent > 100 then
					Percent = 100
				end
				
				if not StatsModule then
					DecreaseAmount = Items.Collectors[Type].Power
					SS = Items.Collectors[Type].Pollen
					
					DecreaseAmount /= tonumber(FlowerSize)
					SS = math.round(SS * tonumber(FlowerSize))
					
					if Items.Collectors[Type].ToolColor == FlowerColor then
						DecreaseAmount *= Items.Collectors[Type].PollenMultiplier
						SS *= Items.Collectors[Type].PollenMultiplier
					end
					if PData.Vars.Field ~= "" then
						FoodAmount = math.round(SS * ((PData.AllStats["Pollen"] / 100) * (PData.AllStats[FlowerColor.." Pollen"]/ 100) * (PData.AllStats[FieldName] / 100) * (PData.AllStats["Pollen From Tools"] / 100)))
					end
				else
					if StatsModule["Sim"] then
						DecreaseAmount = StatsModule.Powers
						SS = StatsModule.Pollen
						
						DecreaseAmount /= tonumber(FlowerSize)
						SS = math.round(SS * tonumber(FlowerSize))
						
						if StatsModule["Color"] == "Red" then
							if FlowerColor == "Red" then
								DecreaseAmount *= 1.5
								SS *= 1.5
							elseif FlowerColor == "Blue" then
								DecreaseAmount /= 1.5
								SS /= 1.5
							end
						elseif StatsModule["Color"] == "Blue" then
							if FlowerColor == "Blue" then
								DecreaseAmount *= 1.5
								SS *= 1.5
							elseif FlowerColor == "Red" then
								DecreaseAmount /= 1.5
								SS /= 1.5
							end
						end
						
						if FieldName ~= "" then
							FoodAmount = math.round(SS * (((PData.AllStats["Pollen"] / 100) * (PData.AllStats[FlowerColor.." Pollen"] / 100) * (PData.AllStats[FieldName] / 100) * (PData.AllStats["Pollen From Bees"] / 100)) + BeeData.Properties.PollenX))
						end
					else
						DecreaseAmount = StatsModule.Powers
						SS = StatsModule.Pollen
						
						DecreaseAmount /= tonumber(FlowerSize)
						SS = math.round(SS * tonumber(FlowerSize))
						
						if StatsModule["Color"] == "Red" then
							if FlowerColor == "Red" then
								DecreaseAmount *= 1.5
								SS *= 1.5
							elseif FlowerColor == "Blue" then
								DecreaseAmount /= 1.5
								SS /= 1.5
							end
						elseif StatsModule["Color"] == "Blue" then
							if FlowerColor == "Blue" then
								DecreaseAmount *= 1.5
								SS *= 1.5
							elseif FlowerColor == "Red" then
								DecreaseAmount /= 1.5
								SS /= 1.5
							end
						end
						
						if FieldName ~= "" then
							if StatsModule["Bomb"] and StatsModule["Bomb"] == true then
								if StatsModule["Color"] ~= "Colorless" then
									if FlowerColor ~= StatsModule["Color"] then
										FoodAmount = 0
										DecreaseAmount = 0
									else
										FoodAmount = math.round(SS * ((PData.AllStats["Pollen"] / 100) * (PData.AllStats[FlowerColor.." Pollen"] / 100) * (PData.AllStats["Bomb Pollen"] / 100) * (PData.AllStats[StatsModule["Color"].." Bomb Pollen"] / 100) * (PData.AllStats[FieldName] / 100)))
									end
								else
									FoodAmount = math.round(SS * ((PData.AllStats["Pollen"] / 100) * (PData.AllStats[FlowerColor.." Pollen"] / 100) * (PData.AllStats["Bomb Pollen"] / 100)  * (PData.AllStats[FieldName] / 100)))
								end
							else
								FoodAmount = math.round(SS * ((PData.AllStats["Pollen"] / 100) * (PData.AllStats[FlowerColor.." Pollen"] / 100) * (PData.AllStats[FieldName] / 100)))
							end
						end
					end
				end
				
				Flower.Position -= Vector3.new(0,DecreaseAmount,0)
				Flower.TopTexture.Transparency = (Fields.Flowers[Flower.FlowerID.Value].MaxPosition-Flower.Position.Y)/2.5
				
				local HoneyAdd = 0
				if Flower:FindFirstChild("CaramelPart") then
					v1 = math.round((FoodAmount / 25))-- * (PData.AllStats["Caramel"] / 100))
					if v1 <= 0 then
						v1 = 1
					end
					HoneyAdd += v1
					PData.IStats.Caramel += math.round(v1)
					PData.Badges["Caramel"].Amount += math.round(v1)
				end
				
				if FoodAmount ~= nil and Percent ~= nil then
					local Convert = math.round(FoodAmount * (Percent / 100))
					local PollenAdd = math.round(FoodAmount - Convert)
					
					local CritRandom = math.random(1,100)
					if CritRandom <= PData.AllStats["Critical Chance"] then
						Crit = true
						PollenAdd = math.round(PollenAdd * (PData.AllStats["Critical Power"] / 100))
					end
					
					if PollenAdd < 0 then
						PollenAdd = 0
					elseif Convert < 0 then
						Convert = 0
					end
					HoneyAdd += Convert
					
					local FieldGrant = math.random(1,300)
					if FieldGrant <= 1 then
						if Items.FieldsDrop[FieldName] then
							local RandomToken = RToken(FieldName)
								TokensM.SpawnToken({
									Position = Flower.Position,
									Cooldown = 15,
									Token = {
										Item = RandomToken,
										Amount = 1,
										Type = "Drop",
									},
									Resourse = FieldName.." Field",
								})
						end
					end
					
					if Tabs[plr.Name] then
						Tabs[plr.Name][FlowerColor] += PollenAdd
						Tabs[plr.Name].Honey += HoneyAdd
					end
					
					spawn(function()
						wait(0.001)
						if Tabs[plr.Name] then
							for i,v in pairs(Tabs[plr.Name]) do
								if v > 0 then
									VisualEvent:FireClient(plr, {Pos = Position, Amount = v, Color = i, Crit = Crit})
								end
							end
							QuestRoad(plr, PData, Tabs[plr.Name].White, Tabs[plr.Name].Blue, Tabs[plr.Name].Red, Tabs[plr.Name].Honey, v1)
							Tabs[plr.Name].Honey = 0
							Tabs[plr.Name].White = 0
							Tabs[plr.Name].Blue = 0
							Tabs[plr.Name].Red = 0
						end
					end)
					
					PData.IStats.Pollen += math.round(PollenAdd)
					PData.IStats.Honey += math.round(HoneyAdd)
					PData.IStats.TotalHoney += math.round(HoneyAdd)
					PData.IStats.DailyHoney += math.round(HoneyAdd)
					PData.IStats["Total"..FlowerColor] += math.round(PollenAdd)
					PData.Badges["Honey"].Amount += math.round(HoneyAdd)
					PData.Badges[FieldName.." Field"].Amount += math.round(HoneyAdd + PollenAdd)
					
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(plr, {"IStats", PData.IStats})
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(plr, {"Badges", PData.Badges})
					
					CheckBlowballs(plr, Flower, FoodAmount)
					if PData.Vars.Field == "Termit Hollow" then
						Termits.CheckPlayer(HoneyAdd, plr)
					end
					
					if workspace.Fields:FindFirstChild(PData.Vars.Field) and workspace.FieldZones[PData.Vars.Field]:FindFirstChild("Sprout") then
						workspace.FieldZones[PData.Vars.Field]:FindFirstChild("Sprout").Grow.Value += FoodAmount
					end
				end
			else
				PData.IStats.Pollen = PData.IStats.Capacity
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(plr, {"IStats", PData.IStats})
			end
		end
	end
	
	function module:RegisterField(Field: Instance)
		local FieldInfo = Fields[Field.Name]
		for _, Pollen in pairs(Field:GetChildren()) do
			if Pollen:IsA("BasePart") then
				FieldInfo = Fields.Flowers[Pollen.FlowerID.Value]
				Pollen.Changed:Connect(function()
					if Pollen.Position.Y <= FieldInfo.MinPosition then
						Pollen.Position = Vector3.new(Pollen.Position.X, FieldInfo.MinPosition, Pollen.Position.Z)
					end
				end)
			end
		end
			if FieldInfo then
			spawn(function()
			while Field do wait(5)
					for _, Pollen in pairs(Field:GetChildren()) do
						if Pollen:IsA("BasePart") then
							FieldInfo = Fields.Flowers[Pollen.FlowerID.Value]
							if Pollen.Position.Y <= FieldInfo.MinPosition then
								Pollen.Position = Vector3.new(Pollen.Position.X, FieldInfo.MinPosition, Pollen.Position.Z)
							end
							if Pollen.Position.Y < FieldInfo.MaxPosition then
								local DistanceToMax = tonumber(FieldInfo.MaxPosition - Pollen.Position.Y)
								Pollen.TopTexture.Transparency = (Fields.Flowers[Pollen.FlowerID.Value].MaxPosition-Pollen.Position.Y)/2.5

								if DistanceToMax < FieldInfo.Regen then
									Pollen.Position += Vector3.new(0, DistanceToMax, 0)
								else
									Pollen.Position += Vector3.new(0, DistanceToMax, 0)
								end
								if Pollen.Position.Y > FieldInfo.MaxPosition then
									Pollen.Position = Vector3.new(Pollen.Position.X, FieldInfo.MaxPosition, Pollen.Position.Z)
								end
							end
						end
					end
				end
			end)
		end
	end
	wait(0.05)
	for _, Field in pairs(workspace.Fields:GetChildren()) do
		module:RegisterField(Field)
	end
end

return module
