-- Extraer datos de la tabla de pedidos y cargar en Staging
INSERT INTO Stg_Pedido (ID_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente)
SELECT ID_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente
FROM Pedido;

-- Transformación: Normalización de nombres de productos (hacer todos los nombres en mayúsculas)
UPDATE Stg_Producto
SET Nombre = UPPER(Nombre);

-- Cargar los datos transformados en la tabla final del Data Mart
INSERT INTO Dim_Producto (ID_producto, Codigo_producto, Nombre, Categoria, Proveedor, Precio_venta)
SELECT ID_producto, Codigo_producto, Nombre, Categoria, Proveedor, Precio_venta
FROM Stg_Producto;
