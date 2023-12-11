
local module = {
	Name = "United Aura",
	BoostImage = "rbxassetid://9349024326",
	Color = Color3.fromRGB(24, 24, 24),
	Time = 10,
	MaxStack = 3,
	Layout = 37,
	StringNames = {"White Pollen", "Blue Pollen", "Red Pollen", "Tool Speed"},
	Boosts = {
		{
			["Type"] = "White Pollen",
			["Mod"] = "Mult",
			["Amount"] = 1.5,
		},
		{
			["Type"] = "Blue Pollen",
			["Mod"] = "Mult",
			["Amount"] = 1.5,
		},
		{
			["Type"] = "Red Pollen",
			["Mod"] = "Mult",
			["Amount"] = 1.5,
		},
		{
			["Type"] = "Tools Speed",
			["Mod"] = "Percent",
			["Amount"] = 10,
		},
	},
}

return module
