local module = {}

local bfolder = game.ReplicatedStorage.Bees
local uibees = script.Parent.Frame.Hive.Bees

local SlotColors = {
	["Classic"] = Color3.fromRGB(108, 88, 75),
	["Rare"] = Color3.fromRGB(248, 248, 248),
	["Epic"] = Color3.fromRGB(245, 205, 48),
	["Legendary"] = Color3.fromRGB(18, 238, 212),
	["Event"] = Color3.fromRGB(132, 221, 109),
}

function module.Go()
	--coroutine.wrap(function()
		for cn = 1,25 do
		local bee = _G.PData.Bees[cn]
		print(bee)
			uibees[tostring(cn)].Face.Visible = true
			if bee.BeeName == "" then
				uibees[tostring(cn)].Face.Image = ""
				uibees[tostring(cn)].Thumb.Visible = false
			else
				local BeeModule = require(bfolder[bee.BeeName])
				uibees[tostring(cn)].Face.Image = BeeModule.Icon
				uibees[tostring(cn)].ImageColor3 = SlotColors[BeeModule.Rarity]
				uibees[tostring(cn)].Thumb.Visible = true
				if bee.Level == 0 then
					uibees[tostring(cn)].Level.Text = ""
				else
					uibees[tostring(cn)].Level.Text = bee.Level
				end
			end
		end
	--end) ()
end

return module
