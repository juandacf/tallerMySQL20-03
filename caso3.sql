-- Tarea:
-- 1. Crea una función llamada formatear_telefono que reciba un número de teléfono en
-- formato XXXXXXXXXX y lo devuelva en formato (XXX) XXX-XXXX .
-- 2. Usa la función en un SELECT sobre la tabla contactos .

DROP FUNCTION IF EXISTS formatear_telefono;

DELIMITER  $$
CREATE FUNCTION formatear_telefono(numero VARCHAR(10))
RETURNS VARCHAR(15)
DETERMINISTIC
BEGIN 

RETURN CONCAT('(', SUBSTRING(numero, 1,3), ')', ' ', SUBSTRING(numero, 4,3), '-', SUBSTRING(numero, 7,4) );


END$$
DELIMITER ;

SELECT formatear_telefono("111111111");