--ENLACE: imagen del esquema HR.
https://drive.google.com/file/d/1Y8_3PAaah7mZif0CnXVWrIGJgLajMkQM/view?usp=sharing

/*
P1. A partir de la tabla COUNTRIES, calcular la media de longitud del nombre de los países (COUNTRY_NAME). La parte decimal
debe ser redondeada al entero más próximo. Tiempo estimado: 5 minutos
*/
SELECT AVG(LENGTH(country_name)) "AVG Longitud Nombre de Paises"
FROM hr.countries;
/*
P2. Muestre cuántos trabajadores pertenecen a cada departamento almacenado en la tabla EMPLOYEES. Muéstrelos ordenados
por el identificador de departamento de forma ascendente. Tiempo estimado: 5 minutos
*/
SELECT department_id, count(*)
	FROM hr.employees
		GROUP BY department_id
	ORDER BY department_id ASC;
/*
P3. Muestre el número de empleados que fueron despedidos agrupados por el año en que se marcharon de la empresa. El
resultado debe mostrarse ordenado de forma descendente en base al número de empleados de cada grupo. Se deberá mostrar el
año, el JOB_ID y el número de trabajadores despedidos. Tiempo estimado: 5 minutos
*/
SELECT 
    job_id, EXTRACT(YEAR FROM end_date) AS Year,
    COUNT(*) AS NumDespedidos
FROM 
    HR.JOB_HISTORY
GROUP BY 
    job_id, EXTRACT(YEAR FROM end_date)
ORDER BY 
    EXTRACT(YEAR FROM end_date) DESC;
/*
P4. Mostrar los días de la semana en los cuales 20 o más personas fueron contratados por la empresa. Tiempo estimado: 10
minutos
*/
SELECT TO_CHAR(hire_date,'DAY'), COUNT(*) AS Num_contratados
FROM hr.employees
GROUP BY TO_CHAR(hire_date,'DAY')
    HAVING COUNT(*) >= 20;
/*
P5. Muestre el salario medio y el número de empleados que corresponden a cada una de las categorías de trabajo (JOB_ID). Tenga
en cuenta para los cálculos sólo a aquellos trabajadores que pertenezcan a una categoría donde se gane más de 10000€ de media.
Tiempo estimado: 5 minutos
*/
SELECT job_id, AVG(salary) as Salario_Medio , COUNT(*) as Num_Empleados
FROM hr.employees
GROUP BY job_id
	HAVING AVG(salary) > 10000;







