-- NPCConversationSystem.server.lua
-- NPCs automatically talk to each other based on distance, mood, and personality

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DialogueModule = require(ReplicatedStorage:WaitForChild("DialogueModule"))
local EmotionController = require(ReplicatedStorage:WaitForChild("EmotionController"))
local EmotionEvents = ReplicatedStorage:WaitForChild("EmotionEvents")

local CONVO_DISTANCE = 20 -- studs
local CONVO_COOLDOWN = 7 -- seconds
local RESPONSE_DELAY = 0.8 -- seconds

local npcCooldowns = {}

-- Checks if NPC can talk
local function canTalk(npc)
	if not npcCooldowns[npc] then return true end
	return (time() - npcCooldowns[npc]) >= CONVO_COOLDOWN
end

-- Marks NPC as busy
local function setCooldown(npc)
	npcCooldowns[npc] = time()
end

-- Finds nearby NPCs
local function findNearbyNPCs(npc)
	local nearby = {}
	if not npc:FindFirstChild("HumanoidRootPart") then return nearby end

	for _, other in ipairs(workspace:GetChildren()) do
		if other ~= npc and other:FindFirstChild("Humanoid") and other:FindFirstChild("HumanoidRootPart") then
			local dist = (other.HumanoidRootPart.Position - npc.HumanoidRootPart.Position).Magnitude
			if dist <= CONVO_DISTANCE then
				table.insert(nearby, other)
			end
		end
	end

	return nearby
end

-- Makes NPC talk visually
local function say(npc, emotion)
	EmotionEvents.UpdateEmotion:FireAllClients(npc, emotion)
end

-- Full conversation logic
local function attemptConversation(npc)
	if not canTalk(npc) then return end

	local nearby = findNearbyNPCs(npc)
	if #nearby == 0 then return end

	local other = nearby[math.random(1, #nearby)]
	if not canTalk(other) then return end

	-- Choose emotion to speak with
	local npcEmotion = EmotionController:GetDominantEmotion(npc)
	local otherEmotion = EmotionController:GetDominantEmotion(other)

	local starterLine = DialogueModule:GetLine(npcEmotion)
	local responseLine = DialogueModule:GetResponse(otherEmotion)

	-- Start convo
	say(npc, npcEmotion)
	setCooldown(npc)

	-- NPC B replies later
	task.delay(RESPONSE_DELAY, function()
		say(other, otherEmotion)
		setCooldown(other)
	end)
end

-- Loop over all NPCs
task.spawn(function()
	while true do
		for _, npc in ipairs(workspace:GetChildren()) do
			if npc:FindFirstChild("Humanoid") then
				-- Random small chance each cycle
				if math.random() < 0.25 then
					attemptConversation(npc)
				end
			end
		end
		task.wait(2)
	end
end)

print("[NPCConversationSystem] Loaded successfully.")
