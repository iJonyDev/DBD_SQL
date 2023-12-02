
/*
P1. Por motivos de seguridad, se desea obtener una clave alfanumérica para cada trabajador. A partir de los datos almacenados en
la tabla EMPLOYEES, obtén una clave para cada trabajador conformado por los 4 primeros caracteres del nombre y los 4 primeros
caracteres del apellido. Tiempo estimado: 10 minutos
*/
SELECT LPAD(first_name,4)||LPAD(last_name,4) as PASS
FROM hr.employees;
/*
P2. Obtener una lista con los datos de aquellos empleados cuyo contrato se realizó hace más de 8 años. Tiempo estimado: 10
minutos
*/
SELECT first_name, last_name, hire_date, MONTHS_BETWEEN(SYSDATE,hire_date)/12 as ANIOS_TRABAJADOS
FROM hr.employees
WHERE MONTHS_BETWEEN(SYSDATE,hire_date)/12 > 19;
/*
P3. Obtener una lista con los datos EMPLOYEE_ID, LAST_NAME y HIRE_DATE de aquellos empleados que hayan trabajado más
de 80 meses entre la fecha en que fueron contratados y el 01-ene-2000 (vamos a suponer que no han sido despedidos). Tiempo
estimado: 10 minutos
*/
SELECT employee_id, last_name, hire_date, MONTHS_BETWEEN(hire_date,'01-JAN-2000') as MESES_TRABAJADOS
FROM hr.employees
WHERE MONTHS_BETWEEN(hire_date,'01-JAN-2000') > 80;
/*
P4. Obtener una lista con los datos EMPLOYEE_ID, JOB_ID y los años trabajados de aquellos trabajadores que han trabajado más
de 5 años en la empresa en un determinado puesto. Tiempo estimado: 10 minutos
*/
SELECT  employee_id,
        job_id,
        MONTHS_BETWEEN(end_date,start_date)/12 as ANIOS_TRABAJANDO_DE 
FROM hr.job_history
WHERE MONTHS_BETWEEN(end_date,start_date)/12 >= 5;
/*
P5. De cada empleado se desea mostrar la información de la fecha de finalización de contrato (END_DATE), el identificador de
empleado (EMPLOYEE_ID) y su identificador de trabajo (JOB_ID). El formato de salida de la cadena será tal que si un trabajador
con JOB_ID= 'AC_MGR', y EMPLOYEE_ID=3 finaliza su contrato el 31/10/2011se deberá mostrar por pantalla “El empleado 3
finaliza como AC_MGR el Lunes 31 de Octubre de 2011”. Tiempo estimado: 10 minutos
*/
--Forma 1 (Larga)
SELECT 	'El empleado '||employee_id||
    	' finaliza como '||job_id||
    	' el '||REPLACE(TO_CHAR(end_date,'DAY'),' ','')||
    					TO_CHAR(end_date,' D ')||'de '||
    			REPLACE(TO_CHAR(end_date,'MONTH'),' ','')||' de '||
    					TO_CHAR(end_date,'YYYY') "Finalizacion de Contrato"
FROM hr.job_history;

--Forma 2 (Corta)
SELECT 	'El empleado '||employee_id||
    	' finaliza como '||job_id||
    	' el '||TO_CHAR(end_date,'fmDay D "de" Month "de" YYYY') "Fin de Contrato"
FROM hr.job_history;
/*
P6. De cada empleado contratado en sábado se desea mostrar su nombre de pila (FIRST_NAME), su apellido (LAST_NAME) y una
cadena basada en el campo fecha de contratación (HIRE_DATE), de forma que si el 17-FEB-1996 fue sábado y hubo una
contratación, la cadena mostrada será “Sábado, 17th de Febrero, One Thousand Nine Hundred Ninety-Six”. Tiempo estimado: 10
minutos
*/
SELECT first_name, last_name, TO_CHAR(hire_date,'fmDay, ddth "de" Month, Yyyysp') Contratado
FROM hr.employees
WHERE TO_CHAR(hire_date,'fmDAY') = 'SATURDAY';
/*
P7. De aquellos empleados cuyo apellido comiencen por E se desea mostrar su apellido (LAST_NAME), salario (SALARY), el
porcentaje de comisión asignado (COMMISSION_PCT) y la comisión que recibe mensualmente, la cual se calcula multiplicando el
porcentaje de comisión asignado por el salario mensual de cada trabajador. Tiempo estimado: 10 minutos
*/
SELECT last_name, salary, commission_pct, (commission_pct*salary) Comision_Mensual
FROM hr.employees
    WHERE last_name LIKE 'E%';
/*
P8. De aquellos empleados que trabajen en el departamento con ID=100, se desea conocer su nombre (FIRST_NAME), apellido
(LAST_NAME) y si la longitud de nombre es igual a la de su apellido (en caso de igualdad se mostrará “Igual longitud”, en caso
contrario “Longitud diferente”). Tiempo estimado: 10 minutos
*/
SELECT first_name, last_name, DECODE(LENGTH(first_name),LENGTH(last_name),'Igual longitud','Longitud diferente') "Longitudes"
FROM hr.employees
    WHERE department_id='100';
/*
P9. A partir de la tabla LOCATIONS muestre toda la información almacenada de aquellas localizaciones cuyo identificador de país
(COUNTRY_ID) sea igual a US. Al mostrar la información almacenada en el campo LOCATION_INFO se deberá tener en cuenta la
siguiente tabla:

If STATE_PROVINCE is	| The value returned is
-----------------------------------------------------------
Washington		| The string 'Headquarters'
Texas			| The string 'Oil Wells'
California		| The CITY column value
New Jersey		| The STREET_ADDRESS column value

*/










