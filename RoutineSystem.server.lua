local RunService = game:GetService("RunService")

local function randomPoint()
  return Vector3.new(
    math.random(-30, 30),
    0,
    math.random(-30, 30)
  )
end

for _, npc in ipairs(workspace.NPCs:GetChildren()) do
  local humanoid = npc:WaitForChild("Humanoid")

  task.spawn(function()
      while task.wait(math.random(4, 9)) do
        local choice = math.random(1, 3)
        if choice == 1 then
          humanoid:MoveTo(npc.PrimaryPart.Position + randomPoint())
        elseif choice == 2 then
          humanoid.Jump = true
        else 
          npc.Head:FindFirstChild("EmotionUI").Emoji = "😐"
        end
      end
    end)
  end
end
