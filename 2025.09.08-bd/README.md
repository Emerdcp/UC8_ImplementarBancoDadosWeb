# Inserindo um Auto Incremente para uma tabela.

Para Adicionar um chave estrangeira e relacionamento.

## Adicionar chave primaria

```sql
ALTER TABLE CURSOS ADD COLUMN ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY FIRST 
```

## Relacionado colaboradores e cursos(exemplo de tabela de matrículos)

```sql
CREATE TABLE MATRICULAS(
    ID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    COLABORADOR_ID INT,
    CURSO_ID INT,
    DATA_MATRICULA DATE,
    FOREIGN KEY (COLABORADOR_ID) REFERENCES COLABORADORES(ID),
    FOREIGN KEY (CURSO_ID) REFERENCES CURSOS(ID)
)DEFAULT CHARSET = utf8;
```

## Adicionando mais colaboradores

```sql
INSERT INTO COLABORADORES (NOME, NASCIMENTO, SEXO, PESO, ALTURA, NACIONALIDADE)
VALUES
('Carlos Silva', '1988-07-12', 'M', 82.0, 1.80, 'Brasil'),
('Fernanda Souza', '1992-03-25', 'F', 65.5, 1.68, 'Brasil'),
('João Pedro', '1985-11-30', 'M', 90.2, 1.85, 'Portugal'),
('Patricia Lima', '1990-09-17', 'F', 58.3, 1.62, 'Brasil'),
('Juliana Costa', '1997-01-22', 'F', 62.1, 1.70, 'Brasil'),
('Marcos Paulo', '1983-06-14', 'M', 85.7, 1.78, 'Brasil'),
('Aline Torres', '1995-10-05', 'F', 59.9, 1.66, 'Argentina'),
('Eduardo Ramos', '2000-12-19', 'M', 73.4, 1.72, 'Brasil'),
('Bianca Martins', '1993-04-03', 'F', 60.0, 1.64, 'Brasil');
```

## Adicionando 

```sql
INSERT INTO matriculas (colaborador_id, curso_id, data_matricula)
VALUES
(1, 1, '2025-09-03'),
(2, 2, '2025-09-03'),
(3, 3, '2025-09-03'),
(4, 1, '2025-09-03'),
(5, 4, '2025-09-03'),
(6, 5, '2025-09-03'),
(7, 2, '2025-09-03'),
(8, 3, '2025-09-03'),
(9, 4, '2025-09-03'),
(10, 5, '2025-09-03'),
(11, 1, '2025-09-03'),
(12, 2, '2025-09-03');
```




# Exercícios

Exercício 1 – BANCO DE DADOS LIVRARIA
1. Crie um banco de dados chamado LIVRARIA. ok
2. Exiba todos os bancos de dados existentes e verifique se o seu banco foi criado. ok
3. Torne o banco LIVRARIA ativo. ok
4. Crie uma tabela chamada t_livro com os campos: ok
○ id_livro (inteiro, chave primária, auto incremento)
○ titulo (texto, até 150 caracteres)
○ autor (texto, até 100 caracteres)
○ genero (texto, até 50 caracteres)
○ preco (número decimal com duas casas)
○ ano_publicacao (inteiro)
5. Veja a descrição da tabela criada. OK

6. Cadastre pelo menos 3 livros na tabela.
7. Exiba todos os registros cadastrados.
8. Atualize o preço de um dos livros.
9. Exiba novamente os registros para verificar a alteração.
10. Exporte o banco de dados LIVRARIA em formato .sql pelo phpMyAdmin ou
Workbench.
11. Envie o arquivo exportado para o professor pelo Microsoft Teams

```sql
CREATE DATABASE LIVRARIA
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
```

```sql
CREATE TABLE T_LIVRO(
    ID_LIVRO INT AUTO_INCREMENT PRIMARY KEY,
    TITULO VARCHAR(150),
    AUTOR VARCHAR(100),
    GENERO VARCHAR(50),
    PRECO FLOAT,
    ANO_PUBLICACAO INT
) DEFAULT CHARSET = utf8;
```

```sql
INSERT INTO T_LIVRO (TITULO, AUTOR, GENERO, PRECO, ANO_PUBLICACAO)
VALUE 
('Harry Potter E As Relíquias Da Morte', 'J. K. Rowling', 'Romance de fantasia', 49.90, 2010),
('Harry Potter E A Ordem Da Fênix', 'J. K. Rowling', 'Romance de fantasia', 39.90, 2007),
('Harry Potter E O Cálice De Fogo', 'J. K. Rowling', 'Romance de fantasia', 29.90, 2005);
```


Exercício 2 – BANCO DE DADOS ESCOLA
1. Crie um banco de dados chamado ESCOLA. OK
2. Exiba todos os bancos de dados existentes. OK
3. Torne o banco ESCOLA ativo. OK 
4. Crie uma tabela chamada t_aluno com os campos: OK
○ id_aluno (inteiro, chave primária, auto incremento) OK
○ nome (texto, até 100 caracteres) OK
○ idade (inteiro)OK
○ cidade (texto, até 100 caracteres)OK
○ serie (texto, até 20 caracteres)OK
5. Veja a descrição da tabela criada. OK 
6. Cadastre pelo menos 3 alunos na tabela. OK
7. Exiba todos os registros cadastrados. OK
8. Atualize a cidade de um dos alunos. OK
9. Exiba novamente os registros para confirmar a alteração. OK
10. Exporte o banco de dados ESCOLA em formato .sql. OK
11. Envie o arquivo exportado para o professor pelo Microsoft Teams OK


```sql
CREATE DATABASE ESCOLA
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
```

```sql
CREATE TABLE T_ALUNO(
    ID_ALUNO INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(100),
    IDADE INT,
    CIDADE VARCHAR(100),
    SERIE VARCHAR(20)
) DEFAULT CHARSET = utf8;
```

```sql
INSERT INTO T_ALUNO (NOME, IDADE, CIDADE, SERIE)
VALUE 
('Emerson de Carvalho', 14, 'Americana', '8º Ano'),
('Eduardo Fernandes de Carvalho', 11, 'Americana', '5º Ano'),
('Kadu Fernandes de Carvalgo', 8, 'Americana', '3º Ano');
```



Exercício 3 – BANCO DE DADOS CINEMA ok
1. Crie um banco de dados chamado CINEMA.OK
2. Exiba todos os bancos de dados existentes.OK
3. Torne o banco CINEMA ativo.OK
4. Crie uma tabela chamada t_filme com os campos:OK
○ id_filme (inteiro, chave primária, auto incremento)OK
○ titulo (texto, até 150 caracteres)OK
○ diretor (texto, até 100 caracteres)OK
○ genero (texto, até 50 caracteres)OK
○ duracao (inteiro, em minutos)OK
○ classificacao (texto, até 10 caracteres)OK
5. Veja a descrição da tabela criada.
6. Cadastre pelo menos 3 filmes na tabela.
7. Exiba todos os registros cadastrados.
8. Atualize a duração de um dos filmes.
9. Exiba novamente os registros para confirmar a alteração.
10. Exporte o banco de dados CINEMA em formato .sql.
11. Envie o arquivo exportado para o professor pelo Microsoft Teams



```sql
CREATE DATABASE CINEMA
DEFAULT CHARACTER SET utf8
DEFAULT COLLATE utf8_general_ci;
```

```sql
CREATE TABLE T_FILMES(
    ID_FILME INT AUTO_INCREMENT PRIMARY KEY,
    TITULO VARCHAR(150),
    DIRETOR VARCHAR(100),
    GENERO VARCHAR(50),
    DURACAO FLOAT,
    CLASSIFICACAO VARCHAR(10)
) DEFAULT CHARSET = utf8;
```

```sql
INSERT INTO T_FILMES (TITULO, DIRETOR, GENERO, DURACAO, CLASSIFICACAO)
VALUE 
('Harry Potter e as Relíquias da Morte – Parte 1', 'David Yates', 'Drama/Aventura/Ação/Fantasia', 146,'PG-13'),
('Harry Potter e a Ordem da Fênix', 'David Yates', 'Drama/Aventura/Ação/Fantasia', 138,'PG-13'),
('Harry Potter e o Cálice de Fogo', 'Mike Newell', 'Fantasia', 156,'PG-13')

```
