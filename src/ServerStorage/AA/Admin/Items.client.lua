wait(5)

local af = script.Parent.List
local plr = game.Players.LocalPlayer

local Items = require(game.ReplicatedStorage.Modules.Items).Eggs

--//-----// Items \\-----\\--

local PacksInfo = {
	Operation = "Inventory",
	Player = "",
	Items = {},
}

local pui = af.Items

--// Frames
local PL = pui.PackList
local PRL = pui.PlayerList

--// Buttons
local Update = pui.UpdatePlayers
local Apply = pui.Apply
local Reset = pui.Reset

function CheckVisualPlayers()
	for _, Frame in pairs(PRL:GetChildren()) do
		if Frame:IsA("TextButton") then
			if PacksInfo.Player == Frame.Text then
				Frame.BackgroundColor3 = Color3.fromRGB(145, 255, 111)
				Frame.UIStroke.Color = Color3.fromRGB(130, 226, 98)
			else
				Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame.UIStroke.Color = Color3.fromRGB(203, 203, 203)
			end
		end
	end
end

function CheckVisualPacks()
	for _, Frame in pairs(PL:GetChildren()) do
		if Frame:IsA("Frame") then
			if PacksInfo.Items[Frame.Item.Text] then
				Frame.BackgroundColor3 = Color3.fromRGB(145, 255, 111)
				Frame.UIStroke.Color = Color3.fromRGB(130, 226, 98)
			else
				Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame.UIStroke.Color = Color3.fromRGB(203, 203, 203)
			end
		end
	end
end

function GeneratePlayers()
	for _, PlayerT in pairs(game.Players:GetChildren()) do
		local Template = script.Player:Clone()
		Template.Text = PlayerT.Name
		Template.Parent = PRL
		Template.MouseButton1Click:Connect(function()
			PacksInfo.Player = PlayerT.Name
			CheckVisualPlayers()
		end)
	end
end

GeneratePlayers()

for _, Item in pairs(Items) do
	local Template = script.Item:Clone()
	Template.Item.Text = Item.Name
	Template.Parent = PL
	Template.Item.MouseButton1Click:Connect(function()
		if tonumber(Template.Count.Text) ~= nil then
			PacksInfo.Items[Item.Name] = tonumber(Template.Count.Text)
			CheckVisualPacks()
		else
			require(game.ReplicatedStorage.Modules.Alerts).Alert({
				Color = "Red",
				Msg = "Enter a Number!"
			})
		end
	end)
end

Update.MouseButton1Click:Connect(function()
	for _, Frame in pairs(PRL:GetChildren()) do
		if Frame:IsA("TextButton") then
			Frame:Destroy()
		end
	end
	wait(1)
	GeneratePlayers()
end)

Apply.MouseButton1Click:Connect(function()
	game.ReplicatedStorage.Remotes.AdminCommand:FireServer(PacksInfo)
	PacksInfo = {
		Operation = "Inventory",
		Player = "",
		Items = {}
	}
	for _, Frame in pairs(PL:GetChildren()) do
		if Frame:IsA("Frame") then
			Frame.Count.Text = ""
		end
	end
	CheckVisualPlayers()
	CheckVisualPacks()
end)

Reset.MouseButton1Click:Connect(function()
	PacksInfo.Items = {}
	for _, Frame in pairs(PL:GetChildren()) do
		if Frame:IsA("Frame") then
			Frame.Count.Text = ""
		end
	end
	CheckVisualPlayers()
	CheckVisualPacks()
end)