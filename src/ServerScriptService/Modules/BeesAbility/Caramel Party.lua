local CaramelHandler = require(game.ServerScriptService.Modules.CaramelHandler)
local v1 = {}

local Tween = game:GetService("TweenService")

function v1.Spawn(p3, Player)
	CaramelHandler:UseCaramel(p3.TokenPos)
end

return v1