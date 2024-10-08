# Pruebas de Calidad de Datos

## 1. Prueba de duplicados en la tabla de Clientes
**Consulta**: Se utilizó la siguiente consulta para identificar y eliminar duplicados en la tabla de clientes:
```sql
SELECT ID_cliente, COUNT(*) 
FROM Stg_Cliente 
GROUP BY ID_cliente 
HAVING COUNT(*) > 1;
