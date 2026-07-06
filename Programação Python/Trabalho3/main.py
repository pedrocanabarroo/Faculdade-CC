import requests

# 1. Modelagem de Dados (Orientação a Objetos)

class CidadeClima:
    '''Classe que representa os dados climáticos de uma cidade.
    Os atributos foram encapsulados seguindo os princípios de orientação a objetos.'''

    def __init__(self, nome: str, temperatura: float, umidade: int, condicao: str):
        self.__nome = nome
        self.__temperatura = temperatura
        self.__umidade = umidade
        self.__condicao = condicao
    
    def __str__(self) -> str:
        return (f"📍 Cidade: {self.__nome}\n"
                f"🌡️ Temperatura: {self.__temperatura:.1f}°C\n"
                f"💧 Umidade: {self.__umidade}%\n"
                f"☁️ Condição: {self.__condicao.capitalize()}\n"
                f"{'-'*35}")

def main():

    API_KEY = "04a32145c18250bb5712dfadd9e5679f"

    cidades = ["São Paulo", "London", "Tokyo", "New York", "Paris", "Santa Maria", "Oslo", "Cairo", "Sydney", "Moscow"]

    relatorio_clima = []

    print("📡 Consultando dados climáticos...\n")

    # 2. Consumo de Dados (API e Listas)
    for cidade in cidades:
        # Parâmetros: units=metric (Celsius), lang=pt_br (Português)
        url = f"http://api.openweathermap.org/data/2.5/weather?q={cidade}&appid={API_KEY}&units=metric&lang=pt_br"
        
        try:
            # Realizando a requisição HTTP
            resposta = requests.get(url, timeout=10)
            
            # Tratamento de Exceções: Verifica se a cidade foi encontrada (Código 404)
            if resposta.status_code == 404:
                print(f"⚠️ Aviso: A cidade '{cidade}' não foi encontrada na base de dados.\n")
                continue
            
            # Dispara uma exceção para outros erros HTTP (Ex: 401 Unauthorized se a chave for inválida)
            resposta.raise_for_status()
            
            # Extraindo os dados do JSON retornado
            dados = resposta.json()
            nome = dados.get('name')
            temperatura = dados.get('main', {}).get('temp')
            umidade = dados.get('main', {}).get('humidity')
            
            # A condição do clima vem dentro de uma lista no JSON
            condicao = dados.get('weather', [{}])[0].get('description', 'Desconhecida')

            # Instanciando os dados extraídos como um OBJETO da classe CidadeClima
            cidade_obj = CidadeClima(nome, temperatura, umidade, condicao)
            
            # Adicionando o objeto na lista principal
            relatorio_clima.append(cidade_obj)

        except requests.exceptions.HTTPError as err_http:
            print(f"❌ Erro HTTP ao consultar '{cidade}': {err_http}\n")
        except requests.exceptions.ConnectionError:
            print(f"❌ Erro de conexão ao tentar buscar dados para '{cidade}'. Verifique sua internet.\n")
        except requests.exceptions.Timeout:
            print(f"❌ Tempo de requisição esgotado para '{cidade}'.\n")
        except Exception as e:
            print(f"❌ Ocorreu um erro inesperado ao processar '{cidade}': {e}\n")


    # 3. Exibição dos Resultados
    print("===================================")
    print("      RELATÓRIO CLIMÁTICO          ")
    print("===================================\n")
    
    if not relatorio_clima:
        print("Nenhum dado climático pôde ser recuperado para o relatório.")
    else:
        # Percorre a lista de objetos e exibe usando o método __str__
        for clima_cidade in relatorio_clima:
            print(clima_cidade)


if __name__ == "__main__":
    main()
