#!/bin/bash
# Script to install all dependencies for terminal_rpg using a virtual environment

echo "==================================="
echo "Installing terminal_rpg dependencies..."
echo "==================================="

# Check if Python3 is installed
if ! command -v python3 &> /dev/null; then
    echo "ERROR: Python3 is not installed!"
    echo "Please install Python3 before running this script."
    exit 1
fi

echo "Python3 is installed."
echo ""

# Create virtual environment if it doesn't exist
VENV_DIR="venv"
if [ ! -d "$VENV_DIR" ]; then
    echo "Creating virtual environment..."
    python3 -m venv "$VENV_DIR"
    
    if [ $? -ne 0 ]; then
        echo ""
        echo "ERROR: Failed to create virtual environment!"
        echo "You may need to install python3-venv:"
        echo "  sudo apt install python3-venv python3-full"
        exit 1
    fi
    
    echo "✓ Virtual environment created successfully"
else
    echo "✓ Virtual environment already exists"
fi

echo ""

# Activate virtual environment
echo "Activating virtual environment..."
source "$VENV_DIR/bin/activate"

# Upgrade pip in virtual environment
echo "Upgrading pip..."
pip install --upgrade pip --quiet

echo ""
echo "Installing required Python packages..."
echo ""

# Install from requirements.txt if it exists, otherwise install individually
if [ -f "requirements.txt" ]; then
    echo "Installing from requirements.txt..."
    pip install -r requirements.txt
else
    # Install google-generativeai
    echo "Installing google-generativeai..."
    pip install google-generativeai
fi

echo ""
echo "==================================="
echo "Installation completed successfully!"
echo "==================================="
echo ""
echo "✓ Virtual environment created at: $VENV_DIR/"
echo "✓ All dependencies installed"
echo ""
echo "Next steps:"
echo "1. Edit rpg.py and replace 'YOUR API KEY' with your actual Google Gemini API key"
echo "2. Run './check_env.sh' to verify the installation"
echo "3. Run the game with: ./run.sh"
echo ""
echo "Note: A 'run.sh' script has been created to automatically activate"
echo "      the virtual environment and start the game."
