/*
	Alumno: Adair Jesús Cruz Huitrón
	Fecha: 05/08/2026
	Horas de sueño: 5
*/
CREATE DATABASE movimiento_vital;
GO

USE movimiento_vital;
GO


--++++++++++++++++++++++
-- Creación de las tablas

-- Creación de la tabla paciente
CREATE TABLE paciente(
	paciente_id INT IDENTITY (1,1),
	numero_expediente VARCHAR(16) NOT NULL,
	nombre NVARCHAR(120) NOT NULL,
	correo VARCHAR(120) NOT NULL,
	telefono VARCHAR(20) NULL,
	fecha_nacimiento DATE,
	
	fecha_registro DATETIME2
	CONSTRAINT df_paciente_fecha_registro
	DEFAULT SYSDATETIME(),
	
	activo BIT
	CONSTRAINT df_paciente_activo
	DEFAULT 1,

	CONSTRAINT pk_paciente
	PRIMARY KEY (paciente_id),

	CONSTRAINT uq_paciente_numero_expediente
	UNIQUE (numero_expediente),

	CONSTRAINT uq_paciente_correo
	UNIQUE (correo),
);

-- Creación de la tabla fisioterapeuta
CREATE TABLE fisioterapeuta(
	fisioterapeuta_id INT IDENTITY (1,1),
	cedula_profesional VARCHAR(20)NOT NULL,
	nombre NVARCHAR(120),
	correo VARCHAR(120)NOT NULL,
	especialidad NVARCHAR(80),
	
	activo BIT
	CONSTRAINT df_fisioterapeuta_activo
	DEFAULT 1,

	CONSTRAINT pk_fisioterapeuta
	PRIMARY KEY (fisioterapeuta_id),

	CONSTRAINT uq_fisioterapeuta_cedula_profesional
	UNIQUE (cedula_profesional),

	CONSTRAINT uq_fisioterapeuta_correo
	UNIQUE (correo)
);

-- Creación de la tabla plan_tratemiento
CREATE TABLE plan_tratamiento(
	plan_id INT IDENTITY (1,1),
	paciente_id INT,
	fisioterapeuta_responsable_id INT,
	diagnostico NVARCHAR(250),
	fecha_inicio DATE,
	fecha_fin DATE NOT NULL,
	numero_sesiones INT,
	costo_total DECIMAL(10,2),
	estado VARCHAR(12)
	CONSTRAINT df_plan_tratamiento_estado
	DEFAULT ('Activo'),

	CONSTRAINT pk_plan_tratamiento
	PRIMARY KEY (plan_id),

	CONSTRAINT fk_plan_tratamiento_paciente
	FOREIGN KEY (paciente_id)
	REFERENCES paciente(paciente_id)
	ON DELETE NO ACTION,

	CONSTRAINT fk_plan_tratamiento_fisioterapeuta
	FOREIGN KEY (fisioterapeuta_responsable_id)
	REFERENCES fisioterapeuta(fisioterapeuta_id)
	ON DELETE NO ACTION,


	CONSTRAINT ck_plan_tratamiento_numero_sesiones
	CHECK(numero_sesiones>0),

	CONSTRAINT ck_plan_tratamiento_costo_total
	CHECK(costo_total>0),

	CONSTRAINT ck_plan_tratamiento_fecha_fin
	CHECK(fecha_fin>fecha_inicio),

	CONSTRAINT ck_plan_tratamiento_estado
	CHECK (estado IN ('Activo','Pausado','Concluido','Cancelado'))


);

-- Creación de la tabla cita
CREATE TABLE cita(
	cita_id INT IDENTITY (1,1),
	plan_id INT,
	fisioterapeuta_id INT,
	fecha_hora DATETIME2,
	duracion_minutos INT,
	estado VARCHAR(12)
	CONSTRAINT df_cita_estado
	DEFAULT ('Programada'),
	observaciones NVARCHAR(250) NULL,

	CONSTRAINT pk_cita
	PRIMARY KEY (cita_id),

	CONSTRAINT fk_cita_plan_tratamiento
	FOREIGN KEY (plan_id)
	REFERENCES plan_tratamiento(plan_id)
	ON DELETE CASCADE,

	CONSTRAINT fk_cita_fisioterapeuta
	FOREIGN KEY (fisioterapeuta_id)
	REFERENCES fisioterapeuta(fisioterapeuta_id),

	CONSTRAINT ck_cita_duracion_minutos
	CHECK(duracion_minutos>0),

		CONSTRAINT ck_cita_estado
	CHECK (estado IN ('Programada','Realizada','Cancelada'))
);

-- Creación de la tabla evolución
CREATE TABLE evolucion(
	evolucion_id INT IDENTITY (1,1),
	cita_id INT,
	fisioterapeuta_id INT NULL,
	nivel_dolor INT NULL,
	descripcion NVARCHAR(350),
	fecha_registro DATETIME2
	CONSTRAINT df_evoluvion_fecha_registro
	DEFAULT SYSDATETIME(),
	nota_temporal NVARCHAR(100),

	CONSTRAINT pk_evolucion
	PRIMARY KEY(evolucion_id),

	CONSTRAINT fk_evolucion_cita
	FOREIGN KEY (cita_id)
	REFERENCES cita(cita_id)
	ON DELETE CASCADE,

	CONSTRAINT fk_evolucion_fisioterapeuta
	FOREIGN KEY (fisioterapeuta_id)
	REFERENCES fisioterapeuta(fisioterapeuta_id)
	ON DELETE SET NULL,

	CONSTRAINT ck_evolucion_nivel_dolor
	CHECK (nivel_dolor BETWEEN 0 AND 10)
);

-- +++++++++++++++++++++++++
-- Modificaciones con alter
-- añadir cita y que sea presencial de default
ALTER TABLE cita
ADD modalidad VARCHAR(12) NOT NULL 
CONSTRAINT df_cita_modalidad
DEFAULT ('Presencial');

-- cambiar el lenght de teléfono a 25
ALTER TABLE paciente
ALTER COLUMN telefono VARCHAR(25);


-- Eliminar nota_temporal
ALTER TABLE evolucion
DROP COLUMN nota_temporal;