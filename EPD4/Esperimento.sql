--ENLACE: imagen del esquema HR.
https://drive.google.com/file/d/1Y8_3PAaah7mZif0CnXVWrIGJgLajMkQM/view?usp=sharing

/*
E1. Reescriba la siguiente consulta de una forma más compacta para que devuelva los mismos resultados. Tiempo estimado: 5
minutos
select first_name, last_name
from employees
where last_name like '%Ur%'
or last_name like '%uR%'
or last_name like '%UR%'
or last_name like '%ur%';
*/

SELECT first_name, last_name
from HR.employees
WHERE LOWER(LAST_NAME) LIKE '%ur%';

/*
E2. Obtenga una lista de todos los valores de los atributos FIRST_NAME y LAST_NAME de la tabla EMPLOYEES cuyo
FIRST_NAME contenga la cadena “li”. Tiempo estimado: 10 minutos
*/

SELECT FIRST_NAME, LAST_NAME 
FROM HR.EMPLOYEES
WHERE FIRST_NAME LIKE '%li%';

/*
E3.Obtenga a partir de la tabla EMPLOYEES aquellos trabajadores que pertenezcan al departamento identificado con el número
100 (DEPARTMENT_ID=100). La información será mostrada como “NOMBRE APELLIDOS gana SALARIO”, utilice para ello la
función CONCAT. Tiempo estimado: 10 minutos
*/

SELECT FIRST_NAME||' '||LAST_NAME||' gana ' || SALARY||'$' "INFORMACION"
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID = 100;

/*
E4. A partir de la tabla EMPLOYEES muestre una cadena que contenga la inicial del nombre, el símbolo de puntuación ‘.’ y el
apellido de aquellos trabajadores cuyos dos caracteres iniciales del identificador de trabajo (JOB_ID) coincida con 'AD'. Así, por
ejemplo, si tenemos almacenado un trabajador que cumpla la condición impuesta y cuyo FIRST_NAME='Luis' y
LAST_NAME='Pérez', se deberá mostrar 'L.Pérez'. Tiempo estimado: 10 minutos
*/

SELECT INITCAP(FIRST_NAME)||'.'||LAST_NAME
FROM HR.EMPLOYEES
WHERE JOB_ID LIKE 'AD%';

/*
E5. Modifique la consulta realizada en el experimento E4 de forma que en el caso de existir un apellido compuesto se eliminen los
espacios en blanco existentes. Tiempo estimado: 10 minutos
*/

SELECT INITCAP(FIRST_NAME)||'.'||REPLACE(LAST_NAME,' ','') "NAMES"
FROM HR.EMPLOYEES
WHERE JOB_ID LIKE 'AD%';

/*
E6. Supongamos que el campo SALARY de la tabla EMPLOYEES se refiere al sueldo anual de cada trabajador. La empresa ha
decidido eliminar de la paga mensual la parte decimal de lo que le corresponde a cada empleado, es decir, para calcular la paga
mensual van a recurrir a la división entera. Muestre los datos de los trabajadores (nombre y apellido) y la cantidad no percibida
anualmente de los trabajadores. Tiempo estimado: 10 minutos
*/

SELECT  FIRST_NAME, 
        LAST_NAME ,
        TRUNC((SALARY/12)) "MENSUAL_SIN_DECIMALES", 
        SALARY-(TRUNC((SALARY/12))*12) "ANUAL NO PERCIBIDA"
FROM HR.EMPLOYEES;

/*
E7. A partir de la tabla JOBS, muestre los datos de trabajo realizado (JOB_TITLE) y salario máximo ganado (MAX_SALARY) de
forma que se muestre este último campo con el símbolo del dólar, como separador de millares una coma y como separador de
decimales un punto (por ej.: $10,020.45). Tiempo estimado: 5 minutos
*/

SELECT JOB_TITLE, TO_CHAR(MAX_SALARY,'$99,999.99') "MAX SALARY"
FROM HR.JOBS;

/*
E8. Mostrar la fecha del sistema de forma que si la fecha es 1/11/2011, martes, deberá mostrar por pantalla “Hoy es LUNES, 01 de
NOVIEMBRE de 2011”. Tiempo estimado: 10 minutos
*/

ALTER SESSION SET NLS_LANGUAGE = 'SPANISH'; --Cambiamos el idioma de la sesion a Español
SELECT 'Hoy es '||TO_CHAR(SYSDATE-1,' DAY') --TO_CHAR(dia de la semana -1)
    	||' de '||TO_CHAR(SYSDATE,'MONTH')  --TO_CHAR(cadena mes completo)
    	||' de '||TO_CHAR(SYSDATE,'YYYY')   --TO_CHAR(año con 4 digitos)
    FROM DUAL;


/*
E9. De cada empleado contratado a partir del 12 de Enero 2000 se desea mostrar el nombre (FIRST_NAME), apellido
(LAST_NAME) y la fecha de contratación (HIRE_DATE). La fecha de contratación se deberá mostrar con el formato MM/DD/YYYY.
Tiempo estimado: 10 minutos
*/
ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/RRRR';
SELECT FIRST_NAME, LAST_NAME, TO_CHAR(HIRE_DATE,)
FROM  HR.EMPLOYEES
WHERE HIRE_DATE > '12-JAN-2000';

/*
E10. Las llamadas internas de los diferentes departamentos se realizan marcando los últimos siete dígitos del número de teléfono
asignado a cada empleado. Muestre, a partir de la tabla EMPLOYEES, el nombre de pila (FIRST_NAME), número de teléfono
(PHONE_NUMBER) y el número de teléfono (sólo dígitos) para las llamadas internas de los trabajadores que trabajen en el
departamento con ID=30 . Tiempo estimado: 10 minutos
*/

SELECT SUBSTR(PHONE_NUMBER,-10)
FROM HR.EMPLOYEES
WHERE DEPARTMENT_ID LIKE '30';

/*
E11. De aquellos empleados cuyo apellido empiece por F, se desea realizar una clasificación entre los que ganan comisión y
aquellos que no ganan comisión, de forma que en el caso de ganar comisión se mostrará “Gana comisión” y en caso contrario “No
gana comisión” . Tiempo estimado: 10 minutos
*/

SELECT LAST_NAME, DECODE(COMMISSION_PCT, NULL, 'NO GANA COMISION', 'GANA COMISION') "COMISION"
FROM HR.EMPLOYEES
WHERE LAST_NAME LIKE 'F%';
 
/*
E12. Obtener para cada empleado que trabaje en un departamento con identificador menor a 41 el nombre del departamento en el
que se encuentran utilizando para ello la función DECODE.
*/
--Preguntar sobre el uso del DECODE
SELECT E.FIRST_NAME, E.LAST_NAME,
       DECODE(D.DEPARTMENT_ID, 
              10, 'Administration',
              20, 'Marketing',
              30, 'Purchasing',
              40, 'Human Resources',
              'Unknown Department') "DEPARTMENT_NAME"
FROM HR.EMPLOYEES E
JOIN HR.DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE D.DEPARTMENT_ID < 41;