# Inicializa os HPs do herói e do monstro
hp_heroi = 100
hp_monstro = 100

# Loop para o combate
while hp_heroi > 0 and hp_monstro > 0:
    # Solicita o dano do ataque do herói e do monstro
    dano_heroi = float(input("Digite o dano do ataque do herói: "))
    dano_monstro = float(input("Digite o dano do ataque do monstro: "))
    
    # Aplica o dano ao HP de ambos
    hp_heroi -= dano_monstro
    hp_monstro -= dano_heroi
    
    # Exibe o HP restante de ambos
    print(f"HP do Herói: {max(hp_heroi, 0)}")
    print(f"HP do Monstro: {max(hp_monstro, 0)}")

# Anuncia o vencedor
if hp_heroi <= 0:
    print("O monstro venceu!")
else:
    print("O herói venceu!")

