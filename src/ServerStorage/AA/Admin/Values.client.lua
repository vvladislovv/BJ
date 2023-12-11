wait(5)

local af = script.Parent.List
local plr = game.Players.LocalPlayer

local Items = require(game.ReplicatedStorage.Modules.Items).Eggs

--//-----// Items \\-----\\--

local PacksInfo = {
	Operation = "Values",
	Player = "",
	Type = "",
	Amount = 0,
}

local pui = af.Values

--// Frames
local PRL = pui.PlayerList

--// Buttons
local Update = pui.UpdatePlayers
local Apply = pui.Apply

local Allow = {
	["Honey"] = true,
	["Pollen"] = true
}

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
	for _, Frame in pairs(pui:GetChildren()) do
		if Frame:IsA("Frame") and Allow[Frame.Name] then
			if PacksInfo.Type == Frame.Name then
				Frame.BackgroundColor3 = Color3.fromRGB(145, 255, 111)
				Frame.UIStroke.Color = Color3.fromRGB(130, 226, 98)
				Frame.Line.BackgroundColor3 = Color3.fromRGB(130, 226, 98)
			else
				Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Frame.UIStroke.Color = Color3.fromRGB(203, 203, 203)
				Frame.Line.BackgroundColor3 = Color3.fromRGB(203, 203, 203)
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

local Honey = pui.Honey
Honey.Honey.MouseButton1Click:Connect(function()
	if tonumber(Honey.Count.Text) ~= nil then
		PacksInfo.Type = "Honey"
		PacksInfo.Amount = tonumber(Honey.Count.Text)
		CheckVisualPacks()
	else
		require(game.ReplicatedStorage.Modules.Alerts).Alert({
			Color = "Red",
			Msg = "Enter a Number!"
		})
	end
end)

local Pollen = pui.Pollen
Pollen.Pollen.MouseButton1Click:Connect(function()
	if tonumber(Pollen.Count.Text) ~= nil then
		PacksInfo.Type = "Pollen"
		PacksInfo.Amount = tonumber(Pollen.Count.Text)
		CheckVisualPacks()
	else
		require(game.ReplicatedStorage.Modules.Alerts).Alert({
			Color = "Red",
			Msg = "Enter a Number!"
		})
	end
end)

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
		Operation = "Values",
		Player = "",
		Type = "",
		Amount = 0,
	}
	CheckVisualPlayers()
	CheckVisualPacks()
end)