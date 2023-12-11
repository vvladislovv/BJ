local module = {}

function module:Freeze()
	local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
	controls:Disable()
end

function module:Unfreeze()
	local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
	controls:Enable()
end

return module
