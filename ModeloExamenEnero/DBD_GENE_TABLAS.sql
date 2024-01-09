
-- --------------------------------------------------------
CREATE TABLE  Gen (
  Goid varchar2(10),
  GAlias varchar2(10),
  CONSTRAINT  PK_Gen PRIMARY KEY(Goid)
);
-- --------------------------------------------------------
CREATE TABLE Organismo (
  CodO varchar2(5),
  NomC varchar2(50),
  Nom varchar2(50),
  CONSTRAINT  PK_Organismo PRIMARY KEY(CodO)
);
-- --------------------------------------------------------
CREATE TABLE Tiene (
  CodO varchar2(5),
  Goid varchar2(10),
  CONSTRAINT PK_Tiene PRIMARY KEY(CodO,Goid),
  CONSTRAINT    FK_Tiene_CodO    FOREIGN KEY (CodO) REFERENCES Organismo (CodO),
  CONSTRAINT    FK_Tiene_Goid    FOREIGN KEY (Goid) REFERENCES Gen (Goid)
);
-- --------------------------------------------------------
CREATE TABLE GName (
  Goid varchar2(10),
  GName varchar2(50),
  CONSTRAINT  FK_GName_Goid  FOREIGN KEY (Goid) REFERENCES Gen (Goid),
  CONSTRAINT  PK_Gname PRIMARY KEY(Goid,Gname)
);
-- --------------------------------------------------------
CREATE TABLE Secuencia (
  Goid varchar2(10),
  NumS NUMBER(5),
  Chromo varchar2(50),
  Fecha DATE,
  CONSTRAINT  FK_Secuencia FOREIGN KEY (Goid) REFERENCES Gen (Goid),
  CONSTRAINT  PK_Secuencia PRIMARY KEY(Goid,NumS)
);
-- --------------------------------------------------------
CREATE TABLE Codificadora (
  Goid varchar2(10),
  NumS NUMBER(5),
  Proteina varchar2(50),
  CONSTRAINT PK_Codificadora PRIMARY KEY (Goid,NumS),
  CONSTRAINT  FK_Codificadora FOREIGN KEY (Goid,NumS) REFERENCES Secuencia
);
-- --------------------------------------------------------
CREATE TABLE Alinean (
  Goid1 varchar2(10),
  Goid2 varchar2(10),
  NumS1 NUMBER(5),
  NumS2 NUMBER(5),
  Porcentaje NUMBER(3,2),
  CONSTRAINT PK_Alinean PRIMARY KEY (Goid1,Goid2,NumS1,NumS2),
  CONSTRAINT  FK_Codificadora_Goid1 FOREIGN KEY (Goid1,NumS1) REFERENCES Secuencia,
  CONSTRAINT  FK_Codificadora_Goid2 FOREIGN KEY (Goid2,NumS2) REFERENCES Secuencia
);
-- --------------------------------------------------------
CREATE TABLE Reguladora (
  Goid varchar2(10),
  NumS Number(5),
  CONSTRAINT PK_Reguladora PRIMARY KEY (Goid,NumS),
  CONSTRAINT  FK_Reguladora_Goid FOREIGN KEY (Goid,NumS) REFERENCES Secuencia
  );
-- --------------------------------------------------------
CREATE TABLE Regula (
  Goid1 varchar2(10),
  Goid2 varchar2(10),
  NumS1 Number(5),
  NumS2 Number(5),
  CONSTRAINT PK_Regula PRIMARY KEY (Goid1,Goid2,NumS1,NumS2),
  CONSTRAINT  FK_Regula_Goid1 FOREIGN KEY (Goid1,NumS1) REFERENCES Secuencia,
  CONSTRAINT  FK_Regula_Goid2 FOREIGN KEY (Goid2,NumS2) REFERENCES Reguladora
);
-- --------------------------------------------------------
CREATE TABLE Red (
  Id_Red Number(5),
  CONSTRAINT  PK_Red_Id_Red PRIMARY KEY(Id_Red)
);
-- --------------------------------------------------------
CREATE TABLE Arista (
  Id_Arista Number(5),
  Id_Red Number(5),
  Goid1 varchar2(10),
  Goid2 varchar2(10),
  Num_A Number(5),
  CONSTRAINT  FK_Arista_Goid1 FOREIGN KEY (Goid1) REFERENCES Gen,
  CONSTRAINT  FK_Arista_Goid2 FOREIGN KEY (Goid2) REFERENCES Gen,
  CONSTRAINT  FK_Arista_Id_Red FOREIGN KEY (Id_Red) REFERENCES Red,  
  CONSTRAINT  PK_Arista_Id_Arista PRIMARY KEY(Id_Arista,Id_Red)
);
-- --------------------------------------------------------
CREATE TABLE Pathway (
  Nom varchar2(50),
  Nfases Number(5),
  Funcion varchar2(50),
  CONSTRAINT  PK_Pathway_Num PRIMARY KEY(Nom)
);
-- --------------------------------------------------------
CREATE TABLE Actua (
  Nom varchar2(50),
  NumS Number(5),
  Goid varchar2(10),
  Tipo varchar2(50),
  CONSTRAINT  FK_Actua_Nom FOREIGN KEY (Nom) REFERENCES Pathway (Nom),
  CONSTRAINT  FK_Actua_NumS FOREIGN KEY (Goid,NumS) REFERENCES Reguladora,
  CONSTRAINT PK_Actua PRIMARY KEY (Nom,NumS,Goid)
);
-- --------------------------------------------------------
CREATE TABLE Interviene (
  Nom varchar2(50),
  NumS Number(5),
  Goid varchar2(10),
  CONSTRAINT  FK_Interviene_Nom FOREIGN KEY (Nom) REFERENCES Pathway (Nom),
  CONSTRAINT  FK_Interviene_NumS FOREIGN KEY (Goid,NumS) REFERENCES Codificadora,
  CONSTRAINT PK_Interviene PRIMARY KEY (Nom,NumS,Goid)
);
-- --------------------------------------------------------
CREATE TABLE Vinculado (
  Nom varchar2(50),
  Id_Red Number(5),
  CONSTRAINT  FK_Vinculado_Nom FOREIGN KEY (Nom) REFERENCES Pathway (Nom),
  CONSTRAINT  FK_Vinculado_Id_Red FOREIGN KEY (Id_Red) REFERENCES Red (Id_Red),
  CONSTRAINT PK_Vinculado PRIMARY KEY (Nom, Id_Red)
);
-- --------------------------------------------------------
CREATE TABLE Nucleotido (
  Goid varchar2(10),
  NumS Number(5),
  Nom varchar2(50),
  Pos Number(5),
  TipoBH varchar2(50),
  CONSTRAINT  FK_Nucleotido_Goid FOREIGN KEY (Goid,NumS) REFERENCES Secuencia,
  CONSTRAINT  PK_Nucleotido PRIMARY KEY(Goid,NumS,Nom,Pos)
);


