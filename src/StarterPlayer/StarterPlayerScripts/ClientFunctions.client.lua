local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Alerts = require(ReplicatedStorage.Modules.Alerts)
local Items = require(ReplicatedStorage.Modules.Items)
local TS = game:GetService("TweenService")
local CameraShaker = require(ReplicatedStorage.Modules.Client.CameraShaker)
local Remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
local HoverInfo = require(game.ReplicatedStorage.Modules.InfoHover)
local UserInputService = game:GetService("UserInputService")

local Player = game.Players.LocalPlayer

local Camera = game.Workspace.CurrentCamera
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")
local UI = Player.PlayerGui:WaitForChild("UI")
local PlayerGui = Player.PlayerGui
local List = game.Players.LocalPlayer.PlayerGui:WaitForChild("UI").Boosts

local Scale = game.Players.LocalPlayer.PlayerGui.UI.AbsoluteSize.Y / 1080 * 1.075
game.ReplicatedStorage:FindFirstChild("Remotes").AlertClient.OnClientEvent:Connect(function(Info)
	Alerts.Alert(Info)
end)

Remotes.ChangeFireColor.OnClientEvent:Connect(function(Player, Color, Fire)
	if Color == "Dark" then
		Fire.ParticleEmitter.Brightness = 0.2
	elseif Color == "Bright" then
		Fire.ParticleEmitter.Brightness = 1
	end
end)

game.ReplicatedStorage.Remotes.GetBeePassVisual.OnClientEvent:Connect(function()
	PlayerGui.UI.Enabled = false
	game.Lighting.Blur.Enabled = true
	PlayerGui.BeePassVisual.Enabled = true
	PlayerGui.BeePassVisual.ImageLabel.Size = UDim2.new(0,0,0,0)
	PlayerGui.BeePassVisual.ImageLabel.Rotation = -90
	PlayerGui.BeePassVisual.ImageLabel:TweenSize(UDim2.new(0.3,0,0.5,0),"Out","Elastic",2)
	TS:Create(workspace.CurrentCamera, TweenInfo.new(2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {FieldOfView = 30}):Play()
	TS:Create(PlayerGui.BeePassVisual.ImageLabel, TweenInfo.new(2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Rotation = 0}):Play()
	wait(2.1)
	PlayerGui.BeePassVisual.ImageLabel:TweenSize(UDim2.new(0,0,0,0),"Out","Back",0.3)
	TS:Create(PlayerGui.BeePassVisual.ImageLabel, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Rotation = 45}):Play()
	TS:Create(workspace.CurrentCamera, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {FieldOfView = 70}):Play()
	wait(0.3)
	PlayerGui.BeePassVisual.ImageLabel.Visible = false
	PlayerGui.BeePassVisual.Enabled = false
	PlayerGui.UI.Enabled = true
	game.Lighting.Blur.Enabled = false
end)

local function GetAmuletsText(Old, Mob, Table)
	local HoverText
	if Old then
		local Text = ""
		for i,v in pairs(_G.PData.OldAmulets[Mob]) do
			if i ~= "Type" then
				if v[2] == "%" then
					Text = Text.."+"..v[1].."% "..i..'\n'
				elseif v[2] == "*" then
					Text = Text.."x"..v[1].." "..i..'\n'
				elseif v[2] == "+" then
					Text = Text.."+"..v[1].." "..i..'\n'
				end
			end
		end
		HoverText = "\n ["..tostring(_G.PData.OldAmulets[Mob].Type).." "..Mob.."] \n".."\n"..Text
	else
		local Text = ""
		for i,v in pairs(Table) do
			if i ~= "Type" then
				if v[2] == "%" then
					Text = Text.."+"..v[1].."% "..i..'\n'
				elseif v[2] == "*" then
					Text = Text.."x"..v[1].." "..i..'\n'
				elseif v[2] == "+" then
					Text = Text.."+"..v[1].." "..i..'\n'
				end
			end
		end
		HoverText = "\n ["..Table.Type.." "..Mob.."] \n".."\n"..Text
	end
	return HoverText
end

local function ButtonAnim(Button, Table)
	local Text = ""

	for i,v in pairs(Table) do
		if v.T == "%" then
			Text = Text.."+"..v.Amount.."% "..i..'\n'
		elseif v.T == "*" then
			Text = Text.."x"..v.Amount.." "..i..'\n'
		end
	end

	local HoverText = "\n"..Text

	Button.MouseEnter:Connect(function()
		HoverInfo:UpdateText(HoverText)
		HoverInfo:Move(UDim2.new(0, UserInputService:GetMouseLocation().X / Scale, 0, UserInputService:GetMouseLocation().Y / (Scale * 1.1), 0), Scale, Vector2.new(0,0.5))
	end)
	Button.MouseLeave:Connect(function()
		HoverInfo:Remove()
	end)
	Button.MouseMoved:Connect(function()
		Scale = UI.AbsoluteSize.Y / 1080 * 1.075
		HoverInfo:Move(UDim2.new(0, UserInputService:GetMouseLocation().X / Scale, 0, UserInputService:GetMouseLocation().Y / (Scale * 1.1), 0), Scale, Vector2.new(0,0.5))
	end)
end

Remotes.AmuletChoose.OnClientEvent:Connect(function(Old, Table, OldTable, NewImage, OldImage)
	local AmuletsGui = PlayerGui.UI.Amulets
	AmuletsGui.Visible = true

	if Old then
		AmuletsGui.Old.Visible = true
		ButtonAnim(AmuletsGui.Old, OldTable)
		AmuletsGui.Old.Image = OldImage
	else
		AmuletsGui.Old.Visible = false
	end

	AmuletsGui.New.Image = NewImage
	AmuletsGui.Old.Button.MouseButton1Click:Connect(function()
		Remotes.ServerAmulet:FireServer("Old")
		AmuletsGui.Visible = false
	end)
	AmuletsGui.New.Button.MouseButton1Click:Connect(function()
		Remotes.ServerAmulet:FireServer("New")
		AmuletsGui.Visible = false
	end)

	ButtonAnim(AmuletsGui.New, Table)
end)

game.ReplicatedStorage.Remotes.DarkAmbience.OnClientEvent:Connect(function(O)
	local Blidness = game.Players.LocalPlayer.PlayerGui.UI.Blindness
	if O == true then
		Blidness.Visible = true
		TS:Create(Blidness, TweenInfo.new(2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
		wait(2.3)
		game.Lighting.Bloom.Enabled = true
		game.Lighting.FogColor = Color3.fromRGB(0,0,0)
		game.Lighting.FogEnd = 400
		game.Lighting.FogStart = 150
		game.Lighting.Brightness = 0
		game.Lighting.EnvironmentDiffuseScale = 0
		TS:Create(Blidness, TweenInfo.new(2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
		wait(2)
		Blidness.Visible = false
	else
		Blidness.Visible = true
		TS:Create(Blidness, TweenInfo.new(2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
		wait(2.3)
		game.Lighting.Bloom.Enabled = false
		game.Lighting.FogColor = Color3.fromRGB(0,0,0)
		game.Lighting.FogEnd = 600
		game.Lighting.FogStart = 250
		game.Lighting.Brightness = 2
		game.Lighting.EnvironmentDiffuseScale = 1
		TS:Create(Blidness, TweenInfo.new(2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play()
		wait(2)
		Blidness.Visible = false
	end
end)

game.ReplicatedStorage:FindFirstChild("Remotes").FieldBoostVisual.OnClientEvent:Connect(function(Field)
	local FirstWord = Field:split(' ')
	if game.Workspace.FieldZones:FindFirstChild(FirstWord[1]) then
		local WField = game.Workspace.FieldZones:FindFirstChild(FirstWord[1])
		if not WField:FindFirstChild("FieldBoost") then
			spawn(function()
				local P1 = game.ReplicatedStorage.Effect.FieldBoost:Clone()
				P1.Parent = WField
				local P2 = game.ReplicatedStorage.Effect.FieldBoost:Clone()
				P2.Parent = WField
				P2.Color = ColorSequence.new{
					ColorSequenceKeypoint.new(0, Color3.new(1, 0.913725, 0.243137)),
					ColorSequenceKeypoint.new(1, Color3.new(1, 0.913725, 0.243137)),
				}
				spawn(function()
					repeat wait(5)
						if not _G.PData.Boosts[Field] then
							P1:Destroy()
							P2:Destroy()
							break
						end
					until
					not _G.PData.Boosts[Field]
				end)
			end)
		end
	end
end)

game.ReplicatedStorage:FindFirstChild("Remotes").GetItemsFromQuest.OnClientEvent:Connect(function(Item, Amount)
	local Part = script.ItemsFromQuests:Clone()
	Part.Parent = game.Workspace
	Part.Position = game.Workspace:FindFirstChild(Player.Name).PrimaryPart.Position
	Part.BillboardGui.Image.Rotation = math.random(-15,15)
	spawn(function()
		Part.BillboardGui.Image:TweenSize(UDim2.new(1,0,1,0),"Out", "Elastic", 2)
	end)
	if Item ~= "Honey" and Item ~= "Xp" then
		Part.BillboardGui.Image.Image = Items.Eggs[Item].Image
	else
		Part.BillboardGui.Image.Image = "rbxassetid://8639001842"
	end
	Part.BillboardGui.Image.TextLabel.Text = "x"..Amount
	Part.Velocity = Vector3.new(math.random(-25,25),50,math.random(-25,25))
	wait(0.5)
	Part.CanCollide = true
	wait(math.random(3,4))
	Part:Destroy()
end)


--game.ReplicatedStorage:FindFirstChild("Remotes").AmuletC.OnClientEvent:Connect(function(Info)
--	print(Info)
--end)

game.ReplicatedStorage:FindFirstChild("Remotes").CameraShake.OnClientEvent:Connect(function()
	local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
		Camera.CFrame = Camera.CFrame * shakeCf
	end)
	camShake:Start()
	camShake:Shake(CameraShaker.Presets.Explosion)
end)


game.ReplicatedStorage:FindFirstChild("Remotes").FoodBee.OnClientEvent:Connect(function(Level, BeeName, PollenX, Attack, MoveX)
	spawn(function()
		local BeeLevelUpFrame = PlayerGui.UI.BeeLevelUpFrame:Clone()
		local BeeData = require(game.ReplicatedStorage.Bees[BeeName])
		BeeLevelUpFrame.Parent = PlayerGui.UI
		BeeLevelUpFrame.Position = UDim2.new(2,0,0.5,0)
		BeeLevelUpFrame.Thumb.Image = BeeData.Thumb
		BeeLevelUpFrame.NameAndLevel.TextLabel.Text = BeeName.." - Level "..Level
		BeeLevelUpFrame.Honey.TextLabel.Text = BeeData.Converts
		BeeLevelUpFrame.Energy.TextLabel.Text = BeeData.Energy
		BeeLevelUpFrame.Speed.TextLabel.Text = BeeData.Speed.." (+"..MoveX..")"
		BeeLevelUpFrame.Pollen.TextLabel.Text = BeeData.Pollen + PollenX.." (+"..PollenX / Level..")"

		BeeLevelUpFrame.Name = "UPBEE"
		BeeLevelUpFrame.Visible = true
		BeeLevelUpFrame.Sound:Play()
		BeeLevelUpFrame:TweenPosition(UDim2.new(1.01,0,0.5,0),"Out", "Quart", 0.25)

		wait(1.25)

		BeeLevelUpFrame.Speed.TextLabel.Text = (BeeData.Speed + (Level / 5))
		BeeLevelUpFrame.Pollen.TextLabel.Text = BeeData.Pollen + PollenX

		wait(2.5)
		if BeeLevelUpFrame then
			BeeLevelUpFrame:TweenPosition(UDim2.new(2,0,0.5,0),"In", "Quart", 0.25)
			wait(0.25)
			BeeLevelUpFrame.Visible = false
			BeeLevelUpFrame:Destroy()
		end
	end)
end)