local M = script.Parent
local ts = game:GetService("TweenService")
--Frames
local Honey = M.Honey
local Pollen = M.Pollen

local Met = M.Parent.Parent.Parent.Parent.Metters
local MH = Met.HoneyMeter
local MP = Met.PollenMeter

local Binds = M.Parent.Parent.Parent.Parent.Binds

--Buttons
local Swap = M.Swap
local Raise = M.Raise

--Info
local FPos = UDim2.new(0.721,0,0.153,0)
local TPos = UDim2.new(0.278,0,0.153,0)

local OFPos = UDim2.new(0.239,0,-0.054,0)
local OTPos = UDim2.new(0.768,0,-0.054,0)

local UPPos = UDim2.new(0.5,0,0.01,0)
local DPos = UDim2.new(0.5,0,0.977,0)

local BPos = UDim2.new(0.5,0,0.78,0)
local BDPos = UDim2.new(0.5,0,0.86,0)

local PosNow = "HP"
local PosNow2 = "D"

local HDown = false
local PDown = false

local WDown = false
local UpDD = false

local HPSg = 0.721
local PPSg = 0.278


--///

local function ReturnPositions()
	if PosNow == "PH" then
		if HDown and not PDown then
			MP:TweenPosition(UDim2.new(0.5,0,-0.054,0), "Out", "Back", 0.35, true)
			MH:TweenPosition(UDim2.new(0.768,0,2,0), "Out", "Back", 0.35, true)
		elseif PDown and not HDown then
			MH:TweenPosition(UDim2.new(0.5,0,-0.054,0), "Out", "Back", 0.35, true)
			MP:TweenPosition(UDim2.new(0.239,0,2,0), "Out", "Back", 0.35, true)
		elseif PDown and HDown then
			MP:TweenPosition(UDim2.new(0.5,0,2,0), "Out", "Back", 0.35, true)
			MH:TweenPosition(UDim2.new(0.5,0,2,0), "Out", "Back", 0.35, true)
		end
	else
		if HDown and not PDown then
			MP:TweenPosition(UDim2.new(0.5,0,-0.054,0), "Out", "Back", 0.35, true)
			MH:TweenPosition(UDim2.new(0.239,0,2,0), "Out", "Back", 0.35, true)
		elseif PDown and not HDown then
			MH:TweenPosition(UDim2.new(0.5,0,-0.054,0), "Out", "Back", 0.35, true)
			MP:TweenPosition(UDim2.new(0.768,0,2,0), "Out", "Back", 0.35, true)
		elseif PDown and HDown then
			MP:TweenPosition(UDim2.new(0.5,0,2,0), "Out", "Back", 0.35, true)
			MH:TweenPosition(UDim2.new(0.5,0,2,0), "Out", "Back", 0.35, true)
		end
	end
end

local function BaseHP(CS)
	if not WDown then
		if PosNow == "HP" then
			if CS then
				PosNow = "PH"
				MH:TweenPosition(OFPos, "Out", "Back", 0.35, true)
				MP:TweenPosition(OTPos, "Out", "Back", 0.35, true)
				
				Honey:TweenPosition(TPos, "Out", "Back", 0.35, true)
				Pollen:TweenPosition(FPos, "Out", "Back", 0.35, true)
				
				HPSg = 0.278
				PPSg = 0.721
			else
				MH:TweenPosition(OTPos, "Out", "Back", 0.35, true)
				MP:TweenPosition(OFPos, "Out", "Back", 0.35, true)
				
				Honey:TweenPosition(FPos, "Out", "Back", 0.35, true)
				Pollen:TweenPosition(TPos, "Out", "Back", 0.35, true)
			end
		else
			if CS then
				PosNow = "HP"
				MH:TweenPosition(OTPos, "Out", "Back", 0.35, true)
				MP:TweenPosition(OFPos, "Out", "Back", 0.35, true)
				
				Honey:TweenPosition(FPos, "Out", "Back", 0.35, true)
				Pollen:TweenPosition(TPos, "Out", "Back", 0.35, true)
				
				HPSg = 0.721
				PPSg = 0.278
			else
				MH:TweenPosition(OFPos, "Out", "Back", 0.35, true)
				MP:TweenPosition(OTPos, "Out", "Back", 0.35, true)
				
				Honey:TweenPosition(TPos, "Out", "Back", 0.35, true)
				Pollen:TweenPosition(FPos, "Out", "Back", 0.35, true)
			end
		end
	end
end

Honey.Hide.MouseEnter:Connect(function()
	ts:Create(Honey.Hide, TweenInfo.new(0.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Rotation = 1}):Play()
end)

Honey.Hide.MouseLeave:Connect(function()
	ts:Create(Honey.Hide, TweenInfo.new(0.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Rotation = 0}):Play()
end)

---

Pollen.Hide.MouseEnter:Connect(function()
	ts:Create(Pollen.Hide, TweenInfo.new(0.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Rotation = 1}):Play()
end)

Pollen.Hide.MouseLeave:Connect(function()
	ts:Create(Pollen.Hide, TweenInfo.new(0.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), {Rotation = 0}):Play()
end)

Honey.Hide.MouseButton1Click:Connect(function()
	if not UpDD then
		if not HDown then
			HDown = true
			WDown = true
			Honey:TweenPosition(UDim2.new(HPSg,0,0.27,0), "Out", "Back", 0.35, true)
			Honey.Hide:TweenPosition(UDim2.new(0,0,-1.25,0), "Out", "Back", 0.35, true)
			if not PDown then
				MP:TweenPosition(UDim2.new(0.5,0,-0.054,0), "Out", "Back", 0.35, true)
				Binds:TweenPosition(BPos, "Out", "Back", 0.35, true)
			else
				Binds:TweenPosition(BDPos, "Out", "Back", 0.35, true)
			end
			MH:TweenPosition(UDim2.new(0.239,0,2,0), "Out", "Back", 0.35, true)
			Honey.Hide.Text = "Show"
		else
			Binds:TweenPosition(BPos, "Out", "Back", 0.35, true)
			HDown = false
			if not PDown then
				WDown = false
			end
			BaseHP(false)
			ReturnPositions()
			Honey:TweenPosition(UDim2.new(HPSg,0,0.153,0), "Out", "Back", 0.35, true)
			Honey.Hide:TweenPosition(UDim2.new(0,0,1.5,0), "Out", "Back", 0.35, true)
			Honey.Hide.Text = "Hide"
		end
	end
end)

Pollen.Hide.MouseButton1Click:Connect(function()
	if not UpDD then
		if not PDown then
			PDown = true
			WDown = true
			Pollen:TweenPosition(UDim2.new(PPSg,0,0.27,0), "Out", "Back", 0.35, true)
			Pollen.Hide:TweenPosition(UDim2.new(0,0,-1.25,0), "Out", "Back", 0.35, true)
			if not HDown then
				MH:TweenPosition(UDim2.new(0.5,0,-0.054,0), "Out", "Back", 0.35, true)
				Binds:TweenPosition(BPos, "Out", "Back", 0.35, true)
			else
				Binds:TweenPosition(BDPos, "Out", "Back", 0.35, true)
			end
			MP:TweenPosition(UDim2.new(0.239,0,2,0), "Out", "Back", 0.35, true)
			Pollen.Hide.Text = "Show"
		else
			Binds:TweenPosition(BPos, "Out", "Back", 0.35, true)
			PDown = false
			if not HDown then
				WDown = false
			end
			BaseHP(false)
			ReturnPositions()
			Pollen:TweenPosition(UDim2.new(PPSg,0,0.153,0), "Out", "Back", 0.35, true)
			Pollen.Hide:TweenPosition(UDim2.new(0,0,1.5,0), "Out", "Back", 0.35, true)
			Pollen.Hide.Text = "Hide"
		end
	end
end)

Raise.MouseButton1Click:Connect(function()
	if not HDown and not PDown then
		if PosNow2 == "D" then
			PosNow2 = "U"
			Raise.Text = "Raise it Down"
			UpDD = true
			Binds:TweenPosition(BDPos, "Out", "Back", 0.35, true)
			Met:TweenPosition(UPPos, "Out", "Back", 0.35, true)
		else
			PosNow2 = "D"
			Raise.Text = "Raise it Up"
			UpDD = false
			Binds:TweenPosition(BPos, "Out", "Back", 0.35, true)
			Met:TweenPosition(DPos, "Out", "Back", 0.35, true)
		end
	end
end)

Swap.MouseButton1Click:Connect(function()
	BaseHP(true)
end)