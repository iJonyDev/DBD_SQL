
/*
E1. Pruebe los cuatro operadores con la tabla REGIONS y entienda los resultados. Tiempo estimado: 10 minutos
*/
--Este código devolverá los IDs y Nombres de todas las regiones con un ID de región mayor que 1 y menor que 3, sin duplicados y ordenados por el REGION_ID.
SELECT region_id, region_name FROM HR.REGIONS WHERE region_id < 3
UNION
SELECT region_id, region_name FROM HR.REGIONS WHERE region_id > 1;

--Este código devolverá los NOMBRE e IDs de todas las regiones con un ID de región mayor que 1 y menor que 3, incluyendo duplicados
SELECT region_name FROM HR.REGIONS WHERE region_id < 3
UNION ALL
SELECT region_name FROM HR.REGIONS WHERE region_id > 1;

--Este código devolverá solo los nombres de las regiones que tienen un ID de región mayor que 1 y menor que 3.
SELECT region_name FROM HR.REGIONS WHERE region_id < 3
INTERSECT
SELECT region_name FROM HR.REGIONS WHERE region_id > 1;

--Este código devolverá los NOMBRE e IDs de las regiones que tienen un ID de región menor que 3 y no mayor que 1.
SELECT region_name, region_id FROM HR.REGIONS WHERE region_id < 3
MINUS
SELECT region_name, region_id FROM HR.REGIONS WHERE region_id > 1;


/*
E2. Implemente una consulta que devuelva el número de empleados existentes en cada uno de estos tres departamentos: 20, 30 y 40. 
*/


SELECT department_id, COUNT(*)
FROM HR.employees
WHERE department_id IN (20,30,40)
GROUP BY department_id;

-- Implemente la misma consulta utilizando una consulta compuesta.

SELECT department_id, COUNT(*) as count
FROM HR.employees
WHERE department_id = 20
GROUP BY department_id
	UNION ALL
SELECT department_id, COUNT(*) as count
FROM HR.employees
WHERE department_id = 30
GROUP BY department_id
	UNION ALL
SELECT department_id, COUNT(*) as count
FROM HR.employees
WHERE department_id = 40
GROUP BY department_id;

/*
E3. Encuentre el identificador de aquellos jefes que dirijan a empleados en los departamentos 20 y 30, excluyendo aquellos jefes que además tengan empleados en el departamento 40. Utilice una composición de consultas.
*/

SELECT manager_id   
    FROM HR.employees 
    WHERE department_id = 20
		INTERSECT
SELECT manager_id 
    FROM HR.employees 
    WHERE department_id = 30
		MINUS
SELECT manager_id 
    FROM HR.employees 
    WHERE department_id = 40;

/*Primero, selecciona los manager_id de los empleados en el departamento 20.
*/
/*Luego, intersecta esos resultados con los manager_id de los empleados en el departamento 30. Esto da como resultado los manager_id de los jefes que tienen empleados en ambos departamentos.
*/
/*Finalmente, resta los manager_id de los jefes que tienen empleados en el departamento 40. Esto excluye a los jefes que tienen empleados en el departamento 40.*/


/*
E4. En una consulta compuesta muestra la suma de salarios por departamentos, por jefes y la suma total de todos los empleados
*/

SELECT DEPARTMENT_ID, TO_NUMBER(NULL),SUM(SALARY)
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID
	UNION

SELECT TO_NUMBER(NULL),MANAGER_ID, SUM(SALARY)
FROM HR.EMPLOYEES
GROUP BY MANAGER_ID

	UNION ALL

SELECT TO_NUMBER(NULL),TO_NUMBER(NULL),SUM(SALARY)
FROM HR.EMPLOYEES;


/*
P1. Cada empleado tiene su empleo actual, JOB_ID, en la tabla EMPLOYEES. Aquellos trabajos que habían desarrollado
previamente están registrados en la tabla JOB_HISTORY. Implemente una consulta que devuelva el identificador y el apellido de
aquellos empleados que nunca han cambiado de trabajo.
*/

SELECT EMPLOYEE_ID, LAST_NAME
FROM HR.EMPLOYEES
	MINUS
SELECT e.EMPLOYEE_ID, e.LAST_NAME
FROM HR.JOB_HISTORY j, HR.EMPLOYEES e
WHERE e.EMPLOYEE_ID=j.EMPLOYEE_ID;

/*
P2. ¿Qué empleados fueron reclutados para un trabajo, cambiaron posteriormente de ocupación pero actualmente han vuelto a
desempeñar su trabajo original? Se debe mostrar el nombre de los empleados y el nombre del empleo, estando este último
almacenado en la tabla JOBS.
*/

SELECT e.last_name, j.job_title
FROM HR.employees e, HR.jobs j
WHERE e.job_id=j.job_id

	INTERSECT

SELECT e.last_name, j.job_title
FROM HR.employees e, HR.jobs j, HR.job_history jh
WHERE e.job_id=j.job_id AND e.employee_id=jh.employee_id;

/*
P5. Obtener el id de las salas donde se toquen obras de dinámica distinta a 'Forte' (use la cláusula MINUS).
*/


SELECT idsala
FROM sala

	MINUS

SELECT DISTINCT idsala
FROM concierto c, obra o, se_interpreta si
WHERE o.codo=si.codo AND o.dni=si.dni AND si.nombre=c.nombre
	AND si.fecha=c.fecha AND si.hora=c.hora
	AND UPPER(dinamica) LIKE 'FORTE';