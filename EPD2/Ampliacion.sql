/*
A1. Seleccionar toda la información contenida en la tabla EMP.
*/
SELECT *
FROM SCOTT.EMP;
/*
A2. Obtener el nombre de todos los departamentos y su localización de la tabla DEPT.
*/
SELECT DNAME, LOC
FROM SCOTT.DEPT;
/*
A3. Crear una consulta para obtener los diferentes oficios que aparecen en la tabla de EMP.
*/
SELECT DISTINCT JOB
FROM SCOTT.EMP;
/*
A4. Queremos que por cada empleado aparezca la siguiente línea: “El empleado NOMBRE se dio de alta en la empresa el FECHA.”
*/
SELECT 'El empleado '|| ENAME || ' se dio de alta en la empresa ' || HIREDATE AS RESUMEN
FROM SCOTT.EMP;