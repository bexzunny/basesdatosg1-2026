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
- Teléfonos
- Credenciales
- Inscripciones de materias (Cursa)
- Materias
- Profesores
- Dependientes de profesores
- Departamentos
- Participación en proyectos
- Proyectos

Permite controlar de manera integral el historial académico de los estudiantes, la asignación de credenciales institucionales, la plantilla docente distribuida por departamentos, sus dependientes económicos y la asignación laboral en proyectos de investigación o desarrollo.

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
| Matricula | VARCHAR | 15 | PK, NN | Matrícula única e institucional asignada al estudiante. |
| Nombre | VARCHAR | 50 | NN | Nombre o nombres de pila del alumno. |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido (paterno) del alumno. |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido (materno) del alumno. |
| Carrera | VARCHAR | 50 | NN | Carrera profesional a la que pertenece el alumno. |
| Fechanaci | DATE | - | NN | Fecha de nacimiento del alumno. |

## Tabla: TELEFONO

**Descripción**

Almacena los números de contacto telefónico asociados a cada estudiante matriculado.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Idtelefono | INT | - | PK, NN | Identificador único del registro telefónico. |
| Matricula | VARCHAR | 15 | FK, NN | Referencia de la matrícula del alumno propietario del número. |
| Telefono | VARCHAR | 20 | NN | Número telefónico de contacto. |

## Tabla: CREDENCIAL

**Descripción**

Registra los datos de emisión, vigencia y control de las credenciales de identificación estudiantil.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numcredencial | INT | - | PK, NN | Número identificador único de la credencial física. |
| Matricula | VARCHAR | 15 | FK, UQ, NN | Vinculo directo con la matrícula del alumno asignado. |
| Fechains | DATE | - | NN | Fecha de expedición o alta del documento de identidad. |
| Vigencia | DATE | - | NN | Fecha límite de validez de la credencial. |

## Tabla: CURSA

**Descripción**

Tabla asociativa que detalla la inscripción y rendimiento definitivo de los alumnos en sus materias correspondientes.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Matricula | VARCHAR | 15 | PK, FK1, NN | Parte de la PK; vincula la matrícula del estudiante inscrito. |
| Clavemateria | INT | - | PK, FK2, NN | Parte de la PK; vincula el código de la materia cursada. |
| Fechainsc | DATE | - | NN | Fecha formal en que se dio de alta la materia. |
| Califfinal | DECIMAL(4,2) | - | NULL | Calificación o nota final obtenida en el curso. |

## Tabla: MATERIA

**Descripción**

Catálogo oficial de las asignaturas estructuradas en los planes de estudio institucionales.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Clavemateria | INT | - | PK, NN | Identificador numérico único de la materia. |
| Numprof | INT | - | FK, UQ, NN | Código del profesor titular que imparte de forma exclusiva la materia. |
| Nombremat | VARCHAR | 100 | NN | Nombre descriptivo oficial de la asignatura. |
| Creditos | INT | - | NN | Valor o carga crediticia del curso. |

## Tabla: PROFESOR

**Descripción**

Catálogo general de los docentes que integran la planta académica de la institución.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numprof | INT | - | PK, NN | Número de empleado o ficha identificativa del profesor. |
| Numdep | INT | - | FK, NN | Código del departamento de adscripción institucional. |
| nombre | VARCHAR | 50 | NN | Nombre o nombres de pila del profesor. |
| ap1 | VARCHAR | 50 | NN | Primer apellido (paterno) del docente. |
| ap2 | VARCHAR | 50 | NULL | Segundo apellido (materno) del docente. |

## Tabla: DEPARTAMENTO

**Descripción**

Unidades académicas y operativas que organizan las diversas áreas del conocimiento.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numdepto | INT | - | PK, NN | Código numérico identificador del departamento. |
| Edificio | VARCHAR | 50 | NN | Nombre o bloque estructural donde se ubica el departamento. |
| Nombre | VARCHAR | 100 | NN | Nombre oficial de la división departamental. |

## Tabla: DEPENDIENTE

**Descripción**

Entidad dependiente que registra los familiares directos de los docentes amparados bajo seguros o prestaciones.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Nombre | VARCHAR | 50 | PK, NN | Nombre propio del familiar; parte de la PK compuesta. |
| Numprof | INT | - | PK, FK, NN | Código del profesor del cual depende; parte de la PK compuesta. |
| Fechanac | DATE | - | NN | Fecha de nacimiento completa del dependiente. |
| PArentesco | VARCHAR | 30 | NN | Tipo de lazo familiar con el docente (Cónyuge, Hijo, etc.). |

## Tabla: PARTICIPA

**Descripción**

Registro histórico y de control sobre los proyectos donde colabora el personal docente.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numproy | INT | - | PK, FK1, NN | Código del proyecto de asignación; compone la PK. |
| Numprof | INT | - | PK, FK2, NN | Código del profesor participante; compone la PK. |
| Rol | VARCHAR | 50 | NN | Función o cargo desempeñado por el docente dentro del proyecto. |
| Fechainicio | DATE | - | NN | Fecha oficial de incorporación al equipo de trabajo. |

## Tabla: Proyecto

**Descripción**

Catálogo operativo de proyectos institucionales de investigación o gestión técnica.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numproy | INT | - | PK, NN | Identificador de control numérico único del proyecto. |
| Nombreproy | VARCHAR | 100 | NN | Título o nombre formal de la investigación. |
| Presupuesto | DECIMAL(12,2) | - | NN | Recursos financieros asignados para el desarrollo del proyecto. |

--

5. Relaciones del sistema

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Alumno -> Telefono | 1:N | Un alumno puede asociar varios números de teléfono móvil o fijo. |
| Alumno -> Credencial | 1:1 | Un alumno posee una única credencial de estudiante válida. |
| Alumno -> Cursa | 1:N | Un estudiante puede cursar y matricularse en diversas asignaturas. |
| Materia -> Cursa | 1:N | Una asignatura puede ser cursada por una lista de varios alumnos. |
| Profesor -> Materia | 1:1 | Un profesor se asigna como titular exclusivo de una materia en este diseño. |
| Departamento -> Profesor | 1:N | Un departamento cobija e integra a múltiples profesores. |
| Profesor -> Dependiente | 1:N | Un profesor puede tener múltiples beneficiarios económicos directos. |
| Profesor -> Participa | 1:N | Un profesor puede colaborar activamente en diferentes proyectos simultáneos. |
| Proyecto -> Participa | 1:N | Un proyecto agrupa las actividades de múltiples docentes del plantel. |

6. Matriz de claves franeas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| TELEFONO | Matricula | ALUMNO(Matricula) |
| CREDENCIAL | Matricula | ALUMNO(Matricula) |
| CURSA | Matricula | ALUMNO(Matricula) |
| CURSA | Clavemateria | MATERIA(Clavemateria) |
| MATERIA | Numprof | PROFESOR(Numprof) |
| PROFESOR | Numdep | DEPARTAMENTO(Numdepto) |
| DEPENDIENTE | Numprof | PROFESOR(Numprof) |
| PARTICIPA | Numproy | Proyecto(Numproy) |
| PARTICIPA | Numprof | PROFESOR(Numprof) |

7. Integridad Referencial

| Código | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un teléfono si la matrícula del estudiante no existe en el sistema. |
| IR-02 | No se puede emitir una credencial ligada a un código de matrícula inexistente. |
| IR-03 | No se puede inscribir o calificar un curso en la tabla `CURSA` si el alumno o la materia no son válidos. |
| IR-04 | No se puede vincular un profesor como titular de materia si no se encuentra dado de alta en la planta docente. |
| IR-05 | No se puede dar de alta un profesor dentro de un código de área departamental que no exista. |
| IR-06 | No se permite dar de alta dependientes si el código del docente asociado no coincide con un registro real. |
| IR-07 | No se puede registrar una participación en un proyecto si el identificador del proyecto o el del profesor no existen. |

8. Reglas del negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un estudiante se identifica de forma única bajo su matrícula institucional de control. |
| RN-02 | Una credencial pertenece de forma estricta y exclusiva a un único alumno registrado. |
| RN-03 | Un profesor está adscrito únicamente a un departamento matriz dentro de la organización de la escuela. |
| RN-04 | Cada materia cuenta únicamente con un profesor titular a cargo de su impartición. |
| RN-05 | Los dependientes económicos no pueden persistir en el sistema de seguros si el profesor titular es dado de baja. |
| RN-06 | Un proyecto puede operar con un presupuesto asignado el cual debe ser un monto financiero definido. |