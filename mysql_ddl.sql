-- Tabla para los pacientes neonatales
-- Comandos para MySQL

-- 1. Crear la base de datos
CREATE DATABASE cuidados_neonatales_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- 2. Usar la base de datos
USE cuidados_neonatales_db;

-- Configuración del conjunto de caracteres y collation
SET NAMES utf8mb4;
SET CHARACTER SET utf8mb4;

-- Tabla para los pacientes neonatales
CREATE TABLE pacientes (
    id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    hora_nacimiento TIME NOT NULL,
    sexo ENUM('M', 'F', 'Indeterminado') NOT NULL,
    peso_nacimiento DECIMAL(6,2) NOT NULL,
    talla_nacimiento DECIMAL(4,1) NOT NULL,
    perimetro_cefalico DECIMAL(4,1),
    edad_gestacional INT NOT NULL,
    tipo_parto ENUM('Vaginal', 'Cesárea') NOT NULL,
    apgar_1min INT,
    apgar_5min INT,
    fecha_ingreso DATETIME NOT NULL,
    estado ENUM('Estable', 'Crítico', 'Mejorando') NOT NULL,
    id_unidad INT,
    FOREIGN KEY (id_unidad) REFERENCES unidades_cuidado(id_unidad)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla para los signos vitales
CREATE TABLE signos_vitales (
    id_signo_vital INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    fecha_hora DATETIME NOT NULL,
    temperatura DECIMAL(3,1),
    frecuencia_cardiaca INT,
    frecuencia_respiratoria INT,
    presion_arterial_sistolica INT,
    presion_arterial_diastolica INT,
    saturacion_oxigeno DECIMAL(4,1),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla para el soporte respiratorio
CREATE TABLE soporte_respiratorio (
    id_soporte INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME,
    tipo_soporte ENUM('Ninguno', 'Oxígeno', 'CPAP', 'Ventilación Mecánica') NOT NULL,
    parametros TEXT,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla para la alimentación
CREATE TABLE alimentacion (
    id_alimentacion INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    fecha_hora DATETIME NOT NULL,
    tipo_alimentacion ENUM('NPO', 'Enteral', 'Parenteral', 'Mixta') NOT NULL,
    volumen DECIMAL(6,2),
    via_administracion ENUM('Oral', 'SNG', 'SOG', 'Gastrostomía'),
    tolerancia ENUM('Buena', 'Regular', 'Mala'),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla para los medicamentos
CREATE TABLE medicamentos (
    id_medicamento INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    fecha_hora_administracion DATETIME NOT NULL,
    nombre_medicamento VARCHAR(100) NOT NULL,
    dosis DECIMAL(8,2) NOT NULL,
    unidad_dosis VARCHAR(20) NOT NULL,
    via_administracion ENUM('Oral', 'Intravenosa', 'Intramuscular', 'Subcutánea', 'Tópica') NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla para los eventos clínicos (complicaciones y procedimientos)
CREATE TABLE eventos_clinicos (
    id_evento INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    fecha_hora DATETIME NOT NULL,
    tipo_evento ENUM('Complicación', 'Procedimiento') NOT NULL,
    descripcion TEXT NOT NULL,
    gravedad ENUM('Leve', 'Moderada', 'Grave'),
    resultado TEXT,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla para el personal médico
CREATE TABLE personal_medico (
    id_personal INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    especialidad VARCHAR(100) NOT NULL,
    numero_colegiado VARCHAR(50) UNIQUE,
    usuario VARCHAR(50) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla para las notas clínicas
CREATE TABLE notas_clinicas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    id_personal INT,
    fecha_hora DATETIME NOT NULL,
    tipo_nota ENUM('Evolución', 'Consulta Interdisciplinaria') NOT NULL,
    contenido TEXT NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente),
    FOREIGN KEY (id_personal) REFERENCES personal_medico(id_personal)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla para el control de crecimiento
CREATE TABLE control_crecimiento (
    id_control INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    fecha DATE NOT NULL,
    peso DECIMAL(6,2) NOT NULL,
    talla DECIMAL(4,1) NOT NULL,
    perimetro_cefalico DECIMAL(4,1),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla para las unidades de cuidado
CREATE TABLE unidades_cuidado (
    id_unidad INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nivel_atencion ENUM('Básico', 'Intermedio', 'Intensivo') NOT NULL,
    capacidad INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla para los padres/tutores
CREATE TABLE padres_tutores (
    id_padre_tutor INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    relacion ENUM('Madre', 'Padre', 'Tutor Legal', 'Otro') NOT NULL,
    telefono VARCHAR(20),
    correo_electronico VARCHAR(100),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla para las pruebas diagnósticas
CREATE TABLE pruebas_diagnosticas (
    id_prueba INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    fecha_hora_solicitud DATETIME NOT NULL,
    fecha_hora_resultado DATETIME,
    tipo_prueba ENUM('Laboratorio', 'Imagen') NOT NULL,
    subtipo VARCHAR(100) NOT NULL,
    resultado TEXT,
    interpretacion TEXT,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla para las transfusiones
CREATE TABLE transfusiones (
    id_transfusion INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    fecha_hora DATETIME NOT NULL,
    tipo_sangre VARCHAR(5) NOT NULL,
    volumen DECIMAL(6,2) NOT NULL,
    componente ENUM('Sangre Total', 'Glóbulos Rojos', 'Plasma', 'Plaquetas') NOT NULL,
    reaccion_adversa TEXT,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla para los insumos médicos
CREATE TABLE insumos_medicos (
    id_insumo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo ENUM('Equipo', 'Suministro') NOT NULL,
    cantidad INT NOT NULL,
    unidad_medida VARCHAR(20) NOT NULL,
    fecha_caducidad DATE,
    estado ENUM('Disponible', 'En Uso', 'Agotado', 'En Mantenimiento') NOT NULL,
    id_unidad INT,
    FOREIGN KEY (id_unidad) REFERENCES unidades_cuidado(id_unidad)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Tabla para el plan de tratamiento
CREATE TABLE plan_tratamiento (
    id_plan INT AUTO_INCREMENT PRIMARY KEY,
    id_paciente INT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    descripcion TEXT NOT NULL,
    objetivos TEXT,
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE uso_insumos (
    id_uso INT AUTO_INCREMENT PRIMARY KEY,
    id_insumo INT,
    id_paciente INT,
    fecha_uso DATETIME NOT NULL,
    cantidad_usada DECIMAL(8,2) NOT NULL,
    proposito TEXT,
    FOREIGN KEY (id_insumo) REFERENCES insumos_medicos(id_insumo),
    FOREIGN KEY (id_paciente) REFERENCES pacientes(id_paciente)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;