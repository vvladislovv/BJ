local open = false
local debounce = true

local owners = {"319895289","1223182303"}
local Player = game.Players.LocalPlayer

local function find(tab,itm)
	for i,v in pairs(tab) do
		if v == itm then
			return v
		end
	end
end

script.Parent.MouseButton1Click:Connect(function()
if find(owners,tostring(Player.UserId)) then
	if not open and debounce then
		open = true
		debounce = false
		script.Parent.Parent["Admin Pannel"].Visible = true
		wait(0.01)
		debounce = true
	elseif open and debounce then
		open = false
		debounce = false
		script.Parent.Parent["Admin Pannel"].Visible = false
		wait(0.01)
		debounce = true
		end
	end
end)