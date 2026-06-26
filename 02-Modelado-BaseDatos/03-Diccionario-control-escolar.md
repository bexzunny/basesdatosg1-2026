# Diccionario de Datos de la base de datos de Control Escolar

1. Información General:

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Control Escolar |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboro | Ing. Adair Jesús Cruz Huitrón |
| SGBD | SQLServer |

2. Descripción del Sistema de Base de Datos

El sistema administra:
- Carreras
- Alumnos
- Profesores
- Materias
- Grupos
- Descripciones

Permite controlar la oferta académica y la inscripción de estudiantes.

3. Catalogo de Restricciones utilizados

| Código | Significado |
| :--- | :--- |
| PK | Primary key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |

4 Diccionario de Datos

## Tabla: Carrera

**Descripción**

Almacena las carreras ofertadas por la universidad

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Id_carrera | INT | - | PK, AI, NN |Identificador único de la carrera |
| nombre | VARCHAR | 100 | UQ,NN | Nombre de la carrera |
| Duracion_cuatri | INT | - | NN, CK(>0) | Nombre de la carrera |


## Tabla: Alumno

**Descripción**

Almacena las carreras ofertadas por la universidad

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Id_alumno | INT | - | PK, AI, NN |Identificador único del alumno |
| matricula | VARCHAR | 10 | UQ, NN | MAtrícula institucional |
| apellido_paterno | VARCHAR | 50 | NN | Apellido paterno |
| apellido_materno | VARCHAR | 50 | NULL | Apellido materno |
| correo | VARCHAR | 100 | UQ, NN | Correo institucional |
| fecha_nacimiento | DATE | - | NN | Fecha de nacimiento |
| id_carrera | iNT | - | FK, NN | Clave foranea  |


--

5. Relaciones del sistema


| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| carrera -> Alumno | 1:N | Una carrera tiene muchos alumnos |
| carrera -> Materia | 1:N | Una carrera tiene muchas materias |
| Profesor -> Grupo | 1:N | Un profesor puede impartir varios grupos |
| Materia -> Grupo | 1:N | Una materia puede impartir varios grupos |
| Alumno -> Inscripción | 1:N | Un alumno puede tener varias inscripciones |
| Grupo -> Inscripción | 1:N | Un grupo puede tener varios alumnos |

6. Matriz de claves franeas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Alumno | id_carrera | Carrera(id_carrera) |
| Materia | id_carrera | Carrera(id_carrera) |
| Grupo | id_profesor | Profesor(id_profesor) |
| Grupo | id_materia | Materia(if_materia) |
| Inscripción | id_alumno | Alumno(id_alumno) |
| Inscripción | id_grupo | Grupo(id_grupo) |

7. Integridad Referencial

| Código | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un alumno con una carrera inexistente |
| IR-02 | No se puede crear un grupo para una materia inexistente |
| IR-03 | No se puede crear un grupo para un profesor inexistente |
| IR-04 | No se puede inscribir un alumno en un grupo inexistente |
| IR-05 | No se puede eliminar una carrera que tenga alumnos asociados sin antes reasignarlos o eliminarlos |

8. Reglas del negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un alumno pertenece a una sola carrera |
| RN-02 | Una carrera puede tener muchos alumnos |
| RN-03 | Una carrera puede tener muchas materias |
| RN-04 | Un progesor puede impartir varios grupos |
| RN-05 | Un grupo solo puede tener un profesor asignado |
| RN-06 | La calificación debe estar entre 0.0 y 10.0 |