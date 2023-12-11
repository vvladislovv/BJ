local VisualEvent = game.ReplicatedStorage.Remotes.Visual
local module = {}

function module.Spawn(p3, Player)
	if p3.Tokens then
		local HoneyAmount = 0
		local Bee = game.Workspace.Bees[Player.Name]:FindFirstChild(p3.Bee)
		local Character = game.Workspace:FindFirstChild(Player.Name)
		for i,v in pairs(p3.Tokens) do
			if v.Collision == true then
			HoneyAmount += 10
			spawn(function()
				if game.ReplicatedStorage.Boosts:FindFirstChild(v.TName) then
					game.ReplicatedStorage.Remotes.Boost:Fire(Player, v.TName, 1)
				elseif game.ServerScriptService.Modules.BeesAbility:FindFirstChild(v.TName) then
					if string.find(v.TName, "Bomb") then
						game.ReplicatedStorage.Remotes.Boost:Fire(Player, "Bombo Combo", 1)
					end
					require(game.ServerScriptService.Modules.BeesAbility[v.TName]).Spawn({
						PData = p3.PData,
						TokenPos = v.Pos,
						Bee = v.Bee,
					}, Player)
				end
			end)
			end
		end
		if p3.PData.Bees[tonumber(Bee.Name)].Level > 0 then
			HoneyAmount = math.round(HoneyAmount * p3.PData.Bees[tonumber(Bee.Name)].Level)
		end
		if HoneyAmount > 0 then
			p3.PData.IStats.Honey += HoneyAmount
			game.ReplicatedStorage.Remotes.SSound:FireClient(Player, "Purchase",1,true)
			VisualEvent:FireClient(Player, {Pos = Character.PrimaryPart, Amount = HoneyAmount, Color = "Honey"})
		end
	end
end

return module
