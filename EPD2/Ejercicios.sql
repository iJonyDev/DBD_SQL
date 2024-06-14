--Esquema ORDER_ENTRY
https://drive.google.com/file/d/1C11vWvxrIlI8hg87IgkwikcHvs-BjxOe/view?usp=sharing

/*
P1. Obtenga información estructural de las tablas PRODUCT_INFORMATION y ORDERS.
*/

DESC OE.PRODUCT_INFORMATION;
DESC OE.ORDERS;

/*
P2. Obtenga los valores únicos del campo SALES_REP_ID de la tabla ORDERS ¿Cuantos representantes de ventas han sido
asignados a órdenes en la tabla ORDERS?
*/

SELECT COUNT(DISTINCT SALES_REP_ID) AS Unique_Sales_Rep_Count 
    FROM OE.ORDERS;

/*
P3. Obtenga las columnas ORDER_ID, ORDER_DATE y ORDER_TOTAL de la tabla ORDERS. Fíjese como la columna
ORDER_DATE está formateada de manera diferente a las columnas START_DATE y END_DATE de la tabla HR.JOB_HISTORY.
*/
--Formato dia-mes-año 
SELECT ORDER_ID, ORDER_DATE, ORDER_TOTAL
FROM OE.ORDERS              
FETCH FIRST 5 ROWS ONLY;
--Formato dia-mes-año h.min.seg AM/PM
SELECT START_DATE, END_DATE
FROM HR.JOB_HISTORY
FETCH FIRST 5 ROWS ONLY;

/*
P4. La tabla PRODUCT_INFORMATION contiene información referente a los productos disponibles para la venta en unos grandes
almacenes. Necesitamos generar una consulta que nos de toda esta información:
- Información sobre los productos de la forma: <PRODUCT_ID> has status of <PRODUCT_STATUS>. Añadir el alias “Product”
- Las columnas LIST_PRICE, MIN_PRICE y la diferencia entre ambas, con el alias “Max Actual Savings”.
- La diferencia entre LIST_PRICE y MIN_PRICE, todo ello dividido entre LIST_PRICE y finalmente multiplicado el total por 100.
Añadiremos el alias “Max discount %”.
*/

SELECT PRODUCT_ID || ' has status of ' || PRODUCT_STATUS "Product",
    LIST_PRICE, MIN_PRICE, (LIST_PRICE - MIN_PRICE) "Max Actual Savings",
    ((LIST_PRICE - MIN_PRICE)/LIST_PRICE)*100 "Max discount %"
FROM 
    OE.PRODUCT_INFORMATION;

/*
P5. Calcule la superficie de la tierra utilizando la tabla DUAL. La fórmula necesaria es la siguiente: 4*pi*r2, teniendo en cuenta que pi
es igual a 22/7 y que el radio de la tierra es de 3958759 millas. Tiempo estimado:10 minutos
*/

SELECT 4*(22/7)*3958759*3958759 "Superficie de la Tierra en millas"
FROM DUAL;
