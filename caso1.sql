CREATE TABLE empleados (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50),
salario DECIMAL(10,2)
);
INSERT INTO empleados (nombre, salario) VALUES
('Juan Pérez', 1500.00),
('Ana Gómez', 3000.00),
('Carlos Ruiz', 6000.00);

-- Tarea:
-- 1. Crea una función llamada calcular_bonificacion que reciba un DECIMAL(10,2) con el
-- salario y devuelva la bonificación correspondiente.
-- 2. Usa la función en un SELECT sobre la tabla empleados .

DROP FUNCTION IF EXISTS calcular_bonificacion;

DELIMITER $$

CREATE FUNCTION calcular_bonificacion(salary DECIMAL(10,2)) 
RETURNS INTEGER
DETERMINISTIC
BEGIN

CASE 
    WHEN salary <= 2000 THEN 
        RETURN salary*10/100;
    WHEN salary >=2000 AND salary<=5000 THEN
        RETURN salary*7/100;
    WHEN salary > 5000 THEN
        RETURN salary*5/100;

END CASE;

END$$

DELIMITER ;

SELECT calcular_bonificacion(SELECT salario FROM empleados WHERE id=1;);

SELECT salario FROM empleados WHERE id=1;