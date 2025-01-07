## Ejercicios Nivel 1

1. **¿Qué genes están presentes en organismo ‘Drosophila Melanogaster’?** Para responder a esta pregunta, podrías realizar una consulta que una las tablas Organismo y Tiene para filtrar todos los genes asociados con el código de organismo de ‘Drosophila Melanogaster’.

```sql
-- Solucion 1
SELECT TIENE.Goid
FROM ORGANISMO
JOIN TIENE ON ORGANISMO.CodO = TIENE.CodO
WHERE ORGANISMO.NomC = 'Drosophila Melanogaster';
-- Solucion 2
select O.codo, O.nomc, T.goid, G.gname
from organismo O
join tiene T on O.codo = T.codo
join gname G on T.goid = G.goid
where O.nomc = 'Drosophila Melanogaster';
```
2. **¿Cuántas secuencias distintas están asociadas con el gen ‘CG42566’?** Esta consulta requeriría seleccionar de la tabla Secuencia y contar las entradas únicas donde el Goid es ‘CG42566’.
```sql
SELECT COUNT(DISTINCT(NumS)) AS Num_Secuencias_Distintas
FROM Secuencia
JOIN Gen ON Secuencia.Goid = Gen.Goid
WHERE GAlias = 'CG42566';
``` 
3. **¿Qué organismos tienen genes que codifican para la proteína ‘PROT1’?** Necesitarías una consulta que combine las tablas Tiene, Codificadora, y Organismo para encontrar los organismos cuyos genes están asociados con la proteína ‘PROT1’.
```sql
-- JOIN Explicito
SELECT Organismo.*
FROM Organismo
JOIN Tiene ON Organismo.CodO = Tiene.CodO
JOIN Codificadora ON Tiene.Goid = Codificadora.Goid
WHERE Codificadora.Proteina = 'PROT1';
-- Usando alias para las tablas para hacer que la consulta sea más concisa
SELECT O.*
FROM Organismo O
JOIN Tiene T ON O.CodO = T.CodO
JOIN Codificadora C ON T.Goid = C.Goid
WHERE C.Proteina = 'PROT1';


-- JOIN Implicito
SELECT Organismo.*, Codificadora.Proteina
FROM Organismo, Tiene, Codificadora
WHERE Organismo.CodO = Tiene.CodO 
AND Tiene.Goid = Codificadora.Goid
AND Codificadora.Proteina = 'PROT1';
-- Usando alias para las tablas para hacer que la consulta sea más concisa
SELECT O.*, C.Proteina
FROM Organismo O, Tiene T, Codificadora C
WHERE O.CodO = T.CodO 
AND T.Goid = C.Goid
AND C.Proteina = 'PROT1';
```

4. ¿Cuál es el porcentaje de alineación entre las secuencias del gen ‘G-001’ y ‘G-002’? Podrías usar la tabla Alinean para buscar el porcentaje de alineación entre estos dos genes específicos.

```sql
SELECT Porcentaje
FROM Alinean
WHERE (Goid1 = 'G-001' AND Goid2 = 'G-002') OR (Goid1 = 'G-002' AND Goid2 = 'G-001');
--Esta consulta selecciona el campo Porcentaje de la tabla Alinean donde Goid1 es ‘G-001’ y Goid2 es ‘G-002’, o viceversa. Esto se debe a que la alineación entre dos genes es la misma independientemente del orden en que se consideren.
```

5. ¿Qué genes reguladores están involucrados en la vía metabólica de la ‘GLUCOLISIS’? Esta consulta implicaría unir las tablas Pathway, Actua, y Reguladora para identificar los genes reguladores que actúan en la vía de la ‘GLUCOLISIS’.

```sql
SELECT R.Goid
FROM reguladora R
JOIN actua A ON R.Goid = A.Goid
JOIN pathway P ON A.Nom = P.Nom
WHERE P.Nom = 'GLUCOLISIS';
```

6. ¿En qué cromosomas se encuentran las secuencias del gen ‘G-003’? Seleccionarías de la tabla Secuencia para encontrar los cromosomas asociados con todas las secuencias del gen ‘G-003’.

```sql
SELECT S.Chromo
FROM Gen G
JOIN Secuencia S ON G.Goid = S.Goid
WHERE S.Goid = 'G-003';
```

7. ¿Qué nucleótidos están en la posición 3 para todas las secuencias del gen ‘G-001’? Una consulta a la tabla Nucleotido filtrando por el Goid ‘G-001’ y la posición ‘3’ te daría esta información.

```sql
select N.nom
from nucleotido N
where N.goid = 'G-001' and N.pos = 3;
```