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

/*
E2. Obtenga una lista de todos los valores de los atributos FIRST_NAME y LAST_NAME de la tabla EMPLOYEES cuyo
FIRST_NAME contenga la cadena “li”. Tiempo estimado: 10 minutos
*/

/*
E3.Obtenga a partir de la tabla EMPLOYEES aquellos trabajadores que pertenezcan al departamento identificado con el número
100 (DEPARTMENT_ID=100). La información será mostrada como “NOMBRE APELLIDOS gana SALARIO”, utilice para ello la
función CONCAT. Tiempo estimado: 10 minutos
*/


/*
E4. A partir de la tabla EMPLOYEES muestre una cadena que contenga la inicial del nombre, el símbolo de puntuación ‘.’ y el
apellido de aquellos trabajadores cuyos dos caracteres iniciales del identificador de trabajo (JOB_ID) coincida con 'AD'. Así, por
ejemplo, si tenemos almacenado un trabajador que cumpla la condición impuesta y cuyo FIRST_NAME='Luis' y
LAST_NAME='Pérez', se deberá mostrar 'L.Pérez'. Tiempo estimado: 10 minutos
*/

/*
E5. Modifique la consulta realizada en el experimento E4 de forma que en el caso de existir un apellido compuesto se eliminen los
espacios en blanco existentes. Tiempo estimado: 10 minutos
*/

/*
E6. Supongamos que el campo SALARY de la tabla EMPLOYEES se refiere al sueldo anual de cada trabajador. La empresa ha
decidido eliminar de la paga mensual la parte decimal de lo que le corresponde a cada empleado, es decir, para calcular la paga
mensual van a recurrir a la división entera. Muestre los datos de los trabajadores (nombre y apellido) y la cantidad no percibida
anualmente de los trabajadores. Tiempo estimado: 10 minutos
*/

/*
E7. A partir de la tabla JOBS, muestre los datos de trabajo realizado (JOB_TITLE) y salario máximo ganado (MAX_SALARY) de
forma que se muestre este último campo con el símbolo del dólar, como separador de millares una coma y como separador de
decimales un punto (por ej.: $10,020.45). Tiempo estimado: 5 minutos
*/

/*
E8. Mostrar la fecha del sistema de forma que si la fecha es 1/11/2011, martes, deberá mostrar por pantalla “Hoy es LUNES, 01 de
NOVIEMBRE de 2011”. Tiempo estimado: 10 minutos
*/

/*
E9. De cada empleado contratado a partir del 12 de Enero 2000 se desea mostrar el nombre (FIRST_NAME), apellido
(LAST_NAME) y la fecha de contratación (HIRE_DATE). La fecha de contratación se deberá mostrar con el formato MM/DD/YYYY.
Tiempo estimado: 10 minutos
*/

/*
E10. Las llamadas internas de los diferentes departamentos se realizan marcando los últimos siete dígitos del número de teléfono
asignado a cada empleado. Muestre, a partir de la tabla EMPLOYEES, el nombre de pila (FIRST_NAME), número de teléfono
(PHONE_NUMBER) y el número de teléfono (sólo dígitos) para las llamadas internas de los trabajadores que trabajen en el
departamento con ID=30 . Tiempo estimado: 10 minutos
*/

/*
E11. De aquellos empleados cuyo apellido empiece por F, se desea realizar una clasificación entre los que ganan comisión y
aquellos que no ganan comisión, de forma que en el caso de ganar comisión se mostrará “Gana comisión” y en caso contrario “No
gana comisión” . Tiempo estimado: 10 minutos
*/

/*
E12. Obtener para cada empleado que trabaje en un departamento con identificador menor a 41 el nombre del departamento en el
que se encuentran utilizando para ello la función DECODE.
*/