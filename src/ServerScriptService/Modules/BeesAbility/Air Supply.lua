local VisualEvent = game.ReplicatedStorage.Remotes.Visual
local ServerUtils = require(game.ServerScriptService.Modules.ServerUtils)
local Data = require(game.ServerScriptService.Server.Data)

local TS = game:GetService("TweenService")
local v1 = {}

function v1.Spawn(p3, Player)
	local PData = Data:Get(Player)
	if PData.Vars.Field ~= "" then
		local Field = PData.Vars.Field
		local Flowers = workspace.Fields[Field]:GetChildren()
		for count = 1, 3 + math.round(p3.PData.Bees[tonumber(p3.Bee)].Level / 3) do
			local Flower = Flowers[math.random(1, #Flowers)] do
				ServerUtils:SpawnBubble(Player, Flower, Field, PData, PData.Bees[tonumber(p3.Bee)].Gifted)
			end
			wait(0.25)
		end
	end
end

return v1