# Define a capacidade máxima da mochila
capacidade_mochila = 15.0

# Inicializa o peso total dos itens na mochila
peso_total = 0.0

# Loop para ler o peso dos itens encontrados
while True:
    peso_item = float(input("Digite o peso do item encontrado (em kg): "))
    
    # Verifica se o item pode ser adicionado à mochila
    if peso_total + peso_item > capacidade_mochila:
        print("Mochila cheia, item descartado.")
        break
    
    # Adiciona o peso do item ao total
    peso_total += peso_item
    print(f"Peso total na mochila: {peso_total:.2f} kg")
    
# Exibe o peso final total
print(f"Peso final total na mochila: {peso_total:.2f} kg")
