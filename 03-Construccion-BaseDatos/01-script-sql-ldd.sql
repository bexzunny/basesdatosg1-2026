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