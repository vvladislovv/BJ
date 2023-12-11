local messaging = game:GetService("MessagingService")
local admins = {"Cengdop", "Sanik2232"}
local Rep = game.ReplicatedStorage
local Remotes = Rep.Remotes
local Modules = Rep.Modules

local success, errormsg, connection = pcall (function()
	messaging:SubscribeAsync("Announcements", function(msg)
		print(msg.Data)
		print(msg.Send)
		game.ReplicatedStorage.IfSend.Value = true
		game.ReplicatedStorage.Reci:FireAllClients(msg.Data)
		wait(5)
		game.ReplicatedStorage.IfSend.Value = false
	end)
end)

local success, errormsg = pcall(function()
	game.ReplicatedStorage.Send.OnServerEvent:Connect(function(player, msg)
		for i,v in pairs(admins) do 
			if player.Name == v then
				messaging:PublishAsync("Announcements", msg)
			end
		end
	end)
end)

