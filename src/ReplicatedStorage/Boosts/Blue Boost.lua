
local module = {
	Name = "Blue Boost",
	BoostImage = require(game.ReplicatedStorage.Modules.Items).Tokens["Blue Boost"].Image,
	Color = Color3.fromRGB(127, 241, 127),
	Time = 20,
	MaxStack = 10,
	Layout = 17,
	StringNames = {"Blue Pollen"},
	Boosts = {
		[1] = {
			["Type"] = "Blue Pollen",
			["Mod"] = "Percent",
			["Amount"] = 10,
		},
	},
}

return module
