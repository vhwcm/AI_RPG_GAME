# RPG Infinito com Google Gemini

Um RPG de estratégia e aventura onde a narrativa, as consequências e o estado do mundo são gerados dinamicamente em tempo real por Inteligência Artificial.

## Sobre o Projeto

Este projeto explora o uso de Large Language Models (LLMs) como o motor lógico de um jogo (Game Engine). Ao contrário de RPGs tradicionais com árvores de diálogo pré-programadas, este jogo utiliza o Google Gemini 1.5 Flash para criar uma experiência onde nenhuma aventura é igual a outra, simulando um RPG falado.

O sistema gerencia inventário, economia, religião e eventos políticos através dos prompts, oferecendo duas interfaces:

Modo Gráfico (GUI): Uma experiência visual imersiva usando Pygame.

Modo Texto (CLI): Uma versão leve e rápida para jogar via terminal.

## Engenharia de Prompt

O desafio técnico deste projeto reside na forma como a IA é manipulada para agir como um motor de jogo estável. Foram utilizadas três estratégias principais:

### 1. Saída Estrita em JSON (JSON Enforcement)

Para garantir que o código Python (Pygame) consiga ler os dados da IA sem erros (crash), utilizamos o parâmetro nativo response_mime_type: "application/json".

O problema: LLMs tendem a ser verbosos ("Claro, aqui está o JSON...").

A solução: Forçar a saída JSON garante que variáveis como dinheiro, felicidade e poder_militar sejam sempre inteiros ou strings formatadas corretamente para o HUD do jogo.

### 2. Arquitetura de Dupla Persona

O jogo utiliza duas instâncias separadas do modelo Gemini para funções distintas:

O Game Master (Narrador): Configurado com temperatura mais alta (0.4) para criatividade. Ele narra a cena, inventa diálogos e calcula os danos de batalha.

O Cronista Real (Sistema de Save): Uma instância analítica focada em Compressão de Contexto. Ele lê o turno atual e o reescreve em um parágrafo denso e histórico. Isso permite "salvar" o jogo em um arquivo .txt pequeno, contendo apenas a essência dos fatos, contornando limites de tokens em sessões longas.

### 3. Separação Lógica vs. Narrativa

O System Prompt instrui a IA a separar o que o jogador lê (Aventura) do que o código processa (Status do Reino).

{
  "aventura": "O texto que aparece na tela para o jogador...",
  "status_reino": {
    "dinheiro": 4500,
    "felicidade": "80%"
  }
}


## Instalação e Configuração

### Pré-requisitos:
* Python 3.8 ou superior.
* Uma API Key do Google AI Studio (Gemini).
* Clonar e Instalar Dependências:
```
git clone [https://github.com/seu-usuario/seu-repo.git](https://github.com/seu-usuario/seu-repo.git)
cd seu-repo
pip install -r requirements.txt
```
Dependências principais: google-generativeai, pygame, pygame-gui.

### 2.Configurar a API Key
Obtenha sua chave gratuitamente em Google AI Studio.
Abra os arquivos rpg_grafico.py e rpg_texto.py e edite a variável:
API_KEY = 'COLE_SUA_CHAVE_AQUI'

## 🎮 Como Jogar
### Modo Gráfico (Pygame)
Execute o comando:
```
python rpg_grafico.py
```

### Modo Texto (Terminal)

Execute o comando:
```
python rpg_texto.py
```

Foco: Narrativa rápida e debug.

Histórico: O jogo salva automaticamente seu progresso em arquivos .txt na pasta mundos/. Você pode fechar e continuar exatamente de onde parou.

Notas do Desenvolvedor:

Este projeto foi desenvolvido inicialmente durante o intervalo do primeiro ano da faculdade. O objetivo era testar os limites da API gratuita do Gemini em um contexto de "Stateful Application" (Aplicação com Estado). E utiliza-lá onde mais parecia óbio, uma geração de texto vinculado a creatividade ao invés de precisão.

Desafios:
Manter a consistência numérica da IA (ex: garantir que ela subtraia ouro ao comprar itens).
Implementar um sistema de memória de longo prazo via arquivos de texto.

Futuro:
Planejo implementar um banco de dados vetorial (RAG) para que a IA se lembre de NPCs encontrados há centenas de turnos atrás, superando a limitação do arquivo de texto linear.


## Game Demo
### UI RPG
<img width="1331" height="757" alt="Captura de tela de 2025-10-25 21-29-09" src="https://github.com/user-attachments/assets/33aa6660-3122-4290-b8b7-2610c2b30d84" />
<img width="1337" height="765" alt="Captura de tela de 2025-10-25 21-26-30" src="https://github.com/user-attachments/assets/4779fa74-17d9-47f7-a8d0-8d36adc8a9fa" />
<img width="1340" height="753" alt="Captura de tela de 2025-10-25 21-31-00" src="https://github.com/user-attachments/assets/1a54578a-3f40-4f6b-a675-79ef5b29d591" />

### Terminal RPG

<img width="1836" height="962" alt="Captura de tela de 2025-10-25 20-58-19" src="https://github.com/user-attachments/assets/9bab34bd-339e-4359-8728-923f8276ced9" />





