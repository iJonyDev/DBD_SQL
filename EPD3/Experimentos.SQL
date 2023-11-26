/*E1. Obtenga el nombre y el salario de aquellos empleados que ganen más de 5000 dólares. Tiempo estimado: 5 minutos
*/

SELECT  FIRST_NAME, 
        SALARY
FROM HR.EMPLOYEES
WHERE SALARY > 5000;

/*E2. Obtenga el id de empleado y el puesto asignado a aquellos empleados cuyo sueldo sea diferente al identificador de
departamento. Si no encuentra ninguno, pruebe a sumar 4000 dólares a ese identificador. Pruebe los dos operadores diferentes
que hay para las desigualdades. Tiempo estimado: 5 minutos*/

SELECT  DEPARTMENT_ID+4000, 
        EMPLOYEE_ID, 
        JOB_ID, 
        SALARY
FROM HR.EMPLOYEES
WHERE SALARY != DEPARTMENT_ID;

SELECT  DEPARTMENT_ID+4000, 
        EMPLOYEE_ID, 
        JOB_ID, 
        SALARY
FROM HR.EMPLOYEES
WHERE SALARY NOT LIKE DEPARTMENT_ID;


/*E3. Obtenga el apellido de aquellos empleados cuyo apellido sea menor, en orden alfabético, que el apellido ‘King’. Tiempo
estimado: 5 minutos*/

SELECT LAST_NAME
FROM HR.EMPLOYEES
WHERE LAST_NAME < 'King';

/*E4. Queremos todos los datos de aquellos empleados que se dieron de alta en la empresa después del 1 de Enero del año 2000.
Tiempo estimado: 5 minutos*/

SELECT *
FROM HR.EMPLOYEES
WHERE HIRE_DATE > '01-JAN-2000';

/*E5. Obtener el nombre de pila y la fecha de alta de aquellos empleados que se dieron de alta en la empresa entre el 24 de julio de
1994 y el 7 de Junio de 1996. Tiempo estimado: 5 minutos8?*/

SELECT  FIRST_NAME || ' ' || LAST_NAME "NOMBRE DE PILA", 
        HIRE_DATE
FROM HR.EMPLOYEES
WHERE HIRE_DATE >= '24-JUL-1994'
    AND HIRE_DATE <= '7-JUN-1996';

/*E6. Escriba una sentencia equivalente a la siguiente. Compruebe que dan el mismo resultado.
select last_name from employees
where last_name=’King' OR last_name='Garbharran' OR last_name= 'Ramklass';
. Tiempo estimado: 5 minutos*/

select last_name from HR.employees
WHERE LAST_NAME IN ('King','Garbharran','Ramklass');

/*E7. Seleccione aquellos países que empiecen por la letra ‘I’ y que contengan la letra ‘a’ en alguna posición. Hagan lo mismo con
aquellos países cuyo nombre tenga 5 caracteres, siendo el último la letrea ‘i’. Tiempo estimado: 10 minutos*/

SELECT COUNTRY_NAME
FROM HR.COUNTRIES
WHERE COUNTRY_NAME LIKE 'I%' 
    AND COUNTRY_NAME LIKE '%a%' 
        AND COUNTRY_NAME LIKE '____i';

SELECT COUNTRY_NAME
FROM HR.COUNTRIES
WHERE COUNTRY_NAME LIKE '_____';    -- Mostramos los paises que tengan 5 caracteres y vemos que no ninguno termina en con 'i'

/*E8. Seleccione el nombre completo (pila + apellidos), la comisión y la fecha de alta de aquellos empleados cuyo nombre de pila NO
empiece por ‘B’ y que su comisión sea superior a 0.35. Tiempo estimado: 10 minutos*/

SELECT  FIRST_NAME ||' '|| LAST_NAME "NOMBRE COMPLETO", 
        COMMISSION_PCT, 
        HIRE_DATE
FROM HR.EMPLOYEES
WHERE FIRST_NAME NOT LIKE 'B%' 
    AND COMMISSION_PCT > 0.35;