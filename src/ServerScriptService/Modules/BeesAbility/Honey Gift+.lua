local VisualEvent = game.ReplicatedStorage.Remotes.Visual
local BLevels = require(game.ReplicatedStorage.Modules.BeeLevels)
local v1 = {}

function v1.Spawn(p3, Player)
	local HoneyAmount = 250
	local Bee = game.Workspace.Bees[Player.Name]:FindFirstChild(p3.Bee)
	if p3.PData.Bees[tonumber(Bee.Name)].Level > 0 then
		HoneyAmount = math.round(HoneyAmount * (p3.PData.Bees[tonumber(Bee.Name)].Level * p3.PData.Bees[tonumber(Bee.Name)].Level))
	end
	if HoneyAmount > 0 then
		p3.PData.IStats.Honey += HoneyAmount
		VisualEvent:FireClient(Player, {Pos = game.Workspace:FindFirstChild(Player.Name).PrimaryPart, Amount = HoneyAmount, Color = "Honey"})
	end
end

return v1