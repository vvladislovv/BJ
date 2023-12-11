local TS = game:GetService("TweenService")
local GeneratorFields = require(game.ServerScriptService.Server.GenerateFields)

local module = {}

function module:Blob(Position, PData)
	if PData.Vars.Field ~= "" then
		for i,v in pairs(workspace.Fields[PData.Vars.Field]:GetChildren()) do
			if (v.Position - Position).Magnitude <= 10 and not v:FindFirstChild("CaramelPart") then
				module:SpawnCaramel(v)
			end
		end
	end
end

function module:UseCaramel(PrimaryPart)
	for count = 1,math.random(4,6) do
		local Caramel = script.Caramel:Clone()
		Caramel.Parent = workspace
		if typeof(PrimaryPart) ~= "Vector3" then
			Caramel.Position = PrimaryPart.Position + Vector3.new(math.random(-15,15), 15, math.random(-15,15))
		else
			Caramel.Position = PrimaryPart + Vector3.new(math.random(-15,15), 15, math.random(-15,15))
		end
		Caramel.Anchored = false
		spawn(function()
			wait(2)
			Caramel:Destroy()
		end)
		local Flowers = {}
		Caramel.Touched:Connect(function(Flower)
			if Flower.Name == "Flower" then
				Caramel.CanTouch = false
				local Stamp = script.CaramelStamp:Clone()
				Stamp.Parent = workspace
				Stamp.Position = Flower.Position + Vector3.new(0,2,0)
				Stamp.Anchored = false
				Stamp.Touched:Connect(function(Part)
					if Part.Name == "Flower" and not Part:FindFirstChild("CaramelPart") then
						if not table.find(Flowers, Part) then
							table.insert(Flowers, Part)
							module:SpawnCaramel(Part)
						end
					end
				end)
			end
		end)
		wait(0.2)
	end
end

function module:SpawnCaramel(Flower)
	if Flower:FindFirstChild("Caramel") then
		Flower:FindFirstChild("Caramel"):Destroy()
	end
	local CP = script.CaramelPart:Clone()
	CP.Parent = Flower
	CP.Position = Vector3.new(Flower.Position.X, GeneratorFields.Flowers[Flower.FlowerID.Value].MaxPosition, Flower.Position.Z)
	CP.Material = Enum.Material.Glass
	CP.Transparency = 0.1
	CP.Color = Color3.fromRGB(255, 174, 80):Lerp(Color3.fromRGB(122, 74, 40), math.abs((math.noise(Flower.Position.X / workspace.FieldZones[Flower.Parent.Name].Size.X, Flower.Position.Z / workspace.FieldZones[Flower.Parent.Name].Size.Z, math.random(1,10)) * 8) / 5))
	spawn(function()
		wait(7)
		TS:Create(CP, TweenInfo.new(3, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Transparency = 1}):Play()
		wait(3)
		CP:Destroy()
	end)
end

return module
