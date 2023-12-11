local v1 = {}

local ts = game:GetService("TweenService")
local flrModule = require(game.ServerScriptService.Server:WaitForChild("FlowerRegister"))

function v1.Spawn(Info)
	local PData = Info.PData
	local Field = Info.Field
	local Character = Info.Character
	local plr = game.Players:GetPlayerFromCharacter(Character)
	
	local Effect = script.SphereEffect:Clone()
	local Stamp = script.Stamp:Clone()
	
	Effect.Position = Character.HumanoidRootPart.Position
	Effect.Parent = workspace
	
	game.Debris:AddItem(Effect, 0.3)
	ts:Create(Effect, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = Vector3.new(25,25,25)}):Play()
	ts:Create(Effect, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Transparency = 0.9}):Play()
	
	Stamp.Position = Character.HumanoidRootPart.Position
	Stamp.Parent = workspace
	Stamp.Touched:Connect(function(part)
		if part.Name == "Flower" then
			flrModule:CollectFlower(plr, PData, part, {
				Powers = {
					WhiteMini = 0.25,
					WhiteDouble = 0.23,
					WhiteTriple = 0.2,

					BlueMini = 0.15,
					BlueDouble = 0.12,
					BlueTriple = 0.1,

					RedMini = 0.15,
					RedDouble = 0.12,
					RedTriple = 0.1,
				},
				Pollen = {
					WhiteMini = 25,
					WhiteDouble = 55,
					WhiteTriple = 100,

					BlueMini = 5,
					BlueDouble = 7,
					BlueTriple = 10,

					RedMini = 5,
					RedDouble = 7,
					RedTriple = 10,
				},
			})
			game.Debris:AddItem(Stamp, 1)
		end
	end)
end

return v1