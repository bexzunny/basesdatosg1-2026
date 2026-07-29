-- Crear la base de datos
CREATE DATABASE empresa_departamental;
GO

USE empresa_departamental;
GO

CREATE TABLE locacion(
	locacion_id INT NOT NULL IDENTITY(1,1),
	number_dep INT NOT NULL,
	nombre VARCHAR(100) NOT NULL,

	CONSTRAINT pk_locacion
	PRIMARY KEY (locacion_id)
);
GO
-- después se incluye la fk

CREATE TABLE departament(
	number_dep INT NOT NULL,
name_dep VARCHAR (20) NOT NULL,
	manager CHAR(15) NOT NULL,
	startdate DATE,

	CONSTRAINT pk_departament
	PRIMARY KEY (number_dep)
);
GO
-- después se incluye la fk de manager


ALTER TABLE locacion
ADD CONSTRAINT fk_locacion_departament
FOREIGN KEY (number_dep)
REFERENCES departament(number_dep);
GO

CREATE TABLE project(
	numberpr INT NOT NULL IDENTITY(1,1),
	namepr VARCHAR(100) NOT NULL,
	locacion VARCHAR(100) NOT NULL,
	number_dep INT NOT NULL,

	CONSTRAINT pk_project
	PRIMARY KEY (numberpr),

	CONSTRAINT uq_project_namepr
	UNIQUE (namepr),

	CONSTRAINT fk_project_departament
	FOREIGN KEY (number_dep)
	REFERENCES departament(number_dep)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);
GO

CREATE TABLE works_for(
	employee_id INT NOT NULL,
	numberpr INT NOT NULL ,
	horas INT NOT NULL,

	CONSTRAINT pk_works_for
	PRIMARY KEY (employee_id,numberpr),

	CONSTRAINT ck_works_for_horas
	CHECK(horas>0),

	CONSTRAINT fk_works_for_project
	FOREIGN KEY (numberpr)
	REFERENCES project(numberpr)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);
GO

CREATE TABLE employee(
employee_id INT NOT NULL,
	ssd CHAR(15) NOT NULL,
	number_dep INT NOT NULL,
	boss INT,
	nombre VARCHAR(30) NOT NULL,
	apellido_p VARCHAR(20) NOT NULL,
	apellido_m VARCHAR(20) NULL,
	birthday DATE NOT NULL,
	sex VARCHAR(9) NOT NULL,
	addres VARCHAR(50) NOT NULL,

	CONSTRAINT pk_employee
	PRIMARY KEY (employee_id),

	CONSTRAINT fk_employee_employee
	FOREIGN KEY (boss)
	REFERENCES employee(employee_id)
	ON DELETE NO ACTION
	ON UPDATE NO ACTION,

	CONSTRAINT fk_employee_departament
	FOREIGN KEY (number_dep)
	REFERENCES departament(number_dep)

);
GO

ALTER TABLE works_for
ADD CONSTRAINT fk_works_for_employee
FOREIGN KEY (employee_id)
REFERENCES employee(employee_if);
GO

ALTER TABLE departament
ADD CONSTRAINT fk_departament_employee
FOREIGN KEY (manager)
REFERENCES employee(employee_id);
GO

CREATE TABLE dependiente(
   employee_id INT NOT NULL,
	ssn CHAR(15) NOT NULL,
	nombre VARCHAR(30) NOT NULL,
	apellido_p VARCHAR(20) NOT NULL,
	apellido_m VARCHAR(20) NULL,
	locacion VARCHAR(100) NOT NULL,
	sex VARCHAR(9) NOT NULL,
	birthday DATE NOT NULL,
	parentesco VARCHAR(20),

	CONSTRAINT pk_dependiente
	PRIMARY KEY (employee_id,ssn),

	CONSTRAINT fk_dependiente_employee
	FOREIGN KEY (employee_id)
	REFERENCES employee(employee_id)
	ON DELETE CASCADE
	ON UPDATE CASCADE
);