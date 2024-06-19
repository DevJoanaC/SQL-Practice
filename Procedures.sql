-- ----------------------------------------------------------------------------------------------------
-- ------------------------------------------- PROCEDURES ---------------------------------------------
-- ----------------------------------------------------------------------------------------------------

-- Criação de um procedimento armazenado chamado 'pesq_num_filme' que aceita um parâmetro de entrada 'numero'
CREATE PROCEDURE pesq_num_filme (numero INT)
    -- Seleciona todos os campos da tabela 'film' onde o 'film_id' é igual ao valor do parâmetro 'numero'
    SELECT * FROM film WHERE film_id = numero;

-- Chama o procedimento 'pesq_num_filme' com o valor 6 para o parâmetro 'numero'
CALL pesq_num_filme(6);

-- Chama o procedimento 'pesq_num_filme' com o valor 50 para o parâmetro 'numero'
CALL pesq_num_filme(50);

-- Criação de um procedimento armazenado chamado 'pesq_entre_filme' que aceita dois parâmetros de entrada 'numero1' e 'numero2'
CREATE PROCEDURE pesq_entre_filme (numero1 INT, numero2 INT)
    -- Seleciona todos os campos da tabela 'film' onde o 'film_id' é maior que 'numero1' e menor que 'numero2'
    SELECT * FROM film WHERE film_id > numero1 AND film_id < numero2;

-- Remove o procedimento 'pesq_entre_filme' existente
DROP PROCEDURE pesq_entre_filme;

-- Criação de um novo procedimento armazenado chamado 'pesq_entre_filme' que aceita dois parâmetros de entrada 'numero1' e 'numero2'
CREATE PROCEDURE pesq_entre_filme (numero1 INT, numero2 INT)
-- Seleciona os campos 'film_id' e 'title' da tabela 'film' onde o 'film_id' é maior que 'numero1' e menor que 'numero2'
SELECT film_id, title FROM film WHERE film_id > numero1 AND film_id < numero2;

-- Chama o procedimento 'pesq_entre_filme' com os valores 5 e 30 para os parâmetros 'numero1' e 'numero2'
CALL pesq_entre_filme(5, 30);

-- ----------------------------------------------------------------------------------------------------
-- ------------------------------------ Listar filmes e língua ----------------------------------------
-- ----------------------------------------------------------------------------------------------------

SELECT film.title, language.name                                 
FROM film
INNER JOIN language
ON film.language_id=language.language_id; -- mostra tabela com o nome do filme e a sua respetiva língua


SELECT film.title, language.name                                 
FROM film
INNER JOIN language
ON film.language_id=language.language_id
WHERE language.name='Italian'; -- mostra apenas os filmes com a língua em Italiano


CREATE PROCEDURE pesquisa_filme_lingua (lingua CHAR(20))
SELECT film.title, language.name                                 
FROM film
INNER JOIN language
ON film.language_id=language.language_id
WHERE language.name=lingua; -- cria procedimento no schemas 


CALL pesquisa_filme_lingua('English'); -- mostra na mesma os filmes e as suas respetivas línguas mas com uma formula mais simples

-- ----------------------------------------------------------------------------------------------------
-- ------------------------------- Listar filmes e o tempo de aluguer ---------------------------------
-- ----------------------------------------------------------------------------------------------------

SELECT film.title, film.rental_duration
FROM film;

CREATE PROCEDURE lista_tempo_aluguer()
SELECT film.title, film.rental_duration
FROM film;

CALL lista_tempo_aluguer;

-- ----------------------------------------------------------------------------------------------------
-- -------------- Listar filmes e o tempo de aluguer por paramentro rental_duration -------------------
-- ----------------------------------------------------------------------------------------------------

CREATE PROCEDURE lista_tempo_aluguer_parametro(duracao int)
SELECT film.title, film.rental_duration
FROM film
WHERE film.rental_duration=duracao;

DROP PROCEDURE lista_tempo_aluguer_parametro;

CALL lista_tempo_aluguer_parametro(4);

-- ----------------------------------------------------------------------------------------------------
-- ----------------------------- Contar os filmes com rental_duration x -------------------------------
-- ----------------------------------------------------------------------------------------------------

CREATE PROCEDURE conta_filmes_duracao_aluguer(duracao INT)
SELECT COUNT(film.title), film.rental_duration
FROM film
WHERE film.rental_duration=duracao;

call conta_filmes_duracao_aluguer(4);

-- ----------------------------------------------------------------------------------------------------
-- Procedimento para listar os filmes que contenham uma determinada palavras no titulo do filme como por exemplo DEVIL 
-- ----------------------------------------------------------------------------------------------------

CREATE PROCEDURE pesq_filme(titulo VARCHAR(20))
SELECT film.title
FROM film 
WHERE film.title LIKE titulo;

CALL pesq_filme ('%Devil%');


CREATE PROCEDURE pesq_nome_filme(titulo VARCHAR(20))
SELECT film.title
FROM film 
WHERE film.title LIKE concat('%',titulo,'%'); -- assim o cliente não precisa colocar a percentagem para procurar o nome

call pesq_nome_filme ('Devil');

-- ----------------------------------------------------------------------------------------------------
-- --------------------------------- Contar os filmes por ranking  ------------------------------------
-- ----------------------------------------------------------------------------------------------------

SELECT film.rating, count(film.rating) FROM film GROUP BY rating;  

SELECT film.rating, count(film.rating) FROM film GROUP BY rating ORDER BY rating;                                   -- agrupa e ordena pelo ranking 

SELECT film.rating, count(film.rating) FROM film GROUP BY rating order by rating DESC LIMIT 1;                      -- mostra os valores pedidos por ordem decrescente 

SELECT film.rating, count(film.rating) AS nrate FROM film GROUP BY rating order by nrate DESC LIMIT 3 offset 2;     -- mostra os valores pedidos com o limite desejado e a partir de qual posição colocar 




