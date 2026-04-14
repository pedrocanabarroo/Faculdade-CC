# quantidade de dias a serem analisados
dias = int(input("Quantos dias deseja analisar? "))

contador = 0
soma_temperaturas = 0

# leitura das temperaturas
while contador < dias:
    temperatura = float(input(f"Digite a temperatura do dia {contador + 1}: "))
    soma_temperaturas += temperatura
    contador += 1

# cálculo da média
media = soma_temperaturas / dias

print(f"\nMédia das temperaturas: {media:.2f}°C")

# verificação da média
if media > 25:
    print("Acima do esperado")
else:
    print("Dentro da normalidade")