INSERT INTO administrador (dni, ncol, nombre) VALUES ('30982010Q', 2039, 'Fusco Rómiñez');
INSERT INTO administrador (dni, ncol, nombre) VALUES ('28019882K', 120, 'Pameba Misanti');
INSERT INTO administrador (dni, ncol, nombre) VALUES ('98218292Q', 938, 'Maromo Sutipo');

INSERT INTO banco(codigo, nombre, contacto) VALUES (1929, 'Bancopuf', 'Sr. Salicílico');
INSERT INTO banco(codigo, nombre, contacto) VALUES (2313, 'Trust Piffing Bank', 'Sra. Getall');

INSERT INTO cuenta(cod_banco, sucursal, dc, numero, saldo) VALUES (2313, 983, 23, 0106911055, 12040.20);
INSERT INTO cuenta(cod_banco, sucursal, dc, numero, saldo) VALUES (1929, 1, 93, 0294929144, 942.39);
INSERT INTO cuenta(cod_banco, sucursal, dc, numero, saldo) VALUES (1929, 12, 00, 9312912354, 8532.98);

INSERT INTO propietario(dni, nombre, apellidos, direccion, telefono) VALUES ('38928281K', 'Frobo', 'Fineas', 'Avda. Este, 19', NULL);
INSERT INTO propietario(dni, nombre, apellidos, direccion, telefono) VALUES ('12847472G', 'Ainasia', 'Aguiri', 'Avda. Oeste, 29', '555-12856');
INSERT INTO propietario(dni, nombre, apellidos, direccion, telefono) VALUES ('49812732A', 'Barinia', 'Borosote', 'Avda. Norte, 139', '555-12854');
INSERT INTO propietario(dni, nombre, apellidos, direccion, telefono) VALUES ('43837121E', 'Carlillu', 'Cristarino', 'Avda. Sur, 6', NULL);
INSERT INTO propietario(dni, nombre, apellidos, direccion, telefono) VALUES ('54583812N', 'Dariana', 'Dirnico', 'C/. Fujsili, 183', '555-12312');
INSERT INTO propietario (dni, nombre, apellidos, direccion, telefono) VALUES ('9382818D', 'Rosa', 'Furúlez Apinaga', 'C/. Rusillo, 1', '555-19485');
INSERT INTO propietario (dni, nombre, apellidos, direccion, telefono) VALUES ('1827373G', 'Luis', 'Gareño Pizatosa', 'Avda. Suisoe, 12', '555-22322');
INSERT INTO propietario (dni, nombre, apellidos, direccion, telefono) VALUES ('4343221V', 'Pedro', 'Aizgóoniga Fusos', 'C/. Martiono, 121', '555-59182');
INSERT INTO propietario (dni, nombre, apellidos, direccion, telefono) VALUES ('1234564J', 'Marta', 'Callells Piugsa', 'C/. Allosomo, 1', '555-09293');


INSERT INTO comunidad(codcom, codpostal, nombre, calle, poblacion, adm_dni, honorarios, cue_cod_banco, cue_sucursal, cue_dc, cue_numero, prp_dni_presidente) VALUES (39, '41030', 'Las terrazas', 'C/. Salvador Dalí', 'Sevilla', '28019882K', 3200, 2313, 983, 23, 0106911055, '38928281K');
INSERT INTO comunidad(codcom, codpostal, nombre, calle, poblacion, adm_dni, honorarios, cue_cod_banco, cue_sucursal, cue_dc, cue_numero, prp_dni_presidente) VALUES (3, '14001', 'Los peroles', 'C/. Pitita Montana', 'Córdoba', '30982010Q', 2900, 1929, 1, 93, 0294929144, '12847472G');
INSERT INTO comunidad(codcom, codpostal, nombre, calle, poblacion, adm_dni, honorarios, cue_cod_banco, cue_sucursal, cue_dc, cue_numero, prp_dni_presidente) VALUES (19, '29013', 'Los sauces', 'C/. Rusinda Casi', 'Málaga', '30982010Q', 3800, 1929, 12, 00, 9312912354 , '54583812N');

INSERT INTO vocal (prp_dni, com_codcom) VALUES ('12847472G', 39 );
INSERT INTO vocal (prp_dni, com_codcom) VALUES ('49812732A', 3 );
INSERT INTO vocal (prp_dni, com_codcom) VALUES ('49812732A', 19 );

INSERT INTO compania (cif, nombre, sector, direccion, telefono, contacto) VALUES ('18283828K', 'Pitusa', 'Agua', 'C/. Fuchi, 32', NULL, NULL);
INSERT INTO compania (cif, nombre, sector, direccion, telefono, contacto) VALUES ('92818281Q', 'Morlock, SA', 'Seguridad', 'Avda. Fubar, 18', '555-12321', 'Mr. T');
INSERT INTO compania (cif, nombre, sector, direccion, telefono, contacto) VALUES ('12930219B', 'Limisa', 'Otros', NULL, '555-18284', 'Sra. Mayinti');


INSERT INTO contrata (com_codcom, cmp_cif) VALUES (39, '18283828K');
INSERT INTO contrata (com_codcom, cmp_cif) VALUES (3, '18283828K');
INSERT INTO contrata (com_codcom, cmp_cif) VALUES (19, '18283828K');
INSERT INTO contrata (com_codcom, cmp_cif) VALUES (19, '92818281Q');
INSERT INTO contrata (com_codcom, cmp_cif) VALUES (19, '12930219B');


INSERT INTO propiedad (codcom, portal, planta, letra, prp_dni, porcentaje, cuenta_b) VALUES (39, '10', 0, ' ', '38928281K', 50, '88421231000120442367');
INSERT INTO propiedad (codcom, portal, planta, letra, prp_dni, porcentaje, cuenta_b) VALUES (39, '10', 1, 'A', '12847472G', 25, '92831234100128484653');
INSERT INTO propiedad (codcom, portal, planta, letra, prp_dni, porcentaje, cuenta_b) VALUES (39, '10', 1, 'B', '49812732A', 25, '01921213121202020104');
INSERT INTO propiedad (codcom, portal, planta, letra, prp_dni, porcentaje, cuenta_b) VALUES (3, '9', 0, ' ', '43837121E', 50, '01921213931298764231');
INSERT INTO propiedad (codcom, portal, planta, letra, prp_dni, porcentaje, cuenta_b) VALUES (3, '9', 1, ' ', '54583812N', 50, '01921213121286860459');
INSERT INTO propiedad (codcom, portal, planta, letra, prp_dni, porcentaje, cuenta_b) VALUES (19, '21', 0, ' ', '9382818D', 30, '3892182120298754312');
INSERT INTO propiedad (codcom, portal, planta, letra, prp_dni, porcentaje, cuenta_b) VALUES (19, '21', 1, 'A', '1827373G', 20, '389218213232312203');
INSERT INTO propiedad (codcom, portal, planta, letra, prp_dni, porcentaje, cuenta_b) VALUES (19, '21', 1, 'B', '4343221V', 20, '389218215832812800');
INSERT INTO propiedad (codcom, portal, planta, letra, prp_dni, porcentaje, cuenta_b) VALUES (19, '21', 2, ' ', '1234564J', 30, '389218210093857192');


INSERT INTO local (prd_codcom, prd_portal, prd_planta, prd_letra, tipo, hora_inicio, hora_fin) VALUES (39, '10', 0, ' ', 'Concesionario', '1000', '1830');
INSERT INTO vivienda (prd_codcom, prd_portal, prd_planta, prd_letra, n_habitaciones) VALUES (39, '10', 1, 'A', 2);
INSERT INTO vivienda (prd_codcom, prd_portal, prd_planta, prd_letra, n_habitaciones) VALUES (39, '10', 1, 'B', 2);
INSERT INTO oficina (prd_codcom, prd_portal, prd_planta, prd_letra, actividad) VALUES (3, '9', 0, ' ', 'Seguros');
INSERT INTO oficina (prd_codcom, prd_portal, prd_planta, prd_letra, actividad) VALUES (3, '9', 1, ' ', 'Gestoría');
INSERT INTO local (prd_codcom, prd_portal, prd_planta, prd_letra, tipo, hora_inicio, hora_fin) VALUES (19, '21', 0, ' ', 'Alimentación','0930', '2030');
INSERT INTO vivienda (prd_codcom, prd_portal, prd_planta, prd_letra, n_habitaciones) VALUES (19, '21', 1, 'A', 3);
INSERT INTO vivienda (prd_codcom, prd_portal, prd_planta, prd_letra, n_habitaciones) VALUES (19, '21', 1, 'B', 3);
INSERT INTO vivienda (prd_codcom, prd_portal, prd_planta, prd_letra, n_habitaciones) VALUES (19, '21', 2, ' ', 4);


INSERT INTO apunte (num_recibo, importe, fecha) VALUES ( 3, 125.00, to_date('17/04/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES ( 4, 125.00, to_date('17/04/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES ( 5, 125.00, to_date('17/04/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES ( 6, 100.00, to_date('17/04/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES ( 7, 100.00, to_date('17/04/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES ( 8, 150.00, to_date('17/04/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES ( 9, 150.00, to_date('17/04/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (10, 150.00, to_date('17/04/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (11, 150.00, to_date('17/04/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (33, 125.00, to_date('17/05/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (34, 125.00, to_date('17/05/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (35, 125.00, to_date('17/05/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (36, 100.00, to_date('17/05/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (37, 100.00, to_date('17/05/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (38, 150.00, to_date('17/05/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (39, 150.00, to_date('17/05/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (40, 150.00, to_date('17/05/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (41, 150.00, to_date('17/05/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (101, 250.00, to_date('12/04/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (102, 350.00, to_date('14/04/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (103, 230.00, to_date('14/04/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (104, 320.00, to_date('15/04/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (105, 550.00, to_date('16/04/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (201,  54.00, to_date('12/05/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (202,  13.00, to_date('14/05/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (203, 144.00, to_date('14/05/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (204, 113.00, to_date('15/05/2009', 'dd/mm/yyyy') );
INSERT INTO apunte (num_recibo, importe, fecha) VALUES (205, 141.00, to_date('16/05/2009', 'dd/mm/yyyy') );


INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES ( 3, 'No cobrado', 39, '10', 0, ' ' );
INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES ( 4, 'No cobrado', 39, '10', 1, 'A' );
INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES ( 5, 'No cobrado', 39, '10', 1, 'B' );
INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES ( 6, 'No cobrado',  3,  '9', 0, ' ' );
INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES ( 7, 'No cobrado',  3,  '9', 1, ' ' );
INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES ( 8, 'No cobrado', 19, '21', 0, ' ' );
INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES ( 9, 'No cobrado', 19, '21', 1, 'A' );
INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES (10, 'No cobrado', 19, '21', 1, 'B' );
INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES (11, 'No cobrado', 19, '21', 2, ' ' );
INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES (33, 'No cobrado', 39, '10', 0, ' ' );
INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES (34, 'No cobrado', 39, '10', 1, 'A' );
INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES (35, 'No cobrado', 39, '10', 1, 'B' );
INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES (36, 'No cobrado',  3,  '9', 0, ' ' );
INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES (37, 'No cobrado',  3,  '9', 1, ' ' );
INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES (38, 'No cobrado', 19, '21', 0, ' ' );
INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES (39, 'No cobrado', 19, '21', 1, 'A' );
INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES (40, 'No cobrado', 19, '21', 1, 'B' );
INSERT INTO recibo_ingresos (apu_num_recibo, estado, prd_codcom, prd_portal, prd_planta, prd_letra) VALUES (41, 'No cobrado', 19, '21', 2, ' ' );


INSERT INTO recibo_gastos (apu_num_recibo, cue_cod_banco, cue_sucursal, cue_dc, cue_numero, cmp_cif) VALUES (101, 2313, 983, 23, 0106911055, '18283828K');
INSERT INTO recibo_gastos (apu_num_recibo, cue_cod_banco, cue_sucursal, cue_dc, cue_numero, cmp_cif) VALUES (102, 1929, 1, 93, 0294929144, '18283828K');
INSERT INTO recibo_gastos (apu_num_recibo, cue_cod_banco, cue_sucursal, cue_dc, cue_numero, cmp_cif) VALUES (103, 1929, 12, 00, 9312912354, '18283828K');
INSERT INTO recibo_gastos (apu_num_recibo, cue_cod_banco, cue_sucursal, cue_dc, cue_numero, cmp_cif) VALUES (104, 1929, 12, 00, 9312912354, '92818281Q');
INSERT INTO recibo_gastos (apu_num_recibo, cue_cod_banco, cue_sucursal, cue_dc, cue_numero, cmp_cif) VALUES (105, 1929, 12, 00, 9312912354, '12930219B');
INSERT INTO recibo_gastos (apu_num_recibo, cue_cod_banco, cue_sucursal, cue_dc, cue_numero, cmp_cif) VALUES (201, 2313, 983, 23, 0106911055, '18283828K');
INSERT INTO recibo_gastos (apu_num_recibo, cue_cod_banco, cue_sucursal, cue_dc, cue_numero, cmp_cif) VALUES (202, 1929, 1, 93, 0294929144, '18283828K');
INSERT INTO recibo_gastos (apu_num_recibo, cue_cod_banco, cue_sucursal, cue_dc, cue_numero, cmp_cif) VALUES (203, 1929, 12, 00, 9312912354, '18283828K');
INSERT INTO recibo_gastos (apu_num_recibo, cue_cod_banco, cue_sucursal, cue_dc, cue_numero, cmp_cif) VALUES (204, 1929, 12, 00, 9312912354, '92818281Q');
INSERT INTO recibo_gastos (apu_num_recibo, cue_cod_banco, cue_sucursal, cue_dc, cue_numero, cmp_cif) VALUES (205, 1929, 12, 00, 9312912354, '12930219B');