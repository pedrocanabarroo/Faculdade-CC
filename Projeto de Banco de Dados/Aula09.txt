Filme 0,N ---------- 1,1 Categoria
 
Filme(idFilme, Titulo, idCategoria)
    idCategoria referencia Categoria
 
Categoria(idCategoria, Descricao)
 
Categoria
1, Ação
2, Ficção
3, Terror
4, Romance
 
Filme
100, Blade Runner, 2
101, Rambo, 1
102, IT, O Palhaço, 3
 
# Mostra as categorias que não estão associadas a nenhum filme
select Categoria.descricao
from Filme, Categoria
where Categoria.idCategoria == Filme.idCategoria
 
# Mostra a categoria do filme Rambo
select Categoria.descricao
from Categoria, Filme
where
    Filme.titulo == "Rambo" and
    Filme.idCategoria == Categoria.idCategoria;
 
# Mostra todos os dados (colunas e linhas) da tabela Categoria
select *
from Categoria;
 
# Mostra o id da categoria Terror OU Ação
select idCategoria
from Categoria
where descricao == "Terror" or descricao == "Ação";
 
# Mostra os titulos dos filmes que tem categoria 2
select titulo
from Filme
where idCategoria == 2;
 
# Mostra os título dos filmes que tem categoria Ficção
select Filme.titulo
from Filme, Categoria
where
    Categoria.descricao == "Ficção and
    Filme.idCategoria == Categoria.idCategoria
