-- Decompiled with the Synapse X Luau decompiler.

local v1 = {}
v1.__index = v1
local u1 = nil
local u2 = 0
function v1.new(p1)
	if not p1 then
		p1 = {}
	end
	if not p1.Model then
		error("no model associated with orbiter")
	end
	local v2 = {}
	setmetatable(v2, v1)
	v2.Age = 0
	v2.Dur = p1.Dur
	v2.Scale = p1.Scale and 1
	v2.Active = true
	v2.Root = p1.Root
	v2.Model = p1.Model
	v2.LookVectorLast = v2.Model.CFrame.LookVector
	v2.OnDestroy = p1.OnDestroy
	v2.OnUpdate = p1.OnUpdate
	
	print(v2)
	v1.InitUpdate(v2)
	if u1[p1.Root] then
		v2.CycleAge = u1[p1.Root][1].CycleAge
		table.insert(u1[p1.Root], v2)
		v2:ArrangeSiblings()
	else
		v2.CycleAge = 0
		v2.AgeCycleOffset = 0
		u1[p1.Root] = v2
	end
	u2 = u2 + 1
	
	return v2
end
local u3 = 0.75 * math.pi
function v1.ArrangeSiblings(p2)
	local v4 = u1[p2.Root]
	if not v4 or #v4 <= 0 then
		return
	end
	local v5 = u3 / #v4
	for v6, v7 in ipairs(v4) do
		v7.AgeCycleOffset = (v6 - 1) * v5
	end
end
function v1.Destroy(p3, p4)
	local v8 = nil
	if not p3.Active then
		return
	end
	u2 = u2 - 1
	if p3.OnDestroy then
		p3:OnDestroy()
	end
	p3.Model:Destroy()
	if p4 then
		v8 = u1[p3.Root]
		if not v8 or not (#v8 > 1) then
			u1[p3.Root] = nil
			return
		end
	else
		return
	end
	local v9 = {}
	for v10, v11 in ipairs(v8) do
		if v11 ~= p3 then
			table.insert(v9, v11)
		end
	end
	u1[p3.Root] = v9
	p3:ArrangeSiblings()
end
function v1.UpdateCF(p5)
	print(p5)
	local l__CFrame__12 = p5.Root.CFrame
	local l__Position__13 = l__CFrame__12.Position
	local v14 = Vector3.new(l__Position__13.X, l__Position__13.Y + 5, l__Position__13.Z)
	local l__LookVector__15 = l__CFrame__12.LookVector
	local v16 = Vector3.new(l__LookVector__15.X, 0, l__LookVector__15.Z)
	local v17 = CFrame.new(v14, v14 + v16)
	local l__Scale__18 = p5.Scale
	local v19 = l__Scale__18 / 3
	local v20 = p5.CycleAge + p5.AgeCycleOffset
	local v21 = math.sin(v20 * 5)
	local v22 = 3 + 2.5 * v19
	local v23 = p5.LookVectorLast:Lerp(v16, 0.05)
	p5.LookVectorLast = v23
	local v24 = CFrame.new(v17.Position, v17.Position + v23):VectorToWorldSpace(Vector3.new(l__Scale__18 * v22 * math.sin(v20 * u3), 0, l__Scale__18 * v22 * math.cos(v20 * u3)))
	local v25 = v17.Position + Vector3.new(v24.X, l__Scale__18 * 2 * v21 + (3 + 2 * v19), v24.Z)
	local v26 = CFrame.new(v25, v25 + v23)
	p5.Model.CFrame = v26
	return v26
end
function v1.Update(p6, p7)
	if not p6.Active then
		return false
	end
	local l__Root__27 = p6.Root
	if not l__Root__27 or not l__Root__27.Parent then
		p6:Destroy(false)
		return false
	end
	p6.Age = p6.Age + p7
	p6.CycleAge = p6.CycleAge + p7
	if p6.Dur and p6.Dur <= p6.Age then
		
		p6:Destroy(false)
		return false
	end
	p6:UpdateCF()
	if p6.OnUpdate then
		p6:OnUpdate()
	end
	return true
end
function v1.InitUpdate(p1)
	if u1 then
		return false
	end
	u1 = {}
	local u4 = nil
	while true do
		wait()
		v1.Update(p1, 1)
	end
end
function v1.UpdateAll(p9)
	if not u1 then
		return false
	end
	local v28 = {}
	local v29 = 0
	local v30, v31, v32 = pairs(u1)
	while true do
		wait()
		local v33, v34 = v30(v31, v32)
		if not v33 then
			break
		end
		local v35 = {}
		for v36, v37 in ipairs(v34) do
			if v37:Update(p9) then
				table.insert(v35, v37)
			end
		end
		if #v35 > 0 then
			if #v35 ~= #v34 then
				v35[1]:ArrangeSiblings()
			end
			v28[v33] = v35
			v29 = v29 + 1
		end	
	end
	if v29 > 0 then
		u1 = v28
		return true
	end
	u1 = nil
	return false
end
return v1
