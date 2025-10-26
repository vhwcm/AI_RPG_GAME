#!/bin/bash
# Script to verify dependencies and API key configuration for ui_rpg

echo "==================================="
echo "Checking ui_rpg environment..."
echo "==================================="
echo ""

# Track overall status
ALL_OK=true

# Check if Python3 is installed
echo "[1/8] Checking Python3..."
if ! command -v python3 &> /dev/null; then
    echo "  ✗ ERROR: Python3 is not installed!"
    ALL_OK=false
else
    PYTHON_VERSION=$(python3 --version)
    echo "  ✓ $PYTHON_VERSION is installed"
fi

echo ""

# Check if virtual environment exists
echo "[2/8] Checking virtual environment..."
if [ ! -d "venv" ]; then
    echo "  ✗ ERROR: Virtual environment not found!"
    echo "    Run './install_dependencies.sh' to create it"
    ALL_OK=false
else
    echo "  ✓ Virtual environment exists"
fi

echo ""

# Activate virtual environment for package checks
if [ -d "venv" ]; then
    source venv/bin/activate
    PYTHON_CMD="python"
    echo "[3/8] Checking pip in virtual environment..."
    if ! command -v pip &> /dev/null; then
        echo "  ✗ ERROR: pip is not installed in virtual environment!"
        ALL_OK=false
    else
        echo "  ✓ pip is installed in virtual environment"
    fi
else
    PYTHON_CMD="python3"
    echo "[3/8] Checking pip3..."
    if ! command -v pip3 &> /dev/null; then
        echo "  ✗ ERROR: pip3 is not installed!"
        ALL_OK=false
    else
        echo "  ✓ pip3 is installed"
    fi
fi

echo ""

# Check if required Python packages are installed
echo "[4/8] Checking Python packages..."
PACKAGES_OK=true

# Check pygame-ce (it's imported as 'pygame' but package is 'pygame-ce')
if ! $PYTHON_CMD -c "import pygame; pygame.init()" 2>/dev/null 1>/dev/null; then
    echo "  ✗ ERROR: pygame-ce is not installed!"
    PACKAGES_OK=false
    ALL_OK=false
else
    echo "  ✓ pygame-ce is installed"
fi

if ! $PYTHON_CMD -c "import pygame_gui" 2>/dev/null 1>/dev/null; then
    echo "  ✗ ERROR: pygame-gui is not installed!"
    PACKAGES_OK=false
    ALL_OK=false
else
    echo "  ✓ pygame-gui is installed"
fi

if ! $PYTHON_CMD -c "import google.generativeai" 2>/dev/null 1>/dev/null; then
    echo "  ✗ ERROR: google-generativeai is not installed!"
    PACKAGES_OK=false
    ALL_OK=false
else
    echo "  ✓ google-generativeai is installed"
fi

if [ "$PACKAGES_OK" = false ]; then
    echo ""
    echo "  Run './install_dependencies.sh' to install missing packages"
fi

echo ""

# Check if required files exist
echo "[5/8] Checking required files..."
if [ ! -f "rpg_grafico.py" ]; then
    echo "  ✗ ERROR: rpg_grafico.py not found!"
    ALL_OK=false
else
    echo "  ✓ rpg_grafico.py found"
fi

echo ""

# Check if API key is configured
echo "[6/8] Checking API key configuration..."
if [ -f "rpg_grafico.py" ]; then
    # Check if API key looks like a placeholder or is empty
    API_LINE=$(grep "^API_KEY = " rpg_grafico.py | head -n 1)
    if echo "$API_LINE" | grep -q "YOUR API KEY"; then
        echo "  ✗ WARNING: API key is not configured!"
        echo "    Please edit rpg_grafico.py and replace with your actual Google Gemini API key"
        ALL_OK=false
    elif echo "$API_LINE" | grep -q "API_KEY = ''"; then
        echo "  ✗ WARNING: API key is empty!"
        echo "    Please edit rpg_grafico.py and set your Google Gemini API key"
        ALL_OK=false
    else
        echo "  ✓ API key appears to be configured"
    fi
fi

echo ""

# Check if required directories exist
echo "[7/8] Checking required directories..."
REQUIRED_DIRS=("aventuras" "Cinzel" "lideres" "musicas" "reinos")
DIRS_OK=true

for dir in "${REQUIRED_DIRS[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "  ✗ ERROR: Directory '$dir/' not found!"
        DIRS_OK=false
        ALL_OK=false
    else
        echo "  ✓ Directory '$dir/' exists"
    fi
done

echo ""

# Check if required assets exist
echo "[8/8] Checking required assets..."
ASSETS_OK=true

if [ ! -f "Cinzel/Cinzel-VariableFont_wght.ttf" ]; then
    echo "  ✗ ERROR: Font file 'Cinzel/Cinzel-VariableFont_wght.ttf' not found!"
    ASSETS_OK=false
    ALL_OK=false
else
    echo "  ✓ Font file found"
fi

# Note: Not checking specific music/image files as they may vary
# Just warn if directories are empty
if [ -d "musicas" ]; then
    MUSIC_COUNT=$(find musicas -type f \( -name "*.mp3" -o -name "*.wav" -o -name "*.ogg" \) 2>/dev/null | wc -l)
    if [ "$MUSIC_COUNT" -eq 0 ]; then
        echo "  ⚠ WARNING: No music files found in 'musicas/' directory"
    else
        echo "  ✓ Music files found ($MUSIC_COUNT files)"
    fi
fi

if [ -d "lideres" ]; then
    LEADER_COUNT=$(find lideres -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) 2>/dev/null | wc -l)
    if [ "$LEADER_COUNT" -eq 0 ]; then
        echo "  ⚠ WARNING: No leader images found in 'lideres/' directory"
    else
        echo "  ✓ Leader images found ($LEADER_COUNT files)"
    fi
fi

if [ -d "reinos" ]; then
    REINO_COUNT=$(find reinos -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) 2>/dev/null | wc -l)
    if [ "$REINO_COUNT" -eq 0 ]; then
        echo "  ⚠ WARNING: No kingdom images found in 'reinos/' directory"
    else
        echo "  ✓ Kingdom images found ($REINO_COUNT files)"
    fi
fi

echo ""
echo "==================================="

if [ "$ALL_OK" = true ]; then
    echo "✓ Environment check passed!"
    echo "==================================="
    echo ""
    echo "You can now run: ./run.sh"
    echo "Or manually: source venv/bin/activate && python rpg_grafico.py"
    exit 0
else
    echo "✗ Environment check failed!"
    echo "==================================="
    echo ""
    echo "Please fix the errors above before running the game."
    exit 1
fi
