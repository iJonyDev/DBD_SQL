--Obtener todos los genes de un organismo
  select g.goid, g.galias, o.nomc
  from gen g, tiene t, organismo o
  where g.goid = t.goid and t.codo = o.codo and o.codo = 'O-001';
--Obtener el numero de genes de cada organismo
  select o.nomc, count(g.goid) "TotalGenes"
  from organismo o, tiene t, gen g
  where o.codo = t.codo and t.goid = g.goid
  group by o.nomc;
--Obtener una lista de todos los organismos y los nombre de las proteínas que codifican sus genes
  select o.codo, o.nomc, c.proteina
  from organismo o, tiene t, gen g, secuencia s, codificadora c
  where o.codo = t.codo and t.goid = g.goid and g.goid = s.goid and s.goid = c.goid;
--Obtener organismos que tienen mas de 5 genes ""
  SELECT o.NomC
  FROM Organismo o
  WHERE (
    SELECT COUNT(g.Goid)
    FROM Tiene t, Gen g
    WHERE t.CodO = o.CodO AND t.Goid = g.Goid
) > 5;
--¿Cuáles son los nombres de los genes en el organismo ‘Drosophila Melanogaster’?
  select gn.gname
  from gname gn, tiene t, organismo o
  where gn.goid =  t.goid and t.codo = o.codo and o.nomc = 'Drosophila Melanogaster';

--¿Cuál es la secuencia más antigua registrada para cada gen?

--¿Cuántos genes están involucrados en cada ruta metabólica (Pathway)?

--¿Qué genes están regulados por un gen específico?

--¿Cuáles son los nucleótidos en una secuencia específica de un gen?

