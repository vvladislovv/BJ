local Data = require(game.ServerScriptService.Server.Data)
local AmuletsModule = require(game.ReplicatedStorage.Modules.AmuletsModule)
local Remotes = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
local GetRealStats = require(game.ServerScriptService.Functions.GetRealStats)

local module = {}

function module:GetAmulets(Player)
	local Character = Player.Character or Player.CharacterAdded:Wait()
	local PData = Data:Get(Player)
	if Character:FindFirstChild("Amulets") then
		Character:FindFirstChild("Amulets"):Destroy()
	end
	if not Character:FindFirstChild("Amulets") then
		local Folder = Instance.new("Folder")
		Folder.Name = "Amulets"
		Folder.Parent = Character
	end
	for i,v in pairs(PData.Amuletes) do
		if game.ReplicatedStorage.Assets.Amulets:FindFirstChild(i) and not Character:FindFirstChild("Amulets"):FindFirstChild(i) then
			local Amulet = game.ReplicatedStorage.Assets.Amulets:FindFirstChild(i):Clone()
			Amulet.Parent = Character:FindFirstChild("Amulets")
			if Amulet:IsA("Model") then
				Amulet:SetPrimaryPartCFrame(Character.PrimaryPart.CFrame)
				spawn(function()
					repeat
						wait()
						if Amulet and Amulet.PrimaryPart then
							if string.find(i, "Star") then
								Amulet.PrimaryPart:FindFirstChild("BP").Position = Character.PrimaryPart.Position + Vector3.new(0,10,0)
								Amulet.PrimaryPart:FindFirstChild("BG").CFrame = Character.PrimaryPart.CFrame
							elseif string.find(i, "Frog") then
								Amulet.PrimaryPart:FindFirstChild("BP").Position = Character.PrimaryPart.Position + Vector3.new(3,7,0)
								Amulet.PrimaryPart:FindFirstChild("BG").CFrame = Character.PrimaryPart.CFrame
							elseif string.find(i, "Termit") then
								Amulet.PrimaryPart:FindFirstChild("BP").Position = Character.PrimaryPart.Position + Vector3.new(-3,7,0)
								Amulet.PrimaryPart:FindFirstChild("BG").CFrame = Character.PrimaryPart.CFrame
							end
						else
							break
						end
					until
					not Amulet or not Character or not Character.Parent
				end)
			elseif Amulet:IsA("Part") or Amulet:IsA("MeshPart") or Amulet:IsA("UnionOperation") then
				Amulet.Position = Character.PrimaryPart.Position
				spawn(function()
					repeat
						wait()
						Amulet:FindFirstChild("BP").Position = Character.PrimaryPart.Position + Vector3.new(0,10,0)
						Amulet:FindFirstChild("BG").CFrame = Character.PrimaryPart.CFrame
					until
					not Amulet or not Character or not Character.Parent
				end)
			end
		end
	end
end

function module:GetAmulet(Player, Type)
	local PData = Data:Get(Player)
	if AmuletsModule.Amulets[Type] then
		local Stat = AmuletsModule.Amulets[Type].Bonuses
		local Table = {}
		for i,v in pairs(Stat) do
			if not v.Chance then
				Table[v.Stat] = {Amount = math.random(v.Amount[1], v.Amount[2]), T = v.Type}
			else
				local rd = math.random(1,100)
				if rd <= v.Chance then
					Table[v.Stat] = {Amount = math.random(v.Amount[1], v.Amount[2]), T = v.Type}
				end
			end
		end
		--print(Table)
		local Old = false
		local OldTable
		local OldAmuletName
		local Mob = AmuletsModule.Amulets[Type].Mob
		for i,v in pairs(PData.OldAmuletes) do
			if string.find(i, Mob) then
				Old = true
				OldTable = v
				OldAmuletName = i
				break
			end
		end
		if AmuletsModule.Amulets[OldAmuletName] then
			Remotes.AmuletChoose:FireClient(Player, Old, Table, OldTable, AmuletsModule.Amulets[Type].Image, AmuletsModule.Amulets[OldAmuletName].Image)
		else
			Remotes.AmuletChoose:FireClient(Player, Old, Table, OldTable, AmuletsModule.Amulets[Type].Image)
		end
		
		Remotes.ServerAmulet.OnServerEvent:Connect(function(Player, TP)
			if TP == "New" then
				if PData.OldAmuletes[OldAmuletName] then
					PData.OldAmuletes[OldAmuletName] = nil
				end
				if PData.Amuletes[OldAmuletName] then
					PData.Amuletes[OldAmuletName] = nil
				end
				
				PData.Amuletes[Type] = Table
				PData.OldAmuletes[Type] = Table
				GetRealStats.GetRealStats(Player, PData)
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Amuletes", PData.Amuletes})
				game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"OldAmuletes", PData.OldAmuletes})
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = " Equipped New ".."["..Type.."]".." Amulet!"
				})
				module:GetAmulets(Player)
			elseif TP == "Old" then
				Remotes.AlertClient:FireClient(Player, {
					Color = "Blue",
					Msg = " Equipped Old ".."["..OldAmuletName.."]".." Amulet!"
				})
				GetRealStats.GetRealStats(Player, PData)
			end
		end)
	end
end

return module
