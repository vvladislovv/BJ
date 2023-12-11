local Players = game:GetService("Players")
local SSS = game:GetService("ServerScriptService")
local Rep = game.ReplicatedStorage
local Remotes = Rep.Remotes
local Modules = Rep.Modules
local Data = require(script.Parent.Parent.Server.Data)
local Items = require(Modules.Items)
local Fields = require(script.Parent.Parent.Server.GenerateFields)
local Utilities = require(game.ReplicatedStorage.Utilities)
local ts = game:GetService("TweenService")
local Utils = require(Modules.Utils)
local Bees = game.ReplicatedStorage.Bees
local Levels = require(Modules.BeeLevels)
local Utils = require(game.ReplicatedStorage.Modules.Utils)
local TokensManager = require(game.ServerScriptService.Modules.TokensManager)
local Loots = require(script.BlowballsLoot)

function Format(Int)
	return string.format("%02i", Int)
end

local function WaitUntilReached(Model, SecondPart, Magnitude)
	if Model and Model.PrimaryPart and SecondPart then
		repeat wait() if not Model.PrimaryPart or not SecondPart then break end
		until (Model.PrimaryPart.Position - SecondPart).Magnitude <= (Magnitude or 0.7)
	else
		return
	end
end

function CreateSeed(FirstPos, SecondPos, F, S)
	local Seed = script.Seed:Clone()
	
	local Fs = Seed.F.Size
	local Ss = Seed.S.Size
	local Ts = Seed.T.Size
	
	Seed.F.Size = Vector3.new(0,0,0)
	Seed.S.Size = Vector3.new(0,0,0)
	Seed.T.Size = Vector3.new(0,0,0)
	
	local Y = 30
	local X = 15
	
	Seed.Parent = workspace
	Seed:SetPrimaryPartCFrame(FirstPos + Vector3.new(0,5,0))
	
	repeat
		Seed.PrimaryPart.BV.Velocity = Vector3.new(math.random(-X,X),Y,math.random(-X,X))
		Y -= 1
		X -= 0.5
		wait(0.1)
	until
	Y <= 0
	
	Seed.PrimaryPart.BV.Velocity = Vector3.new(0,0,0)
	
	ts:Create(Seed.F, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = Fs}):Play()
	ts:Create(Seed.T, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = Ts}):Play()
	ts:Create(Seed.S, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = Ss}):Play()
	wait(0.1)
	Seed.Part.Transparency = 0
	
	local Part2 = Instance.new("Part")
	Part2.Parent = workspace
	Part2.Position = S + Vector3.new(0,30,0)
	Part2.Anchored = true
	Part2.CanCollide = false
	Part2.Transparency = 1
	local Attach = Instance.new("Attachment")
	Attach.Parent = Part2
	
	Seed.PrimaryPart.BV:Destroy()
	Seed.AlignPosition.Attachment1 = Attach
	
	spawn(function()
		wait(math.random(0,2))
		while Seed do
			if Seed and Seed.PrimaryPart then
				wait(0.5)
				if Seed and Seed.PrimaryPart then
					Seed.PrimaryPart.BG.CFrame = CFrame.Angles(math.rad(15),180,math.rad(-15))
				end
				wait(0.5)
				if Seed and Seed.PrimaryPart then
					Seed.PrimaryPart.BG.CFrame = CFrame.Angles(math.rad(-15),-180,math.rad(15))
				end
				wait(0.5)
				if Seed and Seed.PrimaryPart then
					Seed.PrimaryPart.BG.CFrame = CFrame.Angles(math.rad(-15),-180,math.rad(15))
				end
				wait(0.5)
				if Seed and Seed.PrimaryPart then
					Seed.PrimaryPart.BG.CFrame = CFrame.Angles(math.rad(15),180,math.rad(-15))
				end
			else
				break
			end
		end
	end)
	
	spawn(function()
		Seed.AlignPosition.MaxVelocity = 0
		repeat
			wait(0.1)
			if Seed then
				Seed.AlignPosition.MaxVelocity += 1
			else
				break
			end
		until
		Seed.AlignPosition.MaxVelocity >= 20
		if Seed then
			Seed.AlignPosition.MaxVelocity = 20
		end
	end)
	
	WaitUntilReached(Seed, Part2.Position, 1)
	Seed.AlignPosition.Attachment1 = nil
	local a = math.random(1,2)
	if a == 1 then
		Seed.PrimaryPart.BG.CFrame = CFrame.Angles(0,180,180)
	else
		Seed.PrimaryPart.BG.CFrame = CFrame.Angles(0,180,-180)
	end
	
	wait(1)
	Seed:Destroy()
	Part2:Destroy()
end

function FormatTime(Seconds)
	local Minutes = (Seconds - Seconds%60)/60
	Seconds = Seconds - Minutes*60

	local Hours = (Minutes - Minutes%60)/60
	Minutes = Minutes - Hours*60

	local Days = (Hours - Hours%24)/24
	Hours = Hours - Days*24

	return Format(Minutes)..":"..Format(Seconds)
end

local BlowballMechanic = {} do
	
	BlowballMechanic.Balls = {}
	
	local Info = {}
	
	Info.Rarities = {
		["Classic"] = {Chance = 82000, NeedLevel = 1, MultPerLevel = 1.131, Name = "Classic"},
		["Rare"] = {Chance = 10000, NeedLevel = 3, MultPerLevel = 1.6167, Name = "Rare"},
		["Epic"] = {Chance = 7600, NeedLevel = 5, MultPerLevel = 2.615, Name = "Epic"},
		["Legendary"] = {Chance = 325, NeedLevel = 8, MultPerLevel = 3.2182, Name = "Legendary"},
		["Mythic"] = {Chance = 75, NeedLevel = 11, MultPerLevel = 5.1173, Name = "Mythic"},
	}
	
	function UpdateTime(Ball, Time)
		if Ball and Ball:FindFirstChild("Stvol") then
			Ball.Stvol.atch.BG.TimeBar.Time.Text = FormatTime(Time - os.time())
			Ball.Stvol.atch.BG.TimeBar.FillBar.Size = UDim2.new(math.clamp((Time - os.time())/300, 0, 1),0,1,0)
		end
	end
	
	function BlowballMechanic.UV(Ball)
		local binf = BlowballMechanic.Balls[Ball.ID.Value]
		Ball.Stvol.atch.BG.Bar.HP.Text = Utils:CommaNumber(binf.HP).."/"..Utils:CommaNumber(binf.HPMax)
		Ball.Stvol.atch.BG.Bar.FillBar.Size = UDim2.new(math.clamp(binf.HP/binf.HPMax, 0, 1),0,1,0)
		if binf.HP >= binf.HPMax / 4 and binf.HP < binf.HPMax / 2 then
			Ball.Zhelt.Transparency = 0
			Ball.T.Transparency = 1
			Ball.G.Transparency = 1
		elseif binf.HP >= binf.HPMax / 2 and binf.HP < binf.HPMax / 1.25 then
			Ball.Zhelt.Transparency = 1
			Ball.T.Transparency = 0
			Ball.G.Transparency = 0
			if BlowballMechanic.Balls[Ball.ID.Value].Rarity == "Classic" then
				Ball.T.Color = Color3.fromRGB(255,255,255)
			end
		elseif binf.HP >= binf.HPMax / 1.25 then
			Ball.Zhelt.Transparency = 1
			Ball.T.Transparency = 1
			Ball.G.Transparency = 1
			Ball.White1.Transparency = 0.75
			Ball.WhiteCenter.Transparency = 0
		end
	end
	
	
	local totalleg = 0
	local totalmyth = 0
	function GetRarity()
		local TotalWeight = 0

		for i,v in pairs(Info.Rarities) do
			TotalWeight += v.Chance
		end
		local Chance = math.random(1, TotalWeight)
		local coun = 0
		for i,v in pairs(Info.Rarities) do
			coun += v.Chance
			if coun >= Chance then
				if v.Name == "Mythic" then
					totalmyth += 1
				elseif v.Name == "Legendary" then
					totalleg += 1
				end
				return v
			end
		end
	end
	
	function GetRandomField(Field)
		local NearFields = {}
		if Field == "Blue Flowers" then
			NearFields[1] = "Mushroom"
			NearFields[2] = "Mountain Top"
			NearFields[2] = "Strawberry"
		elseif Field == "Mushroom" then
			NearFields[1] = "Blue Flowers"
			NearFields[2] = "Daisy"
			NearFields[3] = "Strawberry"
		elseif Field == "Daisy" then
			NearFields[1] = "Sunflower"
			NearFields[2] = "Mushroom"
		elseif Field == "Sunflower" then
			NearFields[1] = "Daisy"
			NearFields[2] = "Clover"
		elseif Field == "Strawberry" then
			NearFields[1] = "Cactus"
			NearFields[2] = "Blue Flowers"
			NearFields[3] = "Daisy"
		elseif Field == "Cactus" then
			NearFields[1] = "Strawberry"
			NearFields[2] = "Pine Tree"
			NearFields[3] = "Pumpkin"
		elseif Field == "Pine Tree" then
			NearFields[1] = "Clover"
			NearFields[2] = "Cactus"
			NearFields[3] = "Pumpkin"
		elseif Field == "Pumpkin" then
			NearFields[1] = "Pine Tree"
			NearFields[2] = "Cactus"
			NearFields[3] = "Cattail"
			NearFields[4] = "Red Flowers"
		elseif Field == "Cattail" then
			NearFields[1] = "Pumpkin"
			NearFields[2] = "Red Flowers"
			NearFields[3] = "Dandelion"
		elseif Field == "Red Flowers" then
			NearFields[1] = "Pumpkin"
			NearFields[2] = "Cattail"
			NearFields[3] = "Dandelion"
		elseif Field == "Dandelion" then
			NearFields[1] = "Red Flowers"
			NearFields[2] = "Cattail"
		end

		return NearFields[math.random(1,#NearFields)]
	end
	
	function GetRandomField2()
		local NearFields = { "Daisy", "Mushroom", "Sunflower" }

		return NearFields[math.random(1,#NearFields)]
	end
	
	function GetColor(Rarity)
		if Rarity == "Rare" then
			return Color3.fromRGB(163, 162, 165)
		elseif Rarity == "Epic" then
			return Color3.fromRGB(239, 184, 56)
		elseif Rarity == "Legendary" then
			return Color3.fromRGB(77, 192, 227)
		elseif Rarity == "Mythic" then
			return Color3.fromRGB(167, 94, 155)
		end
	end
	
	function GetRandomFlowerPosition(FieldName)
		local field = workspace.Fields[FieldName]:GetChildren()
		return field[math.random(1,#field)].Position
	end
	
	function BlowballMechanic.CreateBlowball(Lvl, Time, OldPos, OldF)
		spawn(function()
		local Model = script.Blowball:Clone()
		local BG = script.BG:Clone()
		BG.Parent = Model.Stvol.atch
		local Level = Lvl + math.random(-1,1)
		if Level <= 0 then
			Level = 1
		end
		local Rarity = GetRarity()
			
		if Rarity.Name ~= "Classic" then
		Model.T.Color = GetColor(Rarity.Name)
		Model.Zhelt.Color = GetColor(Rarity.Name)
		Model.White1.Color = GetColor(Rarity.Name)
		Model.WhiteCenter.Color = GetColor(Rarity.Name)
		Model.T.Material = Enum.Material.Glass
		Model.Zhelt.Material = Enum.Material.Glass
		Model.White1.Material = Enum.Material.Glass
		Model.WhiteCenter.Material = Enum.Material.Glass
		end
			
		local Field
		local NextField
		local ti = TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
		
		Field = GetRandomField2()
		NextField = GetRandomField(Field)
		Model.Parent = workspace.Blowballs
		
		local fp = GetRandomFlowerPosition(Field)
		Model:SetPrimaryPartCFrame(CFrame.new(fp + Vector3.new(0,-5,0)) * CFrame.Angles(0,math.random(-180,180),0))
		Model.Stvol.atch.BG.Enabled = false
		
		if OldPos then
			CreateSeed(OldPos, Model.PrimaryPart.CFrame, OldF, Model.PrimaryPart.Position)
		end
			
		local Mult = 1
			if Level >= 1 and Level < 3 then
				Mult = 1
			elseif Level >= 3 and Level < 7 then
				Mult = 1.25
			elseif Level >= 7 and Level < 12 then
				Mult = 1.5
			elseif Level >= 12 then
				Mult = 1.75
			end
			
		Model.Stvol.atch.BG.Enabled = true
		ts:Create(Model.Stvol, ti, {Position = fp + Vector3.new(0,2.5 * Mult,0)}):Play()
		wait(1)
		ts:Create(Model.G, ti, {Position = Model.Stvol.Main.WorldPosition}):Play()
		ts:Create(Model.Stvol.Leaf, ti, {Position = Model.Stvol.Position}):Play()
		ts:Create(Model.T, ti, {Position = Model.Stvol.Main.WorldPosition + Vector3.new(0,0.5,0)}):Play()
		spawn(function()
		wait(0.2)
		Model.G.Transparency = 0
		Model.T.Transparency = 0
		end)
		Model.White1.Position = Model.Stvol.Main.WorldPosition
		Model.WhiteCenter.Position = Model.White1.Position
		Model.Zhelt.Position = Model.Stvol.Main.WorldPosition
			
		Model.Stvol.atch.Position += Vector3.new(0,Model.Stvol.Size.Y * 1.5,0)
		local primary = Model.PrimaryPart
		local ID = #BlowballMechanic.Balls + 1
		Model.ID.Value = ID
		BlowballMechanic.Balls[ID] = {
			Level = Level,
			HPMax = math.round((10000 * (Level ^ 3)* Rarity.MultPerLevel)),
			HP = 0,
			Deb = false,
			Rarity = Rarity.Name,
			Field = Field,
			NextField = NextField,
			CentralPos = fp,
			Time = Time + os.time(),
			Stage = 1,
		}
		BlowballMechanic.UV(Model)
		Model.Stvol.atch.BG.Level.Text = Rarity.Name.." Blowball (lvl "..Level..")"
		
		spawn(function()
			while Model do
				wait(1)
				if Model then
					if BlowballMechanic.Balls[ID].Time - os.time() <= 0 then
						Model:Destroy()
						break
					else
						if Model then
							UpdateTime(Model, BlowballMechanic.Balls[ID].Time)
						else
							break
						end
					end
				else
					break
				end
			end
			end)
		end)
	end
	
	function BlowballMechanic.GetLoot(ID)
		spawn(function()
			local Field = game.Workspace.Fields[BlowballMechanic.Balls[ID].Field]
			for i,v in pairs(Field:GetChildren()) do
				if (v.Position - BlowballMechanic.Balls[ID].CentralPos).Magnitude <= 15 then
					local Rand = math.random(1,100)
					if Rand <= 5 then
						for b,d in pairs(Loots.Balls[BlowballMechanic.Balls[ID].Rarity]) do
							local Rand2 = math.random(1,1000)
							if Rand2 <= d.Chance then
								TokensManager.SpawnToken({
									Position = v.Position,
									Cooldown = 15,
									Token = {
										Item = b,
										Amount = math.random(1,#d.Amount),
										Type = "Drop",
									},
									Resourse = "Blowball",
								})
								wait(0.15)
							end
						end
					end
				end
			end
		end)
	end
	
	function BlowballMechanic.DestroyB(Ball, ID)
		local OldPos = Ball.PrimaryPart.CFrame
		local OldF = Ball.PrimaryPart.Position
		Ball:Destroy()
		BlowballMechanic.GetLoot(ID)
		for count = 1,5 do
			local random = math.random(1,100)
			if random <= 50 then
				BlowballMechanic.CreateBlowball(BlowballMechanic.Balls[ID].Level, BlowballMechanic.Balls[ID].Time - os.time(), OldPos, OldF)
			end
		end
	end
end

return BlowballMechanic