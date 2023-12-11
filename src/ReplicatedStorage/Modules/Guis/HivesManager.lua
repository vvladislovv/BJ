local Remotes = game:GetService("ReplicatedStorage").Remotes
local Data = require(game.ServerScriptService.Server.Data)
local GetRealStats = require(game.ServerScriptService.Functions.GetRealStats)

local module = {}

function module.CreateSlot(Slot, Bee, Player, Gifted, BeeData, PData)
		local BeeModule = require(game.ReplicatedStorage.Bees[Bee])
		local OL = game.ServerStorage.Assets.Outline:Clone()
		local DC = game.ServerStorage.Assets.Dc:Clone()
		local Level = game.ServerStorage.Assets.Level:Clone()
		if Slot:FindFirstChild("GFTDOutline") then
			Slot:FindFirstChild("GFTDOutline"):Destroy()
		end
		if Gifted then
			local GF = game.ServerStorage.Assets.GFTDOutline:Clone()
			GF.Position = Slot.Position + Vector3.new(0,0,-0.35)
			GF.Parent = Slot
		end
		DC.UI.Decal.Image = BeeModule.Icon
		DC.UI.Decal.ImageColor3 = Color3.fromRGB(255,255,255)
		if BeeModule.Rarity == "Classic" then
			Slot.Color = Color3.fromRGB(108, 88, 75)
		elseif BeeModule.Rarity == "Rare" then
			Slot.Color = Color3.fromRGB(248, 248, 248)
		elseif BeeModule.Rarity == "Epic" then
		Slot.Color = Color3.fromRGB(245, 205, 48)
		elseif BeeModule.Rarity == "Legendary" then
		Slot.Color = Color3.fromRGB(18, 238, 212)
		elseif BeeModule.Rarity == "Mythic" then
		Slot.Color = Color3.fromRGB(180, 128, 255)
		elseif BeeModule.Rarity == "Event" then
			Slot.Color = Color3.fromRGB(132, 221, 109)
			PData.Inventory[BeeModule.Name.." Bee Egg"] = 0
			Remotes.SSound:FireClient(Player, "HatchEventBee", 1, true)
			game.ReplicatedStorage:WaitForChild("Remotes").DataUpdated:FireClient(Player, {"Inventory", _G.PData.Inventory})
		end
		Slot.Transparency = 0
		OL.Position = Slot.Position + Vector3.new(0,0,0.55)
		DC.Position = Slot.Position + Vector3.new(0,0,0.4)
		OL.Parent = Slot
		DC.Parent = Slot
		DC.ParticleEmitter.Rate = BeeModule.Particles
		if BeeData.Level > 0 then
			Level.UI.Lbl.Text = BeeData.Level
		else
			Level.UI.Lbl.Text = ""
		end
		Level.Position = Slot.Position + Vector3.new(1,0,0.55)
		Level.Parent = Slot
		Slot.BeeN.Value = Bee

		_G.Bees.new(Player, Slot, Bee, Gifted)
		GetRealStats.GetRealStats(Player, PData)
end

function module.ChangeBee(Slot, Bee, Player, Gifted, PData, OldBee)
		local BeeModule = require(game.ReplicatedStorage.Bees[Bee])
		workspace.Bees[Player.Name][Slot.Name]:Destroy()
		if Slot:FindFirstChild("GFTDOutline") then
			Slot:FindFirstChild("GFTDOutline"):Destroy()
		end
		local OL = Slot.Outline
		local DC = Slot.Dc

		if Gifted then
			local GF = game.ServerStorage.Assets.GFTDOutline:Clone()
			GF.Position = Slot.Position + Vector3.new(0,0,-0.35)
			GF.Parent = Slot
		end
		DC.UI.Decal.Image = BeeModule.Icon
		DC.UI.Decal.ImageColor3 = Color3.fromRGB(255,255,255)
		DC.ParticleEmitter.Rate = BeeModule.Particles
		if BeeModule.Rarity == "Classic" then
			Slot.Color = Color3.fromRGB(108, 88, 75)
		elseif BeeModule.Rarity == "Rare" then
			Slot.Color = Color3.fromRGB(248, 248, 248)
		elseif BeeModule.Rarity == "Epic" then
		Slot.Color = Color3.fromRGB(245, 205, 48)
	elseif BeeModule.Rarity == "Legendary" then
		Slot.Color = Color3.fromRGB(18, 238, 212)
	elseif BeeModule.Rarity == "Mythic" then
		Slot.Color = Color3.fromRGB(167, 94, 155)
		elseif BeeModule.Rarity == "Event" then
			Slot.Color = Color3.fromRGB(132, 221, 109)
		end
	
		Slot.BeeN.Value = Bee
		_G.Bees.new(Player, Slot, Bee, Gifted)
		GetRealStats.GetRealStats(Player, PData)
		if OldBee ~= nil then
			Remotes.CreateBeeSlot:FireClient(Player, PData, OldBee)
		end
		Remotes.CreateBeeSlot:FireClient(Player, PData)
end

--function module.DeleteBee(Slot, Player, PData, Bee)
--	if game.Players:FindFirstChild(Player.Name) then
		
--	end
--end

function module.GetSlot(Slot, Bee, Player, Gifted, BeeData)
	local BeeModule = require(game.ReplicatedStorage.Bees[Bee])
	local OL = game.ServerStorage.Assets.Outline:Clone()
	local DC = game.ServerStorage.Assets.Dc:Clone()
	local Level = game.ServerStorage.Assets.Level:Clone()
	if Gifted then
		local GF = game.ServerStorage.Assets.GFTDOutline:Clone()
		GF.Position = Slot.Position + Vector3.new(0,0,-0.35)
		GF.Parent = Slot
	end
	DC.UI.Decal.Image = BeeModule.Icon
	DC.UI.Decal.ImageColor3 = Color3.fromRGB(255,255,255)
	if BeeModule.Rarity == "Classic" then
		Slot.Color = Color3.fromRGB(108, 88, 75)
	elseif BeeModule.Rarity == "Rare" then
		Slot.Color = Color3.fromRGB(248, 248, 248)
	elseif BeeModule.Rarity == "Epic" then
		Slot.Color = Color3.fromRGB(245, 205, 48)
	elseif BeeModule.Rarity == "Legendary" then
		Slot.Color = Color3.fromRGB(18, 238, 212)
	elseif BeeModule.Rarity == "Mythic" then
		Slot.Color = Color3.fromRGB(147, 94, 238)
	elseif BeeModule.Rarity == "Event" then
		Slot.Color = Color3.fromRGB(132, 221, 109)
	end
		Slot.Transparency = 0
		OL.Position = Slot.Position + Vector3.new(0,0,0.55)
		DC.Position = Slot.Position + Vector3.new(0,0,0.4)
		OL.Parent = Slot
		DC.Parent = Slot
		DC.ParticleEmitter.Rate = BeeModule.Particles
		if BeeData.Level > 0 then
			Level.UI.Lbl.Text = BeeData.Level
		else
			Level.UI.Lbl.Text = ""
		end
		Level.Position = Slot.Position + Vector3.new(1,0,0.55)
		Level.Parent = Slot
		Slot.BeeN.Value = Bee
		_G.Bees.new(Player, Slot, Bee, Gifted)
end

function module.GetSlots(Client)
		local PData = Data:Get(Client)
		for i, Slot in pairs(PData.Bees) do
			if i <= PData.TotalSlots then
				if Slot.BeeName ~= "" then
				module.GetSlot(workspace.Hives[PData.Vars.Hive].Slots[i], Slot.BeeName, Client, Slot.Gifted, Slot)
			end
		end
	end
end

function module.NewSlot(PData, needs, nowslot)
	local AllSlots = workspace.Hives[PData.Vars.Hive].Slots
	local Template = game.ServerStorage.Assets.SlotTemplate:Clone()
		if nowslot <= 30 then
			if nowslot % 2 == 0 and nowslot % 5 ~= 0 then
				Template.Name = nowslot + 1
				Template.Position = AllSlots[nowslot].Position + Vector3.new(3.141,1.529,0)
				Template.Parent = AllSlots
			elseif nowslot % 2 ~= 0 and nowslot % 5 ~= 0 then
				Template.Name = nowslot + 1
				Template.Position = AllSlots[nowslot].Position + Vector3.new(3.141,-1.529,0)
				Template.Parent = AllSlots
			elseif nowslot % 5 == 0 then
				Template.Name = nowslot + 1
				Template.Position = AllSlots[nowslot].Position + Vector3.new(-3.141 * 4,1.529 * 2,0)
				Template.Parent = AllSlots

				workspace.Hives[PData.Vars.Hive].Pad.Circle.Display.Position += Vector3.new(0,1.529 * 2,0)
			end
		else
			if nowslot % 2 == 0 and nowslot % 5 ~= 0 then
				Template.Name = nowslot + 1
				local UpPos = -1.529
				if nowslot >= 36 and nowslot <= 41 then
					UpPos = 1.529
				elseif nowslot >= 42 and nowslot <= 45 then
					UpPos = -1.529
				elseif nowslot >= 46 and nowslot <= 50 then
					UpPos = 1.529
				elseif nowslot >= 52 then
					UpPos = -1.529
				end

				Template.Position = AllSlots[nowslot].Position + Vector3.new(3.141,UpPos,0)
				Template.Parent = AllSlots
				--PData.Bees[PData.TotalSlots] = {BeeName = "", Slot = 0, ELimit = 10, Energy = 10, Gifted = false, Bond = 0, Level = 1}
			elseif nowslot % 2 ~= 0 and nowslot % 5 ~= 0 then
				Template.Name = nowslot + 1
				local UpPos = 1.529
				if nowslot >= 36 and nowslot <= 40 then
					UpPos = -1.529
				elseif nowslot >= 41 and nowslot <= 45 then
					UpPos = 1.529
				elseif nowslot >= 46 and nowslot <= 50 then
					UpPos = -1.529
				elseif nowslot >= 52 then
					UpPos = 1.529
				end
				Template.Position = AllSlots[nowslot].Position + Vector3.new(3.141, UpPos, 0)
				Template.Parent = AllSlots
				--PData.Bees[PData.TotalSlots] = {BeeName = "", Slot = 0, ELimit = 10, Energy = 10, Gifted = false, Bond = 0, Level = 1}
			elseif nowslot % 5 == 0 then
				Template.Name = nowslot + 1
				Template.Position = AllSlots[nowslot].Position + Vector3.new(-3.141 * 4, 1.529 * 2, 0)
				Template.Parent = AllSlots
				workspace.Hives[PData.Vars.Hive].Pad.Circle.Display.Position += Vector3.new(0,1.529 * 2,0)
				--PData.Bees[PData.TotalSlots] = {BeeName = "", Slot = 0, ELimit = 10, Energy = 10, Gifted = false, Bond = 0, Level = 1}
		end
	end
end

return module
