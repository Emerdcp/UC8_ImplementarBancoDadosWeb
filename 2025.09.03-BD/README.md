# Inserindo no banco

## Criando tabela cursos

Para criação de tabela usar o código CREATE.

```sql
CREATE TABLE IF NOT EXISTS CURSO(
    ID AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(50),
    DESCRICAO VARCHAR(255),
    CARGA INT,
    TOTALAULAS INT,
    ANO YEAR
) DEFAULT CHARSET = utf8;
```


## Inserindo itens na tabela

Para inserir usar comando INSERT INTO.

```sql
INSERT INTO CURSOS (NOME, DESCRICAO, CARGA, TOTALAULAS, ANO)
VALUES ('MySQL Básico', 'Curso introdutório de MySQL', 40, 20, 2024),
('JavaScript Avançado', 'Curso avançado de JavaScript', 60, 30, 2023),
('Pyton para Data Science', 'Introdução ao usa de Pyton em ciência de dados', 80, 40, 2025)
```

## Para selecinonar coluna

Para selecionar algumas colunas de um tabela.

```sql
SELECT NOME, nacionalidade FROM `COLABORADORES`
```

## Usando Filtro com WHERE

Seleciona especificamente o WHERE.

```sql
SELECT * FROM COLABORADORES WHERE SEXO = 'F';
SELECT * FROM COLABORADORES WHERE PESO > 70;
SELECT * FROM COLABORADORES WHERE NACIONALIDADE = 'BRASIL' AND ALTURA >1.70;
```

## Ordenação

Para Realizar Filtro por Ordem crescente de decrescente

```sql
SELECT * FROM COLABORADORES ORDER BY NOME ASC;
SELECT * FROM COLABORADORES ORDER BY PESO DESC;
```
