CREATE TABLE clientes (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50),
fecha_nacimiento DATE
);
INSERT INTO clientes (nombre, fecha_nacimiento) VALUES
('Luis Martínez', '1990-06-15'),
('María López', '1985-09-20'),
('Pedro Gómez', '2000-03-10');



-- Tarea:
-- 1. Crea una función llamada calcular_edad que reciba un DATE y devuelva la edad del cliente.
-- 2. Usa la función en un SELECT sobre la tabla clientes .

DROP FUNCTION IF EXISTS calcular_edad;


DELIMITER $$
CREATE FUNCTION calcular_edad(fecha DATE)
RETURNS INTEGER
DETERMINISTIC
BEGIN
    DECLARE edad INT;
    SET edad = TIMESTAMPDIFF(YEAR, fecha, CURDATE());
    RETURN edad;
RETURN  edad;

END $$
DELIMITER ;

SELECT calcular_edad('2000-03-10');