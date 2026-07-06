# Aula 02 
## Engenharia de software 
- análise de requisitos (exigências, fundamentos, obrigações);
- modelagem;
- projeto;
- implementação;
- testes/validação;
- entrega;
## Projeto de banco de dados = etapadas de análise e modelagem
- Modelagem: esquemas visuais -> artefatos -> diagramas
  - Três fases/níveis:
    - conceitual: cliente
    - lógica: programador
    - física: arquitetura de software
## Modelagem conceitual/Nível 1
- abstrata/cliente
  - Mapear:
    - Entidades -> classes -> tabelas;
    - Atributos -> variáveis -> colunas;
      - Atributos identificadores = chaves primárias = não ter repetição no banco/erro;
    - Relacionamentos -> relação de um objeto de uma tabela com outro(os) de outra tabela;
      - Cardinalidade - > cliente que fornece conforme restrições; mínimo e máximo entre entidades de um relacionamento;
- Exemplo:
  - Cliente; -> primeria Entidade;
  - Nome; **CPF**; E-mail; Endereço; -> Atributos;
  - Categoria; -> segunda Entidade;
  - Nome; **idCategoria**; -> Atributos;
  - Relacionamento -> Cliente + Categoria; Cliente TEM QUE TER no mínimo 1 categoria e no máximo N categorias;
## Banco de Dados: coleção de diretórios ou pastas; MySQL; SQL Server;
- Conjunto de tabelas, colunas e relações;
- SGBD (sistema gerenciador de banco de dados) = serviços sobre o banco de dados;
  - Segurança;
  - Manipulação;
## Exercício 01
Um profissional de educação física precisa automatizar, via informatização, a sua agenda de atendimentos de alunos de personal trainer.
O sistema monitora os clientes (nome, emmail, e telefone), categoria do cliente (nome) que tem relação com o objetivo do treinamento. Sendo que o cliente pode ter muitos objetivos. Os treinamentos são compostos por exercícios de diferentes categorias. Por exemplo, remanada baixa tem relação com a categoria costas. Dessa forma, o exercício tem relação com o grupo muscular. Mas para o primeiro momento, o professor precisa automzatizar sua agenda, em que o aluno/cliente tem um horario com esse professor. Um aluno/cliente pode ter vários encontros com esse professor e cada encontro tem uma relação com o treinamento montado ou criado. E que por sua vez, esse treinamento tem um conjunto de exercícios.
- Dicas:
  - Identificar em fases
       - identificar as entidades/tabelas
       - identificar os atributos (simples e os identificadores)
       - definir a cardinalidade

## Exercício 02
Um professor de Padel precisa automatizar, via informatização, os jogos treinos dele. Um jogo é composto por 4 atletas de categoria igual (categoria 1, 2, 3, 4, 5, 6). Esse jogo treino deve ser em um dia, uma hora, em uma quadra de um clube. O professor lança um jogo informando o dia, a hora, a quadra, o clube, e a categoria do jogo treino. E os atletas entram nesse jogo, ou compõe esse jogo. 
