#!/bin/bash
# Master installation script for both RPG projects

echo "==========================================="
echo "RPG Project - Master Installer"
echo "==========================================="
echo ""
echo "This script will install dependencies for both versions of the RPG game."
echo ""

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

# Ask which version to install
echo "Which version would you like to install?"
echo "1) Terminal version only"
echo "2) Graphical version only"
echo "3) Both versions"
echo ""
read -p "Enter your choice (1-3): " choice

case $choice in
    1)
        echo ""
        echo "Installing terminal version..."
        cd terminal_rpg
        ./install_dependencies.sh
        cd ..
        ;;
    2)
        echo ""
        echo "Installing graphical version..."
        cd ui_rpg
        ./install_dependencies.sh
        cd ..
        ;;
    3)
        echo ""
        echo "Installing both versions..."
        echo ""
        echo "--- Installing terminal version ---"
        cd terminal_rpg
        ./install_dependencies.sh
        cd ..
        echo ""
        echo "--- Installing graphical version ---"
        cd ui_rpg
        ./install_dependencies.sh
        cd ..
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo ""
echo "==========================================="
echo "Installation completed!"
echo "==========================================="
echo ""
echo "IMPORTANT: Don't forget to configure your Google Gemini API key!"
echo ""
echo "Next steps:"
echo "1. Get your API key from: https://makersuite.google.com/app/apikey"

if [ "$choice" = "1" ] || [ "$choice" = "3" ]; then
    echo "2. Edit terminal_rpg/rpg.py and replace 'YOUR API KEY' with your actual key"
fi

if [ "$choice" = "2" ] || [ "$choice" = "3" ]; then
    echo "3. Edit ui_rpg/rpg_grafico.py and set the API_KEY variable with your actual key"
fi

echo ""
echo "To verify the installation, run: ./check_env.sh"
echo ""
