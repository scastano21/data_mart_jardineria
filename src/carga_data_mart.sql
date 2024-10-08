-- Cargar datos a la tabla de hechos en el Data Mart final
INSERT INTO Hechos_Ventas (ID_producto, ID_cliente, ID_empleado, ID_tiempo, Cantidad, Precio_unidad, Total_venta)
SELECT dp.ID_producto, p.ID_cliente, e.ID_empleado, t.ID_tiempo, dp.cantidad, dp.precio_unidad, (dp.cantidad * dp.precio_unidad)
FROM Stg_Detalle_Pedido dp
JOIN Stg_Pedido p ON dp.ID_pedido = p.ID_pedido
JOIN Stg_Empleado e ON p.ID_empleado_rep_ventas = e.ID_empleado
JOIN Stg_Tiempo t ON p.fecha_pedido = t.fecha;
