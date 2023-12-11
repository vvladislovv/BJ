
local module = {
	Name = "Bubble Boost",
	BoostImage = "http://www.roblox.com/asset/?id=10342875621",
	Color = Color3.fromRGB(82, 124, 174),
	Time = 25,
	MaxStack = 50,
	Layout = 1,
	Min = true,
	StringNames = {"Capacity"},
	Boosts = {
		[1] = {
			["Type"] = "Capacity",
			["Mod"] = "Percent",
			["Amount"] = 5,
		},
	},
}

return module
