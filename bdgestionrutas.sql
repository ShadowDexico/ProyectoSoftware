DROP TABLE IF EXISTS horarios CASCADE;
DROP TABLE IF EXISTS rutas CASCADE;
DROP TABLE IF EXISTS ubicaciones CASCADE;
DROP TABLE IF EXISTS estados CASCADE;


CREATE TABLE estados (
    id SERIAL PRIMARY KEY NOT NULL,
    nombre VARCHAR(50) NOT NULL
);


CREATE TABLE ubicaciones (
    id SERIAL PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE rutas (
    id SERIAL PRIMARY KEY NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    imagen_url TEXT NOT NULL,
    origen_id INT REFERENCES ubicaciones(id) ON DELETE CASCADE,
    destino_id INT REFERENCES ubicaciones(id) ON DELETE CASCADE,
    estado_id INT REFERENCES estados(id) ON DELETE CASCADE
);

CREATE TABLE horarios (
    id SERIAL PRIMARY KEY,
    ruta_id INT REFERENCES rutas(id) ON DELETE CASCADE,
    frecuencia_minutos INT NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL
);

INSERT INTO estados (nombre) VALUES 
('Activa'),
('Inactiva'),
('En mantenimiento');

INSERT INTO ubicaciones (nombre) VALUES 
('Centro'),
('Mamatoco'),
('Taganga'),
('Garagoa'),
('Timayui'),
('Buenavista'),
('Mercado'),
('ciudad equidad'),
('aeropuerto'),
('robadero'),
('gaira'),
('av. libertador');

INSERT INTO rutas (nombre, descripcion, imagen_url, origen_id, destino_id, estado_id)
VALUES (
    'Ruta 1',
    'Salida Terminal de Transferencia de Mamatoco – Punto de retorno Taganga. Recorre Mamatoco, Troncal del Caribe, Garagoa, Cantilito, Timayui, Buenavista, Libertador, Santa Rita, Ferrocarril, Taganga y regresa al punto inicial.',
    'https://setpsantamarta.gov.co/wp-content/uploads/SM101-1024x932.jpeg',
    (SELECT id FROM ubicaciones WHERE nombre = 'Mamatoco'),
    (SELECT id FROM ubicaciones WHERE nombre = 'Taganga'),
    (SELECT id FROM estados WHERE nombre = 'Activa')
);

INSERT INTO horarios (ruta_id, frecuencia_minutos, hora_inicio, hora_fin)
VALUES (
    1,
    15,
    '04:30',
    '21:00'
);

select * from rutas;

SELECT * FROM horarios WHERE ruta_id = 1;