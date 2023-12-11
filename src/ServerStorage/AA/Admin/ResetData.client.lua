wait(5)

local af = script.Parent.List
local plr = game.Players.LocalPlayer

--//-----// Items \\-----\\--

local PacksInfo = {
	Operation = "DataReset",
	Player = "",
}

local pui = af.ResetData

--// Frames
local PRL = pui.PlayerList

--// Buttons
local Update = pui.UpdatePlayers
local Apply = pui.Apply

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
		Operation = "DataReset",
		Player = "",
	}
	CheckVisualPlayers()
end)