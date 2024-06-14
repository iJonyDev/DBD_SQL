--ENLACE: imagen del esquema HR.
https://drive.google.com/file/d/1Y8_3PAaah7mZif0CnXVWrIGJgLajMkQM/view?usp=sharing

/*
E1. Muestre en una misma consulta cuántos empleados, departamentos y categorías de trabajadores diferentes hay almacenados
en la tabla EMPLOYEES. Tiempo estimado: 5 minutos
*/
SELECT 	COUNT(DISTINCT employee_id) "Num_Empleados", 
    	COUNT( DISTINCT department_id) "Num_Departamentos", 
    	COUNT( DISTINCT job_id) "Num_Categorias_Trabajos"
FROM hr.employees;
/*
E2. Muestre el número medio de años trabajados por los programadores (IT_PROG) de la empresa. Tiempo estimado: 5 minutos
*/
SELECT 
    AVG(MONTHS_BETWEEN(SYSDATE, hire_date)/12) AS Media_Anios_Trabajados
FROM 
    HR.EMPLOYEES
WHERE 
    job_id = 'IT_PROG';
/*
E3. Calcule el total de días trabajados por todos los trabajadores. Tiempo estimado: 5 minutos
*/
SELECT SUM(SYSDATE-hire_date) "Total Dias Trabajados"
FROM hr.employees;
/*
E4. Obtenga para aquellos trabajadores pertenecientes a la categoría SA_REP, la fecha de contratación más antigua, el salario más
bajo cobrado, la fecha de contratación más reciente y el salario más alto cobrado. Tiempo estimado: 5 minutos
*/
SELECT MIN(hire_date) "Contratacion + Antigua", MIN(salary) "Salario + Bajo", MAX(hire_date) "Contratacion + Reciente", MAX(salary) "Salario + Alto"
FROM hr.employees
WHERE job_id LIKE 'SA_REP';
--METODOS de SUBCONSULTA
    -- Empleado con la fecha de contratación más antigua
    SELECT 
        first_name,
        last_name,
        hire_date AS Fecha_Contratacion_Mas_Antigua
    FROM 
        HR.EMPLOYEES
    WHERE 
        job_id = 'SA_REP' AND
        hire_date = (SELECT MIN(hire_date) FROM HR.EMPLOYEES WHERE job_id = 'SA_REP');

    -- Empleado con el salario más bajo
    SELECT 
        first_name,
        last_name,
        salary AS Salario_Mas_Bajo
    FROM 
        HR.EMPLOYEES
    WHERE 
        job_id = 'SA_REP' AND
        salary = (SELECT MIN(salary) FROM HR.EMPLOYEES WHERE job_id = 'SA_REP');

    -- Empleado con la fecha de contratación más reciente
    SELECT 
        first_name,
        last_name,
        hire_date AS Fecha_Contratacion_Mas_Reciente
    FROM 
        HR.EMPLOYEES
    WHERE 
        job_id = 'SA_REP' AND
        hire_date = (SELECT MAX(hire_date) FROM HR.EMPLOYEES WHERE job_id = 'SA_REP');

    -- Empleado con el salario más alto
    SELECT 
        first_name,
        last_name,
        salary AS Salario_Mas_Alto
    FROM 
        HR.EMPLOYEES
    WHERE 
        job_id = 'SA_REP' AND
        salary = (SELECT MAX(salary) FROM HR.EMPLOYEES WHERE job_id = 'SA_REP');
/*
E5. Obtenga el valor medio de las comisiones más altas que existen en los diferentes departamentos. Tiempo estimado: 5
minutos
*/
SELECT --Segundo: Obtenemos la media de los diferentes departamentos
    AVG(Max_Commission) AS Avg_Max_Commission
FROM 
    (
        SELECT      --Primero: Obtenemos la comisión más alta de cada departamento
            department_id, 
            MAX(commission_pct) AS Max_Commission
        FROM 
            HR.EMPLOYEES
        GROUP BY 
            department_id
    );

/*
E6. Corrija los errores de las siguientes consultas. Tiempo estimado: 5 minutos

    select end_date, count(*)
        from hr.job_history;

    select end_date, start_date, count(*)
        from hr.job_history
            group by end_date;
*/

select end_date, count(*) as EndDate_ALL
    from hr.job_history
		GROUP BY end_date;

    select end_date, start_date, count(*)
        from hr.job_history
            group by end_date, start_date;

