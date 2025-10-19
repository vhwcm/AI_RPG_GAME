# 🎮 Mini Games - RPG with Google Gemini

[![Python](https://img.shields.io/badge/Python-3.8%2B-blue.svg)](https://python.org)
[![Gemini](https://img.shields.io/badge/Google-Gemini%201.5%20Pro-green.svg)](https://ai.google.dev)
[![Pygame](https://img.shields.io/badge/Pygame-CE%202.5.2-red.svg)](https://pyga.me)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> **Two strategy RPG games developed with artificial intelligence using Google Gemini AI**

## 📋 Table of Contents

- [📁 Project Structure](#-project-structure)
- [🚀 Quick Start](#-quick-start)
- [⚙️ Full Setup](#️-full-setup)
- [🎮 How to Play](#-how-to-play)
- [🔧 Features](#-features)
- [💻 Compatibility](#-compatibility)
- [🐛 Troubleshooting](#-troubleshooting)
- [📚 Documentation](#-documentation)
- [🤝 Contributing](#-contributing)

---

## 📁 Project Structure

```
mini_games/
├── 🎯 rpg_with_gemini/
│   ├── 🖥️ terminal_rpg/        # Terminal version
│   │   ├── rpg.py             # Main game
│   │   ├── worlds/            # Automatic saves
│   │   └── README.md          # Specific documentation
│   └── 🎨 graphical_rpg/      # Graphical version
│       ├── graphical_rpg.py   # Main game
│       ├── adventures/        # Saves (created automatically)
│       ├── leaders/           # 🖼️ Leader images (19 species)
│       ├── kingdoms/          # 🏰 Kingdom images
│       ├── music/             # 🎵 Sound effects
│       ├── Cinzel/            # 🔤 Custom fonts
│       └── README.md          # Specific documentation
├── 🐍 venv/                   # Python virtual environment
├── 📄 ENVIRONMENT_SETUP.md    # Detailed setup guide
├── 📄 TECHNICAL_CHANGES.md    # Technical change log
├── 📄 GEMINI_MODELS.md       # AI model information
├── 🔧 setup.sh               # Automatic setup script
├── 🔍 check_config.sh        # Verification script
├── 🎮 run_games.sh           # Menu to run games
└── 📄 README.md              # This file
```

---

## 🚀 Quick Start

### 1️⃣ **Automatic Setup**
```bash
# Clone the repository
git clone https://github.com/vhwcm/mini_games.git
cd mini_games

# Run the automatic setup
chmod +x setup.sh
./setup.sh
```

### 2️⃣ **Get API Key**
1. 🌐 Go to: **[Google AI Studio](https://aistudio.google.com)**
2. 🔑 Create an account and get a **free** API key
3. 📝 Set it up in the Python files (see [Setup](#️-full-setup) section)

### 3️⃣ **Run Games**
```bash
# Check if everything is OK
./check_config.sh

# Play
./run_games.sh
```

---

## ⚙️ Full Setup

This section is a placeholder. For detailed instructions, please refer to `ENVIRONMENT_SETUP.md`.

### 🔑 **Google Gemini API Configuration**

#### **Get API Key:**
1. 🌐 Go to: **[Google AI Studio](https://aistudio.google.com)**
2. 🔐 Log in with your Google account
3. ➕ Click on **"Get API Key"** → **"Create API Key"**
4. 📋 Copy the generated key (format: `AIzaSyA...`)

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
python3 rpg.py
```

**Features:**
- 📝 Text-based interface
- 🌟 **Any species/race** you can imagine
- 💾 Automatic saving in `worlds/`
- 👥 Basic multiplayer system (same file)
- ⏰ Type **"quit"** to exit

### � **Graphical RPG**
```bash
cd rpg_with_gemini/graphical_rpg  
source ../../venv/bin/activate
python3 graphical_rpg.py
```
