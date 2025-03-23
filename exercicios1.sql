create view relatorioservidores as
select s.id sid,
       s.nome snome,
	   d.nome dnome,
	   c.nome cnome
from servidor s
join departamento d
on s.departamento = d.id
join cargo c
on s.cargo = c.id
order by s.nome;

select * from relatorioservidores

create view professores as
select s.nome
from servidor s
join cargo c
 on s.cargo = c.id
 where c.nome = 'Professor Assistente'
 order by s.nome;

select * from professores

-- Exercicio 1
create materialized view qtdmatricula as
select semestre, count(distinct disciplina)
from oferta
group by semestre;

select * from qtdmatricula

-- Exercicio 2
create view qtdprofessores03 as
select professor,
       disciplina,
	   s.nome
from oferta 
join disciplina d
on oferta.disciplina = d.id
join servidor s
on oferta.professor = s.id
order by professor;

select * from qtdprofessores03

create view qtdprofessores04 as
select oferta.professor, count(oferta.disciplina) AS qtd_disciplina,
	   s.nome
from oferta 
join servidor s
on oferta.professor = s.id
group by oferta.professor, s.nome
order by oferta.professor;

select * from qtdprofessores04

-- Exercicio 3
create materialized view qtd_disciplina as
select count(distinct oferta.disciplina) as qtddisciplina,
             oferta.semestre, 
			 d.nome
from oferta
join disciplina d
on oferta.disciplina = d.id
group by oferta.disciplina, d.nome, oferta.semestre
order by d.nome;

select * from qtd_disciplina

-- exercicio 4
/* Construa uma visualização que mostra os cargos diferentes do professor ou docente
que tenham ofertado disciplinas no último semestre.*/

create view cargos_professor as
select c.nome cnome, s.nome snome, o.disciplina, o.semestre
from servidor s
join cargo c
on s.cargo = c.id
join oferta o
on o.professor = s.id
where o.semestre = '2024.2'
order by c.nome;

select * from cargos_professor

--------------------------------Exercicios VIEWS E JOIN-------------------------------------------

-- 1. Quais são os alunos matriculados em cada disciplina e o conceito obtido?
SELECT a.nome AS aluno, d.nome AS disciplina, m.conceito 
FROM matricula m
JOIN aluno a ON m.aluno = a.id
JOIN oferta o ON m.oferta = o.id
JOIN disciplina d ON o.disciplina = d.id;

-- 2. Quais são os professores responsáveis por cada oferta de disciplina?
SELECT d.nome AS disciplina, s.nome AS professor 
FROM oferta o
JOIN disciplina d ON o.disciplina = d.id
JOIN servidor s ON o.professor = s.id;

-- 3. Quais são os servidores, seus cargos e os departamentos aos quais pertencem?
SELECT s.nome AS servidor, c.nome AS cargo, d.nome AS departamento 
FROM servidor s
JOIN cargo c ON s.cargo = c.id
JOIN departamento d ON s.departamento = d.id;

-- 4. Quais são as ofertas de disciplinas disponíveis em um determinado semestre?
SELECT o.semestre, d.nome AS disciplina, s.nome AS professor 
FROM oferta o
JOIN disciplina d ON o.disciplina = d.id
JOIN servidor s ON o.professor = s.id
WHERE o.semestre = '2024.1';

-- 5. Qual é o salário dos professores que oferecem disciplinas?
SELECT DISTINCT s.nome AS professor, c.salario 
FROM oferta o
JOIN servidor s ON o.professor = s.id
JOIN cargo c ON s.cargo = c.id;

-- 6. Quais alunos estão matriculados em disciplinas ofertadas por um determinado professor?
SELECT a.nome AS aluno, d.nome AS disciplina, s.nome AS professor 
FROM matricula m
JOIN aluno a ON m.aluno = a.id
JOIN oferta o ON m.oferta = o.id
JOIN disciplina d ON o.disciplina = d.id
JOIN servidor s ON o.professor = s.id
WHERE s.nome = 'Nome do Professor';

-- 7. Quais disciplinas são ofertadas e quais são seus professores responsáveis?
SELECT d.nome AS disciplina, s.nome AS professor 
FROM oferta o
JOIN disciplina d ON o.disciplina = d.id
JOIN servidor s ON o.professor = s.id;

-- 8. Em quais departamentos trabalham os servidores e quais são suas funções?
SELECT s.nome AS servidor, d.nome AS departamento, c.nome AS cargo 
FROM servidor s
JOIN departamento d ON s.departamento = d.id
JOIN cargo c ON s.cargo = c.id;

-- 9. Quantidade de matrículas por semestre
SELECT o.semestre, COUNT(m.id) AS total_matriculas
FROM matricula m
JOIN oferta o ON m.oferta = o.id
GROUP BY o.semestre;

-- 10. Quantidade de professores que ofertaram cada disciplina
SELECT d.nome AS disciplina, COUNT(DISTINCT o.professor) AS total_professores
FROM oferta o
JOIN disciplina d ON o.disciplina = d.id
GROUP BY d.nome;

-- 11. Média de salários dos professores por departamento
SELECT d.nome AS departamento, AVG(c.salario) AS salario_medio
FROM servidor s
JOIN cargo c ON s.cargo = c.id
JOIN departamento d ON s.departamento = d.id
GROUP BY d.nome;

-- 12. Professores que oferecem mais de duas disciplinas no mesmo semestre
SELECT s.nome AS professor, o.semestre, COUNT(o.disciplina) AS total_disciplinas
FROM oferta o
JOIN servidor s ON o.professor = s.id
GROUP BY s.nome, o.semestre
HAVING COUNT(o.disciplina) > 2;

-- 13. Alunos que obtiveram conceito 'A' em pelo menos uma disciplina
SELECT DISTINCT a.nome AS aluno
FROM matricula m
JOIN aluno a ON m.aluno = a.id
WHERE m.conceito = 'A';

-- 14. Quantidade de disciplinas oferecidas por departamento
SELECT d.nome AS departamento, COUNT(o.id) AS total_ofertas
FROM oferta o
JOIN servidor s ON o.professor = s.id
JOIN departamento d ON s.departamento = d.id
GROUP BY d.nome;

-- 15. Professores que nunca ofertaram disciplinas
SELECT s.nome AS professor
FROM servidor s
LEFT JOIN oferta o ON s.id = o.professor
WHERE o.professor IS NULL;

-- 16. Alunos com maior número de matrículas em um semestre
SELECT a.nome AS aluno, o.semestre, COUNT(m.id) AS total_matriculas
FROM matricula m
JOIN aluno a ON m.aluno = a.id
JOIN oferta o ON m.oferta = o.id
GROUP BY a.nome, o.semestre
ORDER BY total_matriculas DESC
LIMIT 5;

-- 17. Professores e sua experiência medida pelo número de disciplinas ofertadas
SELECT s.nome AS professor, COUNT(o.id) AS total_ofertas
FROM oferta o
JOIN servidor s ON o.professor = s.id
GROUP BY s.nome
ORDER BY total_ofertas DESC;

-- 18. Departamentos que mais oferecem disciplinas
SELECT d.nome AS departamento, COUNT(o.id) AS total_ofertas
FROM oferta o
JOIN servidor s ON o.professor = s.id
JOIN departamento d ON s.departamento = d.id
GROUP BY d.nome
ORDER BY total_ofertas DESC;

-- 19. Relação entre número de alunos e número de professores por semestre
SELECT o.semestre, COUNT(DISTINCT m.aluno) AS total_alunos, COUNT(DISTINCT o.professor) AS total_professores
FROM oferta o
LEFT JOIN matricula m ON o.id = m.oferta
GROUP BY o.semestre;

-- 20. Professores que tiveram mais alunos matriculados
SELECT s.nome AS professor, COUNT(m.id) AS total_alunos
FROM oferta o
JOIN servidor s ON o.professor = s.id
JOIN matricula m ON o.id = m.oferta
GROUP BY s.nome
ORDER BY total_alunos DESC
LIMIT 5;




        
        



