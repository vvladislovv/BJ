local MK = script.Parent.MoneyK
local PlrBox = script.Parent.Plr
local EnterMK = script.Parent.GiveMoney

local GS = script.Parent.GSK
local EnterGS = script.Parent.GiveGS

local EXP = script.Parent.EXP
local EnterEXP = script.Parent.GiveEXP

local Remotes = game.ReplicatedStorage.Remotes

EnterMK.MouseButton1Click:Connect(function()
	if game.Players[PlrBox.Text] then
		Remotes.Admin:FireServer(PlrBox.Text, tonumber(MK.Text))
	else
		PlrBox.Text = "Error SSSX4"
	end
end)

EnterGS.MouseButton1Click:Connect(function()
	if game.Players[PlrBox.Text] then
		Remotes.AdminGS:FireServer(PlrBox.Text, tonumber(GS.Text))
	else
		PlrBox.Text = "Error SSSX4"
	end
end)

EnterEXP.MouseButton1Click:Connect(function()
	if game.Players[PlrBox.Text] then
		Remotes.AdminEXP:FireServer(PlrBox.Text, tonumber(EXP.Text))
	else
		PlrBox.Text = "Error SSSX4"
	end
end)