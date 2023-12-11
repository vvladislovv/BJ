local CaramelHandler = require(game.ServerScriptService.Modules.CaramelHandler)
local v1 = {}

local Tween = game:GetService("TweenService")

function v1.Spawn(p3, Player)
	CaramelHandler:Blob(p3.TokenPos, p3.PData)
end

return v1