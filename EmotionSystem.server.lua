-- EmotionSystem.server.lua (FINAL UPDATED VERSION)

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

local EmotionEvents = ReplicatedStorage:WaitForChild("EmotionEvents")
local EmotionController = require(ReplicatedStorage:WaitForChild("EmotionController"))
local DialogueModule = require(script.Parent.DialogueModule)
local NPCConfig = require(ReplicatedStorage:WaitForChild("NPCConfig"))

local updateEmotionEvent = EmotionEvents:WaitForChild("UpdateEmotion")

-- 🔧 Helper: Trigger emotion for all NPCs
local function triggerEmotion(emotion)
	updateEmotionEvent:FireAllClients(nil, emotion)
end

-- 🔧 Helper: Trigger emotion for NPC nearest to source object
local function triggerEmotionNear(sourceObj, emotion, radius)
	for _, npc in ipairs(workspace:GetChildren()) do
		if npc:FindFirstChild("Humanoid") and npc:FindFirstChild("Head") then
			local dist = (npc.Head.Position - sourceObj.Position).Magnitude
			if dist <= radius then
				EmotionController:BlendEmotion(npc, emotion)
				updateEmotionEvent:FireAllClients(npc, emotion)
			end
		end
	end
end

-- 🧍 Player-based emotion triggers
Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local hum = character:WaitForChild("Humanoid")

		-- Jump → Curious reaction
		hum.StateChanged:Connect(function(_, new)
			if new == Enum.HumanoidStateType.Jumping then
				triggerEmotion("Curious")
			end
		end)

		-- Running into NPC → Annoyed reaction
		hum.Touched:Connect(function(hit)
			if hit.Parent and hit.Parent:FindFirstChild("Humanoid") then
				local npc = hit.Parent
				EmotionController:BlendEmotion(npc, "Annoyed")
				updateEmotionEvent:FireAllClients(npc, "Annoyed")
			end
		end)
	end)
end)

-- 💥 Explosion → Scared reaction
workspace.ChildAdded:Connect(function(obj)
	if obj:IsA("Explosion") then
		triggerEmotionNear(obj, "S
	end
end)

-- RemoteEvent for custom triggers
-- Developers can manually trigger emotion like:
-- game.ReplicatedStorage.EmotionEvents.UpdatedEmotion:FireAllClients(npc, "Happy")
EmotionEvents.UpdateEmotion.OnServerEvent:Connect(function(player, npc, emotion)
	if npc and emotion then
		EmotionController:BlendEmotion(npc, emotion)
		updateEmotionEvent:FireAllClients(npc, emotion)
	end
end)

print("[EmotionSystem] Loaded successfully.")
			
