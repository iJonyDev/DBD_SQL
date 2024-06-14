--ENLACE: imagen del esquema HR.
https://drive.google.com/file/d/1Y8_3PAaah7mZif0CnXVWrIGJgLajMkQM/view?usp=sharing

/*E1 . Acceda a la descripción de todas las tablas de HR para que se familiarice con nuestro esquema: comprueba el nombre de las 
columnas, el tipo de datos, cuál de ellas no acepta valores nulos, etc */

DESC HR.JOBS;
DESC HR.EMPLOYEES;
DESC HR.DEPARTMENTS;
DESC HR.LOCATIONS;
DESC HR.COUNTRIES;
DESC HR.REGIONS;
DESC HR.JOB_HISTORY;

/*E2 . Compruebe cuantas combinaciones diferentes hay de las columnas JOB_ID y DEPARTMENT_ID en la tabla JOB_HISTORY 
del esquema HR. */

SELECT DISTINCT JOB_ID, DEPARTMENT_ID   -- Mostramos JOB_IDs y DEPARTMENT_IDs excepto los repetidos
    FROM HR.JOB_HISTORY;                -- de la tabla JOB_HISTORY

/*E3. Responda a la siguiente pregunta: ¿Qué departamentos tienen actualmente empleados trabajando en ellos? El nombre de los 
departamentos ha de aparecer una sola vez.*/

SELECT DISTINCT DEPARTMENT_ID   -- Mostramos DEPARTMENT_IDs excepto los repetidos
    FROM HR.EMPLOYEES;          -- de la tabla EMPLOYEES

/*E4. ¿Cúantos países hay en la región de Europa?*/

-- MÉTODO 1 (Basico)
SELECT * FROM HR.REGIONS;   -- Averiguamos REGION_ID corespondiente a Europa.
SELECT COUNTRY_NAME         -- Mostramos la columna COUNTRY_NAME 
    FROM HR.COUNTRIES       -- de la tabla COUNTRIES
    WHERE REGION_ID = 1;    -- donde el REGION_ID es 1
                            -- Luego contamos manualmente el numero de paises

-- MÉTODO 2 (Subconsultas)
SELECT COUNT(*) AS Numero_Paises_Region_Europa  -- COUNT(*) cuenta las filas que resultan de hacer la consulta
    FROM HR.COUNTRIES       -- de la tabla Countries
    WHERE REGION_ID =       -- donde REGION_ID es igual al resultado de la Subconsulta
    (   SELECT REGION_ID    -- Sunbconsulta que obtiene el REGION_ID
        FROM HR.REGIONS     -- de la tabla HR.REGIONS
        WHERE REGION_NAME = 'Europe');  -- donde REGION_NAME es 'Europe'

/*E5. Implemente una sentencia SQL de tal manera que, por cada empleado, aparezca una frase similar a la siguiente:
THE EMPLOYEE Steven King HAS A SALARY OF 24000 DOLARS
Además, establezca un alias para esta expresión que se denomine SENTENCE.*/

--MÉTODO 1 (malo)
SELECT CONCAT(CONCAT(CONCAT(CONCAT(CONCAT(CONCAT('THE EMPLOYEE ', FIRST_NAME), ' '), LAST_NAME), ' HAS A SALARY OF '), SALARY), ' DOLARS') AS SENTENCE
    FROM HR.EMPLOYEES;

--MÉTODO 2 (bueno)
SELECT 'THE EMPLOYEE ' || FIRST_NAME || ' ' || LAST_NAME || ' HAS A SALARY OF ' || SALARY || ' DOLARS' AS SENTENCE
    FROM HR.EMPLOYEES;   -- IMPORTANTE: utilizar comillas simples ('example') para las cadenas de texto

/*E6. Ejecute la siguiente consulta y comprueba el resultado de las expresiones aritméticas y de concatenación cuando existen
valores nulos.

SELECT FIRST_NAME || NULL || LAST_NAME AS “FULL_NAME”,
COMMISSION_PCT,
COMMISSION_PCT + EMPLOYEE_ID + 10 AS “NULL ARITHMETIC”,
10/COMMISSION_PCT AS “DIVISION BY NULL” FROM EMPLOYEES.
*/
SELECT FIRST_NAME || NULL || LAST_NAME "FULL_NAME",
    COMMISSION_PCT, COMMISSION_PCT + EMPLOYEE_ID + 10 AS NULL_ARITHMETIC,
    10/COMMISSION_PCT AS DIVISION_BY_NULL 
    FROM HR.EMPLOYEES;


/*E7. Calcule el número de años que un trabajador ha estado llevando a cabo su trabajo, mostrando además los siguientes datos:
EMPLOYEE_ID, JOB_ID, START_DATE y END_DATE. Asuma que un año está formado por 365.25 días.*/

SELECT EMPLOYEE_ID, JOB_ID, START_DATE, END_DATE, 
       (END_DATE - START_DATE)/365.25 AS YEARS_WORKED
    FROM HR.JOB_HISTORY;

/*E8. Utilice la tabla DUAL para calcular el área de un círculo con un radio igual a 6000, considerando que el número pi es igual a
22/7. Utilice la siguiente fórmula: Area=pi * radio * radio, y asocie el alias AREA al resultado final.*/

SELECT (22/7)*6000*6000 "AREA"
    FROM DUAL;

