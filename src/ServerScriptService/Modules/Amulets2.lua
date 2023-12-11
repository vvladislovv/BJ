local MobsModule = require(game.ReplicatedStorage.Mobs.MobsVariables)
local Data = require(game.ServerScriptService.Server.Data)
local AmuletsModule = require(game.ReplicatedStorage.Modules.AmuletStats)

local module = {}

function module.RegisterAmulet(Player, PData, Info)
	
	local TemplateStats = {
		{"Pollen", "%", 10},
		{"Convert Rate", "%", 50},
		{"Instant Conversion", "%", 3},
	}

	local Old = {}
	local New = {}

	if not PData.Amulets[Info.Amulet] then
		Old = {"No old amulet"}
	else
		for i = 1, #PData.Amulets[Info.Amulet].Bonuses do
			if PData.Amulets[Info.Amulet].Bonuses[i][2] == "%" then
				Old[i] = "+"..PData.Amulets[Info.Amulet].Bonuses[i][3].."% "..PData.Amulets[Info.Amulet].Bonuses[i][1]
			elseif PData.Amulets[Info.Amulet].Bonuses[i][2] == "x" then
				Old[i] = "x"..PData.Amulets[Info.Amulet].Bonuses[i][3].." "..PData.Amulets[Info.Amulet].Bonuses[i][1]
			end
		end
	end
	
	for i = 1, #Info.Bonuses do
		if Info.Bonuses[i][2] == "%" then
			New[i] = "+"..Info.Bonuses[i][3].."% "..Info.Bonuses[i][1]
		elseif PData.Amulets[Info.Amulet].Bonuses[i][2] == "x" then
			New[i] = "x"..Info.Bonuses[i][3].." "..Info.Bonuses[i][1]
		end
	end

	print(Old)
	print(New)
	
	game.ReplicatedStorage.Remotes.AmuletC:FireClient(Player, {New = New, Old = Old})
end

return module
