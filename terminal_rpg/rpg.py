import google.generativeai as genai
import os
import time
import warnings

# Configurações de Ambiente
warnings.filterwarnings("ignore", category=UserWarning)
os.environ['GRPC_VERBOSITY'] = 'ERROR'
os.environ['GLOG_minloglevel'] = '2'

#############################################
# CONFIGURAÇÃO GEMINI
#############################################
API_KEY = 'SUA_API_KEY_AQUI' # <--- COLOQUE SUA CHAVE AQUI

genai.configure(api_key=API_KEY)

generation_config = {
  "candidate_count": 1,
  "temperature": 0.5, # Um pouco mais criativo para texto
}

safety_settings={
    'HATE': 'BLOCK_NONE',
    'HARASSMENT': 'BLOCK_NONE',
    'SEXUAL' : 'BLOCK_NONE',
    'DANGEROUS' : 'BLOCK_NONE'
}

# Prompt do Mestre (Focado em Texto Formatado para Terminal)
system_instruction = """
VOCÊ É O MESTRE DE JOGO DE UM RPG DE ESTRATÉGIA.

INSTRUÇÕES DE RESPOSTA:
1. **Status Bar:** Comece SEMPRE com um cabeçalho claro mostrando os status atuais.
2. **Narrativa:** Descreva a situação, as interações diplomáticas e os problemas do reino.
3. **Opções:** Ao final, dê opções numeradas claras.
4. **Formatação:** Use quebras de linha para facilitar a leitura no terminal.

EXEMPLO DE FORMATO:
========================================
👑 REINO DE [NOME] | 💰 OURO: 5000 | ⚔️ MILITAR: 2000 | 😊 FELICIDADE: 70%
RELIGIÃO: [NOME]
========================================

[Sua narração da aventura aqui...]

O que deseja fazer, Majestade?
1. [Opção A]
2. [Opção B]
3. [Ação personalizada]
"""

# Prompt do Cronista (Memória Comprimida)
system_instruction_h = """
VOCÊ É O SISTEMA DE SAVE GAME (CRONISTA).
Sua tarefa é converter o turno atual em um registro histórico comprimido.
1. Resuma o que aconteceu e a decisão tomada.
2. Atualize os valores numéricos (Ouro, Militar, etc) no texto.
3. Mantenha o texto em um único bloco compacto para economizar tokens na próxima leitura.
"""

# Inicializando
model_h = genai.GenerativeModel(
    model_name='gemini-2.5-flash',
    generation_config=generation_config,
    system_instruction=system_instruction_h,
    safety_settings=safety_settings
)
chat_history = model_h.start_chat(history=[])

model = genai.GenerativeModel(
    model_name='gemini-2.5-flash',
    generation_config=generation_config,
    system_instruction=system_instruction,
    safety_settings=safety_settings
)
chat = model.start_chat(history=[])

# Setup de Pastas
try:
    os.makedirs("mundos/", exist_ok=True)
    mundos = os.listdir("mundos/")
    print("\n=== AVENTURAS DISPONÍVEIS ===")
    if mundos:
        for m in mundos:
            if m.endswith('.txt'):
                print(f"{m.replace('.txt', '')}")
    else:
        print("(Nenhuma aventura encontrada)")
except Exception as e:
    print(f"Erro ao ler pasta: {e}")

print("\n" + "="*40)
nome_avetura = input("Nome do arquivo da aventura (ex: save1): ")
nome = input("Seu nome (Imperador): ")
reino = input("Nome do Reino: ")
raca = input("Raça do Reino: ")
print("="*40 + "\n")

arquivo_mundo = f'mundos/{nome_avetura}.txt'
conteudo = ""

# Carregar Save
if os.path.exists(arquivo_mundo):
    print("Carregando histórico...")
    with open(arquivo_mundo, 'r', encoding='utf-8') as f:
        conteudo = f.read()
    pergunta = f"CONTINUAÇÃO: Sou {nome}, do reino {reino} ({raca}). O histórico até agora é: {conteudo[-2000:]}. Qual a situação atual?"
else:
    print("Criando novo mundo...")
    pergunta = f"INÍCIO: Criar reino {reino} de raça {raca}, governado por {nome}. Vamos definir a religião e status iniciais."

# Loop Principal
while pergunta.lower() != "fim":
    try:
        # Envia para o Mestre
        print("\nConsultando os oráculos...\n")
        chat.send_message(pergunta)
        resposta_mestre = chat.last.text
        
        print(resposta_mestre)
        
        # Salva no Histórico (Cronista)
        chat_history.send_message(f"Resuma este turno baseando-se na decisão do jogador que virá a seguir e no estado atual: {resposta_mestre}")
        resumo_turno = chat_history.last.text
        
        # Persistência
        with open(arquivo_mundo, 'a', encoding='utf-8') as f:
            f.write(f"Turno: {resumo_turno}\n")
            
        # Input do Jogador
        print("\n" + "-"*40)
        pergunta = input("SUA ORDEM, MAJESTADE: ")
        print("-"*40)
        
    except Exception as e:
        print(f"\nOcorreu um erro: {e}")
        if "quota" in str(e).lower():
            print("Limite da API atingido. Aguarde um momento.")
        opcao = input("Tentar novamente? (s/n): ")
        if opcao.lower() != 's':
            break

print("\nJogo salvo. Até a próxima, Majestade!\n")