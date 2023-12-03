--ENLACE: imagen del esquema HR.
https://drive.google.com/file/d/1Y8_3PAaah7mZif0CnXVWrIGJgLajMkQM/view?usp=sharing

/*
P1 (HR). Seleccione el apellido, salario, id de departamento, id de empleo y comisión de aquellos empleados cuyo apellido
contenga la letra ‘a’ y su salario sea mayor que el id de departamento multiplicado por 200 ó aquellos empleados cuyo id de empleo
sea ‘MK_REP’ ó ‘MK_MAN’ y su comisión no sea nula. Tiempo
*/

SELECT LAST_NAME, FIRST_NAME, 
    SALARY, 
    DEPARTMENT_ID, 
    JOB_ID, 
    COMMISSION_PCT
FROM HR.EMPLOYEES
WHERE (LAST_NAME LIKE '%a%' AND SALARY > DEPARTMENT_ID * 200)
	OR ((JOB_ID = 'MK_REP' OR JOB_ID = 'MK_MAN') 
    AND COMMISSION_PCT IS NOT NULL);
/*
P2 Implemente una consulta que acceda a la tabla JOBS y que obtenga las columnas JOB_TITLE, MIN_SALARY,
MAX_SALARY y una columna llamada VARIANCE, la cual será la diferencia entre MAX_SALARY y MIN_SALARY. Además, sólo
nos interesan aquellas filas que para el campo JOB_TITLE contengan las palabras ‘President’ ó ‘Manager’. Ordene la lista en orden
descendente basándose en la expresión VARIANCE. Si hay filas que comparten el mismo valor para la expresión VARIANCE, que
éstas sean ordenadas por el campo JOB_TITLE, en orden alfabético inverso.
*/

SELECT JOB_TITLE, MIN_SALARY, MAX_SALARY, (MAX_SALARY-MIN_SALARY) "VARIANCE"
FROM HR.JOBS
    WHERE JOB_TITLE LIKE '%President%' 
    	OR JOB_TITLE LIKE '%Manager%';
	ORDER BY VARIANCE DESC, JOB_TITLE DESC;

/*
P3 Queremos implementar una consulta reusable la cual calcule la cantidad de impuestos que ha de pagar un empleado
concreto. Tendremos que obtener, para dicho empleado, los campos: EMPLOYEE_ID, FIRST_NAME, SALARY, ANNUAL SALARY
(SALARY * 12), TAX_RATE, TAX (TAX_RATE * ANNUAL SALARY). Los campos EMPLOYEE_ID y TAX_RATE han de ser
variables de sustitución. Tenga en cuenta que se desea introducir los valores de dichas variables una sola vez.
*/
No se ha podiddo probar en LiveSQL