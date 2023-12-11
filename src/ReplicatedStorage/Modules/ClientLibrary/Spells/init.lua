local module = {}
local UserInputService = game:GetService("UserInputService")
local ClientUtilities = require(game.ReplicatedStorage.ClientUtilities)
local Utils = require(game.ReplicatedStorage.Modules.Utils)
local Utilities = require(game.ReplicatedStorage.Utilities)
local Bookss = require(game.ReplicatedStorage.Modules.Books).MakeSpell
local Progressions = require(game.ReplicatedStorage.Modules.HALLOWEEN).Progression
local Remotes = game.ReplicatedStorage.Remotes
local MarketplaceService = game:GetService("MarketplaceService")
local TS = game:GetService("TweenService")
local Camera = workspace.Camera
local UI = nil
local Ind = 1
module.SlotColors = {
	Employed = {Frame = Color3.fromRGB(93, 74, 55), Stroke = Color3.fromRGB(106, 83, 62), Image = "rbxassetid://9990362352"},
	Locked = {Frame = Color3.fromRGB(35, 35, 35), Stroke = Color3.fromRGB(45, 45, 45), Image = "http://www.roblox.com/asset/?id=10251204797"},
	Free = {Frame = Color3.fromRGB(113, 90, 67), Stroke = Color3.fromRGB(124, 98, 73), Image = ""},
}

local function GetSlot()
	for i, v in pairs(_G.PData.BookSlots) do
		if v.Buy then
			return i
		end
	end
end

local function MakeSlot(ID)
	local BoostText = ""
	for i, v in pairs(_G.PData.Books[ID].Content) do
		local TypeIn = "+"..v[3]..v[2].." "..v[1]
		if (i ~= 1) then
			BoostText = BoostText.. '\n'
		end
		BoostText = BoostText.. TypeIn
	end
	return _G.PData.Books[ID].Rank.." ".._G.PData.Books[ID].BookType.." \n\n"..BoostText
end

local function CalcChance(info)
	local Fr = UI.MakeSpell.Offer
	
	Fr.Count.Lb.Text = info.Cost
	if _G.PData.Inventory.Ticket >= info.Cost then
		Fr.De.BackgroundColor3 = Color3.fromRGB(169, 255, 156)
		Fr.Count.Lb.TextColor3 = Color3.fromRGB(244, 244, 244)
	else
		Fr.De.BackgroundColor3 = Color3.fromRGB(255, 99, 99)
		Fr.Count.Lb.TextColor3 = Color3.fromRGB(244, 64, 64)
	end
	for Type, Am in pairs(info.Chance) do
		Fr:FindFirstChild(Type).Chance.Text = (Am / 100).."%"
	end
end


function module.CalcCost()
	local Fr = UI.MakeSpell.Offer
	
	local info
	info = Bookss[Ind]
	CalcChance(info)

	Fr.Count.De.MouseButton1Click:Connect(function()
		if Ind > 1 then
			Ind -= 1
			info = Bookss[Ind]
			CalcChance(info)
		end
	end)
	
	Fr.Count.In.MouseButton1Click:Connect(function()
		if Ind < #Bookss then
			Ind += 1
			info = Bookss[Ind]
			CalcChance(info)
		end
	end)
end

local colors = {
	["Default"] = Color3.fromRGB(93, 74, 55),
	["Rare"] = Color3.fromRGB(203, 198, 198),
	["Epic"] = Color3.fromRGB(232, 185, 64),
	["Legendary"] = Color3.fromRGB(82, 236, 236),
	["Mythic"] = Color3.fromRGB(167, 71, 235),
}
function module.UpdSlots()
	local Spells = UI:WaitForChild("Spells")
	local Books = Spells:WaitForChild("Books")
	local AllSlots = Spells:WaitForChild("AllSlots")
	for _, Slot in pairs(AllSlots:GetChildren()) do
		if Slot:IsA("Frame") then
			local op = ""
			local SlotText = "nil"
			local PSlot = _G.PData.BookSlots[tonumber(Slot.Name)]
			if PSlot.BookID == 0 and PSlot.Input and not PSlot.Buy then
				op = "Free"
				SlotText = "nil"
				Slot.Have.Visible = false
				Slot.Robux.Visible = false
				Slot.Ticket.Visible = false
			elseif PSlot.BookID == 0 and not PSlot.Input and PSlot.Buy then
				op = "Locked"
				SlotText = "nil"
				Slot.Robux.Visible = true
				Slot.Ticket.Visible = true
			elseif PSlot.BookID > 0 and PSlot.Input and not PSlot.Buy then
				op = "Employed"
				SlotText = MakeSlot(PSlot.BookID)
				Slot.Have.Visible = true
				Slot.Robux.Visible = false
				Slot.Ticket.Visible = false
			elseif PSlot.BookID == 0 and not PSlot.Input and not PSlot.Buy then
				op = "Invis"
				SlotText = "nil"
			end
			if op ~= "Invis" then
				Slot.Visible = true
				Slot.HoverText.Value = SlotText
				Slot.BackgroundColor3 = module.SlotColors[op].Frame
				Slot.UIStroke.Color = module.SlotColors[op].Stroke
				Slot.Book.Image = module.SlotColors[op].Image
			else
				Slot.Visible = false
			end
		end
	end
	
	for _, Book in pairs(Books:GetChildren()) do
		if Book:IsA("Frame") then
			Book:Destroy()
		end
	end
	
	for Lay, Book in pairs(_G.PData.Books) do
		local temp = script.Book:Clone()
		temp.Lay.Value = Lay
		temp.Name = Lay
		temp.BackgroundColor3 = colors[Book.Rank]
		temp.Parent = Books
		temp.Hover.Disabled = false
	end
	
	for _, Book in pairs(Books:GetChildren()) do
		if Book:IsA("Frame") then
			local PBook = _G.PData.Books[tonumber(Book.Name)]
			if PBook.Equipped then
				Book.Have.Visible = true
			else
				Book.Have.Visible = false
			end
		end
	end
end

local function GetTypeTask(TaskName)
	if string.find(TaskName, "PTask") then
		return "Classic"
	else
		return "Premium"
	end
end
local function MakeLabel(Task)
	if Task.TaskType == "HatchEgg" and Task.Amount > 1 then
		return "Open "..Task.TaskParam.." Eggs"
	elseif Task.TaskType == "HatchEgg" and Task.Amount == 1 then
		return "Open "..Task.TaskParam.." Egg"
---------------------------------------------------------------------------
	elseif Task.TaskType == "OpenBox" and Task.Amount > 1 then
		return "Open "..Task.TaskParam.." Boxes"
	elseif Task.TaskType == "OpenBox" and Task.Amount == 1 then
		return "Open "..Task.TaskParam.." Box"
---------------------------------------------------------------------------
	elseif Task.TaskType == "Playtime" and Task.Amount > 1 then
		return "Play in Bees Journey "..Task.TaskParam.." Seconds"
	elseif Task.TaskType == "Playtime" and Task.Amount == 1 then
		return "Play in Bees Journey "..Task.TaskParam.." Second"
---------------------------------------------------------------------------
	elseif Task.TaskType == "FeedBees" and Task.Amount > 1 then
		return "Feed your Bees "..Task.TaskParam.." times"
	elseif Task.TaskType == "FeedBees" and Task.Amount == 1 then
		return "Feed your Bees "..Task.TaskParam.." time"
---------------------------------------------------------------------------
	elseif Task.TaskType == "BuyFromEventShop" and Task.Amount > 1 then
		return "Buy "..Task.TaskParam.." Product in Halloween Shop"
	elseif Task.TaskType == "BuyFromEventShop" and Task.Amount == 1 then
		return "Buy "..Task.TaskParam.." Product in Halloween Shop"
---------------------------------------------------------------------------
	elseif Task.TaskType == "ReachPLevel" and Task.Amount > 1 then
		return "Feed your Bees "..Task.TaskParam.." times"
	elseif Task.TaskType == "ReachPLevel" and Task.Amount == 1 then
		return "Feed your Bees "..Task.TaskParam.." time"
	end
end
function module.TasksUPD()
	local itm = require(game.ReplicatedStorage.Modules.Items).Eggs
	local UIW = UI.EventWindow.Tasks
	for Type, info in pairs(_G.PData.HPremTasks) do
		local TaskW = UIW[Type]
		local mod = require(game.ReplicatedStorage.Modules.HALLOWEEN).TaskTypes["Premium"][info.TaskID]
		if mod then
			TaskW.Bar.Fill:TweenSize(UDim2.new(math.clamp(info.Progress/mod.Amount,0,1),0,1,0), "Out", "Linear", 0.1, true)
			TaskW.Bar.TextLabel.Text = info.Progress.."/"..mod.Amount..". "..MakeLabel(mod)
			TaskW.RewardType.Image = itm[mod.RewardType].Image
			TaskW.RewardType.TextLabel.Text = "x"..mod.Reward
			TaskW.RewardType2.Image = itm[mod.RewardType2].Image
			TaskW.RewardType2.TextLabel.Text = "x"..mod.Reward2
		end
	end

	for Type, info in pairs(_G.PData.HTasks) do
		local TaskW = UIW[Type]
		local mod = require(game.ReplicatedStorage.Modules.HALLOWEEN).TaskTypes["Classic"][info.TaskID]
		if mod then
			TaskW.Bar.Fill:TweenSize(UDim2.new(math.clamp(info.Progress/mod.Amount,0,1),0,1,0), "Out", "Linear", 0.1, true)
			TaskW.Bar.TextLabel.Text = info.Progress.."/"..mod.Amount..". "..MakeLabel(mod)
			TaskW.RewardType.Image = itm[mod.RewardType].Image
			TaskW.RewardType.TextLabel.Text = "x"..mod.Reward
		end
	end
end

local costs = {
	["3"] = {Ticket = 500, Robux = 299},
	["4"] = {Ticket = 1000, Robux = 799},
	["5"] = {Ticket = 1500, Robux = 1399},
	["6"] = {Ticket = 2000, Robux = 2399},
}

local function CalcLevels(am)
	if am >= 0 and am < 10 then
		return 1
	elseif am >= 10 and am < 20 then
		return 2
	elseif am >= 20 and am < 40 then
		return 3
	elseif am >= 40 and am < 70 then
		return 4
	elseif am >= 70 and am < 110 then
		return 5
	elseif am >= 110 and am < 160 then
		return 6
	elseif am >= 160 and am < 220 then
		return 7
	elseif am >= 220 and am < 290 then
		return 8
	elseif am >= 290 and am < 370 then
		return 9
	elseif am >= 370 then
		return 10
	end
end
local function FindLevel(am)
	if am >= 0 and am < 10 then
		return 10
	elseif am >= 10 and am < 20 then
		return 20
	elseif am >= 20 and am < 40 then
		return 40
	elseif am >= 40 and am < 70 then
		return 70
	elseif am >= 70 and am < 110 then
		return 110
	elseif am >= 110 and am < 160 then
		return 160
	elseif am >= 160 and am < 220 then
		return 220
	elseif am >= 220 and am < 290 then
		return 290
	elseif am >= 290 and am < 370 then
		return 370
	elseif am >= 370 then
		return 999
	end
end

function module.ProgressionUIUPD()
	local UIW = UI.EventWindow.Progression
	if FindLevel(_G.PData.IStats.Donations) >= 999 then
		UIW.Progress.PR.Text = "Finished"
		UIW.Progress.OL.Text = "10"
		UIW.Progress.NE.Text = ""
	else
		UIW.Progress.PR.Text = _G.PData.IStats.Donations.."/"..FindLevel(_G.PData.IStats.Donations).." Donations"
		UIW.Progress.OL.Text = CalcLevels(_G.PData.IStats.Donations)
		UIW.Progress.NE.Text = CalcLevels(_G.PData.IStats.Donations) + 1
	end
	for _, Frame in pairs(UIW:GetChildren()) do
		if Frame:IsA("Frame") then
			if tonumber(Frame.Name) then
				if tonumber(Frame.Name) <= CalcLevels(_G.PData.IStats.Donations) then
					Frame.UIStroke.Color = Color3.fromRGB(230, 221, 95)
					Frame.TaskType.BackgroundColor3 = Color3.fromRGB(230, 221, 95)
					Frame.Reward.ImageColor3 = Color3.fromRGB(255, 255, 255)
					Frame.Reward.BackgroundColor3 = Color3.fromRGB(230, 221, 95)
					UIW["l"..tonumber(Frame.Name)].BackgroundColor3 = Color3.fromRGB(230, 221, 95)
				end
			end
		end
	end
end

function module.UpdMenu(Type)
	for _, Frame in pairs(UI.EventWindow:GetChildren()) do
		if Frame:IsA("Frame") then
			if Frame.Name ~= Type then
				Frame.Visible = false
			else
				Frame.Visible = true
			end
		end
	end
end

function module.ProgressionSys()
	local UIW = UI.EventWindow
	UIW.Progression.Donate.MouseButton1Click:Connect(function()
		Remotes.DonatePumpkin:FireServer()
	end)
	local Opened = "Menu"
	module.UpdMenu(Opened)
	for _, Button in pairs(UIW.Menu:GetChildren()) do
		if Button:IsA("TextButton") then
			if UIW:FindFirstChild(Button.Name) then
				Button.MouseButton1Click:Connect(function()
					Opened = Button.Name
					module.UpdMenu(Opened)
				end)
				UIW:FindFirstChild(Button.Name).Close.MouseButton1Click:Connect(function()
					if UIW:FindFirstChild(Button.Name).Close.Parent.Name ~= "Menu" then
						Opened = "Menu"
						module.UpdMenu("Menu")
					end
				end)
			end
		end
	end
end

function module.Init()
	wait(6.2)
	local players = game:GetService("Players")
	local Player = players.LocalPlayer
	local pGui = Player:WaitForChild("PlayerGui")
	UI = pGui:WaitForChild("UI")
	local Spells = UI:WaitForChild("Spells")
	local Books = Spells:WaitForChild("Books")
	local AllSlots = Spells:WaitForChild("AllSlots")
	
	local Have = {}
	local deb = false
	local info
	info = Bookss[Ind]
	UI.MakeSpell.Offer.De.MouseButton1Click:Connect(function()
		Remotes.CraftSpells:FireServer(Ind)
		CalcChance(info)
	end)
	UI.MakeSpell.Offer.Inv.MouseButton1Click:Connect(function()
		UI.Spells:TweenPosition(UDim2.new(0.5,0,0.5,0), "Out", "Back", 0.33, true)
	end)
	UI.Spells.Cl.MouseButton1Click:Connect(function()
		UI.Spells:TweenPosition(UDim2.new(0.5,0,2,0), "Out", "Back", 0.33, true)
	end)
	for Lay, Book in pairs(_G.PData.Books) do
		local temp = script.Book:Clone()
		temp.Lay.Value = Lay
		temp.Name = Lay
		temp.BackgroundColor3 = colors[Book.Rank]
		temp.Parent = Books
		temp.Hover.Disabled = false
	end
	module.ProgressionUIUPD()
	module.ProgressionSys()
	Remotes.DonatePumpkin:FireServer()
	module.TasksUPD()
	module.UpdSlots()
	module.CalcCost()
	for _, Slot in pairs(AllSlots:GetChildren()) do
		if Slot:IsA("Frame") then
			if costs[Slot.Name] then
				Slot.Robux.Cost.Text = costs[Slot.Name].Robux.."R$"
				Slot.Ticket.TextLabel.Text = costs[Slot.Name].Ticket
			end
			Slot.Robux.MouseButton1Click:Connect(function()
				local Don = require(script.Parent.Parent.Donations)["Slot"..GetSlot()]
				MarketplaceService:PromptProductPurchase(Player, Don.ID)
			end)
			Slot.Ticket.MouseButton1Click:Connect(function()
				Remotes.BuySpell:FireServer()
			end)
			Slot.Delete.MouseButton1Click:Connect(function()
				if not Have["Deb"] then
					Have["Deb"] = true
				else
					if not deb then
						deb = true
						Remotes.MakeSpell:FireServer(tonumber(Slot.Name), 0)
						wait(1)
						deb = false
					end
				end
			end)
		end
	end
	
	coroutine.wrap(function()
		while wait(1) do
			Have["Deb"] = false
		end
	end) ()
end

return module
