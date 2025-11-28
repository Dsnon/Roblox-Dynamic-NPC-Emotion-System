local ReplicatedStorage = game:GetService("ReplicatedStorage")

local folder = Instance.new("Folder")
folder.Name = "EmotionEvents"
folder.Parent = ReplicatedStorage

local event = Instance.new("RemoteEvent")
event.Name = "UpdateEmotion"
event.Parent = folder

return folder 
