local Items = require(game.ReplicatedStorage.Modules.Items)
local ts = game:GetService("TweenService")
local Data = require(game.ServerScriptService.Server.Data)
local Remotes = game.ReplicatedStorage.Remotes
local VisualEvent = Remotes.Visual
local Utils = require(game.ReplicatedStorage.Modules.Utils)

function ServerQuestRoad(Client, PData, Token, TokenColor, TokenType)
	for _, NPC in pairs(PData.Quests2) do
		for i, Task in pairs(NPC) do
			if Token then
				if Task.Type == "AnyTokens" then
					NPC[i].StartAmount += 1
					if NPC[i].StartAmount >= NPC[i].NeedAmount then
						NPC[i].StartAmount = NPC[i].NeedAmount
					end
				end
				if Task.Res then
					if Token:FindFirstChild("Res").Value == Task.Res then
						NPC[i].StartAmount += 1
						if NPC[i].StartAmount >= NPC[i].NeedAmount then
							NPC[i].StartAmount = NPC[i].NeedAmount
						end
					end
				end
				if Task.Token then
					if Token:FindFirstChild("Item").Value == Task.Token then
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

local Tokens = {} do
	Tokens.Types = {
		["Honey"] = {
			TKColor = Color3.fromRGB(203, 167, 37),
			Image = "http://www.roblox.com/asset/?id=10315383929",
		},
		["Cookie"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Gifted Silver Egg"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Gifted Golden Egg"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Gifted Diamond Egg"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Shroom"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Firefly Vial"] = {
			TKColor = Color3.fromRGB(118, 181, 108),
			MaterialT = Enum.Material.Neon,
		},
		["Fertilizer"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Silver Egg"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Basic Egg"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Golden Egg"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Diamond Egg"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Seed"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Strawberry"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Blueberry"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Energy Drink"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Butter"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Blueberry Juice"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Strawberry Juice"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Ticket"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Royal Jelly"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
		["Spoiled Cookie"] = {
			TKColor = Color3.fromRGB(114, 234, 236),
		},
	}
	
	function Tokens.GenerateToken(Info)
		local TokenModule = Tokens.Types[Info.Token.Item]
		local Stamp = script[Info.Stamp]:Clone()
		Stamp.Parent = game.Workspace.Tokens
		Stamp:SetPrimaryPartCFrame(CFrame.new(Info.Position - Vector3.new(0,5,0)))

		for _, Obj in pairs(Stamp:GetChildren()) do
			if Obj.Name ~= "Root" and "Am" then
				if Items.Eggs[Info.Token.Item] then
				local Token = script.Token:Clone()
				Token.Position = Obj.Position
				Token.Type.Value = Info.Token.Type
				Token.Color = TokenModule.TKColor
				Token.Name = "Honey"
				Token.BackDecal.Texture = Items.Eggs[Info.Token.Item].Image
				Token.FrontDecal.Texture = Items.Eggs[Info.Token.Item].Image
				Token.Amount.Value = math.round(Info.Token.Amount / Stamp.Root.Am.Value)
				Token.Item.Value = Info.Token.Item
				
				Token.Parent = game.Workspace.Tokens[Info.Player.Name]
				game.ReplicatedStorage.Remotes.Token:FireAllClients(Token)
				spawn(function()
					wait(15)
					Token:Destroy()
				end)
				end
			end
		end
		wait(1)
		Stamp:Destroy()
	end
	
	function Tokens.SpawnToken(Info)
		local TokenModule = Tokens.Types[Info.Token.Item]
		local Token = script.Token:Clone()
		Token.Position = Info.Position + Vector3.new(0,2.75,0)
		Token.Type.Value = Info.Token.Type
		Token.Color = TokenModule.TKColor
		if Info.Token.Item ~= "Honey" then
			Token.BackDecal.Texture = Items.Eggs[Info.Token.Item].Image
			Token.FrontDecal.Texture = Items.Eggs[Info.Token.Item].Image
		else
			Token.BackDecal.Texture = Tokens.Types.Honey.Image
			Token.FrontDecal.Texture = Tokens.Types.Honey.Image
		end
		Token.Amount.Value = Info.Token.Amount
		Token.Item.Value = Info.Token.Item
		Token.Res.Value = Info.Resourse
		Token.Parent = game.Workspace.ServerTokens
		if Token.Item.Value == "Firefly Vial" then
			Token.Material = "Neon"
		end
		game.ReplicatedStorage.Remotes.ServerToken:Fire(Token)
		game.ReplicatedStorage.Remotes.Token:FireAllClients(Token)
				
		Token.Touched:Connect(function(Hit)
			if game.Players:FindFirstChild(Hit.Parent.Name) then
				Token.CanTouch = false
					local Client = game.Players:FindFirstChild(Hit.Parent.Name)
					if Client then
						spawn(function()
							local PData = Data:Get(Client)
							if Token:FindFirstChild("Type").Value == "Drop" then
								if Token:FindFirstChild("Item").Value ~= "Honey" then
									PData.Inventory[Token.Item.Value] += Token.Amount.Value
									game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Client, {"Inventory", PData.Inventory})
									Remotes.AlertClient:FireClient(Client, {
										Color = "Blue",
										Msg = "+"..Utils:CommaNumber(Token.Amount.Value).." "..Token.Item.Value.." (from "..Token.Res.Value..")"
									})
								else
									local AmountOfHoney = math.round(((Token.Amount.Value + math.random(100,500)) * PData.AllStats["Honey From Tokens"] / 100))
									PData.IStats["Honey"] += AmountOfHoney
									PData.IStats["TotalHoney"] += AmountOfHoney
									PData.IStats["DailyHoney"] += AmountOfHoney
									if game.Players:FindFirstChild(Client.Name) then
										VisualEvent:FireClient(Client, {Pos = game.Workspace:FindFirstChild(Client.Name).PrimaryPart, Amount = AmountOfHoney, Color = "Honey"})
										game.ReplicatedStorage:FindFirstChild("Remotes").DataUpdated:FireClient(Client, {"IStats", PData.IStats})
									end
										Remotes.AlertClient:FireClient(Client, {
										Color = "Blue",
										Msg = "+"..Utils:CommaNumber(AmountOfHoney).." Honey",
									})
								end
						elseif Token.Type.Value == "Boost" then
							game.ReplicatedStorage:FindFirstChild("Remotes").Boost:Fire(Client, Token.Name, 1)
						end
						ServerQuestRoad(Client, PData, Token)
						wait(1)
						Token:Destroy()
					end)
				end
			end
		end)
		spawn(function()
			wait(Info.Cooldown)
			wait(3)
			Token:Destroy()
		end)
	end
end

return Tokens
