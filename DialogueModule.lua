local DialogueModule = {}

DialogueModule.Lines = {
	Happy = {
		"Nice day, right?",
		"I'm feeling great today!",
		"Lovely weather we're having.",
	},

	Annoyed = {
		"Ugh, seriously?",
		"Not in the mood right now.",
		"Can you give me space?",
	},

	Scared = {
		"What was THAT?",
		"Did you hear something?",
		"I don't like this...",
	},

	Curious = {
		"Hmm… interesting.",
		"What's that over there?",
		"You seem busy!",
	},

	Neutral = {
		"Hello.",
		"How are you?",
		"Nice seeing you.",
	},
}

DialogueModule.Responses = {
	Happy = {
		"Absolutely!",
		"Couldn't agree more!",
		"Yeah, it’s great!",
	},

	Annoyed = {
		"Chill out.",
		"Alright, alright.",
		"Okay then…",
	},

	Scared = {
		"Calm down, it's fine.",
		"I don’t think it was anything.",
		"Yikes… maybe.",
	},

	Curious = {
		"Oh really?",
		"What makes you say that?",
		"Interesting thought!",
	},

	Neutral = {
		"Yep.",
		"Sure.",
		"Right.",
	},
}

function DialogueModule:GetLine(emotion)
	local list = self.Lines[emotion]
	return list[math.random(1, #list)]
end

function DialogueModule:GetResponse(emotion)
	local list = self.Responses[emotion]
	return list[math.random(1, #list)]
end

return DialogueModule
