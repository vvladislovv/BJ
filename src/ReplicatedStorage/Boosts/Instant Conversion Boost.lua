
local module = {
	Name = "Instant Conversion Boost",
	BoostImage = "rbxassetid://8639001842",
	Color = Color3.fromRGB(241, 110, 50),
	Time = 86400 / 12,
	MaxStack = 1,
	Layout = 30,
	StringNames = {"Instant Conversion"},
	Boosts = {
		[1] = {
			["Type"] = "Instant",
			["Mod"] = "Percent",
			["Amount"] = 10,
		},
	},
}

return module
