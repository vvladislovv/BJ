local Hydrants = require(game.ReplicatedStorage.Modules.Hydrants)
local TS = game:GetService("TweenService")
local MFields = require(game.ServerScriptService:WaitForChild("Server").GenerateFields)
local Utils = require(game.ReplicatedStorage.Modules.Utils)

local function GetPlayerFlower2(Player)
	local raylol = Ray.new(Player.Character.HumanoidRootPart.Position, Vector3.new(0,-10,0))
	local part = workspace:FindPartOnRayWithWhitelist(raylol, {workspace.Fields})
	if part then
		return part.Position
	end
end
local function getHFolder(Player)
	if not workspace.PlayerHydrants:FindFirstChild(Player.Name) then
		local gb = Instance.new("Folder", workspace.PlayerHydrants)
		gb.Name = Player.Name
		return gb
	else
		return workspace.PlayerHydrants:FindFirstChild(Player.Name)
	end
end

local function ActivateHydrant(Hydrant)
	spawn(function()
		local info = require(game.ReplicatedStorage.Modules.Hydrants).HStats[Hydrant.Name]
		
		repeat
			if Hydrant ~= nil and Hydrant:FindFirstChild("Main") then
			local Ring = game.ReplicatedStorage.Ring:Clone()
			Ring.Parent = Hydrant
			Ring.Size = Vector3.new(0.1,0.1,0.1)
			Ring.Position = Hydrant.Main.Attachment.WorldPosition
			
			spawn(function()
				if Hydrant and Hydrant:FindFirstChild("Main") then
					Hydrant:FindFirstChild("Main").Blob:Play()
				end
				TS:Create(Ring, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = Vector3.new(info.Radius, 3, info.Radius)}):Play()
			end)
			
			spawn(function()
			if Hydrant and Hydrant:FindFirstChild("Main") then
			for _, Pollen in pairs(game.Workspace.Fields[Hydrant.Main.Field.Value]:GetChildren()) do
				if Pollen:IsA("BasePart") then
					if (Pollen.Position - Hydrant.Main.Position).Magnitude <= info.Radius then

						local FieldInfo = MFields.Flowers[Pollen.FlowerID.Value]
						if Pollen.Position.Y <= FieldInfo.MinPosition then
							Pollen.Position = Vector3.new(Pollen.Position.X, FieldInfo.MinPosition, Pollen.Position.Z)
							Pollen.TopTexture.Transparency = (MFields.Flowers[Pollen.FlowerID.Value].MaxPosition-Pollen.Position.Y)/2.5
						end
						if Pollen.Position.Y < FieldInfo.MaxPosition then
							local DistanceToMax = tonumber(FieldInfo.MaxPosition - Pollen.Position.Y)
							Pollen.TopTexture.Transparency = (MFields.Flowers[Pollen.FlowerID.Value].MaxPosition-Pollen.Position.Y)/2.5

							if DistanceToMax < info.Power then
								Pollen.Position += Vector3.new(0, DistanceToMax, 0)
							else
								Pollen.Position += Vector3.new(0, info.Power, 0)
							end
							if Pollen.Position.Y > FieldInfo.MaxPosition then
								Pollen.Position = Vector3.new(Pollen.Position.X, FieldInfo.MaxPosition, Pollen.Position.Z)
							end
							Pollen.TopTexture.Transparency = (MFields.Flowers[Pollen.FlowerID.Value].MaxPosition-Pollen.Position.Y)/2.5
						end
					end

				end
					end
				end
			end)
	
			wait(0.4)
			spawn(function()
				TS:Create(Ring, TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Position = Ring.Position - Vector3.new(0,Ring.Size.Y,0)}):Play()
				TS:Create(Ring, TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = Vector3.new(info.Radius * 3, 0.1, info.Radius * 3)}):Play()
				TS:Create(Ring, TweenInfo.new(2, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Transparency = 1}):Play()
				wait(0.5)
			end)
			
			wait(info.Rate)
			Ring:Destroy()
			else
				break
			end
		until
		Hydrant == nil
	end)
end

local module = {}

function module.PlaceHydrant(Player, PData)
	local MaxHydants = Hydrants.HStats[PData.Equipment.Hydrant].Count
	if PData.Vars.PlacedHydrants < MaxHydants then
		PData.Vars.PlacedHydrants += 1
		local Model = game.ReplicatedStorage.Assets.Hydrants[PData.Equipment.Hydrant]:Clone()
		Model.Main.Field.Value = PData.Vars.Field
		Model.Parent = getHFolder(Player)
		Model:SetPrimaryPartCFrame(CFrame.new(GetPlayerFlower2(Player)))
		wait(Hydrants.HStats[PData.Equipment.Hydrant].Setup)
		local Blub = script.Blob:Clone()
		Blub.Parent = Model:FindFirstChild("Main")
		if Model and Model.PrimaryPart then
			Utils:TweenModel(Model, Model.PrimaryPart.CFrame + Vector3.new(0,3,0) , TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out))
			ActivateHydrant(Model)
		end
	else
		getHFolder(Player):FindFirstChild(PData.Equipment.Hydrant):Destroy()
		local Model = game.ReplicatedStorage.Assets.Hydrants[PData.Equipment.Hydrant]:Clone()
		Model.Main.Field.Value = PData.Vars.Field
		Model.Parent = getHFolder(Player)
		Model:SetPrimaryPartCFrame(CFrame.new(GetPlayerFlower2(Player)))
		wait(Hydrants.HStats[PData.Equipment.Hydrant].Setup)
		local Blub = script.Blob:Clone()
		Blub.Parent = Model:FindFirstChild("Main")
		if Model and Model.PrimaryPart then
			Utils:TweenModel(Model, Model.PrimaryPart.CFrame + Vector3.new(0,3,0) , TweenInfo.new(1, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out))
			ActivateHydrant(Model)
		end
	end
end

return module
