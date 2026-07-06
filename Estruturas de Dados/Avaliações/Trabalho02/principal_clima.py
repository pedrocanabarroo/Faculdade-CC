import csv

def main():
    lista = []
    nome_base = "base.csv"

    try:
        # Abre o arquivo com o gerenciador de contexto 'with' (igual ao try-with-resources)
        with open(nome_base, mode='r', encoding='utf-8') as arquivo:
            leitor = csv.reader(arquivo)
            
            for dados_linha in leitor:
                # No Python, se o CSV tiver espaços após a vírgula, 
                # pode ser necessário usar dados_linha[0].strip()
                obj_clima = Clima(dados_linha[0], dados_linha[1], dados_linha[2], dados_linha[3])

                # O operador 'in' usa o método __eq__ definido na classe
                if obj_clima not in lista:
                    lista.append(obj_clima)
    

        # Exibe os objetos da lista
        for item in lista:
            print(item)

        # --- QUAIS MESES SÃO MAIS QUENTES? ---
        
        meses_mais_quentes = []
        maior_valor = float('-inf') # Equivalente ao Integer.MIN_VALUE

        for item in lista:
            valor_temp = item.get_valor_temperatura()

            if valor_temp > maior_valor:
                maior_valor = valor_temp
                meses_mais_quentes = [item] # Limpa e adiciona em uma única linha
            elif valor_temp == maior_valor:
                meses_mais_quentes.append(item)

        # Verifica e exibe resultados
        if meses_mais_quentes:
            print("\nMeses mais quentes:\n")
            for clima in meses_mais_quentes:
                print(clima)
        else:
            print("\nNenhum mês encontrado.")

    except FileNotFoundError:
        print(f"Erro: O arquivo '{nome_base}' não foi encontrado.")
    except Exception as e:
        print(f"Ocorreu algum erro... {e}")

if __name__ == "__main__":
    main()
