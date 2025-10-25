#!/bin/bash
# Script to install all dependencies for terminal_rpg

echo "==================================="
echo "Installing terminal_rpg dependencies..."
echo "==================================="

# Check if Python3 is installed
if ! command -v python3 &> /dev/null; then
    echo "ERROR: Python3 is not installed!"
    echo "Please install Python3 before running this script."
    exit 1
fi

# Check if pip is installed
if ! command -v pip3 &> /dev/null; then
    echo "ERROR: pip3 is not installed!"
    echo "Please install pip3 before running this script."
    exit 1
fi

echo "Python3 and pip3 are installed."
echo ""

# Upgrade pip
echo "Upgrading pip..."
pip3 install --upgrade pip

echo ""
echo "Installing required Python packages..."
echo ""

# Install from requirements.txt if it exists, otherwise install individually
if [ -f "requirements.txt" ]; then
    echo "Installing from requirements.txt..."
    pip3 install -r requirements.txt
else
    # Install google-generativeai
    echo "Installing google-generativeai..."
    pip3 install google-generativeai
fi

echo ""
echo "==================================="
echo "Installation completed successfully!"
echo "==================================="
echo ""
echo "Next steps:"
echo "1. Edit rpg.py and replace 'YOUR API KEY' with your actual Google Gemini API key"
echo "2. Run './check_env.sh' to verify the installation"
echo "3. Run 'python3 rpg.py' to start the game"
