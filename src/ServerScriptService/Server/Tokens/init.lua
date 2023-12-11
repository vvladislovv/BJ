local Players = game:GetService("Players")
local Rep = game.ReplicatedStorage
local Remotes = Rep.Remotes
local Modules = Rep.Modules
local Data = require(script.Parent.Data)
local Items = require(Modules.Items)
local Fields = require(script.Parent.GenerateFields)
local ts = game:GetService("TweenService")
local Utils = require(Modules.Utils)
local TokenDeb = false
local BDeb = false
local SPDeb = false
local DataStore2 = require(game.ServerScriptService.DataStore2)
local TweenForCollect = TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false)
local TweenForCollect2 = TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out, 0, false)
local A = 1
local Time = 0
local NightTime = 900
local DayTime = 90
local NightDeb = false
local EventActive = false
local deb = false
local Day
local Night
local Lighting = game.Lighting
local TokensManager = require(game.ServerScriptService.Modules.TokensManager)
local BeeMove = game.ReplicatedStorage.Assets.BeesAnimations:WaitForChild('Move')
local VisualEvent = game.ReplicatedStorage.Remotes.Visual

local BoostsHandler = {} do
	local function GetRandomField()
		local Fields = workspace.FieldZones:GetChildren()
		return Fields[math.random(1,#Fields)]
	end
	
	local function WaitUntilReached(BeeModel, Magnitude)
		if BeeModel and BeeModel:FindFirstChild("Body") then
			repeat wait() if not BeeModel:FindFirstChild("Body") then break end
			until (BeeModel.Body.Position - BeeModel.Positioner.Position).Magnitude <= (Magnitude or 0.7) --or PositionerDist(BeeModel.Positioner, HRP)
		else
			return
		end
	end

	local function Rotation(BeeModel, Timer)
		if BeeModel.Body then
			local a = 0
			repeat
				wait(0.2)
				a = a + 0.2
				if BeeModel.Body then
					BeeModel.Body.BodyGyro.CFrame *= CFrame.Angles(0, 180, 0)
				end
			until
			a >= Timer
		end
	end
	
	function ClientQuestRoad(Client, PData, Token, TokenColor, TokenType)
		for _, NPC in pairs(PData.Quests2) do
			for i, Task in pairs(NPC) do
				if Token then
					if Task.Type == "AnyTokens" then
						NPC[i].StartAmount += 1
						if NPC[i].StartAmount >= NPC[i].NeedAmount then
							NPC[i].StartAmount = NPC[i].NeedAmount
						end
					end
					if TokenColor then
						if TokenColor == Task.TokenColor then
							NPC[i].StartAmount += 1
							if NPC[i].StartAmount >= NPC[i].NeedAmount then
								NPC[i].StartAmount = NPC[i].NeedAmount
							end
						end
					end
					if TokenType then
						if TokenType == Task.TokenType then
							NPC[i].StartAmount += 1
							if NPC[i].StartAmount >= NPC[i].NeedAmount then
								NPC[i].StartAmount = NPC[i].NeedAmount
							end
						end
						if TokenColor.." "..TokenType == Task.TokenType then
							NPC[i].StartAmount += 1
							if NPC[i].StartAmount >= NPC[i].NeedAmount then
								NPC[i].StartAmount = NPC[i].NeedAmount
							end
						end
					end
				end
			end
			if game.Players:FindFirstChild(Client.Name) then
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Quests2", PData.Quests2})
			end
		end
	end

	
	function CheckTreasures()
		local TDeb = false
		for _, TToken in pairs(workspace.Treasures:GetChildren()) do
			TToken.Touched:Connect(function(hit)
				if not TDeb and game.Players:FindFirstChild(hit.Parent.Name) then
					local Client = game.Players:GetPlayerFromCharacter(hit.Parent)
					local PData = Data:Get(Client)
					if not PData.Treasures[TToken.Name] then
						TDeb = true
						PData.Treasures[TToken.Name] = true
						if game.Players:FindFirstChild(Client.Name) then
							game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"Treasures", PData["Treasures"]})
						end
						if TToken:FindFirstChild("AType") then
							PData[TToken.AType.Value][TToken.Type.Value] += TToken.Amount.Value
							if game.Players:FindFirstChild(Client.Name) then
								game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {TToken.AType.Value, PData[TToken.AType.Value]})
							end
							Remotes.AlertClient:FireClient(Client, {
									Color = "Blue",
									Msg = "+ "..TToken.Amount.Value.." "..TToken.Type.Value
							})
						elseif TToken:FindFirstChild("Boost") then
							game.ReplicatedStorage.Remotes.Boost:Fire(Client, TToken.Boost.Value, TToken.Amount.Value)
							
							Remotes.AlertClient:FireClient(Client, {
								Color = "Blue",
								Msg = "+ "..TToken.Amount.Value.." "..TToken.Type.Value
							})
						else
							if TToken.Type.Value == "Honey" then
								PData.IStats.Honey += TToken.Amount.Value
								PData.IStats.TotalHoney += TToken.Amount.Value
								PData.IStats.DailyHoney += TToken.Amount.Value
								if game.Players:FindFirstChild(Client.Name) then
									VisualEvent:FireClient(Client, {Pos = game.Workspace:FindFirstChild(Client.Name).PrimaryPart, Amount = TToken.Amount.Value, Color = "Honey"})
									game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Client, {"IStats", PData.IStats})
								end
								Remotes.AlertClient:FireClient(Client, {
									Color = "Blue",
									Msg = "+ "..TToken.Amount.Value.." "..TToken.Type.Value
								})
							end
						end
					end
					wait(0.5)
					TDeb = false
				end
			end)
		end
	end
	
	function CheckPassives(TokenType, PData, Character)
		for PassiveName, STable in pairs(PData.Passives) do
			if STable.AvaibleTokens[TokenType] then
				STable.Amount += 1
				if game.Players:FindFirstChild(game.Players:GetPlayerFromCharacter(Character)) then
					game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(game.Players:GetPlayerFromCharacter(Character), {"Passives", PData["Passives"]})
				end
				if STable.Amount >= STable.Need then
					STable.Amount = 0
					spawn(function()
						require(game.ReplicatedStorage.Passives[PassiveName]).Spawn({
							PData = PData,
							Field = PData.Vars.Field,
							Character = Character,
						})
					end)
				end
			end
		end
	end
	
	Remotes.BeeTokenData.OnServerEvent:Connect(function(Player, Token, Position, id, TokenColor, TokenType, BeeModel, Tokens)
		local PData = Data:Get(Player)
		if PData.Vars.Tokens[id] then
			PData.Vars.Tokens[id] = nil
			if game.ReplicatedStorage.Boosts:FindFirstChild(Token) then
				game.ReplicatedStorage.Remotes.Boost:Fire(Player, Token, 1)
			elseif game.ServerScriptService.Modules.BeesAbility:FindFirstChild(Token) then
				if string.find(Token, "Bomb") then
					game.ReplicatedStorage.Remotes.Boost:Fire(Player, "Bombo Combo", 1)
				end
				require(game.ServerScriptService.Modules.BeesAbility[Token]).Spawn({
					PData = PData,
					TokenPos = Position,
					Bee = BeeModel,
					Tokens = Tokens
				}, Player)
			end
			CheckPassives(Token, PData, game.Workspace:FindFirstChild(Player.Name))
			ClientQuestRoad(Player, PData, Token, TokenColor, TokenType)
		end
	end)
	CheckTreasures()
end

return BoostsHandler