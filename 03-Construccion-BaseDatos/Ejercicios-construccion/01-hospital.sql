-- Crear la base de datos
CREATE DATABASE hospital;
GO

-- Usar la base de datos
USE hospital;
GO

-- Crear la tacla paciente
CREATE TABLE paciente(
	paciente_id INT NOT NULL IDENTITY(1,1),
	nombre VARCHAR (30) NOT NULL,
	apellido_p VARCHAR(20) NOT NULL,
	apellido_m VARCHAR(20),
	fecha_naci DATE NOT NULL

	-- pk de la tabla paciente
	CONSTRAINT pk_paciente
	PRIMARY KEY (paciente_id),
);

CREATE TABLE expediente(
	expediente_id INT NOT NULL IDENTITY(1,1),
	fecha_apertura DATE NOT NULL,
	tipo_sangre VARCHAR (3) NOT NULL,
	paciente_id INT NOT NULL,

	-- pk de la tabla expediente
	CONSTRAINT pk_expediente
	PRIMARY KEY (expediente_id),

	-- uq de paciente_id
	CONSTRAINT uq_expediente_paciente_id
	UNIQUE (paciente_id),

	-- fk de paciente_id -> paciente
	CONSTRAINT fk_expediente_paciente
	FOREIGN KEY (paciente_id)
	REFERENCES paciente(paciente_id)
);