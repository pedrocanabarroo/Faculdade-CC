import random
class Processo:
    def __init__(self, id, descricao):
        self.id = id
        self.descricao = descricao

    def __eq__(self, other):
        return self.id == other.id

    def __str__(self):
        return f"ID: {self.id}, Descrição: {self.descricao}"
    
def gerar_processos(lista):
    while True:
        id = random.randint(0, 499)
        descricao = input("Descrição do Processo: ").upper()
        if descricao == "SAIR":
            break
        tmp = Processo(id, descricao)
        if tmp not in lista:
            lista.append(tmp)   

def exibir_processos(lista):
    for p in lista:
        print(p)

def localizar_processo(lista):
    id = int(input("Digite o ID do processo a ser localizado: "))
    tmp = Processo(id, None)
    if tmp in lista:
        index = lista.index(tmp)
        print(f"Processo encontrado: {lista[index]}")
    else:
        print("Processo não encontrado.")  

def localizar_para_remover(lista):
    id = int(input("Digite o ID do processo a ser removido: "))
    tmp = Processo(id, None)
    if tmp in lista:
        lista.remove(tmp)
        print("Processo removido.")
    else:
        print("Processo não encontrado.")

def main():
    lista = []
    gerar_processos(lista)
    exibir_processos(lista)
    localizar_processo(lista)
    localizar_para_remover(lista)
    exibir_processos(lista)
    
if __name__ == "__main__": 
    main()
