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