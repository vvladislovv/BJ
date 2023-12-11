local Particle = {}

function Particle:New(
	Adornee,
	Speed,
	Lifetime,
	Transparency,
	LightEmission,
	Color,
	ImageID,
	Style,
	RotationZ,
	RotationX,
	Direction,
	Emit
)
			if Style == "Default" then
				for i = 1,Emit do
	local newParticle = script.Particle:Clone()
	newParticle.Parent = Adornee
	newParticle.Position = Adornee.Position + Vector3.new(math.random(-3,3),math.random(-1,1),math.random(-3,3))
		newParticle.Particle.ParticleImage.Image = ImageID
		newParticle.PointLight.Range = 3*(LightEmission-2)
		game.Debris:AddItem(newParticle,Lifetime)
	newParticle.Trail.Color = ColorSequence.new{
		ColorSequenceKeypoint.new(0, Color),
		ColorSequenceKeypoint.new(1, Color)
	}
	newParticle.Particle.ParticleImage.ImageTransparency = Transparency
	newParticle.Particle.ParticleImage.ImageColor3 = Color
	newParticle.PointLight.Brightness = LightEmission
		local BodyForce = script.BodyForce:Clone()
				BodyForce.Parent = newParticle
			if Direction == "Top" then
				BodyForce.Force = Vector3.new(RotationX*Speed,math.abs(13*Lifetime*Speed),RotationZ*Speed)
				elseif Direction == "Down" then
				BodyForce.Force = Vector3.new(RotationX*Speed,-(math.abs(13*Lifetime*Speed)),RotationZ*Speed)
			elseif Direction == "Front" then
				BodyForce.Force = Vector3.new(RotationX*Speed,RotationZ*Speed,math.abs(13*Lifetime*Speed))
			elseif Direction == "Back" then
				BodyForce.Force = Vector3.new(RotationX*Speed,RotationZ*Speed,-(math.abs(13*Lifetime*Speed)))
			elseif Direction == "Left" then
				BodyForce.Force = Vector3.new(math.abs(13*Lifetime*Speed),0,RotationZ*Speed)
			elseif Direction == "Right" then
				BodyForce.Force = Vector3.new(-(math.abs(13*Lifetime*Speed)),0,RotationZ*Speed)

					end
	game.Debris:AddItem(BodyForce,.5)
		wait(0.01)
			end
		elseif Style == "Emit" then
			for i = 1,Emit do
			local newParticle = script.Particle:Clone()
			newParticle.Parent = Adornee
			newParticle.Position = Adornee.Position + Vector3.new(math.random(-3,3),math.random(-1,1),math.random(-3,3))
			newParticle.Particle.ParticleImage.Image = ImageID
			newParticle.PointLight.Range = 3*(LightEmission-2)
			game.Debris:AddItem(newParticle,Lifetime)
			newParticle.Trail.Color = ColorSequence.new{
				ColorSequenceKeypoint.new(0, Color),
				ColorSequenceKeypoint.new(1, Color)
			}
			newParticle.Particle.ParticleImage.ImageTransparency = Transparency
			newParticle.Particle.ParticleImage.ImageColor3 = Color
			newParticle.PointLight.Brightness = LightEmission
			local BodyForce = script.BodyForce:Clone()
		
			if Direction == "Top" then
				BodyForce.Force = Vector3.new(RotationX*Speed,math.abs(13*Lifetime*Speed),RotationZ*Speed)
			elseif Direction == "Down" then
				BodyForce.Force = Vector3.new(RotationX*Speed,-(math.abs(13*Lifetime*Speed)),RotationZ*Speed)
			elseif Direction == "Front" then
				BodyForce.Force = Vector3.new(RotationX*Speed,RotationZ*Speed,math.abs(13*Lifetime*Speed))
			elseif Direction == "Back" then
				BodyForce.Force = Vector3.new(RotationX*Speed,RotationZ*Speed,-(math.abs(13*Lifetime*Speed)))
			elseif Direction == "Left" then
				BodyForce.Force = Vector3.new(math.abs(13*Lifetime*Speed),0,RotationZ*Speed)
			elseif Direction == "Right" then
				BodyForce.Force = Vector3.new(-(math.abs(13*Lifetime*Speed)),0,RotationZ*Speed)
				end
				BodyForce.Parent = newParticle
				game.Debris:AddItem(BodyForce,.5)
				wait(0.01)
				end
				Adornee:SetAttribute("Enabled",false)

			elseif Style == "Tornado" then
				for i = 1,Emit do
					local newParticle = script.Particle:Clone()
					newParticle.Parent = Adornee
					newParticle.Position = Adornee.Position + Vector3.new(math.random(-3,3),math.random(-1,1),math.random(-3,3))
					newParticle.Particle.ParticleImage.Image = ImageID
					newParticle.PointLight.Range = 3*(LightEmission-2)
					game.Debris:AddItem(newParticle,Lifetime)
					newParticle.Trail.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0, Color),
						ColorSequenceKeypoint.new(1, Color)
					}
					newParticle.Particle.ParticleImage.ImageTransparency = Transparency
					newParticle.Particle.ParticleImage.ImageColor3 = Color
					newParticle.PointLight.Brightness = LightEmission
					local BodyForce = script.BodyForce:Clone()
					BodyForce.Parent = newParticle
					if Direction == "Top" then
						BodyForce.Force = Vector3.new(RotationX*Speed,math.abs(13*Lifetime*Speed),RotationZ*Speed)
					elseif Direction == "Down" then
						BodyForce.Force = Vector3.new(RotationX*Speed,-(math.abs(13*Lifetime*Speed)),RotationZ*Speed)
					elseif Direction == "Front" then
						BodyForce.Force = Vector3.new(RotationX*Speed,RotationZ*Speed,math.abs(13*Lifetime*Speed))
					elseif Direction == "Back" then
						BodyForce.Force = Vector3.new(RotationX*Speed,RotationZ*Speed,-(math.abs(13*Lifetime*Speed)))
					elseif Direction == "Left" then
						BodyForce.Force = Vector3.new(math.abs(13*Lifetime*Speed),0,RotationZ*Speed)
					elseif Direction == "Right" then
						BodyForce.Force = Vector3.new(-(math.abs(13*Lifetime*Speed)),0,RotationZ*Speed)

					end
					game.Debris:AddItem(BodyForce,.5)
					if Adornee.Parent:IsA("Model") then
						Adornee.Parent:SetPrimaryPartCFrame(Adornee.Parent:GetPrimaryPartCFrame() * CFrame.Angles(0,15,0))
						end
					wait(0.01)
				end
			elseif Style == "Explosion" then
				for i = 1,Emit do
					local newParticle = script.Particle:Clone()
					newParticle.Parent = Adornee
					newParticle.Position = Adornee.Position + Vector3.new(math.random(-3,3),math.random(-1,1),math.random(-3,3))
					newParticle.Particle.ParticleImage.Image = ImageID
					newParticle.PointLight.Range = 3*(LightEmission-2)
					game.Debris:AddItem(newParticle,Lifetime)
					newParticle.Trail.Color = ColorSequence.new{
						ColorSequenceKeypoint.new(0, Color),
						ColorSequenceKeypoint.new(1, Color)
					}
					newParticle.Particle.ParticleImage.ImageTransparency = Transparency
					newParticle.Particle.ParticleImage.ImageColor3 = Color
					newParticle.PointLight.Brightness = LightEmission
					local BodyForce = script.BodyForce:Clone()
					BodyForce.Parent = newParticle
					BodyForce.Force = Vector3.new((RotationX+RotationZ) * Speed,(RotationX+RotationZ) * Speed,(RotationX+RotationZ) * Speed)

					game.Debris:AddItem(BodyForce,.5)
					
					wait(0.01)
				end
				
				else
			for i = 1,Emit do
				local newParticle = script.Particle:Clone()
				newParticle.Parent = Adornee
				newParticle.Position = Adornee.Position + Vector3.new(math.random(-3,3),math.random(-1,1),math.random(-3,3))
				newParticle.Particle.ParticleImage.Image = ImageID
				newParticle.PointLight.Range = 3*(LightEmission-2)
				game.Debris:AddItem(newParticle,Lifetime)
				newParticle.Trail.Color = ColorSequence.new{
					ColorSequenceKeypoint.new(0, Color),
					ColorSequenceKeypoint.new(1, Color)
				}
				newParticle.Particle.ParticleImage.ImageTransparency = Transparency
				newParticle.Particle.ParticleImage.ImageColor3 = Color
				newParticle.PointLight.Brightness = LightEmission
				local BodyForce = script.BodyForce:Clone()
				BodyForce.Parent = newParticle
				if Direction == "Top" then
					BodyForce.Force = Vector3.new(RotationX*Speed,math.abs(13*Lifetime*Speed),RotationZ*Speed)
				elseif Direction == "Down" then
					BodyForce.Force = Vector3.new(RotationX*Speed,-(math.abs(13*Lifetime*Speed)),RotationZ*Speed)
				elseif Direction == "Front" then
					BodyForce.Force = Vector3.new(RotationX*Speed,RotationZ*Speed,math.abs(13*Lifetime*Speed))
				elseif Direction == "Back" then
					BodyForce.Force = Vector3.new(RotationX*Speed,RotationZ*Speed,-(math.abs(13*Lifetime*Speed)))
				elseif Direction == "Left" then
					BodyForce.Force = Vector3.new(math.abs(13*Lifetime*Speed),0,RotationZ*Speed)
				elseif Direction == "Right" then
					BodyForce.Force = Vector3.new(-(math.abs(13*Lifetime*Speed)),0,RotationZ*Speed)

				end
				game.Debris:AddItem(BodyForce,.5)
				wait(0.01)
				end
			end
end

return Particle
