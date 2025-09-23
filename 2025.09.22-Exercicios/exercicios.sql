-- 1)	Crie um banco de dados chamado DB_VENDAS

CREATE DATABASE DB_VENDAS
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;



-- 3)	Crie a tabela de acordo com o DER/MER e suas entidades e atributos
-- TB_CLIENTES
-- *id, nome, sexo, renda


 CREATE TABLE TB_CLIENTES(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(200) NOT NULL,
    SEXO VARCHAR(20),
    RENDA DECIMAL
 )

-- 4)	Realize a inserção dos dados abaixo na tabela:

INSERT INTO TB_CLIENTES(NOME, SEXO, RENDA) VALUES
('Andrea Albuquerque', 'Feminino', 10000),
('Daniel Gonçalves','Masculino', 12000),
('Hélder Moreira Souza','Masculino', 10500),
('Marcia Alves Siqueira','Feminino', 13500),
('Regiane Ribeiro Andrade','Feminino', 16500),
('Marina Silva Andrade','Feminino', 10200),
('João Moura Silva','Masculino', 17400), 
('Carlos Eduardo Martins','Masculino', 15000),
('Renata Correa','Feminino', 13500),
('Franciele Firmino','Feminino', 12500),
('Joana de Souza','Feminino', 10200),
('João carlos Silva','Masculino', 12400),
('Eduardo Ribeiro','Masculino', 15000),
('Maria Correa','Feminino', 13500),
('Roberta Santos','Feminino', 11500),
('Marcos Eduardo','Masculino', 15200)

-- 5)	Execute um comando para selecionar todos os dados e conferir se estão corretos, caso tenha algum errado, execute uma operação para limpar todos os dados da tabela e inserir todos novamente.

SELECT * FROM TB_CLIENTES

-- 6)	De acordo com o nosso MER/DER, TB_CLIENTES é uma ______________

-- TB_CLIENTES representa uma ENTIDADE no modelo lógico


-- 7)	De acordo com o nosso MER/DER, ID, Nome, Sexo, Renda são ______________

-- No MER/DER:

-- ID, Nome, Sexo e Renda são atributos da entidade Cliente.
-- Entre eles, o ID é um atributo identificador (chave primária / PK).
-- Já Nome, Sexo e Renda são atributos simples/descritivos, usados para guardar informações do cliente.


-- 8)	Execute um comando para selecionar apenas ID, Nome e Renda de todos os clientes.

SELECT ID, NOME, RENDA FROM TB_CLIENTES

-- 9)	Execute um comando para selecionar apenas ID, Nome e Renda de todos os clientes ordenado crescentemente pela Renda.

SELECT ID, NOME, RENDA FROM TB_CLIENTES ORDER BY RENDA

-- 10)	Execute um comando para selecionar apenas ID, Nome e Renda de todos os clientes ordenado decrescentemente pela Renda

SELECT ID, NOME, RENDA FROM TB_CLIENTES ORDER BY RENDA DESC

-- 11)	Execute um comando que selecione todos os dados dos clientes que ganham mais de 12.000 

SELECT * FROM TB_CLIENTES WHERE RENDA > 12000

-- 12)	Execute um comando que selecione todos os dados dos clientes que ganham mais de 13.000 

SELECT * FROM TB_CLIENTES WHERE RENDA > 13000

-- 13)	Execute um comando que selecione Nome e Renda dos clientes que ganham igual ou mais de 12.000 ordenado crescentemente pela Renda

SELECT NOME, RENDA FROM TB_CLIENTES WHERE RENDA >= 12000 ORDER BY RENDA

-- 14)	A consulta abaixo deve retornar qual ou quais clientes (identificados por ID)?

SELECT ID, Nome, Sexo, Renda FROM Clientes WHERE Renda > 11000	

-- 15)	Selecione todos os dados do João

SELECT * FROM TB_CLIENTES WHERE NOME LIKE '%JOÃO%'

-- 16)	Selecione todos os dados da Marina

SELECT * FROM TB_CLIENTES WHERE NOME LIKE '%Marina%'

-- 17)	Selecione apenas o nome e a renda do Carlos

SELECT NOME, RENDA FROM TB_CLIENTES WHERE NOME LIKE '%Carlos%'

-- 18)	Selecione apenas os clientes do sexo masculino e com a renda maior que 12000

SELECT * FROM TB_CLIENTES WHERE SEXO = 'MASCULINO' AND RENDA > 12000

-- 19)	Selecione apenas os clientes do sexo masculino ou com a renda maior que 12000

SELECT * FROM TB_CLIENTES WHERE SEXO = 'MASCULINO' AND RENDA > 12000

-- 20)	Selecione apenas os clientes com id 7 e id 20

SELECT * FROM TB_CLIENTES WHERE ID IN (7,20)
-- ID 20 NÃO EXISTENTE

-- 21)	Selecione apenas os clientes com id 7 e id 20

SELECT * FROM TB_CLIENTES WHERE ID = 7;
SELECT * FROM TB_CLIENTES WHERE ID = 20;
-- ID 20 NÃO EXISTENTE


-- 22)	Selecione apenas os clientes com nome começado em M

SELECT * FROM TB_CLIENTES WHERE NOME LIKE 'M%'

-- 23)	Selecione apenas os clientes com nome começado em c

SELECT * FROM TB_CLIENTES WHERE NOME LIKE 'C%'

-- 24)	Selecione apenas os clientes com que tenham a letra S no nome

SELECT * FROM TB_CLIENTES WHERE NOME LIKE '%S%'

-- 25)	Selecione apenas os clientes com que tenham a letra U no nome

SELECT * FROM TB_CLIENTES WHERE NOME LIKE '%U%'

-- 26)	Exiba a média da renda dos clientes que ganham entre 11000 e 13000 

SELECT AVG(RENDA) AS MEDIA_RENDA FROM TB_CLIENTES WHERE RENDA > 11000 AND RENDA < 13000

-- 27)	Exiba a média da renda dos clientes ganham entre 11000 e 13000 e que são do sexo feminino

SELECT AVG(RENDA) AS MEDIA_RENDA FROM TB_CLIENTES WHERE RENDA > 11000 AND RENDA < 13000 AND SEXO = 'Feminino'

-- 28)	Exiba a média da renda dos clientes que ganham entre 10000 e 12000 e que são do sexo masculino

SELECT AVG(RENDA) AS MEDIA_RENDA FROM TB_CLIENTES WHERE RENDA > 10000 AND RENDA < 12000 AND SEXO = 'Masculino'

-- 29)	Apague o registro de todas as mulheres que ganham acima de 15000.

DELETE FROM TB_CLIENTES WHERE SEXO = 'Feminino' AND RENDA > 15000

-- 30)	Apague o registro de todos os homens que ganham acima de 15000.

DELETE FROM TB_CLIENTES WHERE SEXO = 'Masculino' AND RENDA > 15000

-- 31)	Apague o registro de todos os homens ou mulheres que ganham acima de 14000.

DELETE FROM TB_CLIENTES WHERE RENDA > 14000

-- 32)	Apague o registro de todos os homens ou mulheres que ganham entre 10000 e 12000.

DELETE FROM TB_CLIENTES WHERE RENDA > 10000 AND RENDA < 12000

-- 33)	Selecione todas as pessoas que tenham o id entre 3 e 7.

SELECT * FROM TB_CLIENTES WHERE ID >= 3 AND ID <= 7

-- 34)	Selecione todos os clientes que ganham entre 11000 e 13000

SELECT * FROM TB_CLIENTES WHERE RENDA > 11000 AND ID <= 13000

-- 35)	Selecione todos os clientes que ganham entre 11000 e 13000 e que são do sexo feminino

SELECT * FROM TB_CLIENTES WHERE RENDA > 11000 AND ID <= 13000 AND SEXO = 'Feminino'

-- 36)	Selecione todos os clientes que ganham entre 10000 e 12000 e que são do sexo masculino

SELECT * FROM TB_CLIENTES WHERE RENDA > 11000 AND ID <= 13000 AND SEXO = 'Masculino'

-- 37)	Altere a renda de todas as pessoas para 10.000

UPDATE TB_CLIENTES SET RENDA = 10000

-- 38)	Altere a renda de todas as pessoas do sexo masculino para 9.000

UPDATE TB_CLIENTES SET RENDA = 9000 WHERE SEXO = 'Masculino'

-- 39)	Altere a renda de todas as pessoas do sexo feminino para 15.000

UPDATE TB_CLIENTES SET RENDA = 15000 WHERE SEXO = 'Feminino'

-- 40)	Altere a renda de todas as pessoas voltando para o valor original

-- Usando backup para retornar valores
UPDATE TB_CLIENTES SET RENDA = 10000 WHERE ID = 1;
UPDATE TB_CLIENTES SET RENDA = 12000 WHERE ID = 2;
UPDATE TB_CLIENTES SET RENDA = 10500 WHERE ID = 3;
UPDATE TB_CLIENTES SET RENDA = 13500 WHERE ID = 4;
UPDATE TB_CLIENTES SET RENDA = 16500 WHERE ID = 5;
UPDATE TB_CLIENTES SET RENDA = 10200 WHERE ID = 6;
UPDATE TB_CLIENTES SET RENDA = 17400 WHERE ID = 7;
UPDATE TB_CLIENTES SET RENDA = 15000 WHERE ID = 8;
UPDATE TB_CLIENTES SET RENDA = 13500 WHERE ID = 9;
UPDATE TB_CLIENTES SET RENDA = 12500 WHERE ID = 10;
UPDATE TB_CLIENTES SET RENDA = 10200 WHERE ID = 11;
UPDATE TB_CLIENTES SET RENDA = 12400 WHERE ID = 12;
UPDATE TB_CLIENTES SET RENDA = 15000 WHERE ID = 13;
UPDATE TB_CLIENTES SET RENDA = 13500 WHERE ID = 14;
UPDATE TB_CLIENTES SET RENDA = 11500 WHERE ID = 15;
UPDATE TB_CLIENTES SET RENDA = 15200 WHERE ID = 16;

-- 41)	Selecione todos as pessoas do sexo masculino e exiba a contagem delas

SELECT COUNT(*) AS TOTAL_MASCULINO FROM TB_CLIENTES WHERE SEXO = 'Masculino'

-- 42)	Selecione todos as pessoas do sexo feminino e exiba a soma da renda de todas.

SELECT SUM(RENDA) FROM TB_CLIENTES WHERE SEXO = 'Feminino'

-- 43)	Exiba a quantidade de clientes que ganham entre 11000 e 13000 

SELECT COUNT(*) AS TOTAL_CLIENTES FROM TB_CLIENTES WHERE RENDA > 11000 AND RENDA < 13000

-- 44)	Exiba a soma da renda de todos os clientes que ganham entre 11000 e 13000 e que são do sexo feminino

SELECT SUM(RENDA) FROM TB_CLIENTES WHERE RENDA > 11000 AND RENDA < 13000 AND SEXO = 'Feminino'

-- 45)	Exiba a soma da renda de todos os clientes que ganham entre 10000 e 12000 e que são do sexo masculino

SELECT SUM(RENDA) FROM TB_CLIENTES WHERE RENDA > 11000 AND RENDA < 12000 AND SEXO = 'Masculino'