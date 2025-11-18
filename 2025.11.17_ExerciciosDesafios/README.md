# UC8_ImplementarBancoDadosWeb

Ótimo — montei as **consultas SQL (MySQL)** para as perguntas 2→29 com base no seu modelo de tabelas. Cada item tem a query pronta; basta rodar no seu banco (ajuste nomes de colunas se necessário).

---

# Consultas (1 → 29)

1. Conte quantos alunos nasceram em cada ano diferente, listando o ano e o total de alunos, e ordene do ano mais antigo para o mais recente.

```sql
SELECT 
    YEAR(data_nascimento) AS ano,
    COUNT(*) AS total_alunos
FROM 
    tb_alunos
GROUP BY 
    YEAR(data_nascimento)
ORDER BY 
    ano ASC;
```


2. Cursos com mais de 5 turmas — listar nome do curso e quantidade de turmas:

```sql
SELECT c.nome_curso,
       COUNT(*) AS total_turmas
FROM tb_cursos c
JOIN tb_turmas t ON t.id_curso_fk = c.id_curso
GROUP BY c.id_curso, c.nome_curso
HAVING COUNT(*) > 5;
```

3. Para cada turno (MANHA, TARDE, NOITE) — média da carga horária dos cursos oferecidos nesse turno (cada curso contado uma vez por turno):

```sql
SELECT t.turno,
       AVG(DISTINCT c.carga_horaria) AS media_carga_horaria
FROM tb_turmas t
JOIN tb_cursos c ON c.id_curso = t.id_curso_fk
GROUP BY t.turno;
```

4. Nome do docente e quantos cursos diferentes ele está qualificado — apenas docentes com 3+ cursos:

```sql
SELECT d.nome,
       COUNT(DISTINCT dc.id_curso_fk) AS qtd_cursos
FROM tb_docentes d
JOIN tb_docente_curso dc ON dc.id_docente_fk = d.id_docente
GROUP BY d.id_docente, d.nome
HAVING COUNT(DISTINCT dc.id_curso_fk) >= 3;
```

5. Sigla da turma e número total de alunos matriculados em cada turma — ordenado por mais alunos primeiro:

```sql
SELECT t.sigla_turma,
       COUNT(at.id_aluno_fk) AS total_alunos
FROM tb_turmas t
LEFT JOIN tb_aluno_turma at ON at.id_turma_fk = t.id_turma
GROUP BY t.id_turma, t.sigla_turma
ORDER BY total_alunos DESC;
```

6. Quais salas (nome_sala) têm média de capacidade usada < 38 (média da capacidade considerando alocações de turma):

```sql
SELECT s.nome_sala,
       AVG(s.capacidade) AS media_capacidade
FROM tb_salas s
JOIN tb_turmas t ON t.id_sala_fk = s.id_sala
GROUP BY s.id_sala, s.nome_sala
HAVING AVG(s.capacidade) < 38;
```

7. Nome do(s) curso(s) que possuem turmas abertas e que têm a carga horária máxima entre esses cursos:

```sql
SELECT c.nome_curso, c.carga_horaria
FROM tb_cursos c
WHERE c.carga_horaria = (
    SELECT MAX(c2.carga_horaria)
    FROM tb_cursos c2
    JOIN tb_turmas t2 ON t2.id_curso_fk = c2.id_curso
)
AND EXISTS (
    SELECT 1 FROM tb_turmas t WHERE t.id_curso_fk = c.id_curso
);
```

8. Cursos (sigla) que possuem exatamente 150 alunos matriculados no total:

```sql
SELECT c.sigla,
       COUNT(DISTINCT at.id_aluno_fk) AS total_alunos
FROM tb_cursos c
JOIN tb_turmas t ON t.id_curso_fk = c.id_curso
JOIN tb_aluno_turma at ON at.id_turma_fk = t.id_turma
GROUP BY c.id_curso, c.sigla
HAVING COUNT(DISTINCT at.id_aluno_fk) = 150;
```

9. Nome do aluno e quantas turmas diferentes ele está matriculado — apenas alunos com 4+ turmas:

```sql
SELECT a.nome,
       COUNT(DISTINCT at.id_turma_fk) AS qtd_turmas
FROM tb_alunos a
JOIN tb_aluno_turma at ON at.id_aluno_fk = a.id_aluno
GROUP BY a.id_aluno, a.nome
HAVING COUNT(DISTINCT at.id_turma_fk) >= 4;
```

10. Especialidade do docente e quantidade de docentes com essa especialidade — exibir apenas especialidades com apenas 1 docente:

```sql
SELECT d.especialidade,
       COUNT(*) AS qtd_docentes
FROM tb_docentes d
GROUP BY d.especialidade
HAVING COUNT(*) = 1;
```

11. Sala (nome e tipo) usada por turmas do turno 'MANHA' e com maior capacidade:

```sql
SELECT s.nome_sala, s.tipo, s.capacidade
FROM tb_salas s
JOIN tb_turmas t ON t.id_sala_fk = s.id_sala
WHERE t.turno = 'MANHA'
ORDER BY s.capacidade DESC
LIMIT 1;
```

12. Data de nascimento e número de alunos que nasceram nessa data — apenas datas com pelo menos 3 alunos:

```sql
SELECT a.data_nascimento,
       COUNT(*) AS total_alunos
FROM tb_alunos a
GROUP BY a.data_nascimento
HAVING COUNT(*) >= 3;
```

13. Total de carga horária oferecida para cada sigla de curso (somando carga por turmas alocadas ao curso):

```sql
SELECT c.sigla,
       SUM(c.carga_horaria) AS carga_total_oferecida
FROM tb_cursos c
JOIN tb_turmas t ON t.id_curso_fk = c.id_curso
GROUP BY c.id_curso, c.sigla;
```

14. ID da sala e número total de turmas alocadas nela — ignorar salas com menos de 5 turmas:

```sql
SELECT t.id_sala_fk AS id_sala,
       COUNT(*) AS total_turmas
FROM tb_turmas t
GROUP BY t.id_sala_fk
HAVING COUNT(*) >= 5;
```

15. ID da turma que possui o menor número de alunos matriculados:

```sql
SELECT t.id_turma
FROM tb_turmas t
LEFT JOIN tb_aluno_turma at ON at.id_turma_fk = t.id_turma
GROUP BY t.id_turma
ORDER BY COUNT(at.id_aluno_fk) ASC
LIMIT 1;
```

16. Nome do curso e quantidade de turmas do turno 'TARDE' associadas a ele:

```sql
SELECT c.nome_curso,
       COUNT(*) AS qtd_turmas_tarde
FROM tb_cursos c
JOIN tb_turmas t ON t.id_curso_fk = c.id_curso
WHERE t.turno = 'TARDE'
GROUP BY c.id_curso, c.nome_curso;
```

17. Nome do docente e nome do curso que ele é qualificado — apenas se o curso tiver carga_horaria = 800:

```sql
SELECT d.nome AS nome_docente,
       c.nome_curso
FROM tb_docentes d
JOIN tb_docente_curso dc ON dc.id_docente_fk = d.id_docente
JOIN tb_cursos c ON c.id_curso = dc.id_curso_fk
WHERE c.carga_horaria = 800;
```

18. Nome do curso e número de turmas que iniciaram em '2024-02-01':

```sql
SELECT c.nome_curso,
       COUNT(*) AS qtd_turmas_inicio
FROM tb_cursos c
JOIN tb_turmas t ON t.id_curso_fk = c.id_curso
WHERE DATE(t.data_inicio) = '2024-02-01'
GROUP BY c.id_curso, c.nome_curso;
```

19. Siglas das turmas que têm alunos cujo nome começa com 'A' e que possuem mais de 3 alunos com esse critério:

```sql
SELECT t.sigla_turma,
       COUNT(*) AS qtd_alunos_A
FROM tb_turmas t
JOIN tb_aluno_turma at ON at.id_turma_fk = t.id_turma
JOIN tb_alunos a ON a.id_aluno = at.id_aluno_fk
WHERE a.nome LIKE 'A%'
GROUP BY t.id_turma, t.sigla_turma
HAVING COUNT(*) > 3;
```

20. Nome do aluno e quantos cursos diferentes ele está estudando atualmente (baseado nas turmas em que está matriculado):

```sql
SELECT a.nome,
       COUNT(DISTINCT t.id_curso_fk) AS qtd_cursos_diferentes
FROM tb_alunos a
JOIN tb_aluno_turma at ON at.id_aluno_fk = a.id_aluno
JOIN tb_turmas t ON t.id_turma = at.id_turma_fk
GROUP BY a.id_aluno, a.nome;
```

21. Para cada tipo de sala (TEORICA, LABORATORIO) — capacidade total combinada:

```sql
SELECT s.tipo,
       SUM(s.capacidade) AS capacidade_total
FROM tb_salas s
GROUP BY s.tipo;
```

22. Nome do curso e quantos alunos no total estão matriculados em turmas desse curso — apenas cursos com > 80 alunos:

```sql
SELECT c.nome_curso,
       COUNT(DISTINCT at.id_aluno_fk) AS total_alunos
FROM tb_cursos c
JOIN tb_turmas t ON t.id_curso_fk = c.id_curso
JOIN tb_aluno_turma at ON at.id_turma_fk = t.id_turma
GROUP BY c.id_curso, c.nome_curso
HAVING COUNT(DISTINCT at.id_aluno_fk) > 80;
```

23. ID da turma e data de início para todas as turmas que possuem exatamente 15 matrículas:

```sql
SELECT t.id_turma,
       t.data_inicio
FROM tb_turmas t
JOIN (
    SELECT at.id_turma_fk
    FROM tb_aluno_turma at
    GROUP BY at.id_turma_fk
    HAVING COUNT(*) = 15
) x ON x.id_turma_fk = t.id_turma;
```

24. Nome da sala e quantidade de turmas alocadas nela — apenas para salas do tipo 'LABORATORIO':

```sql
SELECT s.nome_sala,
       COUNT(t.id_turma) AS total_turmas
FROM tb_salas s
JOIN tb_turmas t ON t.id_sala_fk = s.id_sala
WHERE s.tipo = 'LABORATORIO'
GROUP BY s.id_sala, s.nome_sala;
```

25. Docentes (nome) qualificados para cursos cuja soma das cargas horárias (dos cursos que cada docente é qualificado) seja > 2500:

```sql
SELECT d.nome,
       SUM(c.carga_horaria) AS soma_cargas
FROM tb_docentes d
JOIN tb_docente_curso dc ON dc.id_docente_fk = d.id_docente
JOIN tb_cursos c ON c.id_curso = dc.id_curso_fk
GROUP BY d.id_docente, d.nome
HAVING SUM(c.carga_horaria) > 2500;
```

26. Sigla da turma e carga horária do curso correspondente — para todas as turmas do turno 'TARDE':

```sql
SELECT t.sigla_turma,
       c.carga_horaria
FROM tb_turmas t
JOIN tb_cursos c ON c.id_curso = t.id_curso_fk
WHERE t.turno = 'TARDE';
```

27. Nome do aluno e a média da carga horária dos cursos em que ele está matriculado:

```sql
SELECT a.nome,
       AVG(c.carga_horaria) AS media_carga_horaria
FROM tb_alunos a
JOIN tb_aluno_turma at ON at.id_aluno_fk = a.id_aluno
JOIN tb_turmas t ON t.id_turma = at.id_turma_fk
JOIN tb_cursos c ON c.id_curso = t.id_curso_fk
GROUP BY a.id_aluno, a.nome;
```

28. Nome do curso e número de alunos que nasceram em dezembro e estão matriculados em alguma turma desse curso:

```sql
SELECT c.nome_curso,
       COUNT(DISTINCT a.id_aluno) AS total_dezembro
FROM tb_cursos c
JOIN tb_turmas t ON t.id_curso_fk = c.id_curso
JOIN tb_aluno_turma at ON at.id_turma_fk = t.id_turma
JOIN tb_alunos a ON a.id_aluno = at.id_aluno_fk
WHERE MONTH(a.data_nascimento) = 12
GROUP BY c.id_curso, c.nome_curso;
```

29. Nome do curso que tem turmas alocadas na sala 'Sala Convencional' e cuja carga horária média (dessas turmas) = 1000 horas:

```sql
SELECT c.nome_curso,
       AVG(c.carga_horaria) AS media_carga
FROM tb_cursos c
JOIN tb_turmas t ON t.id_curso_fk = c.id_curso
JOIN tb_salas s ON s.id_sala = t.id_sala_fk
WHERE s.nome_sala = 'Sala Convencional'
GROUP BY c.id_curso, c.nome_curso
HAVING AVG(c.carga_horaria) = 1000;
```

---

Se quiser, eu já:

* **rodo consultas de teste** se você colar alguns dados de exemplo (posso gerar `INSERT`s),
* **ajusto para PostgreSQL** (trocar `YEAR()`/`MONTH()` por `EXTRACT(YEAR FROM ...)`),
* ou **converto** para outra variação SQL.

Quer que eu já gere alguns `INSERT` de teste para validar as queries?
