local Players = game:GetService("Players")
local SSS = game:GetService("ServerScriptService")
local Rep = game.ReplicatedStorage
local Remotes = Rep.Remotes
local Modules = Rep.Modules
local Data = require(script.Parent.Data)
local Items = require(Modules.Items)
local Equipment = require(game.ServerScriptService.Server.Equipment)
local Badges = require(Modules.Badges)
local GetStatsModule = require(SSS.Functions.GetRealStats)

local BoostsHandler = {} do

	Remotes.Badges.OnServerEvent:Connect(function(Player, BadgeType)
		local PData = Data:Get(Player)
		
		if PData.Badges[BadgeType] and PData.Badges[BadgeType].Tier <= 5 then
			local BadgeInfo = Badges.Badges[BadgeType]
			local PBadge = PData.Badges[BadgeType]
			local TierInfo = BadgeInfo[PBadge.Tier]
			if PBadge.Amount >= TierInfo.Needs then
				PBadge.Tier += 1
				PData.Inventory[TierInfo.Reward[1]] += TierInfo.Reward[2]
				PData.IStats.TotalBadges += 1
				if game.Players:FindFirstChild(Player.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", PData.Inventory})
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Badges", BadgeType, PData.Badges[BadgeType]})
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"IStats", PData.IStats})
				end
				GetStatsModule.GetRealStats(Player, PData)
				
				Remotes.AlertClient:FireAllClients({
					Color = "Blue",
					Msg = "🎉 "..Player.Name.." earned the "..BadgeType.." Badge - "..BadgeInfo[PBadge.Tier].TierName.." 🥇"
				})
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = "+"..TierInfo.Reward[2].." Tickets"
				})
				--local msg1 = ""
				--local msg2 = ""
				--if TierInfo.BuffType == "Percent" then
				--	if PBadge.Tier > 2 then
				--		msg1 = "-"..BadgeInfo[PBadge.Tier - 2].BuffAmount.."% "..BadgeInfo.BuffType
				--		Remotes.AlertClient:FireClient(Player, {
				--			Color = "Red",
				--			Msg = msg1
				--		})
				--	end
				--	msg2 = "+"..BadgeInfo[PBadge.Tier - 1].BuffAmount.."% "..BadgeInfo.BuffType
				--else
				--	msg2 = "x"..(BadgeInfo[PBadge.Tier].BuffAmount - BadgeInfo[PBadge.Tier - 1].BuffAmount)..BadgeInfo.BuffType
				--end
				--Remotes.AlertClient:FireClient(Player, {
				--	Color = "Purple",
				--	Msg = msg2
				--})
			end
		end
	end)
end

return BoostsHandler