-- 1 Creacion de Base de datos, usuario y tablas
CREATE DATABASE grupal4;

-- creacion de Uasuario
CREATE USER 'grupo8'@'localhost' IDENTIFIED BY 'tu_contraseña_aqui';
GRANT ALL PRIVILEGES ON grupal4.* TO 'grupo8'@'localhost';
FLUSH PRIVILEGES;

USE grupal4;
-- Creacion tabla Ususarios
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    zona_horaria VARCHAR(50) DEFAULT 'UTC-3',
    genero VARCHAR(20) NOT NULL,
    telefono VARCHAR(20) NOT NULL
);
-- creacion tabla  ingresos
CREATE TABLE ingresos (
    id_ingreso INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    fecha_hora_ingreso TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);


-- 2 modificacion de  comluna zona_horaria UTC-3 to UTC-2
ALTER TABLE usuarios MODIFY COLUMN zona_horaria VARCHAR(50) DEFAULT 'UTC-2';


-- 3creacion de registos en tabla usuarios
-- insert ragistrosen tabla usuarios
INSERT INTO Usuarios (nombre, apellido, contraseña, genero, telefono_contacto) VALUES
('Juan', 'Perez', 'password1', 'M', '123456789'),
('Ana', 'Gomez', 'password2', 'F', '987654321'),
('Luis', 'Martinez', 'password3', 'M', '555444333'),
('Maria', 'Lopez', 'password4', 'F', '111222333'),
('Carlos', 'Sanchez', 'password5', 'M', '666777888'),
('Laura', 'Diaz', 'password6', 'F', '999888777'),
('Pedro', 'Ramirez', 'password7', 'M', '222333444'),
('Sofia', 'Fernandez', 'password8', 'F','444555666');


-- insert registrso en tabla ingresos
INSERT INTO ingresos (id_usuario)
VALUES
(1), (2), (3), (4), (5), (6), (7), (8);

-- 4 justificacion para cada tipo  datos

-- id_usuario, id_ingreso: Tipo INT con AUTO_INCREMENT se utiliza porque son claves primarias, y se requiere un identificador único que sea entero y secuencial.
-- nombre, apellido, zona_horaria: Tipo VARCHAR con longitud suficiente para almacenar textos cortos como nombres, apellidos y zonas horarias.
-- contraseña: Tipo VARCHAR(255) para permitir el almacenamiento de contraseñas encriptadas que pueden ser largas.
-- genero: Tipo ENUM para limitar las opciones de género a valores específicos y predefinidos.
-- telefono: Tipo VARCHAR(20) porque los números de teléfono pueden incluir caracteres como guiones o espacios, y su longitud puede variar.
-- fecha_hora_ingreso: Tipo TIMESTAMP con DEFAULT CURRENT_TIMESTAMP para registrar automáticamente la fecha y hora de ingreso.


-- 5 Creacion tabla contactos

CREATE TABLE Contactos (
    id_contacto INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    numero_telefono VARCHAR(20),
    correo_electronico VARCHAR(100),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
);

-- 6 modificacion columna telefonoa en tabla ususarios
-- como se ya se creo una coluna numero_telefono en contactos, y se guardaros los telefonos ahi, 
-- la colunama telefono se elimina
ALTER TABLE usuarios
DROP COLUMN telefono;
-- con esto se asegura que los números de teléfono estén vinculados correctamente con los usuarios 
-- a través de la tabla contactos, evitando redundancia 