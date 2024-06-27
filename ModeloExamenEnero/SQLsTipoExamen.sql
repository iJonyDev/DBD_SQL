--Obtener todos los genes de un organismo
  --Solucion 1
  select g.goid, g.galias, o.nomc
  from gen g, tiene t, organismo o
  where g.goid = t.goid and t.codo = o.codo and o.codo = 'O-001';
  --Solucion 2
  select O.codo, O.nomc, T.goid, G.gname
  from organismo O
  join tiene T on O.codo = T.codo
  join gname G on T.goid = G.goid
  where O.nomc = 'Drosophila Melanogaster';

--Obtener el numero de genes de cada organismo
  --Solucion 1
  select o.nomc, count(g.goid) "TotalGenes"
  from organismo o, tiene t, gen g
  where o.codo = t.codo and t.goid = g.goid
  group by o.nomc;
  --Solucion 2
  select O.nomc, count(T.goid) as Num_Genes
  from organismo O
  join tiene T on O.codo = T.codo
  group by O.nomc;

--Obtener una lista de todos los organismos y los nombre de las proteínas que codifican sus genes
  --Solucion 1
  select o.codo, o.nomc, c.proteina
  from organismo o, tiene t, gen g, secuencia s, codificadora c
  where o.codo = t.codo and t.goid = g.goid and g.goid = s.goid and s.goid = c.goid;
  --Solucion 2: mas eficiente
  select O.nomc, T.goid, C.proteina
  from organismo O
  join tiene T on O.codo = T.codo
  join codificadora C on T.goid = C.goid;

--Obtener organismos que tienen mas de 5 genes
  --Solucion 1
  SELECT o.NomC
  FROM Organismo o
  WHERE (
    SELECT COUNT(g.Goid)
    FROM Tiene t, Gen g
    WHERE t.CodO = o.CodO AND t.Goid = g.Goid) > 5;
  --Solucion 2
  SELECT o.NomC
  FROM Organismo o
  WHERE (
    SELECT COUNT(g.Goid)
    FROM Tiene t
    JOIN Gen g ON o.codo = t.codo AND t.goid = g.goid ) > 5;
  --Solucion 3
  SELECT o.NomC
  FROM Organismo o
  WHERE (
    SELECT COUNT(*) 
    FROM Tiene t
    WHERE o.CodO = t.CodO) > 5;

--¿Cuáles son los nombres de los genes en el organismo ‘Drosophila Melanogaster’?
--Solucion 1
  select gn.gname
  from gname gn, tiene t, organismo o
  where gn.goid =  t.goid and t.codo = o.codo and o.nomc = 'Drosophila Melanogaster';
--Solucion 2
  select G.gname
  from organismo O
  join tiene T on O.codo = T.codo
  join gname G on T.goid = G.goid
  where nomc = 'Drosophila Melanogaster';

--¿Cuál es la secuencia más antigua registrada para cada gen?
-- Muestra el resultado ordenado de forma ascendente para 'Goid'
select goid, min(fecha) as Fecha_Mas_Antigua
from secuencia
group by goid
order by goid ASC;

--¿Cuántos genes están involucrados en cada ruta metabólica (Pathway)?
--Para genes únicos por ruta metabólica
SELECT P.Nom, COUNT(DISTINCT I.Goid) AS Num_Genes
FROM Pathway P
LEFT JOIN Interviene I ON P.Nom = I.Nom
GROUP BY P.Nom;
--Para el número total de registros por ruta metabólica
select nom, count(goid) as Num_Genes
from interviene
group by nom; 

--¿Qué genes están regulados por el gen 'CTT446'?
SELECT G2.GAlias
FROM Gen G1
JOIN Regula R ON G1.Goid = R.Goid1
JOIN Gen G2 ON R.Goid2 = G2.Goid
WHERE G1.GAlias = 'CTT446';

--¿Cuáles son los nucleótidos en una secuencia específica '1' de un gen 'CG42566'?
SELECT N.Nom AS Nom_Nucleotido, S.NumS, G.GAlias
FROM Gen G
JOIN Secuencia S ON G.Goid = S.Goid
JOIN Nucleotido N ON S.Goid = N.Goid AND S.NumS = N.NumS
WHERE S.NumS = 1 AND G.GAlias = 'CG42566';

