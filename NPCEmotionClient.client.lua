local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmotionEvents = ReplicatedStorage:WaitForChild("EmotionEvents")
local EmotionModule = require(ReplicatedStorage:WaitForChild("EmotionModule"))
local DialogueModule = require(ReplicatedStorage:WaitForChild("DialogueModule"))

local updateEvent = EmotionEvents:WaitForChild("UpdateEmotion")

-- Create or get the emotion UI
local function getBillboard(npc)
	if npc:FindFirstChild("EmotionUI") then return npc.EmotionUI end

	local billboard = Instance.new("BillboardGui")
	billboard.Name = "EmotionUI"
	billboard.Size = UDim2.new(0, 80, 0, 30)
	billboard.StudsOffset = Vector3.new(0, 4, 0)
	billboard.Adornee = npc:WaitForChild("Head")
	billboard.Parent = npc

	local label = Instance.new("TextLabel")
	label.Size = UDim2.fromScale(1, 1)
	label.BackgroundTransparency = 1
	label.TextScaled = true
	label.Font = Enum.Font.GothamBold
	label.TextColor3 = Color3.new(1, 1, 1)
	label.Name = "EmotionLabel"
	label.Parent = billboard

	return billboard
end

-- Dialogue bubble
local function showDialogue(npc, emotion)
	local dialogGui = npc:FindFirstChild("DialogueUI")
	if not dialogGui then
		dialogGui = Instance.new("BillboardGui")
		dialogGui.Name = "DialogueUI"
		dialogGui.Size = UDim2.new(0, 120, 0, 40)
		dialogGui.StudsOffset = Vector3.new(0, 6, 0)
		dialogGui.Adornee = npc:WaitForChild("Head")
		dialogGui.Parent = npc

		local label = Instance.new("TextLabel")
		label.Size = UDim2.fromScale(1, 1)
		label.BackgroundTransparency = 1
		label.TextScaled = true
		label.Font = Enum.Font.GothamSemibold
		label.Name = "DialogueLabel"
		label.Parent = dialogGui
	end

	dialogGui.DialogueLabel.Text = DialogueModule:GetLine(emotion)

	task.delay(3, function()
		if dialogGui then dialogGui.DialogueLabel.Text = "" end
	end)
end

-- When server triggers emotion:
updateEvent.OnClientEvent:Connect(function(sourceObj, emotion)
	for _, npc in ipairs(workspace:GetChildren()) do
		if npc:FindFirstChild("Humanoid") then
			local ui = getBillboard(npc)
			local data = EmotionModule.Emotions[emotion]

			if data then
				ui.EmotionLabel.Text = emotion
				ui.EmotionLabel.TextColor3 = data.Color

				-- show dialogue
				showDialogue(npc, emotion)

				-- decay emotion bubble
				task.delay(data.Decay, function()
					ui.EmotionLabel.Text = ""
				end)
			end
		end
	end
end)
