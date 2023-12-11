local CraftItems = {}

CraftItems.Items = {
	
	["Butter"] = {
		Name = "Butter",
		Layout = 1,
		Ingredients = {
			["Seed"] = 25,
			["Royal Jelly"] = 3,
		}
	};
	
	["Caramel Bottle"] = {
		Name = "Caramel Bottle",
		Layout = 2,
		Ingredients = {
			["Caramel"] = 10,
			["Royal Jelly"] = 3,
		}
	};
	
	["Energy Drink"] = {
		Name = "Energy Drink",
		Layout = 3,
		Ingredients = {
			["Sugar"] = 15,
			["Royal Jelly"] = 3,
		}
	};
	
	["Strawberry Juice"] = {
		Name = "Strawberry Juice",
		Layout = 4,
		Ingredients = {
			["Strawberry"] = 25,
			["Royal Jelly"] = 3,
		}
	};
	
	["Blueberry Juice"] = {
		Name = "Blueberry Juice",
		Layout = 5,
		Ingredients = {
			["Blueberry"] = 25,
			["Royal Jelly"] = 3,
		}
	};
	
	--["Sprout"] = {
	--	Name = "Sprout",
	--	Layout = 6,
	--	Ingredients = {
	--		["Strawberry"] = 1
	--	}
	--};
	
	["Caramel"] = {
		Name = "Caramel",
		Layout = 6,
		Ingredients = {
			["Strawberry"] = 5,
			["Blueberry"] = 5,
			["Seed"] = 5,
			["Sugar"] = 1,
		}
	};
	
	["Instant Converter"] = {
		Name = "Instant Converter",
		Layout = 7,
		Ingredients = {
			["Butter"] = 5,
			["Caramel Bottle"] = 5,
			["Strawberry Juice"] = 5,
			["Blueberry Juice"] = 5,
		}
	};
}

return CraftItems
