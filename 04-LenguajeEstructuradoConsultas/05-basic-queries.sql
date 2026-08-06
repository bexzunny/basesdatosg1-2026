/*=================================================================

DQL (Data Query Languaje) en SQLSERVER

Archivo: 05-basic-queries.sql

Descripción: Se realizan consuoltas básicas con SELECT 

=================================================================*/

USE comercial_db;
GO
-- Uso de SELECT *

/* ===========================================
Sintaxis
SELECT *
FROM nombre_tabla

* : Todas las columnas de la tabla.
No se recomienda utilizarla siempre;
1. Reduce la claridad de la consulta.
2. Puede aumentar el consumo de recursos.
3. Puede afectar aplicaciones futuras.

=========================================== */

SELECT *
FROM productos;

-- Proyección de la tabla productos
SELECT codigo, nombre, precio
FROM productos;

SELECT 
	nombre,
	precio,
	codigo
FROM productos;
GO

-- Alias de columna (Sobrenombre que se le pone a un cuerpo)
SELECT
	codigo AS codigo_producto,
	nombre AS nombre_producto,
	precio AS precio_unitario
FROM productos;


-- Alias con espacios
SELECT
	codigo AS [codigo producto],
	nombre AS [nombre producto],
	precio AS [precio unitario]
FROM productos;

SELECT
	codigo AS 'codigo producto',
	nombre AS 'nombre producto',
	precio AS 'precio unitario'
FROM productos;

-- Alias sin AS (no recomendado)
SELECT
	codigo codigo_producto,
	nombre [nombre_producto],
	precio precio_unitario
FROM productos;

--===================
--Alias de tabla (Es util en joins y nombres ambigüos)
SELECT
	p.codigo,
	p.nombre,
	p.precio
FROM productos AS p;

SELECT
	categorias.id_categoria,
	categorias.nombre,
	productos.id_producto,
	productos.nombre,
	productos.precio
FROM categorias 
INNER JOIN
productos
ON categorias.id_categoria = productos.id_categoria;


SELECT
	c.id_categoria,
	c.nombre,
	p.id_producto,
	p.nombre,
	p.precio
FROM categorias AS c
INNER JOIN
productos AS p
ON c.id_categoria = p.id_categoria;


SELECT
	p.codigo AS Código,
	p.nombre AS [Nombre Producto],
	p.precio AS 'Precio Unitario'
FROM productos AS p;

-- Colunas Calculada
-- Campos calculados 
-- E-R (Atributo Derivado)

-- Seleccionar el código, nombre, precio, existencia y el valor del inventario
SELECT
	p.codigo AS codigo_producto,
	p.nombre AS nombre_producto,
	p.precio AS precio_unitario,
	p.existencia,
	p.precio * p.existencia AS precio_inventario
FROM productos AS p;


-- Operadores aritméticos
/* ========================================
	+ suma
	- resta
	* multiplicación
	/ división
	% Modulo o Residuo de división
======================================== */


SELECT
	e.nombre,
	e.apellido_paterno,
	e.salario AS salario_anual,
	(e.salario *12) AS salario_anual
FROM empleados AS e;
GO
	-- Seleccionar el detalle de las ventas mostrando
	-- numero de venta, cantidad, precio, descuento
	-- calcular el importe bruto (cantidad*precio)
	-- Calcular el importe con descuento (importe bruto * descuento)/100
	-- Calcular el importe neto, (importe bruto *1 - descuento /100)

SELECT
	dv.id_detalle_venta AS #venta,
	dv.cantidad AS cantidad_vendida,
	dv.precio AS [precio de venta],
	dv.descuento AS 'descuento de venta',

	(dv.cantidad * dv.precio) AS importe_bruto,
	((dv.cantidad * dv.precio) /100.0) AS [importe_descuento],
	(dv.cantidad * dv.precio*(1.0 - dv.descuento / 100.0)) AS importe_neto

FROM detalle_ventas AS dv;
