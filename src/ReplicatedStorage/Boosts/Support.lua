
local module = {
	Name = "Support",
	BoostImage = require(game.ReplicatedStorage.Modules.Items).Tokens.Support.Image,
	Color = Color3.fromRGB(136, 249, 255),
	Time = 30,
	MaxStack = 1,
	Layout = 17,
	StringNames = {"Pollen", "Loot Luck"},
	Boosts = {
		{
			["Type"] = "Pollen",
			["Mod"] = "Mult",
			["Amount"] = 2,
		},
		{
			["Type"] = "Loot Luck",
			["Mod"] = "Percent",
			["Amount"] = 50,
		},
	},
}

return module
