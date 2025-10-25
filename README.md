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

### � **Graphical RPG**
```bash
cd rpg_with_gemini/graphical_rpg  
source ../../venv/bin/activate
chmod +x install_dependencies.sh && chmod +x check_env.sh
./install_dependencies.sh
./check_env.sh
python3 graphical_rpg.py
```
