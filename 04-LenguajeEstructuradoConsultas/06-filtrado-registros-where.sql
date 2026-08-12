/*======================================================================

DQL (Data Query Languaje) en SQLSERVER

Archivo: 06-filtrado-registros-where.sql

Descripción: Se recuperan únicamente las filas que cumplen determinadas
condiciones mediante la cláusula WHERE
ORDER DE EJECUCIÓN:
+ FROM / JOINS
+ WHERE
+ GROUP BY
+ HAVING
+ DISTINCT
+ ORDER BY
+ TOP

ORDEN SINTÁCTICO

SELECT
FROM
JOIN/ON (INNER, LEFT RIGHT CROSS FULL SELF)
WHERE
GROUP BY
HAVING
ORDER BY

OPERADORES RELACIONALES

= Igual que
< Menor que
> Mayor que
<= Menor o igual que
>= Mayor o igual que
<> Diferente que
!= Diferente que (menos utilizado)

OPERADORES LÓGICOS
NOT
AND
OR

======================================================================*/


/*======================================================================
Sintaxis:

SELECT
	columna_1,
	columna_n
FROM nombre_tabla
WHERE condicion



Nota: La condición puede ser relacional y a combinación de esta con
lógica

Nota; El SELECT no filtra registros
======================================================================*/

-- Seleccionar el producto cuyo precio es $200
SELECT
	p.codigo AS [código],
	p.nombre AS [Producto],
	p.precio AS [Precio]
FROM productos AS p
WHERE precio= 200;

-- Seleccionar el cliente cuyo identificador es 25

SELECT
	c.id_cliente,
	CONCAT(c.nombre,' ',
	c.apellido_paterno, ' ',
	c.apellido_materno) AS nmobre_completo,
	c.correo
FROM clientes AS c
WHERE c.id_cliente = 25;

-- COmparación cadenas de TEXTO
-- Los valores de texto deben escribirse entre conillas simples

-- Seleccionar las categorias donde el nombre sea computo

SELECT
	c.nombre AS [Categoria]
FROM categorias AS c
WHERE c.nombre = 'Cómputo';

-- Seleccionar los datos del cliente con nombre Cliente1
SELECT
	c.id_cliente,
	CONCAT(c.nombre,' ',
	c.apellido_paterno, ' ',
	c.apellido_materno) AS nmobre_completo
FROM clientes AS c
WHERE c.nombre = 'Cliente1';

-- Seleccoinar los datos del empleado que no pertenezcan al dep 1
SELECT
	CONCAT(e.nombre, ' ',
	e.apellido_paterno, ' ',
	e.apellido_materno, ' ') AS nombre_completo
FROM empleados as e
WHERE e.id_departamento <> 1;
-- Seleccionar los datos de los productos donde el precio supere a 250
SELECT
 p.codigo AS Código,
 p.nombre AS Nombre,
 p.precio AS Precio
FROM productos AS p
WHERE p.precio>250;

-- Seleccionar los datos de los productos con existencia crítica inferior a 10 u
SELECT
 p.codigo AS Código,
 p.nombre AS Nombre,
 p.existencia AS Unidades
FROM productos AS p
WHERE p.existencia>10;
-- Seleccionar los datos de los empleados donde su salario sea de $30,000 en adelante

SELECT
	CONCAT(e.nombre, ' ',
	e.apellido_paterno, ' ',
	e.apellido_materno, ' ') AS nombre_completo,
	e.salario AS salario
FROM empleados as e
WHERE e.salario>=30000;

-- Seleccionar los datos de los productos donde sus precios sean de $10 o menos
SELECT
 p.codigo AS Código,
 p.nombre AS Nombre,
 p.precio AS Precio
FROM productos AS p
WHERE p.precio<=10;

--Comparación de fechas

-- Las fechas deben escribirse entre comiullas simples
-- Se recomienda el formato AAAA-MM-DD

-- Seleccionar los datos de las ventas realizadas el 24 de diciembre de 2025
SELECT
	v.id_venta,
	v.fecha,
	v.id_cliente,
	v.id_empleado
FROM ventas AS v
WHERE v.fecha = '2025-12-24';

-- Seleccionar los datos de las ventas realizadas en los meses de abril

SELECT
	v.id_venta,
	v.fecha,
	YEAR(v.fecha) AS [año],
	FORMAT (v.fecha,'mm') AS [mes_ingles],
	FORMAT (v.fecha,'mm','es-ES') AS [mes_español],
	DAY(v.fecha) AS [dia],
	FORMAT(v.fecha,'dddd') AS [dia_ingles],
	UPPER (FORMAT(v.fecha,'dddd','es-ES')) AS [dia_español],
	UPPER(FORMAT(v.fecha,'ddd','es-ES')) AS [mes_abreviatura],
	v.id_cliente,
	v.id_empleado
FROM ventas AS v
WHERE MONTH(v.fecha)= 4;

--Seleccionar todas las ventas anteriores al 1° de febrero de 2025
SELECT
	v.id_venta,
	v.fecha,
	YEAR(v.fecha) AS [año],
	MONTH(v.fecha) AS [mes],
	DAY(v.fecha) AS [dia]
FROM ventas AS v
WHERE v.fecha <'2025-02-01';

-- DISTINCT 
-- quita elementos repetidos de una o la combinación de columnas

SELECT
	sexo
FROM clientes AS c;

SELECT DISTINCT
	cu.nombre
FROM clientes AS c
INNER JOIN ciudades AS cu
ON c.id_ciudad = cu.id_ciudad;

-- Seleccionar los descuentos únicos de las ventas

SELECT DISTINCT
	dv.descuento
FROM detalle_ventas AS dv
ORDER BY dv.descuento DESC;

SELECT DISTINCT
	p.id_categoria,
	p.id_proveedor
FROM productos AS p;
-- Obtiene la combinación de los dos, no de uno solo

--TOP
-- límita la cantidad de filas devueltas por una columna
SELECT TOP (6)
	dv.id_venta,
	dv.precio,
	dv.cantidad,
	dv.descuento
FROM detalle_ventas AS dv;

SELECT TOP (10) PERCENT
	dv.id_venta,
	dv.precio,
	dv.cantidad,
	dv.descuento
FROM detalle_ventas AS dv;


SELECT
	v.id_venta,
	v.fecha,
	YEAR(v.fecha) AS [año],
	FORMAT (v.fecha,'mm') AS [mes_ingles],
	FORMAT (v.fecha,'mm','es-ES') AS [mes_español],
	DAY(v.fecha) AS [dia],
	FORMAT(v.fecha,'dddd') AS [dia_ingles],
	UPPER (FORMAT(v.fecha,'dddd','es-ES')) AS [dia_español],
	UPPER(FORMAT(v.fecha,'ddd','es-ES')) AS [mes_abreviatura],
	v.id_cliente,
	v.id_empleado
FROM ventas AS v
WHERE v.fecha<  '2025-02-01';

-- Seleccionar los datos de los productos mostrando el códgio y el valor del inventario
-- Donde el valor del inventario deve ser mayor a 50,000

SELECT
	p.codigo AS [codigo_producto],
	p.existencia AS [existencia],
	p.precio AS [precio],
	p.existencia * p.precio AS [valor_inventario]
FROM productos AS p
WHERE (p.existencia * p.precio)>50000;

-- Mostrar los productos con precio que estén entre $200 y $300

SELECT
	p.codigo AS [codigo_producto],
	p.existencia AS [existencia],
	p.precio AS [precio],
	p.existencia * p.precio AS [valor_inventario]
FROM productos AS p
WHERE precio BETWEEN 200 AND 300;