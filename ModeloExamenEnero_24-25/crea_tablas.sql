CREATE TABLE administrador (
	dni VARCHAR2(9),
	ncol INTEGER NOT NULL,
	nombre VARCHAR2(50) NOT NULL,
	PRIMARY KEY(dni)
	);

CREATE TABLE banco (
	codigo INTEGER,
	nombre VARCHAR2(20),
	contacto VARCHAR2(50),
	PRIMARY KEY(codigo)
	);

CREATE TABLE cuenta (
	cod_banco INTEGER,
	sucursal INTEGER,
	dc INTEGER,
	numero INTEGER,
	saldo NUMBER(8,2) NOT NULL,
	PRIMARY KEY(cod_banco, sucursal, dc, numero),
	FOREIGN KEY (cod_banco) REFERENCES banco
	);


CREATE TABLE propietario (
	dni VARCHAR2(9),
	nombre VARCHAR2(20) NOT NULL,
	apellidos VARCHAR2(20),
	direccion VARCHAR2(50),
	telefono VARCHAR2(20),
	PRIMARY KEY(dni)
	);

CREATE TABLE comunidad (
	codcom INTEGER,
	codpostal VARCHAR2(5) NOT NULL CHECK (codpostal NOT LIKE '22%' AND codpostal NOT LIKE '50%' AND codpostal NOT LIKE '44%'),
	nombre VARCHAR2(20),
	calle VARCHAR2(20) NOT NULL,
	poblacion VARCHAR2(20),

	adm_dni VARCHAR2(9),
	honorarios NUMBER(6,2) CHECK (honorarios BETWEEN 1500 AND 4000),

	cue_cod_banco INTEGER,
	cue_sucursal INTEGER,
	cue_dc INTEGER,
	cue_numero INTEGER,

	prp_dni_presidente VARCHAR2(9) NOT NULL, 
    
	PRIMARY KEY(codcom),
	FOREIGN KEY (adm_dni) REFERENCES administrador,
	FOREIGN KEY (cue_cod_banco, cue_sucursal, cue_dc, cue_numero) REFERENCES cuenta,
	FOREIGN KEY (prp_dni_presidente) REFERENCES propietario
	);

CREATE TABLE vocal (
	prp_dni VARCHAR2(9),
	com_codcom INTEGER,
    
	PRIMARY KEY(prp_dni, com_codcom),
	FOREIGN KEY (prp_dni) REFERENCES propietario,
	FOREIGN KEY (com_codcom) REFERENCES comunidad
	);

CREATE TABLE compania (
	cif VARCHAR2(9),
	nombre VARCHAR2(20) NOT NULL,
	sector VARCHAR2(20) CHECK (sector IN ('Luz', 'Agua', 'Ascensores','Mantenimiento', 'Seguridad', 'Otros') ),
	direccion VARCHAR2(50),
	telefono VARCHAR2(20),
	contacto VARCHAR2(50),
	PRIMARY KEY(cif)
	);

CREATE TABLE contrata (
	com_codcom INTEGER,
	cmp_cif VARCHAR2(9),
	PRIMARY KEY(com_codcom, cmp_cif),
	FOREIGN KEY (com_codcom) REFERENCES comunidad,
	FOREIGN KEY (cmp_cif) REFERENCES compania
	);

CREATE TABLE propiedad (
	codcom INTEGER,
	portal VARCHAR2(3),
	planta INTEGER,
	letra CHAR(1),

	prp_dni VARCHAR2(9),
	porcentaje INTEGER  NOT NULL CHECK (porcentaje BETWEEN 0 AND 100),
	cuenta_b VARCHAR2(20) NOT NULL,

	PRIMARY KEY(codcom, portal, planta, letra),
	FOREIGN KEY (codcom) REFERENCES comunidad,
	FOREIGN KEY (prp_dni) REFERENCES propietario
	);

CREATE TABLE vivienda (
	prd_codcom INTEGER,
	prd_portal VARCHAR2(3),
	prd_planta INTEGER,
	prd_letra CHAR(1),

	n_habitaciones INTEGER CHECK (n_habitaciones BETWEEN 1 AND 10),

	PRIMARY KEY (prd_codcom, prd_portal, prd_planta, prd_letra),
	FOREIGN KEY (prd_codcom, prd_portal, prd_planta, prd_letra) REFERENCES propiedad
	);

CREATE TABLE local (
	prd_codcom INTEGER,
	prd_portal VARCHAR2(3),
	prd_planta INTEGER,
	prd_letra CHAR(1),

	tipo VARCHAR2(20) CHECK (tipo NOT IN ('Pirotecnia', 'Alquimia')),
	hora_inicio CHAR(4),
	hora_fin CHAR(4),

	PRIMARY KEY (prd_codcom, prd_portal, prd_planta, prd_letra),
	FOREIGN KEY (prd_codcom, prd_portal, prd_planta, prd_letra) REFERENCES propiedad
	);

CREATE TABLE oficina (
	prd_codcom INTEGER,
	prd_portal VARCHAR2(3),
	prd_planta INTEGER,
	prd_letra CHAR(1),

	actividad VARCHAR2(20),

	PRIMARY KEY (prd_codcom, prd_portal, prd_planta, prd_letra),
	FOREIGN KEY (prd_codcom, prd_portal, prd_planta, prd_letra) REFERENCES propiedad
	);

CREATE TABLE apunte (
	num_recibo INTEGER,
	importe NUMBER(7,2)  NOT NULL CHECK (importe > 0),
	fecha DATE,
	PRIMARY KEY(num_recibo)
	);

CREATE TABLE recibo_gastos (
	apu_num_recibo INTEGER,

	cue_cod_banco INTEGER,
	cue_sucursal INTEGER,
	cue_dc INTEGER,
	cue_numero INTEGER,

	cmp_cif VARCHAR2(9),
	
	PRIMARY KEY (apu_num_recibo),
	FOREIGN KEY (apu_num_recibo) REFERENCES apunte,
	FOREIGN KEY (cue_cod_banco, cue_sucursal, cue_dc, cue_numero) REFERENCES cuenta,
	FOREIGN KEY (cmp_cif) REFERENCES compania
	);

CREATE TABLE recibo_ingresos (
	apu_num_recibo INTEGER,
	estado CHAR(10) CHECK (estado IN ('Cobrado', 'No cobrado')),

	prd_codcom INTEGER,
	prd_portal VARCHAR2(3),
	prd_planta INTEGER,
	prd_letra CHAR(1),

	PRIMARY KEY (apu_num_recibo),
	FOREIGN KEY (apu_num_recibo) REFERENCES apunte,
	FOREIGN KEY (prd_codcom, prd_portal, prd_planta, prd_letra) REFERENCES propiedad
	);
