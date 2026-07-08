# MySQL

| Tipo de dato   | Descripción                           | Restricciones / Características                |
| -------------- | ------------------------------------- | ---------------------------------------------- |
| `TINYINT`      | Entero pequeño (-128 a 127)           | 1 byte                                         |
| `SMALLINT`     | Entero pequeño                        | 2 bytes                                        |
| `MEDIUMINT`    | Entero mediano                        | 3 bytes                                        |
| `INT`          | Entero estándar                       | 4 bytes                                        |
| `BIGINT`       | Entero grande                         | 8 bytes                                        |
| `DECIMAL(p,s)` | Número decimal exacto                 | Requiere precisión (`p`) y escala (`s`)        |
| `FLOAT`        | Número decimal aproximado             | Menor precisión                                |
| `DOUBLE`       | Decimal aproximado de mayor precisión | 8 bytes                                        |
| `CHAR(n)`      | Cadena de longitud fija               | Requiere longitud entre 0 y 255                |
| `VARCHAR(n)`   | Cadena de longitud variable           | Requiere longitud máxima de hasta 65,535 bytes |
| `TEXT`         | Texto largo                           | No requiere longitud                           |
| `DATE`         | Fecha                                 | Formato `YYYY-MM-DD`                           |
| `TIME`         | Hora                                  | Formato `HH:MM:SS`                             |
| `DATETIME`     | Fecha y hora                          | Rango amplio                                   |
| `TIMESTAMP`    | Fecha y hora basada en Unix Timestamp | Se actualiza automáticamente si se configura   |
| `BOOLEAN`      | Verdadero o falso                     | Internamente es `TINYINT(1)`                   |
| `ENUM`         | Lista de valores permitidos           | Solo acepta valores definidos                  |
| `SET`          | Conjunto de opciones                  | Permite múltiples valores                      |
| `JSON`         | Datos JSON                            | Valida formato JSON automáticamente            |

# PostgreSQL

| Tipo de dato       | Descripción                          | Restricciones / Características   |
| ------------------ | ------------------------------------ | --------------------------------- |
| `SMALLINT`         | Entero pequeño                       | 2 bytes                           |
| `INTEGER`          | Entero estándar                      | 4 bytes                           |
| `BIGINT`           | Entero grande                        | 8 bytes                           |
| `SERIAL`           | Entero autoincremental               | Equivale a `INTEGER` + secuencia  |
| `BIGSERIAL`        | Entero grande autoincremental        | Similar a `BIGINT` + secuencia    |
| `NUMERIC(p,s)`     | Decimal exacto                       | Requiere precisión y escala       |
| `REAL`             | Decimal aproximado                   | 4 bytes                           |
| `DOUBLE PRECISION` | Decimal aproximado de alta precisión | 8 bytes                           |
| `CHAR(n)`          | Texto fijo                           | Requiere longitud                 |
| `VARCHAR(n)`       | Texto variable                       | Longitud máxima definida          |
| `TEXT`             | Texto ilimitado                      | Sin longitud máxima práctica      |
| `DATE`             | Fecha                                | Formato `YYYY-MM-DD`              |
| `TIME`             | Hora                                 | Puede incluir zona horaria        |
| `TIMESTAMP`        | Fecha y hora                         | Sin zona horaria                  |
| `TIMESTAMPTZ`      | Fecha y hora                         | Incluye zona horaria              |
| `INTERVAL`         | Intervalos de tiempo                 | Ejemplo: `2 days 5 hours`         |
| `BOOLEAN`          | Verdadero o falso                    | Valores `TRUE` y `FALSE`          |
| `UUID`             | Identificador universal              | 128 bits                          |
| `JSON`             | Documento JSON                       | Almacenamiento textual            |
| `JSONB`            | Documento JSON binario               | Más rápido para búsquedas         |
| `ARRAY`            | Arreglos de datos                    | Puede almacenar múltiples valores |
| `XML`              | Documento XML                        | Valida estructura XML             |

# SQL Server

| Tipo de dato       | Descripción                       | Restricciones / Características     |
| ------------------ | --------------------------------- | ----------------------------------- |
| `TINYINT`          | Entero pequeño                    | 1 byte, solo positivos              |
| `SMALLINT`         | Entero pequeño                    | 2 bytes                             |
| `INT`              | Entero estándar                   | 4 bytes                             |
| `BIGINT`           | Entero grande                     | 8 bytes                             |
| `DECIMAL(p,s)`     | Decimal exacto                    | Requiere precisión y escala         |
| `FLOAT`            | Decimal aproximado                | Precisión configurable              |
| `REAL`             | Decimal aproximado                | Menor precisión                     |
| `MONEY`            | Valores monetarios                | 8 bytes                             |
| `SMALLMONEY`       | Valores monetarios pequeños       | 4 bytes                             |
| `CHAR(n)`          | Texto fijo                        | Longitud obligatoria                |
| `VARCHAR(n)`       | Texto variable                    | Hasta 8000 caracteres               |
| `VARCHAR(MAX)`     | Texto largo                       | Hasta 2 GB                          |
| `NCHAR(n)`         | Texto Unicode fijo                | Soporta caracteres internacionales  |
| `NVARCHAR(n)`      | Texto Unicode variable            | Hasta 4000 caracteres               |
| `NVARCHAR(MAX)`    | Texto Unicode largo               | Hasta 2 GB                          |
| `DATE`             | Fecha                             | Formato `YYYY-MM-DD`                |
| `TIME`             | Hora                              | Precisión configurable              |
| `DATETIME`         | Fecha y hora                      | Precisión menor                     |
| `DATETIME2`        | Fecha y hora                      | Mayor precisión y rango             |
| `DATETIMEOFFSET`   | Fecha y hora                      | Incluye zona horaria                |
| `BIT`              | Booleano                          | Solo `0`, `1` o `NULL`              |
| `UNIQUEIDENTIFIER` | UUID de SQL Server                | Generalmente generado con `NEWID()` |
| `XML`              | Documento XML                     | Valida sintaxis XML                 |
| `GEOMETRY`         | Datos espaciales planos           | Coordenadas cartesianas             |
| `GEOGRAPHY`        | Datos geográficos                 | Coordenadas terrestres              |
| `ROWVERSION`       | Versión automática de fila        | Se actualiza automáticamente        |
| `SQL_VARIANT`      | Almacena distintos tipos de datos | No admite algunos tipos especiales  |

# Restricciones más comunes

| Restricción      | Descripción                             |
| ---------------- | --------------------------------------- |
| `PRIMARY KEY`    | Identifica de forma única cada registro |
| `FOREIGN KEY`    | Relaciona una tabla con otra            |
| `NOT NULL`       | Obliga a que exista un valor            |
| `UNIQUE`         | Impide valores repetidos                |
| `CHECK`          | Valida una condición específica         |
| `DEFAULT`        | Asigna un valor por defecto             |
| `AUTO_INCREMENT` | Incremento automático en MySQL          |
| `SERIAL`         | Autoincremental en PostgreSQL           |
| `IDENTITY`       | Autoincremental en SQL Server           |
