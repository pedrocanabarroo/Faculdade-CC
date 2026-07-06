import panda as pd
import csv

class Clima:

    def __init__(self, ano, mes, temperatura, precipitacao):
        self.ano = ano
        self.mes = mes
        self.temperatura = temperatura
        self.precipitacao = precipitacao
    
    def __str__(self):
        return f"Dados climáticos (Ano: {self.ano}. Mes: {self.mes}. Temperatura: {self.temperatura}. Precipitação: {self.precipitacao}."

    valores = {
        "nada": 0,
        "pouco": 1,
        "média": 2,
        "muito": 3
    }
    
    soma_por_mes = {}

    with open('clima.csv', encoding='utf-8', newline='') as arquivo:
        leitor = csv.DictReader(arquivo, delimiter=';')

        for linha in leitor:
            mes = linha['mes']
            precipitacao = linha['precipitacao'].lower()

            valor = valores.get(precipitacao, 0)

            if mes in soma_por_mes:
                soma_por_mes[mes] += valor
            else:
                soma_por_mes[mes] = valor

    mes_mais_chuvoso = max(soma_por_mes, key=soma_por_mes.get)

    print("Mês mais chuvoso:", mes_mais_chuvoso)
    print("Pontuação de chuva: ", soma_por_mes[mes_mais_chuvoso])
    
    df = pd.read_csv('clima.csv', encoding='utf-8', sep=';')

    print(df.head())
