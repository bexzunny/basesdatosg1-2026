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
- Profesores
- Cursos (Materias)

Permite controlar la oferta académica de la institución, la asignación de la carga docente y la estructura de créditos de las materias disponibles.

3. Catalogo de Restricciones utilizados

| Código | Significado |
| :--- | :--- |
| PK | Primary key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |
| CK | Check |

4 Diccionario de Datos

## Tabla: PROFESOR

**Descripción**

Instancia del catálogo que almacena la información de los docentes contratados por la universidad.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Idprofesor | INT | - | PK, AI, NN | Identificador único e de cada profesor. |
| Nombre | VARCHAR | 50 | NN | Nombre(s) de pila del docente. |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido (paterno) del docente. |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido (materno) del docente. |
| Especialidad | VARCHAR | 100 | NN | Área de conocimiento o disciplina principal del profesor. |

## Tabla: CURSO

**Descripción**

Catálogo de las asignaturas académicas ofertadas por la institución.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Idcurso | INT | - | PK, AI, NN | Identificador único numérico del curso. |
| Nombre | VARCHAR | 100 | NN | Nombre oficial de la asignatura. |
| Creditos | INT | - | NN, CK(>0) | Valor o peso académico de la materia en el plan de estudios. |
| Idprofesor | INT | - | FK, NN | Clave foránea que asocia el curso con su profesor asignado. |

--

5. Relaciones del sistema

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Profesor -> Curso | 1:N | Un profesor puede impartir varios cursos |
| Curso -> Profesor | 1:1 | Un curso solamente puede ser impartido por un profesor |

6. Matriz de claves franeas

| Tabla | Campo FK | Referencia