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
('centro'),
('mamatoco'),
('taganga'),
('garagoa'),
('timayui'),
('buenavista'),
('mercado'),
('ciudad equidad'),
('aeropuerto'),
('rodadero'),
('gaira'),
('av. libertador'),
('bahia'),
('bonda'),
('universidad del magdalena'),
('av. del rio'),
('maria eugenia');

INSERT INTO rutas (nombre, descripcion, imagen_url, origen_id, destino_id, estado_id)
VALUES (
    'SM101',
    'Salida Terminal de Transferencia de Gaira – punto de retorno Av santa Rita:
Tomando la Doble calzada hacia sector de bello horizonte – desviamos hacia el
aeropuerto – regresando por la doble calzada, pasando por la variante debajo
del puente – entrada al barrio la paz (recorrido interno) – retorno a la doble
calzada- bomba zuca – tomamos la carrera 4 del rodadero – hasta ziruma – toda
la carrera 4 santa marta- calle 22 con carrera 4 – calle 22 con carrera 5 – tomamos
carrera 5 hasta la Av. del Ferrocarril – Av. ferrocarril hasta la carrera 1 – carrera 1
hasta calle 22 – calle 22 hasta la carrera 4 – carrera 4 hasta ziruma – carrera 4
rodadero – finalizando en la terminal de transferencia de gaira.',
    'https://setpsantamarta.gov.co/wp-content/uploads/SM101.jpeg',
    (SELECT id FROM ubicaciones WHERE nombre = 'aeropuerto'),
    (SELECT id FROM ubicaciones WHERE nombre = 'centro'),
    (SELECT id FROM estados WHERE nombre = 'Activa')
);

INSERT INTO rutas (nombre, descripcion, imagen_url, origen_id, destino_id, estado_id)
VALUES (
    'SM102',
    'Salida Terminal de Transferencia de Mamatoco – Punto de retorno Taganga:
Tomando la glorieta de mamatoco – tomando la troncal del caribe hacia Riohacha –
entrando a garagoa – cantilito – pasamos el puente hacia timayui- recorrido por timayui
1 y 2 – regresamos por la misma vía hasta la troncal del caribe – glorieta de mamatoco
– pasando por Buenavista hasta la Av. del libertador – Av del libertador hasta la carrera
24 – carrera 24 hasta Av. santa Rita (calle 22) – calle 22 hasta carrera 5 – carrera 5
hasta Av. del Ferrocarril – tomamos la calle 11 (mercado público), Hasta la carrera 11 –
carrera 11 hasta taganga – una vez allí realizamos un recorrido interno hasta
“santropel” pasando por el nuevo IED de taganga – regresamos hasta finalizar en el
camellón del corregimiento – una vez allí iniciamos el recorrido de regreso – bajamos
de taganga – carrera 11 hasta la calle 10 – calle 10 hasta carrera 5 – Av. del ferrocarril
hasta carrera 1– carrera 1hasta la calle 22 – calle 22 hasta la carrera 24 – carrera 24
hasta Av del Libertador –Av del libertador hasta la glorita del Buenavista – finalizando
en la terminal de transferencia de mamatoco',
    'https://setpsantamarta.gov.co/wp-content/uploads/SM102.jpeg',
    (SELECT id FROM ubicaciones WHERE nombre = 'taganga'),
    (SELECT id FROM ubicaciones WHERE nombre = 'timayui'),
    (SELECT id FROM estados WHERE nombre = 'Activa')
);

INSERT INTO rutas (nombre, descripcion, imagen_url, origen_id, destino_id, estado_id)
VALUES (
    'SM103',
    'Salida Terminal de Transferencia de gaira – Punto de retorno Bonda: Tomando la
Doble calzada – pasamos por el sector de bello horizonte – zona hotelera – irotama,
zuana beach resort, medicure, estelar, etc. – tomamos la doble calzada hasta el
aeropuerto-regresamos por misma vía, pasando por la variante debajo del puente-
entrada al barrio la paz – seguimos por la doble calzada hacia bomba zuca – pasamos
por el otro sentido al frente de la terminal de transferencia de gaira – continuamos por la
doble calzada hacia el sector de la lucha – tomamos la vía por encima del puente hasta
la glorieta de la piragua – tomamos la glorita hacia la izquierda hasta empalmar con la
glorieta de mamatoco – giramos hacia la derecha, pasando por el frente del Buenavista
hasta llegar a la glorieta de mamatoco – pasamos la glorieta – tomamos la troncal del
caribe que conduce a Riohacha – llegamos a la “YE” y desviamos hacia la derecha
hasta llegar a bonda – realizamos un recorrido interno – regresamos a la vía principal –
tomamos nuevamente la troncal hacia la glorieta de mamatoco – pasamos por
Buenavista hasta tomar la glorieta – hacia la izquierda – llegamos a la glorieta de la
piragua – continuando derecho por la doble calzada – tomamos la vía que desvía justo
por al frente de la terminal seguimos hacia la glorieta de la lucha conectando
nuevamente con la doble calzada – continuamos por esa misma vía hasta finalizar en la
terminal de transferencia de gaira.',
    'https://setpsantamarta.gov.co/wp-content/uploads/SM103-1024x932.jpeg',
    (SELECT id FROM ubicaciones WHERE nombre = 'bonda'),
    (SELECT id FROM ubicaciones WHERE nombre = 'aeropuerto'),
    (SELECT id FROM estados WHERE nombre = 'Activa')
);

INSERT INTO rutas (nombre, descripcion, imagen_url, origen_id, destino_id, estado_id)
VALUES (
    'SM104',
    'Salida Terminal de Transferencia de lucha – Mamatoco – retorno Av ferrocarril:
con carrera 5 Tomamos la glorieta de la lucha pasando por debajo del
puente hacia la doble calzada– hasta llegar a la glorita de la piragua –
continuando la doble calzada llegamos a la glorita de mamatoco – a la
derecha desviamos por debajo de la glorieta que toma la vía hacia
Riohacha y tomamos la vía a minca – pasamos por arriba del puente que
está justo al frente de villa Toledo – tomamos la carretera hacia minca –
llegamos hasta la entrada de ciudad equidad – hacemos un recorrido
interno hasta la manzana 10 .- retornamos por la misma via – regresamos
por la vía a minca hasta llegar a la variante de la via a Riohacha – hacia la
izquierda llegamos a la glorieta de mamatoco – tomamos la doble calzada
hacia la glorieta de la piragua – seguimos derecho por la doble calzada –
justo por la vía que está al frente de la terminal desviamos – seguimos
hacia la glorieta de la lucha – a la derecha seguimos por la Av. del
ferrocarril derecho hasta la calle 22 (santa Rita) – calle 22 hasta la carrera
5 – carera 5 hasta a la Av. del ferrocarril – toda la Av. del ferrocarril hasta
finalizar en la terminal de transferencia de la lucha.',
    'https://setpsantamarta.gov.co/wp-content/uploads/SM104-1024x932.jpeg',
    (SELECT id FROM ubicaciones WHERE nombre = 'centro'),
    (SELECT id FROM ubicaciones WHERE nombre = 'ciudad equidad'),
    (SELECT id FROM estados WHERE nombre = 'Activa')
);

INSERT INTO rutas (nombre, descripcion, imagen_url, origen_id, destino_id, estado_id)
VALUES (
    'SM106',
    'Salida Terminal de Transferencia de la lucha – retorno en la Av. del
ferrocarril con carrera 5 Tomamos la glorieta de la lucha pasando por
debajo del puente – hacia la doble calzada hasta la entrada del antiguo
royer (carrera 29) hasta la calle 53 – hacia la izquierda por la calle 53
hasta la carrera 30 hacia el barrio Andrea carolina realizando un
recorrido interno – salimos nuevamente a la calle 53 sector de las
bodegas donados – calle 53 hasta la carrera 24- a la izquierda hasta
carrera 24 hasta la calle 48 – a la derecha hasta la carrera 21F –
carrera 21F hasta la calle 46 – calle 46 hasta la carrera 21B8 – a la
izquierda la glorieta de la lucha – a la derecha tomamos la glorieta y
pasamos por debajo del puente – hasta conectar con la Av. del
ferrocarril – por la Av. del ferrocarril hasta la calle 22 (santa Rita) –
calle 22 hasta la carrera 5 – carrera 5 hasta hasta la Av. del ferrocarril –
Av del ferrocarril hasta carrera 1 (camellón turístico) – carrera 1hasta la
calle 22 (santa Rita) – calle 22 hasta la Av. del ferrocarril – Av del
ferrocarril finalizando en la terminal de transferencia de la lucha.',
    'https://setpsantamarta.gov.co/wp-content/uploads/SM106-1024x932.jpeg',
    (SELECT id FROM ubicaciones WHERE nombre = 'bahia'),
    (SELECT id FROM ubicaciones WHERE nombre = 'universidad del magdalena'),
    (SELECT id FROM estados WHERE nombre = 'Activa')
);

INSERT INTO rutas (nombre, descripcion, imagen_url, origen_id, destino_id, estado_id)
VALUES (
    'SM110',
    'Salida Terminal de Transferencia de mamatoco – Retorno
en la Av del ferrocarril con carrera 5 Tomando la glorieta
de mamatoco – hacia la troncal del caribe que conduce a
Riohacha – llegamos a la “YE” y desviamos hacia la
izquierda hasta llegar a bonda – realizamos un recorrido
interno – y seguimos hasta el curval – regresamos a la via
principal – tomamos nuevamente la troncal hacia la
glorieta de mamtoco – pasamos por Buenavista hasta la
glorieta hasta la Av. del libertador – tomamos toda la Av.
del hasta la Av. del ferrocarril – Av. del ferrocarril hasta la
carrera 1ª (camellón turístico) – carrera 1 hasta la calle 22
(santa Rita) – calle 22 hasta la carrera 5 con calle 22 –
luego giramos a la izquierda hasta llegar a la Av. del
ferrocarril con carrera 5 – Av. del ferrocarril hasta la Av.
del libertador – giramos a la izquierda y recorremos toda
la Av. del libertador hasta la glorieta de la quinta de san
pedro alejandrino – giramos a la izquierda por la glorita
hasta finalizar con la terminal de transferencia de
mamatoco.',
    'https://setpsantamarta.gov.co/wp-content/uploads/SM110.jpeg',
    (SELECT id FROM ubicaciones WHERE nombre = 'bahia'),
    (SELECT id FROM ubicaciones WHERE nombre = 'bonda'),
    (SELECT id FROM estados WHERE nombre = 'Activa')
);

INSERT INTO rutas (nombre, descripcion, imagen_url, origen_id, destino_id, estado_id)
VALUES (
    'SM112',
    'Salida Terminal de Transferencia de mamatoco Tomamos la glorieta de
mamatoco realizando completamente la “U” a la rotonda regresamos
hasta la Av. del libertador – tomamos toda esa avenida hasta la carrera
24 – giramos a la izquierda hasta salir a la calle 22 (santa Rita) – giramos
a la derecha por toda la avenida santa Rita hasta la carrera 5 – doblamos
a la izquierda por todo la carrera 5 hasta la calle 30 – giramos a la
izquierda hasta la carrera 13 – giramos a la derecha hasta la calle 38 –
giramos a la izquierda hasta la carrera 14 – luego nuevamente a la
izquierda hasta la calle 33 – giramos a la derecha hasta la carrera 18 –
bajamos hasta la calle 30 y regresamos por la misma – tomamos toda la
calle 30 hasta la carrera 5 – luego giramos a la derecha por toda la
carrera 5 hasta la calle 22 – giramos a la derecha y transitamos toda la
calle 22 “avenida santa Rita” hasta la carrera 24 – doblamos a la
izquierda hasta llegar a la Av. del libertador – giramos a la derecha por
toda la avenida del libertador hasta la entrada a bastidas – giramos a la
izquierda para luego entrar y hacer u recorrido interno en el barrio
Galicia – hasta empalmar con la via alterna al puerto – para luego tomar
la variante debajo del puente de Galicia y hacer un recorrido interno por
los barrios santa fe, tayrona – para luego salir a la Av del libertador –
tomar la glorieta de la quinta de san pedro alejandrino – finalizando en la
terminal de transferencia de mamatoco.',
    'https://setpsantamarta.gov.co/wp-content/uploads/SM112-1024x932.jpeg',
    (SELECT id FROM ubicaciones WHERE nombre = 'mamatoco'),
    (SELECT id FROM ubicaciones WHERE nombre = 'maria eugenia'),
    (SELECT id FROM estados WHERE nombre = 'Activa')
);

INSERT INTO rutas (nombre, descripcion, imagen_url, origen_id, destino_id, estado_id)
VALUES (
    'SM114',
    'Salida Terminal de Transferencia de la lucha – Retorno arrecife
rodadero Tomamos la glorieta de la lucha pasando por un lado del
puente conectado con la doble calzada a ciénaga – continuamos por
la doble calzada hasta la entrada a gaira – recorrido interno por gaira
(vía principal) pasando por la calle 6 hasta llegar a la carrera 4 del
rodadero – giramos ala derecha por la carrera 4 hasta el centro
comercial arrecife – hacemos el regreso por la misma vía (carrera 4 )
– hasta la calle 6 de gaira – recorrido interno por gaira hasta llegar a
la doble calzada – tomamos la doble calzada hasta el retorno que
está en villas del palmar – retornamos por la doble calzada hasta la
lucha – tomamos la glorieta por debajo del puente hasta conectar con
la Av. del ferrocarril – tomamos toda la avenida del ferrocarril hasta la
calle 22 – giramos a la izquierda por la avenida santa Rita hasta la
carrera 5 – giramos a la derecha y transitamos por todo el centro de
la ciudad hasta la Av. del ferrocarril – giramos a la derecha y
transitamos por toda esa avenida hasta finalizar en la terminal de
transferencia de la lucha.',
    'https://setpsantamarta.gov.co/wp-content/uploads/SM114.jpeg',
    (SELECT id FROM ubicaciones WHERE nombre = 'centro'),
    (SELECT id FROM ubicaciones WHERE nombre = 'rodadero'),
    (SELECT id FROM estados WHERE nombre = 'Activa')
);

INSERT INTO rutas (nombre, descripcion, imagen_url, origen_id, destino_id, estado_id)
VALUES (
    'SM119',
    'Salida Terminal de Transferencia de mamatoco – Regreso
Ciudad Equidad Tomamos la glorieta hacia la derecha,
desviamos por debajo de la glorieta que toma la vía hacia
Riohacha y tomamos la vía a minca – pasamos por arriba
del puente que está justo frente de villa Toledo – tomamos
la carretera hacia minca – llegamos hasta la entrada de
ciudad equidad – hacemos un recorrido interno hasta la
manzana 10 .- retornamos hacia la entrada – regresamos
por la vía a minca hasta llegar a la variante de la vía a
Riohacha – hacia la izquierda llegamos a la glorieta de
mamatoco – hasta la glorieta del Buenavista – tomamos
toda la Av. del libertador hasta la Av. del ferrocarril – hasta
la carrera 1 (camellón turístico) – carrera 1 hasta la calle 22
– calle 22 hasta la carrera 5 – a la izquierda transitamos
todo el centro de la ciudad hasta la Av del ferrocarril –
hasta la Av del libertador – tomamos toda esta avenida
hasta la glorieta del Buenavista – para finalizar en la
terminal de transferencia de gaira.',
    'https://setpsantamarta.gov.co/wp-content/uploads/SM119-1024x932.jpeg',
    (SELECT id FROM ubicaciones WHERE nombre = 'ciudad equidad'),
    (SELECT id FROM ubicaciones WHERE nombre = 'centro'),
    (SELECT id FROM estados WHERE nombre = 'Activa')
);

INSERT INTO rutas (nombre, descripcion, imagen_url, origen_id, destino_id, estado_id)
VALUES (
    'SM121',
    'Salida Terminal de Transferencia de mamatoco – regreso
en el barrio la Rosalía Tomamos la glorieta hacia la derecha
desviamos por debajo de la glorieta que toma la vía hacia
Riohacha y tomamos la vía a minca – pasamos por arriba
del puente que está justo frente de villa Toledo – tomamos
la carretera hacia minca – llegamos hasta la entrada de la
Rosalía – hacemos un recorrido interno – retornamos hacia
la entrada – regresamos por la vía a minca hasta llegar a la
variante de la vía a Riohacha – hacia la izquierda llegamos
a la glorieta de mamatoco – hasta la glorieta del Buenavista
– tomamos toda la Av. del libertador hasta la Av. del Rio –
toda la Av. del Rio hasta la carrera 4 – carrera 4 hasta la
calle 22 – calle 22 hasta la carrera 5 – carrera 5 hasta Av.
del rio – Av. del rio hasta Av. del libertador – Av. del
libertador girando a la izquierda por la glorieta del
Buenavista – finalizando en la terminal de transferencia de
mamatoco.',
    'https://setpsantamarta.gov.co/wp-content/uploads/SM121-1024x932.jpeg',
    (SELECT id FROM ubicaciones WHERE nombre = 'av. del rio'),
    (SELECT id FROM ubicaciones WHERE nombre = 'ciudad equidad'),
    (SELECT id FROM estados WHERE nombre = 'Activa')
);

INSERT INTO horarios (ruta_id, frecuencia_minutos, hora_inicio, hora_fin)
VALUES (
    1,
    15,
    '04:30',
    '21:00'
);
INSERT INTO horarios (ruta_id, frecuencia_minutos, hora_inicio, hora_fin)
VALUES (
    2,
    15,
    '04:30',
    '22:00'
);

INSERT INTO horarios (ruta_id, frecuencia_minutos, hora_inicio, hora_fin)
VALUES (
    3,
    20,
    '04:10',
    '21:00'
);

INSERT INTO horarios (ruta_id, frecuencia_minutos, hora_inicio, hora_fin)
VALUES (
    4,
    15,
    '04:30',
    '21:00'
);

INSERT INTO horarios (ruta_id, frecuencia_minutos, hora_inicio, hora_fin)
VALUES (
    5,
    25,
    '04:00',
    '22:30'
);

INSERT INTO horarios (ruta_id, frecuencia_minutos, hora_inicio, hora_fin)
VALUES (
    6,
    15,
    '04:30',
    '21:00'
);

INSERT INTO horarios (ruta_id, frecuencia_minutos, hora_inicio, hora_fin)
VALUES (
    7,
    25,
    '04:40',
    '21:00'
);

INSERT INTO horarios (ruta_id, frecuencia_minutos, hora_inicio, hora_fin)
VALUES (
    8,
    20,
    '04:40',
    '21:00'
);


INSERT INTO horarios (ruta_id, frecuencia_minutos, hora_inicio, hora_fin)
VALUES (
    9,
    15,
    '04:20',
    '21:00'
);

INSERT INTO horarios (ruta_id, frecuencia_minutos, hora_inicio, hora_fin)
VALUES (
    10,
    20,
    '04:40',
    '21:00'
);