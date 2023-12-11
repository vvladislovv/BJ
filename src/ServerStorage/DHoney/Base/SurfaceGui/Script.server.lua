local DSS = game:GetService("DataStoreService")
local Players = game:GetService("Players")
local SSS = game:GetService("ServerScriptService")
local Data = require(SSS.Server.Data)
local Modules = game.ReplicatedStorage:WaitForChild("Modules")
local CurrencyName = "Daily"
local Leaderboard = script.Parent.Parent.Parent


local LST = DSS:GetOrderedDataStore(CurrencyName.."LST2455")

local LST2 = DSS:GetOrderedDataStore(CurrencyName.."LSTCount2455")

local Dum = 1
local LeaderStore = DSS:GetOrderedDataStore(CurrencyName.."15D"..Dum)

local Holder = script.Parent:WaitForChild("Holder")
local Template = script:WaitForChild("Template")

local Utils = require(game.ReplicatedStorage:WaitForChild("Modules").Utils)

local function ClearBoard()
	for _, T in pairs(Holder:GetChildren()) do
		if not T:IsA("UIListLayout") then
			T:Destroy()
		end
	end
end
local LSTKey = 9160152875
local LST2Key = 9165701515
script.Parent.Parent.Parent.Dum.Value = Dum
if LST:GetAsync(LSTKey) then
	if os.time() >= LST:GetAsync(LSTKey) then
		LST:SetAsync(LSTKey, os.time() + 86400)
	end
else
	LST:SetAsync(LSTKey, os.time() + 86400)
end

if not LST2:GetAsync(LST2Key) then
	LST2:SetAsync(LST2Key, 1)
	Dum = LST2:GetAsync(LST2Key)
	LeaderStore = DSS:GetOrderedDataStore(CurrencyName.."15"..Dum)
else
	Dum = LST2:GetAsync(LST2Key)
	LeaderStore = DSS:GetOrderedDataStore(CurrencyName.."15"..Dum)
end

local function UpdateBoard()
	if os.time() >= LST:GetAsync(LSTKey) then
		LST:SetAsync(LSTKey, os.time() + 86400)
		LST2:SetAsync(LST2Key, LST2:GetAsync(LST2Key) + 1)
		wait()
		Dum = LST2:GetAsync(LST2Key)
		script.Parent.Parent.Parent.Dum.Value = Dum
		LeaderStore = DSS:GetOrderedDataStore(CurrencyName.."15"..Dum)
	end
	local Pages = LeaderStore:GetSortedAsync(false, 100)
	local TopTen = Pages:GetCurrentPage()
	ClearBoard()
	wait()
	for Key, Value in pairs(TopTen) do
		local PlayerName = Players:GetNameFromUserIdAsync(Value.key)
		local NewPlayer = Template:Clone()
		NewPlayer.Parent = Holder
		if Key == 1 then
			NewPlayer.BackgroundColor3 = Color3.fromRGB(47, 228, 255)
			--NewPlayer.Drop.BackgroundColor3 = Color3.fromRGB(162, 140, 227)
		elseif Key == 2 then
			NewPlayer.BackgroundColor3 = Color3.fromRGB(255, 195, 41)
			--NewPlayer.Drop.BackgroundColor3 = Color3.fromRGB(103, 225, 255)
		elseif Key == 3 then
			NewPlayer.BackgroundColor3 = Color3.fromRGB(212, 212, 212)
			--NewPlayer.Drop.BackgroundColor3 = Color3.fromRGB(255, 228, 74)
		else
			local r = math.random(1,2)
			if r == 1 then 
				NewPlayer.BackgroundColor3 = Color3.fromRGB(84, 65, 53)
				NewPlayer.Player.UIStroke.Enabled = true
				NewPlayer.Coins.UIStroke.Enabled = true
				NewPlayer.Rank.UIStroke.Enabled = true
				NewPlayer.Player.TextColor3 = Color3.new(255,255,255)
				NewPlayer.Coins.TextColor3 = Color3.new(255,255,255)
				NewPlayer.Rank.TextColor3 = Color3.new(255,255,255)
				else
				NewPlayer.BackgroundColor3 = Color3.fromRGB(109, 84, 69)
				NewPlayer.Player.UIStroke.Enabled = true
				NewPlayer.Coins.UIStroke.Enabled = true
				NewPlayer.Rank.UIStroke.Enabled = true
				NewPlayer.Player.TextColor3 = Color3.new(255,255,255)
				NewPlayer.Coins.TextColor3 = Color3.new(255,255,255)
				NewPlayer.Rank.TextColor3 = Color3.new(255,255,255)
			--NewPlayer.Drop.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			end
		end
		NewPlayer.Player.Text = PlayerName
		NewPlayer.Rank.Text = Key..":"
		NewPlayer.Coins.Text = Utils:CommaNumber(Value.value)
	end
end


spawn(function()
	while true do
		for _, Player in pairs(Players:GetPlayers()) do
			local Gets = LST:GetAsync(LSTKey)
			local PData = Data:Get(Player)
			script.Parent.Parent.Parent.Timer.Value = Gets - os.time()
			if os.time() >= LST:GetAsync(LSTKey) then
				PData.IStats.DailyHoney = 0
				PData.IStats.Dum = workspace.Leaderboards.DHoney.Dum.Value
			end
		end
		wait(1)
	end
end)

spawn(function()
	while true do
		for _, Player in pairs(Players:GetPlayers()) do
			local PData = Data:Get(Player)
			local Currency = PData.IStats.DailyHoney
			LeaderStore:SetAsync(Player.UserId, math.floor(Currency))
		end

		wait(61)
	end
end)



while true do
	UpdateBoard()
	wait(60)
end
