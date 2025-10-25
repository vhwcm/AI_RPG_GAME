#!/bin/bash
# Script para escolher entre jogo gráfico e terminal

cd "$(dirname "$0")/rpg_ui"

echo "Escolha o modo de jogo:"
echo "1 - Jogo Gráfico (pygame)"
echo "2 - Jogo Terminal (não implementado)"
read -p "Digite 1 ou 2: " escolha

if [ "$escolha" == "1" ]; then
    if [ -f "rpg_grafico.py" ]; then
        echo "Executando jogo gráfico..."
        python3 rpg_ui/rpg_grafico.py
    else
        echo "Arquivo rpg_grafico.py não encontrado!"
        exit 1
    fi
elif [ "$escolha" == "2" ]; then
    if [ -f "rpg.py" ]; then
        echo "Executando jogo de terminal..."
        python3 terminal_rpg/rpg.py
    else
        echo "Jogo de terminal não encontrado! (rpg.py)"
        exit 1
    fi
else
    echo "Opção inválida!"
    exit 1
fi
