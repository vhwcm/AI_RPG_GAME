#!/bin/bash
# Main script to verify dependencies and configuration for both RPG projects

echo "==========================================="
echo "RPG Project Environment Checker"
echo "==========================================="
echo ""

# Track overall status
ALL_OK=true

# Check if Python3 is installed
echo "[1/3] Checking Python3 installation..."
if ! command -v python3 &> /dev/null; then
    echo "  ✗ ERROR: Python3 is not installed!"
    ALL_OK=false
else
    PYTHON_VERSION=$(python3 --version)
    echo "  ✓ $PYTHON_VERSION is installed"
fi

echo ""

# Check terminal_rpg
echo "[2/3] Checking terminal_rpg environment..."
if [ -d "terminal_rpg" ]; then
    cd terminal_rpg
    if [ -f "check_env.sh" ]; then
        bash check_env.sh
        if [ $? -ne 0 ]; then
            ALL_OK=false
        fi
    else
        echo "  ✗ ERROR: check_env.sh not found in terminal_rpg/"
        ALL_OK=false
    fi
    cd ..
else
    echo "  ✗ ERROR: terminal_rpg/ directory not found!"
    ALL_OK=false
fi

echo ""

# Check ui_rpg
echo "[3/3] Checking ui_rpg environment..."
if [ -d "ui_rpg" ]; then
    cd ui_rpg
    if [ -f "check_env.sh" ]; then
        bash check_env.sh
        if [ $? -ne 0 ]; then
            ALL_OK=false
        fi
    else
        echo "  ✗ ERROR: check_env.sh not found in ui_rpg/"
        ALL_OK=false
    fi
    cd ..
else
    echo "  ✗ ERROR: ui_rpg/ directory not found!"
    ALL_OK=false
fi

echo ""
echo "==========================================="

if [ "$ALL_OK" = true ]; then
    echo "✓ All environment checks passed!"
    echo "==========================================="
    echo ""
    echo "Both projects are ready to run!"
    echo ""
    echo "To play the terminal version:"
    echo "  cd terminal_rpg && python3 rpg.py"
    echo ""
    echo "To play the graphical version:"
    echo "  cd ui_rpg && python3 rpg_grafico.py"
    exit 0
else
    echo "✗ Some environment checks failed!"
    echo "==========================================="
    echo ""
    echo "Please fix the errors above."
    echo ""
    echo "To install dependencies:"
    echo "  Terminal version: cd terminal_rpg && ./install_dependencies.sh"
    echo "  Graphical version: cd ui_rpg && ./install_dependencies.sh"
    exit 1
fi
