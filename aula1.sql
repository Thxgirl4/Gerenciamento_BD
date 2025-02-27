create table aluno(
id serial primary key,
nome text,
cpf text
);

create table disciplina(
id serial primary key,
nome text
);

create table cargo(
id serial primary key,
nome text,
salario float
);

create table departamento( 
id serial primary key,
nome text
);

create table servidor(
id serial primary key,
nome text,
departamento integer references departamento(id) not null,
cargo integer references cargo(id) not null
);

create table oferta(
id serial primary key,
semestre text,
disciplina integer references disciplina(id) not null,
professor integer references servidor(id) not null
);

create table matricula(
id serial primary key,
aluno integer references aluno(id) not null,
oferta integer references oferta(id) not null,
conceito integer
);

INSERT INTO aluno (nome, cpf) VALUES 
('Carlos Silva', '123.456.789-00'),
('Ana Souza', '987.654.321-00'),
('João Pereira', '456.123.789-00');

INSERT INTO disciplina (nome) VALUES 
('Matemática'),
('História'),
('Física'),
('Quimica'),
('Sociologia'),
('Filosofia'),
('Portugês');

INSERT INTO cargo (nome, salario) VALUES 
('Professor Assistente', 3000.00),
('Professor Titular', 7000.00),
('Coordenador', 10000.00);

INSERT INTO departamento (nome) VALUES 
('Ciências Exatas'),
('Ciências Humanas');

INSERT INTO servidor (nome, departamento, cargo) VALUES 
('Marcos Oliveira', 1, 2), -- Professor Titular de Ciências Exatas
('Fernanda Lima', 2, 1);  -- Professor Assistente de Ciências Humanas

SELECT * from servidor

