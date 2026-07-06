class Clima:
    def __init__(self, ano, mes, temperatura, precipitacao):
        self.ano = ano
        self.mes = mes
        self.temperatura = temperatura
        self.precipitacao = precipitacao
    
    def __str__(self):
        return f"Ano: {self.ano}, Mês: {self.mes}, Temperatura: {self.temperatura}°C, Precipitação: {self.precipitacao}mm"
    
    def __eq__(self, other):
        if not isinstance(other, Clima):
            return False
        return self.ano == other.ano and self.mes == other.mes
    
    def get_valor_temperatura(self):
        temp = self.temperatura.lower()
        mapping = {
            "frio": 1,
            "morno": 2,
            "quente": 3
        }

        return mapping.get(temp, 0)  # Retorna 0 se a temperatura não for reconhecida
