local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local Events = ReplicatedStorage:WaitForChild("EmotionEvents")
local EmotionController = require(ReplicatedStorage:WaitForChild("EmotionController"))
local DialogueModule = require(script.Parent.DialogueModule)
local NPCConfig = require(ReplicatedStorage.NPCConfig)

local updateEvent = Events:WaitForChild("UpdateEmotion")

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(char)
		local hum = char:WaitForChild("Humanoid")

		hum.StateChanged:Connect(function(_, new)
			if new == Enum.HumanoidStateType.Jumping then
				updateEvent:FireAllClients(char, "Curious")
			end
		end)
	end)
end)

workspace.ChildAdded:Connect(function(obj)
	if obj:IsA("Explosion") then
		updateEvent:FireAllClients(obj, "Scared")
	end
end)

