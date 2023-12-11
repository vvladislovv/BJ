
local module = {
	Name = "Polar Power",
	BoostImage = "rbxassetid://8094716529",
	Color = Color3.fromRGB(61, 122, 179),
	Time = 1728,
	MaxStack = 50,
	MaxTime = 86400,
	Layout = 2,
	StringNames = {"Blue Pollen", "Blue Instant Conversion", "Critical Power"},
	Boosts = {
		[1] = {
			["Type"] = "Blue Pollen",
			["Mod"] = "Percent",
			["Amount"] = 2,
		},
		[2] = {
			["Type"] = "Blue Instant",
			["Mod"] = "Percent",
			["Amount"] = 1,
		},
		[3] = {
			["Type"] = "Critical Power",
			["Mod"] = "Percent",
			["Amount"] = 2,
		},
	},
}

return module
