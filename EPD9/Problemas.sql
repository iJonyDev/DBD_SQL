--ENLACE: imagen del esquema HR.
https://drive.google.com/file/d/1Y8_3PAaah7mZif0CnXVWrIGJgLajMkQM/view?usp=sharing

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