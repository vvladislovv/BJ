local module = {}
local ts = game:GetService("TweenService")
function Tween(obj,time,transp,size)
	if obj == nil then
		warn("Error: Object is nil. Please assign an object.")
	end
	ts:Create(obj,TweenInfo.new(time, Enum.EasingStyle.Elastic, Enum.EasingDirection.InOut),{Transparency=transp,Size = size}):Play()
end
--[[require(game.ServerScriptService.Animate.Explode):Explode(Vector3.new(0,0,0))]]
function module:Explode(pos)
	local int = script.Int:clone()
	int.Parent = workspace
	spawn(function()
		--local explodev1 = Instance.new("Part",int) int.PrimaryPart = explodev1 explodev1.Name = "PrimaryPart" explodev1.Anchored = true
		--explodev1.CanCollide = false explodev1.Color = Color3.fromRGB(216, 79, 79)
		--explodev1.Material = Enum.Material.SmoothPlastic
		--explodev1.Size = Vector3.new(.1,.1,.1)
		--explodev1.Shape = "Ball"
		--int.Name = "Explosion"
		--int:SetPrimaryPartCFrame(CFrame.new(pos))
		--Tween(explodev1,.1,0,Vector3.new(7.5,7.5,7.5))
		--wait(0.05)
		--local e2 = Instance.new("Part",int) e2.Name = "Part" e2.Anchored = true
		--e2.CanCollide = false e2.Color = Color3.fromRGB(216, 79, 79)
		--e2.Material = Enum.Material.SmoothPlastic
		--e2.Size = explodev1.Size
		--e2.Shape = "Ball"
		--e2.Position = explodev1.Position
		--e2.Transparency = .3
		--Tween(e2,.1,.3,Vector3.new(7.5+3,7.5+3,7.5+3))
		--wait(.05)
		--local e3 = Instance.new("Part",int) e3.Name = "Part" e3.Anchored = true
		--e3.CanCollide = false e3.Color = Color3.fromRGB(216, 79, 79)
		--e3.Material = Enum.Material.SmoothPlastic
		--e3.Size = Vector3.new(7.5+3,7.5+3,7.5+3)
		--e3.Shape = "Ball"
		--e3.Transparency = .6
		--e3.Position = explodev1.Position
		--Tween(e3,.05,.6,Vector3.new(7.5+6,7.5+6,7.5+6))
		wait(0.03)
		local r = Instance.new("Part",int) r.Name = "Part" r.Anchored = true
		r.CanCollide = false r.Color = Color3.fromRGB(216, 79, 79)
		r.Material = Enum.Material.SmoothPlastic
		r.Size = Vector3.new(7.5+6,7.5+6,7.5+6)
		r.Position = pos
		r.Shape = "Ball"
		r.Transparency = .8
		--Tween(e3,.05,.8,Vector3.new(7.5+9,7.5+9,7.5+9))
		local w = Instance.new("Part",int) w.Name = "Part" w.Anchored = true
		w.CanCollide = false w.Color = Color3.fromRGB(216, 79, 79)
		w.Material = Enum.Material.ForceField
		w.Size = r.Size
		w.Shape = "Ball"
		w.Position = pos
		w.Transparency = 0
		Tween(w,0.5,1,Vector3.new(7.5+16,7.5+16,7.5+16))
		spawn(function()
			wait(.051)
			--Tween(explodev1,0.5,1,Vector3.new(.1,.1,.1))
			--Tween(e2,0.4,1,Vector3.new(.1,.1,.1))
			--Tween(e3,0.3,1,Vector3.new(.1,.1,.1))
			Tween(r,0.2,1,Vector3.new(.1,.1,.1))
		end)
	end)
end

return module