local InfoHover = {}

local UI = nil
local TextMsg = "Some problems with connecting to Hover Service"
local UserInputService = game:GetService("UserInputService")
local ClientUtilities = require(game.ReplicatedStorage.ClientUtilities)
local Items = require(script.Parent.Parent.Items)
local Utils = require(game.ReplicatedStorage.Modules.Utils)
local ClientUtilities = require(game.ReplicatedStorage.ClientUtilities)
local Utilities = require(game.ReplicatedStorage.Utilities)
local QuestsD = require(script.Parent.Quests)
local shops = require(script.Parent.Shops)

local Remotes = game.ReplicatedStorage.Remotes

function InfoHover:ChangeAction(ActionBar, Color, HideKey, Text)
	ActionBar.BackgroundColor3 = ClientUtilities.Colors[Color]
	ActionBar.Label.Text = Text
	if HideKey then
		ActionBar.Key.Visible = false
	else
		ActionBar.Key.Visible = true
	end
end

function InfoHover.Init()
	local players = game:GetService("Players")
	local Player = players.LocalPlayer
	local pGui = Player:WaitForChild("PlayerGui")
	UI = pGui:WaitForChild("UI")
	local UIScale = UI:WaitForChild("UIScale")
	local ActionBar = UI.ActionBar
	local Scale
	local Action
	local ActionParams = {}
	local HideKey = false
	local Character = Player.Character
	local Spe = false
	local function CheckActions()
		if Action == "ClaimHive" then
			Remotes.ClaimHive:FireServer(ActionParams)
		elseif Action == "MakeHoney" then
			Remotes.ConvertPollen:FireServer(true)
			_G.PData.Vars.Making = true
		elseif Action == "StopHoney" then
			Remotes.ConvertPollen:FireServer(false)
			_G.PData.Vars.Making = false
		elseif Action == "OpenShop" then
			shops:OpenShop(ActionParams)
		elseif Action == "CloseShop" then
			shops:CloseShop()
		elseif Action == "YellowSlide" then
			Character:SetPrimaryPartCFrame(game.Workspace.Map.Toys.YellowPipe.Platform.Teleport.WorldCFrame)
		elseif Action == "BlueSlide" then
			Character:SetPrimaryPartCFrame(game.Workspace.Map.Toys.BluePipe.Platform.Teleport.WorldCFrame)
		elseif Action == "HoneyDis" then
			Remotes.Dis:FireServer("Honey")
			wait(0.1)
		elseif Action == "StrawberryDis" then
			Remotes.Dis:FireServer("Strawberry")
			wait(0.1)
		elseif Action == "BlueberryDis" then
			Remotes.Dis:FireServer("Blueberry")
			wait(0.1)
		elseif Action == "MolyCricketF" then
			game.ReplicatedStorage.Remotes.MolyCricketJoin:FireServer()
			_G.JoinedMC = true
		elseif Action == "MolyCricketExit" then
			game.ReplicatedStorage.Remotes.MolyCricketExit:FireServer()
			_G.JoinedMC = false
		elseif Action == "WhiteBooster" then
			Remotes.BoosterF:FireServer("White")
		elseif Action == "BlueBooster" then
			Remotes.BoosterF:FireServer("Blue")
		elseif Action == "RedBooster" then
			Remotes.BoosterF:FireServer("Red")
		elseif Action == "TermitEnter" then
			Remotes.EnterTermiteHollow:FireServer()
		elseif Action == "FreeTermitPass" then
			Remotes.BuyTermitPass:FireServer(false)
		elseif Action == "TicketTermitPass" then
			Remotes.BuyTermitPass:FireServer(true)
		elseif Action == "TalkTo" then
			if not game.Workspace.NPCs:FindFirstChild(ActionParams.Name) then
				QuestsD:VisualDialoge(ActionParams)
			else
				QuestsD:Dialoge(ActionParams)
			end
		elseif Action == "Crafting" then
			Remotes.OpenCraftGui:FireServer(true)
		elseif Action == "CloseCrafting" then
			Remotes.OpenCraftGui:FireServer(false)
		elseif Action == "Books" then
			Spe = true
			game.Lighting.Blur.Enabled = true
			UI.MakeSpell:TweenPosition(UDim2.new(0.5,0,0.5,0), "Out", "Linear", 0.2, true)
		elseif Action == "CBooks" then
			Spe = false
			game.Lighting.Blur.Enabled = false
			UI.MakeSpell:TweenPosition(UDim2.new(0.5,0,2,0), "Out", "Linear", 0.2, true)
		end
	end
	
	UserInputService.InputBegan:Connect(function(Input, GPE)
		if not GPE then
			if Input.KeyCode == Enum.KeyCode.E then
				CheckActions()
			end
		end
	end)

	ActionBar.MouseButton1Click:Connect(CheckActions)
	
	game:GetService("RunService").RenderStepped:Connect(function()
		local Character = game.Workspace:FindFirstChild(Player.Name)
		if Character and Character.PrimaryPart then
			Scale = UI.AbsoluteSize.Y / 1080 * 1.075
			UIScale.Scale = Scale

			for _, v in pairs(UI.Tabs:GetChildren()) do
				if v:FindFirstChild("List") and v:FindFirstChild("List"):FindFirstChild("UIListLayout") then
					v:FindFirstChild("List").CanvasSize = UDim2.new(0,0,0,v:FindFirstChild("List"):FindFirstChild("UIListLayout").AbsoluteContentSize.Y / Scale)
				end
			end
			UI.Spells.Books.CanvasSize = UDim2.new(0,0,0,UI.Spells.Books:FindFirstChild("UIListLayout").AbsoluteContentSize.Y / Scale)

			local Size = 0
			for _, v in pairs(UI:FindFirstChild("RobuxShop").ScrollingFrame.Products:GetChildren()) do
				if not v:IsA("UIListLayout") and v.Visible then
					Size += v.Size.Width.Offset
				end
			end
			UI:FindFirstChild("RobuxShop").ScrollingFrame.CanvasSize = UDim2.new(0, Size, 0,0)

			if Action then
				ActionBar:TweenPosition(UDim2.new(0.5, 0, 0, 20), Enum.EasingDirection.Out, Enum.EasingStyle.Quint, 0.3)
			else
				ActionBar:TweenPosition(UDim2.new(0.5, 0, -1, 0), Enum.EasingDirection.In, Enum.EasingStyle.Quint, 0.3)
			end

			Action = nil
			HideKey = false

			for _, Shop in pairs(workspace.ShopsM:GetChildren()) do
				if (Character.PrimaryPart.Position - Shop.Platfrom.Position).Magnitude <= Shop.Region.Value then
					if not _G.OpenedShop then
						InfoHover:ChangeAction(ActionBar, "Blue", false, "Open Shop")
						Action = "OpenShop"
						ActionParams = Shop.Name
					else
						InfoHover:ChangeAction(ActionBar, "Red", false, "Close Shop")
						Action = "CloseShop"
					end
				end
			end

			for _, NPC in pairs(workspace.NPCs:GetChildren()) do
				if (Character.PrimaryPart.Position - NPC.Circle.Position).Magnitude <= 10 then
					if not _G.Talking then
						InfoHover:ChangeAction(ActionBar, "Blue", false, "Talk to the "..NPC.Named.Value)
						Action = "TalkTo"
						ActionParams = NPC
					end
				end
			end

			for _, NPC in pairs(workspace.FakeNPCs:GetChildren()) do
				if (Character.PrimaryPart.Position - NPC.Circle.Position).Magnitude <= 10 then
					if not _G.Talking then
						InfoHover:ChangeAction(ActionBar, "Blue", false, "Talk to the "..NPC.Named.Value)
						Action = "TalkTo"
						ActionParams = NPC
					end
				end
			end

			if (Character.PrimaryPart.Position - workspace.Map.Toys.Crafting.Pad.Circle.Position).Magnitude <= 10 then
				if Player.PlayerGui.CraftingMenu.Enabled == false then
					InfoHover:ChangeAction(ActionBar, "Blue", false, "Open the Mixer Menu")
					Action = "Crafting"
				else
					InfoHover:ChangeAction(ActionBar, "Red", false, "Close the Mixer Menu")
					Action = "CloseCrafting"
				end
			end

			if (Character.PrimaryPart.Position - workspace.Map.Toys.TermitHollow.Circle.Position).Magnitude <= 15 then
				if workspace.Map.TermiteHollow.Fight.Value == false then
					if _G.PData.Inventory["Termit Pass"] > 0 then
						InfoHover:ChangeAction(ActionBar, "Blue", false, "Enter the Termite Lair \n (-1 Termit Pass)")
						Action = "TermitEnter"
					else
						InfoHover:ChangeAction(ActionBar, "Red", false, "To Enter the Termite Lair, You Need a \n Termit Pass")
						Action = "TermitNotEnter"
					end
				else
					InfoHover:ChangeAction(ActionBar, "Red", false, "Someone is Already Fighting Termites at the Moment")
					Action = "TermitNotEnter"
				end
			end

			if (Character.PrimaryPart.Position - workspace.Map.Toys.FreeTermitPass.Circle.Position).Magnitude <= 10 then
				if not _G.PData.Cooldowns2["Free Termit Pass"] then
					if _G.PData.Inventory["Termit Pass"] < Items.Eggs["Termit Pass"].Limit then
						InfoHover:ChangeAction(ActionBar, "Blue", false, "Get a Free Termit Pass")
						Action = "FreeTermitPass"
					else
						InfoHover:ChangeAction(ActionBar, "Red", true, "You already have the Maximum Number of Termit Passes")
						Action = "CantTermitPass"
					end
				else
					InfoHover:ChangeAction(ActionBar, "Red", false, "Wait until the next Free Termit Pass \n ("..Utilities:FormatTime(_G.PData.Cooldowns2["Free Termit Pass"].Time - os.time())..")")
					Action = "CantTermitPass"
				end
			elseif (Character.PrimaryPart.Position - workspace.Map.Toys.TicketTermitPass.Circle.Position).Magnitude <= 10 then
				if _G.PData.Inventory["Ticket"] >= workspace.Map.Toys.TicketTermitPass.Cost.Value then
					if _G.PData.Inventory["Termit Pass"] < Items.Eggs["Termit Pass"].Limit then
						InfoHover:ChangeAction(ActionBar, "Blue", false, "Buy Termit Pass \n ("..workspace.Map.Toys.TicketTermitPass.Cost.Value.." Tickets)")
						Action = "TicketTermitPass"
					else
						InfoHover:ChangeAction(ActionBar, "Red", true, "You already have the Maximum Number of Termit Passes")
						Action = "CantTermitPass"
					end
				else
					InfoHover:ChangeAction(ActionBar, "Red", true, "You don't have enough Tickets to buy \n ("..workspace.Map.Toys.TicketTermitPass.Cost.Value.." Tickets)")
					Action = "CantTermitPass"
				end
			end

			if (Character.PrimaryPart.Position - workspace.Map.Toys.MolyCricketBoss.Circle.Position).Magnitude <= 10 then
				if _G.PData.Vars.Hive ~= "" then
					if not _G.PData.Cooldowns2["MolyCricket"] then
						if _G.JoinedMC == false then
							InfoHover:ChangeAction(ActionBar, "Blue", false, "Fight with the Moly Cricket")
							Action = "MolyCricketF"
						else
							InfoHover:ChangeAction(ActionBar, "Red", false, "Get out of the Fight")
							Action = "MolyCricketExit"
						end
					else
						if _G.PData.Cooldowns2["MolyCricket"].Time - os.time() > 0 then
							InfoHover:ChangeAction(ActionBar, "Red", false, "Time until the Moly Cricket respawns "..Utilities:FormatTime(_G.PData.Cooldowns2["MolyCricket"].Time - os.time()))
							Action = "MolyCricketN"
						else
							if _G.JoinedMC == false then
								InfoHover:ChangeAction(ActionBar, "Blue", false, "Fight with the Moly Cricket")
								Action = "MolyCricketF"
							else
								InfoHover:ChangeAction(ActionBar, "Red", false, "Get out of the Fight")
								Action = "MolyCricketExit"
							end
						end
					end
				else
					InfoHover:ChangeAction(ActionBar, "Red", true, "For the Battle you have to Take the Hive")
					Action = "MolyCricketN"
				end
			end

			if (Character.PrimaryPart.Position - workspace.Map.Toys.YellowPipe.Platform.Position).Magnitude <= 10 then
				if _G.PData.TotalBees >= 16 then
					InfoHover:ChangeAction(ActionBar, "Blue", false, "Use the Yellow Slide Pipe")
					Action = "YellowSlide"
				else
					InfoHover:ChangeAction(ActionBar, "Red", true, "You need 16 Bees to use Yellow Slide Pipe")
					Action = "YellowSlideCant"
				end
			end

			if (Character.PrimaryPart.Position - workspace.Map.Toys.BluePipe.Platform.Position).Magnitude <= 10 then
				if _G.PData.TotalBees >= 10 then
					InfoHover:ChangeAction(ActionBar, "Blue", false, "Use the Blue Slide Pipe")
					Action = "BlueSlide"
				else
					InfoHover:ChangeAction(ActionBar, "Red", true, "You need 10 Bees to use Blue Slide Pipe")
					Action = "BlueSlideCant"
				end
			end
			

			if (Character.PrimaryPart.Position - workspace.Map.Event.Circle.Position).Magnitude <= 10 then
				InfoHover:ChangeAction(ActionBar, "Red", true, "*** \n Soon")
				Action = "SoonGGGH"
			end
			
			if (Character.PrimaryPart.Position - workspace.Map.Toys.BluePipe.Platform.Position).Magnitude <= 10 then
				if _G.PData.TotalBees >= 10 then
					InfoHover:ChangeAction(ActionBar, "Blue", false, "Use the Blue Slide Pipe")
					Action = "BlueSlide"
				else
					InfoHover:ChangeAction(ActionBar, "Red", true, "You need 10 Bees to use Blue Slide Pipe")
					Action = "BlueSlideCant"
				end
			end
			
			if (Character.PrimaryPart.Position - workspace.Map.Toys.Books.Circle.Position).Magnitude <= 10 then
				if not Spe then
					InfoHover:ChangeAction(ActionBar, "Blue", false, "Make Spells")
					Action = "Books"
				else
					InfoHover:ChangeAction(ActionBar, "Red", false, "Close Menu")
					Action = "CBooks"
				end
			end

			if (Character.PrimaryPart.Position - workspace.BadgeReq.Circle.Position).Magnitude <= 10 then
				if _G.PData.IStats.TotalBadges < 8 then
					InfoHover:ChangeAction(ActionBar, "Red", false, "Requires 8 Badges")
					Action = "dfsfdsff"
				end
			end

			if (Character.PrimaryPart.Position - workspace.Map.Toys.Honey.Pad.Circle.Position).Magnitude <= 10 then
				if not _G.PData.Cooldowns2["HoneyDis"] or _G.PData.Cooldowns2["HoneyDis"].Time - os.time() <= 0 then
					if Player:IsInGroup(10847461) then
						InfoHover:ChangeAction(ActionBar, "Blue", false, "Use the Honey Dispenser")
						Action = "HoneyDis"
					else
						InfoHover:ChangeAction(ActionBar, "Blue", false, "You must be a member of the Verge Studio group to receive a daily bonus")
						Action = "HoneyDisNeedToGroup"
					end
				else
					InfoHover:ChangeAction(ActionBar, "Red", false, "Use the Honey Dispenser \n ("..Utilities:FormatTime(_G.PData.Cooldowns2["HoneyDis"].Time - os.time())..")")
					Action = "HoneyDisCant't"
				end
			end

			if (Character.PrimaryPart.Position - workspace.Map.Toys.Strawberry.Pad.Circle.Position).Magnitude <= 10 then
				if not _G.PData.Cooldowns2["StrawberryDis"] or _G.PData.Cooldowns2["StrawberryDis"].Time - os.time() <= 0 then
					if Player:IsInGroup(10847461) then
						InfoHover:ChangeAction(ActionBar, "Blue", false, "Use the Strawberry Dispenser")
						Action = "StrawberryDis"
					else
						InfoHover:ChangeAction(ActionBar, "Blue", false, "You must be a member of the Verge Studio group to receive a daily bonus")
						Action = "StrawberryDisNeedToGroup"
					end
				else
					InfoHover:ChangeAction(ActionBar, "Red", false, "Use the Strawberry Dispenser \n ("..Utilities:FormatTime(_G.PData.Cooldowns2["StrawberryDis"].Time - os.time())..")")
					Action = "StrawberryDisCant't"
				end
			end

			if (Character.PrimaryPart.Position - workspace.Map.Toys.Blueberry.Pad.Circle.Position).Magnitude <= 10 then
				if not _G.PData.Cooldowns2["BlueberryDis"] or _G.PData.Cooldowns2["BlueberryDis"].Time - os.time() <= 0 then
					if Player:IsInGroup(10847461) then
						InfoHover:ChangeAction(ActionBar, "Blue", false, "Use the Blueberry Dispenser")
						Action = "BlueberryDis"
					else
						InfoHover:ChangeAction(ActionBar, "Blue", false, "You must be a member of the Verge Studio group to receive a daily bonus")
						Action = "BlueberryDisNeedToGroup"
					end
				else
					InfoHover:ChangeAction(ActionBar, "Red", false, "Use the Blueberry Dispenser \n ("..Utilities:FormatTime(_G.PData.Cooldowns2["BlueberryDis"].Time - os.time())..")")
					Action = "BlueberryDisCant't"
				end
			end

			if (Character.PrimaryPart.Position - workspace.Map.Toys.WhiteBooster.Pad.Circle.Position).Magnitude <= 10 then
				if not _G.PData.Cooldowns2["WhiteBooster"] or _G.PData.Cooldowns2["WhiteBooster"].Time - os.time() <= 0 then
					InfoHover:ChangeAction(ActionBar, "Blue", false, "Use the White Booster")
					Action = "WhiteBooster"
				else
					InfoHover:ChangeAction(ActionBar, "Red", false, "Use the White Booster \n ("..Utilities:FormatTime(_G.PData.Cooldowns2["WhiteBooster"].Time - os.time())..")")
					Action = "WhiteBooster"
				end
			end

			if (Character.PrimaryPart.Position - workspace.Map.Toys.BlueBooster.Pad.Circle.Position).Magnitude <= 10 then
				if not _G.PData.Cooldowns2["BlueBooster"] or _G.PData.Cooldowns2["BlueBooster"].Time - os.time() <= 0 then
					InfoHover:ChangeAction(ActionBar, "Blue", false, "Use the Blue Booster")
					Action = "BlueBooster"
				else
					InfoHover:ChangeAction(ActionBar, "Red", false, "Use the Blue Booster \n ("..Utilities:FormatTime(_G.PData.Cooldowns2["WhiteBooster"].Time - os.time())..")")
					Action = "BlueBooster"
				end
			end

			if (Character.PrimaryPart.Position - workspace.Map.Toys.RedBooster.Pad.Circle.Position).Magnitude <= 10 then
				if not _G.PData.Cooldowns2["RedBooster"] or _G.PData.Cooldowns2["RedBooster"].Time - os.time() <= 0 then
					InfoHover:ChangeAction(ActionBar, "Blue", false, "Use the Red Booster")
					Action = "RedBooster"
				else
					InfoHover:ChangeAction(ActionBar, "Red", false, "Use the Red Booster \n ("..Utilities:FormatTime(_G.PData.Cooldowns2["RedBooster"].Time - os.time())..")")
					Action = "RedBooster"
				end
			end

			if (Character.PrimaryPart.Position - workspace.Map.Toys.TotalHoney.Circle.Position).Magnitude <= 10 then
				InfoHover:ChangeAction(ActionBar, "Blue", true, "You've made "..Utils:CommaNumber(math.round(_G.PData.IStats.TotalHoney)).." Honey")
				Action = "TotalHoney"
			end
			if (Character.PrimaryPart.Position - workspace.Map.Toys.TermitePoints.Circle.Position).Magnitude <= 10 then
				InfoHover:ChangeAction(ActionBar, "Blue", true, "You have "..Utils:CommaNumber(math.round(_G.PData.IStats.TermiteScores)).." Termite Points")
				Action = "TermiteScores"
			end

			for _, Hive in pairs(workspace.Hives:GetChildren()) do
				if _G.PData.Vars.Hive == "" then
					--print(Hive)
					--print(Character.PrimaryPart.Position - Hive.Pad.Circle.Position)
					if (Character.PrimaryPart.Position - Hive.Pad.Circle.Position).Magnitude < 10 then
						--print(Character.PrimaryPart.Position - Hive.Pad.Circle.Position)
						if _G.PData.Vars.Hive == "" and Hive.Owner.Value == "" then
							InfoHover:ChangeAction(ActionBar, "Red", false, "Claim Hive")
							Action = "ClaimHive"
							ActionParams = Hive
						end
					end
				elseif _G.PData.Vars.Hive ~= ""  then
					local OwnHive = game.Workspace.Hives:FindFirstChild(_G.PData.Vars.Hive)
					if (Character.PrimaryPart.Position - OwnHive.Pad.Circle.Position).Magnitude < 10 then
						if OwnHive.Name == _G.PData.Vars.Hive and _G.PData.IStats.Pollen <= 0 then
							InfoHover:ChangeAction(ActionBar, "Blue", true, "To Make Honey, Collect Pollen From Flower Fields.")
							Action = "Turn"
							ActionParams = Hive
						elseif OwnHive.Name == _G.PData.Vars.Hive and _G.PData.IStats.Pollen > 0 and not _G.PData.Vars.Making then
							InfoHover:ChangeAction(ActionBar, "Blue", false, "Make Honey")
							Action = "MakeHoney"
							ActionParams = Hive
						elseif OwnHive.Name == _G.PData.Vars.Hive and _G.PData.IStats.Pollen > 0 and _G.PData.Vars.Making then
							InfoHover:ChangeAction(ActionBar, "Red", false, "Stop Making Honey")
							Action = "StopHoney"
							ActionParams = Hive
						elseif _G.PData.Vars.Hive and _G.PData.IStats.Pollen <= 0 then
							if _G.PData.Vars.Making == true then
								_G.PData.Vars.Making = false
							end
						end
					else
						if _G.PData.Vars.Making == true then
							_G.PData.Vars.Making = false
						end
					end
				end
			end
		end
	end)
end

return InfoHover
