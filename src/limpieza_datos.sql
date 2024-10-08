-- Eliminar duplicados en la tabla de clientes
DELETE FROM Stg_Cliente
WHERE ID_cliente IN (
    SELECT ID_cliente
    FROM (
        SELECT ID_cliente, ROW_NUMBER() OVER(PARTITION BY ID_cliente ORDER BY ID_cliente) AS row_num
        FROM Stg_Cliente
    ) t
    WHERE t.row_num > 1
);

-- Verificar si hay campos nulos en la tabla de productos
SELECT * 
FROM Stg_Producto
WHERE Nombre IS NULL;

-- Verificar formato correcto de números de teléfono en clientes
SELECT * 
FROM Stg_Cliente
WHERE telefono NOT LIKE '____-___-___';
