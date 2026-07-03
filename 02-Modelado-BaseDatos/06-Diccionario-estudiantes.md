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
- Alumnos
- Materias
- Inscripciones

Permite controlar el registro de estudiantes, el catálogo de asignaturas académicas ofertadas y el proceso de inscripción junto con las calificaciones obtenidas en cada materia.

3. Catalogo de Restricciones utilizados

| Código | Significado |
| :--- | :--- |
| PK | Primary key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |

4 Diccionario de Datos

## Tabla: ALUMNO

**Descripción**

Almacena la información de control escolar e identificativos de los estudiantes matriculados.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Idalumno | INT | - | PK, NN | Identificador único del alumno. |
| Matricula | VARCHAR | 15 | UQ, NN | Código único asignado por la institución al estudiante. |
| Nombre | VARCHAR | 50 | NN | Nombre o nombres de pila del alumno. |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido (paterno) del alumno. |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido (materno) del alumno. |
| Semestre | INT | - | NN | Ciclo escolar o nivel actual en el que cursa el estudiante. |

## Tabla: MATERIA

**Descripción**

Catálogo general de las asignaturas académicas disponibles en el plan de estudios.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Idmateria | INT | - | PK, NN | Identificador único de la materia. |
| Nombre | VARCHAR | 100 | NN | Nombre oficial de la asignatura. |
| Creditos | INT | - | NN | Valor o peso académico otorgado al aprobar la materia. |

## Tabla: INSCRIPCION

**Descripción**

Tabla asociativa que desglosa las materias cursadas por cada estudiante y sus respectivas calificaciones.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Idalumno | INT | - | PK, FK1, NN | Identificador del alumno; parte de la PK compuesta y llave foránea hacia ALUMNO. |
| Idmateria | INT | - | PK, FK2, NN | Identificador de la materia; parte de la PK compuesta y llave foránea hacia MATERIA. |
| Fechains | DATE | - | NN | Fecha exacta en la que se formalizó la inscripción a la materia. |
| Calificacion | DECIMAL(4,2) | - | NULL | Nota numérica definitiva obtenida por el alumno en la materia. |

--

5. Relaciones del sistema

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Alumno -> Inscripción | 1:N | Un alumno puede registrarse en una o múltiples inscripciones de materias. |
| Materia -> Inscripción | 1:N | Una materia puede estar presente en múltiples inscripciones de distintos alumnos. |

6. Matriz de claves franeas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| INSCRIPCION | Idalumno | ALUMNO(Idalumno) |
| INSCRIPCION | Idmateria | MATERIA(Idmateria) |

7. Integridad Referencial

| Código | Regla |
| :--- | :--- |
| IR-01 | No se puede inscribir un alumno inexistente. |
| IR-02 | No se puede generar una inscripción para una materia que no exista en el catálogo. |

8. Reglas del negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un alumno puede tener varias inscripciones. |
| RN-02 | Una materia puede estar en varias inscripciones. |
| RN-03 | Una inscripción pertenece exactamente a un alumno y a una materia. |
| RN-04 | Un alumno no puede inscribirse más de una vez en la misma materia dentro del mismo ciclo (Garantizado por la PK compuesta). |