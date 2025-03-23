-- 1. Função que retorna a quantidade de disciplinas diferentes ministradas por um professor
CREATE OR REPLACE FUNCTION qtd_disciplinas_professor(professor_id INT) RETURNS INT AS $$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(DISTINCT disciplina) INTO total
    FROM oferta
    WHERE professor = professor_id;
    RETURN total;
END;
$$ LANGUAGE plpgsql;

-- 2. Função que retorna a quantidade de matrículas de um aluno
CREATE OR REPLACE FUNCTION qtd_matriculas_aluno(aluno_id INT) RETURNS INT AS $$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(*) INTO total
    FROM matricula
    WHERE aluno = aluno_id;
    RETURN total;
END;
$$ LANGUAGE plpgsql;

-- 3. Função que retorna a quantidade de alunos diferentes que um professor lecionou
CREATE OR REPLACE FUNCTION qtd_alunos_professor(professor_id INT) RETURNS INT AS $$
DECLARE
    total INT;
BEGIN
    SELECT COUNT(DISTINCT m.aluno) INTO total
    FROM matricula m
    JOIN oferta o ON m.oferta = o.id
    WHERE o.professor = professor_id;
    RETURN total;
END;
$$ LANGUAGE plpgsql;

-- 4. Consultas utilizando as funções criadas
SELECT nome, qtd_disciplinas_professor(id) AS total_disciplinas FROM servidor;
SELECT nome, qtd_matriculas_aluno(id) AS total_matriculas FROM aluno;
SELECT nome, qtd_alunos_professor(id) AS total_alunos FROM servidor;
