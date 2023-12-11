wait(3)
local Player = game.Players.LocalPlayer
local Remotes = game.ReplicatedStorage.Remotes

local owners = {"1223182303", "319895289"}

local Drop = script.Parent.Drop

local function find(tab,itm)
	for i,v in pairs(tab) do
		if v == itm then
			return v
		end
	end
end


--PlayerData
Drop.DataReset.Kick.MouseButton1Click:Connect(function()
	if find(owners,tostring(Player.UserId)) then
	Remotes.AdminCommand:FireServer({
		Operation = "Kick",
		Player = Drop.DataReset.Player.Text,
		})
	end
end)

Drop.DataReset.MouseButton1Click:Connect(function()
	if find(owners,tostring(Player.UserId)) then
		Remotes.AdminCommand:FireServer({
			Operation = "DataReset",
			Player = Drop.DataReset.Player.Text,
		})
	end
end)

--Items
Drop.Items2.MouseButton1Click:Connect(function()
	if find(owners,tostring(Player.UserId)) then
	Remotes.AdminCommand:FireServer({
		Operation = "Inventory",
		Player = Drop.Items2.Player.Text,
		Item = Drop.Items2.Item.Text,
		Amount = Drop.Items2.Amount.Text,
		})
	end
end)

--Packs
Drop.Packs.MouseButton1Click:Connect(function()
	if find(owners,tostring(Player.UserId)) then
	Remotes.AdminCommand:FireServer({
		Operation = "GivePack",
		Player = Drop.Packs.Player.Text,
		Pack = Drop.Packs.Pack.Text,
		})
	end
end)

Drop.Stats.MouseButton1Click:Connect(function()
	if find(owners,tostring(Player.UserId)) then
		Remotes.AdminCommand:FireServer({
			Operation = "ChangeStats",
			Player = Drop.Stats.Player.Text,
			Stat = Drop.Stats.Stat.Text,
			Amount = Drop.Stats.Amount.Text,
		})
	end
end)
--Tools
Drop.Tools.MouseButton1Click:Connect(function()
	if find(owners,tostring(Player.UserId)) then
	Remotes.AdminCommand:FireServer({
		Operation = "Equipment",
		Player = Drop.Tools.Player.Text,
		Category = Drop.Tools.Category.Text,
		Tool = Drop.Tools.Tool.Text,
		})
	end
end)