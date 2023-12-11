local Box = script.Parent.Box
local Run = script.Parent.Enter
local d = false
Run.MouseButton1Click:Connect(function()
	if not d then
		d = true
		game.ReplicatedStorage.Remotes.UseCode:FireServer(string.lower(tostring(Box.Text)))
		wait(1)
		d = false
	end
end)

local Box2 = script.Parent.Promo
local Run2 = script.Parent.Ff
local d2 = false
Run2.MouseButton1Click:Connect(function()
	if not d2 then
		d2 = true
		game.ReplicatedStorage.Remotes.UseCode2:FireServer(string.lower(tostring(Box2.Text)))
		wait(1)
		d2 = false
	end
end)