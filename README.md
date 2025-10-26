# 🎮 Mini Games - RPG with Google Gemini

[![Python](https://img.shields.io/badge/Python-3.8%2B-blue.svg)](https://python.org)
[![Gemini](https://img.shields.io/badge/Google-Gemini%201.5%20Pro-green.svg)](https://ai.google.dev)
[![Pygame](https://img.shields.io/badge/Pygame-CE%202.5.2-red.svg)](https://pyga.me)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)


### **Get API Key**
1. 🌐 Go to: **[Google AI Studio](https://aistudio.google.com)**
2. 🔑 Create an account and get a **free** API key
3. 📝 Set it up in the Python files 

#### **Configure in Files:**

**🖥️ Terminal RPG** (`rpg_with_gemini/terminal_rpg/rpg.py`, line 12):
```python
API_KEY = 'YOUR_KEY_HERE'  # 👈 Replace with your actual key
```

**🎨 Graphical RPG** (`rpg_with_gemini/graphical_rpg/graphical_rpg.py`, line 16):
```python
API_KEY = 'YOUR_KEY_HERE'  # 👈 Replace with your actual key
```

---

## 🎮 How to Play

### 🖥️ **Terminal RPG**
```bash
cd rpg_with_gemini/terminal_rpg
source ../../venv/bin/activate
chmod +x install_dependencies.sh && chmod +x check_env.sh
./install_dependencies.sh
./check_env.sh
python3 rpg.py
```

###  **🎨Graphical RPG**
```bash
cd rpg_with_gemini/graphical_rpg  
source ../../venv/bin/activate
chmod +x install_dependencies.sh && chmod +x check_env.sh
./install_dependencies.sh
./check_env.sh
python3 graphical_rpg.py
```

### Observation

This was my first small project, made during the summer break of my first year of college. The goal was to create a kind of RPG using AI. It was one of the first programs I wrote, so it isn't very well modularized and error handling is scattered throughout the code.

The idea was to have some fixed metrics that the AI would control automatically, but the AI is definitely not great at remembering values for long (try it!). Since Gemini has a free API, I wanted to build something that used it.

I also wanted to be able to continue the RPG later, so I recorded everything the AI did — in a summarized form — and saved it to a file when exiting the game. That way, when I returned, the AI would read the file and have context about what I had already done. This system isn't well structured and the AI still has a context limit, so it will eventually forget past events. Someday I plan to build a better long-term memory system, probably using more variables and even a database.


## Game Demo
### UI RPG
<img width="1331" height="757" alt="Captura de tela de 2025-10-25 21-29-09" src="https://github.com/user-attachments/assets/33aa6660-3122-4290-b8b7-2610c2b30d84" />
<img width="1337" height="765" alt="Captura de tela de 2025-10-25 21-26-30" src="https://github.com/user-attachments/assets/4779fa74-17d9-47f7-a8d0-8d36adc8a9fa" />
<img width="1340" height="753" alt="Captura de tela de 2025-10-25 21-31-00" src="https://github.com/user-attachments/assets/1a54578a-3f40-4f6b-a675-79ef5b29d591" />

### Terminal RPG

<img width="1836" height="962" alt="Captura de tela de 2025-10-25 20-58-19" src="https://github.com/user-attachments/assets/9bab34bd-339e-4359-8728-923f8276ced9" />





