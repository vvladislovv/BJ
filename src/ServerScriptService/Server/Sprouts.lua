local Players = game:GetService("Players")
local SSS = game:GetService("ServerScriptService")
local Rep = game.ReplicatedStorage
local Remotes = Rep.Remotes
local Modules = Rep.Modules
local Data = require(script.Parent.Data)
local Items = require(Modules.Items)
local Fields = require(script.Parent.GenerateFields)
local Utilities = require(game.ReplicatedStorage.Utilities)
local ts = game:GetService("TweenService")
local Utils = require(Modules.Utils)
local TokensM = require(game.ServerScriptService.Modules.TokensManager)
local minsize = Vector3.new(23, 22, 9)
local maxsize = Vector3.new(46, 45, 17)
local BoostsHandler = {} do

	function RandomSprout(Item)
		local Data = Items.SproutTypes[Item]
		local TotalWeight = 0

		for i,v in pairs(Data) do
			TotalWeight += v.Rarity
		end
		local Chance = math.random(1, TotalWeight)
		local coun = 0
		for i,v in pairs(Data) do
			coun += v.Rarity
			if coun >= Chance then
				return v.Name
			end
		end
	end

	function RToken(SproutType, Field)
		local Data = Items.SproutsDrop[SproutType][Field]
		local TotalWeight = 0

		for i,v in pairs(Data) do
			TotalWeight += v.Rarity
		end
		local Chance = math.random(0.1, TotalWeight)
		local coun = 0
		for i,v in pairs(Data) do
			coun += v.Rarity
			if coun >= Chance then
				return v.Name
			end
		end
	end

	Remotes.Sprout.Event:Connect(function(Player, Item, Field)
		spawn(function()
		local PData = Data:Get(Player)
		local SproutType = RandomSprout(Item)
		if Field == nil then
			Field = PData.Vars.Field
		end
		local SproutModel = Rep.Assets.Sprout:Clone()
		SproutModel.Color = Items.SproutsDrop[SproutType].SColor
		if Items.SproutsDrop[SproutType].Material then
			SproutModel.Material = Items.SproutsDrop[SproutType].Material
		end
		SproutModel.Spawn:Play()
		SproutModel.Position = workspace.FieldZones[Field].Position + Vector3.new(0,8,0)
		SproutModel.Needs.Value = Items.SproutsDrop[SproutType].HP * Items.FieldSproutHPMultiplie[Field]
		SproutModel.Parent = workspace.FieldZones[Field]
		SproutModel.Orientation = Vector3.new(0,math.random(-90,90),0)
		ts:Create(SproutModel, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = Vector3.new(23, 22, 9)}):Play()
		SproutModel.GuiPos.Gui.Frame.TextLabel.Text = Utils:CommaNumber(SproutModel.Grow.Value).."/"..Utils:CommaNumber(SproutModel.Needs.Value)
		SproutModel.GuiPos.Gui.AlwaysOnTop = true
		game.ReplicatedStorage:WaitForChild("Remotes").AlertClient:FireAllClients({
			Color = "Orange",
			Msg = "🌱"..Player.Name.." has planted a "..SproutType.." Sprout!"
		})
		
		local Sound1 = false
		local Sound2 = false
		local Sound3 = false
		local Timer = 0
		spawn(function()
			wait(420)
			if SproutModel then
				SproutModel.Grow.Value = -math.huge
				SproutModel.GuiPos.Gui.Enabled = false
				ts:Create(SproutModel, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = SproutModel.Position + Vector3.new(0,-SproutModel.Size.Y,0)}):Play()
				ts:Create(SproutModel, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = Vector3.new(0, 0, 0)}):Play()
				wait(3)
				SproutModel:Destroy()
			end
		end)
		local u4 = Color3.fromRGB(247, 59, 59)
		local u5 = Color3.fromRGB(255, 255, 255)
		SproutModel.Grow.Changed:Connect(function()
			local v19 = math.clamp(SproutModel.Grow.Value / SproutModel.Needs.Value, 0, 1)
			SproutModel.GuiPos.Gui.Frame.TextLabel.Text = Utils:CommaNumber(SproutModel.Grow.Value).."/"..Utils:CommaNumber(SproutModel.Needs.Value)
			SproutModel.GuiPos.Gui.Frame.TextLabel.TextColor3 = u5:Lerp(u4, v19 * v19 * 0.9)
			if SproutModel.Needs.Value / 3 <= SproutModel.Grow.Value and Sound1 == false then
				Sound1 = true
				SproutModel.Size1:Play()
				ts:Create(SproutModel, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = SproutModel.Position + Vector3.new(0,3,0)}):Play()
				ts:Create(SproutModel, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = Vector3.new(32, 31, 12)}):Play()
			elseif  SproutModel.Needs.Value / 2 <= SproutModel.Grow.Value and Sound2 == false and Sound1 == true then
				Sound2 = true
				SproutModel.Size2:Play()
				ts:Create(SproutModel, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = SproutModel.Position + Vector3.new(0,6,0)}):Play()
				ts:Create(SproutModel, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = Vector3.new(44, 42, 16)}):Play()
				SproutModel.GuiPos.Gui.Size = UDim2.new(25,0,6,0)
			elseif  SproutModel.Needs.Value / 1.25 <= SproutModel.Grow.Value and Sound3 == false and Sound2 == true and Sound1 == true then
				Sound3 = true
				SproutModel.Size3:Play()
				ts:Create(SproutModel, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Position = SproutModel.Position + Vector3.new(0,10,0)}):Play()
				ts:Create(SproutModel, TweenInfo.new(0.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Size = Vector3.new(63, 60, 22)}):Play()
				SproutModel.GuiPos.Gui.Size = UDim2.new(30,0,8,0)
			elseif SproutModel.Grow.Value >= SproutModel.Needs.Value then
				SproutModel.GuiPos.Gui.Enabled = false
				SproutModel.Grow.Value = -math.huge
				SproutModel.Collected:Play()
				ts:Create(SproutModel, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = SproutModel.Position + Vector3.new(0,-SproutModel.Size.Y,0)}):Play()
				ts:Create(SproutModel, TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = Vector3.new(0, 0, 0)}):Play()
				spawn(function()
				wait(3)
				SproutModel:Destroy()
				end)
					for i = 1, Items.SproutsDrop[SproutType].Tokens do
						if i < Items.SproutsDrop[SproutType].Tokens then
							spawn(function()
								local RandomToken = RToken(SproutType, Field)
								local Flowers = workspace.Fields[Field]:GetChildren()
								local RandomFlower = Flowers[math.random(1, #Flowers)]
								TokensM.SpawnToken({
									Position = RandomFlower.Position,
									Cooldown = 15,
									Token = {
										Item = RandomToken,
										Amount = Items.SproutsDrop[SproutType][Field][RandomToken].APT,
										Type = "Drop",
									},
									Resourse = "Sprout",
								})
							end)
							wait(0.15)
						end
					end
				end
			end)
		end)
	end)
end

return BoostsHandler