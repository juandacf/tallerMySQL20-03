-- Tarea:
-- 1. Crea una función llamada clasificar_precio que reciba un DECIMAL(10,2) y devuelva un
-- VARCHAR(10) con la clasificación del producto ( Bajo , Medio , Alto ).
-- 2. Usa la función en un SELECT sobre la tabla productos .

DELIMITER $$

DROP FUNCTION IF EXISTS clasificar_precio$$

CREATE FUNCTION clasificar_precio(precio DECIMAL(10,2))
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE categoria VARCHAR(10);

    CASE 
        WHEN precio < 50 THEN
            SET categoria = 'Bajo';
        WHEN precio BETWEEN 50 AND 200 THEN
            SET categoria = 'Medio';
        ELSE
            SET categoria = 'Alto';
    END CASE;

    RETURN categoria;
END$$

DELIMITER ;