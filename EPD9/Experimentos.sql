
/*
E1. Pruebe los cuatro operadores con la tabla REGIONS y entienda los resultados. Tiempo estimado: 10 minutos
*/
--Este código devolverá los IDs y Nombres de todas las regiones con un ID de región mayor que 1 y menor que 3, sin duplicados y ordenados por el REGION_ID.
SELECT region_id, region_name FROM HR.REGIONS WHERE region_id < 3
UNION 		--UNE LOS RESULTADOS DE LA SENTENCIA DE ARRIBA Y LOS RESULTADOS DE LA SENTENCIA DE ABAJO, PARA ELLO HAN DE TENER EL MISMO TIPO Y MISMO NUMERO DE COLUMNAS ELEGIDAS
SELECT region_id, region_name FROM HR.REGIONS WHERE region_id > 1;

--Este código devolverá los NOMBRE e IDs de todas las regiones con un ID de región mayor que 1 y menor que 3, incluyendo duplicados
SELECT region_name FROM HR.REGIONS WHERE region_id < 3
UNION ALL
SELECT region_name FROM HR.REGIONS WHERE region_id > 1;

--Este código devolverá solo los nombres de las regiones que tienen un ID de región mayor que 1 y menor que 3.
SELECT region_name FROM HR.REGIONS WHERE region_id < 3
INTERSECT 	--UNE LOS ELEMENTOS EN COMUN DE LA CONSULTA DE ARRIBA Y LA CONSULTA DE ABAJO
SELECT region_name FROM HR.REGIONS WHERE region_id > 1;

--Este código devolverá los NOMBRE e IDs de las regiones que tienen un ID de región menor que 3 y no mayor que 1.
			--ES IMPORTANTE TENER EN CUENTA QUE EL ORDEN DE LAS CONSULTAS ES CRUCIAL CUANDO SE UTILIZA ESTE OPERADOR
SELECT region_name, region_id FROM HR.REGIONS WHERE region_id < 3
MINUS 		--DEVUELVE LOS RESULTADOS DE LA PRIMERA CONSULTA QUE NO SE ENCUENTRAN EN LA SEGUNDA CONSULTA, ES DECIR, AQUELLOS REGISTROS QUE NO COINCIDEN
SELECT region_name, region_id FROM HR.REGIONS WHERE region_id > 1;




/*
E2. Implemente una consulta que devuelva el número de empleados existentes en cada uno de estos tres departamentos: 20, 30 y 40. 
*/


SELECT department_id, COUNT(*)
FROM HR.employees
WHERE department_id IN (20,30,40)
GROUP BY department_id;

-- Implemente la misma consulta utilizando una consulta compuesta.
-- Forma 1 (Comprobado)

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

--Forma 2 (Hay que Comprobar)

SELECT DEPARTMENT_ID,COUNT(*)
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID 0 = 20
GROUP BY DEPARTMENT_ID

	UNION

SELECT DEPARTMENT_ID,COUNT(*)
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID 0 = 30
GROUP BY DEPARTMENT_ID

	UNION

SELECT DEPARTMENT_ID,COUNT(*)
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID 0 = 40
GROUP BY DEPARTMENT_ID;

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
--Forma 1 (Comprobado)
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

--Forma 2 (Hay que comprobar)
SELECT DEPARTMENT_ID,SUM(SALARY)
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID
	UNION
SELECT DEPARTMENT_ID,SUM(SALARY)
FROM HR.EMPLOYEES
WHERE  EMPLOYEE_ID IN(SELECT MANAGER_ID FROM HR.EMPLOYEES)
GROUP BY EMPLOYEE_ID
	UNION
SELECT NULL,SUM(SALARY)
FROM HR.EMPLOYEES;

