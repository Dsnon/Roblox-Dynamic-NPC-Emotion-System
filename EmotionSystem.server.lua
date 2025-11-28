local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local EmotionEvents = ReplicatedStorage:WaitForChild("EmotionEvents")
local EmotionModule = require(ReplicatedStorage:WaitForChild("EmotionModule"))

local updateEvent = EmotionEvents:WaitForChild("UpdateEmotion")

--Trigger the emotions from player actions 
Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        local humanoid = char:WaitForChild("Humanoid")

        humanoid.StateChanged:Connect(function(_, new)
            if new == Enum.HumanoidStateType.Jumping then
              updateEvent:FireAllClients(char, "Curious")
            end
          end)
      end)
  end)
end)

-- Explosion > Scared NPCs
workspace.ChildAdded:Connect(function(obj)
  if obj:IsA("Explosion") then
    updateEvent:FireALlClients(obj, "Scared")
  end
end)
