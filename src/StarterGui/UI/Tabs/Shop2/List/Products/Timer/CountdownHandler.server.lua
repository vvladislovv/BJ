
local countdownText = script.Parent


local day = os.time({year = 2022, month = 5, day = 25, hour = 12, min = 0, sec = 0})


while wait() do
	
	local secondsBetween = os.difftime(day, os.time())

	local seconds = secondsBetween % 60
	local minutes = math.floor(secondsBetween % (60*60) / 60)
	local hours = math.floor(secondsBetween % (60*60*24) / (60*60))
	local days = math.floor(secondsBetween % (60*60*24*30) / (60*60*24))
	
	local textString = "Offers will end: \n"..days .. "d:" .. hours .. "h:" .. minutes .. "m:" .. seconds .. "s"
	countdownText.Text = textString
	
	if secondsBetween <= 0 then
		--script.Parent.Parent.Caramel2Tier:Destroy()
		--script.Parent.Parent.Caramel3Tier:Destroy()
		--script.Parent.Parent.CaramelFirstTier:Destroy()
		break
	end
end