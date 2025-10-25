#!/bin/bash
# Script to run terminal_rpg with virtual environment

# Check if virtual environment exists
if [ ! -d "venv" ]; then
    echo "ERROR: Virtual environment not found!"
    echo "Please run './install_dependencies.sh' first."
    exit 1
fi

# Activate virtual environment and run the game
echo "Starting terminal RPG..."
echo ""
source venv/bin/activate
python rpg.py
