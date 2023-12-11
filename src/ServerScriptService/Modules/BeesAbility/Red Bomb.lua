local v1 = {}
local SSS = game:GetService("ServerScriptService")
local Debris = game:GetService("Debris")
local Fields = require(SSS:WaitForChild("Server").GenerateFields)
local FlowerRegister = require(SSS:WaitForChild("Server").FlowerRegister)
local FlowerRegister = require(SSS:WaitForChild("Server").FlowerRegister)

function v1.Spawn(p3, Player)
	local Character = game.Workspace:FindFirstChild(Player.Name)
	local Stamp = script.Stamp:Clone()
	Stamp.Position = p3.TokenPos + Vector3.new(0,0,0)
	Stamp.Parent = workspace

	local Flowers = {}

	Stamp.Touched:Connect(function(part)
		if part.Name == "Flower" then
			if not table.find(Flowers, part) then
				table.insert(Flowers, part)
				FlowerRegister:CollectFlower(Player, p3.PData, part, part, {
					Bomb = true,
					Color = "Red",
					Powers = 0.5,
					Pollen = 30,
				}, nil)
				wait(0.1)
				Stamp:Destroy()
			end
		end
	end)
end

return v1