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