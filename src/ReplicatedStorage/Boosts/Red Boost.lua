
local module = {
	Name = "Red Boost",
	BoostImage = require(game.ReplicatedStorage.Modules.Items).Tokens["Red Boost"].Image,
	Color = Color3.fromRGB(127, 241, 127),
	Time = 20,
	MaxStack = 10,
	Layout = 18,
	StringNames = {"Red Pollen"},
	Boosts = {
		[1] = {
			["Type"] = "Red Pollen",
			["Mod"] = "Percent",
			["Amount"] = 10,
		},
	},
}

return module
