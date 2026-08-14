/*=================================================================

DQL (Data Query Languaje) en SQLSERVER

Archivo: 05-ejercicio-where-extra.sql

Descripción: Se realizan consuoltas básicas con SELECT 

=================================================================*/

/*
MOstrar las ventas realizadas en Francia, Brazil y bélgica
de 10 de julio a 1996 al 31 de diciembre de 1998, que tenga región de enbió
para los clientes VICTE,HANAR y SUPR, y ordenadas por fecha de pedido de la mas cercana a la 
mas antigüa
*/
SELECT
	o.OrderID AS numero_orden,
	o.CustomerID AS cliente,
	o.ShipCountry AS pais_envio,
	o.OrderDate AS fecha_orden,
	UPPER(FORMAT(o.OrderDate,'MMMM','es-ES')) AS mes_orden,
	UPPER(FORMAT(o.OrderDate,'dddd','es-ES')) AS dia_orden,
	DATEPART(YEAR,o.OrderDate) AS [año_ordemn]
FROM Orders AS o
WHERE o.ShipCountry IN ('France','Brazil','Belgium')
	AND 
	o.CustomerID IN ('VICTE','HANAR','SUPRO')
	AND
	o.OrderDate BETWEEN '1996-07-10' AND '1998-12-24'
ORDER BY o.OrderDate ASC;