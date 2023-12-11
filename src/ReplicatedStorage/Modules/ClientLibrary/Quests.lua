local module = {}
local UserInputService = game:GetService("UserInputService")
local ClientUtilities = require(game.ReplicatedStorage.ClientUtilities)
local Items = require(script.Parent.Parent.Items)
local Utils = require(game.ReplicatedStorage.Modules.Utils)
local Utilities = require(game.ReplicatedStorage.Utilities)
local QuestsFolder = require(game.ReplicatedStorage.Modules.Quests)
local Remotes = game.ReplicatedStorage.Remotes
local Tween = game:GetService("TweenService")
local Camera = workspace.Camera
local UI = nil
local NPCMenu
local NPCName
local Cnt
local Deb = false

function module:QuestUI(Info)
	if Info then
		if Info.Name then
			spawn(function()
				local QuestMK = script.Quest:Clone()
				QuestMK.TextLabel.Text = Info.Name
				--QuestMK.LayoutOrder -= 1
				for i,v in pairs(Info.Tasks) do
					local TEmp = script.Template:Clone()
					TEmp.Parent = QuestMK.Tasks
					TEmp.Name = Info.Giver
					local Label = TEmp.TextLabel
					if i > 1 then
						QuestMK.Tasks.Size = UDim2.new(0.9,0,0,QuestMK.Tasks.Size.Y.Offset + 45)
						QuestMK.Size = UDim2.new(1,0,0,QuestMK.Tasks.Size.Y.Offset + 60)
					end
					local NdAm
					local StAm
					if v.NeedAmount >= 100000000000000 then
						NdAm = Utils:AbNumber(v.NeedAmount)
					else
						NdAm = Utils:CommaNumber(v.NeedAmount)
					end
					if v.StartAmount >= 100000000000000 then
						StAm = Utils:AbNumber(v.StartAmount)
					else
						StAm = Utils:CommaNumber(v.StartAmount)
					end
					if v.Type == "FieldPollen" then
						if v.Color then
							Label.Text = "Collect "..StAm.."/"..NdAm.." "..v.Color.." Pollen from "..v.Field.." Field."--.."("..((StAm/NdAm)*100).."%)"
						else
							Label.Text = "Collect "..StAm.."/"..NdAm.." Pollen from "..v.Field.." Field."
						end
					elseif v.Type == "AnyPollen" then
						Label.Text = "Collect "..StAm.."/"..NdAm.." Pollen."--.."("..((StAm/NdAm)*100).."%)"
					elseif v.Type == "PollenColor" then
						Label.Text = "Collect "..StAm.."/"..NdAm.." "..v.NColor.." Pollen."--.."("..((StAm/NdAm)*100).."%)"
					elseif v.Type == "AnyTokens" then
						Label.Text = "Collect "..StAm.."/"..NdAm.." Tokens."--.."("..((StAm/NdAm)*100).."%)"
					elseif v.Type == "FromTokens" then
						Label.Text = "Collect "..StAm.."/"..NdAm.." Tokens from "..v.Res.."."--.."("..((StAm/NdAm)*100).."%)"
					elseif v.Type == "TypeTokens" then
						Label.Text = "Collect "..v.Token.." Tokens "..StAm.."/"..NdAm.."."--.."("..((StAm/NdAm)*100).."%)"
					elseif v.Type == "BeesTokens" then
						if v.TokenType then
							Label.Text = "Collect "..v.TokenType.." Tokens "..StAm.."/"..NdAm.."."--.."("..((StAm/NdAm)*100).."%)"
						end
						if v.TokenColor then
							Label.Text = "Collect "..v.TokenColor.." Ability Tokens "..StAm.."/"..NdAm.."."--.."("..((StAm/NdAm)*100).."%)"
						end
					elseif v.Type == "UseItem" then
						Label.Text = "Use "..StAm.."/"..NdAm.." "..v.Item.."."--.."("..((StAm/NdAm)*100).."%)"
					elseif v.Type == "UseDispenser" then
						Label.Text = "Use "..StAm.."/"..NdAm.." "..v.Dispenser.."."--.."("..((StAm/NdAm)*100).."%)"
					elseif v.Type == "CraftAnyItems" then
						Label.Text = "Craft "..StAm.."/"..NdAm.." Ingredients."--.."("..((StAm/NdAm)*100).."%)"
					elseif v.Type == "OpenCase" then
						Label.Text = "Open "..StAm.."/"..NdAm.." "..v.Case.." Case."--.."("..((StAm/NdAm)*100).."%)"
					elseif v.Type == "AnyCaramel" then
						Label.Text = "Collect "..StAm.."/"..NdAm.." Caramel from Flowers."
					elseif v.Type == "CaramelField" then
						Label.Text = "Collect "..StAm.."/"..NdAm.." Caramel from "..v.Field.." Field."
					elseif v.Type == "CaramelColor" then
						Label.Text = "Collect "..StAm.."/"..NdAm.." Caramel from " ..v.NColor.." Flowers."

					end
				end
				QuestMK.Name = Info.Name
				QuestMK.Parent = UI.Tabs.Quests.List

				if UI.Tabs.Quests.List:GetChildren() ~= 0 then
					for i,v in pairs(UI.Tabs.Quests.List:GetChildren()) do
						if v:IsA("Frame") then
							QuestMK.LayoutOrder = v.LayoutOrder - 1
						end
					end
				end
			end)
		end
	end
end

function module:Freeze()
	local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
	controls:Disable()
end

function module:GetQuestType(NPCttt)
	local Type
	if not _G.PData.QuestsGivers[NPCttt].Claimed2 then
		Type = "Start"
	elseif _G.PData.QuestsGivers[NPCttt].Claimed2 and not _G.PData.QuestsGivers[NPCttt].CompletedNow then
		Type = "During"
	elseif _G.PData.QuestsGivers[NPCttt].Claimed2 and _G.PData.QuestsGivers[NPCttt].CompletedNow then
		Type = "Completed"
	end
	return Type
end

function module:QuestDestroy(InfoT)
	local QuestDM = UI.Tabs.Quests.List:FindFirstChild(InfoT.Name)
	if QuestDM ~= nil then
		QuestDM:Destroy()
	end
end

function module:Unfreeze()
	local controls = require(game:GetService("Players").LocalPlayer.PlayerScripts.PlayerModule):GetControls()
	controls:Enable()
end

function module:Dialoge(NPC)
	module:Freeze()
	NPCMenu.Visible = true
	_G.Talking = true
	Utils:TweenCam(nil, CFrame.new(NPC.Camera.View.WorldPosition, NPC.Camera.Position))
	NPCMenu:TweenPosition(UDim2.new(0.5,0,0.733,0), "Out", "Back", 0.3, true)
	local Index = 1
	local QuestType = module:GetQuestType(NPC.Name)
	local QuestCount = _G.PData.QuestsGivers[NPC.Name].CompletedQuests
	NPCMenu.NPC.Text = game.Workspace.NPCs:FindFirstChild(NPC.Name).Named.Value
	local Connection
	NPCName = NPC.Name
	Cnt = QuestCount
	if _G.PData.QuestsGivers[NPC.Name].Infinity == false and _G.PData.QuestsGivers[NPC.Name].CompletedQuests <= #QuestsFolder.Quests[NPCName].Quests then
		local DialogsModule = QuestsFolder.Quests[NPCName].Quests[_G.PData.QuestsGivers[NPC.Name].CompletedQuests].Dialogue
		NPCMenu.TextBox.Text = DialogsModule[QuestType][Index]
	elseif _G.PData.QuestsGivers[NPC.Name].Infinity == false and _G.PData.QuestsGivers[NPC.Name].CompletedQuests > #QuestsFolder.Quests[NPCName].Quests then
		NPCMenu.TextBox.Text = QuestsFolder.Quests[NPCName].NoQuests[Index]
	elseif _G.PData.QuestsGivers[NPC.Name].Infinity == true then
		local DialogsModule = QuestsFolder.Quests[NPCName].Quests[_G.PData.QuestsGivers[NPC.Name].CompletedQuests].Dialogue
		NPCMenu.TextBox.Text = DialogsModule[QuestType][Index]
	end
	Connection = NPCMenu.ButtonOverlay.MouseButton1Click:Connect(function()
		Index += 1
		if _G.PData.QuestsGivers[NPC.Name].CompletedQuests <= #QuestsFolder.Quests[NPCName].Quests then
			local DialogsModule = QuestsFolder.Quests[NPCName].Quests[_G.PData.QuestsGivers[NPC.Name].CompletedQuests].Dialogue
			if not _G.PData.QuestsGivers[NPC.Name].Claimed2 and not _G.PData.QuestsGivers[NPC.Name].CompletedNow then
				if Index > #DialogsModule.Start then
					if not Deb then
						spawn(function()
							Deb = true
							NPCMenu:TweenPosition(UDim2.new(0.5,0,1.733,0), "In", "Back", 0.3, true)
							Camera.CameraType = Enum.CameraType.Custom
							Tween:Create(workspace.CurrentCamera, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {FieldOfView = 70}):Play()
							Remotes.Quest:FireServer(NPCName)
							--QuestUI(QuestsFolder.Quests[NPCName].Quests[_G.PData.QuestsGivers[NPC.Name].CompletedQuests])
							_G.Talking = false
							Connection:Disconnect()
							Index = 1
							wait(0.1)
							Deb = false
							script.GetQuest:Play()
							module:Unfreeze()
						end)
					end
				else
					module:Animate(NPCMenu)
					NPCMenu.TextBox.Text = DialogsModule.Start[Index]
					module:Unfreeze()
				end
			elseif _G.PData.QuestsGivers[NPC.Name].Claimed2 and not _G.PData.QuestsGivers[NPC.Name].CompletedNow then
				if Index > #DialogsModule.During then
					if not Deb then
						spawn(function()
							Deb = true
							NPCMenu:TweenPosition(UDim2.new(0.5,0,1.733,0), "In", "Back", 0.3, true)
							Camera.CameraType = Enum.CameraType.Custom
							Tween:Create(workspace.CurrentCamera, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {FieldOfView = 70}):Play()
							Connection:Disconnect()
							_G.Talking = false
							Index = 1
							wait(0.1)
							Deb = false
							module:Unfreeze()
						end)
					end
				else
					module:Animate(NPCMenu)
					NPCMenu.TextBox.Text = DialogsModule.During[Index]
					module:Unfreeze()
				end
			elseif _G.PData.QuestsGivers[NPC.Name].CompletedNow then
				if Index > #DialogsModule.Completed then
					if not Deb then
						spawn(function()
							Deb = true
							_G.Talking = false
							NPCMenu:TweenPosition(UDim2.new(0.5,0,1.733,0), "In", "Back", 0.3, true)
							Camera.CameraType = Enum.CameraType.Custom
							Tween:Create(workspace.CurrentCamera, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {FieldOfView = 70}):Play()
							Remotes.Quest:FireServer(NPC.Name)
							module:QuestDestroy(QuestsFolder.Quests[NPCName].Quests[_G.PData.QuestsGivers[NPC.Name].CompletedQuests])
							Connection:Disconnect()
							Index = 1
							wait(0.1)
							Deb = false
							script.CompleteQuest:Play()
							module:Unfreeze()
						end)
					end
				else
					module:Animate(NPCMenu)
					NPCMenu.TextBox.Text = DialogsModule.Completed[Index]
					module:Unfreeze()
				end
			end
		else
			if Index > #QuestsFolder.Quests[NPCName].NoQuests then
				if not Deb then
					spawn(function()
						Deb = true
						NPCMenu:TweenPosition(UDim2.new(0.5,0,1.733,0), "In", "Back", 0.3, true)
						Camera.CameraType = Enum.CameraType.Custom
						Tween:Create(workspace.CurrentCamera, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {FieldOfView = 70}):Play()
						Connection:Disconnect()
						_G.Talking = false
						Index = 1
						wait(0.01)
						Deb = false
						module:Unfreeze()
					end)
				end
			else
				module:Animate(NPCMenu)
				NPCMenu.TextBox.Text = QuestsFolder.Quests[NPCName].NoQuests[Index]
				module:Unfreeze()
			end
		end
	end)
end

function module:Animate(NPCMenu)
	spawn(function()
		NPCMenu.Click:Play()
		NPCMenu:TweenPosition(UDim2.new(0.5,0,0.737,0), "Out", "Back", 0.075, true)
		NPCMenu:TweenSize(UDim2.new(0.363, 0,0.247, 0), "Out", "Back", 0.3, true)
		wait(0.1)
		NPCMenu:TweenSize(UDim2.new(0.35, 0,0.252, 0), "Out", "Back", 0.3, true)
		NPCMenu:TweenPosition(UDim2.new(0.5,0,0.733,0), "Out", "Back", 0.075, true)
	end)
end

function module:VisualDialoge(NPC)
	module:Freeze()
	NPCMenu.Visible = true
	_G.Talking = true
	Utils:TweenCam(nil, CFrame.new(NPC.Camera.View.WorldPosition, NPC.Camera.Position))
	NPCMenu:TweenPosition(UDim2.new(0.5,0,0.733,0), "Out", "Back", 0.3, true)
	local Index = 1
	local DialogsModule = QuestsFolder.Dialogs[NPC.Name]
	local Connection

	NPCMenu.NPC.Text = NPC.Name
	NPCMenu.TextBox.Text = DialogsModule.Dialogue[Index]

	Connection = NPCMenu.ButtonOverlay.MouseButton1Click:Connect(function()
		Index += 1
		if Index > #DialogsModule.Dialogue then
			NPCMenu:TweenPosition(UDim2.new(0.5,0,1.733,0), "In", "Back", 0.3, true)
			Camera.CameraType = Enum.CameraType.Custom
			Tween:Create(workspace.CurrentCamera, TweenInfo.new(1.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {FieldOfView = 70}):Play()
			_G.Talking = false
			Connection:Disconnect()
			Index = 1
			wait(0.1)
			Deb = false
			module:Unfreeze()

			if NPC.Name == "BeezBuzz Bear" then

			end
		else
			module:Animate(NPCMenu)
			NPCMenu.TextBox.Text = DialogsModule.Dialogue[Index]
		end
	end)
end

function module.Init()
	local players = game:GetService("Players")
	local Player = players.LocalPlayer
	local pGui = Player:WaitForChild("PlayerGui")
	UI = pGui:WaitForChild("UI")
	NPCMenu = Player.PlayerGui.UI:FindFirstChild("NPC")
	local qq
	wait(6)
	Remotes.CQuest.OnClientEvent:Connect(function()
		module:QuestUI(QuestsFolder.Quests[NPCName].Quests[_G.PData.QuestsGivers[NPCName].CompletedQuests])
	end)
	Remotes.DQuest.OnClientEvent:Connect(function()
		module:QuestDestroy(QuestsFolder.Quests[NPCName].Quests[_G.PData.QuestsGivers[NPCName].CompletedQuests])
	end)
end

return module
