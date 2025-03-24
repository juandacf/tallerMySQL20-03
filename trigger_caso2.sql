-- Tarea:
-- 1. Crear las tablas empleados y historial_salarios .
-- 2. Implementar un trigger BEFORE UPDATE que registre cualquier cambio en el salario.
-- 3. Probar el trigger.

CREATE TABLE empleados (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50),
salario DECIMAL(10,2)
);
CREATE TABLE historial_salarios (
id INT PRIMARY KEY AUTO_INCREMENT,
id_empleado INT,
salario_anterior DECIMAL(10,2),
salario_nuevo DECIMAL(10,2),
fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
FOREIGN KEY (id_empleado) REFERENCES empleados(id)
);

DELIMITER $$



DELIMITER ;