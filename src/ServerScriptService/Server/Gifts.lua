local Remotes = game:GetService("ReplicatedStorage").Remotes
local Data = require(game:GetService("ServerScriptService").Server.Data)

local module = {} do
	
	Remotes.Parent.GiftRemote.OnServerEvent:Connect(function(Player)
		local PData = Data:Get(Player)
		local gift = PData.IStats.ShopGift
		if gift[3] then
			gift[3] = false
			PData.Inventory[gift[1]] += gift[2]
			Remotes.AlertClient:FireClient(Player, {
				Color = "Purple",
				Msg = "+"..gift[2].." "..gift[1].." (from Robux Shop Gift)"
			})
			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", PData.Inventory})
			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
		end
	end)
end

return module
