# Construcción de Base deDatos con SQL-LDD

SQL : Structured Query Languaje. Se divide en 5 grandes categorías:

1. **DDL : Data Definition Languaje****
2. **DML : Data Manipulation Languaje**
3. ***DQL : Data Query Languaje***
4. DCL : Data Control Languaje
5. TCL : Transaction Control Languaje

## SQL-DDL

**Lenguaje de Definición de Datos**

Se utiliza para **crear y modificar la estructura** de una base de datos

Con DDL trabajamos sonre los objetos de la base de datos:

- Base de datos
- Tablas
- Vistas
- Indices
- Restricciones
- Esquemas
- Store procedures
- Triggers
- Functions

**Comandos principales**

| Comando | Funcion |
| :--- | :--- |
| CREATE | Crear objetos |
| ALTER | MOdificar objetos |
| DROP | Eliminar objetos |
| Truncate | VAciar una tabla |

## SQL-DML

**Lenguaje de manipulación de datos**

Sirve para **trabajar con al información almacenada** aqui no cambia la estructura sino los registros y los datos.
| Comando | Funcion |
| :--- | :--- |
| INSERT | Inserta Registros |
| UPDATE | Actualizar Registros |
| DELETE | Eliminar registros |

## SQL-DQL

**LEnguaje de consulta de datos**

Su función es **consultar información**

**Comando Principal**

| Comando | Funcion |
| :--- | :--- |
| SELECT | Consultar información |

Generalmente se combina con: 

- WHERE
- ORDER BY
- GROUP BY
- HAVING
- JOIN (LEFT, RIGHT, INNER, CROSS, FULL)
- DISTINCT
- TOP / LIMIT
- Funciones de agregado (SUM, AVG, MAX, MIN, COUNT)
- Funciones de Ventana (Window function)

## Nomenclatura snake_case

**snake_case** es la convención más recomendada de ahora si se busca una nomenclatura moderna, portable y alineada con buenas prácticas en distintos motores de bases de datos.

La razón es que funciona de forma concistente en **SQL-Server, MySQL** y especialmente en **PostgreSQL**. Con snake_case se evitan problemas de mayúsculas  y se hacen las consultas sean más legibles.

**Estándar de construcción**

| Objeto | Convención | Ejemplo |
| :--- | :--- | :--- |
| Base de datos | snake_case | control_escolar |
| Esquema | snake_case | ventas, rh, seguridad |
| Tabla | Singular en snake_case | cliente, pedido, detalle_pedido|
| Columna | snake_case | cliente_id, fecha_registro, nombre, correo_electronico |
| PK | <tabla>_id | cliente_id, categoria_id |
| FK | Igual que la PK referenciada | cliente_id, producto_id |
| Tabla Puente | <tabla1>_<tabla2> | alumno_curso, proovedor_producto |

**Nombrar las restricciones**

- pk_cliente
- fk_pedido_cliente -> pk_tablaorigen_tablareferenciada
- uq_cliente_correo_electronico
- ck_producto_precio
- df_cliente_activo
 
 ## Alter table

Permite modificar una tabla existente

- AGregar columnas
- Eliminar columnas
- Modificar columnas
- Agergar restricciones
- Eliminar restricciones