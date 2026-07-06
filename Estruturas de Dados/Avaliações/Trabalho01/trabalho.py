import csv

# irei definir a classe aluno

class Aluno:
    def __init__(self, nome, curso, sexo, ano_ingresso):
        self.nome = nome
        self.curso = curso
        self.sexo = sexo
        self.ano_ingresso = ano_ingresso
    
    def __repr__(self):
        return f"Nome:  {self.nome:15} | Curso: {self.curso:22} | Ano: {self.ano_ingresso}"
    

# gerenciar o sistema

class SistemaAcademico:
    def __init__(self, arquivo_csv):
        self.alunos = []
        self.carregar_dados(arquivo_csv)

    def carregar_dados(self, arquivo_csv):
        try:
            with open(arquivo_csv, mode='r', encoding='utf-8') as file:
                reader = csv.reader(file)
                for linha in reader:
                    if linha:
                        novo_aluno = Aluno(linha[0], linha[1], linha[2], linha[3])
                        self.alunos.append(novo_aluno)
        except FileNotFoundError:
            print(f"Erro: O arquivo {arquivo_csv} não foi encontrado.")
    
    def ordenar_por_nome(self):
        self.alunos.sort(key=lambda x: x.nome)
    
    def ordernar_por_ano(self):
        self.alunos.sort(key=lambda x: x.ano_ingresso)

    def buscar_aluno(self, nome_procurado):
        for aluno in self.alunos:
            if aluno.nome.lower() == nome_procurado.lower():
                return aluno
        return None

    def relatorio_por_ano(self):
        contagem = {}
        for aluno in self.alunos:
            contagem[aluno.ano_ingresso] = contagem.get(aluno.ano_ingresso, 0) + 1
        return contagem

    def exibir_lista(self):
        for aluno in self.alunos:
            print(aluno)
    

## inicializando o sistema

sistema = SistemaAcademico('alunos.csv')

print("--- Alunos ordenados por nome ---")
sistema.ordenar_por_nome()
sistema.exibir_lista()

print("\n--- Busca de Aluno ---")
busca = sistema.buscar_aluno("Bruno Souza")
print(f"Resultado da busca: {busca}" if busca else "Aluno não encontrado.")

print("\n--- Relatório de Ingressantes por ano ---")
stats = sistema.relatorio_por_ano()
for ano, qtd in sorted (stats.items()):
    print(f"Ano {ano}: {qtd} aluno(s)")
