# Dynamic NPC Emotion System

A lightweight Roblox system that gives NPCs dynamic emotions based on player actions.
Emotions include:
- Happy
- Scared
- Annoyed
- Curious

The NPC’s head UI updates automatically, and emotions decay over time.

---

## 📥 Installation

1. Put **EmotionSystem.server.lua** inside  
   ➤ `ServerScriptService`

2. Put **EmotionModule.lua** and **EmotionEvents.lua** inside  
   ➤ `ReplicatedStorage`

3. Put **NPCEmotionClient.client.lua** inside  
   ➤ `StarterPlayerScripts`

4. Insert the NPC model from `npc_assets/ExampleNPC.rbxm` into your Workspace  
   *(you can export any NPC and rename it to this)*

---

## 🔧 How it Works

Players trigger NPC emotions:

| Player Action | NPC Emotion |
|---------------|-------------|
| Jumping       | Curious     |
| Waving        | Happy       |
| Running into NPC | Annoyed |
| Explosions nearby | Scared |

Emotions automatically decay after a short delay.

---

## 🧪 Features

- Fully modular code  
- Easy to expand with more emotions  
- Billboard UI updates above NPC heads  
- Decay timers  
- Server → client syncing  

---

## 📄 License  

Copyright (c) 2025 Dsnon

All Rights Reserved.

You may view this code and use it, but claiming and modifying it as your own is strictly prohibited without written permission from the author.
By accessing this repository, you acknowledge and agree to these terms.
