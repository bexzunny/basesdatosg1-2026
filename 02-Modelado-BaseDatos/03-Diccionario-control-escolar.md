# Diccionario de Datos de la base de datos de Control Escolar

1. Información General:

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Control Escolar |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboro | Adair Jesús Cruz Huitrón |
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

## Modelo Relacional



# Diccionario de Datos de la Base de Datos de Expedientes Médicos

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Expedientes Médicos |
| Versión | 1.0 |
| Fecha | Julio 2026 |
| Elaboró | Adair Jesús Cruz Huitrón |
| SGBD | SQL Server |

---

## 2. Descripción del Sistema de Base de Datos

El sistema administra:
- Pacientes
- Expedientes médicos

Permite registrar la información personal de los pacientes y administrar su expediente médico, manteniendo una relación uno a uno entre ambos.

---

## 3. Catálogo de Restricciones Utilizadas

| Código | Significado |
| :--- | :--- |
| PK | Primary Key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |
| AI | Auto Increment |

---

## 4. Diccionario de Datos

### Tabla: Paciente

**Descripción**

Almacena la información personal de los pacientes registrados.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NoPaciente | INT | - | PK, AI, NN | Identificador único del paciente. |
| Nombre | VARCHAR | 60 | NN | Nombre del paciente. |
| Ap1 | VARCHAR | 50 | NN | Primer apellido del paciente. |
| Ap2 | VARCHAR | 50 | NULL | Segundo apellido del paciente. |
| FechaNaci | DATE | - | NN | Fecha de nacimiento del paciente. |

### Tabla: Expediente

**Descripción**

Almacena la información del expediente médico de cada paciente.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| NoExp | INT | - | PK, AI, NN | Identificador único del expediente. |
| NoPaciente | INT | - | FK, UQ, NN | Identificador del paciente al que pertenece el expediente. |
| FechaApertura | DATE | - | NN | Fecha de apertura del expediente médico. |
| TipoSangre | VARCHAR | 5 | NN | Tipo de sangre del paciente. |

---

## 5. Relaciones del Sistema

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Paciente → Expediente | 1:1 | Cada paciente tiene un único expediente y cada expediente pertenece a un solo paciente. |

---

## 6. Matriz de Claves Foráneas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| Expediente | NoPaciente | Paciente(NoPaciente) |

---

## 7. Integridad Referencial

| Código | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un expediente para un paciente inexistente. |
| IR-02 | No se puede eliminar un paciente mientras exista un expediente asociado. |
| IR-03 | Cada expediente debe estar asociado obligatoriamente a un paciente válido. |

---

## 8. Reglas del Negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Cada paciente debe tener un único expediente médico. |
| RN-02 | Cada expediente pertenece únicamente a un paciente. |
| RN-03 | No puede existir más de un expediente para un mismo paciente. |
| RN-04 | La fecha de apertura del expediente debe ser igual o posterior a la fecha de nacimiento del paciente. |
| RN-05 | El tipo de sangre debe registrarse con un valor válido. |

## Modelo Relacional

![Hospital](../img/Relacional/EJERCICIO1.jpg)

# Diccionario de Datos de la base de datos de Control Escolar

1. Información General:

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Control Escolar |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboro | Adair Jesús Cruz Huitrón |
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

4 Diccionario de Datos

## Tabla: PROFESOR

**Descripción**

Instancia del catálogo que almacena la información de los docentes contratados por la universidad.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Idprofesor | INT | - | PK, NN | Identificador único de cada profesor. |
| Nombre | VARCHAR | 50 | NN | Nombre(s) de pila del docente. |
| Apellido1 | VARCHAR | 50 | NN | Primer apellido (paterno) del docente. |
| Apellido2 | VARCHAR | 50 | NULL | Segundo apellido (materno) del docente. |
| Especialidad | VARCHAR | 100 | NN | Área de conocimiento o disciplina principal del profesor. |

## Tabla: CURSO

**Descripción**

Catálogo de las asignaturas académicas ofertadas por la institución.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Idcurso | INT | - | PK, NN | Identificador único numérico del curso. |
| Idprofesor NN | INT | - | FK, NN | Clave foránea que asocia el curso con su profesor asignado. |
| Nombre | VARCHAR | 100 | NN | Nombre oficial de la asignatura. |
| Creditos | INT | - | NN | Valor o peso académico de la materia en el plan de estudios. |

--

5. Relaciones del sistema

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Profesor -> Curso | 1:N | Un profesor puede impartir varios cursos |
| Curso -> Profesor | 1:1 | Un curso solamente puede ser impartido por un profesor |

6. Matriz de claves franeas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| CURSO | Idprofesor NN | PROFESOR(Idprofesor) |

7. Integridad Referencial

| Código | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un curso con un profesor inexistente |

8. Reglas del negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un profesor puede impartir varios cursos |
| RN-02 | Un curso sólamente puede ser impartido por un profesor |
| RN-03 | Puede existir un profesor que no impatía cursos |
| RN-04 | Todo curso debe ser asignado a un profesor |

## Modelo Relacional

![Hospital](../img/Relacional/EJERCICIO2.jpeg)

# Diccionario de Datos de la base de datos de Control Escolar

1. Información General:

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Control Escolar |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboro | Adair Jesús Cruz Huitrón |
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

## Modelo Relacional

![Hospital](../img/Relacional/EJERCICIO3.jpg)

# Diccionario de Datos de la base de datos de una empresa

1. Información General:

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Empresa |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboro | Adair Jesús Cruz Huitrón |
| SGBD | SQLServer |

2. Descripción del Sistema de Base de Datos

El sistema administra:
- Clientes
- Pedidos
- Detalle de pedidos (Contiene)
- Productos

Permite controlar la gestión comercial de la empresa mediante la venta de productos y el registro detallado de las cantidades y precios fijados en cada pedido.

3. Catalogo de Restricciones utilizados

| Código | Significado |
| :--- | :--- |
| PK | Primary key |
| FK | Foreign Key |
| NN | Not Null |

4 Diccionario de Datos

## Tabla: CLIENTE

**Descripción**

Almacena el catálogo de los clientes (personas morales) que realizan compras en la empresa.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Nocliente | INT | - | PK, NN | Identificador único de cada cliente. |
| Nombremoral | VARCHAR | 150 | NN | Razón social o nombre legal de la persona moral. |
| Rfc | VARCHAR | 13 | NN | Registro Federal de Contribuyentes del cliente. |

## Tabla: PEDIDO

**Descripción**

Registra los encabezados de los pedidos junto con la cantidad e importe asignados directamente.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Nopedido | INT | - | PK, NN | Identificador único del pedido de venta. |
| Nocliente | INT | - | FK, NN | Clave foránea que vincula al cliente que realizó la compra. |
| Cantidadpr | INT | - | NN | Cantidad global de productos registrada en el pedido. |
| Fecha | DATE | - | NN | Fecha de emisión y registro de la orden. |
| Precio | DOUBLE | - | NN | Precio o importe económico total asignado al pedido. |

## Tabla: CONTIENE

**Descripción**

Tabla asociativa que desglosa el detalle de los productos específicos incluidos dentro de cada pedido.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Nopedido | INT | - | PK, FK1, NN | Parte de la PK compuesta; referencia al pedido raíz. |
| Noproducto | INT | - | PK, FK2, NN | Parte de la PK compuesta; referencia al producto vendido. |
| Precioventa | DOUBLE | - | NN | Precio real final al que se vendió el artículo en la orden. |
| Cantidad | INT | - | NN | Unidades físicas adquiridas de este producto en la transacción. |

## Tabla: PRODUCTO

**Descripción**

Catálogo general de los productos y artículos disponibles para su comercialización.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Noproducto | INT | - | PK, NN | Identificador único del artículo comercializable. |
| nombre | VARCHAR | 100 | NN | Nombre comercial o descripción del producto. |
| Precio | DOUBLE | - | NN | Precio de lista base sugerido para el artículo. |

--

5. Relaciones del sistema

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| Cliente -> Pedido | 1:N | Un cliente puede registrar múltiples pedidos a lo largo del tiempo. |
| Pedido -> Contiene | 1:N | Un pedido se compone de una o muchas líneas de detalle de productos. |
| Producto -> Contiene | 1:N | Un producto puede estar presente en los detalles de múltiples pedidos. |

6. Matriz de claves franeas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| PEDIDO | Nocliente | CLIENTE(Nocliente) |
| CONTIENE | Nopedido | PEDIDO(Nopedido) |
| CONTIENE | Noproducto | PRODUCTO(Noproducto) |

7. Integridad Referencial

| Código | Regla |
| :--- | :--- |
| IR-01 | No se puede generar un pedido para un cliente que no se encuentre registrado en el catálogo. |
| IR-02 | No se pueden registrar productos en la tabla intermedia de detalle sin un número de pedido base válido. |
| IR-03 | No se pueden añadir productos al detalle de venta que no existan en el inventario general de artículos. |

8. Reglas del negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un cliente puede realizar muchos pedidos. |
| RN-02 | Cada pedido pertenece a un solo cliente. |
| RN-03 | Un pedido puede contener varios productos. |
| RN-04 | Un producto puede aparecer en varios pedidos. |
| RN-05 | Un pedido debe contener al menos un producto. |
| RN-06 | Un producto puede no haber sido vendido. |
| RN-07 | El detalle del pedido no existe sin pedido. |
| RN-08 | El detalle de pedido no existe sin producto. |

## Modelo Relacional

![Hospital](../img/Relacional/EJERCICIO4.jpg)

# Diccionario de Datos de la base de datos de una empresa departamental

1. Información General:

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Empresa Departamental |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboro | Adair Jesús Cruz Huitrón |
| SGBD | SQLServer |

2. Descripción del Sistema de Base de Datos

El sistema administra:
- Departamentos
- Empleados
- Proyectos
- Dependientes
- Ubicaciones de los departamentos (Location)
- Historial de asignación de horas en proyectos (WorksFor)

Permite controlar la estructura organizativa de la empresa, la supervisión interna del personal, la asignación y control de proyectos por departamento, el tiempo invertido por los empleados en sus respectivas asignaciones y el registro de sus dependientes para fines de prestaciones médicas y seguros.

3. Catalogo de Restricciones utilizados

| Código | Significado |
| :--- | :--- |
| PK | Primary key |
| FK | Foreign Key |
| NN | Not Null |
| UQ | Unique |

4 Diccionario de Datos

## Tabla: EMPLOYEE

**Descripción**

Almacena la información de control de identidad, datos personales y estructura jerárquica de los empleados de la organización.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| employeeID | INT | - | PK, NN | Identificador interno y único del empleado. |
| Numberdep | INT | - | FK, NN | Código del departamento al que pertenece el empleado. |
| jef | INT | - | FK, NULL | Clave foránea autoreferenciada que indica el identificador del supervisor directo. |
| SSD | VARCHAR | 15 | UQ, NN | Número de Seguro Social único del trabajador. |
| nombre | VARCHAR | 50 | NN | Nombre o nombres de pila del empleado. |
| ap1 | VARCHAR | 50 | NN | Primer apellido (paterno) del empleado. |
| ap2 | VARCHAR | 50 | NULL | Segundo apellido (materno) del empleado. |
| birthday | DATE | - | NN | Fecha de nacimiento del empleado. |
| sex | VARCHAR | 10 | NN | Género o sexo del trabajador. |
| address | VARCHAR | 150 | NN | Dirección de residencia del empleado. |
| boss | INT | - | NULL | Código indicador del estado de jefatura o rol de mando. |

## Tabla: DEPARTAMENT

**Descripción**

Catálogo de las unidades divisionales o departamentos operativos que conforman la estructura empresarial.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numberdep | INT | - | PK, NN | Número identificador único del departamento. |
| NameDep | VARCHAR | 100 | UQ, NN | Nombre representativo y único de la unidad departamental. |
| manager | INT | - | FK, UQ, NULL | Referencia (ID de empleado) del gerente que administra el departamento. |
| Startdate | DATE | - | NN | Fecha exacta de inicio de la gestión del gerente en turno. |

## Tabla: Location

**Descripción**

Tabla de soporte multievaluada encargada de almacenar las distintas sedes o ubicaciones geográficas asignadas a un departamento.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| numlocation | INT | - | PK, NN | Identificador de secuencia único de la ubicación física. |
| Namedep | INT | - | PK, FK, NN | Código del departamento asociado; conforma la clave primaria compuesta. |
| Namelocation | VARCHAR | 100 | NN | Nombre o descripción de la zona o lugar de la sede. |

## Tabla: WorksFor

**Descripción**

Tabla asociativa que rompe la relación de muchos a muchos entre empleados y proyectos, registrando la carga de tiempo laboral invertida.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Employeeid | INT | - | PK, FK1, NN | Identificador del empleado; parte de la clave compuesta. |
| Numberproject | INT | - | PK, FK2, NN | Número del proyecto asignado; parte de la clave compuesta. |
| hours | INT | - | NN | Cantidad de horas semanales dedicadas por el empleado al proyecto. |

## Tabla: PROJECT

**Descripción**

Catálogo de proyectos de desarrollo u operaciones gestionados y controlados por la organización.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Numberproject | INT | - | PK, NN | Identificador secuencial único de control del proyecto. |
| Numberdep | INT | - | FK, NN | Clave foránea que referencia al departamento que controla el proyecto. |
| Nameproject | VARCHAR | 100 | UQ, NN | Nombre descriptivo y unívoco asignado al proyecto. |
| Location | VARCHAR | 100 | NN | Ubicación física o región donde se implementa el proyecto. |

## Tabla: DEPENDENT

**Descripción**

Entidad débil que almacena los beneficiarios directos de los empleados para la cobertura de prestaciones y seguros médicos.

| Campo | Tipo | Longitud | Restricciones | Descripción |
| :--- | :--- | :--- | :--- | :--- |
| Dependentid | INT | - | PK, NN | Identificador primario incremental del dependiente. |
| Employeeid | INT | - | PK, FK, NN | Clave foránea de vínculo con el empleado titular; conforma la clave primaria compuesta. |
| nombre | VARCHAR | 50 | NN | Nombre del beneficiario. |
| ap1 | VARCHAR | 50 | NN | Primer apellido del beneficiario. |
| ap2 | VARCHAR | 50 | NN | Segundo apellido del beneficiario. |
| Location | VARCHAR | 100 | NULL | Datos domiciliarios adicionales del dependiente. |
| sex | VARCHAR | 10 | NN | Género o sexo del dependiente. |
| birthday | DATE | - | NN | Fecha de nacimiento completa del dependiente. |
| parentesco | VARCHAR | 30 | NN | Vínculo familiar o lazo consanguíneo con el empleado (Hijo, Cónyuge, etc.). |

--

5. Relaciones del sistema

| Relación | Cardinalidad | Descripción |
| :--- | :--- | :--- |
| EMPLOYEE -> DEPARTAMENT | 1:1 | Un empleado puede administrar como máximo un departamento. |
| DEPARTAMENT -> EMPLOYEE | 1:N | Un departamento puede tener muchos empleados adscritos. |
| EMPLOYEE -> EMPLOYEE (jef) | 1:N | Un empleado supervisor puede coordinar a varios empleados subordinados. |
| DEPARTAMENT -> Location | 1:N | Un departamento puede contar con múltiples ubicaciones geográficas. |
| DEPARTAMENT -> PROJECT | 1:N | Un departamento supervisa y controla varios proyectos simultáneos. |
| EMPLOYEE -> WorksFor | 1:N | Un empleado puede participar activamente en varios proyectos operativos. |
| PROJECT -> WorksFor | 1:N | Un proyecto agrupa las actividades de múltiples empleados asignados. |
| EMPLOYEE -> DEPENDENT | 1:N | Un empleado titular puede tener asociados múltiples dependientes económicos. |

6. Matriz de claves franeas

| Tabla | Campo FK | Referencia |
| :--- | :--- | :--- |
| EMPLOYEE | Numberdep | DEPARTAMENT(Numberdep) |
| EMPLOYEE | jef | EMPLOYEE(employeeID) |
| DEPARTAMENT | manager | EMPLOYEE(employeeID) |
| Location | Namedep | DEPARTAMENT(Numberdep) |
| WorksFor | Employeeid | EMPLOYEE(employeeID) |
| WorksFor | Numberproject | PROJECT(Numberproject) |
| PROJECT | Numberdep | DEPARTAMENT(Numberdep) |
| DEPENDENT | Employeeid | EMPLOYEE(employeeID) |

7. Integridad Referencial

| Código | Regla |
| :--- | :--- |
| IR-01 | No se puede registrar un empleado en un departamento inexistente. |
| IR-02 | No se puede asignar un supervisor en el campo `jef` que no se encuentre dado de alta en la tabla de empleados. |
| IR-03 | No se puede asignar un gerente de departamento si su ID no es una entidad registrada de empleado. |
| IR-04 | No se puede registrar una ubicación o sede en la tabla `Location` para un código de departamento inexistente. |
| IR-05 | No se puede generar una asignación de horas en la tabla `WorksFor` si el código de proyecto o de empleado no existen en sus tablas origen. |
| IR-06 | No se puede crear un proyecto vinculado a un área departamental que no esté asentada en el sistema. |
| IR-07 | Al remover o dar de baja a un empleado de la organización, se deben rescindir y eliminar inmediatamente todos sus dependientes asociados (ON DELETE CASCADE). |

8. Reglas del negocio

| Código | Regla |
| :--- | :--- |
| RN-01 | Un departamento es administrado por un solo empleado (Gerente). |
| RN-02 | Un empleado puede administrar como máximo un departamento en el mismo periodo de tiempo. |
| RN-03 | Un proyecto pertenece y es controlado por un único departamento en la empresa. |
| RN-04 | Un empleado operativo pertenece a un solo departamento matriz. |
| RN-05 | Un dependiente no puede existir en la base de datos sin un empleado titular responsable. |
| RN-06 | En la asignación laboral de un empleado en un proyecto, se debe computar estrictamente la cantidad de horas semanales dedicadas. |
| RN-07 | Los identificadores asignados a los números de departamento, proyectos y seguro social deben ser de carácter único e irrepetible. |

## Modelo Relacional

![Hospital](../img/Relacional/EJERCICIO5.jpg)

# Diccionario de Datos de la base de datos de Control Escolar

1. Información General:

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Control Escolar |
| Versión | 1.0 |
| Fecha | Junio 2026 |
| Elaboro | Adair Jesús Cruz Huitrón |
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

## Modelo Relacional

![Hospital](../img/Relacional/EJERCICIO7.jpg)