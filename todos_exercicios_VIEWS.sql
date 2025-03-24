--1. Construa uma visualização que mostra a quantidade 
-- de matrículas por semestre.
create view qtd_matriculas_semestre as
select o.semestre, count(m.id) as total_matriculas
from oferta o 
join matricula m on m.oferta = o.id
group by o.semestre;

select * from qtd_matriculas_semestre;

----------------------------------------
--2.Construa uma visualização que mostra a quantidade 
-- de professores que ofertaram cada disciplina.
create view qtd_prof_por_disciplina as
select d.nome as disciplina, count(distinct o.professor) as total_prof
from oferta o
join disciplina d on o.disciplina = d.id
group by d.nome;

select * from qtd_prof_por_disciplina;

----------------------------------------
--3. Construa uma visualização materializada que mostra a quantidade 
-- de disciplinas diferentes ofertadas por semestre.
create materialized view qtd_disciplinas_ofert_semestre as 
select o.semestre, count(distinct o.disciplina) as total_disciplinas
from oferta o 
group by o.semestre;

select * from qtd_disciplinas_ofert_semestre;
---------------------------------------
--4. Construa uma visualização que mostra os cargos diferentes 
-- do professor ou docente que tenham ofertado disciplinas no último semestre.
create view disciplinas_coord_sem202501 as
select o.semestre, d.nome as disciplina, s.nome as servidor, c.nome as cargo
from oferta o 
join disciplina d on o.disciplina = d.id
join servidor s on o.professor = s.id
join cargo c on s.cargo = c.id
where c.nome <> 'Professor Assistente' 
and c.nome != 'Professor Titular' 
and o.semestre = '2025.1'
group by o.semestre, d.nome, s.nome, c.nome;

select * from disciplinas_coord_sem202501;
--------------------------------------------
--5. Crie uma visualização materializada que mostra a quantidade de 
-- matrículas por professor. Ela deve ser criada sem dados. 
-- Popule a visualização materializada explicitamente.
create materialized view qtd_matricula_profv001 as 
select s.id, s.nome as servidor, count(m.id) as total_matric
from matricula m
join oferta o 
     on m.oferta = o.id
join servidor s 
     on o.professor = s.id
group by s.id, s.nome
with no data;

select * from qtd_matricula_profv001;

refresh materialized view qtd_matricula_profv001;
---------------------------------------------
select s.id, s.nome, count(*) as total_matric
from servidor s 
join oferta o
	on o.professor = s.id
join matricula m
	on m.oferta = o.id
group by s.id, s.nome;

--------------------------------------------
--6. Crie uma visualização que mostra a quantidade 
-- de aprovações de alunos por departamento.
create view qtd_aprovacoes_p_departv002 as 
select d.nome departamento, a.nome aluno, m.conceito
from departamento d
join servidor s on s.departamento = d.id
join oferta o on s.id = o.professor
join matricula m on o.id = m.oferta
join aluno a on m.aluno = a.id
where m.conceito >= 7
group by d.nome, a.nome, m.conceito;

select * from qtd_aprovacoes_p_departv002;

--------------------------------------
select d.id, d.nome, count(*) as total_aprovacoes 
from departamento d
join servidor s on d.id = s.departamento 
join oferta o on o.professor = s.id
join matricula m on m.oferta = o.id
where m.conceito >= 6
group by d.id, d.nome;

------------------------------------------------------
--7. Crie uma visualização que mostra o coeficiente de aprovações por aluno.
-- O coeficiente de aprovações é calculado pela razão entre a quantidade 
-- de aprovações e a quantidade de matrículas do aluno.
create view coef_aprovacoes_alunov003 as
select a.id, a.nome aluno, count(ma.id) / count(mm.id) as cr
from aluno a 
join matricula ma on ma.aluno = a.id and ma.conceito >=6
right join matricula mm on ma.id = mm.id
group by a.id, a.nome
order by a.id asc;

select * from coef_aprovacoes_alunov003;
-------------------------
select a.id, a.nome, count(ma.id)/count(mm.id) cr
from aluno a
join matricula ma
	on a.id = ma.aluno
	and ma.conceito >= 6
right join matricula mm
	on ma.id = mm.id
group by a.id, a.nome;

-----------------------------------------------------------

