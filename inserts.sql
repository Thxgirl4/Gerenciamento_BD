INSERT INTO aluno (nome, cpf) VALUES 
('João Silva', '123.456.789-01'),
('Maria Oliveira', '987.654.321-02'),
('Carlos Souza', '456.789.123-03'),
('Ana Lima', '321.654.987-04'),
('Pedro Santos', '741.852.963-05'),
('Mariana Costa', '159.753.486-06'),
('Lucas Pereira', '258.369.147-07'),
('Fernanda Alves', '369.147.258-08'),
('Ricardo Mendes', '654.321.987-09'),
('Camila Rocha', '789.123.456-10');

select * from aluno
select * from disciplina
select * from cargo
select * from departamento
select * from servidor

INSERT INTO servidor (nome, departamento, cargo) VALUES 
('Antonio Silva', 1, 1),
('Beatriz Souza', 2, 2),
('Claudio Mendes', 3, 3),
('Daniela Rocha', 4, 4),
('Eduardo Costa', 4, 3),
('Fabiana Lima', 1, 2),
('Gustavo Pereira', 2, 3),
('Helena Alves', 3, 4),
('Igor Santos', 4, 4);

select * from oferta

INSERT INTO oferta (semestre, disciplina, professor) VALUES 
('2024.1', 1, 29),
('2024.1', 2, 6),
('2024.1', 3, 5),
('2024.2', 4, 6),
('2024.2', 5, 5),
('2024.2', 6, 34),
('2025.1', 7, 33),
('2025.1', 8, 32),
('2025.2', 9, 26),
('2025.2', 10, 34),
('2025.2', 11, 30),
('2025.2', 12, 28),
('2025.2', 13, 27),
('2025.2', 14, 31);

select * from matricula

INSERT INTO matricula (aluno, oferta, conceito) VALUES 
(1, 52, 8),
(2, 53, 7),
(3, 54, 9),
(4, 55, 6),
(5, 56, 10),
(6, 57, 5),
(7, 58, 8),
(8, 59, 7),
(9, 60, 9),
(10, 61, 6),
(1, 62, 10),
(2, 63, 8),
(3, 64, 7),
(4, 65, 9);


