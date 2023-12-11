local v1 = {}
local Data = require(game.ServerScriptService.Server:WaitForChild("Data"))
local Tools = require(game.ReplicatedStorage:WaitForChild("Modules").Items).Collectors
local Fields = require(game.ServerScriptService:WaitForChild("Server").GenerateFields)

local flrModule = require(game.ServerScriptService.Server:WaitForChild("FlowerRegister"))
function v1:Spawn(plr)
	local PData = Data:Get(plr)
	local char = plr.Character
	local FieldVar = PData.Vars.Field
	if FieldVar ~= "" then
		for i,flr in pairs(workspace.Fields[FieldVar]:GetChildren()) do
			if flr:FindFirstChild("TopTexture") and (flr.Position-plr.Character.HumanoidRootPart.Position).magnitude <= 12 then
				
				
				local f = Instance.new("Fire",flr)
				game.Debris:AddItem(f,5)
				spawn(function()
					local FoodAmount
					local Tabs = {
						White = 0,
						Blue = 0,
						Red = 0,
						Honey = 0,
					}
					for t = 1,5 do
						if PData.Vars.Field ~= "" then
							local part = flr
							local FlowerSize = Fields.Flowers[part.FlowerID.Value].Size.Size
							local FlowerColor = Fields.Flowers[part.FlowerID.Value].Color
							local Percent = PData.AllStats[FlowerColor.." Instant"] + PData.AllStats["Instant"]
							if Percent >= 100 then
								Percent = 100
							end
							flrModule:CollectFlower(plr,PData,flr)
							local Type = PData.Equipment.Tool
							local SS = Tools[Type][FlowerSize]
							FoodAmount = SS + ((((PData.AllStats["Pollen"] * SS) + 100) / 100) - 1) + ((((PData.AllStats[FlowerColor.." Pollen"] * SS) + 100) / 100) - 1) + ((((PData.AllStats[PData.Vars.Field] * SS) + 100) / 100) - 1)
							local Crit = false
							if math.random(0,100) <= PData.AllStats["Critical Chance"] then
								Crit = true
							end
							if Crit then
								FoodAmount += ((((PData.AllStats["Critical Power"] * FoodAmount) + 100) / 100) - 1)
							end
							local Convert = math.round(FoodAmount * (Percent / 100))
							Tabs[FlowerColor] += math.round(FoodAmount - Convert)
							Tabs["Honey"] += math.round(Convert)
							spawn(function()
								for i,v in pairs(Tabs) do
									if Tabs[i] > 0 then
										game.ReplicatedStorage.Remotes.Visual:FireClient(plr, Tabs[i], i, Crit)
									end
								end
							end)
						end
						wait(1)
					end
				end)
			end
		end
	end
end


return v1
