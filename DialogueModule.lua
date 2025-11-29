local Dialogue = {}

Dialogue.Lines = {
	Happy = {"Nice to see you!", "You're fun to be around!"},
	Scared = {"Wh-what was that?!", "I don't feel safe..."},
	Annoyed = {"Can you not?", "Back off, please."},
	Curious = {"What's that you're doing?", "Interesting move!"},
}

function Dialogue:GetLine(emotion)
	local pool = self.Lines[emotion]
	if not pool then return "..." end
	return pool[math.random(1, #pool)]
end

return Dialogue
