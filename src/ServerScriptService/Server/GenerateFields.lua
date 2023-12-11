-- 29, 87, 27 - Summer/Spring Theme
-- 191, 191, 191 - Winter Theme
local Module = {} do
	--// Locals \\--
	Module.MaxSize = 3
	Module.Flowers = {}
	Module.Fields = {
		["Daisy"] = {
			Flowers = {
				MiniWhite = 20,
				DoubleWhite = 15,
				TripleWhite = 10,
				MiniRed = 5,
				DoubleRed = 7,
				TripleRed = 4,
				MiniBlue = 5,
				DoubleBlue = 6,
				TripleBlue = 4,
			},
		},
		["Termit Hollow"] = {
			Flowers = {
				MiniWhite = 33,
				DoubleWhite = 0,
				TripleWhite = 0,
				MiniRed = 33,
				DoubleRed = 0,
				TripleRed = 0,
				MiniBlue = 33,
				DoubleBlue = 0,
				TripleBlue = 0,
			},
		},
		["Mushroom"] = {
			Flowers = {
				MiniWhite = 5,
				DoubleWhite = 5,
				TripleWhite = 0,
				MiniRed = 20,
				DoubleRed = 15,
				TripleRed = 5,
				MiniBlue = 0,
				DoubleBlue = 0,
				TripleBlue = 0,
			},
		},
		
		["Clover"] = {
			Flowers = {
				MiniWhite = 33,
				DoubleWhite = 5,
				TripleWhite = 0,
				MiniRed = 33,
				DoubleRed = 5,
				TripleRed = 5,
				MiniBlue =33,
				DoubleBlue = 5,
				TripleBlue = 0,
			},
		},
		
		["Sunflower"] = {
			Flowers = {
				MiniWhite = 70,
				DoubleWhite = 2,
				TripleWhite = 0,
				MiniRed = 10,
				DoubleRed = 2,
				TripleRed = 0,
				MiniBlue =10,
				DoubleBlue = 2,
				TripleBlue = 0,
			},
		},
		["Blue Flowers"] = {
			Flowers = {
				MiniWhite = 10,
				DoubleWhite = 1,
				TripleWhite = 0,
				MiniRed = 0,
				DoubleRed = 0,
				TripleRed = 0,
				MiniBlue = 30,
				DoubleBlue = 25,
				TripleBlue = 5,
			},
		},
		["Strawberry"] = {
			Flowers = {
				MiniWhite = 10,
				DoubleWhite = 1,
				TripleWhite = 0,
				MiniRed = 5,
				DoubleRed = 25,
				TripleRed = 15,
				MiniBlue = 0,
				DoubleBlue = 0,
				TripleBlue = 0,
			},
		},
		
		["Pumpkin"] = {
			Flowers = {
				MiniWhite = 3,
				DoubleWhite = 20,
				TripleWhite = 41,
				MiniRed = 1,
				DoubleRed = 10,
				TripleRed = 7,
				MiniBlue = 1,
				DoubleBlue = 10,
				TripleBlue = 7,
			},
		},
		
		["Pine Tree"] = {
			Flowers = {
				MiniWhite = 5,
				DoubleWhite = 5,
				TripleWhite = 5,
				MiniBlue = 5,
				DoubleBlue = 60,
				TripleBlue = 20,
			},
		},
		
		["Cactus"] = {
			Flowers = {
				MiniWhite = 3,
				DoubleWhite = 3,
				TripleWhite = 4,
				MiniBlue = 5,
				DoubleBlue = 25,
				TripleBlue = 15,
				MiniRed = 5,
				DoubleRed = 25,
				TripleRed = 15,
			},
		},
		
		["Cattail"] = {
			Flowers = {
				MiniWhite = 1,
				DoubleWhite = 25,
				TripleWhite = 1,
				MiniBlue = 1,
				DoubleBlue = 25,
				TripleBlue = 15,
				MiniRed = 0,
				DoubleRed = 0,
				TripleRed = 0,
			},
		},
		["Red Flowers"] = {
			Flowers = {
				MiniWhite = 1,
				DoubleWhite = 25,
				TripleWhite = 1,
				MiniRed = 1,
				DoubleRed = 25,
				TripleRed = 15,
				MiniBlue = 0,
				DoubleBlue = 0,
				TripleBlue = 0,
			},
		},
		["Dandelion"] = {
			Flowers = {
				MiniWhite = 1,
				DoubleWhite = 25,
				TripleWhite = 1,
				MiniRed = 1,
				DoubleRed = 1,
				TripleRed = 1,
				MiniBlue = 1,
				DoubleBlue = 1,
				TripleBlue = 1,
			},
		},
		["Mountain Top"] = {
			Flowers = {
				MiniWhite = 0,
				DoubleWhite = 0,
				TripleWhite = 0,
				MiniRed = 0,
				DoubleRed = 25,
				TripleRed = 50,
				MiniBlue = 0,
				DoubleBlue = 25,
				TripleBlue = 50,
			},
		},
		["Stump"] = {
			Flowers = {
				MiniWhite = 0,
				DoubleWhite = 5,
				TripleWhite = 25,
				MiniRed = 0,
				DoubleRed = 0,
				TripleRed = 0,
				MiniBlue = 0,
				DoubleBlue = 15,
				TripleBlue = 75,
			},
		},
	}
	Module.FlowerTypes = {
		["3White"] = "rbxassetid://11522571767",
		["1White"] = "rbxassetid://11522564795",
		["2White"] = "rbxassetid://11522568393",
		["3Red"] = "rbxassetid://11522441348",
		["2Red"] = "rbxassetid://11522434243",
		["1Red"] = "rbxassetid://11522428707",
		["2Blue"] = "rbxassetid://11530559628",
		["3Blue"] = "rbxassetid://11530554857",
		["1Blue"] = "rbxassetid://11530540299"
	}
	--// Functions \\--
	function GetFlowerType(FlowerName)
		local Type = {}
		if string.find(FlowerName, "Mini") then
			--Type["Size"] = "Mini"
			Type["Value"] = "1"
		elseif string.find(FlowerName, "Double") then
			--Type["Size"] = "Double"
			Type["Value"] = "2"
		elseif string.find(FlowerName, "Triple") then
			--Type["Size"] = "Triple"
			Type["Value"] = "3"
		end

		if string.find(FlowerName, "Red") then
			Type["Color"] = "Red"
		elseif string.find(FlowerName, "Blue") then
			Type["Color"] = "Blue"
		elseif string.find(FlowerName, "White") then
			Type["Color"] = "White"
		end

		Type["Texture"] = Module.FlowerTypes[FlowerName]
		return Type
	end
	function GetRandomFlower(FieldName)
		local MainTable = {}
		local Number = 0
		for i,v in pairs(Module.Fields[FieldName].Flowers) do
			if v > 0 then
				MainTable[#MainTable + 1] = { v + Number, i }
				Number = Number + v
			end
		end
		local RandomNumber = math.random(0, Number)
		for i,v in pairs(MainTable) do
			if RandomNumber <= v[1] then
				return v[2]
			end
		end
		return nil
	end
	function Module:RegisterFlower(Flower)
		local FlowerType = GetFlowerType(GetRandomFlower(Flower.Parent.Name))
		local FlowerID = Flower:FindFirstChild("FlowerID")
		local FlowerColor = FlowerType.Color
		local ID = #Module.Flowers + 1
		FlowerID.Value = ID
		Module.Flowers[ID] = {
			Color = FlowerColor,
			Stat = FlowerType,
			MaxPosition = Flower.Position.Y,
			MinPosition = Flower.Position.Y - 2.5,
			Regen = 0.3,
			GooColor = Color3.fromRGB(242, 129, 255):Lerp(Color3.fromRGB(33, 255, 171), math.abs((math.noise(Flower.Position.X / workspace.FieldZones[Flower.Parent.Name].Size.X, Flower.Position.Z / workspace.FieldZones[Flower.Parent.Name].Size.Z, math.random(1,10)) * 8) / 5)),
		}
		Flower.TopTexture.Texture = Module.FlowerTypes[Module.Flowers[ID].Stat.Value..Module.Flowers[ID].Color]
	end
	
	
	function Module:GenerateFlower(Field, Position, Orientation)
		local Flower = script.Flower:Clone()
		Flower.Parent = Field
		Flower.CFrame = Position
		local Math = math.random(1,4)
		if Math == 1 then
			Flower.Orientation = Vector3.new(0,90,0)
		elseif Math == 2 then
			Flower.Orientation = Vector3.new(0,180,0)
		elseif Math == 3 then
			Flower.Orientation = Vector3.new(0,-90,0)
		elseif Math == 4 then
			Flower.Orientation = Vector3.new(0,-180,0)
		end
		Module:RegisterFlower(Flower)
	end
	function Module:GenerateField(Zone)
		local Field = Instance.new("Model", workspace.Fields)
		Field.Name = Zone.Name
		local Pos1 = Zone.Position + Vector3.new((Zone.Size.X / 2) - 2, 0, (Zone.Size.Z / 2) - 2)
		local Pos2 = Zone.Position - Vector3.new((Zone.Size.X / 2) - 2, 0, (Zone.Size.Z / 2) - 2)
		local v1 = Pos1.X - Pos1.X % 0.000000000000001
		local v2 = Pos1.Z - Pos1.Z % 0.000000000000001
		local v3 = Pos2.X - Pos2.X % 0.000000000000001
		local v4 = Pos2.Z - Pos2.Z % 0.000000000000001
		for CFrame1 = math.min(v1, v3), math.max(v1, v3), 3 do
			for CFrame2 = math.min(v2, v4), math.max(v2, v4), 3 do
				Module:GenerateFlower(Field, CFrame.new(CFrame1, Pos1.Y, CFrame2))
			end
		end
		if Zone.Name == "Stump" then
			for i,v in pairs(game.Workspace.Fields.Stump:GetChildren()) do
				if (v.Position-workspace.FieldZones.Stump.Position).Magnitude >= 60 then
					v:Destroy()
				end
			end
		end
	end
	--// Generate \\--
	for i,v in pairs(workspace.FieldZones:GetChildren()) do
		Module:GenerateField(v)
	end
end

return Module