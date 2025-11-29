local EmotionModule = require(script.Parent.EmotionModule)
local NPCConfig = require(script.Parent.NPCConfig)

local EmotionController = {}

EmotionController.MoodMemory = {} -- NPC -> Last emotion weight 

function EmotionController:BlendEmotion(npc, emotion)
  local personality = NPCConfig.Personalities[
    npc:FindFirstChild("Personality") and npc.Personality.Value 
  ] or NPCConfig.Personalities[NPCConfig.DefaultPersonality]

  local memory = EmotionController.MoodMemory[npc] or {}
  memory[emotion] = (memory[emotion] or 0) + 1

  -- Dominant mood
  local dominant, max_ = "Neutral", 0
  for emo, val in pairs(memory) do 
    if val > max_ then
      max_ = val
      dominant = emo
    end
  end

  if NPCConfig.Debug then
    print(npc.Name .. " dominant mood ->", dominant)
  end

  EmotionModule:SetEmotion(npc, dominant)
  EmotionController.MoodMemory[npc] = memory
end

return EmotionController 
