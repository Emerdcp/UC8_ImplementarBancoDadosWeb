# Lista de Exercícios SQL com Respostas

## Parte 1: Questões Simples (SELECT, WHERE, LIKE, ORDER BY)

1. Liste o nome completo e o id_aluno de todos os estudantes cadastrados, ordenando pelo nome do aluno.
```sql
SELECT nome, id_aluno
FROM tb_alunos
ORDER BY nome;
```

2. Quais são as siglas e os nome_curso de todos os cursos que possuem exatamente 1200 horas de carga_horaria?
```sql
SELECT sigla_curso, nome_curso
FROM tb_cursos
WHERE carga_horaria = 1200;
```

3. Exiba o nome e a especialidade de todos os docentes que são especializados em 'Programação'.
```sql
SELECT nome, especialidade
FROM tb_docentes
WHERE especialidade = 'Programação';
```

4. Liste o id_sala, numero_sala e capacidade de todas as salas que são do tipo 'TEORICA'.
```sql
SELECT id_sala, numero_sala, capacidade
FROM tb_salas
WHERE tipo = 'TEORICA';
```

5. Quais são as sigla_turma que ocorrem no turno 'TARDE'?
```sql
SELECT sigla_turma
FROM tb_turmas
WHERE turno = 'TARDE';
```

6. Encontre o id_aluno e o nome do aluno cujo ID é 149.
```sql
SELECT id_aluno, nome
FROM tb_alunos
WHERE id_aluno = 149;
```

7. Liste o nome_sala e o numero_sala de todas as salas que têm uma capacidade máxima de 30.
```sql
SELECT nome_sala, numero_sala
FROM tb_salas
WHERE capacidade = 30;
```

8. Quais cursos (apenas a sigla) têm 1000 horas de carga horária?
```sql
SELECT sigla_curso
FROM tb_cursos
WHERE carga_horaria = 1000;
```

9. Liste o nome dos alunos cujo nome começa com a letra 'W'.
```sql
SELECT nome
FROM tb_alunos
WHERE nome LIKE 'W%';
```

10. Exiba o nome e a especialidade do docente com id_docente igual a 7.
```sql
SELECT nome, especialidade
FROM tb_docentes
WHERE id_docente = 7;
```

11. Liste todas as siglas de turmas que têm o turno 'NOITE' e cujo id_curso_fk é 2 (TII).
```sql
SELECT sigla_turma
FROM tb_turmas
WHERE turno = 'NOITE' AND id_curso_fk = 2;
```

12. Liste o nome de todos os alunos que nasceram exatamente em 12 de março de 2005.
```sql
SELECT nome
FROM tb_alunos
WHERE data_nascimento = '2005-03-12';
```

13. Quais turmas (siglas) foram alocadas no Lab de Hardware?
```sql
SELECT tb_turmas.sigla_turma
FROM tb_turmas
INNER JOIN tb_salas
  ON tb_turmas.id_sala_fk = tb_salas.id_sala
WHERE tb_salas.nome_sala = 'Laboratório de Hardware';
```

14. Liste o id_curso e o nome_curso de todos os cursos, exceto aqueles com carga_horaria menor ou igual a 800 horas.
```sql
SELECT id_curso, nome_curso
FROM tb_cursos
WHERE carga_horaria > 800;
```

15. Liste os nomes de todos os docentes que não são especializados em 'Enfermagem'.
```sql
SELECT nome
FROM tb_docentes
WHERE especialidade <> 'Enfermagem';
```

## Parte 2: Questões Moderadas (JOINs Simples)

16. Liste o nome e o id_aluno de todos os alunos que estão matriculados na turma com id_turma_fk igual a 17 (ENF01).
```sql
SELECT tb_alunos.nome, tb_alunos.id_aluno
FROM tb_alunos
INNER JOIN tb_aluno_turma
  ON tb_alunos.id_aluno = tb_aluno_turma.id_aluno_fk
WHERE tb_aluno_turma.id_turma_fk = 17;
```

17. Qual é o nome do curso correspondente ao id_curso = 10?
```sql
SELECT nome_curso
FROM tb_cursos
WHERE id_curso = 10;
```

18. Liste o nome dos docentes que estão qualificados para o curso cujo id_curso_fk é 19.
```sql
SELECT tb_docentes.nome
FROM tb_docentes
INNER JOIN tb_docente_curso
  ON tb_docentes.id_docente = tb_docente_curso.id_docente_fk
WHERE tb_docente_curso.id_curso_fk = 19;
```

19. Encontre a sigla_turma e o turno de todas as turmas que estão alocadas na sala com id_sala_fk igual a 11 (Laboratório de Enfermagem).
```sql
SELECT sigla_turma, turno
FROM tb_turmas
WHERE id_sala_fk = 11;
```

20. Liste a sigla do curso e o nome_curso para todas as turmas cujo id_turma esteja entre 56 e 60.
```sql
SELECT tb_cursos.sigla_curso, tb_cursos.nome_curso
FROM tb_turmas
INNER JOIN tb_cursos
  ON tb_turmas.id_curso_fk = tb_cursos.id_curso
WHERE tb_turmas.id_turma BETWEEN 56 AND 60;
```

21. Liste o nome_sala de todas as salas que são utilizadas por turmas do turno 'MANHA'.
```sql
SELECT DISTINCT tb_salas.nome_sala
FROM tb_salas
INNER JOIN tb_turmas
  ON tb_salas.id_sala = tb_turmas.id_sala_fk
WHERE tb_turmas.turno = 'MANHA';
```

22. Liste o id_docente e o nome dos professores que estão qualificados para o curso de 'Redes de Computadores' (id_curso = 5).
```sql
SELECT tb_docentes.id_docente, tb_docentes.nome
FROM tb_docentes
INNER JOIN tb_docente_curso
  ON tb_docentes.id_docente = tb_docente_curso.id_docente_fk
WHERE tb_docente_curso.id_curso_fk = 5;
```

23. Liste o nome dos alunos que estão matriculados na turma de sigla 'SGT04'.
```sql
SELECT tb_alunos.nome
FROM tb_alunos
INNER JOIN tb_aluno_turma
  ON tb_alunos.id_aluno = tb_aluno_turma.id_aluno_fk
INNER JOIN tb_turmas
  ON tb_aluno_turma.id_turma_fk = tb_turmas.id_turma
WHERE tb_turmas.sigla_turma = 'SGT04';
```

24. Encontre o nome_curso de todas as turmas que estão alocadas na sala 'Laboratório de Hardware'.
```sql
SELECT DISTINCT tb_cursos.nome_curso
FROM tb_cursos
INNER JOIN tb_turmas
  ON tb_cursos.id_curso = tb_turmas.id_curso_fk
INNER JOIN tb_salas
  ON tb_turmas.id_sala_fk = tb_salas.id_sala
WHERE tb_salas.nome_sala = 'Laboratório de Hardware';
```

25. Liste o id_aluno_turma e o id_aluno_fk para todas as matrículas no ADM08.
```sql
SELECT tb_aluno_turma.id_aluno_turma, tb_aluno_turma.id_aluno_fk
FROM tb_aluno_turma
INNER JOIN tb_turmas
  ON tb_aluno_turma.id_turma_fk = tb_turmas.id_turma
WHERE tb_turmas.sigla_turma = 'ADM08';
```

## Parte 3: Questões Complexas (Multi-JOINs e Filtros Específicos)

26. Liste o nome do aluno e a sigla_turma para todos os alunos que estão matriculados na turma TI25.
```sql
SELECT tb_alunos.nome, tb_turmas.sigla_turma
FROM tb_alunos
INNER JOIN tb_aluno_turma
  ON tb_alunos.id_aluno = tb_aluno_turma.id_aluno_fk
INNER JOIN tb_turmas
  ON tb_aluno_turma.id_turma_fk = tb_turmas.id_turma
WHERE tb_turmas.sigla_turma = 'TI25';
```

27. Encontre o nome do docente e o nome_curso para as associações onde o docente tem id_docente = 3.
```sql
SELECT tb_docentes.nome, tb_cursos.nome_curso
FROM tb_docentes
INNER JOIN tb_docente_curso
  ON tb_docentes.id_docente = tb_docente_curso.id_docente_fk
INNER JOIN tb_cursos
  ON tb_docente_curso.id_curso_fk = tb_cursos.id_curso
WHERE tb_docentes.id_docente = 3;
```

28. Liste a sigla_turma e o nome_sala para as turmas do curso 'Administração' que estão alocadas em salas com capacidade igual a 40.
```sql
SELECT tb_turmas.sigla_turma, tb_salas.nome_sala
FROM tb_turmas
INNER JOIN tb_cursos
  ON tb_turmas.id_curso_fk = tb_cursos.id_curso
INNER JOIN tb_salas
  ON tb_turmas.id_sala_fk = tb_salas.id_sala
WHERE tb_cursos.nome_curso = 'Administração' AND tb_salas.capacidade = 40;
```

29. Liste o nome de todos os alunos que estão matriculados na turma TI26 OU na turma TI30.
```sql
SELECT tb_alunos.nome
FROM tb_alunos
INNER JOIN tb_aluno_turma
  ON tb_alunos.id_aluno = tb_aluno_turma.id_aluno_fk
INNER JOIN tb_turmas
  ON tb_aluno_turma.id_turma_fk = tb_turmas.id_turma
WHERE tb_turmas.sigla_turma IN ('TI26', 'TI30');
```

30. Liste os nomes de todas as salas que são do tipo 'LABORATORIO' E que possuem uma capacidade menor que 35.
```sql
SELECT nome_sala
FROM tb_salas
WHERE tipo = 'LABORATORIO' AND capacidade < 35;
```

31. Liste o nome_curso de todos os cursos para os quais a docente 'Diana Prince' está qualificado.
```sql
SELECT tb_cursos.nome_curso
FROM tb_cursos
INNER JOIN tb_docente_curso
  ON tb_cursos.id_curso = tb_docente_curso.id_curso_fk
INNER JOIN tb_docentes
  ON tb_docente_curso.id_docente_fk = tb_docentes.id_docente
WHERE tb_docentes.nome = 'Diana Prince';
```

32. Qual é a sigla_turma e o nome_curso de todas as turmas que utilizam a sala 'Laboratório de Enfermagem'?
```sql
SELECT tb_turmas.sigla_turma, tb_cursos.nome_curso
FROM tb_turmas
INNER JOIN tb_cursos
  ON tb_turmas.id_curso_fk = tb_cursos.id_curso
INNER JOIN tb_salas
  ON tb_turmas.id_sala_fk = tb_salas.id_sala
WHERE tb_salas.nome_sala = 'Laboratório de Enfermagem';
```

33. Liste o nome dos alunos que estão matriculados na turma 'TI29'.
```sql
SELECT tb_alunos.nome
FROM tb_alunos
INNER JOIN tb_aluno_turma
  ON tb_alunos.id_aluno = tb_aluno_turma.id_aluno_fk
INNER JOIN tb_turmas
  ON tb_aluno_turma.id_turma_fk = tb_turmas.id_turma
WHERE tb_turmas.sigla_turma = 'TI29';
```

34. Liste o nome do docente e a sigla do curso para as qualificações do docente com id_docente_fk = 5.
```sql
SELECT tb_docentes.nome, tb_cursos.sigla_curso
FROM tb_docentes
INNER JOIN tb_docente_curso
  ON tb_docentes.id_docente = tb_docente_curso.id_docente_fk
INNER JOIN tb_cursos
  ON tb_docente_curso.id_curso_fk = tb_cursos.id_curso
WHERE tb_docente_curso.id_docente_fk = 5;
```

35. Liste a sigla_turma e o nome_curso para as turmas que pertencem aos cursos TI (id_curso = 1) OU TII.
```sql
SELECT tb_turmas.sigla_turma, tb_cursos.nome_curso
FROM tb_turmas
INNER JOIN tb_cursos
  ON tb_turmas.id_curso_fk = tb_cursos.id_curso
WHERE tb_cursos.id_curso IN (1, 2);
```

36. Liste o nome_curso de todos os cursos, excluindo 'Técnico em Informática' (id_curso = 1).
```sql
SELECT nome_curso
FROM tb_cursos
WHERE id_curso <> 1;
```

37. Encontre o nome_sala e a sigla_turma para as turmas do turno 'NOITE' que estão alocadas em salas de tipo 'TEORICA'.
```sql
SELECT tb_salas.nome_sala, tb_turmas.sigla_turma
FROM tb_turmas
INNER JOIN tb_salas
  ON tb_t
```

38. Liste o nome do aluno e o id_turma_fk para as matrículas com id_aluno_fk igual a 40 (The Narrator).
```sql
SELECT tb_alunos.nome, tb_aluno_turma.id_turma_fk
FROM tb_alunos
INNER JOIN tb_aluno_turma
  ON tb_alunos.id_aluno = tb_aluno_turma.id_aluno_fk
WHERE tb_aluno_turma.id_aluno_fk = 40;
```

39. Liste a sigla_turma e o nome_curso para as turmas cujo curso tenha a carga_horaria de 800 horas.
```sql
SELECT tb_turmas.sigla_turma, tb_cursos.nome_curso
FROM tb_turmas
INNER JOIN tb_cursos
  ON tb_turmas.id_curso_fk = tb_cursos.id_curso
WHERE tb_cursos.carga_horaria = 800;
```

40. Encontre o nome e a especialidade do docente que tem o id_docente 11.
```sql
SELECT nome, especialidade
FROM tb_docentes
WHERE id_docente = 11;
```

41. Liste a sigla_turma e o nome_curso para as turmas cujo turno é 'MANHA'. (Use tb_turmas e tb_cursos).
```sql
SELECT tb_turmas.sigla_turma, tb_cursos.nome_curso
FROM tb_turmas
INNER JOIN tb_cursos
  ON tb_turmas.id_curso_fk = tb_cursos.id_curso
WHERE tb_turmas.turno = 'MANHA';
```

42. Liste o nome_sala e o numero_sala para salas com capacidade diferente de 40.
```sql
SELECT nome_sala, numero_sala
FROM tb_salas
WHERE capacidade <> 40;
```

43. Liste o nome dos alunos que estão matriculados nas turmas que utilizam a sala de id_sala = 7. (Use tb_alunos, tb_aluno_turma, tb_turmas).
```sql
SELECT tb_alunos.nome
FROM tb_alunos
INNER JOIN tb_aluno_turma
    ON tb_alunos.id_aluno = tb_aluno_turma.id_aluno_fk
INNER JOIN tb_turmas
    ON tb_aluno_turma.id_turma_fk = tb_turmas.id_turma
WHERE tb_turmas.id_sala_fk = 7;
```

44. Liste o nome_curso e a carga_horaria para cursos com carga_horaria maior que 1000 horas.
```sql
SELECT nome_curso, carga_horaria
FROM tb_cursos
WHERE carga_horaria > 1000;
```

45. Encontre a sigla_turma e o turno para as turmas cujo id_curso_fk é 8 (Enfermagem) e que estão alocadas na id_sala_fk 11.
```sql
SELECT sigla_turma, turno
FROM tb_turmas
WHERE id_curso_fk = 8 AND id_sala_fk = 11;
```

46. Liste o nome dos docentes que são especializados em 'Administração'.

```sql
SELECT nome
FROM tb_docentes
WHERE especialidade = 'Administração';
```
47. Liste o id_aluno, nome e data_nascimento para os alunos com id_aluno maior que 230.
```sql
SELECT id_aluno, nome, data_nascimento
FROM tb_alunos
WHERE id_aluno > 230;
```