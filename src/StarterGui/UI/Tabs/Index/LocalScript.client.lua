wait(2)
local Remotes = game.ReplicatedStorage.Remotes
local Items = require(game.ReplicatedStorage.Modules.Items)

local Bees = game.ReplicatedStorage.Bees

local Modules = game.ReplicatedStorage.Modules
local Items = require(Modules.Items)
local List = script.Parent.List
local TweenService = game:GetService("TweenService")

repeat _G.PData = Remotes.GetPlayerData:InvokeServer() until _G.PData

function GetBeeColor(AllInfo)
	local CL
	if AllInfo.Rarity == "Classic" then
		CL = Color3.fromRGB(108, 88, 75)
	elseif AllInfo.Rarity == "Rare" then
		CL = Color3.fromRGB(211, 211, 211)
	elseif AllInfo.Rarity == "Epic" then
		CL = Color3.fromRGB(255, 224, 66)
	elseif AllInfo.Rarity == "Legendary" then
		CL = Color3.fromRGB(88, 225, 255)
	elseif AllInfo.Rarity == "Mythic" then
		CL = Color3.fromRGB(140, 111, 255)
	elseif AllInfo.Rarity == "Event" then
		CL = Color3.fromRGB(132, 221, 109)
	end
	return CL
end
function GetBeeColor2(AllInfo)
	local DCL
	if AllInfo.Color == "Colorless" and AllInfo.Rarity == "Classic" then
		DCL = Color3.fromRGB(176, 143, 122)
	elseif AllInfo.Color == "Colorless" then
		DCL = Color3.fromRGB(225, 225, 225)
	elseif AllInfo.Color == "Red" then
		DCL = Color3.fromRGB(255, 124, 120)
	elseif AllInfo.Color == "Blue" then
		DCL = Color3.fromRGB(114, 182, 255)
	end
	return DCL
end

function CloseAllTabs()
	for _, Tab in pairs(script.Parent.Parent:GetChildren()) do
		if Tab:IsA("Frame") then
			Tab:TweenPosition(UDim2.new(-1, -115, 0, -76), Enum.EasingDirection.In, Enum.EasingStyle.Quad, 0.2, true)
		end
	end
end

function GetCollectsColor(AllInfo)
	local Collects = AllInfo.Pollen
	local AT
	if Collects <= 5 then
		AT = Color3.fromRGB(199, 169, 98)
	elseif Collects >= 6 and Collects < 10 then
		AT = Color3.fromRGB(177, 199, 97)
	elseif Collects >= 10 and Collects < 15 then
		AT = Color3.fromRGB(135, 218, 109)
	elseif Collects >= 15 then
		AT = Color3.fromRGB(117, 235, 74)
	end
	return AT, Collects
end

function GetConvertsColor(AllInfo)
	local AT
	if AllInfo.Converts <= 50 then
		AT = Color3.fromRGB(199, 169, 98)
	elseif AllInfo.Converts >= 51 and AllInfo.Converts < 150 then
		AT = Color3.fromRGB(177, 199, 97)
	elseif AllInfo.Converts >= 150 and AllInfo.Converts < 300 then
		AT = Color3.fromRGB(135, 218, 109)
	elseif AllInfo.Converts >= 300 then
		AT = Color3.fromRGB(117, 235, 74)
	end
	return AT
end

function GetDamageColor(AllInfo)
	local Collects = AllInfo.Pollen
	local AT
	if AllInfo.Attack == 1 then
		AT = Color3.fromRGB(199, 169, 98)
	elseif AllInfo.Attack >= 2 and AllInfo.Attack < 4 then
		AT = Color3.fromRGB(177, 199, 97)
	elseif AllInfo.Attack >= 4 and AllInfo.Attack < 6 then
		AT = Color3.fromRGB(135, 218, 109)
	elseif AllInfo.Attack >= 6 then
		AT = Color3.fromRGB(117, 235, 74)
	else
		AT = Color3.fromRGB(199, 81, 65)
	end
	return AT, Collects
end

Remotes.CreateBeeSlot.OnClientEvent:Connect(function(PData, DeletedBee)
	
	script.Parent.List:FindFirstChild("BeesNumbers").Text = "You Have "..PData.TotalBees.." Bees"
	
	local PlayerBees = {}

	for i,v in pairs(PData.Bees) do
		if v.BeeName ~= "" then
			if not PlayerBees[v.BeeName] then
				PlayerBees[v.BeeName] = {Amount = 1}
			else
				PlayerBees[v.BeeName].Amount += 1
			end
		end
	end
	
	spawn(function()
	for i,v in pairs(PData.Bees) do
		if v.BeeName ~= "" and v.Gifted == true then
			script.Parent.List:WaitForChild(v.BeeName):FindFirstChild("Gifted").Image = "http://www.roblox.com/asset/?id=9912015257"
		end
		end
	end)
	
	for i,v in pairs(PlayerBees) do
		script.Parent.List:WaitForChild(i):FindFirstChild("Amount").Visible = true
		script.Parent.List:WaitForChild(i):FindFirstChild("Blocked").Visible = false
		script.Parent.List:WaitForChild(i):FindFirstChild("Amount").Text = "x"..v.Amount
	end
	
	spawn(function()
	if DeletedBee ~= nil and DeletedBee ~= "" then
		if typeof(DeletedBee) == "string" then
			if not PlayerBees[DeletedBee] then
				script.Parent.List:FindFirstChild(DeletedBee):FindFirstChild("Gifted").Image = "http://www.roblox.com/asset/?id=9948552632"
				script.Parent.List:FindFirstChild(DeletedBee):FindFirstChild("Amount").Visible = false
				script.Parent.List:FindFirstChild(DeletedBee):FindFirstChild("Blocked").Visible = true
			end
			
			local Gifted
				for i,v in pairs(PData.Bees) do
					if v.BeeName == DeletedBee then
						if v.Gifted == true then
							Gifted = true
							break
						else
							Gifted = false
						end
					else
						Gifted = false
					end
				end
				if Gifted == false then
					script.Parent.List:FindFirstChild(DeletedBee):FindFirstChild("Gifted").Image = "http://www.roblox.com/asset/?id=9948552632"
				end
			end
		end
	end)
end)

for i,v in pairs(Bees:GetChildren()) do
	local AllInfo = require(v)
	local Temp = script.BeeTemp:Clone()
	Temp.Name = AllInfo.Name
	local BeeRarity = GetBeeColor(AllInfo)
	local BeeColor = GetBeeColor2(AllInfo)
	local DamageColor = GetDamageColor(AllInfo)
	local CollectColor = GetCollectsColor(AllInfo)
	local ConvertColor = GetConvertsColor(AllInfo)
	Temp.BeeName.Text = AllInfo.Name.." Bee"
	local white = Color3.fromRGB(255, 255, 255)
	local cs = ColorSequence.new{
		ColorSequenceKeypoint.new(0, BeeColor),
		ColorSequenceKeypoint.new(0.338, BeeColor),
		ColorSequenceKeypoint.new(0.339, BeeRarity),
		ColorSequenceKeypoint.new(1, BeeRarity)
	}
	Temp.Icon.BackgroundColor3 = v.Model.Body.Color
	Temp.BeeName.TextColor3 = BeeColor
	Temp.Icon.Image = v.Model.Face.Decal.Texture
	Temp.BeeLore.Text = AllInfo.Description
	Temp.LayoutOrder = AllInfo.Layout
	Temp.UIGradient.Color = cs
	
	Temp.Parent = List
	
	Temp.MouseEnter:Connect(function()
		Temp.Icon.Size = UDim2.new(0.277, 0, 0.83, 0)
		Temp.BackgroundTransparency = 0
	end)
	Temp.MouseLeave:Connect(function()
		Temp.Icon.Size = UDim2.new(0.243, 0, 0.727, 0)
		Temp.BackgroundTransparency = 0.25
	end)

Temp.Pas.MouseButton1Click:Connect(function()
		CloseAllTabs()
		wait(0.1)
		local Collects = AllInfo.Pollen
		script.Parent.Parent.BeeInfo:TweenPosition(UDim2.new(0, -15, 0, -76), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.2, true)
		local BUI = script.Parent.Parent.BeeInfo
		BUI.CanvasPosition = Vector2.new(0,0)
		BUI.Attack.TextLabel.Text = "Attack: "..AllInfo.Attack
		BUI.Attack.BackText.Text = "Attack: "..AllInfo.Attack
		BUI.Attack.ImageColor3 = DamageColor
		BUI.Back.Thumb.Image = AllInfo.Thumb
		BUI.Speed.TextLabel.Text = "Speed: "..AllInfo.Speed
		BUI.Speed.BackText.Text = "Speed: "..AllInfo.Speed
		BUI.BeeName.Text = AllInfo.Name.." Bee"
		BUI.BeeNameBack.Text = AllInfo.Name.." Bee"
		BUI.BnB.ImageColor3 = BeeRarity
		BUI.Rarity.TextLabel.Text = AllInfo.Rarity
		BUI.Rarity.BackText.Text = AllInfo.Rarity
		BUI.Rarity.ImageColor3 = BeeRarity
		BUI.Color.TextLabel.Text = AllInfo.Color
		BUI.Color.BackText.Text = AllInfo.Color
		BUI.Color.ImageColor3 = BeeColor
		BUI.Collects.ImageColor3 = CollectColor
		BUI.Collects.TextLabel.Text = "Collects "..Collects.. " Pollen in "..AllInfo.CollectTime.." seconds"
		BUI.Collects.BackText.Text = "Collects "..Collects.. " Pollen in "..AllInfo.CollectTime.." seconds"
		BUI.Converts.TextLabel.Text = "Converts "..AllInfo.Converts.." Honey in "..AllInfo.ConvertsTime.." seconds"
		BUI.Converts.BackText.Text = "Converts "..AllInfo.Converts.." Honey in "..AllInfo.ConvertsTime.." seconds"
		BUI.CanvasSize = UDim2.new(0,0,1,0)
		
		BUI.Converts.ImageColor3 = ConvertColor
		if AllInfo.GiftedBonus[2] == "Percent" then
			if string.find(AllInfo.GiftedBonus[1], "Instant") then
				BUI.Gifted.TextLabel.Text = "⭐️Gifted Bonus: +"..AllInfo.GiftedBonus[3].."% "..AllInfo.GiftedBonus[1].." Conversion⭐️"
				BUI.Gifted.BackText.Text = "⭐️Gifted Bonus: +"..AllInfo.GiftedBonus[3].."% "..AllInfo.GiftedBonus[1].." Conversion⭐️"
			else
				BUI.Gifted.TextLabel.Text = "⭐️Gifted Bonus: +"..AllInfo.GiftedBonus[3].."% "..AllInfo.GiftedBonus[1].."⭐️"
				BUI.Gifted.BackText.Text = "⭐️Gifted Bonus: +"..AllInfo.GiftedBonus[3].."% "..AllInfo.GiftedBonus[1].."⭐️"
			end
		elseif AllInfo.GiftedBonus[2] == "Mult" then
			if string.find(AllInfo.GiftedBonus[1], "Instant") then
				BUI.Gifted.TextLabel.Text = "⭐️Gifted Bonus: x"..AllInfo.GiftedBonus[3].." "..AllInfo.GiftedBonus[1].." Conversion⭐️"
				BUI.Gifted.BackText.Text = "⭐️Gifted Bonus: x"..AllInfo.GiftedBonus[3].." "..AllInfo.GiftedBonus[1].." Conversion⭐️"
			else
				BUI.Gifted.TextLabel.Text = "⭐️Gifted Bonus: x"..AllInfo.GiftedBonus[3].." "..AllInfo.GiftedBonus[1].."⭐️"
				BUI.Gifted.BackText.Text = "⭐️Gifted Bonus: x"..AllInfo.GiftedBonus[3].." "..AllInfo.GiftedBonus[1].."⭐️"
			end
		end
		if AllInfo.Tokens then
			for index, token in ipairs(AllInfo.Tokens) do
			if Items.Tokens[token].Visible == true then
			local TokenImage = script.TokenTemp:Clone()
				TokenImage.Parent = BUI.Tokens
				TokenImage.TName.TextLabel.Text = token
				TokenImage.TName.BackText.Text = token
				TokenImage.Desc.Text = Items.Tokens[token].Desc
				local Size = string.len(TokenImage.Desc.Text) * 1.5
				if Size < TokenImage.Desc.Size.Height.Offset then
					TokenImage.Desc.Size = UDim2.new(0, 339,0, 76)
				else
					TokenImage.Desc.Size = UDim2.new(0, 339,0, Size)
				end
					local Size2 = 0
					for i,v in pairs(TokenImage:GetChildren()) do
						Size2 += v.Size.Height.Offset
					end
					--if Size2 <= 159 then
					--	TokenImage.Size = UDim2.new(1,0,0, 159)
					--else
						TokenImage.Size = UDim2.new(1,0,0, Size2 + 55)--TokenImage.Desc.Size.Height.Offset / 3)
					--end
					BUI.Tokens.Size += UDim2.fromOffset(0, TokenImage.Size.Height.Offset)
					BUI.CanvasSize += UDim2.fromOffset(0, TokenImage.Size.Height.Offset)
				end
			end
		end
		--BUI.Tokens.Size = UDim2.fromOffset(394, (105 * BUI.Tokens:GetChildren()))
		
		BUI.Back.Thumb:TweenSize(UDim2.new(1.246, 0,1.246, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Back, 0.3, true) 
	
		local tweenInfo1 = TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		local tween1 = TweenService:Create(BUI.Back.Thumb, tweenInfo1, {Rotation=-5})
		--local tweenInfo2 = TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		local tween2 = TweenService:Create(BUI.Back.Thumb, tweenInfo1, {Rotation=5})
		local tween3 = TweenService:Create(BUI.Back.Thumb, tweenInfo1, {Rotation=0})
		
		for count = 1,3 do
		tween1:Play()
		wait(0.05)
		tween2:Play()
		wait(0.05)
		end
		wait(0.1)
		tween3:Play()
	end)
	
	script.Parent.Parent.BeeInfo.ALL.MouseButton1Click:Connect(function()
		script.Parent.Parent.BeeInfo:TweenPosition(UDim2.new(-1, -115, 0, -76), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.2, true)
		CloseAllTabs()
		wait(0.1)
		script.Parent.Parent.Index:TweenPosition(UDim2.new(0, -15, 0, -76), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.2, true)
		script.Parent.Parent.BeeInfo.Back.Thumb.Size = UDim2.new(0,0,0,0)
		for i,v in pairs(script.Parent.Parent.BeeInfo.Tokens:GetChildren()) do
			if v.Name ~= "UIListLayout" then
			v:Destroy()
			end
		end
	end)
end