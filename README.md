# 🗄️ Base de Datos

### Repositorio de prácticas, apuntes y proyectos de la materia

<div align="center">

<img src="https://img.shields.io/badge/SQL-Structured_Query_Language-blue?style=for-the-badge&logo=mysql">
<img src="https://img.shields.io/badge/Modelo-E--R-purple?style=for-the-badge">
<img src="https://img.shields.io/badge/Base_de_Datos-Relacionales-green?style=for-the-badge">
<img src="https://img.shields.io/badge/Status-En_Desarrollo-orange?style=for-the-badge">

</div>

---

# 📚 Descripción

Este repositorio contiene prácticas, ejercicios, diagramas y actividades desarrolladas durante la materia de **Base de Datos**.
Aquí se trabajan conceptos fundamentales relacionados con el diseño, modelado y construcción de bases de datos relacionales utilizando SQL.

Porque claramente alguien decidió que organizar datos con tablas, relaciones y llaves foráneas era más divertido que tocar pasto. ☕💀

---

# 🧠 Temas vistos

## 🔹 Fundamentos de Bases de Datos

* Concepto de base de datos
* Sistemas gestores de bases de datos (SGBD)
* Tipos de bases de datos
* Ventajas y aplicaciones
* Integridad y seguridad de datos

---

## 🔹 Modelado de Datos con Modelo E-R

* Entidades
* Atributos
* Relaciones
* Cardinalidades
* Diagramas Entidad-Relación
* Conversión al modelo relacional

---

## 🔹 Modelo Relacional

* Tablas
* Tuplas y atributos
* Llaves primarias
* Llaves foráneas
* Normalización
* Integridad referencial

---

## 🔹 Construcción de Bases de Datos con SQL

### 📌 Lenguaje SQL - LDD (DDL)

Comandos utilizados para definir estructuras:

```sql
CREATE DATABASE escuela;

CREATE TABLE alumnos(
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT
);
```

### 📌 Lenguaje SQL - LMD (DML)

Comandos utilizados para manipular datos:

```sql
INSERT INTO alumnos VALUES(1, 'Juan', 18);

SELECT * FROM alumnos;

UPDATE alumnos
SET edad = 19
WHERE id = 1;
```

---

# 🛠️ Tecnologías utilizadas

* MySQL
* SQL
* Draw.io / Lucidchart
* Git & GitHub

---

# 📂 Estructura del repositorio

```bash
📁 Base-De-Datos
 ┣ 📂 Diagramas
 ┣ 📂 Practicas_SQL
 ┣ 📂 Modelo_ER
 ┣ 📂 Consultas
 ┣ 📜 README.md
```

---

# 🚀 Objetivo del repositorio

Aplicar los conocimientos adquiridos en la materia mediante ejercicios prácticos, diseño de modelos de datos y construcción de bases de datos funcionales utilizando SQL.

Porque descubrir que faltaba una coma después de 40 minutos revisando el código es parte del desarrollo personal del estudiante promedio. 🫠

---

# 👨‍💻 Autor

**Zunny**
Estudiante de desarrollo y bases de datos.

---

# ⭐ Extras

Si llegaste hasta aquí:

* hidrátate 💧
* haz respaldo de tu base de datos 💀
* nunca uses `DELETE` sin `WHERE`

```sql
DELETE FROM alumnos;
-- último avistamiento de los datos: hace 3 segundos
```

---
