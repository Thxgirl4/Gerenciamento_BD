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