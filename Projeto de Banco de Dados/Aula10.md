<img width="800" height="453" alt="image" src="https://github.com/user-attachments/assets/463c800b-e578-43cf-b346-5702c67c1563" />
select Aluno.nome from Disciplina, Turma Where id_disciplina == 'Estrutura de dados' and Disciplina.id_disciplina == Turma.id_disciplina and Turma.id_turma == Matricula.id_matricula and Matricula.id_aluno == Alunoo.id_aluno and Turma.ano_semestre like '2026%';


<img width="924" height="575" alt="image" src="https://github.com/user-attachments/assets/61abb838-10cc-4921-b06f-fb8dc253f4cd" />
select Matricula.id_aluno from Matricula Where id_aluno == '5' and Matricula.id_turma == Turma.id_turma



create schema ufn_db;
use ufn_db;
show tables;

create table Curso(
	id_curso int primary key not null,
    descricao varchar (30) not null
);

create table Aluno(
	id_aluno int primary key not null,
    nome varchar(50) not null,
    id_curso int,
    constraint fk_curso foreign key (id_curso) references curso (id_curso)
);

create table Disciplina(
	id_disciplina int primary key not null,
    nome varchar(50) not null
);

create table Matricula(
	id_matricula int primary key not null,
    id_aluno int not null,
    id_turma int not null
);

create table Turma(
	id_turma int primary key not null,
    ano_semestre varchar (50) not null,
    id_disciplina int,
    constraint fk_disciplina foreign key (id_disciplina) references Disciplina(id_disciplina)
);
