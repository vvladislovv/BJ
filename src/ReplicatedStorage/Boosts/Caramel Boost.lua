
local module = {
	Name = "Caramel Boost",
	BoostImage = "rbxassetid://9413338444",
	Color = Color3.fromRGB(245, 178, 42),
	Time = 3600,
	MaxStack = 25,
	Layout = 25,
	StringNames = {"Caramel"},
	Boosts = {
		{
			["Type"] = "Caramel",
			["Mod"] = "Percent",
			["Amount"] = 300,
		},
	},
}

return module
