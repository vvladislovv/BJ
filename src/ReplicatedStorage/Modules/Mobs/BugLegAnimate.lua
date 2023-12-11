
return function(p1)
	local v1 = nil
	local v2 = { p1["Left Leg1"]["Left Leg1"], p1["Left Leg2"]["Left Leg2"], p1["Left Leg3"]["Left Leg3"], p1["Right Leg1"]["Right Leg1"], p1["Right Leg2"]["Right Leg2"], p1["Right Leg3"]["Right Leg3"] }
	local v3 = { p1["Left Leg1"].Joint1, p1["Left Leg2"].Joint2, p1["Left Leg3"].Joint3, p1["Right Leg1"].Joint4, p1["Right Leg2"].Joint5, p1["Right Leg3"].Joint6 }
	local l__Humanoid__4 = p1.Parent.Humanoid
	local v5 = {}
	for v6 = 1, 6 do
		local v7 = Instance.new("Motor")
		v7.Part0 = p1.Parent.Torso
		v7.Part1 = v3[v6]
		v7.C0 = p1.Parent.Torso.CFrame:inverse() * v3[v6].CFrame
		v7.Parent = p1
		table.insert(v5, v7)
	end
	local v8 = {}
	for v9 = 1, #v2 do
		for v10, v11 in pairs(v3[v9].Parent:GetChildren()) do
			if v11 ~= v3[v9] and not (not v11:IsA("Part")) or v11:IsA("WedgePart") then
				local v12 = Instance.new("Motor")
				v12.Part0 = v2[v9]
				v12.Part1 = v11
				v12.C0 = v2[v9].CFrame:inverse() * v11.CFrame
				v12.Parent = p1
			end
		end
	end
	local l__Torso__13 = p1.Parent.Torso
	for v14, v15 in pairs(p1.Parent:GetChildren()) do
		if v15:IsA("Part") or v15:IsA("WedgePart") then
			local v16 = Instance.new("Motor")
			v16.Part0 = l__Torso__13
			v16.Part1 = v15
			v16.C0 = l__Torso__13.CFrame:inverse() * v15.CFrame
			v16.Parent = p1
		end
	end
	local v17 = {}
	for v18 = 1, 6 do
		local v19 = Instance.new("Motor6D")
		v19.Part0 = v2[v18]
		v19.Part1 = v3[v18]
		v1 = v3[v18]
		v19.C0 = v2[v18].CFrame:inverse() * v1.CFrame
		v19.Parent = p1
		v19.MaxVelocity = 15
		table.insert(v17, v19)
	end
	local u1 = false
	local function u2()
		for v20, v21 in pairs(p1:GetChildren()) do
			if v21:IsA("Motor6D") then
				v21.DesiredAngle = 0
			end
		end
	end
	local u3 = { v17[2], v17[4], v17[6] }
	local u4 = { v17[1], v17[3], v17[5] }
	local u5 = false
	local u6 = false
	local function u7()
		if not p1.Parent then
			return
		end
		local v22 = 0.23 - p1.Parent.Humanoid.WalkSpeed / 250
		if u5 == false or u6 == true or u1 == true then
			return
		end
		u6 = true
		wait(v22)
		if u1 == true then
			u6 = false
			return
		end
		u3[1].DesiredAngle = math.pi / 7
		u3[2].DesiredAngle = math.pi / 7 * -1
		u3[3].DesiredAngle = math.pi / 7 * -1
		u4[1].DesiredAngle = math.pi / 7 * -1
		u4[2].DesiredAngle = 0
		u4[3].DesiredAngle = 0
		wait(v22)
		if u1 == true then
			u6 = false
			return
		end
		u3[2].DesiredAngle = math.pi / 7
		u3[1].DesiredAngle = 0
		u3[3].DesiredAngle = 0
		u4[1].DesiredAngle = math.pi / 7
		u4[2].DesiredAngle = math.pi / 7
		u4[3].DesiredAngle = math.pi / 7 * -1
		u6 = false
		if u5 == true then
			u7()
		end
		u2()
	end
	local l__Head__8 = p1.Parent.Head
	local l__WalkSpeed__9 = l__Humanoid__4.WalkSpeed
	l__Humanoid__4.Running:connect(function(p2)
		if not (p2 > 1) or u1 ~= false then
			if l__Head__8:FindFirstChild("Running") then
				l__Head__8:FindFirstChild("Running"):pause()
			end
			u5 = false
			return
		end
		if l__Head__8:FindFirstChild("Running") then
			local l__Running__23 = l__Head__8:FindFirstChild("Running")
			l__Running__23:play()
			l__Running__23.Pitch = l__WalkSpeed__9 / 2.5
		end
		u5 = true
		u7()
	end)
	local function u10()
		u1 = true
		u2()
		u3[1].DesiredAngle = math.pi / 3
		u3[2].DesiredAngle = math.pi / 3 * -1
		u3[3].DesiredAngle = math.pi / 3 * -1
		u4[1].DesiredAngle = math.pi / 3
		u4[2].DesiredAngle = math.pi / 3
		u4[3].DesiredAngle = math.pi / 3 * -1
		for v24 = 0, 1, 0.2 do
			wait()
			v5[1].C0 = v5[1].C0:lerp(v5[1].C0 * CFrame.fromEulerAnglesXYZ(0, 0.4, 0), v24)
			v5[2].C0 = v5[2].C0:lerp(v5[2].C0 * CFrame.fromEulerAnglesXYZ(0, 0.4, 0), v24)
			v5[3].C0 = v5[3].C0:lerp(v5[3].C0 * CFrame.fromEulerAnglesXYZ(0, 0.4, 0), v24)
			v5[4].C0 = v5[4].C0:lerp(v5[4].C0 * CFrame.fromEulerAnglesXYZ(0, 0.4, 0), v24)
			v5[5].C0 = v5[5].C0:lerp(v5[5].C0 * CFrame.fromEulerAnglesXYZ(0, 0.4, 0), v24)
			v5[6].C0 = v5[6].C0:lerp(v5[6].C0 * CFrame.fromEulerAnglesXYZ(0, 0.4, 0), v24)
		end
		for v25 = 0, 1, 0.2 do
			wait()
			v5[1].C0 = v5[1].C0:lerp(v5[1].C0 * CFrame.fromEulerAnglesXYZ(0, -0.4, 0), v25)
			v5[2].C0 = v5[2].C0:lerp(v5[2].C0 * CFrame.fromEulerAnglesXYZ(0, -0.4, 0), v25)
			v5[3].C0 = v5[3].C0:lerp(v5[3].C0 * CFrame.fromEulerAnglesXYZ(0, -0.4, 0), v25)
			v5[4].C0 = v5[4].C0:lerp(v5[4].C0 * CFrame.fromEulerAnglesXYZ(0, -0.4, 0), v25)
			v5[5].C0 = v5[5].C0:lerp(v5[5].C0 * CFrame.fromEulerAnglesXYZ(0, -0.4, 0), v25)
			v5[6].C0 = v5[6].C0:lerp(v5[6].C0 * CFrame.fromEulerAnglesXYZ(0, -0.4, 0), v25)
		end
		u2()
		u1 = false
	end
	local function u11()
		u1 = true
		u2()
		for v26 = 0, 1, 0.2 do
			wait()
			v5[1].C0 = v5[1].C0:lerp(v5[1].C0 * CFrame.fromEulerAnglesXYZ(0, 0.4, 0), v26)
			v5[2].C0 = v5[2].C0:lerp(v5[2].C0 * CFrame.fromEulerAnglesXYZ(0, 0.4, 0), v26)
			v5[3].C0 = v5[3].C0:lerp(v5[3].C0 * CFrame.fromEulerAnglesXYZ(0, 0.4, 0), v26)
			v5[4].C0 = v5[4].C0:lerp(v5[4].C0 * CFrame.fromEulerAnglesXYZ(0, 0.4, 0), v26)
			v5[5].C0 = v5[5].C0:lerp(v5[5].C0 * CFrame.fromEulerAnglesXYZ(0, 0.4, 0), v26)
			v5[6].C0 = v5[6].C0:lerp(v5[6].C0 * CFrame.fromEulerAnglesXYZ(0, 0.4, 0), v26)
		end
		for v27 = 0, 1, 0.2 do
			wait()
			v5[1].C0 = v5[1].C0:lerp(v5[1].C0 * CFrame.fromEulerAnglesXYZ(0, -0.4, 0), v27)
			v5[2].C0 = v5[2].C0:lerp(v5[2].C0 * CFrame.fromEulerAnglesXYZ(0, -0.4, 0), v27)
			v5[3].C0 = v5[3].C0:lerp(v5[3].C0 * CFrame.fromEulerAnglesXYZ(0, -0.4, 0), v27)
			v5[4].C0 = v5[4].C0:lerp(v5[4].C0 * CFrame.fromEulerAnglesXYZ(0, -0.4, 0), v27)
			v5[5].C0 = v5[5].C0:lerp(v5[5].C0 * CFrame.fromEulerAnglesXYZ(0, -0.4, 0), v27)
			v5[6].C0 = v5[6].C0:lerp(v5[6].C0 * CFrame.fromEulerAnglesXYZ(0, -0.4, 0), v27)
		end
		u1 = false
	end
	l__Humanoid__4.StateChanged:connect(function(p3, p4)
		if p4 == Enum.HumanoidStateType.Jumping then
			if not (l__Torso__13.Velocity.magnitude > 5) then
				u11()
				return
			end
		else
			return
		end
		u10()
	end)
end
