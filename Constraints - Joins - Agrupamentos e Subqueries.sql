-- ---------------------------------------------------------------------------------------------------
-- -------------------- Operador IN/Exercício18 -----------------
-- ---------------------------------------------------------------------------------------------------

SELECT * FROM dept_emp WHERE dept_no IN ('d004','d005','d006'); -- ass três formas estão corretas, mas está é a mais otimizada e simples

SELECT * FROM dept_emp WHERE dept_no LIKE 'd004' OR dept_no LIKE 'd005' OR dept_no LIKE 'd006';

SELECT * FROM dept_emp WHERE dept_no='d004' OR dept_no='d005' OR dept_no='d006';

-- ---------------------------------------------------------------------------------------------------
-- -------------------- Exercício 19 -----------------
-- ---------------------------------------------------------------------------------------------------

SELECT * FROM employees WHERE last_name IN ('Facello','Peac');

-- ---------------------------------------------------------------------------------------------------
-- -------------------- Função COUNT --------------------
-- ---------------------------------------------------------------------------------------------------

SELECT COUNT(*) FROM employees WHERE last_name IN ('Facello','Peac'); -- assim conseguimos saber o número de pessoas que o ultimo nome é facello e peac

-- ---------------------------------------------------------------------------------------------------
-- ------------------ Operador BETWEEN -----------------
-- ---------------------------------------------------------------------------------------------------

SELECT * FROM dept_emp WHERE dept_no BETWEEN 'd001' AND 'd008'; -- este é parecido com o IN_0, mas tem um intervalo de valores

-- ---------------------------------------------------------------------------------------------------
-- ------------------- Exercício 20 -----------------
-- ---------------------------------------------------------------------------------------------------

SELECT * FROM salaries WHERE salary BETWEEN '125000' AND '175000'; -- aqui conseguimos ver todos os salarios entre os valores que colocarmos

-- ---------------------------------------------------------------------------------------------------
-- ------------------- Criar um ALIAS -----------------
-- ---------------------------------------------------------------------------------------------------

SELECT SUM(salary) AS soma_salario FROM salaries; -- serve para renomear uma coluna com um nome não objetivo ou colunas originidas de função

-- ---------------------------------------------------------------------------------------------------
-- ------------------- Exercício 21 -----------------
-- ---------------------------------------------------------------------------------------------------

CREATE DATABASE contas;

USE contas;


CREATE TABLE contas (
    id INT PRIMARY KEY auto_increment NOT NULL,
    nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    saldo INT,
    data_nascimento DATE
);

CREATE INDEX saldo_index ON contas (saldo);

INSERT INTO contas (nome, sobrenome, saldo, data_nascimento) VALUES ('Rui','Silva',347574,'1990-02-20');
INSERT INTO contas (nome, sobrenome, saldo, data_nascimento) VALUES ('Joana','Cardoso',134757,'1999-11-17');
INSERT INTO contas (nome, sobrenome, saldo, data_nascimento) VALUES ('Tãnia','Ribeiro',275765,'1992-08-12');

SELECT * FROM contas;

-- ---------------------------------------------------------------------------------------------------
-- ------------------------ JOIN --------------------
-- ---------------------------------------------------------------------------------------------------

USE employees;

-- ---------------------------------------------------------------------------------------------------
-- -------------------- Exercício 22 ----------------- juntamos duas tabelas de duas colunas diferentes
-- ---------------------------------------------------------------------------------------------------

SELECT 
    first_name, gender, title
FROM
    employees
        INNER JOIN
    titles ON employees.emp_no = titles.emp_no;


SELECT 
    employees.first_name, employees.gender, titles.title 
FROM
    employees
        INNER JOIN
    titles ON employees.emp_no = titles.emp_no; ------- forma mais pratica
    
-- --------------------------------------------------------------------------- 
-- ------------------- Exercício 23 ------------------------------------------
-- --------------------------------------------------------------------------- 

USE employees;

SELECT * FROM employees GROUP BY hire_date;                   -- mostra os trabalhadores por data de contratação 

SELECT first_name, last_name, title FROM employees INNER JOIN titles ON employees.emp_no=titles.emp_no GROUP BY title;        -- seleciona as colunas, junta os titulos onde a chave primária emp_no é igual a outra tabela

SELECT count(title), title FROM titles GROUP BY title;


SELECT COUNT(title), title FROM titles WHERE titles.to_date = '9999.01.01' GROUP BY title;           -- faz a conta dos trabalhadores atuais

    
-- ---------------------------------------------------------------------------------------------------
-- -------------------- Exercício complementar 1 ----------------- juntamos três tabelas de duas colunas diferentes
-- ---------------------------------------------------------------------------------------------------

SELECT 
    employees.first_name, employees.last_name, salaries.salary
FROM
    employees
        INNER JOIN
    salaries ON employees.emp_no = salaries.emp_no;

-- ---------------------------------------------------------------------------------------------------
-- -------------------- Exercício complementar 2 ----------------- juntamos quatro tabelas de três colunas diferentes
-- ---------------------------------------------------------------------------------------------------

SELECT 
    employees.first_name,
    employees.last_name,
    titles.title,
    salaries.salary
FROM
    employees
        INNER JOIN
    titles ON  employees.emp_no = titles.emp_no
        INNER JOIN
    salaries ON employees.emp_no = salaries.emp_no;
    
-- ---------------------------------------------------------------------------------------------------
-- -------------------- Exercício complementar 3 ----------------- o mesmo do exercicio anterior mas apenas com o salario atual
-- ---------------------------------------------------------------------------------------------------

SELECT 
    employees.first_name,
    employees.last_name,
    titles.title,
    salaries.salary
FROM
    employees
        INNER JOIN
    titles ON  employees.emp_no = titles.emp_no
        INNER JOIN
    salaries ON employees.emp_no = salaries.emp_no WHERE salaries.to_date='9999-01-01';
    
-- ---------------------------------------------------------------------------------------------------
-- -------------------- Exercício complementar 4 ----------------- o mesmo do exercicio anterior mas com o salario atual e o titulo 
-- ---------------------------------------------------------------------------------------------------

SELECT 
    employees.first_name,
    employees.last_name,
    titles.title,
    salaries.salary
FROM
    employees
        INNER JOIN
    titles ON  employees.emp_no = titles.emp_no
        INNER JOIN
    salaries ON employees.emp_no = salaries.emp_no WHERE salaries.to_date='9999-01-01' AND titles.to_date='9999-01-01';
