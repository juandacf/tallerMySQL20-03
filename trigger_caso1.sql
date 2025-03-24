-- 1. Crear las tablas productos y ventas .
-- 2. Implementar un trigger BEFORE INSERT para evitar ventas con cantidad mayor al stock
-- disponible.
-- 3. Probar el trigger.

CREATE TABLE productos (
id INT PRIMARY KEY AUTO_INCREMENT,
nombre VARCHAR(50),
stock INT
);
CREATE TABLE ventas (
id INT PRIMARY KEY AUTO_INCREMENT,
id_producto INT,
cantidad INT,
FOREIGN KEY (id_producto) REFERENCES productos(id)
);

DELIMITER $$

CREATE TRIGGER before_insert_venta
BEFORE INSERT ON ventas
FOR EACH ROW
BEGIN
    DECLARE stock_disponible INT;

    SELECT stock INTO stock_disponible FROM productos WHERE id = NEW.id_producto;
    
    IF NEW.cantidad > stock_disponible THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede realizar la venta: cantidad mayor al stock disponible';
    END IF;
END;
$$
DELIMITER ;