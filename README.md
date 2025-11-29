<p align="center">
  <h1 align="center">Dynamic NPC Emotion System</h1>
  <p align="center">A realistic, personality-driven NPC emotion framework for Roblox games.</p>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Engine-Roblox-red?style=for-the-badge">
  <img src="https://img.shields.io/badge/Language-Luau-blue?style=for-the-badge">
  <img src="https://img.shields.io/badge/Version-2.0-purple?style=for-the-badge">
  <img src="https://img.shields.io/badge/Status-Active-brightgreen?style=for-the-badge">
</p>

---

## 🧩 How It Works

### 🔹 1. Player does an action  
Jump, wave, run into NPC, explosions, etc.

### 🔹 2. Server detects the action  
EmotionSystem fires `UpdateEmotion`.

### 🔹 3. Client shows UI updates  
Dialogue + emotion bubble appears.

### 🔹 4. Personality modifiers apply  
Friendly NPCs react differently than Chaotic ones.

### 🔹 5. Mood memory blends emotions  
If you annoy an NPC too much…  
they *stay annoyed* longer. 😉

---


It’s plug-and-play, easy to customize, and designed for ANY Roblox game.
The **Dynamic NPC Emotion System** adds lifelike behavior to NPCs using:
- Emotional states  
- Personalities  
- Mood memory  
- Dynamic dialogue  
- Small routines  
- Client/server syncing  

---

## 📥 Installation

1. Download or clone the repository.
2. Drag scripts into the correct Roblox services:

| File | Location |
|------|----------|
| EmotionSystem.server.lua | ServerScriptService |
| RoutineSystem.server.lua | ServerScriptService |
| DialogueModule.lua | ServerScriptService |
| EmotionModule.lua | ReplicatedStorage |
| EmotionController.lua | ReplicatedStorage |
| EmotionEvents.lua | ReplicatedStorage |
| NPCConfig.lua | ReplicatedStorage |
| NPCEmotionClient.client.lua | StarterPlayer → StarterPlayerScripts |
| ExampleNPC.rbxm | Insert into Workspace |
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
- NPCs feel emotions such as:
-    😄 **Happy**
-    😨 **Scared**
-    😠 **Annoyed**
-    🤔 **Curious**
-    😐 **Neutral**

Includes:
- Emotion blending  
- Mood memory 

---

### Personality System

Each NPC can be:
- **Calm** (hard to scare, rarely annoyed)  
- **Friendly** (happier, social)  
- **Chaotic** (reacts strongly to everything)

You can add **unlimited custom personalities**

---

### 💬 Dialogue System
NPCs speak based on their current emotion.

Examples:
- Happy → “Nice to see you!”  
- Annoyed → “Can you not?”  
- Scared → “What was THAT?!”  

---

### 🚶 Routine System
NPCs perform small behaviors:
- Wandering  
- Random jumping  
- Looking around  
- Idle actions  

This makes them feel alive.

---

## 📄 License  

Copyright (c) 2025 Dsnon

All Rights Reserved.

You may view this code and use it, but claiming and modifying it as your own is strictly prohibited without written permission from the author.
By accessing this repository, you acknowledge and agree to these terms.
