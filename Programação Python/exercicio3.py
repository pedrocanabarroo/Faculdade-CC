# Loop para ler o nível do rio continuamente
while True:
    nivel_rio = float(input("Digite o nível do rio (em metros, negativo para encerrar): "))
    
    # Verifica a condição de encerramento
    if nivel_rio < 0:
        print("Encerrando o monitoramento.")
        break
    
    # Verifica o estado do rio e exibe a mensagem correspondente
    if nivel_rio < 3:
        print("Estado Normal")
    elif 3 <= nivel_rio <= 5:
        print("Estado de Alerta")
    else:
        print("Evacuação Imediata")

