local Remotes = game.ReplicatedStorage.Remotes

local Utils = require(game.ReplicatedStorage:WaitForChild("Modules").Utils)
local Data = require(game.ServerScriptService.Server.Data)

local Quests = {} do
	Remotes.Quest.OnServerEvent:Connect(function(plr, NPC)
	if (game.Workspace:FindFirstChild(plr.Name).PrimaryPart.Position - game.Workspace.NPCs:FindFirstChild(NPC).Pad.Position).Magnitude <= 15 then
		local PData = Data:Get(plr)
		local QuestModule = require(game.ReplicatedStorage.Modules.Quests).Quests

		if not PData.QuestsGivers[NPC].Infinity then
			if not PData.QuestsGivers[NPC].Claimed2 then
				PData.QuestsGivers[NPC].Claimed2 = true
				PData.Quests2[NPC] = Utils:DeepCopy(QuestModule[NPC].Quests[PData.QuestsGivers[NPC].CompletedQuests].Tasks)

				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(plr, {"Quests2", PData.Quests2})
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(plr, {"QuestsGivers", PData.QuestsGivers})

				Remotes.AlertClient:FireClient(plr, {
					Color = "Blue",
					Msg = "You have received a Quest from "..game.Workspace.NPCs:FindFirstChild(NPC).Named.Value
				})
				if QuestModule[NPC].Quests[PData.QuestsGivers[NPC].CompletedQuests].ClaimRewards then
					for _, Reward in pairs(QuestModule[NPC].Quests[PData.QuestsGivers[NPC].CompletedQuests].ClaimRewards) do
						PData[Reward.Present][Reward.ValueType] += Reward.Amount
						Remotes.AlertClient:FireClient(plr, {
							Color = "Blue",
							Msg = "+"..Reward.Amount.." "..Reward.ValueType
						})
					end
					end
					game.ReplicatedStorage:WaitForChild("Remotes").CQuest:FireClient(plr)
			end
			if PData.QuestsGivers[NPC].Claimed2 and PData.QuestsGivers[NPC].CompletedNow then
				local Rewards  = QuestModule[NPC].Quests[PData.QuestsGivers[NPC].CompletedQuests].Rewards
				PData.QuestsGivers[NPC].CompletedQuests += 1
				PData.QuestsGivers[NPC].Claimed2 = false
				PData.QuestsGivers[NPC].CompletedNow = false
				--if game.Players:FindFirstChild(plr.Name) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(plr, {"Quests2", PData.Quests2})
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(plr, {"QuestsGivers", PData.QuestsGivers})
				--end
				PData.Quests2[NPC] = nil
				Remotes.AlertClient:FireClient(plr, {
					Color = "Blue",
					Msg = "You have completed the quest from the "..game.Workspace.NPCs:FindFirstChild(NPC).Named.Value
					})
				for _, Reward in pairs(Rewards) do
					PData[Reward.Present][Reward.ValueType] += Reward.Amount
					if game.Players:FindFirstChild(plr.Name) then
						game.ReplicatedStorage:WaitForChild("Remotes").GetItemsFromQuest:FireClient(plr, Reward.ValueType, Reward.Amount)
						game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(plr, {Reward.Present, Reward.ValueType, PData[Reward.Present][Reward.ValueType]})
					end
					
					Remotes.AlertClient:FireClient(plr, {
						Color = "Blue",
						Msg = "+"..Reward.Amount.." "..Reward.ValueType.." (from Quest)"
					})
					end
					game.ReplicatedStorage:WaitForChild("Remotes").DQuest:FireClient(plr)
				--Remotes.GetUIQuest:FireClient(plr, QuestModule[NPC].Quests[PData.QuestsGivers[NPC].CompletedQuests - 1], false)
			end
		else
			if not PData.QuestsGivers[NPC].Claimed2 then
				PData.QuestsGivers[NPC].Claimed2 = true
				PData.Quests2[NPC] = Utils:DeepCopy(QuestModule[NPC].Quests[PData.QuestsGivers[NPC].CompletedQuests].Tasks)
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(plr, {"Quests2", PData.Quests2})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(plr, {"QuestsGivers", PData.QuestsGivers})
				--end
				Remotes.AlertClient:FireClient(plr, {
					Color = "Blue",
					Msg = "You have received a Quest from "..game.Workspace.NPCs:FindFirstChild(NPC).Named.Value
					})
					
				if QuestModule[NPC].Quests[PData.QuestsGivers[NPC].CompletedQuests].ClaimRewards then
					for _, Reward in pairs(QuestModule[NPC].Quests[PData.QuestsGivers[NPC].CompletedQuests].ClaimRewards) do
						PData[Reward.Present][Reward.ValueType] += Reward.Amount
						if game.Players:FindFirstChild(plr.Name) then
							game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(plr, {Reward.Present, Reward.ValueType, PData[Reward.Present][Reward.ValueType]})
						end
						Remotes.AlertClient:FireClient(plr, {
							Color = "Blue",
							Msg = "+"..Reward.Amount.." "..Reward.ValueType
						})
					end
					end
					game.ReplicatedStorage:WaitForChild("Remotes").CQuest:FireClient(plr)
			end
			if PData.QuestsGivers[NPC].Claimed2 and PData.QuestsGivers[NPC].CompletedNow then
				local Rewards  = QuestModule[NPC].Quests[PData.QuestsGivers[NPC].CompletedQuests].Rewards
				if PData.QuestsGivers[NPC].CompletedQuests >= #QuestModule[NPC].Quests then
					PData.QuestsGivers[NPC].CompletedQuests = 1
				else
					PData.QuestsGivers[NPC].CompletedQuests += 1
				end

				PData.QuestsGivers[NPC].Claimed2 = false
				PData.QuestsGivers[NPC].CompletedNow = false
				PData.QuestsGivers[NPC].TotalQuests += 1
				--if game.Players:FindFirstChild(plr.Name) then
					PData.Quests2[NPC] = nil
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(plr, {"Quests2", PData.Quests2})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(plr, {"QuestsGivers", PData.QuestsGivers})
					--end
					game.ReplicatedStorage:WaitForChild("Remotes").DQuest:FireClient(plr)
				Remotes.AlertClient:FireClient(plr, {
					Color = "Blue",
					Msg = "You have completed the quest from the "..NPC
				})
					for _, Reward in pairs(Rewards) do
						if Reward.ValueType ~= "Xp" then
							PData[Reward.Present][Reward.ValueType] += Reward.Amount
							if game.Players:FindFirstChild(plr.Name) then
								game.ReplicatedStorage:WaitForChild("Remotes").GetItemsFromQuest:FireClient(plr, Reward.ValueType, Reward.Amount)
								game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(plr, {Reward.Present, Reward.ValueType, PData[Reward.Present][Reward.ValueType]})
							end
							Remotes.AlertClient:FireClient(plr, {
								Color = "Blue",
								Msg = "+"..Reward.Amount.." "..Reward.ValueType.." (from Quest)"
							})
						else
							require(script.Parent.Parent.Modules.Beespass).Check(plr, PData, Reward.Amount)
						end
					end
				--Remotes.GetUIQuest:FireClient(plr, QuestModule[NPC].Quests[PData.QuestsGivers[NPC].CompletedQuests - 1], false)
			end
			end
		end
	end)
end

return Quests