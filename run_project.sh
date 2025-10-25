#!/bin/bash
# Script para rodar o projeto principal

if [ -f "rpg_grafico.py" ]; then
    echo "Executando rpg_grafico.py..."
    python3 rpg_grafico.py
else
    echo "Arquivo rpg_grafico.py não encontrado!"
    exit 1
fi
