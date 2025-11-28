local ReplicatedStorage = game:GetService("ReplicatedStorage")
local EmotionEvents = ReplicatedStorage:WaitForChild("EmotionEvents")
local EmotionModule = require(ReplicatedStorage:WaitForChild("EmotionModule"))

local updateEvent = EmotionEvents:WaitFOrChild("UpdateEmotion")

-- Creates the Billboard UI
local function getBillboard(npc)
  if npc:FindFirstChild("EmotionUI") then return npc.EmotionUI end

  local billboard = Instance.new("BillboardGui")
  billboard.Name = "EmotionUI"
  billboard.Size = UDim2.new(0, 80, 0, 30)
  billboard.StudsOffset = Vector3.new(0, 4, 0)
  billboard.Adornee = npc:WaitForChild("Head")
  billboard.Parent = npc

  local label = Instance.New("TextLabel")
  label.Size = UDim2.fromScale(1, 1)
  label.BackgroundTransparency = 1
  label.TextScaled = true
  label.Font = Enum.Font.GothamBold
  label.TextColor3 = Color3.new(1, 1, 1)
  label.Name = "EmotionLabel"
  label.Parent = billboard

  return billboard
end

updateEvent.OnClientEvent:Connect(function(sourceObj, emotion)
    for _, npc in ipairs(workspace:GetChildren()) do
      if npc:FindFirstChild("Humanoid") then
        local ui = getBillboard(npc)
        local data = EmotionModule.Emotions[emotion]

        if data then
          ui.EmotionLabel.text = emotion
          ui.EmotionLabel.TextColor3 = data.Color

          task.delay(data.Decay, function()
					ui.EmotionLabel.Text = ""
				end)
			end
		end
	end
end)
