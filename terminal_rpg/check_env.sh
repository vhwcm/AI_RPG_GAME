#!/bin/bash
# Script to verify dependencies and API key configuration for terminal_rpg

echo "==================================="
echo "Checking terminal_rpg environment..."
echo "==================================="
echo ""

# Track overall status
ALL_OK=true

# Check if Python3 is installed
echo "[1/6] Checking Python3..."
if ! command -v python3 &> /dev/null; then
    echo "  ✗ ERROR: Python3 is not installed!"
    ALL_OK=false
else
    PYTHON_VERSION=$(python3 --version)
    echo "  ✓ $PYTHON_VERSION is installed"
fi

echo ""

# Check if virtual environment exists
echo "[2/6] Checking virtual environment..."
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
    echo "[3/6] Checking pip in virtual environment..."
    if ! command -v pip &> /dev/null; then
        echo "  ✗ ERROR: pip is not installed in virtual environment!"
        ALL_OK=false
    else
        echo "  ✓ pip is installed in virtual environment"
    fi
else
    PYTHON_CMD="python3"
    echo "[3/6] Checking pip3..."
    if ! command -v pip3 &> /dev/null; then
        echo "  ✗ ERROR: pip3 is not installed!"
        ALL_OK=false
    else
        echo "  ✓ pip3 is installed"
    fi
fi

echo ""

# Check if google-generativeai is installed
echo "[4/6] Checking Python packages..."
if ! $PYTHON_CMD -c "import google.generativeai" 2>/dev/null 1>/dev/null; then
    echo "  ✗ ERROR: google-generativeai is not installed!"
    echo "    Run './install_dependencies.sh' to install it"
    ALL_OK=false
else
    echo "  ✓ google-generativeai is installed"
fi

echo ""

# Check if required files exist
echo "[5/6] Checking required files..."
if [ ! -f "rpg.py" ]; then
    echo "  ✗ ERROR: rpg.py not found!"
    ALL_OK=false
else
    echo "  ✓ rpg.py found"
fi

echo ""

# Check if API key is configured
echo "[6/6] Checking API key configuration..."
if [ -f "rpg.py" ]; then
    if grep -q "API_KEY = 'YOUR API KEY'" rpg.py; then
        echo "  ✗ WARNING: API key is not configured!"
        echo "    Please edit rpg.py and replace 'YOUR API KEY' with your actual Google Gemini API key"
        ALL_OK=false
    elif grep -q "API_KEY = ''" rpg.py; then
        echo "  ✗ WARNING: API key is empty!"
        echo "    Please edit rpg.py and set your Google Gemini API key"
        ALL_OK=false
    else
        echo "  ✓ API key appears to be configured"
    fi
fi

echo ""

# Check if mundos directory exists
echo "Checking optional directories..."
if [ ! -d "mundos" ]; then
    echo "  ℹ INFO: 'mundos/' directory doesn't exist (will be created automatically)"
else
    echo "  ✓ 'mundos/' directory exists"
fi

echo ""
echo "==================================="

if [ "$ALL_OK" = true ]; then
    echo "✓ Environment check passed!"
    echo "==================================="
    echo ""
    echo "You can now run: ./run.sh"
    echo "Or manually: source venv/bin/activate && python rpg.py"
    exit 0
else
    echo "✗ Environment check failed!"
    echo "==================================="
    echo ""
    echo "Please fix the errors above before running the game."
    exit 1
fi
