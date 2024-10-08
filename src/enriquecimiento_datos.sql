-- Actualización de la tabla de tiempo para agregar trimestres y semestres
UPDATE Stg_Tiempo
SET trimestre = CASE 
    WHEN mes BETWEEN 1 AND 3 THEN 1
    WHEN mes BETWEEN 4 AND 6 THEN 2
    WHEN mes BETWEEN 7 AND 9 THEN 3
    ELSE 4
END,
semestre = CASE 
    WHEN mes BETWEEN 1 AND 6 THEN 1
    ELSE 2
END;
