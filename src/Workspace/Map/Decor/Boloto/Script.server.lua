local TS = game:GetService("TweenService")

for i,v in pairs(script.Parent:GetChildren()) do
	if v:IsA("UnionOperation") and v.Name == "Water" then
		v.Touched:Connect(function(Foot)
			if Foot.Name == "LeftFoot" or Foot.Name == "RightFoot" then
				spawn(function()
				local Part = script.FootStep:Clone()
					Part.Parent = workspace
					Part.Position = Vector3.new(Foot.Position.X, v.Position.Y + 1.5, Foot.Position.Z)
					Part.Orientation = Vector3.new(0,math.random(-180,180),0)
					TS:Create(Part, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Size = Vector3.new(6,1,6)}):Play()
					TS:Create(Part.Decal, TweenInfo.new(1, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {Transparency = 1}):Play()
					wait(1)
					Part:Destroy()
				end)
			end
		end)
	end
end