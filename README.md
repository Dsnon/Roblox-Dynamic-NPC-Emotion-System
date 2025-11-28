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

MIT License

Copyright (c) 2025 Dsnon

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.



