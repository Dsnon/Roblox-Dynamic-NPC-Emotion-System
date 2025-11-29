local NPCConfig = {}

NPCConfig.Personalities = {
  Calm = {
    ScareSensitivity = 0.2,
    AnnoyChance = 0.1,
    HappyBoost = 1.4,
  },
  Chaotic = {
    ScareSensitivity = 1.2,
    AnnoyChance = 0.8,
    HappyBoost = 0.7,
  },
  Friendly = {
    ScareSensitivity = 0.5,
    AnnoyChance = 0.2,
    HappyBoost = 2.0,
  },
}

NPCConfig.DefaultPersonality = "Friendly"

NPCConfig.Debug = true

return NPCConfig
