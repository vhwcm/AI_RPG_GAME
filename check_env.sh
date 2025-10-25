#!/bin/bash
# Script para verificar dependências e arquivos necessários

# Verifica se Python está instalado
if ! command -v python3 &> /dev/null; then
    echo "Python3 não está instalado!"
    exit 1
fi

# Verifica se arquivos principais existem
REQUIRED_FILES=("rpg_grafico.py" "README.md")
for file in "${REQUIRED_FILES[@]}"; do
    if [ ! -f "$file" ]; then
        echo "Arquivo obrigatório não encontrado: $file"
        exit 1
    fi
    echo "Arquivo encontrado: $file"
done

# Verifica se pastas essenciais existem
REQUIRED_DIRS=("aventuras" "Cinzel" "lideres" "musicas" "reinos")
for dir in "${REQUIRED_DIRS[@]}"; do
    if [ ! -d "$dir" ]; then
        echo "Pasta obrigatória não encontrada: $dir"
        exit 1
    fi
    echo "Pasta encontrada: $dir"
done

# Verifica se há arquivos de fontes, imagens e músicas
if [ ! -f "Cinzel/Cinzel-VariableFont_wght.ttf" ]; then
    echo "Fonte Cinzel-VariableFont_wght.ttf não encontrada!"
    exit 1
fi

if [ ! -f "musicas/clima de aventura.mp3" ]; then
    echo "Arquivo de música clima de aventura.mp3 não encontrado!"
    exit 1
fi

if [ ! -f "lideres/anão.jpeg" ]; then
    echo "Imagem de líder anão.jpeg não encontrada!"
    exit 1
fi

echo "Ambiente verificado com sucesso!"
