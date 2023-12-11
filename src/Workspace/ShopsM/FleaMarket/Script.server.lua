local Delta = math.random(180,900)
local Tween = game:GetService("TweenService")

local ItemTypes = {
	{
		Name = "Silver Egg",

		CostMin = 10000000,
		CostMax = 25000000,
		CostAType = "IStats",
		CostType = "Honey",

		ItemAType = "Inventory",
		ItemType = "Silver Egg",
		ItemAmount = 1,

		CraftT = true,
		Craft = {
			{
				Name = "Ticket",
				AM = 5,
				AMA = 10,
			},
		},

		Rarity = 50,
	},
	{
		Name = "Golden Egg",

		CostMin = 25000000,
		CostMax = 100000000,
		CostAType = "IStats",
		CostType = "Honey",

		ItemAType = "Inventory",
		ItemType = "Golden Egg",
		ItemAmount = 1,

		CraftT = true,
		Craft = {
			{
				Name = "Ticket",
				AM = 15,
				AMA = 25,
			},
		},

		Rarity = 25,
	},
	{
		Name = "Shroom",

		CostMin = 25000,
		CostMax = 75000,
		CostAType = "IStats",
		CostType = "Honey",

		ItemAType = "Inventory",
		ItemType = "Shroom",
		ItemAmount = 1,

		Craft = {},

		Rarity = 150,
	},
	{
		Name = "Seed",

		CostMin = 10000,
		CostMax = 50000,
		CostAType = "IStats",
		CostType = "Honey",

		ItemAType = "Inventory",
		ItemType = "Seed",
		ItemAmount = 1,

		Craft = {},

		Rarity = 250,
	},
	{
		Name = "Fertilizer",

		CostMin = 100000,
		CostMax = 500000,
		CostAType = "IStats",
		CostType = "Honey",

		ItemAType = "Inventory",
		ItemType = "Fertilizer",
		ItemAmount = 1,

		CraftT = true,
		Craft = {
			{
				Name = "Ticket",
				AM = 5,
				AMA = 10,
			},
			{
				Name = "Sprout",
				AM = 1,
				AMA = 2,
			},
			{
				Name = "Seed",
				AM = 15,
				AMA = 25,
			},
		},

		Rarity = 500,
	},
	{
		Name = "Strawberry",

		CostMin = 10000,
		CostMax = 50000,
		CostAType = "IStats",
		CostType = "Honey",

		ItemAType = "Inventory",
		ItemType = "Strawberry",
		ItemAmount = 1,

		Craft = {},

		Rarity = 250,
	},
	{
		Name = "Blueberry",

		CostMin = 10000,
		CostMax = 50000,
		CostAType = "IStats",
		CostType = "Honey",

		ItemAType = "Inventory",
		ItemType = "Blueberry",
		ItemAmount = 1,

		Craft = {},

		Rarity = 250,
	},
	{
		Name = "Legendary Sprout",

		CostMin = 25000000,
		CostMax = 50000000,
		CostAType = "IStats",
		CostType = "Honey",

		ItemAType = "Inventory",
		ItemType = "Legendary Sprout",
		ItemAmount = 1,

		CraftT = true,
		Craft = {
			{
				Name = "Ticket",
				AM = 125,
				AMA = 200,
			},
		},

		Rarity = 25,
	},
	{
		Name = "Epic Sprout",

		CostMin = 7500000,
		CostMax = 20000000,
		CostAType = "IStats",
		CostType = "Honey",

		ItemAType = "Inventory",
		ItemType = "Epic Sprout",
		ItemAmount = 1,

		CraftT = true,
		Craft = {
			{
				Name = "Ticket",
				AM = 50,
				AMA = 100,
			},
		},

		Rarity = 50,
	},
	{
		Name = "Rare Sprout",

		CostMin = 2500000,
		CostMax = 6500000,
		CostAType = "IStats",
		CostType = "Honey",

		ItemAType = "Inventory",
		ItemType = "Rare Sprout",
		ItemAmount = 1,

		CraftT = true,
		Craft = {
			{
				Name = "Ticket",
				AM = 15,
				AMA = 25,
			},
		},

		Rarity = 75,
	},
	{
		Name = "Diamond Egg",

		CostMin = 100000000,
		CostMax = 250000000,
		CostAType = "IStats",
		CostType = "Honey",

		ItemAType = "Inventory",
		ItemType = "Diamond Egg",
		ItemAmount = 1,

		CraftT = true,
		Craft = {
			{
				Name = "Ticket",
				AM = 25,
				AMA = 50,
			},
		},

		Rarity = 15,
	},
	{
		Name = "Energy Drink",

		CostMin = 2500000,
		CostMax = 6000000,
		CostAType = "IStats",
		CostType = "Honey",

		ItemAType = "Inventory",
		ItemType = "Energy Drink",
		ItemAmount = 1,

		CraftT = true,
		Craft = {
			{
				Name = "Sugar",
				AM = 50,
				AMA = 75,
			},
			{
				Name = "Ticket",
				AM = 5,
				AMA = 10,
			},
		},

		Rarity = 250,
	},
	{
		Name = "Caramel Bottle",

		CostMin = 2500000,
		CostMax = 6000000,
		CostAType = "IStats",
		CostType = "Honey",

		ItemAType = "Inventory",
		ItemType = "Caramel Bottle",
		ItemAmount = 1,

		CraftT = true,
		Craft = {
			{
				Name = "Caramel",
				AM = 5,
				AMA = 15,
			},
			{
				Name = "Ticket",
				AM = 5,
				AMA = 10,
			},
		},

		Rarity = 250,
	},
	{
		Name = "Butter",

		CostMin = 2500000,
		CostMax = 6000000,
		CostAType = "IStats",
		CostType = "Honey",

		ItemAType = "Inventory",
		ItemType = "Butter",
		ItemAmount = 1,

		CraftT = true,
		Craft = {
			{
				Name = "Seed",
				AM = 50,
				AMA = 75,
			},
			{
				Name = "Ticket",
				AM = 5,
				AMA = 10,
			},
		},

		Rarity = 250,
	},
	{
		Name = "Strawberry Juice",

		CostMin = 2500000,
		CostMax = 6000000,
		CostAType = "IStats",
		CostType = "Honey",

		ItemAType = "Inventory",
		ItemType = "Strawberry Juice",
		ItemAmount = 1,

		CraftT = true,
		Craft = {
			{
				Name = "Strawberry",
				AM = 50,
				AMA = 75,
			},
			{
				Name = "Ticket",
				AM = 5,
				AMA = 10,
			},
		},

		Rarity = 250,
	},
	{
		Name = "Blueberry Juice",

		CostMin = 2500000,
		CostMax = 6000000,
		CostAType = "IStats",
		CostType = "Honey",

		ItemAType = "Inventory",
		ItemType = "Blueberry Juice",
		ItemAmount = 1,
		CraftT = true,
		Craft = {
			{
				Name = "Blueberry",
				AM = 50,
				AMA = 75,
			},
			{
				Name = "Ticket",
				AM = 5,
				AMA = 10,
			},
		},

		Rarity = 250,
	},
	{
		Name = "Instant Converter",

		CostMin = 250000,
		CostMax = 900000,
		CostAType = "IStats",
		CostType = "Honey",

		ItemAType = "Inventory",
		ItemType = "Instant Converter",
		ItemAmount = 1,
		CraftT = true,
		Craft = {
			{
				Name = "Ticket",
				AM = 10,
				AMA = 20,
			},
		},

		Rarity = 150,
	},
}

function RandomDrop()
	local Data = ItemTypes
	local TotalWeight = 0

	for i,v in pairs(Data) do
		TotalWeight += v.Rarity
	end
	local Chance = math.random(1, TotalWeight)
	local coun = 0
	for i,v in pairs(Data) do
		coun += v.Rarity
		if coun >= Chance then
			return v
		end
	end
end

function UpdateShop()
	script.Parent.Platfrom.Sound:Play()
	for _, Item in pairs(script.Parent.Items:GetChildren()) do
		wait(0.1)
		spawn(function()
		Item.Size = Vector3.new(0,0,0)
		Tween:Create(Item, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = Vector3.new(6,6,6)}):Play()
		local CRnd = RandomDrop()
		Item.Cost.Value = math.random(CRnd.CostMin, CRnd.CostMax)
		Item.Decal.Texture = require(game.ReplicatedStorage.Modules.Items).Eggs[CRnd.Name].Image
		if CRnd.CraftT and not Item:FindFirstChild("Craft") then
			local Folder = Instance.new("Folder", Item)
			Folder.Name = "Craft"
			for _, Craft in pairs(CRnd.Craft) do
				local CraftItem = Instance.new("Folder", Folder)
				CraftItem.Name = Craft.Name
				local Amount = Instance.new("IntValue", CraftItem)
				Amount.Name = "Amount"
				Amount.Value = math.random(Craft.AM, Craft.AMA)
			end
		elseif not CRnd.CraftT and Item:FindFirstChild("Craft") then
			Item:FindFirstChild("Craft"):Destroy()
		end
		for i,v in pairs(Item:GetChildren()) do
			if CRnd[v.Name] then
				if v.Name ~= "Craft" then
					v.Value = CRnd[v.Name]
				end
			end
		end
	end)
	end
end

local fff = require(game.ReplicatedStorage.Utilities)
UpdateShop()

while wait(1) do
	Delta -= 1
	script.Parent.ShopTimer.Part.ui.txt.Text = fff:FormatTime(Delta)
	if Delta <= 0 then
		Delta = math.random(180,600)
		UpdateShop()
	end
end