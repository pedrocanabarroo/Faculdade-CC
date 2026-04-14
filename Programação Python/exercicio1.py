# Solicita a meta de biomassa ao usuário
meta_biomassa = float(input("Digite a meta de biomassa (em unidades): "))

# Inicializa o acumulador de biomassa e o contador de árvores
biomassa_atual = 0.0
contador_arvores = 0

# Loop para ler o valor de biomassa de cada árvore plantada
while biomassa_atual < meta_biomassa:
    biomassa_arvore = float(input("Digite a biomassa da árvore plantada (em unidades): "))
    biomassa_atual += biomassa_arvore
    contador_arvores += 1

# Exibe o resultado
print(f"Meta de biomassa atingida! Foram necessárias {contador_arvores} árvores para atingir ou superar a meta de {meta_biomassa} unidades de biomassa.")   
