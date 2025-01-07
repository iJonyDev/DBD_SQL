--CUESTIONES NIVEL FACIL 1
--1.Listar el nombre de todas las comunidades.
select nombre from comunidad;
--2.Mostrar el DNI y el nombre de todos los administradores.
select dni, nombre from administrador;
--3.Obtener el CIF y el nombre de todas las compañías del sector "Luz".
select cif, nombre from compania where sector = 'Luz';
--4.Listar los códigos postales de todas las comunidades.
select codpostal from comunidad;
--5.Mostrar el nombre y la dirección de todos los bancos.
select * from cuenta;
select nombre, sucursal as Direccion 
    from banco b, cuenta cue
    where b.codigo = cue.cod_banco;
--6.Listar el nombre de todos los propietarios.
select nombre from propietario;
--7.Obtener el nombre y el sector de todas las compañías.
select nombre, sector from compania;
--8.Mostrar el código y el saldo de todas las cuentas.
select cod_banco, saldo from cuenta;
--9.Listar el DNI y el número de colegiado de todos los administradores.
select dni, ncol from administrador;
--10.Obtener la población de todas las comunidades.
select poblacion from comunidad;


-- CUESTIONES NIVEL FACIL 2
--1.Listar el nombre y DNI de todos los administradores.
select nombre, dni
    from administrador;
--2.Mostrar el código, nombre y dirección de todas las comunidades de vecinos.
select codcom, nombre, calle
    from comunidad;
--3.Obtener el nombre y CIF de todas las empresas de un sector específico 
--(por ejemplo, "luz").
select nombre, cif
from compania
    where sector = 'Agua';
--4.Listar los propietarios de una comunidad de vecinos específica.
select prp_dni
from propiedad
    where codcom = 39;
--5.Mostrar el saldo actual de la cuenta bancaria de una comunidad de vecinos.
select cue.saldo, com.nombre
from comunidad com, cuenta cue
    where com.cue_cod_banco = cue.cod_banco
    and com.cue_sucursal = cue.sucursal
    and com.cue_dc = cue.dc
    and com.cue_numero = cue.numero
    and codcom = 39;
--6.Listar todos los recibos de una comunidad de vecinos, especificando si 
--han sido cobrados o 

--Version 1 con LEFT JOIN
select ap.num_recibo, ap.importe, ap.fecha, ri.estado
from apunte ap
left join recibo_ingresos ri on ap.num_recibo = ri.apu_num_recibo
left join recibo_gastos rg on ap.num_recibo = rg.apu_num_recibo
where ri.apu_num_recibo is not null or rg.apu_num_recibo is not null;

--Version 2 sin LEFT JOIN y usando una consulta COMPUESTA

select ap.num_recibo, ap.importe, ap.fecha, 'Cobrado' as estado
from apunte ap, recibo_ingresos ri
where ap.num_recibo = ri.apu_num_recibo
union
select ap.num_recibo, ap.importe, ap.fecha, 'No cobrado' as estado
from apunte ap, recibo_gastos rg
where ap.num_recibo = rg.apu_num_recibo;


--7.Obtener el nombre y número de colegiado del administrador de una 
--comunidad de vecinos específica.
select ad.nombre, ad.ncol
from administrador ad, comunidad com
where ad.dni = com.adm_dni and codcom = 39;
--8.Mostrar el nombre de todos los bancos con los que trabajan las 
--comunidades de vecinos.
select ba.nombre
from banco ba, cuenta cue, comunidad com
where ba.codigo = cue.cod_banco 
    and cue.cod_banco = com.cue_cod_banco
    and cue.sucursal = com.cue_sucursal
    and cue.dc = com.cue_dc
    and cue.numero = com.cue_numero;

--9.Listar las propiedades de un tipo específico
-- (vivienda particular, local comercial, oficina) en una comunidad de vecinos.
select com.codcom, pr.portal, pr.planta, pr.letra
from comunidad com, propiedad pr, vivienda v
where com.codcom = pr.codcom 
    and pr.codcom = v.prd_codcom
	and pr.portal = v.prd_portal
	and pr.planta = v.prd_planta
	and pr.letra = v.prd_letra
	and com.codcom = 39;

--10.Obtener el nombre completo y la dirección del propietario de 
--una propiedad específica.
select pr.nombre ||' '||pr.apellidos as Nombre_Completo, pr.direccion as Direccion
from propietario pr, propiedad p
where pr.dni = p.prp_dni
    and codcom = 39 and portal = 10 and planta = 1 and letra = 'B';



--CUESTIONES NIVEL MEDIO 1
--1.Listar las comunidades que tienen un código postal que empieza por "28".
select *
from comunidad
where codpostal like '28%';
--2.Mostrar los administradores que gestionan más de una comunidad.

select admin.nombre, count(com.codcom) as N_Com_Admin
from administrador admin, comunidad com
where admin.dni = com.prp_dni_presidente
group by admin.nombre
having count(com.codcom) > 1;

--3.Obtener las compañías que tienen un nombre que contiene la palabra "Fenosa".
select *
from compania
where nombre like '%Fenosa%';

--4.Listar las comunidades que se encuentran en la población de "Madrid".
select * 
    from comunidad
    where poblacion like 'Madrid';

--5.Mostrar los bancos que tienen un contacto cuyo nombre empieza por "Sr.".
select *
from banco
where contacto like 'Sr.%';

--6.Listar los propietarios que no tienen apellidos registrados.
select * from propietario
where apellidos = null;

--7.Obtener las compañías que pertenecen al sector "Ascensores" y 
-- tienen un teléfono que empieza por "91".
select * from compania
    where sector = 'Ascensores' and telefono like '91%';

--8.Mostrar las cuentas que tienen un saldo superior a 1000 euros.
select * from cuenta
    where saldo > 1000;

--9.Listar los administradores que tienen un número de colegiado entre 500 y 1000.
select * from administrador
    where ncol >= 500 and ncol <=1000;

--10.Obtener las comunidades que tienen unos honorarios anuales 
--superiores a 2500 euros.
select * from comunidad
    where honorarios > 2500;



--CUESTIONES NIVEL MEDIO 2
--1.Mostrar las comunidades que no tienen ningún vocal registrado.
--v1 Corregida
select com.codcom, com.nombre
from comunidad com
left join vocal v on v.com_codcom = com.codcom
where v.prp_dni is null;

--v2 Hecha por mi y corregida
select com.codcom, com.nombre
    from vocal v, comunidad com
	where v.com_codcom = com.codcom
	and v.prp_dni is null;

--2.Listar los administradores que gestionan comunidades con códigos 
-- postales que no están en las provincias de Madrid (28) ni Barcelona (08).
select admin.nombre, com.codpostal, com.poblacion
from administrador admin, comunidad com
where admin.dni = com.adm_dni
	and com.codpostal not like '28%' 
    	and com.codpostal not like '08%';

--3.Obtener las compañías que han sido contratadas por al menos dos comunidades.

select cp.nombre, count(ct.com_codcom) as N_Com
from contrata ct, compania cp
where ct.cmp_cif = cp.cif
group by cp.nombre
having count(ct.com_codcom) >= 2; 

--4.Listar las comunidades que tienen al menos una propiedad que es un local.
select pr.codcom, c.nombre , lc.tipo
from comunidad c, propiedad pr, local lc
where c.codcom = pr.codcom
    and pr.codcom = lc.prd_codcom
	and pr.portal = lc.prd_portal
	and pr.planta = lc.prd_planta
	and pr.letra = lc.prd_letra;

--5.Mostrar los bancos que no tienen ninguna cuenta asociada.
--v1 Corregida
select b.nombre
from banco b
left join cuenta c on b.codigo = c.cod_banco
where c.cod_banco is null;

--v2 Hecha por mi y corregida
select b.nombre
from cuenta c, banco b
where c.cod_banco = b.codigo 
and c.cod_banco is null;

--6.Listar los propietarios que son presidentes de una comunidad 
-- y a la vez vocales de otra.

--v1 Hecha por mi
select p.nombre
from propietario p, comunidad c, vocal v
where p.dni = c.prp_dni_presidente 
and c.prp_dni_presidente = v.prp_dni;

--v2 Corregida y mas legible
select distinct p.nombre
from propietario p, comunidad c, vocal v
where p.dni = c.prp_dni_presidente
and p.dni = v.prp_dni;

--7.Obtener las compañías que pertenecen a un sector que no sea 
-- "Luz" ni "Agua" y tienen una dirección que contiene la palabra "Calle".
select cp.nombre
from compania cp
where cp.sector not in ('Luz','Agua') and cp.direccion like '%Calle%';

--8.Mostrar las cuentas que tienen el mismo saldo que otra cuenta.
select c1.numero
from cuenta c1, cuenta c2
where c1.numero != c2.numero
	and c1.saldo = c2.saldo;

/*
    9.Listar los administradores que gestionan comunidades con honorarios anuales
     que son el doble de los de otra comunidad.
*/
select ad.nombre
from administrador ad, comunidad co1, comunidad co2
    where ad.dni = co1.adm_dni
    and co1.codcom != co2.codcom
    and co1.honorarios = co2.honorarios*2;

/*
    10.Obtener las comunidades que tienen todas sus propiedades con un porcentaje
    de propiedad del 100%.
*/
select distinct(c.nombre)
    from comunidad c, propiedad p
    where c.codcom = p.codcom and p.porcentaje = 100;

--CUESTIONES NIVEL DIFICIL 1
/*
    1.Mostrar las comunidades que tienen un vocal que es a la vez propietario de
    una vivienda en la misma comunidad.
*/
select distinct com.codcom, com.nombre
from comunidad com, vocal v, propiedad p, vivienda vda
where v.com_codcom = com.codcom
and com.codcom = p.codcom
and p.prp_dni = v.prp_dni
and p.codcom = vda.prd_codcom
and p.portal = vda.prd_portal
and p.planta = vda.prd_planta
and p.letra = vda.prd_letra;
/*
    2.Listar los administradores que gestionan comunidades que contratan
    a compañías del mismo sector que las compañías contratadas por otra
    comunidad gestionada por el mismo administrador.
*/
select distinct adm.nombre
from administrador adm, comunidad com1, comunidad com2, contrata ct1, contrata ct2, compania cia1, compania cia2
where adm.dni = com1.adm_dni
and adm.dni = com2.adm_dni
and com1.codcom = ct1.com_codcom
and com2.codcom = ct2.com_codcom    
and ct1.cmp_cif = cia1.cif
and ct2.cmp_cif = cia2.cif    
and cia1.sector = cia2.sector
and com1.codcom != com2.codcom;
/*
    3.Obtener las compañías que han sido contratadas por todas las 
    comunidades de una misma población.
*/
--Paso 1: Contar el número total de comunidades por población 
--y almacenar en una tabla temporal
select com.poblacion, count(distinct com.codcom) as total_comunidades
into #total_comunidades
from comunidad com
group by com.poblacion;
--Paso 2: Contar el número de comunidades que han contratado a cada
-- compañía por población y almacenar en una tabla temporal
select cp.cif, cp.nombre, com.poblacion, count(distinct com.codcom) as num_comunidades
into #comp_comunidades
from compania cp, contrata ct, comunidad com
where cp.cif = ct.cmp_cif
and ct.com_codcom = com.codcom
group by cp.cif, cp.nombre, com.poblacion;
--Paso 3: Combinar los resultados y filtrar las compañías que han sido contratadas
select distinct cc.nombre
from #comp_comunidades cc, #total_comunidades tc
where cc.poblacion = tc.poblacion
and cc.num_comunidades = tc.total_comunidades;
-- Limpiar tablas temporales
drop table #total_comunidades;
drop table #comp_comunidades;