



















-- Construcción de base de datos con SQL-LDD

-- Crear una base de datos
CREATE DATABASE empresa_patito;
GO

-- Utilizar la base de datos
USE empresa_patito;
go

-- Crear tabla
CREATE TABLE alumno(
	alumno_id INT,
	nombre VARCHAR(30),
	apellido_paterno VARCHAR(20),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	correo VARCHAR(25)
 );
 GO

 INSERT INTO alumno
 VALUES(1,'Adair Jesus', 'Cruz','Huitron','11-06-2007','adizunny@gmail.com');

  INSERT INTO alumno
 VALUES(1,'YAretzi', 'Castro','Días','11-06-2007','castrantediaz@gmail.com');

 SELECT *
 FROM alumno;
 DROP TABLE alumno;

 CREATE TABLE alumno(
	alumno_id INT PRIMARY KEY,
	nombre VARCHAR(30),
	apellido_paterno VARCHAR(20),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	correo VARCHAR(25)
 );
GO

 INSERT INTO alumno
 VALUES(1,'Adair Jesus', 'Cruz','Huitron','11-06-2007','adizunny@gmail.com');

  INSERT INTO alumno
 VALUES(1,'YAretzi', 'Castro','Días','11-06-2007','castrantediaz@gmail.com');

  SELECT *
 FROM alumno;
 DROP TABLE alumno;

  CREATE TABLE alumno(
	alumno_id INT NOT NULL
	CONSTRAINT pk_alumno
	PRIMARY KEY (alumno_id),
	nombre VARCHAR(30),
	apellido_paterno VARCHAR(20),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	correo VARCHAR(25)
 );
GO
 INSERT INTO alumno
 VALUES(1,'Adair Jesus', 'Cruz','Huitron','11-06-2007','adizunny@gmail.com');

  INSERT INTO alumno
 VALUES(1,'YAretzi', 'Castro','Días','11-06-2007','castrantediaz@gmail.com');

 DROP TABLE alumno;

   CREATE TABLE alumno(
	alumno_id INT NOT NULL,
	nombre VARCHAR(30),
	apellido_paterno VARCHAR(20),
	apellido_materno VARCHAR(20),
	fecha_nacimiento DATE,
	correo VARCHAR(25),
	CONSTRAINT pk_alumno
	PRIMARY KEY (alumno_id)
 );
GO
 INSERT INTO alumno
 VALUES(1,'Adair Jesus', 'Cruz','Huitron','11-06-2007','adizunny@gmail.com');

  INSERT INTO alumno
 VALUES(1,'YAretzi', 'Castro','Días','11-06-2007','castrantediaz@gmail.com');

  SELECT *
 FROM alumno;
 DROP TABLE alumno;

 -- Con identity
 CREATE TABLE categoria(
	categoria_id INT IDENTITY(1,1),
	nombre VARCHAR(25) NOT NULL,
	activo bit NOT NULL
 );
 GO
 INSERT INTO categoria
 VALUES ('carnes frias',1);

 INSERT INTO categoria
 VALUES ('carnes frias',0);

 DROP TABLE categoria;

  CREATE TABLE categoria(
	categoria_id INT IDENTITY(1,1)
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id),
	nombre VARCHAR(25) NOT NULL UNIQUE,
	activo bit NOT NULL
 );
  INSERT INTO categoria
 VALUES ('carnes frias',1);

 INSERT INTO categoria
 VALUES ('carnes frias',0);

 DROP TABLE categoria;


   CREATE TABLE categoria(
	categoria_id INT IDENTITY(1,1)
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id),
	nombre VARCHAR(25) NOT NULL 
	CONSTRAINT uq_categoria_nombre
	-- la restriccion _ tabla _ atributo
	UNIQUE,
	activo bit NOT NULL
 );

 DROP TABLE categoria;

  CREATE TABLE categoria(
	categoria_id INT IDENTITY(1,1),
	nombre VARCHAR(25) NOT NULL,
	activo bit NOT NULL,
	CONSTRAINT pk_categoria
	PRIMARY KEY (categoria_id),
	CONSTRAINT uq_categoria_nombre
	UNIQUE (nombre)
 );
 DROP TABLE categoria;

 -- Restricción Check
 
 -- Primera forma de Construcción
 CREATE TABLE producto(
	producto_id INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL UNIQUE,
	precio DECIMAL(10,2) NOT NULL check(precio>0.0),
	-- El check es como un if
	existencia INT NOT NULL CHECK(existencia>0 AND existencia<=100),
	activo BIT NOT NULL DEFAULT 1
 );
 GO
 
 DROP TABLE producto;
 -- Segunda Froma de Construcción (Restricciones por columna=¿)
 CREATE TABLE producto(
	producto_id INT NOT NULL IDENTITY(1,1)
	CONSTRAINT pk_producto
	PRIMARY KEY,
	
	nombre VARCHAR(20) NOT NULL 
	CONSTRAINT uq_producto_nombre
	UNIQUE,

	precio DECIMAL (10,2) NOT NULL 
	CONSTRAINT ck_producto_precio
	CHECK(precio>0.0),

	existencia INT NOT NULL 
	CONSTRAINT ck_producto_existencia
	CHECK(existencia BETWEEN 1 AND 100),
	-- se explica sola
	
	tipo CHAR(1) NOT NULL 
	CONSTRAINT ck_producto_tipo
	CHECK(tipo = 'R' OR tipo ='P'),

	activo BIT NOT NULL
	CONSTRAINT df_producto_activo
	DEFAULT 1
	);

-- Tercera Forma de construcción (Al final de las instrucciones)
 DROP TABLE producto;
 -- Segunda Froma de Construcción (Restricciones por columna=¿)
 CREATE TABLE producto(
	producto_id INT NOT NULL IDENTITY(1,1),
	
	nombre VARCHAR(20) NOT NULL ,

	precio DECIMAL (10,2) NOT NULL ,

	existencia INT NOT NULL ,
	
	tipo CHAR(1) NOT NULL ,

	activo BIT NOT NULL
	CONSTRAINT df_producto_activo
	DEFAULT 1,

	-- El default siempre va en columna

	CONSTRAINT pk_producto
	PRIMARY KEY (producto_id),

	CONSTRAINT uq_producto_nombre
	UNIQUE (nombre),

	CONSTRAINT ck_producto_precio
	CHECK(precio>0.0),

	CONSTRAINT ck_producto_existencia
	CHECK(existencia BETWEEN 1 AND 100),

	CONSTRAINT ck_producto_tipo
	CHECK(tipo IN('R','P'))
	);


 INSERT INTO producto
 VALUES ('pitufo', 450, 98,DEFAULT);
 
 INSERT INTO producto
 VALUES ('Quemadita', 12, 89,DEFAULT);

 SELECT * FROM producto;

 INSERT INTO producto (nombre,existencia,precio)
 VALUES ('Pantera rosa' , 76, 123);

 TRUNCATE TABLE producto;
 -- Restricción default

 --Restricción



 --Creación de la base de datos empresa_yoda

 CREATE DATABASE empresa_yoda;
 GO

 USE empresa_yoda;
 CREATE TABLE categoria(
	categoria_id INT NOT NULL IDENTITY (1,1)
	CONSTRAINT pk_categoria
	PRIMARY KEY,
	nombre VARCHAR(20)
	CONSTRAINT uq_categoria_nombre
	UNIQUE,
	activo BIT NOT NULL
	CONSTRAINT df_categoria_activo
	DEFAULT 1
 
 );

 CREATE TABLE producto(
	producto_id INT NOT NULL,
	fabricante_id CHAR(3) NOT NULL,
	nombre VARCHAR(25) NOT NULL,
	existencia INT NOT NULL,
	precio NUMERIC(10,2) NOT NULL,
	activo BIT NOT NULL
	CONSTRAINT df_producto_activo
	DEFAULT 1,
	categoria_id INT NULL

	CONSTRAINT pk_producto
	PRIMARY KEY (producto_id,fabricante_id),

	CONSTRAINT uq_producto_nombre
	UNIQUE (nombre),

	CONSTRAINT ck_producto_existencia
	CHECK(existencia>0),

	CONSTRAINT ck_producto_precio
	CHECK(precio BETWEEN 1 AND 10000),

	CONSTRAINT fk_producto_categoria
	FOREIGN KEY(categoria_id)
	REFERENCES categoria(categoria_id)
 );
 GO

 INSERT INTO categoria(nombre)
 VALUES('Front end'),
		('Back end'),
		('Cloud');

SELECT * FROM categoria;
INSERT INTO producto
VALUES (1,'ff1','Tailwind',987.34,45,DEFAULT,1);

INSERT INTO producto
VALUES (2,'ff1','Bootstrap',567.8,24,0,1);

INSERT INTO producto
VALUES (1,'ff2','AWS',34.5,12,DEFAULT,3);


SELECT * FROM producto;

CREATE TABLE  proveedor(
	proveedor_id INT NOT NULL
	CONSTRAINT pk_proovedor
	PRIMARY key,
	empresa varchar(30) NOT NULL,
	direccion VARCHAR(60),
	limite_credito DECIMAL(10,2) NOT NULL);


CREATE TABLE contracto_proveedor(
	contacto_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL,
	apellido_paterno VARCHAR(25) NOT NULL,
	apellido_materno VARCHAR (15),
	telefono VARCHAR(15) NOT NULL,
	proveedor_id INT
	CONSTRAINT pk_contacto_proovedor
	PRIMARY KEY (contacto_id),
	CONSTRAINT kf_contacto_proovedor
	FOREIGN KEY (proveedor_id)
	REFERENCES proveedor(proveedor_id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
	);
	
INSERT INTO proveedor
VALUES (1,'patito de hule',NULL,6788.09),
	(2,'Bimbo',NULL,5678.91),
	(3,'Dulces',NULL,435.76),
	(4,'Drugs',NULL,45.99);

INSERT INTO contracto_proveedor
VALUES('maria','fidosafj','fdkjsf','fds',1),
('jaja','fidosafj','fdkjsf','fds',2),
('este','fidosafj','fdkjsf','fds',3),
('laura','fidosafj','fdkjsf','fds',2);

SELECT * FROM proveedor;
SELECT * FROM contracto_proveedor;
-- CASCADE borra padres e hijos
	

UPDATE proveedor
SET proveedor_id = 10 -- el nuevo valor
WHERE proveedor_id = 2;  --el valor actual
-- y como es cascada, actualiza las foreign 
-- de las tablas relacionadas
	
	DROP TABLE contracto_proveedor;
	DROP TABLE proveedor;

-- Integridad referencial ON DELETE Y ON UPDATE SET NULL

CREATE TABLE  proveedor(
	proveedor_id INT NOT NULL
	CONSTRAINT pk_proovedor
	PRIMARY key,
	empresa varchar(30) NOT NULL,
	direccion VARCHAR(60),
	limite_credito DECIMAL(10,2) NOT NULL);


CREATE TABLE contacto_proveedor(
	contacto_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL,
	apellido_paterno VARCHAR(25) NOT NULL,
	apellido_materno VARCHAR (15),
	telefono VARCHAR(15) NOT NULL,
	proveedor_id INT
	CONSTRAINT pk_contacto_proovedor
	PRIMARY KEY (contacto_id),
	CONSTRAINT kf_contacto_proovedor
	FOREIGN KEY (proveedor_id)
	REFERENCES proveedor(proveedor_id)
	ON DELETE SET NULL
	ON UPDATE SET NULL
	);


INSERT INTO proveedor
VALUES (1,'patito de hule',NULL,6788.09),
	(2,'Bimbo',NULL,5678.91),
	(3,'Dulces',NULL,435.76),
	(4,'Drugs',NULL,45.99);

INSERT INTO contacto_proveedor
VALUES('maria','vaca','del corral','12345',1),
('','fidosafj','fdkjsf','fds',2),
('este','fidosafj','fdkjsf','fds',3),
('laura','fidosafj','fdkjsf','fds',2);

SELECT * FROM  proveedor AS p
INNER JOIN contacto_proveedor AS cp
ON p.proveedor_id = cp.proveedor_id;

DELETE FROM proveedor
WHERE proveedor_id =2;

SELECT * FROM proveedor;
SELECT * FROM contacto_proveedor;

	DROP TABLE contacto_proveedor;
	DROP TABLE proveedor;

-- Integridad referencial ON DELETE Y ON UPDATE SET DEFAULT

CREATE TABLE  proveedor(
	proveedor_id INT NOT NULL
	CONSTRAINT pk_proovedor
	PRIMARY key,
	empresa varchar(30) NOT NULL,
	direccion VARCHAR(60),
	limite_credito DECIMAL(10,2) NOT NULL);


CREATE TABLE contacto_proveedor(
	contacto_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR(20) NOT NULL,
	apellido_paterno VARCHAR(25) NOT NULL,
	apellido_materno VARCHAR (15),
	telefono VARCHAR(15) NOT NULL,
	proveedor_id INT
	CONSTRAINT df_contacto_proveedor_proveedor_id
	DEFAULT 0,

	CONSTRAINT pk_contacto_proovedor
	PRIMARY KEY (contacto_id),
	CONSTRAINT kf_contacto_proovedor
	FOREIGN KEY (proveedor_id)
	REFERENCES proveedor(proveedor_id)
	ON DELETE SET DEFAULT
	ON UPDATE SET DEFAULT
	);



INSERT INTO proveedor
VALUES (1,'patito de hule',NULL,6788.09),
	(2,'Bimbo',NULL,5678.91),
	(3,'Dulces',NULL,435.76),
	(4,'Drugs',NULL,45.99),
	(0,'Todas Mías','engañafifas',666.69);

INSERT INTO contacto_proveedor
VALUES('maria','vaca','del corral','1232345345',1),
('asdfdas','fidosafj','fdkjsf','1234452343',2),
('este','fidosafj','fdkjsf','423523452',2),
('laura','fidosafj','fdkjsf','235423454',2);




SELECT * FROM  proveedor AS p
INNER JOIN contacto_proveedor AS cp
ON p.proveedor_id = cp.proveedor_id;

DELETE FROM proveedor
WHERE proveedor_id =2;

SELECT * FROM proveedor;
SELECT * FROM contacto_proveedor;

	DROP TABLE contacto_proveedor;
	DROP TABLE proveedor;

UPDATE contacto_proveedor
SET proveedor_id =1
WHERE proveedor_id =0;

-- TODO:  Realizar Ejercicio completo de construcción de un diagrama relacional,
-- Aplicando las restricciones y se continua con ALTER y DROP

-- Alter table
