-- Insertar datos en la tabla pacientes
INSERT INTO pacientes (nombre, apellido, fecha_nacimiento, hora_nacimiento, sexo, peso_nacimiento, talla_nacimiento, perimetro_cefalico, edad_gestacional, tipo_parto, apgar_1min, apgar_5min, fecha_ingreso, estado, id_unidad)
VALUES 
('Juan', 'Pérez', '2024-10-01', '08:30:00', 'M', 2500.00, 48.5, 33.0, 38, 'Vaginal', 8, 9, '2024-10-01 09:00:00', 'Estable', 1),
('María', 'González', '2024-10-02', '14:45:00', 'F', 3000.00, 50.0, 34.5, 40, 'Cesárea', 7, 9, '2024-10-02 15:30:00', 'Estable', 2),
('Carlos', 'Rodríguez', '2024-10-03', '22:15:00', 'M', 1800.00, 45.0, 30.5, 34, 'Vaginal', 6, 8, '2024-10-03 23:00:00', 'Crítico', 1);

-- Insertar datos en la tabla signos_vitales
INSERT INTO signos_vitales (id_paciente, fecha_hora, temperatura, frecuencia_cardiaca, frecuencia_respiratoria, presion_arterial_sistolica, presion_arterial_diastolica, saturacion_oxigeno)
VALUES 
(1, '2024-10-01 10:00:00', 36.5, 140, 40, 60, 30, 98.0),
(2, '2024-10-02 16:00:00', 36.8, 135, 42, 65, 35, 99.0),
(3, '2024-10-03 23:30:00', 37.2, 150, 50, 55, 28, 94.0);

-- Insertar datos en la tabla soporte_respiratorio
INSERT INTO soporte_respiratorio (id_paciente, fecha_inicio, fecha_fin, tipo_soporte, parametros)
VALUES 
(1, '2024-10-01 09:30:00', NULL, 'Oxígeno', 'FiO2 30%'),
(2, '2024-10-02 16:30:00', '2024-10-03 10:00:00', 'CPAP', 'PEEP 5 cmH2O'),
(3, '2024-10-03 23:15:00', NULL, 'Ventilación Mecánica', 'Modo A/C, VT 4ml/kg, FR 40');

-- Insertar datos en la tabla alimentacion
INSERT INTO alimentacion (id_paciente, fecha_hora, tipo_alimentacion, volumen, via_administracion, tolerancia)
VALUES 
(1, '2024-10-01 12:00:00', 'Enteral', 20.00, 'Oral', 'Buena'),
(2, '2024-10-02 18:00:00', 'Enteral', 30.00, 'SNG', 'Regular'),
(3, '2024-10-04 06:00:00', 'Parenteral', 100.00, NULL, NULL);

-- Insertar datos en la tabla medicamentos
INSERT INTO medicamentos (id_paciente, fecha_hora_administracion, nombre_medicamento, dosis, unidad_dosis, via_administracion)
VALUES 
(1, '2024-10-01 10:30:00', 'Ampicilina', 100.00, 'mg', 'Intravenosa'),
(2, '2024-10-02 17:00:00', 'Gentamicina', 5.00, 'mg', 'Intravenosa'),
(3, '2024-10-04 00:00:00', 'Surfactante', 200.00, 'mg', 'Intratraqueal');

-- Insertar datos en la tabla eventos_clinicos
INSERT INTO eventos_clinicos (id_paciente, fecha_hora, tipo_evento, descripcion, gravedad, resultado)
VALUES 
(1, '2024-10-01 11:00:00', 'Procedimiento', 'Colocación de catéter umbilical', NULL, 'Exitoso'),
(2, '2024-10-02 20:00:00', 'Complicación', 'Hipoglucemia', 'Moderada', 'Resuelta con infusión de dextrosa'),
(3, '2024-10-04 02:00:00', 'Complicación', 'Neumotórax', 'Grave', 'Requirió colocación de sello pleural');

-- Insertar datos en la tabla personal_medico
INSERT INTO personal_medico (nombre, apellido, especialidad, numero_colegiado, usuario, contrasena)
VALUES 
('Ana', 'Martínez', 'Neonatología', 'N12345', 'anamartinez', 'hash_password_1'),
('Pedro', 'Sánchez', 'Enfermería Neonatal', 'E67890', 'pedrosanchez', 'hash_password_2'),
('Laura', 'Gómez', 'Pediatría', 'P54321', 'lauragomez', 'hash_password_3');

-- Insertar datos en la tabla notas_clinicas
INSERT INTO notas_clinicas (id_paciente, id_personal, fecha_hora, tipo_nota, contenido)
VALUES 
(1, 1, '2024-10-01 14:00:00', 'Evolución', 'Paciente estable, continúa con oxígeno suplementario.'),
(2, 2, '2024-10-03 09:00:00', 'Evolución', 'Se retira CPAP, tolera aire ambiente.'),
(3, 3, '2024-10-04 10:00:00', 'Consulta Interdisciplinaria', 'Se solicita valoración por cardiología por soplo sistólico.');

-- Insertar datos en la tabla control_crecimiento
INSERT INTO control_crecimiento (id_paciente, fecha, peso, talla, perimetro_cefalico)
VALUES 
(1, '2024-10-05', 2550.00, 49.0, 33.5),
(2, '2024-10-06', 3050.00, 50.5, 35.0),
(3, '2024-10-07', 1850.00, 45.5, 31.0);

-- Insertar datos en la tabla unidades_cuidado
INSERT INTO unidades_cuidado (nombre, nivel_atencion, capacidad)
VALUES 
('UCIN 1', 'Intensivo', 10),
('UCIN 2', 'Intermedio', 15),
('Cuidados Básicos', 'Básico', 20);

-- Insertar datos en la tabla padres_tutores
INSERT INTO padres_tutores (id_paciente, nombre, apellido, relacion, telefono, correo_electronico)
VALUES 
(1, 'Miguel', 'Pérez', 'Padre', '555-1234', 'miguel.perez@email.com'),
(2, 'Carmen', 'González', 'Madre', '555-5678', 'carmen.gonzalez@email.com'),
(3, 'Luis', 'Rodríguez', 'Padre', '555-9876', 'luis.rodriguez@email.com');

-- Insertar datos en la tabla pruebas_diagnosticas
INSERT INTO pruebas_diagnosticas (id_paciente, fecha_hora_solicitud, fecha_hora_resultado, tipo_prueba, subtipo, resultado, interpretacion)
VALUES 
(1, '2024-10-01 11:30:00', '2024-10-01 13:00:00', 'Laboratorio', 'Hemograma', 'Hb: 15.5 g/dL, Leucocitos: 12,000/mm3', 'Valores dentro de rangos normales para edad gestacional'),
(2, '2024-10-02 18:30:00', '2024-10-02 19:45:00', 'Imagen', 'Radiografía de Tórax', 'Sin alteraciones pleuropulmonares', 'Radiografía de tórax normal'),
(3, '2024-10-04 01:00:00', '2024-10-04 01:30:00', 'Laboratorio', 'Gasometría', 'pH: 7.25, pCO2: 55 mmHg, HCO3: 18 mEq/L', 'Acidosis respiratoria parcialmente compensada');

-- Insertar datos en la tabla transfusiones
INSERT INTO transfusiones (id_paciente, fecha_hora, tipo_sangre, volumen, componente, reaccion_adversa)
VALUES 
(3, '2024-10-04 08:00:00', 'O+', 30.00, 'Glóbulos Rojos', NULL),
(1, '2024-10-05 14:00:00', 'A+', 20.00, 'Plasma', 'Leve reacción urticariforme'),
(2, '2024-10-06 10:00:00', 'B+', 15.00, 'Plaquetas', NULL);

-- Insertar datos en la tabla insumos_medicos
INSERT INTO insumos_medicos (nombre, tipo, cantidad, unidad_medida, fecha_caducidad, estado, id_unidad)
VALUES 
('Sonda orogástrica 5Fr', 'Suministro', 100, 'Unidad', '2025-12-31', 'Disponible', 1),
('Ventilador neonatal', 'Equipo', 5, 'Unidad', NULL, 'En Uso', 1),
('Surfactante pulmonar', 'Suministro', 20, 'Vial', '2024-12-31', 'Disponible', 2);

-- Insertar datos en la tabla plan_tratamiento
INSERT INTO plan_tratamiento (id_paciente, fecha_inicio, fecha_fin, descripcion, objetivos)
VALUES 
(1, '2024-10-01', '2024-10-08', 'Manejo de taquipnea transitoria del recién nacido', 'Lograr destete de oxígeno, iniciar alimentación enteral completa'),
(2, '2024-10-02', '2024-10-09', 'Observación post-cesárea, inicio de alimentación', 'Vigilar signos de infección, lograr alimentación enteral exclusiva'),
(3, '2024-10-03', '2024-10-17', 'Manejo de síndrome de dificultad respiratoria', 'Estabilizar función respiratoria, prevenir complicaciones de prematurez');

-- Insertar datos en la tabla uso_insumos
INSERT INTO uso_insumos (id_insumo, id_paciente, fecha_uso, cantidad_usada, proposito)
VALUES 
(1, 1, '2024-10-01 10:00:00', 1, 'Colocación de sonda orogástrica'),
(2, 3, '2024-10-03 23:15:00', 1, 'Inicio de ventilación mecánica'),
(3, 2, '2024-10-02 18:00:00', 5, 'Administración de surfactante');