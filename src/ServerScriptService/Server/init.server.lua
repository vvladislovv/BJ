local Modules = game.ReplicatedStorage:WaitForChild("Modules")
local Utils = require(Modules:WaitForChild("Utils"))
local Night = require(game.ServerScriptService.Modules.NightEvent)
local Blowballs = require(game.ServerScriptService.Modules.BlowballMechanic)

require(game.ServerScriptService.Modules.Monsters).StartZones()
require(game.ServerScriptService.Modules.Beespass).Start()
require(game.ServerScriptService.Modules.Termits).Start()
require(script.Equipment):StartSystem()

Utils:Load(script)

local MolyCricket = require(game.ServerScriptService.Modules.BossAI.MolyCricket)
MolyCricket.FightJoin()

spawn(function()
	while wait(1080) do
		Night.SummonNight()
		wait(60 * 5)
	end
end)

--spawn(function()
--	while wait(1) do
--		local Data = os.date("*t")
--		if Data.min == 15 and Data.sec == 0 then
--			Blowballs.CreateBlowball(1, 300)
--		elseif Data.min == 45 and Data.sec == 0 then
--			Blowballs.CreateBlowball(2, 300)
--		end
--	end
--end)