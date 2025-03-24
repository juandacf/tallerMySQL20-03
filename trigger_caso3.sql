-- 1. Crear las tablas clientes y clientes_auditoria .
-- 2. Implementar un trigger AFTER DELETE para registrar los clientes eliminados.
-- 3. Probar el trigger.

CREATE TABLE clientes (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50),
email VARCHAR(50)
);
CREATE TABLE clientes_auditoria (
id INT PRIMARY KEY AUTO_INCREMENT,
id_cliente INT,
nombre VARCHAR(50),
email VARCHAR(50),
fecha_eliminacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DELIMITER $$
CREATE TRIGGER after_deleted_clients
AFTER DELETE ON clientes
FOR EACH ROW
BEGIN
INSERT INTO clientes_auditoria( id_cliente,nombre,email,fecha_eliminacion) VALUES
(OLD.id, OLD.nombre, OLD.email);

END $$
DELIMITER ;