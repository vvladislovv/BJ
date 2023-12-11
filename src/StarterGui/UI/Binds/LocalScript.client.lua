wait(10)

local UserInputService = game:GetService("UserInputService")
local Utilities = require(game.ReplicatedStorage.Utilities)
_G.PData = game.ReplicatedStorage.Remotes.GetPlayerData:InvokeServer()
local tr = {
	[1] = Enum.KeyCode.One,
	[2] = Enum.KeyCode.Two,
	[3] = Enum.KeyCode.Three,
	[4] = Enum.KeyCode.Four,
	[5] = Enum.KeyCode.Five,
}

function Animate(Button)
	spawn(function()
		Button:TweenSize(UDim2.new(0,85,0,85), "Out", "Back", 0.2, true)
		wait(0.2)
		Button:TweenSize(UDim2.new(0,69,0,69), "Out", "Back", 0.2, true)
	end)
end

UserInputService.InputBegan:Connect(function(Input, GPE)
	if not GPE and _G.PData ~= nil then
		if Input.KeyCode == tr[1] then
			if _G.PData.Binds[1].Item ~= "" then
				game.ReplicatedStorage.Remotes.Item:FireServer(_G.PData.Binds[1].Item)
				Animate(script.Parent[1])
			end
		elseif Input.KeyCode == tr[2] then
			if _G.PData.Binds[2].Item ~= "" then
				game.ReplicatedStorage.Remotes.Item:FireServer(_G.PData.Binds[2].Item)
				Animate(script.Parent[2])
			end
		elseif Input.KeyCode == tr[3] then
			if _G.PData.Binds[3].Item ~= "" then
				game.ReplicatedStorage.Remotes.Item:FireServer(_G.PData.Binds[3].Item)
				Animate(script.Parent[3])
			end
		elseif Input.KeyCode == tr[4] then
			if _G.PData.Binds[4].Item ~= "" then
				game.ReplicatedStorage.Remotes.Item:FireServer(_G.PData.Binds[4].Item)
				Animate(script.Parent[4])
			end
		elseif Input.KeyCode == tr[5] then
			if _G.PData.Binds[5].Item ~= "" then
				game.ReplicatedStorage.Remotes.Item:FireServer(_G.PData.Binds[5].Item)
				Animate(script.Parent[5])
			end
		end
	end
end)

for i,v in pairs(script.Parent:GetChildren()) do
	if v:IsA("ImageButton") then
		v.Number.Text = "["..v.Name.."]"
		if _G.PData.Binds[tonumber(v.Name)].Item ~= "" then
			v.Item.Image = require(game.ReplicatedStorage.Modules.Items).Eggs[_G.PData.Binds[tonumber(v.Name)].Item].Image
			v.Count.Text = "x".._G.PData.Inventory[_G.PData.Binds[tonumber(v.Name)].Item]
		end
		v.MouseButton1Click:Connect(function()
			if _G.PData.Binds[tonumber(v.Name)].Item ~= "" then
				Animate(v)
				game.ReplicatedStorage.Remotes.Item:FireServer(_G.PData.Binds[tonumber(v.Name)].Item)
			end
		end)
	end
end

game:GetService("RunService").RenderStepped:Connect(function()
	for i,v in pairs(script.Parent:GetChildren()) do
		if v:IsA("ImageButton") and _G.PData ~= nil then
			if _G.PData.Binds[tonumber(v.Name)].Item ~= "" then
				if not _G.PData.Cooldowns2[_G.PData.Binds[tonumber(v.Name)].Item] then
					v.Timer.Visible = false
					v.Count.Text = "x".._G.PData.Inventory[_G.PData.Binds[tonumber(v.Name)].Item]
				else
					v.Timer.Visible = true
					v.Timer.TextLabel.Text = Utilities:FormatTime(_G.PData.Cooldowns2[_G.PData.Binds[tonumber(v.Name)].Item].Time - os.time())
					v.Count.Text = "x".._G.PData.Inventory[_G.PData.Binds[tonumber(v.Name)].Item]
				end
			else
				v.Count.Text = ""
			end
		end
	end
end)