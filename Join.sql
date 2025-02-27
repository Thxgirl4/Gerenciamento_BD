CREATE TABLE basket_a (
    a INT PRIMARY KEY,
    fruit_a VARCHAR (100) NOT NULL
);

CREATE TABLE basket_b (
    b INT PRIMARY KEY,
    fruit_b VARCHAR (100) NOT NULL
);

INSERT INTO basket_a (a, fruit_a)
VALUES
    (1, 'Apple'),
    (2, 'Orange'),
    (3, 'Banana'),
    (4, 'Cucumber');


INSERT INTO basket_b (b, fruit_b)
VALUES
    (1, 'Orange'),
    (2, 'Apple'),
    (3, 'Watermelon'),
    (4, 'Pear');


   /* A instrução a seguir une a primeira tabela ( basket_a) 
   com a segunda tabela ( basket_b) correspondendo os valores 
   nas colunas fruit_ae :fruit_b */

    SELECT 
      a,
      fruit_a,
      b,
      fruit_b
    FROM
       basket_a
    INNER JOIN basket_b
     ON fruit_a = fruit_b;     


     /* A declaração a seguir usa a cláusula left join para unir a basket_atabela com a basket_btabela. No contexto left join, a primeira tabela é 
     chamada de left table e a segunda tabela é chamada de right table. 
     A junção esquerda começa selecionando dados da tabela esquerda. 
     Ela compara valores na coluna fruit_a com os valores na coluna fruit_b na tabela basket_b.
     */
     
    SELECT 
    a,
    fruit_a,
    b,
    fruit_b
    FROM
    basket_a
    LEFT JOIN basket_b
    ON fruit_a = fruit_b;


    /*
    A junção direita é uma versão invertida da junção esquerda. 
    A junção direita começa selecionando dados da tabela direita. 
    Ela compara cada valor na coluna fruit_b de cada linha na tabela direita 
    com cada valor na coluna fruit_a de cada linha na tabela fruit_a.
    Se esses valores forem iguais, a junção correta cria uma nova linha que contém colunas 
    de ambas as tabelas.
    Caso esses valores não sejam iguais, a junção à direita também cria uma nova linha 
    que contém colunas de ambas as tabelas. 
    No entanto, ela preenche as colunas na tabela à esquerda com NULL.
    */

    SELECT 
    a,
    fruit_a,
    b,
    fruit_b
    FROM
    basket_a
    RIGHT JOIN basket_b
    ON fruit_a = fruit_b;


    

