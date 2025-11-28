local EmotionModule = {}

EmotionModule.Emotions = {
  Happy = {Decay = 3, Color = Color3.new(1, 1, 0.3)},
  Scared = {Decay = 5, COlor = Color3.new(1, 0.3, 0.3)},
  Annoyed = {Decay = 4, Color = color3.new(1, 0.5, 0.1)},
  Curious = {Decay = 2, Color = Color3.new(0.4, 0.7, 1)},
}

function EmotionModule:SetEmotion(npc, emotion)
  if not npc:FindFirstChild("EmotionValue") then
    local val = Instance.new("StringValue")
    val.Name = "EmotionValue"
    val.Parent = npc
  end

  npc.EmotionValue.Value = emotion
end

return EmotionModule
