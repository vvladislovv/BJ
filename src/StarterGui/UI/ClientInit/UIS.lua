local QuestsFolder = require(game.ReplicatedStorage.Modules.Quests)
local Remotes = game.ReplicatedStorage:WaitForChild("Remotes")
--local PData
local Camera = workspace.Camera
local Utils = require(game.ReplicatedStorage.Modules.Utils)
local Player = game.Players.LocalPlayer
local UI = Player.PlayerGui:WaitForChild("UI")
local Controls = require(script.Parent:WaitForChild("Controls"))
local ClientUtilities = require(game.ReplicatedStorage.ClientUtilities)
local UserInputService = game:GetService("UserInputService")
local Utilities = require(game.ReplicatedStorage.Utilities)
local Items = require(game.ReplicatedStorage.Modules.Items)
local PlayerGui = game.Players.LocalPlayer.PlayerGui.UI
local RewardsModule = require(game.ReplicatedStorage.Modules.Beespass)
local HoverInfo = require(game.ReplicatedStorage.Modules.InfoHover)
local TS = game:GetService("TweenService")
_G.OpenedPass = false
local PassDeb = false
local Scale = UI.AbsoluteSize.Y / 1080 * 1.1

local Tween = game:GetService("TweenService")

local function ButtonAnim(Button, Type)
	local CanUpdate = false
	Button.MouseButton1Down:Connect(function()
		if not table.find(_G.PData.BeespassRewards[Type], tonumber(Button.Name)) then
			TS:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0,275,0,275)}):Play()
		end
	end)
	Button.MouseButton1Up:Connect(function()
		if not table.find(_G.PData.BeespassRewards[Type], tonumber(Button.Name)) then
			TS:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0,315,0,315)}):Play()
		end
	end)
	Button.MouseEnter:Connect(function()
		if not table.find(_G.PData.BeespassRewards[Type], tonumber(Button.Name)) then
			local Text = ""
			for i,v in pairs(RewardsModule[Type][tonumber(Button.Name)].Rewards) do
				if not v.P then
					if v.Amount > 1 and i ~= "Honey" then
						Text = Text.."+"..Utils:CommaNumber(v.Amount).." "..i.."s"..'\n'
					else
						Text = Text.."+"..Utils:CommaNumber(v.Amount).." "..i..'\n'
					end
				else
					if v.P == "Percent" then
						Text = Text.."+"..v.Amount.."% "..i..'\n'
					elseif v.P == "Mult" then
						Text = Text.."x"..v.Amount.." "..i..'\n'
					end
				end
			end
			local HoverText = "\n"..Text
			HoverInfo:UpdateText(HoverText)
			HoverInfo:Move(UDim2.new(0, UserInputService:GetMouseLocation().X / Scale, 0, UserInputService:GetMouseLocation().Y / (Scale * 1.1), 0), Scale, Vector2.new(0,0.5))
			TS:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0,315,0,315)}):Play()
		end
	end)
	Button.MouseLeave:Connect(function()
		HoverInfo:Remove()
		if not table.find(_G.PData.BeespassRewards[Type], tonumber(Button.Name)) then
			TS:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0,300,0,300)}):Play()
		end
	end)
	Button.MouseMoved:Connect(function()
		Scale = UI.AbsoluteSize.Y / 1080 * 1.075
		HoverInfo:Move(UDim2.new(0, UserInputService:GetMouseLocation().X / Scale, 0, UserInputService:GetMouseLocation().Y / (Scale * 1.1), 0), Scale, Vector2.new(0,0.5))
	end)
end

local UIS = {} do
	
	spawn(function()
	for count = 1,49 do
		local Temp = PlayerGui.Pass.ScrollingFrame.Numbers.First:Clone()
		Temp.Name = count + 1
		Temp.Text = Temp.Name
		Temp.Parent = PlayerGui.Pass.ScrollingFrame.Numbers
	end
		PlayerGui.Pass.ScrollingFrame.Numbers.First.Name = "1"
		PlayerGui.Pass.ScrollingFrame.Bar.TwoBar.SkipButton.MouseButton1Click:Connect(function()
			if _G.PData.Beespass.TotalLevels < 50 then
				game.ReplicatedStorage.Remotes.SkipPassLevel:FireServer()
			end
		end)
		for i, Button in pairs(PlayerGui.Pass.ScrollingFrame.Free:GetChildren()) do
			if Button:IsA("ImageButton") then
				spawn(function()
					Button.Dec.Image = RewardsModule.Free[tonumber(Button.Name)].Image
					Button.BackDec.Image = RewardsModule.Free[tonumber(Button.Name)].Image
					Button.Image = RewardsModule.Images[RewardsModule.Free[tonumber(Button.Name)].Rarity].Image
					Button.HoverImage = RewardsModule.Images[RewardsModule.Free[tonumber(Button.Name)].Rarity].Hover
				end)
			ButtonAnim(Button, "Free")
			Button.MouseButton1Click:Connect(function()
				if _G.PData then
					if _G.PData.Beespass.TotalLevels >= tonumber(Button.Name) and not table.find(_G.PData.BeespassRewards["Free"], tonumber(Button.Name)) then
						Remotes.GetBeespassReward:FireServer(tonumber(Button.Name), "Free")
					end
				else
					warn("Havent Data!!! - BeesPass")
				end
				end)
			end
		end
		for i, Button in pairs(PlayerGui.Pass.ScrollingFrame.Purhcase:GetChildren()) do
			if Button:IsA("ImageButton") then
				spawn(function()
					Button.Dec.Image = RewardsModule.Paid[tonumber(Button.Name)].Image
					Button.BackDec.Image = RewardsModule.Paid[tonumber(Button.Name)].Image
					Button.Image = RewardsModule.Images[RewardsModule.Paid[tonumber(Button.Name)].Rarity].Image
					Button.HoverImage = RewardsModule.Images[RewardsModule.Paid[tonumber(Button.Name)].Rarity].Hover
				end)
				ButtonAnim(Button, "Paid")
				Button.MouseButton1Click:Connect(function()
					if _G.PData then
						if _G.PData.Beespass.TotalLevels >= tonumber(Button.Name) and not table.find(_G.PData.BeespassRewards["Paid"], tonumber(Button.Name)) then
							Remotes.GetBeespassReward:FireServer(tonumber(Button.Name), "Paid")
						end
					else
						warn("Havent Data!!! - BeesPass")
					end
				end)
			end
		end
	end)
	
	function CheckBeePass()
		if _G.PData then
		PlayerGui.Pass.XPBar.Bar.TBar.Size = UDim2.new(0,0,1,0)
		spawn(function()
			for i,Button in pairs(PlayerGui.Pass.ScrollingFrame.Free:GetChildren()) do
				if Button:IsA("ImageButton") then
					Button.Lock.Visible = false
						if _G.PData.Beespass.TotalLevels >= tonumber(Button.Name) then
							if table.find(_G.PData.BeespassRewards["Free"], tonumber(Button.Name)) then
								Button.Ready.Visible = true
								Button.Image = RewardsModule.Images[RewardsModule.Free[tonumber(Button.Name)].Rarity].Image
								Button.HoverImage = RewardsModule.Images[RewardsModule.Free[tonumber(Button.Name)].Rarity].Hover
								if Button.Size ~= UDim2.new(0,300,0,300) then
									TS:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0,300,0,300)}):Play()
								end
							else
								Button.Image = RewardsModule.Images.Ready.Image
								Button.HoverImage = RewardsModule.Images.Ready.Hover
							end
						else
							Button.Ready.Visible = false
						end
				end
			end
			for i,Button in pairs(PlayerGui.Pass.ScrollingFrame.Purhcase:GetChildren()) do
				if Button:IsA("ImageButton") then
						if _G.PData.Beespass.Paid == true then
							Button.Lock.Visible = false
							if _G.PData.Beespass.TotalLevels >= tonumber(Button.Name) then
								if table.find(_G.PData.BeespassRewards["Paid"], tonumber(Button.Name)) then
									Button.Ready.Visible = true
									Button.Image = RewardsModule.Images[RewardsModule.Paid[tonumber(Button.Name)].Rarity].Image
									Button.HoverImage = RewardsModule.Images[RewardsModule.Paid[tonumber(Button.Name)].Rarity].Hover
									if Button.Size ~= UDim2.new(0,300,0,300) then
										TS:Create(Button, TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0,300,0,300)}):Play()
									end
								else
									Button.Image = RewardsModule.Images.Ready.Image
									Button.HoverImage = RewardsModule.Images.Ready.Hover
								end
							else
								Button.Ready.Visible = false
							end
						else
							Button.Lock.Visible = true
						end
					end
				end
			end)
		end
	end
	CheckBeePass()
	Remotes.GetBeespassReward.OnClientEvent:Connect(function()
		CheckBeePass()
	end)
	
	--Boosts
	for _,v in pairs(game.ReplicatedStorage.Boosts:GetChildren()) do
		local Mod = require(v)
		local BoostTemp = script.BoostTemplate:Clone()
		BoostTemp.Visible = false
		BoostTemp.LayoutOrder = Mod.Layout
		BoostTemp.ImageD.Image = Mod.BoostImage
		BoostTemp.Bar.BackgroundColor3 = Mod.Color
		BoostTemp.Name = Mod.Name
		BoostTemp.Type.Value = "Boost"
		if Mod.Passive then
			BoostTemp.Type.Value = "Passive"
		end
		BoostTemp.Parent = UI.Boosts
	end
	--Inventory
	for ID, Item in pairs(Items.Eggs) do
		if not Item.Removed then
			local NewItem = script.ItemTemplate:Clone()
			NewItem.Parent = UI.Tabs.Inventory.List
			NewItem.LayoutOrder = Item.Layout * 100
			if Item.Settings then
				NewItem.Settings.Visible = true
			end
			NewItem.Icon.Image = Item.Image
			NewItem.Icon.Amount.Text = "x1"
			if Item.Capacity then
				local n = Instance.new("IntValue", NewItem)
				n.Name = "Capacity"
				n.Value = Item.Capacity
			end
			NewItem.Info.Item.Text = Item.Name
			NewItem.Info.Description.Text = Item.Description
			NewItem.Name = tostring(ID)
			NewItem.Visible = false
			NewItem.LocalScript.Disabled = false
		end
	end
	
	function UpdateInventory()
		for Item, Amount in pairs(_G.PData.Inventory) do
			local ItemObject = UI.Tabs.Inventory.List:FindFirstChild(Item)
			if ItemObject then
				if Amount ~= 0 then
					ItemObject.Visible = true
					if not ItemObject:FindFirstChild("Capacity") then
						if not Items.Eggs[Item].Limit then
							ItemObject.Icon.Amount.Text = "x"..Amount
						else
							ItemObject.Icon.Amount.Text = Amount.."/"..Items.Eggs[Item].Limit
						end
					else
						ItemObject.Icon.Amount.Text = Amount.."/"..ItemObject:FindFirstChild("Capacity").Value
					end
					ItemObject.Size = UDim2.new(0, 408,0, 101)
				else
					ItemObject.Size = UDim2.new(0, 408,0, 0)
					ItemObject.Visible = false
				end
			end
		end
	end
	UpdateInventory()
	
	PlayerGui.Beespass.MouseButton1Click:Connect(function()
	if PassDeb == false then
		PassDeb = true
		spawn(function()
		PlayerGui.Beespass:TweenSize(UDim2.new(0,132,0,132), "Out", "Back", 0.1)
		wait(0.1)
		PlayerGui.Beespass:TweenSize(UDim2.new(0,112,0,112), "Out", "Back", 0.1)
		end)
			if not _G.OpenedPass then
			PlayerGui.Pass.Close.MouseButton1Click:Connect(function()
				PassDeb = false
				_G.OpenedPass = false
				game.Lighting.Blur.Enabled = false
				TS:Create(PlayerGui.BlurEffect, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
				Tween:Create(workspace.CurrentCamera, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {FieldOfView = 70}):Play()
				TS:Create(PlayerGui.Pass, TweenInfo.new(1.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Position = UDim2.new(0.5,0,2,0)}):Play()
				spawn(function()
					wait(1.55)
					if PlayerGui.Pass.Position == UDim2.new(0.5,0,2,0) then
						PlayerGui.Pass.Visible = false
					end
				end)
				PlayerGui.BlurEffect.Visible = false
			end)
			CheckBeePass()
			PlayerGui.Pass.Visible = true
			TS:Create(PlayerGui.Pass, TweenInfo.new(1.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Position = UDim2.new(0.5,0,0.5,0)}):Play()
			PlayerGui.BlurEffect.Visible = true
			TS:Create(PlayerGui.BlurEffect, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play()
			TS:Create(workspace.CurrentCamera, TweenInfo.new(1.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {FieldOfView = 110}):Play()
			PlayerGui.Pass.ScrollingFrame.CanvasPosition = Vector2.new(0,0)
			local Amount = (_G.PData.Beespass.TotalLevels - 1) * 237.6
			if Amount < 0 then
				Amount = 0
			end
			TS:Create(PlayerGui.Pass.ScrollingFrame, TweenInfo.new(0.25, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {CanvasPosition = Vector2.new(Amount,0)}):Play()
			game.Lighting.Blur.Enabled = true
			_G.OpenedPass = true
			PassDeb = false
		else
			PassDeb = false
			_G.OpenedPass = false
			game.Lighting.Blur.Enabled = false
			TS:Create(PlayerGui.BlurEffect, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play()
			Tween:Create(workspace.CurrentCamera, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {FieldOfView = 70}):Play()
			TS:Create(PlayerGui.Pass, TweenInfo.new(1.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Position = UDim2.new(0.5,0,2,0)}):Play()
			spawn(function()
				wait(1.55)
				if PlayerGui.Pass.Position == UDim2.new(0.5,0,2,0) then
					PlayerGui.Pass.Visible = false
				end
			end)
			PlayerGui.BlurEffect.Visible = false
			end
		end
	end)
	
	local list = PlayerGui.Tabs.Inventory.List
	--PlayerGui.Tabs.Inventory.Search:GetPropertyChangedSignal("Text"):Connect(function()
	--	for _, v in pairs(list:GetChildren()) do
	--		if v:IsA("Frame") then
	--			if PlayerGui.Tabs.Inventory.Search.Text ~= "" then
	--				if not string.find(string.lower(v.Name), string.lower(PlayerGui.Tabs.Inventory.Search.Text)) then
	--					v.Visible = false
	--				else
	--					v.Visible = true
	--				end
	--			else
	--				v.Visible = true
	--			end
	--		end
	--	end
	--end)
	
	function QuestUpdate(Gui, Info, State)
		if Gui then
			if Gui:FindFirstChild("TextLabel") then
				local Label = Gui:FindFirstChild("TextLabel")
				local NdAm
				local StAm
				if Info.NeedAmount >= 100000000000000 then
					NdAm = Utils:AbNumber(Info.NeedAmount)
				else
					NdAm = Utils:CommaNumber(Info.NeedAmount)
				end
				if Info.StartAmount >= 100000000000000 then
					StAm = Utils:AbNumber(Info.StartAmount)
				else
					StAm = Utils:CommaNumber(Info.StartAmount)
				end
				if State == "FieldPollen" then
					if Info.Color then
						Label.Text = "Collect "..StAm.."/"..NdAm.." "..Info.Color.." Pollen from "..Info.Field.." Field."--.."("..((StAm/NdAm)*100).."%)"
					else
						Label.Text = "Collect "..StAm.."/"..NdAm.." Pollen from "..Info.Field.." Field."
					end
				elseif State == "AnyPollen" then
					Label.Text = "Collect "..StAm.."/"..NdAm.." Pollen."--.." ("..((StAm/NdAm)*100).."%)"
				elseif State == "PollenColor" then
						Label.Text = "Collect "..StAm.."/"..NdAm.." "..Info.NColor.." Pollen."--.." ("..((StAm/NdAm)*100).."%)"
				elseif State == "AnyTokens" then
						Label.Text = "Collect "..StAm.."/"..NdAm.." Tokens."--.." ("..((StAm/NdAm)*100).."%)"
				elseif State == "FromTokens" then
						Label.Text = "Collect "..StAm.."/"..NdAm.." Tokens from "..Info.Res.."."--.." ("..((StAm/NdAm)*100).."%)"
				elseif State == "TypeTokens" then
						Label.Text = "Collect "..Info.Token.." Tokens "..StAm.."/"..NdAm.."."--.." ("..((StAm/NdAm)*100).."%)"
				elseif State == "BeesTokens" then
					if Info.TokenType then
						Label.Text = "Collect "..Info.TokenType.." Tokens "..StAm.."/"..NdAm.."."--.."("..((StAm/NdAm)*100).."%)"
					end
					if Info.TokenColor then
						Label.Text = "Collect "..Info.TokenColor.." Ability Tokens "..StAm.."/"..NdAm.."."--.."("..((StAm/NdAm)*100).."%)"
					end
				elseif State == "UseItem" then
						Label.Text = "Use "..StAm.."/"..NdAm.." "..Info.Item.."."--.." ("..((StAm/NdAm)*100).."%)"
				elseif State == "UseDispenser" then
						Label.Text = "Use "..StAm.."/"..NdAm.." "..Info.Dispenser.."."--.." ("..((StAm/NdAm)*100).."%)"
				elseif State == "CraftAnyItems" then
						Label.Text = "Craft "..StAm.."/"..NdAm.." Ingredients."--.." ("..((StAm/NdAm)*100).."%)"
				elseif State == "OpenCase" then
						Label.Text = "Open "..StAm.."/"..NdAm.." "..Info.Case.." Case."--.." ("..((StAm/NdAm)*100).."%)"
				elseif State == "AnyCaramel" then
						Label.Text = "Collect "..StAm.."/"..NdAm.." Caramel from Flowers."
				elseif State == "CaramelField" then
						Label.Text = "Collect "..StAm.."/"..NdAm.." Caramel from "..Info.Field.." Field."
				elseif State == "CaramelColor" then
						Label.Text = "Collect "..StAm.."/"..NdAm.." Caramel from " ..Info.NColor.." Flowers."
				end
			end
		end
	end
	
	local List = UI.Boosts
	function UpdateBoosts()
		for i,v in pairs(List:GetChildren()) do
			if v:IsA("ImageLabel") then
				if not _G.PData.Boosts[v.Name] then
					if v.Visible then
						v.Visible = false
					end
				end
			end
		end
	end
	Remotes.UpdateClientBoost.OnClientEvent:Connect(function(BoostType, BoostAmount, BoostTime)
		local v = UI.Boosts:FindFirstChild(BoostType)
		if v and BoostAmount > 0 then
			spawn(function()
				v.Visible = true
				v.Size = UDim2.new(0.07,0,0.5,0)
				v.Hover.Disabled = false
				TS:Create(v, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = UDim2.new(0.14,0,1,0)}):Play()
				v.Bar.Size = UDim2.new(1,0,1,0)
				if _G.PData.Boosts[v.Name] then
					v.Count.Text = "x".._G.PData.Boosts[v.Name].Amount
				else
					v.Visible = false
				end
				TS:Create(v.Bar, TweenInfo.new(BoostTime, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Size = UDim2.new(1,0,0,0)}):Play()
				spawn(function()
					wait(BoostTime + 0.2)
					UpdateBoosts()
				end)
			end)
		end
	end)
	
	
	function CheckBGate()
		if _G.PData.IStats.TotalBadges >= 8 then
			workspace.BadgeRoom.Door.CanCollide = false
			workspace.BadgeRoom.Door.Color = Color3.fromRGB(91, 154, 76)
		end
	end
	
	local HUD = UI.Metters
	local HM = HUD.HoneyMeter
	local PM = HUD.PollenMeter
	local u4 = Color3.fromRGB(247, 60, 60)
	local u5 = Color3.fromRGB(65, 255, 134)
	
	function AlwaysBeePass()
		if PlayerGui.Pass.Visible == true then
			if _G.PData.Beespass.TotalLevels >= 50 then
				PlayerGui.Pass.XPBar.Visible = false
			end
		if _G.PData.Beespass.Paid == true then
			PlayerGui.Pass.LockedPaid.Visible = false
		else
			PlayerGui.Pass.LockedPaid.Visible = true
		end
		if _G.PData.Beespass.TotalLevels < 50 then
			PlayerGui.Pass.ScrollingFrame.Bar.TwoBar:TweenSize(UDim2.new(0.0199 * _G.PData.Beespass.TotalLevels,0,1,0),"Out", "Elastic", 0.25)
		else
				PlayerGui.Pass.ScrollingFrame.Bar.TwoBar:TweenSize(UDim2.new(1,0,1,0),"Out", "Elastic", 0.25)
		end
		if _G.PData.Beespass.Xp >= RewardsModule.Free[_G.PData.Beespass.TotalLevels].Xp then
			PlayerGui.Pass.XPBar.Bar.TBar:TweenSize(UDim2.new(1,0,1,0),"Out", "Quint", 0.25)
		else
			PlayerGui.Pass.XPBar.Bar.TBar:TweenSize(UDim2.new(_G.PData.Beespass.Xp / RewardsModule.Free[_G.PData.Beespass.TotalLevels].Xp,0,1,0),"Out", "Quint", 0.25)
		end
		if _G.PData.Beespass.Xp > RewardsModule.Free[_G.PData.Beespass.TotalLevels].Xp then
			PlayerGui.Pass.XPBar.Bar.Total.Text = RewardsModule.Free[_G.PData.Beespass.TotalLevels].Xp.."/"..RewardsModule.Free[_G.PData.Beespass.TotalLevels].Xp
		else
			PlayerGui.Pass.XPBar.Bar.Total.Text = _G.PData.Beespass.Xp.."/"..RewardsModule.Free[_G.PData.Beespass.TotalLevels].Xp
		end
		PlayerGui.Pass.XPBar.Bar.Old.Text = _G.PData.Beespass.TotalLevels
		PlayerGui.Pass.XPBar.Bar.New.Text = _G.PData.Beespass.TotalLevels + 1
		end
	end
	
	game:GetService("RunService").RenderStepped:Connect(function()
		if Player then
		
		CheckBGate()
			AlwaysBeePass()
			UpdateBoosts()
			UpdateInventory()
		local u4 = Color3.fromRGB(247, 59, 59)
		local u5 = Color3.fromRGB(98, 222, 96)
		local v19 = math.clamp(_G.PData.IStats.Pollen / _G.PData.IStats.Capacity, 0, 1)
		if v19 >= 1 then
			PM.Bar.BackgroundColor3 = u4
		else
			PM.Bar.BackgroundColor3 = u5:Lerp(u4, v19 * v19 * 0.9)
		end
		PM.Label.Text = Utils:CommaNumber(math.round(_G.PData.IStats.Pollen)).."/"..Utils:CommaNumber(math.round(_G.PData.IStats.Capacity))
		PM.Bar.Size = UDim2.new(math.clamp(_G.PData.IStats.Pollen / _G.PData.IStats.Capacity, 0, 1), 0, 1, 0)
		HM.Label.Text = Utils:CommaNumber(math.round(_G.PData.IStats.Honey))
		
		--spawn(function()
		for NPCName, In in pairs(_G.PData.QuestsGivers) do
			if game.Workspace.NPCs:FindFirstChild(NPCName) then
			if In.Claimed2 == true and In.CompletedNow == false then
					if Player.PlayerGui:FindFirstChild("UI") then
					
					if game.Workspace.NPCs[NPCName].Circle.PointAt.BillboardGui.Enabled == true then
						game.Workspace.NPCs[NPCName].Circle.PointAt.BillboardGui.Enabled = false
						end
					end
					
				local QuestsFrame = Player.PlayerGui:FindFirstChild("UI").Tabs.Quests.List
				for i,v in pairs(QuestsFrame:GetChildren()) do
					if v and v:IsA("Frame") then
						if v:FindFirstChild("Tasks") then
							for k,TaskFrame in pairs(v:FindFirstChild("Tasks"):GetChildren()) do
								if TaskFrame and TaskFrame:IsA("Frame") then
									local Bar = TaskFrame:FindFirstChild("FillBar")
									if _G.PData.Quests2 ~= nil and _G.PData.Quests2[TaskFrame.Name] ~= nil and _G.PData.Quests2[TaskFrame.Name][k - 3] ~= nil and _G.PData.Quests2[TaskFrame.Name][k - 3].Type ~= nil then
										local v19 = math.clamp(_G.PData.Quests2[TaskFrame.Name][k - 3].StartAmount / _G.PData.Quests2[TaskFrame.Name][k - 3].NeedAmount, 0, 1)
											QuestUpdate(TaskFrame, _G.PData.Quests2[TaskFrame.Name][k - 3], _G.PData.Quests2[TaskFrame.Name][k - 3].Type)
											if TaskFrame:FindFirstChild("FillBar") then
											TaskFrame.FillBar.Size = UDim2.new(v19,0,1,0)
											end
										end
									end
								end
							end
						end
					end
			else
				if game.Workspace.NPCs:FindFirstChild(NPCName) then
					local Quests = 0
						for i,v in pairs(QuestsFolder.Quests[NPCName].Quests) do
							Quests += 1
						end
					if _G.PData.QuestsGivers[NPCName].CompletedQuests <= Quests then
						if game.Workspace.NPCs[NPCName].Circle.PointAt.BillboardGui.Enabled == false then
							game.Workspace.NPCs[NPCName].Circle.PointAt.BillboardGui.Enabled = true
						end
					elseif _G.PData.QuestsGivers[NPCName].CompletedQuests > Quests then
						if game.Workspace.NPCs[NPCName].Circle.PointAt.BillboardGui.Enabled == true then
							game.Workspace.NPCs[NPCName].Circle.PointAt.BillboardGui.Enabled = false
						end
					end
				end
			end
			end
			end
			end
		end)
	--end)
end

return UIS
