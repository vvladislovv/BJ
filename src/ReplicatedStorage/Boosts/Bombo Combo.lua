
local module = {
	Name = "Bombo Combo",
	BoostImage = require(game.ReplicatedStorage.Modules.Items).Tokens["Bomb"].Image,
	Color = Color3.fromRGB(29, 29, 29),
	Time = 10,
	MaxStack = 10,
	Layout = 15,
	StringNames = {"Bomb Pollen"},
	Boosts = {
		{
			["Type"] = "Bomb Pollen",
			["Mod"] = "Mult",
			["Amount"] = 0.35,
		},
	},
}

return module
