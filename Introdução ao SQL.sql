-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercício 1 - Criar base de dados -----------------------------------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE teste;

CREATE DATABASE empresa;

USE empresa;

SELECT 
    *
FROM
    funcionarios;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercício 2 - Selecionar os dados da tabela serviços ----------------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SELECT 
    *
FROM
    servicos;

SHOW DATABASES;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercício 3 - Criar uma  base de dados com o nome "minha_bd", verificar se foi criada e remover ---------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE minha_bd;

SHOW DATABASES;

DROP DATABASE minha_bd;

CREATE TABLE clientes (
    codigo INT,
    nome VARCHAR(20),
    morada VARCHAR(20)
);

DROP TABLE clientes;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercício 4 - Criar uma base de dados com o nome "teste_tipo_dados" e criar uma tabela com textos -------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE teste_tipo_dados;

USE teste_tipo_dados;

CREATE TABLE tab_textos (
    codigo CHAR(5),
    nome VARCHAR(20),
    morada MEDIUMTEXT
); 

INSERT INTO tab_textos VALUES ('ABC','Rui','Rua 25 de Abril');

SELECT * FROM tab_textos;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercício 5 - Criar uma tabela "cadastro", com os campos "nome" e "sobrenome" do tipo VARCHAR com limite de 100 caracteres, e inserir dados -------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE cadastro (
    nome VARCHAR(100),
    sobrenome VARCHAR(100)
);

INSERT INTO cadastro VALUES ('Joana','Cardoso');
INSERT INTO cadastro VALUES ('Henrique','Silva');
INSERT INTO cadastro VALUES ('João','Pereira');
INSERT INTO cadastro VALUES ('Rui','Guerra');
INSERT INTO cadastro VALUES ('Sara','Sousa');

SELECT * FROM cadastro;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercício 6 - Criar uma tabela com o nome "tab_produtos" e 4 campos à escolha, inserir dados e de seguida selecionar todos os dados ---------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_produtos (
    nome VARCHAR(20),
    categoria VARCHAR(20),
    pessoas VARCHAR(20),
    preco CHAR(100)
);

INSERT INTO tab_produtos VALUES ('Aspirar','Limpeza','uma','20euros');
INSERT INTO tab_produtos VALUES ('Limpar paredes','Limpeza','duas','50euros');
INSERT INTO tab_produtos VALUES ('Lavar loiça','Extra','uma','10euros');
INSERT INTO tab_produtos VALUES ('Engomar','Extra','uma','20euros');

SELECT * FROM tab_produtos;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercício 7 - Criar uma tabela com o nome "tab_numeros" com 3 campos à escolha entre os quais o tipo BOOL e INT e inserir 4 linhas na tabela ------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_numeros (
    preco INT,
    quantidade INT,
    ativo BOOL
);

INSERT INTO tab_numeros VALUES (20,10,FALSE);
INSERT INTO tab_numeros VALUES (10,100,TRUE);
INSERT INTO tab_numeros VALUES (40,50,TRUE);
INSERT INTO tab_numeros VALUES (5,40,FALSE);

SELECT * FROM tab_numeros;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercício 8 - Criar uma tabela com o nome "tab_clientes" e os campos "id", "nome" e "data_nascimento". Inserir 7 registos na tabela, selecionar todos os dados, adicionar um campo à tabela e
-- executar uma instrução SELECT para pesquisar quem nasceu depois de "1999-11-17"  ------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE tab_clientes (
    id INT,
    nome VARCHAR(20),
    data_nascimento DATE
    );
    
INSERT INTO tab_clientes VALUES (1, 'Rui','1970-05-10');
INSERT INTO tab_clientes VALUES (2, 'Tânia','1990-02-20');
INSERT INTO tab_clientes VALUES (3, 'Henrique','1991-02-05');
INSERT INTO tab_clientes VALUES (4, 'Joana','1988-06-10');
INSERT INTO tab_clientes VALUES (5, 'Sara','1999-03-15');
INSERT INTO tab_clientes VALUES (6, 'Eduardo','2001-12-03');
INSERT INTO tab_clientes VALUES (7, 'Joana','1999-11-17');

SELECT * FROM tab_clientes;

SELECT * FROM tab_clientes WHERE data_nascimento>'1999-11-17';

ALTER TABLE tab_clientes ADD COLUMN (telemovel VARCHAR(9));

INSERT INTO tab_clientes VALUES (7, 'Joana','1999-11-17','924858485');

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercício 9 - Adicionar a coluna "codigo_postal" com CHAR(8) na tabela "tab_clientes" -------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE tab_clientes ADD COLUMN (codigo_postal CHAR(8));

INSERT INTO tab_clientes VALUES (7, 'Joana','1999-11-17','924858485','4358-583','Braga');

DESC tab_clientes;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Ecercício 10 - Remover a coluna "codigo_postal", remover um dado e alterar dados de uma coluna ----------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

ALTER TABLE tab_clientes DROP COLUMN codigo_postal;

DELETE FROM tab_clientes WHERE id=1;

ALTER TABLE tab_clientes MODIFY COLUMN telemovel int;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercíco 11 - Criar base de dados, selecionar para uso, criar tabela, inserir campos e respetivos dados. Selecionar apenas o código-postal da tabela ----------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE DATABASE bd_registo;

USE bd_registo;

CREATE TABLE tab_pessoas (
    nome VARCHAR(20),
    morada VARCHAR(20),
    localidade VARCHAR(20),
    codigo_postal INT
);

INSERT INTO tab_pessoas values ('Rui','Rua A','Braga',4700); 
INSERT INTO tab_pessoas values ('Joana','Rua B','Lisboa',2675);
INSERT INTO tab_pessoas values ('Henrique','Rua C','Porto',4425);
INSERT INTO tab_pessoas values ('Sara','Rua D','Viseu',3550);
INSERT INTO tab_pessoas values ('Tânia','Rua E','Braga',4700);

SELECT * FROM tab_pessoas;

SELECT codigo_postal FROM tab_pessoas;

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercício 12 - Atualização de um dado num campo ---------------------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

UPDATE tab_pessoas SET codigo_postal=4800 WHERE nome='Sara';

-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Exercício 13 - Exclusão da pessoa cujo código postal é 2675 ---------------------------------------------------------------------------------------------------------------------------------
-- ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

DELETE FROM tab_pessoas WHERE codigo_postal=2675;






