local v1 = {}
local SSS = game:GetService("ServerScriptService")
local Debris = game:GetService("Debris")
local Fields = require(SSS:WaitForChild("Server").GenerateFields)
local FlowerRegister = require(SSS:WaitForChild("Server").FlowerRegister)
local ts = game:GetService("TweenService")
local BeeMove = game.ReplicatedStorage.Assets.BeesAnimations:WaitForChild('Move')
local Remotes = game:GetService("ReplicatedStorage").Remotes
local Tween = game:GetService("TweenService")
local Utils = require(game.ReplicatedStorage.Modules.Utils)

local function WaitUntilReached(BeeModel, Magnitude)
	repeat wait() if not BeeModel.PrimaryPart then break end
	until (BeeModel.PrimaryPart.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7) --or PositionerDist(BeeModel.Positioner, HRP)
end


function v1.Spawn(p3, Player)
	local PollenStats = {
		WhiteMini = 5000 / 1.5,
		WhiteDouble = 7500 / 1.5,
		WhiteTriple = 10000 / 1.5,

		BlueMini = 2500 / 1.5,
		BlueDouble = 5000 / 1.5,
		BlueTriple = 7500 / 1.5,

		RedMini = 2500 / 1.5,
		RedDouble = 5000 / 1.5,
		RedTriple = 7500 / 1.5,
	}
	
	local FoodAmount
	local Tabs = {
		White = 0,
		Blue = 0,
		Red = 0,
		Honey = 0,
	}
	
	coroutine.wrap(function()
		if p3.PData.Vars.Field ~= "" then
			for i = 1, 15 do
				wait(0.05)
				spawn(function()
				local Flower = workspace.Fields[p3.PData.Vars.Field]:GetChildren()[math.random(1,#workspace.Fields[p3.PData.Vars.Field]:GetChildren())]
				local cyl = script.Cyl:Clone()
				cyl.Size = Vector3.new(math.random(6,12), 1, 1)
				cyl.Position = Flower.Position + Vector3.new(0,math.random(20,30),0)
				cyl.Parent = workspace.PlayerEffects[Player.Name]
				Tween:Create(cyl, TweenInfo.new(1.25), {Transparency = 1}):Play()
				Tween:Create(cyl, TweenInfo.new(3), {Position = Flower.Position - Vector3.new(0,35,0)}):Play()wait(0.145)
				
				Debris:AddItem(cyl, 3)
				spawn(function()
					wait(1.1)
					cyl.Anchored = false
				end)
				cyl.Touched:Connect(function(part)
					if part.Name == "Flower" then
						local FlowerSize = Fields.Flowers[part.FlowerID.Value].Size.Size
						local FlowerSiz2e = Fields.Flowers[part.FlowerID.Value].Size.Value
						local FlowerColor = Fields.Flowers[part.FlowerID.Value].Color
						local Flower = Fields.Flowers[part.FlowerID.Value].Color..Fields.Flowers[part.FlowerID.Value].Size.Size
						local Percent = p3.PData.AllStats[FlowerColor.." Instant"] + p3.PData.AllStats["Instant"]
						if Percent >= 100 then
							Percent = 100
						end
						local SS = PollenStats[FlowerColor..FlowerSize]
						if p3.PData.Vars.Field ~= nil then
							FoodAmount = math.round(SS * ((p3.PData.AllStats["Pollen"] / 100) * (p3.PData.AllStats[FlowerColor.." Pollen"] / 100) * (p3.PData.AllStats["Bomb Pollen"] / 100) * (p3.PData.AllStats[FlowerColor.." Bomb Pollen"] / 100) * (p3.PData.AllStats[p3.PData.Vars.Field] / 100)))
							local Convert = math.round(FoodAmount * (Percent / 100))
							Tabs[FlowerColor] += math.round(FoodAmount - Convert)
							Tabs["Honey"] += math.round(Convert)
							
							FlowerRegister:CollectFlower(Player, p3.PData, part, {
								Bomb = "",
								Powers = {
									WhiteMini = 0.7,
									WhiteDouble = 0.65,
									WhiteTriple = 0.5,

									BlueMini = 0.55,
									BlueDouble = 0.35,
									BlueTriple = 0.25,

									RedMini = 0.55,
									RedDouble = 0.35,
									RedTriple = 0.25,
								},
								Pollen = {
									WhiteMini = 5000 / 1.5,
									WhiteDouble = 7500 / 1.5,
									WhiteTriple = 10000 / 1.5,

									BlueMini = 2500 / 1.5,
									BlueDouble = 5000 / 1.5,
									BlueTriple = 7500 / 1.5,

									RedMini = 2500 / 1.5,
									RedDouble = 5000 / 1.5,
									RedTriple = 7500 / 1.5,
								},
							}, nil, false)
						end
					end
				end)
				wait(0.6)
			end)
			end
		end
	end) ()
	
	spawn(function()
		local Character = game.Workspace:FindFirstChild(Player.Name)
		game.ReplicatedStorage.Remotes.Visual:FireClient(Player, Tabs, Tabs.Honey, Tabs.White, Tabs.Red, Tabs.Blue, Character.HumanoidRootPart)
	end)
end


return v1