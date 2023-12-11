wait(5)

local list = script.Parent.List
local Utilities = require(game.ReplicatedStorage.Utilities)
local badges = require(game.ReplicatedStorage.Modules.Badges)
local Utils = require(game.ReplicatedStorage.Modules.Utils)
local ts = game:GetService("TweenService")

--Utilities:FormatTime()
for Type, Info in pairs(badges.Badges) do
	if _G.PData.Badges[Type] then
		local Icon = script.Icon:Clone()
		Icon.Name = Type
		Icon.LayoutOrder = Info.Layout * 100
		Icon.Statistics.Text = Info.BuffType
		
		Icon.Badge.TextLabel.Text = Type.." Badge - "..Info[_G.PData.Badges[Type].Tier].TierName
		
		Icon.BackgroundColor3 = badges.BadgesColors[_G.PData.Badges[Type].Tier]
		
		if _G.PData.Badges[Icon.Name].Tier < 6 then
			if Type ~= "Playtime" then
				Icon.Bar.TextLabel.Text = Utils:AbNumber(_G.PData.Badges[Type].Amount).." / "..Utils:AbNumber(Info[_G.PData.Badges[Type].Tier].Needs)
			else
				Icon.Bar.TextLabel.Text = Utilities:FormatTime(_G.PData.Badges[Type].Amount).." / "..Utilities:FormatTime(Info[_G.PData.Badges[Type].Tier].Needs)
			end
			Icon.Bar.FillBar.Size = UDim2.new(math.clamp((_G.PData.Badges[Type].Amount / Info[_G.PData.Badges[Type].Tier].Needs),0,1),0,1,0)

			if _G.PData.Badges[Type].Amount >= Info[_G.PData.Badges[Type].Tier].Needs then
				Icon.Bar.ClaimReward.Visible = true
			else
				Icon.Bar.ClaimReward.Visible = false
			end

			for Checkgg = 1,5 do
				Icon[tostring(Checkgg)].BackgroundTransparency = 0.8
				Icon[tostring(Checkgg)].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				Icon[tostring(Checkgg)].TextColor3 = Color3.fromRGB(255, 255, 255)
			end

			for Gh = 1,5 do
				if Info[Gh].BuffType == "Percent" then
					Icon[tostring(Gh)].Text = "+"..Info[Gh].BuffAmount.."%"
				else
					Icon[tostring(Gh)].Text = "x"..Info[Gh].BuffAmount
				end
			end

			if Icon:FindFirstChild(tostring(_G.PData.Badges[Type].Tier - 1)) then
				Icon[tostring(_G.PData.Badges[Type].Tier - 1)].BackgroundTransparency = 0
				Icon[tostring(_G.PData.Badges[Type].Tier - 1)].BackgroundColor3 = Color3.fromRGB(107, 243, 105)
				Icon[tostring(_G.PData.Badges[Type].Tier - 1)].TextColor3 = Color3.fromRGB(0, 0, 0)
			end
		else
			if Type ~= "Playtime" then
				Icon.Bar.TextLabel.Text = "Completed! Total: "..Utils:AbNumber(_G.PData.Badges[Type].Amount)
			else
				Icon.Bar.TextLabel.Text = "Completed! Total: "..Utilities:FormatTime(_G.PData.Badges[Type].Amount)
			end
			Icon.Bar.FillBar.Size = UDim2.new(math.clamp((_G.PData.Badges[Type].Amount / Info[_G.PData.Badges[Type].Tier].Needs),0,1),0,1,0)

			Icon.Bar.ClaimReward.Visible = false

			for Checkgg = 1,5 do
				Icon[tostring(Checkgg)].BackgroundTransparency = 0.8
				Icon[tostring(Checkgg)].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
				Icon[tostring(Checkgg)].TextColor3 = Color3.fromRGB(255, 255, 255)
			end

			for Gh = 1,5 do
				if Info[Gh].BuffType == "Percent" then
					Icon[tostring(Gh)].Text = "+"..Info[Gh].BuffAmount.."%"
				else
					Icon[tostring(Gh)].Text = "x"..Info[Gh].BuffAmount
				end
			end
			
			Icon["5"].BackgroundTransparency = 0
			Icon["5"].BackgroundColor3 = Color3.fromRGB(107, 243, 105)
			Icon["5"].TextColor3 = Color3.fromRGB(0, 0, 0)
		end
		
		Icon.Bar.ClaimReward.LocalScript.Disabled = false
		Icon.Parent = list
	end
end

function Update()
	for _, Icon in pairs(list:GetChildren()) do
		if Icon:IsA("Frame") then
			local Info = badges.Badges[Icon.Name]
			if _G.PData.Badges[Icon.Name].Tier < 6 then
				Icon.Badge.TextLabel.Text = Icon.Name.." Badge - "..Info[_G.PData.Badges[Icon.Name].Tier].TierName
				Icon.BackgroundColor3 = badges.BadgesColors[_G.PData.Badges[Icon.Name].Tier]
				if Icon.Name ~= "Playtime" then
					Icon.Bar.TextLabel.Text = Utils:AbNumber(_G.PData.Badges[Icon.Name].Amount).." / "..Utils:AbNumber(Info[_G.PData.Badges[Icon.Name].Tier].Needs)
				else
					Icon.Bar.TextLabel.Text = Utilities:FormatTime(_G.PData.Badges[Icon.Name].Amount).." / "..Utilities:FormatTime(Info[_G.PData.Badges[Icon.Name].Tier].Needs)
				end
				Icon.Bar.FillBar.Size = UDim2.new(math.clamp((_G.PData.Badges[Icon.Name].Amount / Info[_G.PData.Badges[Icon.Name].Tier].Needs),0,1),0,1,0)
				Icon.Rew.Am.Text = "x"..Info[_G.PData.Badges[Icon.Name].Tier].Reward[2]
				if _G.PData.Badges[Icon.Name].Amount >= Info[_G.PData.Badges[Icon.Name].Tier].Needs then
					Icon.Bar.ClaimReward.Visible = true
				else
					Icon.Bar.ClaimReward.Visible = false
				end

				for Checkgg = 1,5 do
					Icon[tostring(Checkgg)].BackgroundTransparency = 0.8
					Icon[tostring(Checkgg)].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					Icon[tostring(Checkgg)].TextColor3 = Color3.fromRGB(255, 255, 255)
				end

				for Gh = 1,5 do
					if Info[Gh].BuffType == "Percent" then
						Icon[tostring(Gh)].Text = "+"..Info[Gh].BuffAmount.."%"
					else
						Icon[tostring(Gh)].Text = "x"..Info[Gh].BuffAmount
					end
				end

				if Icon:FindFirstChild(tostring(_G.PData.Badges[Icon.Name].Tier - 1)) then
					Icon[tostring(_G.PData.Badges[Icon.Name].Tier - 1)].BackgroundTransparency = 0
					Icon[tostring(_G.PData.Badges[Icon.Name].Tier - 1)].BackgroundColor3 = Color3.fromRGB(107, 243, 105)
					Icon[tostring(_G.PData.Badges[Icon.Name].Tier - 1)].TextColor3 = Color3.fromRGB(0, 0, 0)
				end
			else
				Icon.Badge.TextLabel.Text = Icon.Name.." Badge - "..Info[_G.PData.Badges[Icon.Name].Tier].TierName
				
				if Icon.Name ~= "Playtime" then
					Icon.Bar.TextLabel.Text = "Completed! Total: "..Utils:AbNumber(_G.PData.Badges[Icon.Name].Amount)
				else
					Icon.Bar.TextLabel.Text = "Completed! Total: "..Utilities:FormatTime(_G.PData.Badges[Icon.Name].Amount)
				end
				Icon.Bar.FillBar.Size = UDim2.new(1,0,1,0)
				Icon.Rew.Am.Text = "x"..Info[_G.PData.Badges[Icon.Name].Tier].Reward[2]
				Icon.Bar.ClaimReward.Visible = false

				for Checkgg = 1,5 do
					Icon[tostring(Checkgg)].BackgroundTransparency = 0.8
					Icon[tostring(Checkgg)].BackgroundColor3 = Color3.fromRGB(0, 0, 0)
					Icon[tostring(Checkgg)].TextColor3 = Color3.fromRGB(255, 255, 255)
				end

				for Gh = 1,5 do
					if Info[Gh].BuffType == "Percent" then
						Icon[tostring(Gh)].Text = "+"..Info[Gh].BuffAmount.."%"
					else
						Icon[tostring(Gh)].Text = "x"..Info[Gh].BuffAmount
					end
				end

				Icon["5"].BackgroundTransparency = 0
				Icon["5"].BackgroundColor3 = Color3.fromRGB(107, 243, 105)
				Icon["5"].TextColor3 = Color3.fromRGB(0, 0, 0)
			end
		end
	end
end

coroutine.wrap(function()
	while wait(1) do
		for _, Icon in pairs(list:GetChildren()) do
			if Icon:IsA("Frame") then
				if _G.PData.Badges[Icon.Name].Tier >= 6 then
					ts:Create(Icon, TweenInfo.new(1.11), {BackgroundColor3 = badges.BadgesColors[6]}):Play()
					wait(1)
					ts:Create(Icon, TweenInfo.new(1.11), {BackgroundColor3 = badges.BadgesColors[7]}):Play()
				end
			end
		end
	end
end) ()

game:GetService("RunService").RenderStepped:Connect(function()
	if script.Parent.Parent.Badges.Position ~= UDim2.new(-1,-115, 0, -76) then
		Update()
	end
end)