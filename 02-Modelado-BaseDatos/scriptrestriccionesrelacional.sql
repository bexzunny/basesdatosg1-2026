-- Comentario: Crear base de datos
create database bdconstraint;
go

-- Usar la base de datos
use bdconstraint;
go

-- Razón de Cardinalidad 1:1

-- Crear tabla Paciente
CREATE TABLE paciente(
	Idpaciente INT NOT NULL,
	Nombre VARCHAR (40) NOT NULL,
	Apellido1 VARCHAR (20) NOT NULL,
	Apellido2 VARCHAR (20),
	Fechanaci Date NOT NULL,
	CONSTRAINT pk_paciente
	PRIMARY KEY (Idpaciente)
);
GO
	
CREATE TABLE expediente(
	Idexp INT NOT NULL PRIMARY KEY,
	Fechaapertura DATE NOT NULL,
	Tiposangre CHAR(3) NULL,
	Idpaciente INT NOT NULL,
	CONSTRAINT unique_idpaciente
	UNIQUE(Idpaciente),
	CONSTRAINT fk_expediente_paciente
	FOREIGN KEY (Idpaciente) -- La foreign key
	REFERENCES paciente(Idpaciente) --tabla paciente
);
GO

-- Datos para las tablas
INSERT INTO paciente
VALUES(1, 'Adair Jesús', 'Cruz', 'Huitrón','1995-03-21');

INSERT INTO paciente
VALUES(2, 'Yaretzi', 'Castro', 'Díaz','2007-05-28');

INSERT INTO paciente
VALUES(3, 'Emnrique Samuel', 'Mendieta', 'Dominguez','2007-08-31');

INSERT INTO paciente
VALUES (4, 'Kislev Soleani', 'Alvarado','Hernández')

-- INSERTAR EXPEDIENTES
INSERT INTO expediente
VALUES (1,GETDATE(),'A+',1),
		(2,GETDATE(),'O+',2);

SELECT GETDATE()
Select * from paciente;