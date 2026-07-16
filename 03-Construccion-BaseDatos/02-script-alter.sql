
USE pruebaatributos;
GO

SELECT * FROM alumno;

TRUNCATE TABLE alumno;

-- Muestra los datos de una tabla
SELECT
	COLUMN_NAME
	DATA_TYPE,
	CHARACTER_MAXIMUM_LENGTH,
	IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME ='alumno';

-- Agregar una columna

ALTER TABLE alumno
ADD telefono VARCHAR(20) NOT NULL;

-- Argegar mas de una columna
ALTER TABLE alumno
ADD
curp VARCHAR (18),
matricula VARCHAR (13) NOT NULL;

-- Modificar un tipo de dato
ALTER TABLE alumno
ALTER COLUMN telefono VARCHAR (30);
GO

-- Agregar restricciones
-- Primary key

-- Crea una tabla con 0 registros a partir de otra
SELECT TOP  0 * 
INTO alumno2
FROM alumno;

SELECT * FROM alumno2;


-- ESta consulta obtiene los nombres de las restricciones
-- Y su tipo de una tabla específica
SELECT 
o.name AS nombre_restriccion,
o.type_desc AS tipo_restriccion
FROM
sys.objects AS o 
WHERE o.parent_object_id = OBJECT_ID('alumno2')
AND o.type IN ('PK','F','UQ','C','D')
ORDER BY O.type_desc;


-- Muestra los datos de una tabla
SELECT
	COLUMN_NAME
	DATA_TYPE,
	CHARACTER_MAXIMUM_LENGTH,
	IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME ='alumno2';

ALTER TABLE alumno2
ADD CONSTRAINT pk_alumno2
PRIMARY KEY (num_alumno);

-- Crear una tabla para la foreign key

CREATE TABLE carrera(
carrera_id INT NOT NULL IDENTITY (1,1)
CONSTRAINT pk_carrera
PRIMARY KEY,
nombre VARCHAR(25) NOT NULL
);

ALTER TABLE alumno2
ADD carrera_id INT;

ALTER TABLE alumno2
ADD CONSTRAINT kd_alumno2_carrera
FOREIGN KEY (carrera_id)
REFERENCES carrera(carrera_id)
ON DELETE CASCADE
ON UPDATE NO ACTION;

-- Agregar un check

ALTER TABLE alumno2
ADD CONSTRAINT ck_alumno2_telefono
CHECK (telefono LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');

--AGREGAR UN DEFAULT

ALTER TABLE alumno2
ADD activo BIT NOT NULL;

ALTER TABLE alumno2
ADD CONSTRAINT df_alumno2_activo
DEFAULT 1
FOR activo;

--UNIQUE
ALTER TABLE alumno2
ADD CONSTRAINT uq_alumno2_matricula
UNIQUE(matricula);

--Eliminar restricciones
SELECT 
o.name AS nombre_restriccion,
o.type_desc AS tipo_restriccion
FROM
sys.objects AS o 
WHERE o.parent_object_id = OBJECT_ID('alumno2')
AND o.type IN ('PK','F','UQ','C','D')
ORDER BY O.type_desc;


-- ELIMINAR FOREIGN KEY
ALTER TABLE alumno2
DROP CONSTRAINT kd_alumno2_carrera;

-- Eliminar PRIMARY KEY

ALTER TABLE alumno2
DROP CONSTRAINT pk_alumno2;

ALTER TABLE carrera
DROP CONSTRAINT pk_carrera;

-- Eliminar los unique
ALTER TABLE alumno2
DROP CONSTRAINT uq_alumno2_matricula;

--Eliminar check

ALTER TABLE alumno2
DROP CONSTRAINT ck_alumno2_telefono;

--eLIMINAR UNA columna

ALTER TABLE alumno2
DROP COLUMN matricula;

-- DROP

--Elimina objetos

--Eliminar la tabla alumno2
DROP TABLE alumno2;

--Eliminar más de una tabla a la vez
DROP TABLE alumno,carrera;

-- Base de datos
use master;

IF DB_ID('pruebaatributos') IS NOT NULL
BEGIN 
	DROP DATABASE pruebaatributos;
END