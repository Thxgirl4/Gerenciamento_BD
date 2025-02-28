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


        
        



