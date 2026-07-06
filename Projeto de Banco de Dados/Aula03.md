### Revisão do que Já foi visto
## Unidade 1 - cpaítulo 1 e 2 do livro
- Modelar no nível conceitual um esquema de banco de dados
  - Conceitos básicos
    - sistema
    - partes de um sistema: aspectos funcionais e estruturais
    - análise de requisitos e o processo de modelagem (foco da disciplina)
    - banco de dados versus sistema gerenciadr de banco de dados
  - Modelagem: criação de diagarama/esquemas 
   * - nível/fase conceitual: mostrar ou ilustrar -> mapear aspectos estruturais para mostrar/discutir com cliente (ou gerar documentação)
      - entidades(futuras tabelas)
      - atributos (variaveis de uma tabela)
        - identificadores
        - complementares
      - relacionamentos (futuras chaves estrangeiras)
        - simples
        - herança
    *  - cardinalidades (quantidade de relação de um objeto com outro entre tabelas)
    - nível/fase lógica: pensar nas chaves estrangeiras -> ajuda o programador
    - nível/fase física pensar na lingugagem e tecnologia.
  ## Exercícios de Revisão
  - É necessário modelar um esquema de banco de dados para um fluxo ou funcionalidade de um sistema de submissão de projetos em uma instituição. Em uma instituição, há professores ou pesquisadores que submetem projetos de extensão.
  Um projeto possui título, resumo, coordenador (professor/pesquisador), equipe (relação de professores/pesquisadores), área de pesquisa (tecnologica, saúde, humanas, social), uma instituição responsável.
  Um instituição tem nome, sigla e endereço. Um pesquisador/professor tem nome, email, cpf e numero de celular. Todo projeto submetido precisa passar por uma avaliação. A avaliação é composta por uma submissão de projeto,
  um avaliador responsável (professor/pesquisador), um avaliador suplente (professor/pesquisador), campo para parecer, data limite de parecer, resultado (aprovado, reprovador, em correção).

# Aula 03
### Relacionamentos: indica que 1 ou mais atributos de uma entidade/tabela visita outro

### Cardinalidade 1:N; N que puxa a chave estrangeira!
## Exemplo 1
- Professor
  - id nome
  - 01 Alex
  - 02 Ana
  - 03 RIcardo
  - 04 Rodrigo
  - 05 Pedro
  - 06 Sofia
- IDárea (chave estrangeira deve ser atributo identificador na entidade origem)
  - 101
  - 101
  - 101
  - 100
  - 102
  - 103
- Área
  - id descrição
  - 100 saúde
  - 101 tecnologia
  - 102 social
  - 103 humanas
## Exemplo 2
- ATLETA -> CATEGORIA
- 0...N ---> 1...1
- 
  -ATLETA
    - IDATLETA - NOME
    - 1 Alex
    - 2 Guilherme
    - 3 Pedro
  - CATEGORIA
    - IDCATEGORIA - DESCRIÇÃO
      - 500 - 1º
      - 501 - 2º
      - 502 - 3º
  - DEPÊNDENCIA: relação entre categoria do atleta e o id categoria.
 ## Exemplo 3
 - > TURMA 0..N -> 1..1 DISCIPLINA
 - DISCIPLINA
   - IDdisciplina - nome
   - e101 - banco de dados
   - e102 - estrutura de dados
   - a103 - metodologia
- TURMA
  - IDturma - ano - semestre - DISCIPLINA QUE N PUXOU
  - g101 - 2025 - 1 - E101
  - g102 - 2026 - 1 - E102
## Relacionamento de Cardinalidade
- 1...N
- N...N (atenção) -> cria-se uma nova tabela de N para N (ids das tabelas antigas vão para a tabela nova com os novos atributos)

## Exercício 01
- Superliga de voleibol contempla partidas de voleibol profissional, tanto de equipes masculinas, quanto femininas.
As equipes são formadas por atletas confederados e profissionais de fisioterapia, medicina, educação física (com 'brevês de técnico'), matemáticos (estatísticos). 
A confederação de voleibol possui árbitros, diretores, .... As equipes possuem nome, patrocinadores, localização (cidade), centro de treinamento. 
Cada jogador tem nome completo, idade, apelido, posição e um histórico geral de pontos realizados e pontos entregues.
As partidas são entre duas equipes, a da 'casa' e a visitante, com data, hora, tempo de jogo, placar. Todos os jogos são monitorados e os resultados são convertidos
em uma tabela de classicação ordenada decrescente (equipe, pontuação, número de partidas, número de vitórias, número de derrotas).

### Tentativa 


### Correção 
