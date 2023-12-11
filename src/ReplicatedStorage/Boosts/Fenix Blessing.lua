
local module = {
	Name = "Fenix Blessing",
	BoostImage = "rbxassetid://9229107941",
	Color = Color3.fromRGB(190, 56, 56),
	Time = 86400,
	MaxStack = 1,
	Layout = 31,
	StringNames = {"Pollen", "Convert Rate", "White Bomb Pollen", "Instant Conversion"},
	Boosts = {
		{
			["Type"] = "Pollen",
			["Mod"] = "Percent",
			["Amount"] = 113,
		},
		{
			["Type"] = "Convert Rate",
			["Mod"] = "Percent",
			["Amount"] = 55,
		},
		{
			["Type"] = "White Bomb Pollen",
			["Mod"] = "Percent",
			["Amount"] = 78,
		},
		{
			["Type"] = "Instant",
			["Mod"] = "Percent",
			["Amount"] = 33,
		},
	},
	
}

return module
