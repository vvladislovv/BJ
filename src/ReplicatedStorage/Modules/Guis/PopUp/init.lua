local PopUp = script.BeePopUp
local Players = game:GetService("Players")
local Remotes = game:GetService("ReplicatedStorage").Remotes
local Items = require(game.ReplicatedStorage.Modules.Items)
local Data = require(game.ServerScriptService.Server.Data)
local GetRealStats = require(game.ServerScriptService.Functions.GetRealStats)
local TweenService = game:GetService("TweenService")

local deb = false

local module = {}

function module.PopUp(Player, Bee, Item, Gifted, Slot, New, PData)
	local PlayerGui = Players:FindFirstChild(Player.Name):FindFirstChild("PlayerGui")
	local OldBee = Slot.BeeN.Value
	
	if PlayerGui:FindFirstChild("UI"):FindFirstChild("BeePopUp") then
		PlayerGui:FindFirstChild("UI"):FindFirstChild("BeePopUp"):Destroy()
	end
	local PopUpUI =  PopUp:Clone()
	local BeeModule = require(game.ReplicatedStorage.Bees[Bee])
	PopUpUI.Parent = PlayerGui:FindFirstChild("UI")
	
	local Hatched
	Hatched = "You hatched a..."
	
	if Gifted then
		Remotes.AlertClient:FireClient(Player, {
			Color = "Blue",
			Msg = "You Hatched a ⭐️Gifted "..Bee.." Bee!⭐️"
		})
	else
		Remotes.AlertClient:FireClient(Player, {
			Color = "Blue",
			Msg = "You Hatched a "..Bee.." Bee!"
		})
	end
	
	if Items.Eggs[Item].Type == "Jelly" then
		if PData.Inventory["Royal Jelly"] > 0 then
			if not Gifted or not BeeModule.Rarity == "Event" or not BeeModule.Rarity == "Mythic" then
				PopUpUI.JellyReroll.Visible = true
			else
				PopUpUI.JellyReroll.Visible = false
			end
		else
			PopUpUI.JellyReroll.Visible = false
		end
		PopUpUI.JellyReroll.Item.Value = Item
		PopUpUI.JellyReroll.Slot.Value = Slot
		if Gifted then
			Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "Your "..OldBee.." Bee transformed into a ⭐️Gifted "..Bee.." Bee!⭐️"
			})
		else
			Remotes.AlertClient:FireClient(Player, {
				Color = "Blue",
				Msg = "Your "..OldBee.." Bee transformed into a "..Bee.." Bee!"
			})
		end
	end
	
	local CAR
	if BeeModule.Color ~= "Colorless" then
		CAR = BeeModule.Color.." "..BeeModule.Rarity
	else
		CAR = BeeModule.Rarity
	end
	PopUpUI.ColorAndRarity.TEXT.Text = CAR
	PopUpUI.ColorAndRarity.Text = CAR
	if BeeModule.Rarity == "Classic" then
		PopUpUI.ColorAndRarity.BackgroundColor3 = Color3.fromRGB(108, 88, 75)
		PopUpUI.TypeName.Back.TextColor3 = Color3.fromRGB(185, 144, 108)
		PopUpUI.TypeName.TextColor3 = Color3.fromRGB(115, 89, 67)
	elseif BeeModule.Rarity == "Rare" then
		PopUpUI.ColorAndRarity.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PopUpUI.TypeName.Back.TextColor3 = Color3.fromRGB(255, 255, 255)
		PopUpUI.TypeName.TextColor3 = Color3.fromRGB(131, 131, 131)
	elseif BeeModule.Rarity == "Epic" then
		PopUpUI.ColorAndRarity.BackgroundColor3 = Color3.fromRGB(255, 208, 66)
		PopUpUI.TypeName.Back.TextColor3 = Color3.fromRGB(255, 208, 66)
		PopUpUI.TypeName.TextColor3 = Color3.fromRGB(143, 116, 37)
	elseif BeeModule.Rarity == "Legendary" then
		PopUpUI.ColorAndRarity.BackgroundColor3 = Color3.fromRGB(64, 255, 255)
		PopUpUI.TypeName.Back.TextColor3 = Color3.fromRGB(64, 255, 255)
		PopUpUI.TypeName.TextColor3 = Color3.fromRGB(32, 127, 127)
	elseif BeeModule.Rarity == "Mythic" then
		PopUpUI.ColorAndRarity.BackgroundColor3 = Color3.fromRGB(171, 124, 198)
		PopUpUI.TypeName.Back.TextColor3 = Color3.fromRGB(171, 124, 198)
		PopUpUI.TypeName.TextColor3 = Color3.fromRGB(96, 69, 111)
	elseif BeeModule.Rarity == "Event" then
		PopUpUI.ColorAndRarity.BackgroundColor3 = Color3.fromRGB(132, 221, 109)
		PopUpUI.TypeName.Back.TextColor3 = Color3.fromRGB(132, 221, 109)
		PopUpUI.TypeName.TextColor3 = Color3.fromRGB(84, 139, 68)
	end
	
	if BeeModule.Color == "Colorless" and BeeModule.Rarity == "Classic" then
		PopUpUI.ColorAndRarity.TEXT.TextColor3 = Color3.fromRGB(185, 144, 108)
		PopUpUI.ColorAndRarity.TextColor3 = Color3.fromRGB(115, 89, 67)
		PopUpUI.TypeName.BackgroundColor3 = Color3.fromRGB(255, 228, 92)
	elseif  BeeModule.Rarity ~= "Rare" and BeeModule.Color == "Colorless" then
		PopUpUI.ColorAndRarity.TEXT.TextColor3 = Color3.fromRGB(255, 255, 255)
		PopUpUI.ColorAndRarity.TextColor3 = Color3.fromRGB(131, 131, 131)
		PopUpUI.TypeName.BackgroundColor3 = Color3.fromRGB(255, 228, 92)
	elseif  BeeModule.Rarity == "Rare" and BeeModule.Color == "Colorless" then
		PopUpUI.ColorAndRarity.TEXT.TextColor3 = Color3.fromRGB(198, 198, 198)
		PopUpUI.ColorAndRarity.TextColor3 = Color3.fromRGB(131, 131, 131)
		PopUpUI.TypeName.BackgroundColor3 = Color3.fromRGB(255, 228, 92)
	elseif BeeModule.Color == "Red" then
		PopUpUI.ColorAndRarity.TEXT.TextColor3 = Color3.fromRGB(255, 102, 102)
		PopUpUI.ColorAndRarity.TextColor3 = Color3.fromRGB(131, 52, 52)
		PopUpUI.TypeName.BackgroundColor3 = Color3.fromRGB(255, 102, 102)
	elseif BeeModule.Color == "Blue" then
		PopUpUI.ColorAndRarity.TEXT.TextColor3 = Color3.fromRGB(96, 181, 255)
		PopUpUI.ColorAndRarity.TextColor3 = Color3.fromRGB(50, 96, 134)
		PopUpUI.TypeName.BackgroundColor3 = Color3.fromRGB(96, 181, 255)
	end
	local TXT = Bee.." Bee"
	if Gifted then
		TXT = "⭐️Gifted "..Bee.." Bee!"
	end
	if Gifted then
		PopUpUI.TypeName.Text = TXT..BeeModule.Sim.."⭐️"
		PopUpUI.TypeName.Back.Text = TXT..BeeModule.Sim.."⭐️"
		PopUpUI.Thumbnail.Image = BeeModule.GiftedThumb
		--local Bee = game.ReplicatedStorage.GiftedBees:FindFirstChild(BeeModule.Name):Clone()
		--Bee.Parent = PopUpUI.Thumbnail
	else
		PopUpUI.TypeName.Text = TXT..BeeModule.Sim
		PopUpUI.TypeName.Back.Text = TXT..BeeModule.Sim
		PopUpUI.Thumbnail.Image = BeeModule.Thumb
		--local Bee = game.ReplicatedStorage.Bees:FindFirstChild(BeeModule.Name).Model:Clone()
		--Bee.Parent = PopUpUI.Thumbnail
		--Bee:SetPrimaryPartCFrame(CFrame.new(0,8.1,8) * CFrame.fromOrientation(-15,45,-15))
	end
	if New then
		PopUpUI.Discovered.Visible = true
	else
		PopUpUI.Discovered.Visible = false
	end
	
	PopUpUI.Visible = true
	PopUpUI:TweenSize(UDim2.new(0.299, 0,0.618, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.325, true)
	PopUpUI.Discovered:TweenSize(UDim2.new(1.288, 0,0.182, 0),Enum.EasingDirection.Out, Enum.EasingStyle.Bounce, 0.4, true)
	PopUpUI.Thumbnail:TweenSize(UDim2.new(1.238, 0,0.571, 0),Enum.EasingDirection.Out, Enum.EasingStyle.Elastic, 1, true)
	
	--if Gifted then
	--	GetRealStats.GetRealStats(Player, PData)
	--end
	
	PopUpUI.CloseOverlay.MouseButton1Click:Connect(function()
		PopUpUI:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.In, Enum.EasingStyle.Back, 0.3, true)
		wait(0.27)
		PopUpUI:Destroy()
	end)
	
	--PopUpUI.JellyReroll.MouseButton1Click:Connect(function()
	--	if deb == false then
	--		deb = true
	--		local Item = PopUpUI.JellyReroll.Item
	--		game.ReplicatedStorage.Remotes.CreateBeeSlot:FireServer(Item.Value, PopUpUI.JellyReroll.Slot.Value)
	--		wait(0.3)
	--		deb = false
	--	end
	--end)
	
	local tweenInfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local tween1 = TweenService:Create(PopUpUI.Thumbnail, tweenInfo1, {Rotation=-2})
	local tweenInfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Quart, Enum.EasingDirection.InOut)
	local tween2 = TweenService:Create(PopUpUI.Thumbnail, tweenInfo2, {Rotation=2})
	spawn(function()
	while PopUpUI.Parent do
			tween1:Play()
			wait(0.1)
			tween2:Play()
			wait(0.1)
		end
	end)
	
	if Gifted then
		local deb = 0.5
		spawn(function()
		while PopUpUI.Parent do
			TweenService:Create(PopUpUI.Back, TweenInfo.new(deb, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 166, 166)}):Play()
			TweenService:Create(PopUpUI.Back.UIStroke, TweenInfo.new(deb, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Color = Color3.fromRGB(176, 115, 115)}):Play()
			wait(deb)
			if PopUpUI.Parent then
			TweenService:Create(PopUpUI.Back, TweenInfo.new(deb, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(255, 252, 157)}):Play()
			TweenService:Create(PopUpUI.Back.UIStroke, TweenInfo.new(deb, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Color = Color3.fromRGB(170, 168, 105)}):Play()
			wait(deb)
			if PopUpUI.Parent then
			TweenService:Create(PopUpUI.Back, TweenInfo.new(deb, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(180, 255, 153)}):Play()
			TweenService:Create(PopUpUI.Back.UIStroke, TweenInfo.new(deb, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {Color = Color3.fromRGB(122, 172, 103)}):Play()
			wait(deb)
			else
				break
			end
			else
				break
			end
			end
		end)
	end
end

return module
