-- Crear base de datos pruebag1

-- Crea la base de datos (SQL-LDD)
create database prueba1;

-- Usamos la base de datos
use prueba1;

-- Crear una tabla (SQL-LDD)
create table alumno(
id int NOT NULL,
nombre VARCHAR(20) not NULL,
edad int not null,
matricula int not null,
direccion varchar(30) null,
CONSTRAINT pk_alumno
PRIMARY key(id),
CONSTRAINT UNIQUE_matricula
unique (matricula)
);

-- Poblar la tabla con 2 alumnos (SQL-LMD)
insert into alumno (id,nombre,edad,matricula,direccion)
values(1,'ARCADIA',65,123456,'Calle del infierno'),
(2,'Adair',18,123987,'Cardonal');

--Seleccionar los alumnos
select * from alumno;

-- Cambiar el nombre de arcadia a cami (SQL-LMD)
update alumno set nombre = 'cami'
where id = 1;






create DATABASE pruebaatributos;

CREATE TABLE alumno(
num_alumno int not null PRIMARY KEY,
nombre VARCHAR(50) not null,
apellido1 VARCHAR(30) not null,
apellido2 VARCHAR(30) NULL,
fecha_naci date not null
);


nsert into alumno
VALUES(1,'Angel Patricio','Perez','Hernández','1998-07-08');


insert into alumno
VALUES(2,'Ian uriel','Zuñiga',NULL,'2007-07-25');

select * from alumno;

select 
	nombre,apellido1,apellido2,
	YEAR(fecha_naci),
	MONTH(fecha_naci),
	DAY(fecha_naci),
	Datediff(year,fecha_naci,getdate()) as edad
from alumno;