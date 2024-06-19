-- ---------------------------- Funções de String ---------------------------- 
-- --------------------------------------------------------------------------- 
-- ------------------------------ CHAR_LENGTH -------------------------------- 
-- --------------------------------------------------------------------------- 
-- ----------------------------- Exercício 26 -------------------------------- 
-- --------------------------------------------------------------------------- 

USE sakila;

SELECT * FROM address;

SELECT address_id, address, char_length (postal_code) FROM address;             -- diz o comprimento do codigo-postal 

SELECT char_length (postal_code) FROM address GROUP BY postal_code;         -- diz apenas o comprimento do codigo-postal em que não r

SELECT char_length (postal_code) FROM address GROUP BY char_length (postal_code);  

SELECT COUNT(char_length (postal_code)), char_length (postal_code) FROM address GROUP BY char_length (postal_code); 

SELECT COUNT(char_length (postal_code)) AS contagem, char_length (postal_code) AS num_car_post_code FROM address GROUP BY char_length (postal_code);

-- --------------------------------------------------------------------------- 
-- -------------------------------- CONCAT ----------------------------------- 
-- --------------------------------------------------------------------------- 
-- ----------------------------- Exercício 27 -------------------------------- 
-- --------------------------------------------------------------------------- 

SELECT CONCAT(first_name,' ', last_name) FROM actor;

SELECT CONCAT('O/A ', first_name,' ', last_name,', tem o código ', actor_id) FROM actor;

-- --------------------------------------------------------------------------- 
-- ------------------------------ CONCAT_WS ---------------------------------- 
-- --------------------------------------------------------------------------- 

SELECT concat_ws('-', actor_id, first_name, last_name) AS atores FROM actor;   

-- --------------------------------------------------------------------------- 
-- -------------------------------- FORMAT ----------------------------------- 
-- --------------------------------------------------------------------------- 

SELECT FORMAT (amount,1) FROM payment;             -- formata um nº com um nº de casas determinado por nos, pode ate arredondar o nº

SELECT FORMAT (amount,3) FROM payment;             -- outro exemplo mas com tres 

-- --------------------------------------------------------------------------- 
-- -------------------------------- INSTR ------------------------------------ 
-- --------------------------------------------------------------------------- 

SELECT last_name, INSTR(last_name, 'e') FROM actor ORDER BY actor_id;             -- vai buscar a posição da letra, no caso, no ultimo nome 

SELECT first_name, last_name, INSTR(last_name, 'e') FROM actor ORDER BY actor_id;         -- o mesmo só que aqui mostra o nome e o apelido antes da posição da letra

SELECT actor_id, first_name, last_name, INSTR(last_name, 'e') FROM actor ORDER BY actor_id;        -- aqui mostra o id, nome e aplido, depois a posição da letra

SELECT last_name, count(last_name) FROM actor WHERE INSTR(last_name, 'Neeson');             -- vai contar os mesmo em que na tabela atores são Neeson e mostra o apelido primeiro

-- --------------------------------------------------------------------------- 
-- -------------------------------- LCASE ------------------------------------ 
-- --------------------------------------------------------------------------- 

SELECT LCASE(last_name) FROM actor;                -- passa todo o texto selecionado para minúsculas

SELECT LCASE(first_name), LCASE(last_name) FROM actor;              -- aqui passa duas colunas para minúsculas

SELECT LCASE(CONCAT(first_name,' ',last_name)) FROM actor;              -- mostra as duas colunas juntas em minúsculas

SELECT LCASE(CONCAT(first_name,' ',last_name)) AS nome FROM actor;             -- assim dá-lhe o nome de "nome"

-- --------------------------------------------------------------------------- 
-- ------------------------------ LEFT/RIGHT --------------------------------- 
-- --------------------------------------------------------------------------- 
-- ----------------------------- Exercício 28 -------------------------------- 
-- --------------------------------------------------------------------------- 

SELECT LEFT (last_update,4) FROM address;             -- mostra os primeiros 4 caracteres da coluna last_update

SELECT LEFT (first_name,4) FROM actor;                -- mostra os primeiros 4 caracteres do nome

SELECT RIGHT (last_update,8) FROM address;            -- mostra os ultimos 8 caracteres da coluna last_update

SELECT CONCAT('ANO: ', LEFT(last_update,4), ' / HORA: ', RIGHT(last_update,8)) AS ANO_HORA FROM address;                   -- mostra os primeiros 4 e os ultimos 8 carateres da coluna last_update e dá o nome de ANO_HORA

SELECT address_id, LEFT(last_update,4) AS data FROM address WHERE address_id>150;                                          -- o ano e os endereços maiores que 150 
 
-- --------------------------------------------------------------------------- 
-- -------------- SELECIONAR O NÚMERO DA RUA NO CAMPO ADRESS ----------------- 
-- --------------------------------------------------------------------------- 
-- ------------------------------ Exercício ---------------------------------- 
-- --------------------------------------------------------------------------- 

SELECT * FROM address;

SELECT INSTR(address,' ') FROM address;     -- vai buscar a posição do espaço na coluna

SELECT LEFT(address, INSTR(address,' ')) AS n_rua FROM address;                     -- vai buscar o que tem antes do espaço, neste caso se quisessemos saber o nº da rua seria desta forma

SELECT LEFT(address, INSTR(address,' ')-1) AS n_rua FROM address;                   -- uma forma mais automizada de chegar ao nº da rua, assim não incluímos o espaço

-- --------------------------------------------------------------------------- 
-- -------------------------------- REPLACE ---------------------------------- 
-- --------------------------------------------------------------------------- 
-- ----------------------------- Exercício 29 -------------------------------- 
-- --------------------------------------------------------------------------- 

SELECT * FROM customer WHERE last_name='Smith';          -- 

SELECT last_name, REPLACE(last_name, 'SMITH', 'Smith') FROM customer WHERE last_name='Smith';                   -- o replace vai buscar o nome no caso "SMITH" e substitui pelo segundo

SELECT last_name, REPLACE(last_name, 'SMITH', 'Smith') FROM customer ORDER BY customer_id;                      -- o SELECT não altera nada na base de dados apenas no visual

-- --------------------------------------------------------------------------- 
-- -------------------------------- SUBSTR ----------------------------------- 
-- --------------------------------------------------------------------------- 

SELECT * FROM customer;

SELECT first_name, SUBSTR(first_name,2,3) FROM customer;           -- vai à posição dois trazer 3 caracteres 

SELECT last_update, SUBSTR(last_update,6,5) FROM address;               -- vai à posição seis trazer cinco caracteres na coluna last_update

SELECT REPLACE(REPLACE(REPLACE(last_name, 'A', 'a'), 'E', 'e'), 'I', 'i') as full_replace from customer order by customer_id, last_name='SMITH';            -- menino Breno fez (palmas)

-- --------------------------------------------------------------------------- 
-- ----------------------------- EXERCÍCIO -----------------------------------
-- Utilizando a tabela customer
-- Colocar a primeira letra no nome em maiúscula e as restantes em minúsculas
-- Selecionar apenas o servidor de email 
-- --------------------------------------------------------------------------- 

SELECT * FROM customer;

SELECT first_name, LEFT (first_name,1) FROM customer;               -- aparece o nome e vai buscar a primeira letra

SELECT first_name, LCASE(RIGHT (first_name,CHAR_LENGTH(first_name)-1)) FROM customer;             -- o nome sem a primeira letra

SELECT first_name, CONCAT(LEFT (first_name,1), LCASE(RIGHT (first_name,CHAR_LENGTH(first_name)-1))) FROM customer;             -- a primeira letra maiuscula e o resto minusculo

SELECT email FROM customer;

SELECT email, RIGHT (email,4) FROM customer;

SELECT LEFT (email, INSTR(email, '@')-1) FROM customer;

select concat(ucase(left(first_name,1)), lcase(right(first_name,char_length(first_name)-1))) as nome_corrigido, right(email,19) as servidor_email from customer;                  -- Breno fez 

SELECT CONCAT(left(first_name,1), LCASE(right(first_name, char_length(first_name)-1))) AS nome, email,  RIGHT(email,char_length(email)-INSTR(email,'@')) AS servidor FROM customer;                    -- Henrique fez

select concat(ucase(left(first_name,1)), lcase(right(first_name,char_length(first_name)-1))) as nome_corrigido, lcase(left(email, INSTR(email,'@'))) as nome_email, right(email, char_length(email)-INSTR(email,'@')) as servidor_email from customer;            -- Breno fez

-- --------------------------------------------------------------------------- 
-- --------------------------------------------------------------------------- 
-- ----------------------------- Exercício 31 -------------------------------- 
-- --------------------------------------------------------------------------- 

SELECT COUNT(*) FROM customer;

SELECT COUNT(customer_id) FROM customer;

SELECT COUNT(customer_id) FROM customer WHERE store_id=1;

SELECT COUNT(customer_id) FROM customer GROUP BY store_id;

SELECT store_id, COUNT(customer_id) FROM customer GROUP BY store_id;    -- assim sabemos quantos clientes estão cadastrados em cada loja e o nº da loja

-- --------------------------------------------------------------------------- 
-- ------------------------------ CEIL/FLOOR --------------------------------- 
-- --------------------------------------------------------------------------- 

SELECT amount, CEIL(amount), FLOOR(amount) FROM payment;    -- apresenta o valor e aredonda para cima e para baixo 

SELECT amount, CEIL(amount), FLOOR(amount) FROM payment ORDER BY amount DESC;    -- apresenta o valor e aredonda para cima e para baixo descendente

-- --------------------------------------------------------------------------- 
-- ----------------------------- Exercício 32 -------------------------------- 
-- --------------------------------------------------------------------------- 

SELECT MAX(inventory_id) AS maximo, MIN(inventory_id) AS minimo FROM rental;

-- --------------------------------------------------------------------------- 
-- ------------------------------- ADDDATE ----------------------------------- 
-- --------------------------------------------------------------------------- 

SELECT rental_date FROM rental;

SELECT rental_date, ADDDATE(rental_date,2) FROM rental;

SELECT rental_date, ADDDATE(rental_date,6) FROM rental;

-- --------------------------------------------------------------------------- 
-- ------------------------------- ADDTIME ----------------------------------- 
-- --------------------------------------------------------------------------- 

SELECT rental_date, ADDTIME(rental_date,'1:10:02') FROM rental;                       -- aumenta a hora

SELECT rental_date, ADDTIME(rental_date,'-1:10:02') FROM rental;                      -- diminuiu a hora

-- --------------------------------------------------------------------------- 
-- ------------------------------- DATEDIFF ---------------------------------- 
-- ---------------------------------------------------------------------------

SELECT rental_date, DATEDIFF(rental_date,'2024-02-22') FROM rental;

-- --------------------------------------------------------------------------- 
-- ----------------------------- DATE_FORMAT --------------------------------- 
-- --------------------------------------------------------------------------- 

SELECT rental_date, DATE_FORMAT(rental_date,'%Y') AS Ano FROM rental;                 -- vai buscar o ano

SELECT rental_date, DATE_FORMAT(rental_date,'%M') AS Mes FROM rental;                 -- vai buscar o mês

SELECT rental_date, DATE_FORMAT(rental_date,'%D') AS Dia FROM rental;                 -- vai buscar o dia

SELECT rental_date, CONCAT(DATE_FORMAT(rental_date,'%D'),' of ',DATE_FORMAT(rental_date,'%M'),' of ',DATE_FORMAT(rental_date,'%Y')) AS Ano FROM rental;             -- vai buscar, dia, mês e ano por "extenso"    

SELECT rental_date, FLOOR(DATEDIFF(current_date(),rental_date)/365) FROM rental;         -- 

-- --------------------------------------------------------------------------- 
-- ------------------------------ DAYOFWEEK ---------------------------------- 
-- --------------------------------------------------------------------------- 

SELECT rental_date, dayofweek(rental_date) FROM rental;               -- mostra qual o dia da semana

SELECT DAYOFWEEK(CURRENT_DATE()) FROM rental;                         -- mostra o dia de hoje

SELECT DAYOFWEEK(CURRENT_DATE())-1 FROM rental;                       -- mostra o dia de hoje cosiderando o primeiro dia da semana segunda 

SELECT MONTH(rental_date) FROM rental;                                -- mostra o mês

-- --------------------------------------------------------------------------- 
-- ------------------------------ DAYOFYEAR ---------------------------------- 
-- --------------------------------------------------------------------------- 

SELECT rental_date, DAYOFYEAR(rental_date) FROM rental;                                              -- mostra qual o dia do ano

SELECT rental_date, DAY(rental_date), MONTH(rental_date), YEAR(rental_date) FROM rental;             -- mostra o dia, mês e ano 



