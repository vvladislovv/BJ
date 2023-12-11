local v1 = {}
local SSS = game:GetService("ServerScriptService")
local Debris = game:GetService("Debris")
local Fields = require(SSS:WaitForChild("Server").GenerateFields)
local FlowerRegister = require(SSS:WaitForChild("Server").FlowerRegister)
local FlowerRegister = require(SSS:WaitForChild("Server").FlowerRegister)
local Remotes = game:GetService("ReplicatedStorage").Remotes

local deb = false
local spawned = false

function v1.Spawn(p3, Player)
	
	local Character = workspace:FindFirstChild(Player.Name)
	local wind = script.Wind:Clone()
	
	local FieldS = workspace.Fields[p3.PData.Vars.LastField]
	wind.Parent = workspace.PlayerEffects[Player.Name]
	for i = 1,30 do
		if i < 31 then
			local RandomFlower = FieldS:GetChildren()[math.random(1, #FieldS:GetChildren())]
			wind.Position = RandomFlower.Position + Vector3.new(0,3,0)
			wind.Anchored = false
			wait(0.5)
			wind.Anchored = true
			wait(0.1)
		else
			wind:Destroy()
		end
	end
	
	--local Stamp = script.Stamp:Clone()
	--Stamp.Position = p3.TokenPos + Vector3.new(0,0,0)
	local FoodAmount
	local Tabs = {
		White = 0,
		Blue = 0,
		Red = 0,
		Honey = 0,
	}
	
	wind.Touched:Connect(function(part)
		if part.Name == "Flower" then
			FlowerRegister:CollectFlower(Player, p3.PData, part, Character.PrimaryPart.Position, {
				Bomb = "",
				Powers = {
					WhiteMini = 0.6,
					WhiteDouble = 0.55,
					WhiteTriple = 0.5,

					BlueMini = 0.25,
					BlueDouble = 0.2,
					BlueTriple = 0.15,

					RedMini = 0.25,
					RedDouble = 0.2,
					RedTriple = 0.15,
				},
				Pollen = {
					WhiteMini = 100,
					WhiteDouble = 200,
					WhiteTriple = 300,

					BlueMini = 20,
					BlueDouble = 30,
					BlueTriple = 40,

					RedMini = 20,
					RedDouble = 30,
					RedTriple = 40,
				},
			}, nil, false)
		end
	end)
end
return v1