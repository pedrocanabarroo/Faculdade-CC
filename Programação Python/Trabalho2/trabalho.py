def ler_arquivo(caminho):
    jogadores = []
    try:
        with open(caminho, 'r', encoding='utf-8') as arquivo:
            for linha in arquivo:
                if not linha.strip(): continue 
                dados = linha.strip().split(";")
                
                jogador = {
                    "nome": dados[0],
                    "classe": dados[1],
                    "kills": int(dados[2]),
                    "deaths": int(dados[3]),
                    "dano": int(dados[4])
                }
                jogadores.append(jogador)
    except FileNotFoundError:
        print("Erro: Arquivo 'partida.txt' não encontrado.")
    return jogadores

def calcular_kda(kills, deaths):
    """Calcula o KDA tratando a divisão por zero (Perfect KDA)."""
    if deaths == 0:
        return float(kills) # Se não morreu, o KDA é o próprio número de kills
    return round(kills / deaths, 2)

def filtrar_por_classe(lista_jogadores, classe_alvo):
    """Retorna uma lista contendo apenas jogadores da classe especificada."""
    return [j for j in lista_jogadores if j['classe'].lower() == classe_alvo.lower()]

def gerar_relatorio(jogadores):
    """Processa e imprime os destaques da partida."""
    if not jogadores:
        return

    # 1. Jogador com maior dano
    melhor_dano = max(jogadores, key=lambda j: j['dano'])

    # 2. Média de kills da partida
    total_kills = sum(j['kills'] for j in jogadores)
    media_kills = total_kills / len(jogadores)

    # 3. Jogadores com KDA > 2.0
    destaques_kda = []
    for j in jogadores:
        kda = calcular_kda(j['kills'], j['deaths'])
        if kda > 2.0:
            destaques_kda.append(j['nome'].upper())

    # --- Impressão do Relatório ---
    print("-" * 30)
    print("🏆 RELATÓRIO: ARENA DOS CAMPEÕES 🏆")
    print("-" * 30)
    print(f"🔥 Maior Dano: {melhor_dano['nome']} ({melhor_dano['dano']} de dano)")
    print(f"🎯 Média de Kills: {media_kills:.2f}")
    print(f"⭐ Jogadores de Elite (KDA > 2.0): {', '.join(destaques_kda)}")
    print("-" * 30)


# Passo 1: Processar os dados
lista_completa = ler_arquivo("partida.txt")

# Passo 2: Gerar relatório geral
gerar_relatorio(lista_completa)

# Passo 3: Exemplo de filtragem (opcional)
magos = filtrar_por_classe(lista_completa, "Mago")
print(f"🧙 Total de Magos na partida: {len(magos)}")
