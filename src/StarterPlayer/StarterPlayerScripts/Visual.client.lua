local Rep = game:GetService("ReplicatedStorage")
local Visual = Rep:FindFirstChild("Remotes"):FindFirstChild("Visual")
local PollenText = game.ReplicatedStorage.Assets.PollenText
local Player = game.Players.LocalPlayer
local Character = game.Workspace:FindFirstChild(Player.Name)
local TS = game:GetService("TweenService")
local Utils = require(game.ReplicatedStorage.Modules.Utils)

local Colors = {
	Honey = Color3.fromRGB(255, 243, 73),
	Red = Color3.fromRGB(255, 88, 88),
	Blue = Color3.fromRGB(117, 154, 255),
	White = Color3.fromRGB(255, 255, 255),
	Damage = Color3.fromRGB(255, 65, 65),
	Miss = Color3.fromRGB(216, 216, 216),
	Crit = Color3.fromRGB(157, 255, 146)
}
local function GetSize(Amount, Crit)
	local SizeValue = 0
	if Amount <= 100 then
		SizeValue = 2
	elseif Amount > 100 and Amount <= 1000 then
		SizeValue = 3
	elseif Amount > 1000 and Amount <= 5000 then
		SizeValue = 4
	elseif Amount > 5000 and Amount <= 10000 then
		SizeValue = 5
	elseif Amount > 10000 and Amount <= 25000 then
		SizeValue = 6
	elseif Amount > 25000 and Amount <= 50000 then
		SizeValue = 7
	elseif Amount > 50000 and Amount <= 100000 then
		SizeValue = 9
	elseif Amount > 100000 and Amount <= 1000000 then
		SizeValue = 12
	elseif Amount > 1000000 and Amount <= 5000000 then
		SizeValue = 15
	elseif Amount > 5000000 then
		SizeValue = 25
	end
	if Crit and Crit == true and _G.PData then
		SizeValue *= (_G.PData.AllStats["Critical Power"])
	end
	return UDim2.fromScale(SizeValue, SizeValue / 2)
end
local function Crit(Text)
	spawn(function()
		local RotationAngle = 15
		local BasicColor = Text.TextColor3
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Rotation = RotationAngle}):Play()
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextColor3 = Colors.Crit}):Play()
		wait(0.25)
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Rotation = -RotationAngle}):Play()
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextColor3 = BasicColor}):Play()
		wait(0.25)
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Rotation = RotationAngle}):Play()
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextColor3 = Colors.Crit}):Play()
		wait(0.25)
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Rotation = -RotationAngle}):Play()
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextColor3 = BasicColor}):Play()
		wait(0.25)
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Rotation = RotationAngle}):Play()
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextColor3 = Colors.Crit}):Play()
		wait(0.25)
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Rotation = -RotationAngle}):Play()
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextColor3 = BasicColor}):Play()
		wait(0.25)
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Rotation = RotationAngle}):Play()
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextColor3 = Colors.Crit}):Play()
		wait(0.25)
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Rotation = -RotationAngle}):Play()
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextColor3 = BasicColor}):Play()
		wait(0.25)
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Rotation = RotationAngle}):Play()
		TS:Create(Text, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {TextColor3 = Colors.Crit}):Play()
		wait(0.25)
	end)
end

local HoneyPos = 0
local DamagePos = 0

local function ray(VP)
	local ray = RaycastParams.new()
	ray.FilterDescendantsInstances = {game.Workspace.Fields}
	ray.FilterType = Enum.RaycastFilterType.Whitelist
	local raycast = workspace:Raycast(VP.Position, Vector3.new(0,-100,0), ray)
	if raycast and raycast.Instance then
		local Hit = raycast.Instance
		if Hit.Name == "Flower" then
			VP.Position = Vector3.new(Hit.Position.X, VP.Position.Y, Hit.Position.Z)
		end
	end
end

local function getlocation(VP)
	for count = 1,2 do
	for i,v in pairs(game.Workspace.VisualFlowers:GetChildren()) do
		for d,l in pairs(game.Workspace.VisualFlowers:GetChildren()) do
			if l ~= v then
				if (v.Position - l.Position).Magnitude <= 0.5 then
					if tonumber(l.Name) > tonumber(v.Name) then
						l.Position = v.Position + Vector3.new(0,v.BillboardGui.Size.Height.Scale,0)
					else
						v.Position = l.Position + Vector3.new(0,l.BillboardGui.Size.Height.Scale,0)
					end
				end
			end
		end
		end
	end
end

Visual.OnClientEvent:Connect(function(Tab)
	local VP = PollenText:Clone()
	local Character = game.Workspace:FindFirstChild(Player.Name)
	VP.Parent = workspace.VisualFlowers
	VP.BillboardGui.TxT.Size = UDim2.new(0,0,0,0)
	TS:Create(VP.BillboardGui.TxT, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {Size = UDim2.new(1,0,1,0)}):Play()
	VP.BillboardGui.Size = GetSize(Tab.Amount, Tab.Crit)
	VP.Name = Tab.Amount
	
	if Tab.Color ~= "Honey" and Tab.Color ~= "Damage" then
		if Tab.Pos then
			if typeof(Tab.Pos) == "Vector3" then
				VP.Position = Tab.Pos
			else
				VP.Position = Tab.Pos.Position
			end
		else
			VP.Position = Character.PrimaryPart.Position
		end
		VP.Position += Vector3.new(0,2,0)
		ray(VP)
		VP.BillboardGui.TxT.Text = "+"..Utils:CommaNumber(Tab.Amount)
		VP.BillboardGui.TxT.TextColor3 = Colors[Tab.Color]
		getlocation(VP)
		
		if Tab.Crit and Tab.Crit == true then
			Crit(VP.BillboardGui.TxT)
		end
	elseif Tab.Color == "Honey" then
		VP.Parent = workspace.VisualHoney
		VP.Position = Character.PrimaryPart.Position + Vector3.new(0,4+HoneyPos,0)
		VP.BillboardGui.TxT.Text = "+"..Utils:CommaNumber(Tab.Amount)
		VP.BillboardGui.TxT.TextColor3 = Colors.Honey
		HoneyPos += VP.BillboardGui.Size.Height.Scale
		if HoneyPos > 6 then
			HoneyPos = 0
		end
	elseif Tab.Color == "Damage" then
		VP.Parent = workspace.VisualDamage
		if Tab.Pos then
		VP.Position = Tab.Pos.Position + Vector3.new(0,4+DamagePos,0)
		local DPos = DamagePos
		spawn(function()
			repeat wait()
				VP.Position = Vector3.new(Tab.Pos.Position.X , Tab.Pos.Position.Y+4+DPos, Tab.Pos.Position.Z)
			until
			not VP.Parent
		end)
		if Tab.Amount > 0 then
			VP.BillboardGui.TxT.Text = "-"..Utils:CommaNumber(Tab.Amount)
			VP.BillboardGui.TxT.TextColor3 = Colors.Damage
		else
			VP.BillboardGui.TxT.Text = "Miss"
			VP.BillboardGui.TxT.TextColor3 = Colors.Miss
		end
		DamagePos += VP.BillboardGui.Size.Height.Scale
		if DamagePos > 6 then
			DamagePos = 0
			end
		else
			VP:Destroy()
		end
	end
	
	wait(0.5)
	TS:Create(VP.BillboardGui.TxT, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Size = UDim2.new(0,0,0,0)}):Play()
	wait(0.25)
	VP:Destroy()
end)
