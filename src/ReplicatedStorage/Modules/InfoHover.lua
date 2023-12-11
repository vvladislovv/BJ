local InfoHover = {}

InfoHover.Infor = {
	["Info_Rank"] = "Your rank depends on how well and often you play. \n For each receipt you receive, you get from 1 to 25 ratings. \n The rating raises your rank.",
	["Info_PayDay"] = "Every hour spent in the game, you will receive bonuses. \n And a rating to your rank. \n The higher the rank, the more bonuses.",
	["Info_Snow"] = "Your Snow Balance",
	["Info_Cash"] = "Your Cash Balance",
	["Info_ToolUP"] = "PSB - Per Snow Block. \n Example: 24PSB - 24 Snow, for 1 Snow Block",
	["Info_BagUP"] = "idk",
	["Info_Codes"] = "The codes can be found in the discord server.",
}

local screenGui = nil
local TextMsg = "Some problems with connecting to Hover Service"
local UserInputService = game:GetService("UserInputService")
local box = Instance.new("TextLabel")
box.Name = "MouseoverBox"
box.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
box.BackgroundTransparency = 0.2
box.Font = Enum.Font.Highway
box.TextSize = 20
box.RichText = true
box.TextScaled = false
box.TextWrapped = true
box.AnchorPoint = Vector2.new(1, 0.5)
box.TextColor3 = Color3.fromRGB(255, 255, 255)
box.Visible = false
box.ZIndex = 9999
local Corner = Instance.new("UICorner", box)
Corner.CornerRadius = UDim.new(0,8)
--local UIStroke = Instance.new("UIStroke", box)
--UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
--UIStroke.Thickness = 5
--UIStroke.Color = Color3.fromRGB(21, 21, 21)


--function InfoHover:Create(MousePos)
--	local bounds = box.TextBounds
--	box.Size = UDim2.new(0, bounds.X * 1.75, 0, bounds.Y * 1.75)
--	if not TextL then
--		box.Position = MousePos
--		box.Visible = true
--	else
--		box.Text = TextL
--		box.Position = MousePos
--		box.Visible = true
--	end
--end

function InfoHover:Remove()
	box.Visible = false

end

function InfoHover:Move(MousePos, SizeMult, XPoint)
	if not XPoint then
		XPoint = Vector2.new(1, 0.5)
	end
	local bounds = box.TextBounds
	box.AnchorPoint = XPoint
	box.Size = UDim2.new(0, (bounds.X / SizeMult) + 35, 0, (bounds.Y / SizeMult))
	box.Position = MousePos
	box.Visible = true
end

function InfoHover:UpdateText(TextL)
	TextMsg = TextL
end

function InfoHover.Init()
	local players = game:GetService("Players")
	local player = players.LocalPlayer
	local pGui = player:WaitForChild("PlayerGui")
	screenGui = pGui:WaitForChild("UI")
	box.Parent = screenGui
	spawn(function()
		while wait(0.0001) do
			box.Text = TextMsg
		end
	end)
end

return InfoHover
