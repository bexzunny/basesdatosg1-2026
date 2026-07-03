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