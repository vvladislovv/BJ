local ServerUtils = require(game.ServerScriptService.Modules.ServerUtils)
local v1 = {}

local Tween = game:GetService("TweenService")

function v1.Spawn(p3, Player)
	local Flower 
	local ray = RaycastParams.new()
	ray.FilterDescendantsInstances = {game.Workspace.Fields}
	ray.FilterType = Enum.RaycastFilterType.Whitelist
	local raycast = workspace:Raycast(p3.TokenPos, Vector3.new(0,-100,0), ray)
	if raycast and raycast.Instance then
		local Hit = raycast.Instance
		if Hit.Name == "Flower" then
			Flower = Hit
		end
	end
	if p3.PData.Vars.Field ~= "" and Flower ~= nil then
		ServerUtils:SpawnFireRing(Player, p3.PData.Vars.Field, Flower, p3.PData)
	end
end

return v1