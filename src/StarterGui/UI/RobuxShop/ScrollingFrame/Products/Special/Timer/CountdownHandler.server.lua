local countdownGui = script.Parent
local countdownText = countdownGui


local day = os.time({year = 2022, month = 8, day = 9, hour = 6, min = 0, sec = 0})


while wait() do
	
	local secondsBetween = os.difftime(day, os.time())

	local seconds = secondsBetween % 60
	local minutes = math.floor(secondsBetween % (60*60) / 60)
	local hours = math.floor(secondsBetween % (60*60*24) / (60*60))
	local days = math.floor(secondsBetween % (60*60*24*30) / (60*60*24))
	
	local textString = days .. "d:" .. hours .. "h:" .. minutes .. "m:" .. seconds .. "s"
	countdownText.Text = textString
	
	if secondsBetween <= 0 and script.Parent.Parent.TIC.Visible then
		day = os.time({year = 2022, month = 8, day = 10, hour = 12, min = 0, sec = 0})
		script.Parent.Parent.Bear.Visible = true
		for i,v in pairs(script.Parent.Parent:GetChildren()) do
			if v.Name == "TypeItem" then
				v.Visible = false
			end
		end
		script.Parent.Parent.TIC.Visible = false
		script.Parent.Parent.Am.Text = "1700R$"
		script.Parent.Parent.Special1.Name = "Special2"
	elseif secondsBetween <= 0 and not script.Parent.Parent.TIC.Visible then
		script.Parent.Parent.Visible = false
		break
	end
end