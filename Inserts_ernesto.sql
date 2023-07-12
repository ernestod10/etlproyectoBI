-- Insertar datos en la tabla ESTADO
INSERT INTO ESTADO (ID_ESTADO, NOMBRE) VALUES
(1, 'Amazonas'),
(2, 'Anzoátegui'),
(3, 'Apure'),
(4, 'Aragua'),
(5, 'Barinas'),
(6, 'Bolívar'),
(7, 'Carabobo'),
(8, 'Cojedes'),
(9, 'Delta Amacuro'),
(10, 'Falcón'),
(11, 'Guárico'),
(12, 'Lara'),
(13, 'Mérida'),
(14, 'Miranda'),
(15, 'Monagas'),
(16, 'Nueva Esparta'),
(17, 'Portuguesa'),
(18, 'Sucre'),
(19, 'Táchira'),
(20, 'Trujillo'),
(21, 'Vargas'),
(22, 'Yaracuy'),
(23, 'Zulia'),
(24, 'Distrito Capital'),
(25, 'Dependencias Federales');

-- Insertar datos en la tabla CIUDAD
INSERT INTO CIUDAD (ID_CIUDAD, NOMBRE, ID_ESTADO) VALUES
(1, 'Caracas', 24),
(2, 'Maracaibo', 23),
(3, 'Valencia', 7),
(4, 'Barquisimeto', 12),
(5, 'Maracay', 4),
(6, 'Ciudad Guayana', 6),
(7, 'Maturín', 15),
(8, 'Barcelona', 2),
(9, 'Puerto La Cruz', 2),
(10, 'San Cristóbal', 19);

-- Insertar datos en la tabla TIPO_PROVEE
INSERT INTO TIPO_PROVEE (ID_TIPO, DESCRIPCION) VALUES
(1, 'Farmacia'),
(2, 'Distribuidor médico'),
(3, 'Proveedor de equipos médicos');

-- Insertar datos en la tabla PROVEE
INSERT INTO PROVEE (ID_PROVEE, NOMBRE, RIF, TELEFONO, FAX, ID_TIPO, ID_CIUDAD, DIRECCION) VALUES
(1, 'Farmacia San José', 'J-12345678-9', '0212-1234567', '0212-9876543', 1, 1, 'Calle 123, Urb. Los Álamos'),
(2, 'Distribuciones Médicas C.A.', 'J-87654321-0', '0212-9876543', '0212-1234567', 2, 2, 'Av. Principal, Zona Industrial'),
(3, 'Equipos Médicos Valencia', 'J-56789012-3', '0241-9876543', '0241-1234567', 3, 3, 'Calle 456, Sector La Floresta');

-- Insertar datos en la tabla ESPECIALIDAD
INSERT INTO ESPECIALIDAD (ID_ESPECIALIDAD, DESCRIPCION) VALUES
(1, 'Cardiología'),
(2, 'Pediatría'),
(3, 'Ginecología'),
(4, 'Oftalmología');

INSERT into sx values (1, 'M');
INSERT into sx values (2, 'F');

Insert into ESTADO_CIVIL values (1, 'Soltero');
Insert into ESTADO_CIVIL values (2, 'Casado');
Insert into ESTADO_CIVIL values (3, 'Divorciado');
Insert into ESTADO_CIVIL values (4, 'Viudo');

-- Insertar datos en la tabla MEDICO
INSERT INTO MEDICO (CI_MEDICO, COD_COLEGIO_MEDICO, NOMBRE, APELLIDO, F_NACIMIENTO, F_CONTRATACION, id_sx, id_ESTADO_CIVIL, ID_ESPECIALIDAD, ID_CIUDAD) VALUES
(123456, 987654, 'Juan', 'Pérez', '1980-05-15', '2010-10-20', 1, , 1, 2,1),
(234567, 876543, 'María', 'García', '1985-09-02', '2012-07-10', 2,2, 2, 2),
(345678, 765432, 'Carlos', 'López', '1975-12-10', '2005-03-15', 1, 3, 3, 3),
(456789, 654321, 'Laura', 'Rodríguez', '1990-07-20', '2018-09-05', 2, 1, 4, 4);

-- Insertar datos en la tabla TIENE
INSERT INTO TIENE (CI_MEDICO, ID_ESPECIALIDAD, ANOS_EXPERIENCIA) VALUES
(123456, 1, 10),
(234567, 2, 8),
(345678, 3, 15),
(456789, 4, 5);

-- Insertar datos en la tabla AREA
INSERT INTO AREA (ID_AREA, ID_ESPECIALIDAD, CI_MEDICO_ENCARGADO, PISO, PASILLO) VALUES
(1, 1, 123456, 5, 1),
(2, 2, 234567, 3, 2),
(3, 3, 345678, 2, 1),
(4, 4, 456789, 6, 2);

-- Insertar datos en la tabla MEDICINA
INSERT INTO MEDICINA (ID_MEDICINA, NOMBRE, PRESENTACION, POSOLOGIA, EFECTOS_SECUNDARIOS, ID_PROVEE) VALUES
(1, 'Aspirina', 'Tabletas', 'Tomar 1 tableta cada 6 horas', 'Náuseas, dolor de estómago', 1),
(2, 'Amoxicilina', 'Cápsulas', 'Tomar 1 cápsula cada 8 horas', 'Erupciones en la piel, diarrea', 2),
(3, 'Ibuprofeno', 'Tabletas', 'Tomar 1 tableta cada 8 horas', 'Dolor de cabeza, mareos', 1);

-- Insertar datos en la tabla TRABAJA
INSERT INTO TRABAJA (ID_MEDICO, ID_AREA, F) VALUES
(123456, 1, '2023-06-01'),
(234567, 2, '2023-06-02'),
(345678, 3, '2023-06-03'),
(456789, 4, '2023-06-04');

-- Insertar datos en la tabla PERSONAL_SANITARIO
INSERT INTO PERSONAL_SANITARIO (CI_PERSONAL, NOMBRE, APELLIDO, FUNCION, ID_AREA) VALUES
(987654, 'Ana', 'López', 'Enfermera', 1),
(876543, 'Pedro', 'Gómez', 'Técnico radiólogo', 2),
(765432, 'Luisa', 'Hernández', 'Auxiliar de laboratorio', 3),
(654321, 'Roberto', 'Sánchez', 'Fisioterapeuta', 4);

-- Insertar datos en la tabla DIAGN
INSERT INTO DIAGN (ID_DIAGN, TIPO, NOMBRE, DESCRIPCION, COSTO) VALUES
(1, 'Enfermedad', 'Gripe', 'Infección respiratoria aguda', 50.0),
(2, 'Lesión', 'Fractura de brazo', 'Hueso fracturado en el brazo', 200.0),
(3, 'Enfermedad', 'Hipertensión arterial', 'Presión arterial elevada', 100.0);

-- Insertar datos en la tabla CAMA
INSERT INTO CAMA (ID_NUMBER_CAMA, ID_AREA_HOSPITAL) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);

-- Insertar datos en la tabla TRATAMIENTO
INSERT INTO TRATAMIENTO (ID_TRATAMIENTO, DESCRIPCION, COSTO) VALUES
(1, 'Antibiótico', 80.0),
(2, 'Analgesia', 30.0),
(3, 'Rehabilitación', 150.0);

-- Insertar datos en la tabla APLICA
INSERT INTO APLICA (ID_MEDICINA, ID_TRATAMIENTO, CANT_DIAS, F_INICIO, F_FIN) VALUES
(1, 1, 7, '2023-06-01', '2023-06-08'),
(2, 2, 5, '2023-06-02', '2023-06-07'),
(3, 3, 10, '2023-06-03', '2023-06-13');

-- Insertar datos en la tabla PAC
INSERT INTO PAC (CI_PAC, NOMBRE, APELLIDO, F_NACIMIENTO, TIPO_SANGRE, NACIONALIDAD, id_ESTADO_CIVIL, id_sx, ID_CIUDAD) VALUES
(10000000, 'José', 'González', '1978-03-10', 'O+', 'Venezolano', 1, 1, 1),
(20000000, 'María', 'López', '1985-07-20', 'A-', 'Venezolana', 4, 2, 2),
(30000000, 'Carlos', 'Pérez', '1992-11-05', 'B+', 'Venezolano', 2, 1, 3),
(40000000, 'Laura', 'Rodríguez', '1980-09-15', 'AB+', 'Venezolana', 1, 2, 4);

-- Insertar datos en la tabla INTERVENCION
INSERT INTO INTERVENCION (ID_INTERVENCION, DESCRIPCION, TIPO) VALUES
(1, 'Cirugía de apéndice', 'Cirugía general'),
(2, 'Extracción de muela', 'Odontología'),
(3, 'Cesárea', 'Ginecología');

-- Insertar datos en la tabla PRESCRIBE
INSERT INTO PRESCRIBE (CI_MEDICO, CI_PAC, ID_TRATAMIENTO, NUMBER_INGRESO, F_ELABORACION) VALUES
(123456, 10000000, 1, 1, '2023-06-01'),
(234567, 20000000, 2, 2, '2023-06-02'),
(345678, 30000000, 3, 3, '2023-06-03'),
(456789, 40000000, 1, 4, '2023-06-04');

