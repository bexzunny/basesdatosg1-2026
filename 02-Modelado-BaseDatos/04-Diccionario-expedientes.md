# Diccionario de Datos de la Base de Datos de Expedientes Médicos

## 1. Información General

| Elemento | Valor |
| :--- | :--- |
| Proyecto | Expedientes Médicos |
| Versión | 1.0 |
| Fecha | Julio 2026 |
| Elaboró | Ing. Adair Jesús Cruz Huitrón |
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