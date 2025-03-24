-- Tarea:
-- 1. Crear las tablas pedidos .
-- 2. Implementar un trigger BEFORE DELETE para evitar la eliminación de pedidos pendientes.
-- 3. Probar el trigger.

CREATE TABLE pedidos (
id INT PRIMARY KEY AUTO_INCREMENT,
cliente VARCHAR(100),
estado ENUM('pendiente', 'completado')
);

DELIMITER $$
CREATE TRIGGER validacion_pedidos_pendientes
BEFORE DELETE ON pedidos
FOR EACH ROW
BEGIN
DECLARE variable VARCHAR(10);

SELECT estado INTO variable FROM pedidos WHERE id=OLD.id;

IF variable = 'pendiente' THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No se pueden eliminar pedidos en estado pendiente. Primero, complételo.';
END IF;
END $$
DELIMITER ;