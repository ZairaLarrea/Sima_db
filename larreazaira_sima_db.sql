-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: mysql-larreazaira.alwaysdata.net
-- Generation Time: Nov 18, 2025 at 04:56 PM
-- Server version: 10.11.14-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `larreazaira_sima_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ambito`
--

CREATE TABLE `ambito` (
  `id_ambito` int(11) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ambito`
--

INSERT INTO `ambito` (`id_ambito`, `descripcion`) VALUES
(1, 'Público'),
(2, 'Privado'),
(3, 'Universitario'),
(4, 'Municipal'),
(5, 'Provincial'),
(6, 'Nacional');

-- --------------------------------------------------------

--
-- Table structure for table `analisis`
--

CREATE TABLE `analisis` (
  `id_analisis` int(11) NOT NULL,
  `nombre_analisis` varchar(150) DEFAULT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `id_servicio` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `analisis`
--

INSERT INTO `analisis` (`id_analisis`, `nombre_analisis`, `descripcion`, `id_servicio`, `id_usuario_modificacion`) VALUES
(1, 'Hemograma Completo', 'Hemograma con parámetros completos', 5, 1),
(2, 'Glicemia en ayunas', 'Medición de glucosa en sangre', 5, 1),
(3, 'Perfil Lipídico', 'Colesterol total, HDL, LDL y triglicéridos', 5, 1),
(4, 'PCR COVID', 'Reacción en cadena de la polimerasa', 13, 1),
(5, 'Uremia', 'Evaluación de función renal', 5, 1),
(6, 'T3/T4/TSH', 'Panel tiroideo', 18, 1),
(7, 'Electrolitos', 'Sodio, potasio y cloro', 12, 1),
(8, 'Hemocultivo', 'Detección de bacterias en sangre', 5, 1),
(9, 'Examen de Orina', 'EGO completo', 5, 1),
(10, 'Prueba de Embarazo', 'Beta HCG cuantitativa', 15, 1),
(11, 'Grupo Sanguíneo', 'Determinación de grupo y factor RH', 5, 1),
(12, 'Amilasa/Pamia', 'Enzimas pancreáticas', 5, 1),
(13, 'Función Hepática', 'AST, ALT, GGT, bilirrubinas', 5, 1),
(14, 'Prueba de Coagulación', 'TP/TTPA/INR', 5, 1),
(15, 'Marcadores Cardíacos', 'Troponina I, CK-MB', 3, 1),
(16, 'Cultivo de Orina', 'Siembra y antibiograma', 5, 1),
(17, 'VDRL', 'Serología para sífilis', 5, 1),
(18, 'Hepatitis B - Antígeno', 'Serología hepatitis B', 5, 1),
(19, 'Hepatitis C - Anti', 'Serología hepatitis C', 5, 1),
(20, 'Test de embarazo rápido', 'Prueba rápida cualitativa', 15, 1),
(21, 'Perfil Renal Completo', 'Panel renal extendido', 5, 1),
(22, 'Gasometría', 'Gasometría arterial', 12, 1),
(23, 'Test Alergia Básico', 'Panel de alergias comunes', 5, 1),
(24, 'Perfil Tóxico', 'Pantalla toxicológica', 5, 1),
(25, 'Anticuerpos ANA', 'Autoanticuerpos', 5, 1),
(26, 'PCR Influenza', 'Detección influenza A/B', 13, 1),
(27, 'Toxoplasma IgM/IgG', 'Serología toxoplasmosis', 5, 1),
(28, 'PCR Respiratoria Completa', 'Panel respiratorio molecular', 13, 1),
(29, 'Carga Viral', 'Carga viral (genérico)', 13, 1);

--
-- Triggers `analisis`
--
DELIMITER $$
CREATE TRIGGER `tr_update_analisis` AFTER UPDATE ON `analisis` FOR EACH ROW BEGIN
    INSERT INTO Historial_modificacion(
        id_tabla_afectada,
        id_registro,
        id_usuario_modificacion,
        fecha_modificacion
    )
    VALUES(
        5,
        OLD.id_analisis,
        NEW.id_usuario_modificacion,
        NOW()
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `departamento`
--

CREATE TABLE `departamento` (
  `id_departamento` int(11) NOT NULL,
  `nombre_departamento` varchar(100) NOT NULL,
  `id_localidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `departamento`
--

INSERT INTO `departamento` (`id_departamento`, `nombre_departamento`, `id_localidad`) VALUES
(1, 'San Pedro', 1),
(2, 'Doctor Manuel Belgrano', 2),
(3, 'Palpalá', 3),
(4, 'Ledesma', 4),
(5, 'General Lavalle', 5),
(6, 'El Carmen', 6),
(7, 'Ledesma - Fracción', 7),
(8, 'Ledesma - Zona', 8),
(9, 'Tilcara', 9),
(10, 'Humahuaca', 10),
(11, 'Capital - Tucumán', 11),
(12, 'Capital - Salta', 12),
(13, 'Comuna CABA', 13),
(14, 'Rosario', 14),
(15, 'Partido de La Plata', 15),
(16, 'Departamento de Mendoza', 16),
(17, 'Escalante', 17),
(18, 'Neuquén', 18),
(19, 'Partido Bahía Blanca', 19),
(20, 'Partido Mar del Plata', 20),
(21, 'Departamento de Posadas', 21),
(22, 'Capital - Corrientes', 22),
(23, 'Departamento Paraná', 23),
(24, 'Departamento Concordia', 24),
(25, 'Departamento Formosa', 25),
(26, 'Departamento San Fernando', 26),
(27, 'Capital - San Juan', 27),
(28, 'Capital - San Luis', 28),
(29, 'Santa Cruz Centro', 29),
(30, 'Viedma', 30),
(31, 'Departamento La Rioja', 31),
(32, 'Capital - Catamarca', 32),
(33, 'Santiago', 33),
(34, 'Trelew', 34),
(35, 'Neuquén Capital', 35),
(36, 'Departamento Santa Fe', 36),
(37, 'Tucumán Oeste', 37),
(38, 'Departamento La Quiaca', 38),
(39, 'Departamento Abra Pampa', 39),
(40, 'Departamento Purmamarca', 40);

-- --------------------------------------------------------

--
-- Table structure for table `detalle_factura`
--

CREATE TABLE `detalle_factura` (
  `id_detalle` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detalle_factura`
--

INSERT INTO `detalle_factura` (`id_detalle`, `id_factura`, `id_servicio`, `cantidad`, `subtotal`, `id_usuario_modificacion`) VALUES
(1, 1, 1, 1, 2500.00, 7),
(2, 2, 2, 1, 2200.00, 7),
(3, 3, 3, 1, 4500.00, 7),
(4, 4, 4, 1, 7000.00, 7),
(5, 5, 5, 1, 3500.00, 7),
(6, 6, 6, 1, 3000.00, 7),
(7, 7, 7, 1, 4200.00, 7),
(8, 8, 8, 1, 2800.00, 7),
(9, 9, 9, 1, 800.00, 7),
(10, 10, 10, 1, 3200.00, 7),
(11, 11, 11, 1, 2500.00, 7),
(12, 12, 12, 1, 1800.00, 7),
(13, 13, 13, 1, 9000.00, 7),
(14, 14, 14, 1, 5000.00, 7),
(15, 15, 15, 1, 6000.00, 7),
(16, 16, 16, 1, 18000.00, 7),
(17, 17, 17, 1, 4000.00, 7),
(18, 18, 18, 1, 3600.00, 7),
(19, 19, 19, 1, 2200.00, 7),
(20, 20, 20, 1, 2100.00, 7),
(21, 21, 1, 2, 5000.00, 7),
(22, 22, 2, 1, 2500.00, 7),
(23, 23, 3, 1, 2800.00, 7),
(24, 24, 4, 1, 3500.00, 7),
(25, 25, 5, 1, 4200.00, 7),
(26, 26, 6, 1, 1800.00, 7),
(27, 27, 7, 1, 900.00, 7),
(28, 28, 8, 1, 7000.00, 7),
(29, 29, 9, 2, 900.00, 7),
(30, 30, 10, 1, 2200.00, 7),
(31, 31, 11, 1, 3000.00, 7),
(32, 32, 12, 1, 4200.00, 7),
(33, 33, 13, 1, 2800.00, 7),
(34, 34, 14, 1, 3500.00, 7),
(35, 35, 15, 1, 4200.00, 7),
(36, 36, 16, 1, 1800.00, 7),
(37, 37, 17, 1, 900.00, 7),
(38, 38, 18, 1, 700.00, 7),
(39, 39, 19, 1, 600.00, 7),
(40, 40, 20, 1, 2100.00, 7),
(41, 41, 1, 1, 2500.00, 7),
(42, 42, 2, 1, 2800.00, 7),
(43, 43, 3, 1, 3200.00, 7),
(44, 44, 4, 1, 4500.00, 7),
(45, 45, 5, 1, 3500.00, 7),
(46, 46, 6, 1, 4200.00, 7),
(47, 47, 7, 1, 1800.00, 7),
(48, 48, 8, 2, 1400.00, 7),
(49, 49, 9, 1, 900.00, 7),
(50, 50, 10, 1, 600.00, 7),
(51, 1, 11, 1, 2500.00, 7),
(52, 2, 12, 2, 3600.00, 7),
(53, 3, 13, 1, 9000.00, 7),
(54, 4, 14, 1, 5000.00, 7),
(55, 5, 15, 1, 6000.00, 7),
(56, 6, 16, 1, 18000.00, 7),
(57, 7, 17, 1, 4000.00, 7),
(58, 8, 18, 1, 3600.00, 7),
(59, 9, 19, 1, 2200.00, 7),
(60, 10, 20, 1, 2100.00, 7),
(61, 11, 1, 1, 2500.00, 7),
(62, 12, 2, 1, 2200.00, 7),
(63, 13, 3, 1, 4500.00, 7),
(64, 14, 4, 1, 7000.00, 7),
(65, 15, 5, 1, 3500.00, 7),
(66, 16, 6, 1, 3000.00, 7),
(67, 17, 7, 1, 4200.00, 7),
(68, 18, 8, 1, 2800.00, 7),
(69, 19, 9, 1, 800.00, 7),
(70, 20, 10, 1, 3200.00, 7);

-- --------------------------------------------------------

--
-- Table structure for table `dia_semana`
--

CREATE TABLE `dia_semana` (
  `id_dia_semana` int(11) NOT NULL,
  `nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dia_semana`
--

INSERT INTO `dia_semana` (`id_dia_semana`, `nombre`) VALUES
(1, 'Lunes'),
(2, 'Martes'),
(3, 'Miércoles'),
(4, 'Jueves'),
(5, 'Viernes'),
(6, 'Sábado'),
(7, 'Domingo'),
(8, 'Lunes'),
(9, 'Martes'),
(10, 'Miércoles'),
(11, 'Jueves'),
(12, 'Viernes'),
(13, 'Sábado'),
(14, 'Domingo');

-- --------------------------------------------------------

--
-- Table structure for table `direccion`
--

CREATE TABLE `direccion` (
  `id_direccion` int(11) NOT NULL,
  `calle` varchar(150) NOT NULL,
  `numero` varchar(20) DEFAULT NULL,
  `id_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `direccion`
--

INSERT INTO `direccion` (`id_direccion`, `calle`, `numero`, `id_departamento`) VALUES
(1, 'Av. 9 de Julio', '1250', 1),
(2, 'Calle Alvear', '450', 2),
(3, 'Av. Libertad', '980', 3),
(4, 'Ruta Prov. 83', 'S/N', 4),
(5, 'Av. San Martín', '350', 5),
(6, 'Calle Belgrano', '220', 6),
(7, 'Calle Los Naranjos', '180', 7),
(8, 'Av. Libertador', '3100', 8),
(9, 'Avenida La Viña', '540', 9),
(10, 'Calle Sarmiento', '770', 10),
(11, 'Córdoba 123', '150', 11),
(12, 'Balcarce', '1200', 12),
(13, 'Av. 9 de Julio (CABA)', '200', 13),
(14, 'Bv. Oroño', '45', 14),
(15, 'Calle 1', '98', 15),
(16, 'Av. San Martín (Mza)', '560', 16),
(17, 'Av. Rivadavia', '1820', 17),
(18, 'Ruta 22', '50', 18),
(19, 'Belgrano', '233', 19),
(20, 'Avenida Colón', '4521', 20),
(21, 'Calle Mitre', '210', 21),
(22, 'Av. 3 de Febrero', '880', 22),
(23, 'Bv. Yrigoyen', '370', 23),
(24, 'Calle Uruguay', '410', 24),
(25, 'Av. Independencia', '90', 25),
(26, 'Ruta 16', '1560', 26),
(27, 'Avenida San Martín', '320', 27),
(28, 'Cabildo', '78', 28),
(29, 'Avenida Costanera', '100', 29),
(30, 'Av. Roca', '620', 30),
(31, 'Rivadavia', '500', 31),
(32, '25 de Mayo', '250', 32),
(33, 'Av. Belgrano', '910', 33),
(34, 'Calle Libertad', '44', 34),
(35, 'Av. Argentina', '700', 35),
(36, 'Bv. Gálvez', '120', 36),
(37, 'Ruta 9', 'Km 5', 37),
(38, 'Calle Sarmiento', '310', 38),
(39, 'Av. Belgrano (Abra)', '55', 39),
(40, 'Calle Principal', '1', 40);

-- --------------------------------------------------------

--
-- Table structure for table `entidad_emisora`
--

CREATE TABLE `entidad_emisora` (
  `id_entidad` int(11) NOT NULL,
  `nombre_entidad` varchar(150) DEFAULT NULL,
  `id_provincia` int(11) DEFAULT NULL,
  `id_ambito` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `entidad_emisora`
--

INSERT INTO `entidad_emisora` (`id_entidad`, `nombre_entidad`, `id_provincia`, `id_ambito`) VALUES
(1, 'Colegio Médico de Jujuy', 10, 1),
(2, 'Consejo de Médicos de Salta', 17, 1),
(3, 'Federación Bioquímica Nacional', 2, 2),
(4, 'Universidad Nacional de Jujuy - Facultad de Medicina', 10, 3),
(5, 'Consejo Profesional de Enfermería - NOA', 10, 4);

-- --------------------------------------------------------

--
-- Table structure for table `especialidad`
--

CREATE TABLE `especialidad` (
  `id_especialidad` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `especialidad`
--

INSERT INTO `especialidad` (`id_especialidad`, `nombre`, `descripcion`) VALUES
(1, 'Cardiología', 'Especialidad dedicada al estudio y tratamiento del corazón'),
(2, 'Pediatría', 'Atención médica a niños y adolescentes'),
(3, 'Clínica Médica', 'Diagnóstico y tratamiento de enfermedades generales'),
(4, 'Dermatología', 'Tratamiento de enfermedades de la piel'),
(5, 'Ginecología', 'Salud reproductiva de la mujer'),
(6, 'Traumatología', 'Diagnóstico y tratamiento de lesiones del sistema óseo'),
(7, 'Neurología', 'Estudio y tratamiento de enfermedades del sistema nervioso'),
(8, 'Otorrinolaringología', 'Estudio del oído, nariz y garganta'),
(9, 'Endocrinología', 'Trastornos hormonales y glándulas'),
(10, 'Oftalmología', 'Estudio y tratamiento de enfermedades de los ojos');

-- --------------------------------------------------------

--
-- Table structure for table `estado_turno`
--

CREATE TABLE `estado_turno` (
  `id_estado` int(11) NOT NULL,
  `nombre_estado` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `estado_turno`
--

INSERT INTO `estado_turno` (`id_estado`, `nombre_estado`) VALUES
(1, 'Pendiente'),
(2, 'Confirmado'),
(3, 'Cancelado'),
(4, 'Reprogramado'),
(5, 'Atendido'),
(6, 'Ausente');

-- --------------------------------------------------------

--
-- Table structure for table `Factura`
--

CREATE TABLE `Factura` (
  `id_factura` int(11) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `id_paciente` int(11) NOT NULL,
  `total` decimal(10,2) DEFAULT 0.00,
  `id_usuario_creacion` int(11) DEFAULT NULL,
  `id_usuario_modificacion` int(11) DEFAULT NULL,
  `activo` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Factura`
--

INSERT INTO `Factura` (`id_factura`, `fecha`, `id_paciente`, `total`, `id_usuario_creacion`, `id_usuario_modificacion`, `activo`) VALUES
(1, '2025-11-01 09:30:00', 1, 2500.00, 7, NULL, 1),
(2, '2025-11-02 10:30:00', 2, 2200.00, 7, NULL, 1),
(3, '2025-11-03 11:45:00', 3, 4500.00, 7, NULL, 1),
(4, '2025-11-04 14:15:00', 4, 7000.00, 7, NULL, 1),
(5, '2025-11-05 08:50:00', 5, 3500.00, 7, NULL, 1),
(6, '2025-11-06 09:20:00', 6, 3000.00, 7, NULL, 1),
(7, '2025-11-07 10:45:00', 7, 4200.00, 7, NULL, 1),
(8, '2025-11-08 13:10:00', 8, 2800.00, 7, NULL, 1),
(9, '2025-11-09 15:10:00', 9, 800.00, 7, NULL, 1),
(10, '2025-11-10 16:45:00', 10, 3200.00, 7, NULL, 1),
(11, '2025-11-11 09:20:00', 11, 2500.00, 7, NULL, 1),
(12, '2025-11-12 10:40:00', 12, 1800.00, 7, NULL, 1),
(13, '2025-11-13 11:55:00', 13, 9000.00, 7, NULL, 1),
(14, '2025-11-14 09:45:00', 14, 5000.00, 7, NULL, 1),
(15, '2025-11-15 08:55:00', 15, 6000.00, 7, NULL, 1),
(16, '2025-11-16 13:30:00', 16, 18000.00, 7, NULL, 1),
(17, '2025-11-17 14:35:00', 17, 4000.00, 7, NULL, 1),
(18, '2025-11-18 10:20:00', 18, 3600.00, 7, NULL, 1),
(19, '2025-11-19 11:50:00', 19, 2200.00, 7, NULL, 1),
(20, '2025-11-20 12:10:00', 20, 2100.00, 7, NULL, 1),
(21, '2025-11-21 09:10:00', 21, 3200.00, 7, NULL, 1),
(22, '2025-11-22 09:40:00', 22, 2500.00, 7, NULL, 1),
(23, '2025-11-23 10:20:00', 23, 2800.00, 7, NULL, 1),
(24, '2025-11-24 10:50:00', 24, 3500.00, 7, NULL, 1),
(25, '2025-11-25 11:20:00', 25, 4200.00, 7, NULL, 1),
(26, '2025-11-26 11:50:00', 26, 1800.00, 7, NULL, 1),
(27, '2025-11-27 12:20:00', 27, 900.00, 7, NULL, 1),
(28, '2025-11-28 12:50:00', 28, 7000.00, 7, NULL, 1),
(29, '2025-11-29 13:20:00', 29, 4500.00, 7, NULL, 1),
(30, '2025-11-30 13:50:00', 30, 2200.00, 7, NULL, 1),
(31, '2025-12-01 14:10:00', 31, 3000.00, 7, NULL, 1),
(32, '2025-12-02 14:40:00', 32, 4200.00, 7, NULL, 1),
(33, '2025-12-03 15:10:00', 33, 2800.00, 7, NULL, 1),
(34, '2025-12-04 15:40:00', 34, 3500.00, 7, NULL, 1),
(35, '2025-12-05 16:10:00', 35, 4200.00, 7, NULL, 1),
(36, '2025-12-06 16:40:00', 36, 1800.00, 7, NULL, 1),
(37, '2025-12-07 08:10:00', 37, 900.00, 7, NULL, 1),
(38, '2025-12-08 08:40:00', 38, 700.00, 7, NULL, 1),
(39, '2025-12-09 09:10:00', 39, 600.00, 7, NULL, 1),
(40, '2025-12-10 09:40:00', 40, 2100.00, 7, NULL, 1),
(41, '2025-12-11 10:10:00', 41, 2500.00, 7, NULL, 1),
(42, '2025-12-12 10:40:00', 42, 2800.00, 7, NULL, 1),
(43, '2025-12-13 11:10:00', 43, 3200.00, 7, NULL, 1),
(44, '2025-12-14 11:40:00', 44, 4500.00, 7, NULL, 1),
(45, '2025-12-15 12:10:00', 45, 3500.00, 7, NULL, 1),
(46, '2025-12-16 12:40:00', 46, 4200.00, 7, NULL, 1),
(47, '2025-12-17 13:10:00', 47, 1800.00, 7, NULL, 1),
(48, '2025-12-18 13:40:00', 48, 900.00, 7, NULL, 1),
(49, '2025-12-19 14:10:00', 49, 700.00, 7, NULL, 1),
(50, '2025-12-20 14:40:00', 50, 600.00, 7, NULL, 1);

--
-- Triggers `Factura`
--
DELIMITER $$
CREATE TRIGGER `tr_update_factura` AFTER UPDATE ON `Factura` FOR EACH ROW BEGIN
    INSERT INTO Historial_modificacion(
        id_tabla_afectada,
        id_registro,
        id_usuario_modificacion,
        fecha_modificacion
    )
    VALUES(
        7,
        OLD.id_factura,
        NEW.id_usuario_modificacion,
        NOW()
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `Historial_modificacion`
--

CREATE TABLE `Historial_modificacion` (
  `id_historial` int(11) NOT NULL,
  `id_tabla_afectada` int(11) NOT NULL,
  `id_registro` int(11) NOT NULL,
  `id_usuario_modificacion` int(11) NOT NULL,
  `fecha_modificacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Historial_modificacion`
--

INSERT INTO `Historial_modificacion` (`id_historial`, `id_tabla_afectada`, `id_registro`, `id_usuario_modificacion`, `fecha_modificacion`) VALUES
(1, 5, 1, 1, '2025-11-01 09:05:00'),
(2, 6, 1, 1, '2025-11-02 10:15:00'),
(3, 7, 3, 2, '2025-11-03 11:00:00'),
(4, 8, 4, 3, '2025-11-04 13:50:00'),
(5, 9, 5, 4, '2025-11-05 08:45:00'),
(6, 10, 6, 5, '2025-11-06 09:35:00'),
(7, 11, 7, 6, '2025-11-07 10:05:00'),
(8, 12, 8, 7, '2025-11-08 12:00:00'),
(9, 3, 9, 8, '2025-11-09 14:00:00'),
(10, 1, 10, 9, '2025-11-10 15:00:00'),
(11, 2, 11, 10, '2025-11-11 08:45:00'),
(12, 4, 12, 11, '2025-11-12 10:20:00'),
(13, 5, 13, 12, '2025-11-13 11:30:00'),
(14, 6, 14, 13, '2025-11-14 09:05:00'),
(15, 7, 15, 14, '2025-11-15 08:50:00'),
(16, 8, 16, 15, '2025-11-16 13:10:00'),
(17, 9, 17, 16, '2025-11-17 14:20:00'),
(18, 10, 18, 17, '2025-11-18 09:40:00'),
(19, 11, 19, 18, '2025-11-19 10:55:00'),
(20, 12, 20, 19, '2025-11-20 11:20:00'),
(21, 3, 21, 20, '2025-11-21 12:10:00'),
(22, 4, 22, 21, '2025-11-22 13:00:00'),
(23, 5, 23, 22, '2025-11-23 09:45:00'),
(24, 6, 24, 23, '2025-11-24 10:35:00'),
(25, 7, 25, 24, '2025-11-25 11:15:00'),
(26, 8, 26, 25, '2025-11-26 12:05:00'),
(27, 9, 27, 26, '2025-11-27 13:55:00'),
(28, 10, 28, 27, '2025-11-28 14:30:00'),
(29, 11, 29, 28, '2025-11-29 15:10:00'),
(30, 12, 30, 29, '2025-11-30 16:00:00'),
(31, 11, 1, 1, '2025-11-18 16:55:16'),
(32, 11, 2, 1, '2025-11-18 16:55:16'),
(33, 11, 3, 1, '2025-11-18 16:55:16'),
(34, 11, 4, 1, '2025-11-18 16:55:16'),
(35, 11, 5, 1, '2025-11-18 16:55:16'),
(36, 11, 6, 1, '2025-11-18 16:55:16'),
(37, 11, 7, 1, '2025-11-18 16:55:16'),
(38, 11, 8, 1, '2025-11-18 16:55:16'),
(39, 11, 9, 1, '2025-11-18 16:55:16'),
(40, 11, 10, 1, '2025-11-18 16:55:16'),
(41, 11, 11, 1, '2025-11-18 16:55:16'),
(42, 11, 12, 1, '2025-11-18 16:55:16'),
(43, 11, 13, 1, '2025-11-18 16:55:16'),
(44, 11, 14, 1, '2025-11-18 16:55:16'),
(45, 11, 15, 1, '2025-11-18 16:55:16'),
(46, 11, 16, 1, '2025-11-18 16:55:16'),
(47, 11, 17, 1, '2025-11-18 16:55:16'),
(48, 11, 18, 1, '2025-11-18 16:55:16'),
(49, 11, 19, 1, '2025-11-18 16:55:16'),
(50, 11, 20, 1, '2025-11-18 16:55:16'),
(51, 11, 21, 1, '2025-11-18 16:55:16'),
(52, 11, 22, 1, '2025-11-18 16:55:16'),
(53, 11, 23, 1, '2025-11-18 16:55:16'),
(54, 11, 24, 1, '2025-11-18 16:55:16'),
(55, 11, 25, 1, '2025-11-18 16:55:16'),
(56, 11, 26, 1, '2025-11-18 16:55:16'),
(57, 11, 27, 1, '2025-11-18 16:55:16'),
(58, 11, 28, 1, '2025-11-18 16:55:16'),
(59, 11, 29, 1, '2025-11-18 16:55:16'),
(60, 11, 30, 1, '2025-11-18 16:55:16'),
(61, 11, 31, 1, '2025-11-18 16:55:16'),
(62, 11, 32, 1, '2025-11-18 16:55:16'),
(63, 11, 33, 1, '2025-11-18 16:55:16'),
(64, 11, 34, 1, '2025-11-18 16:55:16'),
(65, 11, 35, 1, '2025-11-18 16:55:16'),
(66, 11, 36, 1, '2025-11-18 16:55:16'),
(67, 11, 37, 1, '2025-11-18 16:55:16'),
(68, 11, 38, 1, '2025-11-18 16:55:16'),
(69, 11, 39, 1, '2025-11-18 16:55:16'),
(70, 11, 40, 1, '2025-11-18 16:55:16');

-- --------------------------------------------------------

--
-- Table structure for table `horario_medico`
--

CREATE TABLE `horario_medico` (
  `id_horario` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `id_dia_semana` int(11) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `id_especialidad` int(11) NOT NULL,
  `activo` tinyint(4) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp(),
  `id_usuario_creador` int(11) DEFAULT NULL,
  `id_usuario_modificador` int(11) DEFAULT NULL,
  `id_usuario_modificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `horario_medico`
--

INSERT INTO `horario_medico` (`id_horario`, `id_medico`, `id_dia_semana`, `hora_inicio`, `hora_fin`, `id_especialidad`, `activo`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_creador`, `id_usuario_modificador`, `id_usuario_modificacion`) VALUES
(41, 1, 1, '08:00:00', '12:00:00', 1, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(42, 2, 2, '13:00:00', '17:00:00', 2, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(43, 3, 3, '09:00:00', '13:00:00', 3, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(44, 4, 4, '14:00:00', '18:00:00', 1, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(45, 5, 5, '08:30:00', '12:30:00', 2, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(46, 6, 1, '15:00:00', '19:00:00', 3, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(47, 7, 2, '08:00:00', '12:00:00', 4, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(48, 8, 3, '13:00:00', '17:00:00', 5, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(49, 9, 4, '09:00:00', '13:00:00', 6, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(50, 10, 5, '14:00:00', '18:00:00', 7, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(51, 11, 1, '08:00:00', '12:00:00', 8, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(52, 12, 2, '13:00:00', '17:00:00', 9, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(53, 13, 3, '09:00:00', '13:00:00', 10, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(54, 14, 4, '14:00:00', '18:00:00', 1, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(55, 15, 5, '08:30:00', '12:30:00', 2, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(56, 16, 1, '15:00:00', '19:00:00', 3, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(57, 17, 2, '08:00:00', '12:00:00', 4, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(58, 18, 3, '13:00:00', '17:00:00', 5, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(59, 19, 4, '09:00:00', '13:00:00', 6, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(60, 20, 5, '14:00:00', '18:00:00', 7, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(61, 21, 1, '08:00:00', '12:00:00', 8, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(62, 22, 2, '13:00:00', '17:00:00', 9, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(63, 23, 3, '09:00:00', '13:00:00', 10, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(64, 24, 4, '14:00:00', '18:00:00', 1, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(65, 25, 5, '08:30:00', '12:30:00', 2, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(66, 26, 1, '15:00:00', '19:00:00', 3, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(67, 27, 2, '08:00:00', '12:00:00', 4, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(68, 28, 3, '13:00:00', '17:00:00', 5, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(69, 29, 4, '09:00:00', '13:00:00', 6, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(70, 30, 5, '14:00:00', '18:00:00', 7, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(71, 31, 1, '08:00:00', '12:00:00', 8, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(72, 32, 2, '13:00:00', '17:00:00', 9, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(73, 33, 3, '09:00:00', '13:00:00', 10, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(74, 34, 4, '14:00:00', '18:00:00', 1, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(75, 35, 5, '08:30:00', '12:30:00', 2, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(76, 36, 1, '15:00:00', '19:00:00', 3, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(77, 37, 2, '08:00:00', '12:00:00', 4, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(78, 38, 3, '13:00:00', '17:00:00', 5, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(79, 39, 4, '09:00:00', '13:00:00', 6, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL),
(80, 40, 5, '14:00:00', '18:00:00', 7, 1, '2025-11-18 01:44:01', '2025-11-18 01:44:01', 1, NULL, NULL);

--
-- Triggers `horario_medico`
--
DELIMITER $$
CREATE TRIGGER `tr_update_horario_medico` AFTER UPDATE ON `horario_medico` FOR EACH ROW BEGIN
    INSERT INTO Historial_modificacion(
        id_tabla_afectada,
        id_registro,
        id_usuario_modificacion,
        fecha_modificacion
    )
    VALUES(
        12,
        OLD.id_horario,
        NEW.id_usuario_modificacion,
        NOW()
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `inventario`
--

CREATE TABLE `inventario` (
  `id_item` int(11) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `nombre_item` varchar(150) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `unidad` varchar(50) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `id_usuario_modificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventario`
--

INSERT INTO `inventario` (`id_item`, `id_proveedor`, `nombre_item`, `cantidad`, `unidad`, `precio_unitario`, `id_usuario_modificacion`) VALUES
(1, 1, 'Jeringas 5ml', 500, 'un', 12.50, NULL),
(2, 1, 'Guantes Nitrilo M', 2000, 'par', 8.00, NULL),
(3, 2, 'Máscaras Quirúrgicas', 3000, 'un', 10.00, NULL),
(4, 2, 'Solución Salina 500ml', 200, 'botella', 150.00, NULL),
(5, 3, 'Tubo Vacío 5ml', 1000, 'un', 18.00, NULL),
(6, 3, 'Reactivo Glucosa', 150, 'kit', 430.00, NULL),
(7, 4, 'Bata Desechable', 800, 'un', 60.00, NULL),
(8, 4, 'Gasa Estéril 10x10', 1200, 'un', 5.00, NULL),
(9, 5, 'Termómetro Digital', 50, 'un', 1200.00, NULL),
(10, 5, 'Oxímetro', 30, 'un', 4500.00, NULL),
(11, 6, 'Agujas 21G', 1500, 'un', 6.50, NULL),
(12, 6, 'Envases Esterilizados', 600, 'un', 95.00, NULL),
(13, 7, 'Catéter Periférico', 400, 'un', 220.00, NULL),
(14, 7, 'Kit Sutura', 120, 'un', 320.00, NULL),
(15, 8, 'Reactivo Hemograma', 250, 'kit', 520.00, NULL),
(16, 8, 'Parches Adhesivos', 2000, 'un', 4.50, NULL),
(17, 9, 'Alcohol 70% 1L', 800, 'botella', 180.00, NULL),
(18, 9, 'Solución Yodada', 300, 'botella', 220.00, NULL),
(19, 10, 'Pipetas 1ml', 1500, 'un', 9.00, NULL),
(20, 10, 'Pipetas 5ml', 1200, 'un', 11.00, NULL),
(21, 11, 'Reactivo PCR', 200, 'kit', 7200.00, NULL),
(22, 11, 'Kits Elisa', 80, 'kit', 5600.00, NULL),
(23, 12, 'Instrumental Quirúrgico (set)', 15, 'set', 42000.00, NULL),
(24, 12, 'Camilla Portátil', 10, 'un', 22000.00, NULL),
(25, 13, 'Alcohol en Gel 500ml', 900, 'botella', 250.00, NULL),
(26, 13, 'Bolsas Desechables', 4000, 'un', 2.50, NULL),
(27, 14, 'Tira Reactiva', 1000, 'un', 30.00, NULL),
(28, 14, 'Aislante Térmico', 60, 'un', 1800.00, NULL),
(29, 15, 'Eppendorf 1.5ml', 3000, 'un', 5.50, NULL),
(30, 15, 'Cinta Microporo', 1000, 'un', 45.00, NULL),
(31, 16, 'Sueros IV 500ml', 500, 'botella', 260.00, NULL),
(32, 16, 'Equipo ECG (electrodos)', 40, 'set', 3500.00, NULL),
(33, 17, 'Respirador N95', 800, 'un', 60.00, NULL),
(34, 17, 'Monitor Multiparamétrico', 12, 'un', 125000.00, NULL),
(35, 18, 'Estetoscopio', 60, 'un', 7200.00, NULL),
(36, 18, 'Nebulizador', 30, 'un', 9500.00, NULL),
(37, 19, 'Kit Sutura Pediátrica', 40, 'un', 250.00, NULL),
(38, 19, 'Tensiómetro Manual', 80, 'un', 6500.00, NULL),
(39, 20, 'Centrífuga de Laboratorio', 6, 'un', 85000.00, NULL),
(40, 1, 'Papel Camilla', 2000, 'rollo', 120.00, NULL),
(41, 2, 'Contenedor Biológico', 120, 'un', 1400.00, NULL),
(42, 3, 'Balanza de Precisión', 8, 'un', 34000.00, NULL),
(43, 4, 'Caja de Guantes S', 1800, 'par', 7.50, NULL),
(44, 5, 'Desfibrilador (semi)', 4, 'un', 320000.00, NULL),
(45, 6, 'Bolsa de Resucitación', 10, 'un', 19000.00, NULL),
(46, 7, 'Ampollas Lidocaína', 500, 'un', 25.00, NULL),
(47, 8, 'Set de Curaciones', 300, 'un', 480.00, NULL),
(48, 9, 'Parches EKG', 1200, 'un', 22.00, NULL),
(49, 10, 'Impresora Etiquetas', 5, 'un', 54000.00, NULL),
(50, 11, 'Film para Ultrasonido', 600, 'un', 210.00, NULL),
(51, 12, 'Jeringas 1ml', 2500, 'un', 5.50, NULL),
(52, 13, 'Controles de Glucosa', 400, 'un', 160.00, NULL),
(53, 14, 'Alcohol Isopropílico 1L', 700, 'botella', 210.00, NULL),
(54, 15, 'Papel Filtro', 300, 'rollo', 190.00, NULL),
(55, 16, 'Botella Desinfectante 5L', 120, 'un', 2300.00, NULL),
(56, 17, 'Tijeras Quirúrgicas', 80, 'un', 4200.00, NULL),
(57, 18, 'Silla de Ruedas', 12, 'un', 45000.00, NULL),
(58, 19, 'Lámpara Examinadora', 10, 'un', 38000.00, NULL),
(59, 20, 'Termociclador PCR', 3, 'un', 360000.00, NULL),
(60, 1, 'Gasas 5x5', 4000, 'un', 3.00, NULL),
(61, 2, 'Vendajes Elásticos', 900, 'un', 140.00, NULL),
(62, 3, 'Bolsas para Residuos', 5000, 'un', 1.50, NULL),
(63, 4, 'Agujas Insulina', 1300, 'un', 4.00, NULL),
(64, 5, 'Insulina U100', 300, 'unidad', 850.00, NULL),
(65, 6, 'Tiritas', 6000, 'un', 1.20, NULL),
(66, 7, 'Frascos Estériles 50ml', 700, 'un', 28.00, NULL),
(67, 8, 'Plasma Congelado', 40, 'unidad', 12000.00, NULL),
(68, 9, 'Solución Ringer 500ml', 420, 'botella', 240.00, NULL),
(69, 10, 'Mascarillas Pediátricas', 1500, 'un', 9.50, NULL),
(70, 11, 'Lubricante Médico', 600, 'un', 45.00, NULL),
(71, 12, 'Termómetro Clínico', 120, 'un', 990.00, NULL),
(72, 13, 'Bolsas para Suero', 800, 'un', 95.00, NULL),
(73, 14, 'Cánulas Nasales', 2000, 'un', 55.00, NULL),
(74, 15, 'Guantes Látex L', 1900, 'par', 6.50, NULL),
(75, 16, 'Sonda Foley', 300, 'un', 320.00, NULL),
(76, 17, 'Kits de Bioseguridad', 150, 'un', 5800.00, NULL),
(77, 18, 'Placas Petri', 2400, 'un', 8.50, NULL),
(78, 19, 'Refrigerador Laboratorio 150L', 6, 'un', 220000.00, NULL),
(79, 20, 'Cartuchos de Tinta', 50, 'un', 4200.00, NULL),
(80, 1, 'Guantes de Vinilo L', 1500, 'par', 7.80, NULL),
(81, 2, 'Hisopos Estériles', 2000, 'un', 3.50, NULL),
(82, 3, 'Tiras Reactivas de Orina', 500, 'caja', 950.00, NULL),
(83, 4, 'Batas Reutilizables', 120, 'un', 1800.00, NULL),
(84, 5, 'Tensiómetro Digital', 25, 'un', 8500.00, NULL),
(85, 6, 'Reactivo Urea', 90, 'kit', 420.00, NULL),
(86, 7, 'Carbón Activado', 60, 'frasco', 1250.00, NULL),
(87, 8, 'Cubrecalzado Desechable', 3000, 'par', 2.80, NULL),
(88, 9, 'Jabón Antibacteriano 1L', 400, 'botella', 190.00, NULL),
(89, 10, 'Set de Curación Básico', 200, 'un', 650.00, NULL),
(90, 11, 'Bandejas Estériles', 500, 'un', 35.00, NULL),
(91, 12, 'Agujas Hipodérmicas 23G', 1200, 'un', 5.00, NULL),
(92, 13, 'Gasas no estériles 10x10', 2500, 'un', 1.30, NULL),
(93, 14, 'Peróxido de Hidrógeno 1L', 350, 'botella', 180.00, NULL),
(94, 15, 'Alcohol en Aerosol 250ml', 800, 'un', 330.00, NULL),
(95, 16, 'Tiras para Glucómetro', 300, 'caja', 1100.00, NULL),
(96, 17, 'Jeringas 10ml', 1000, 'un', 14.00, NULL),
(97, 18, 'Electrodos Adhesivos Adulto', 1800, 'un', 18.00, NULL),
(98, 19, 'Cinta Adhesiva Médica', 600, 'rollo', 90.00, NULL),
(99, 20, 'Termómetro Infrarrojo', 15, 'un', 17000.00, NULL);

--
-- Triggers `inventario`
--
DELIMITER $$
CREATE TRIGGER `tr_update_inventario` AFTER UPDATE ON `inventario` FOR EACH ROW BEGIN
    INSERT INTO Historial_modificacion(
        id_tabla_afectada,
        id_registro,
        id_usuario_modificacion,
        fecha_modificacion
    )
    VALUES(
        9,
        OLD.id_item,
        NEW.id_usuario_modificacion,
        NOW()
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_validar_inventario` BEFORE UPDATE ON `inventario` FOR EACH ROW BEGIN
    IF NEW.cantidad < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: No se puede tener stock negativo.';
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `localidad`
--

CREATE TABLE `localidad` (
  `id_localidad` int(11) NOT NULL,
  `nombre_localidad` varchar(100) NOT NULL,
  `id_provincia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `localidad`
--

INSERT INTO `localidad` (`id_localidad`, `nombre_localidad`, `id_provincia`) VALUES
(1, 'San Pedro de Jujuy', 10),
(2, 'San Salvador de Jujuy', 10),
(3, 'Palpalá', 10),
(4, 'Libertador Gral. San Martín', 10),
(5, 'Perico', 10),
(6, 'El Carmen', 10),
(7, 'Fraile Pintado', 10),
(8, 'Calilegua', 10),
(9, 'Tilcara', 10),
(10, 'Humahuaca', 10),
(11, 'San Miguel de Tucumán', 24),
(12, 'Salta', 17),
(13, 'San Salvador', 2),
(14, 'Rosario', 21),
(15, 'La Plata', 1),
(16, 'Mendoza', 13),
(17, 'Comodoro Rivadavia', 5),
(18, 'Neuquén', 15),
(19, 'Bahía Blanca', 1),
(20, 'Mar del Plata', 1),
(21, 'Posadas', 14),
(22, 'Corrientes', 7),
(23, 'Paraná', 8),
(24, 'Concordia', 8),
(25, 'Formosa', 9),
(26, 'Resistencia', 4),
(27, 'San Juan', 18),
(28, 'San Luis', 19),
(29, 'Río Gallegos', 20),
(30, 'Viedma', 16),
(31, 'La Rioja', 12),
(32, 'San Fernando del Valle de Catamarca', 3),
(33, 'Santiago del Estero', 22),
(34, 'Trelew', 5),
(35, 'Neuquén Capital', 15),
(36, 'Santa Fe Capital', 21),
(37, 'Tucumán Oeste', 24),
(38, 'La Quiaca', 10),
(39, 'Abra Pampa', 10),
(40, 'Purmamarca', 10);

-- --------------------------------------------------------

--
-- Table structure for table `medicos`
--

CREATE TABLE `medicos` (
  `id_medico` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_especialidad` int(11) NOT NULL,
  `activo` tinyint(4) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp(),
  `id_usuario_modificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicos`
--

INSERT INTO `medicos` (`id_medico`, `id_persona`, `id_especialidad`, `activo`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_modificacion`) VALUES
(1, 1, 1, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(2, 2, 2, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(3, 3, 3, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(4, 4, 1, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(5, 5, 2, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(6, 6, 3, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(7, 7, 4, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(8, 8, 5, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(9, 9, 6, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(10, 10, 7, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(11, 11, 8, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(12, 12, 9, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(13, 13, 10, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(14, 14, 1, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(15, 15, 2, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(16, 16, 3, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(17, 17, 4, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(18, 18, 5, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(19, 19, 6, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(20, 20, 7, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(21, 21, 8, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(22, 22, 9, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(23, 23, 10, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(24, 24, 1, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(25, 25, 2, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(26, 26, 3, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(27, 27, 4, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(28, 28, 5, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(29, 29, 6, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(30, 30, 7, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(31, 31, 8, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(32, 32, 9, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(33, 33, 10, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(34, 34, 1, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(35, 35, 2, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(36, 36, 3, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(37, 37, 4, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(38, 38, 5, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(39, 39, 6, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL),
(40, 40, 7, 1, '2025-11-18 01:17:39', '2025-11-18 01:17:39', NULL);

--
-- Triggers `medicos`
--
DELIMITER $$
CREATE TRIGGER `tr_update_medicos` AFTER UPDATE ON `medicos` FOR EACH ROW BEGIN
    INSERT INTO Historial_modificacion(
        id_tabla_afectada,
        id_registro,
        id_usuario_modificacion,
        fecha_modificacion
    )
    VALUES(
        2,
        OLD.id_medico,
        NEW.id_usuario_modificacion,
        NOW()
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `medico_matricula`
--

CREATE TABLE `medico_matricula` (
  `id_medico_matricula` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `numero_matricula` varchar(50) NOT NULL,
  `fecha_asignacion` date DEFAULT NULL,
  `id_entidad` int(11) NOT NULL,
  `activo` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medico_matricula`
--

INSERT INTO `medico_matricula` (`id_medico_matricula`, `id_medico`, `numero_matricula`, `fecha_asignacion`, `id_entidad`, `activo`) VALUES
(1, 1, 'MATR-JUY-0001', '2010-03-12', 1, 1),
(2, 2, 'MATR-JUY-0002', '2012-06-20', 1, 1),
(3, 3, 'MATR-JUY-0003', '2014-11-02', 2, 1),
(4, 4, 'MATR-JUY-0004', '2009-01-15', 1, 1),
(5, 5, 'MATR-JUY-0005', '2016-09-23', 4, 1),
(6, 6, 'MATR-JUY-0006', '2011-02-08', 4, 1),
(7, 7, 'MATR-JUY-0007', '2018-07-19', 1, 1),
(8, 8, 'MATR-JUY-0008', '2013-12-05', 1, 1),
(9, 9, 'MATR-JUY-0009', '2015-04-28', 2, 1),
(10, 10, 'MATR-JUY-0010', '2008-08-30', 2, 1),
(11, 11, 'MATR-JUY-0011', '2017-03-13', 3, 1),
(12, 12, 'MATR-JUY-0012', '2019-10-21', 3, 1),
(13, 13, 'MATR-JUY-0013', '2007-06-17', 4, 1),
(14, 14, 'MATR-JUY-0014', '2010-05-11', 1, 1),
(15, 15, 'MATR-JUY-0015', '2014-02-02', 5, 1),
(16, 16, 'MATR-JUY-0016', '2016-12-15', 5, 1),
(17, 17, 'MATR-JUY-0017', '2018-01-09', 3, 1),
(18, 18, 'MATR-JUY-0018', '2012-09-05', 2, 1),
(19, 19, 'MATR-JUY-0019', '2011-11-27', 1, 1),
(20, 20, 'MATR-JUY-0020', '2013-07-07', 4, 1),
(21, 21, 'MATR-JUY-0021', '2009-09-09', 2, 1),
(22, 22, 'MATR-JUY-0022', '2006-04-04', 2, 1),
(23, 23, 'MATR-JUY-0023', '2015-01-21', 3, 1),
(24, 24, 'MATR-JUY-0024', '2017-08-08', 4, 1),
(25, 25, 'MATR-JUY-0025', '2005-05-05', 1, 1),
(26, 26, 'MATR-JUY-0026', '2019-02-14', 1, 1),
(27, 27, 'MATR-JUY-0027', '2020-10-10', 5, 1),
(28, 28, 'MATR-JUY-0028', '2008-03-03', 5, 1),
(29, 29, 'MATR-JUY-0029', '2014-06-06', 2, 1),
(30, 30, 'MATR-JUY-0030', '2011-01-01', 3, 1),
(31, 31, 'MATR-JUY-0031', '2007-07-07', 4, 1),
(32, 32, 'MATR-JUY-0032', '2018-05-05', 4, 1),
(33, 33, 'MATR-JUY-0033', '2012-02-02', 1, 1),
(34, 34, 'MATR-JUY-0034', '2016-03-03', 1, 1),
(35, 35, 'MATR-JUY-0035', '2004-04-04', 2, 1),
(36, 36, 'MATR-JUY-0036', '2003-03-03', 3, 1),
(37, 37, 'MATR-JUY-0037', '2010-10-10', 5, 1),
(38, 38, 'MATR-JUY-0038', '2002-02-02', 2, 1),
(39, 39, 'MATR-JUY-0039', '2019-09-09', 4, 1),
(40, 40, 'MATR-JUY-0040', '2015-11-11', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `medico_paciente`
--

CREATE TABLE `medico_paciente` (
  `id_medico_paciente` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `fecha_atencion` date DEFAULT NULL,
  `motivo` varchar(200) DEFAULT NULL,
  `observaciones` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medico_paciente`
--

INSERT INTO `medico_paciente` (`id_medico_paciente`, `id_medico`, `id_paciente`, `fecha_atencion`, `motivo`, `observaciones`) VALUES
(51, 1, 1, '2025-01-10', 'Control cardíaco', 'Paciente estable'),
(52, 2, 2, '2025-02-14', 'Fiebre y dolor', 'Tratamiento ambulatorio'),
(53, 3, 3, '2025-03-20', 'Chequeo general', 'Recomendado estudio'),
(54, 4, 4, '2025-04-05', 'Dolor abdominal', 'Se solicitó ecografía'),
(55, 5, 5, '2025-05-12', 'Preoperatorio', 'Ok para cirugía'),
(56, 6, 6, '2025-05-20', 'Problema tiroideo', 'Se indicó hormona'),
(57, 7, 7, '2025-06-18', 'Dermatitis', 'Tratamiento tópico'),
(58, 8, 8, '2025-07-22', 'Control', 'Sin novedades'),
(59, 9, 9, '2025-08-16', 'Vacunación', 'Aplicada vacuna'),
(60, 10, 10, '2025-09-30', 'Control ginecológico', 'Se indicó ecografía'),
(61, 11, 11, '2025-10-05', 'Procedimiento menor', 'Curación realizada'),
(62, 12, 12, '2025-10-10', 'Electrolitos alterados', 'Reposición'),
(63, 13, 13, '2025-10-15', 'PCR solicitado', 'Muestra enviada'),
(64, 14, 14, '2025-10-20', 'Preoperatorio', 'Apto'),
(65, 15, 15, '2025-10-25', 'Control embarazo', 'Evolución normal'),
(66, 16, 16, '2025-10-30', 'TAC programado', 'Adelantar resultados'),
(67, 17, 17, '2025-11-02', 'Consulta neurológica', 'Seguimiento'),
(68, 18, 18, '2025-11-06', 'Endocrinología', 'Ajuste de dosis'),
(69, 19, 19, '2025-11-09', 'Kinesiología', 'Sesión de 30 min'),
(70, 20, 20, '2025-11-11', 'Oftalmología', 'Se recetó lentes'),
(71, 21, 21, '2025-11-12', 'Consulta general', 'OK'),
(72, 22, 22, '2025-11-13', 'Fiebre', 'Tratamiento sintomático'),
(73, 23, 23, '2025-11-14', 'Chequeo', 'OK'),
(74, 24, 24, '2025-11-15', 'Ecografía', 'Informe enviado'),
(75, 25, 25, '2025-11-16', 'Analítica', 'Pendiente de resultado'),
(76, 26, 26, '2025-11-17', 'Consulta', 'OK'),
(77, 27, 27, '2025-11-18', 'Dermatología', 'Cremas indicadas'),
(78, 28, 28, '2025-11-19', 'Control', 'OK'),
(79, 29, 29, '2025-11-20', 'Vacunación', 'Completada'),
(80, 30, 30, '2025-11-21', 'Ginecología', 'Control'),
(81, 31, 31, '2025-11-22', 'Procedimiento', 'OK'),
(82, 32, 32, '2025-11-23', 'Electrolitos', 'Solución administrada'),
(83, 33, 33, '2025-11-24', 'PCR', 'Muestra enviada'),
(84, 34, 34, '2025-11-25', 'Preop', 'Apto'),
(85, 35, 35, '2025-11-26', 'Control embarazo', 'Normal'),
(86, 36, 36, '2025-11-27', 'TAC', 'Realizado'),
(87, 37, 37, '2025-11-28', 'Neurología', 'Seguimiento'),
(88, 38, 38, '2025-11-29', 'Endocrino', 'Ajuste'),
(89, 39, 39, '2025-11-30', 'Kine', 'Sesión'),
(90, 40, 40, '2025-12-01', 'Oftalmo', 'Revisión'),
(91, 1, 41, '2025-12-02', 'Consulta', 'OK'),
(92, 2, 42, '2025-12-03', 'Chequeo', 'OK'),
(93, 3, 43, '2025-12-04', 'Control', 'OK'),
(94, 4, 44, '2025-12-05', 'Ecografía', 'Ok'),
(95, 5, 45, '2025-12-06', 'Analítica', 'Pendiente'),
(96, 6, 46, '2025-12-07', 'Consulta', 'OK'),
(97, 7, 47, '2025-12-08', 'Dermatología', 'Tratamiento'),
(98, 8, 48, '2025-12-09', 'Control', 'OK'),
(99, 9, 49, '2025-12-10', 'Vacunación', 'OK'),
(100, 40, 50, '2025-12-11', 'Ginecología', 'OK');

-- --------------------------------------------------------

--
-- Table structure for table `metodo_pago`
--

CREATE TABLE `metodo_pago` (
  `id_metodo` int(11) NOT NULL,
  `nombre_metodo` varchar(100) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `metodo_pago`
--

INSERT INTO `metodo_pago` (`id_metodo`, `nombre_metodo`, `descripcion`) VALUES
(1, 'Efectivo', 'Pago realizado en efectivo'),
(2, 'Tarjeta de Débito', 'Pago con tarjeta de débito'),
(3, 'Tarjeta de Crédito', 'Pago con tarjeta de crédito'),
(4, 'Transferencia Bancaria', 'Pago con transferencia bancaria'),
(5, 'Mercado Pago', 'Pago digital mediante Mercado Pago'),
(6, 'Obra Social', 'La obra social cubre total o parcialmente el pago');

-- --------------------------------------------------------

--
-- Table structure for table `obra_social`
--

CREATE TABLE `obra_social` (
  `id_obra_social` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `sigla` varchar(20) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obra_social`
--

INSERT INTO `obra_social` (`id_obra_social`, `nombre`, `sigla`, `telefono`, `id_direccion`, `id_estado`) VALUES
(1, 'Obra Social Provincial de Jujuy', 'OSPJ', '388-300-001', 1, 1),
(2, 'OSDE - Sucursal Jujuy', 'OSDE', '388-300-002', 2, 1),
(3, 'Swiss Medical - Jujuy', 'SWISS', '388-300-003', 3, 1),
(4, 'Galeno - Delegación Norte', 'GAL', '388-300-004', 4, 1),
(5, 'PAMI - Delegación Jujuy', 'PAMI', '388-300-005', 5, 1),
(6, 'Hospital Privado Previsión', 'HPP', '388-300-006', 6, 1),
(7, 'Emergencias Salud', 'ESAL', '388-300-007', 7, 1),
(8, 'Mutual Sima', 'M-SIMA', '388-300-008', 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pacientes`
--

CREATE TABLE `pacientes` (
  `id_paciente` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `activo` tinyint(4) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp(),
  `id_usuario_modificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pacientes`
--

INSERT INTO `pacientes` (`id_paciente`, `id_persona`, `activo`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_modificacion`) VALUES
(1, 1, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(2, 2, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(3, 3, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(4, 4, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(5, 5, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(6, 6, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(7, 7, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(8, 8, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(9, 9, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(10, 10, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(11, 11, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(12, 12, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(13, 13, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(14, 14, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(15, 15, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(16, 16, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(17, 17, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(18, 18, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(19, 19, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(20, 20, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(21, 21, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(22, 22, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(23, 23, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(24, 24, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(25, 25, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(26, 26, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(27, 27, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(28, 28, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(29, 29, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(30, 30, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(31, 31, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(32, 32, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(33, 33, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(34, 34, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(35, 35, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(36, 36, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(37, 37, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(38, 38, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(39, 39, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(40, 40, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(41, 41, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(42, 42, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(43, 43, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(44, 44, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(45, 45, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(46, 46, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(47, 47, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(48, 48, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(49, 49, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(50, 50, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(51, 51, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(52, 52, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(53, 53, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(54, 54, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(55, 55, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(56, 56, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(57, 57, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(58, 58, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(59, 59, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(60, 60, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(61, 61, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(62, 62, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(63, 63, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(64, 64, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(65, 65, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(66, 66, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(67, 67, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(68, 68, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(69, 69, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(70, 70, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(71, 71, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(72, 72, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(73, 73, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(74, 74, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(75, 75, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(76, 76, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(77, 77, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(78, 78, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(79, 79, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(80, 80, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(81, 81, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(82, 82, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(83, 83, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(84, 84, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(85, 85, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(86, 86, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(87, 87, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(88, 88, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(89, 89, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(90, 90, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(91, 91, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(92, 92, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(93, 93, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(94, 94, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(95, 95, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(96, 96, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(97, 97, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(98, 98, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(99, 99, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL),
(100, 100, 1, '2025-11-18 01:17:12', '2025-11-18 01:17:12', NULL);

--
-- Triggers `pacientes`
--
DELIMITER $$
CREATE TRIGGER `tr_update_pacientes` AFTER UPDATE ON `pacientes` FOR EACH ROW BEGIN
    INSERT INTO Historial_modificacion(
        id_tabla_afectada,
        id_registro,
        id_usuario_modificacion,
        fecha_modificacion
    )
    VALUES(
        1,
        OLD.id_paciente,
        NEW.id_usuario_modificacion,
        NOW()
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `paciente_obra_social`
--

CREATE TABLE `paciente_obra_social` (
  `id_paciente_obra` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_obra_social` int(11) NOT NULL,
  `numero_afiliado` varchar(50) DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `fecha_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `paciente_obra_social`
--

INSERT INTO `paciente_obra_social` (`id_paciente_obra`, `id_paciente`, `id_obra_social`, `numero_afiliado`, `fecha_alta`, `fecha_baja`) VALUES
(1, 1, 1, 'OSPJ-00001', '2015-02-01', NULL),
(2, 2, 2, 'OSDE-00002', '2018-03-12', NULL),
(3, 3, 3, 'SWISS-00003', '2017-07-10', NULL),
(4, 4, 1, 'OSPJ-00004', '2020-05-05', NULL),
(5, 5, 4, 'GAL-00005', '2019-09-09', NULL),
(6, 6, 5, 'PAMI-00006', '2016-11-11', NULL),
(7, 7, 6, 'HPP-00007', '2014-01-15', NULL),
(8, 8, 7, 'ESAL-00008', '2021-08-20', NULL),
(9, 9, 8, 'MSIMA-00009', '2022-06-03', NULL),
(10, 10, 1, 'OSPJ-00010', '2013-04-18', NULL),
(11, 11, 2, 'OSDE-00011', '2016-03-03', NULL),
(12, 12, 3, 'SWISS-00012', '2015-07-07', NULL),
(13, 13, 4, 'GAL-00013', '2018-12-12', NULL),
(14, 14, 5, 'PAMI-00014', '2017-10-10', NULL),
(15, 15, 6, 'HPP-00015', '2016-02-02', NULL),
(16, 16, 7, 'ESAL-00016', '2019-09-19', NULL),
(17, 17, 8, 'MSIMA-00017', '2020-01-01', NULL),
(18, 18, 1, 'OSPJ-00018', '2014-05-05', NULL),
(19, 19, 2, 'OSDE-00019', '2013-03-03', NULL),
(20, 20, 3, 'SWISS-00020', '2012-02-02', NULL),
(21, 21, 4, 'GAL-00021', '2011-11-11', NULL),
(22, 22, 5, 'PAMI-00022', '2010-10-10', NULL),
(23, 23, 6, 'HPP-00023', '2009-09-09', NULL),
(24, 24, 7, 'ESAL-00024', '2008-08-08', NULL),
(25, 25, 8, 'MSIMA-00025', '2007-07-07', NULL),
(26, 26, 1, 'OSPJ-00026', '2006-06-06', NULL),
(27, 27, 2, 'OSDE-00027', '2005-05-05', NULL),
(28, 28, 3, 'SWISS-00028', '2004-04-04', NULL),
(29, 29, 4, 'GAL-00029', '2003-03-03', NULL),
(30, 30, 5, 'PAMI-00030', '2002-02-02', NULL),
(31, 31, 6, 'HPP-00031', '2001-01-01', NULL),
(32, 32, 7, 'ESAL-00032', '2000-12-12', NULL),
(33, 33, 8, 'MSIMA-00033', '1999-11-11', NULL),
(34, 34, 1, 'OSPJ-00034', '1998-10-10', NULL),
(35, 35, 2, 'OSDE-00035', '1997-09-09', NULL),
(36, 36, 3, 'SWISS-00036', '1996-08-08', NULL),
(37, 37, 4, 'GAL-00037', '1995-07-07', NULL),
(38, 38, 5, 'PAMI-00038', '1994-06-06', NULL),
(39, 39, 6, 'HPP-00039', '1993-05-05', NULL),
(40, 40, 7, 'ESAL-00040', '1992-04-04', NULL),
(41, 41, 8, 'MSIMA-00041', '1991-03-03', NULL),
(42, 42, 1, 'OSPJ-00042', '1990-02-02', NULL),
(43, 43, 2, 'OSDE-00043', '1989-01-01', NULL),
(44, 44, 3, 'SWISS-00044', '1988-12-12', NULL),
(45, 45, 4, 'GAL-00045', '1987-11-11', NULL),
(46, 46, 5, 'PAMI-00046', '1986-10-10', NULL),
(47, 47, 6, 'HPP-00047', '1985-09-09', NULL),
(48, 48, 7, 'ESAL-00048', '1984-08-08', NULL),
(49, 49, 8, 'MSIMA-00049', '1983-07-07', NULL),
(50, 50, 1, 'OSPJ-00050', '1982-06-06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pago`
--

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `id_metodo` int(11) NOT NULL,
  `monto_pagado` decimal(10,2) NOT NULL,
  `fecha_pago` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pago`
--

INSERT INTO `pago` (`id_pago`, `id_factura`, `id_metodo`, `monto_pagado`, `fecha_pago`) VALUES
(1, 1, 1, 2500.00, '2025-11-01 10:00:00'),
(2, 2, 2, 2200.00, '2025-11-02 11:00:00'),
(3, 3, 3, 4500.00, '2025-11-03 12:00:00'),
(4, 4, 4, 7000.00, '2025-11-04 15:00:00'),
(5, 5, 5, 3500.00, '2025-11-05 09:30:00'),
(6, 6, 1, 3000.00, '2025-11-06 10:00:00'),
(7, 7, 2, 4200.00, '2025-11-07 11:30:00'),
(8, 8, 3, 2800.00, '2025-11-08 13:40:00'),
(9, 9, 5, 800.00, '2025-11-09 15:30:00'),
(10, 10, 1, 3200.00, '2025-11-10 17:00:00'),
(11, 11, 2, 2500.00, '2025-11-11 09:40:00'),
(12, 12, 3, 1800.00, '2025-11-12 11:00:00'),
(13, 13, 1, 9000.00, '2025-11-13 12:30:00'),
(14, 14, 4, 5000.00, '2025-11-14 10:20:00'),
(15, 15, 5, 6000.00, '2025-11-15 09:10:00'),
(16, 16, 1, 18000.00, '2025-11-16 14:00:00'),
(17, 17, 2, 4000.00, '2025-11-17 15:00:00'),
(18, 18, 3, 3600.00, '2025-11-18 11:30:00'),
(19, 19, 4, 2200.00, '2025-11-19 12:30:00'),
(20, 20, 5, 2100.00, '2025-11-20 13:00:00'),
(21, 21, 1, 3200.00, '2025-11-21 10:00:00'),
(22, 22, 2, 2500.00, '2025-11-22 10:30:00'),
(23, 23, 3, 2800.00, '2025-11-23 11:00:00'),
(24, 24, 4, 3500.00, '2025-11-24 11:40:00'),
(25, 25, 5, 4200.00, '2025-11-25 12:15:00'),
(26, 26, 1, 1800.00, '2025-11-26 12:50:00'),
(27, 27, 2, 900.00, '2025-11-27 13:30:00'),
(28, 28, 3, 7000.00, '2025-11-28 14:10:00'),
(29, 29, 4, 4500.00, '2025-11-29 14:45:00'),
(30, 30, 5, 2200.00, '2025-11-30 15:20:00'),
(31, 31, 1, 3000.00, '2025-12-01 15:50:00'),
(32, 32, 2, 4200.00, '2025-12-02 16:10:00'),
(33, 33, 3, 2800.00, '2025-12-03 16:40:00'),
(34, 34, 4, 3500.00, '2025-12-04 17:10:00'),
(35, 35, 5, 4200.00, '2025-12-05 17:40:00'),
(36, 36, 1, 1800.00, '2025-12-06 08:30:00'),
(37, 37, 2, 900.00, '2025-12-07 09:15:00'),
(38, 38, 3, 700.00, '2025-12-08 09:45:00'),
(39, 39, 4, 600.00, '2025-12-09 10:20:00'),
(40, 40, 5, 2100.00, '2025-12-10 10:55:00');

-- --------------------------------------------------------

--
-- Table structure for table `persona`
--

CREATE TABLE `persona` (
  `id_persona` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `id_direccion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `persona`
--

INSERT INTO `persona` (`id_persona`, `nombre`, `apellido`, `dni`, `fecha_nacimiento`, `telefono`, `email`, `id_direccion`) VALUES
(1, 'María', 'González', '30123456', '1985-04-12', '388-154-001', 'm.gonzalez@example.com', 1),
(2, 'Juan', 'Pérez', '27123457', '1978-09-05', '388-154-002', 'juan.perez@example.com', 2),
(3, 'Lucía', 'Rodríguez', '33123458', '1990-01-20', '388-154-003', 'lucia.rodriguez@example.com', 3),
(4, 'Martín', 'López', '29123459', '1982-12-10', '388-154-004', 'martin.lopez@example.com', 4),
(5, 'Karina', 'Fernández', '34123460', '1995-03-30', '388-154-005', 'karina.fernandez@example.com', 5),
(6, 'Hernán', 'Sosa', '28123461', '1975-11-01', '388-154-006', 'hernan.sosa@example.com', 6),
(7, 'Sofía', 'Giménez', '35123462', '1992-06-18', '388-154-007', 'sofia.gimenez@example.com', 7),
(8, 'Facundo', 'Ramos', '26123463', '1988-08-09', '388-154-008', 'facundo.ramos@example.com', 8),
(9, 'Verónica', 'Márquez', '30123464', '1970-07-07', '388-154-009', 'v.marquez@example.com', 9),
(10, 'Gustavo', 'Díaz', '29123465', '1968-02-25', '388-154-010', 'g.diaz@example.com', 10),
(11, 'Ana', 'Suárez', '31123466', '1989-10-10', '388-154-011', 'ana.suarez@example.com', 11),
(12, 'Diego', 'Castro', '28123467', '1980-05-15', '388-154-012', 'diego.castro@example.com', 12),
(13, 'Marta', 'Vega', '32123468', '1976-03-03', '388-154-013', 'marta.vega@example.com', 13),
(14, 'Ricardo', 'Ortega', '27123469', '1965-01-01', '388-154-014', 'ricardo.ortega@example.com', 14),
(15, 'Nadia', 'Luna', '33123470', '1998-09-09', '388-154-015', 'nadia.luna@example.com', 15),
(16, 'Pablo', 'Herrera', '29123471', '1979-06-21', '388-154-016', 'pablo.herrera@example.com', 16),
(17, 'Silvia', 'Arias', '34123472', '1962-12-30', '388-154-017', 'silvia.arias@example.com', 17),
(18, 'Óscar', 'Rojas', '28123473', '1984-04-04', '388-154-018', 'oscar.rojas@example.com', 18),
(19, 'Lorena', 'Mendoza', '35123474', '1991-08-08', '388-154-019', 'lorena.mendoza@example.com', 19),
(20, 'Raúl', 'Figueroa', '26123475', '1958-11-11', '388-154-020', 'raul.figueroa@example.com', 20),
(21, 'Carolina', 'Núñez', '30123476', '1993-02-02', '388-154-021', 'carolina.nunez@example.com', 21),
(22, 'Esteban', 'Moreno', '27123477', '1986-07-07', '388-154-022', 'esteban.moreno@example.com', 22),
(23, 'Mariano', 'Paz', '33123478', '1974-05-05', '388-154-023', 'mariano.paz@example.com', 23),
(24, 'Claudia', 'Sánchez', '29123479', '1983-03-13', '388-154-024', 'claudia.sanchez@example.com', 24),
(25, 'Bruno', 'Quinteros', '34123480', '1996-12-12', '388-154-025', 'bruno.quinteros@example.com', 25),
(26, 'Patricia', 'Ruiz', '28123481', '1971-09-19', '388-154-026', 'patricia.ruiz@example.com', 26),
(27, 'Gonzalo', 'Torres', '35123482', '1987-01-17', '388-154-027', 'gonzalo.torres@example.com', 27),
(28, 'Juana', 'Campos', '26123483', '1994-04-22', '388-154-028', 'juana.campos@example.com', 28),
(29, 'Federico', 'Pineda', '30123484', '1981-10-02', '388-154-029', 'federico.pineda@example.com', 29),
(30, 'Inés', 'Roldán', '27123485', '1969-06-06', '388-154-030', 'ines.roldan@example.com', 30),
(31, 'Norma', 'Alonso', '33123486', '1955-05-25', '388-154-031', 'norma.alonso@example.com', 31),
(32, 'Ramón', 'Molina', '29123487', '1970-08-14', '388-154-032', 'ramon.molina@example.com', 32),
(33, 'Belén', 'Poma', '34123488', '1999-11-30', '388-154-033', 'belen.poma@example.com', 33),
(34, 'Víctor', 'Noguera', '28123489', '1985-02-18', '388-154-034', 'victor.noguera@example.com', 34),
(35, 'Magdalena', 'Carrizo', '35123490', '1992-12-05', '388-154-035', 'magdalena.carrizo@example.com', 35),
(36, 'Santiago', 'Gómez', '26123491', '1977-07-07', '388-154-036', 'santiago.gomez@example.com', 36),
(37, 'Ariel', 'Benítez', '30123492', '1989-03-03', '388-154-037', 'ariel.benitez@example.com', 37),
(38, 'Daniela', 'Vargas', '27123493', '1990-05-20', '388-154-038', 'daniela.vargas@example.com', 38),
(39, 'Hugo', 'Salinas', '33123494', '1964-09-09', '388-154-039', 'hugo.salinas@example.com', 39),
(40, 'Graciela', 'Medina', '29123495', '1959-01-01', '388-154-040', 'graciela.medina@example.com', 40),
(41, 'Brenda', 'Ibáñez', '30123496', '1997-02-11', '388-154-041', 'brenda.ibanez@example.com', 1),
(42, 'Lautaro', 'Acuña', '27123497', '1991-07-23', '388-154-042', 'lautaro.acuna@example.com', 2),
(43, 'Romina', 'Cárdenas', '33123498', '1986-10-30', '388-154-043', 'romina.cardenas@example.com', 3),
(44, 'Ezequiel', 'Orellana', '29123499', '1984-12-12', '388-154-044', 'ezequiel.orellana@example.com', 4),
(45, 'Agustina', 'Leiva', '34123500', '1995-08-08', '388-154-045', 'agustina.leiva@example.com', 5),
(46, 'Ignacio', 'Mancilla', '28123501', '1982-11-11', '388-154-046', 'ignacio.mancilla@example.com', 6),
(47, 'Adriana', 'Cornejo', '35123502', '1973-04-04', '388-154-047', 'adriana.cornejo@example.com', 7),
(48, 'Emiliano', 'Ojeda', '26123503', '1990-09-09', '388-154-048', 'emiliano.ojeda@example.com', 8),
(49, 'Pamela', 'Ríos', '30123504', '1988-03-05', '388-154-049', 'pamela.rios@example.com', 9),
(50, 'Rodrigo', 'Sarmiento', '27123505', '1976-06-06', '388-154-050', 'rodrigo.sarmiento@example.com', 10),
(51, 'Silvana', 'Beltrán', '33123506', '1987-05-05', '388-154-051', 'silvana.beltran@example.com', 11),
(52, 'Joaquín', 'Funes', '29123507', '1994-01-01', '388-154-052', 'joaquin.funes@example.com', 12),
(53, 'Natalia', 'León', '34123508', '1993-03-03', '388-154-053', 'natalia.leon@example.com', 13),
(54, 'Lucas', 'Mendoza', '28123509', '1981-02-02', '388-154-054', 'lucas.mendoza2@example.com', 14),
(55, 'Aldana', 'Paz', '35123510', '1998-07-07', '388-154-055', 'aldana.paz@example.com', 15),
(56, 'César', 'Romero', '26123511', '1967-11-11', '388-154-056', 'cesar.romero@example.com', 16),
(57, 'Valeria', 'Núñez', '30123512', '1974-04-04', '388-154-057', 'valeria.nunez@example.com', 17),
(58, 'Bruno', 'Aguirre', '27123513', '1990-10-10', '388-154-058', 'bruno.aguirre@example.com', 18),
(59, 'Romina', 'Correa', '33123514', '1985-05-05', '388-154-059', 'romina.correa@example.com', 19),
(60, 'Germán', 'Saavedra', '29123515', '1972-09-09', '388-154-060', 'german.saavedra@example.com', 20),
(61, 'Olga', 'Duarte', '34123516', '1960-06-06', '388-154-061', 'olga.duarte@example.com', 21),
(62, 'Cristian', 'Vega', '28123517', '1983-08-08', '388-154-062', 'cristian.vega@example.com', 22),
(63, 'Magali', 'Pérez', '35123518', '1996-12-24', '388-154-063', 'magali.perez@example.com', 23),
(64, 'Fabián', 'Soria', '26123519', '1979-01-15', '388-154-064', 'fabian.soria@example.com', 24),
(65, 'Tamara', 'Quiroga', '30123520', '1992-10-10', '388-154-065', 'tamara.quiroga@example.com', 25),
(66, 'Raúl', 'Córdoba', '27123521', '1965-07-07', '388-154-066', 'raul.cordoba@example.com', 26),
(67, 'Silvestre', 'Paz', '33123522', '1958-02-02', '388-154-067', 'silvestre.paz@example.com', 27),
(68, 'Victoria', 'Lara', '29123523', '1999-09-09', '388-154-068', 'victoria.lara@example.com', 28),
(69, 'Nahuel', 'Guzmán', '34123524', '1988-11-11', '388-154-069', 'nahuel.guzman@example.com', 29),
(70, 'Mónica', 'Barrios', '28123525', '1971-03-03', '388-154-070', 'monica.barrios@example.com', 30),
(71, 'Norma', 'Alegre', '35123526', '1963-04-04', '388-154-071', 'norma.alegre@example.com', 31),
(72, 'Pablo', 'Crespo', '26123527', '1977-08-08', '388-154-072', 'pablo.crespo@example.com', 32),
(73, 'Elena', 'Ramos', '30123528', '1990-12-12', '388-154-073', 'elena.ramos@example.com', 33),
(74, 'Mateo', 'Sosa', '27123529', '1995-01-01', '388-154-074', 'mateo.sosa@example.com', 34),
(75, 'Silvia', 'Mazzini', '33123530', '1984-06-06', '388-154-075', 'silvia.mazzini@example.com', 35),
(76, 'Javier', 'Urtubey', '29123531', '1969-11-11', '388-154-076', 'javier.urtubey@example.com', 36),
(77, 'María José', 'Cuellar', '34123532', '1992-09-09', '388-154-077', 'm.jose.cuellar@example.com', 37),
(78, 'Brisa', 'León', '28123533', '2000-02-02', '388-154-078', 'brisa.leon@example.com', 38),
(79, 'Gaston', 'Roca', '35123534', '1986-05-05', '388-154-079', 'gaston.roca@example.com', 39),
(80, 'Rita', 'Soria', '26123535', '1957-10-10', '388-154-080', 'rita.soria@example.com', 40),
(81, 'Sebastián', 'Toranzos', '36123536', '1987-07-12', '388-155-001', 'sebastian.toranzos@example.com', 5),
(82, 'Milagros', 'Zambrano', '37123537', '1994-11-03', '388-155-002', 'milagros.zambrano@example.com', 8),
(83, 'Tomás', 'Burgos', '38123538', '1989-04-21', '388-155-003', 'tomas.burgos@example.com', 12),
(84, 'Jimena', 'Flores', '39123539', '1997-02-16', '388-155-004', 'jimena.flores@example.com', 14),
(85, 'Enzo', 'Vidal', '40123540', '1985-09-30', '388-155-005', 'enzo.vidal@example.com', 18),
(86, 'Camila', 'Villalba', '41123541', '1996-07-07', '388-155-006', 'camila.villalba@example.com', 20),
(87, 'Emanuel', 'Rico', '42123542', '1978-12-01', '388-155-007', 'emanuel.rico@example.com', 22),
(88, 'Noelia', 'Ortiz', '43123543', '1993-08-25', '388-155-008', 'noelia.ortiz@example.com', 24),
(89, 'Franco', 'Araoz', '44123544', '1984-05-04', '388-155-009', 'franco.araoz@example.com', 27),
(90, 'Carla', 'Medrano', '45123545', '1981-01-19', '388-155-010', 'carla.medrano@example.com', 30),
(91, 'Julieta', 'Montenegro', '46123546', '1999-10-10', '388-155-011', 'julieta.montenegro@example.com', 33),
(92, 'Matías', 'García', '47123547', '1988-03-29', '388-155-012', 'matias.garcia@example.com', 35),
(93, 'Melisa', 'Palacios', '48123548', '1992-12-08', '388-155-013', 'melisa.palacios@example.com', 37),
(94, 'Cristian', 'Farfán', '49123549', '1986-07-14', '388-155-014', 'cristian.farfan@example.com', 39),
(95, 'Rocío', 'Salvatierra', '50123550', '1995-04-02', '388-155-015', 'rocio.salvatierra@example.com', 40),
(96, 'Aarón', 'Gutiérrez', '51123551', '1983-02-17', '388-155-016', 'aaron.gutierrez@example.com', 3),
(97, 'Samira', 'Mamani', '52123552', '2000-06-26', '388-155-017', 'samira.mamani@example.com', 6),
(98, 'Damián', 'Tejerina', '53123553', '1979-09-11', '388-155-018', 'damian.tejerina@example.com', 11),
(99, 'Pilar', 'Ríos', '54123554', '1991-08-03', '388-155-019', 'pilar.rios@example.com', 16),
(100, 'Ester', 'Martínez', '55123555', '1964-03-09', '388-155-020', 'ester.martinez@example.com', 21);

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL,
  `nombre` varchar(200) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `id_direccion` int(11) DEFAULT NULL,
  `id_usuario_modificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `proveedor`
--

INSERT INTO `proveedor` (`id_proveedor`, `nombre`, `telefono`, `email`, `id_direccion`, `id_usuario_modificacion`) VALUES
(1, 'Laboratorio Central Jujuy', '388-200-111', 'labcentral@jujuy.com', 1, NULL),
(2, 'Suministros Médicos SA', '388-200-112', 'ventas@suministrosmed.com', 2, NULL),
(3, 'Farmacia Del Norte', '388-200-113', 'contacto@farmanianorte.com', 3, NULL),
(4, 'Equipos Médicos SRL', '388-200-114', 'info@equiposmed.com', 4, NULL),
(5, 'Distribuidora Salud', '388-200-115', 'salud@distribuidora.com', 5, NULL),
(6, 'Laboratorio Regional', '388-200-116', 'labregional@example.com', 6, NULL),
(7, 'TechMed Argentina', '388-200-117', 'ventas@techmed.ar', 7, NULL),
(8, 'Proveedora El Carmen', '388-200-118', 'contacto@provcar.com', 8, NULL),
(9, 'Agrofarma', '388-200-119', 'ventas@agrofarma.com', 9, NULL),
(10, 'Química del Norte', '388-200-120', 'info@quimicanorte.com', 10, NULL),
(11, 'Insumos Médicos Patagonia', '388-200-121', 'patagonia@insumos.com', 11, NULL),
(12, 'Equipos y Servicios', '388-200-122', 'servicios@equipos.com', 12, NULL),
(13, 'Distribuidora Sur', '388-200-123', 'contacto@distribsur.com', 13, NULL),
(14, 'Laboratorio Mendoza', '388-200-124', 'labmza@example.com', 14, NULL),
(15, 'Suministros Norte', '388-200-125', 'sumnorth@example.com', 15, NULL),
(16, 'Medicamentos Jujuy', '388-200-126', 'medjujuy@example.com', 16, NULL),
(17, 'Proveedor Santa Fe', '388-200-127', 'prov.sf@example.com', 17, NULL),
(18, 'Equipos Córdoba', '388-200-128', 'equiposcba@example.com', 18, NULL),
(19, 'Salud Integral', '388-200-129', 'saludint@example.com', 19, NULL),
(20, 'BioLab Argentina', '388-200-130', 'biolab@example.com', 20, NULL);

--
-- Triggers `proveedor`
--
DELIMITER $$
CREATE TRIGGER `tr_update_proveedor` AFTER UPDATE ON `proveedor` FOR EACH ROW BEGIN
    INSERT INTO Historial_modificacion(
        id_tabla_afectada,
        id_registro,
        id_usuario_modificacion,
        fecha_modificacion
    )
    VALUES(
        10,
        OLD.id_proveedor,
        NEW.id_usuario_modificacion,
        NOW()
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `provincia`
--

CREATE TABLE `provincia` (
  `id_provincia` int(11) NOT NULL,
  `nombre_provincia` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `provincia`
--

INSERT INTO `provincia` (`id_provincia`, `nombre_provincia`) VALUES
(1, 'Buenos Aires'),
(2, 'Ciudad Autónoma de Buenos Aires'),
(3, 'Catamarca'),
(4, 'Chaco'),
(5, 'Chubut'),
(6, 'Córdoba'),
(7, 'Corrientes'),
(8, 'Entre Ríos'),
(9, 'Formosa'),
(10, 'Jujuy'),
(11, 'La Pampa'),
(12, 'La Rioja'),
(13, 'Mendoza'),
(14, 'Misiones'),
(15, 'Neuquén'),
(16, 'Río Negro'),
(17, 'Salta'),
(18, 'San Juan'),
(19, 'San Luis'),
(20, 'Santa Cruz'),
(21, 'Santa Fe'),
(22, 'Santiago del Estero'),
(23, 'Tierra del Fuego'),
(24, 'Tucumán');

-- --------------------------------------------------------

--
-- Table structure for table `registro_turnos`
--

CREATE TABLE `registro_turnos` (
  `id_registro_tur` int(11) NOT NULL,
  `id_turno` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_estado_anterior` int(11) DEFAULT NULL,
  `id_estado_nuevo` int(11) DEFAULT NULL,
  `fecha_cambio` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registro_turnos`
--

INSERT INTO `registro_turnos` (`id_registro_tur`, `id_turno`, `id_usuario`, `id_estado_anterior`, `id_estado_nuevo`, `fecha_cambio`) VALUES
(61, 3, 4, 1, 2, '2025-11-03 10:45:00'),
(62, 4, 5, 1, 3, '2025-11-04 12:50:00'),
(63, 8, 9, 1, 4, '2025-11-08 11:30:00'),
(64, 9, 10, 1, 5, '2025-11-09 13:40:00'),
(65, 13, 14, 2, 1, '2025-11-13 10:50:00'),
(66, 22, 23, 1, 2, '2025-11-22 09:05:00'),
(67, 27, 28, 1, 3, '2025-11-27 11:15:00'),
(68, 33, 34, 1, 2, '2025-11-30 14:10:00'),
(69, 41, 40, 2, 1, '2025-12-02 09:55:00'),
(70, 50, 11, 1, 1, '2025-12-10 09:35:00'),
(71, 60, 21, 1, 2, '2025-12-30 10:50:00'),
(72, 65, 26, 2, 3, '2026-01-06 13:10:00'),
(73, 70, 31, 1, 1, '2026-01-11 15:10:00'),
(74, 77, 38, 1, 2, '2026-01-18 11:30:00'),
(75, 82, 40, 1, 3, '2026-01-23 13:00:00'),
(76, 88, 40, 2, 1, '2026-01-29 09:40:00'),
(77, 91, 38, 1, 2, '2026-02-01 11:10:00'),
(78, 94, 39, 1, 1, '2026-02-04 12:00:00'),
(79, 97, 38, 1, 2, '2026-02-07 13:20:00'),
(80, 100, 26, 1, 1, '2026-02-10 14:10:00'),
(81, 7, 8, 1, 2, '2025-11-07 09:05:00'),
(82, 12, 13, 2, 3, '2025-11-12 09:50:00'),
(83, 18, 19, 1, 2, '2025-11-18 09:50:00'),
(84, 24, 25, 1, 2, '2025-11-24 10:25:00'),
(85, 29, 30, 1, 5, '2025-11-29 12:45:00'),
(86, 36, 37, 2, 1, '2025-12-06 15:40:00'),
(87, 44, 26, 1, 3, '2025-11-15 12:10:00'),
(88, 53, 40, 1, 2, '2025-11-24 11:15:00'),
(89, 59, 27, 1, 2, '2025-12-01 15:05:00'),
(90, 68, 25, 1, 4, '2025-12-09 09:10:00');

-- --------------------------------------------------------

--
-- Table structure for table `resultado_analisis`
--

CREATE TABLE `resultado_analisis` (
  `id_resultado` int(11) NOT NULL,
  `id_analisis` int(11) NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `resultado` text DEFAULT NULL,
  `id_usuario_creacion` int(11) DEFAULT NULL,
  `id_usuario_modificacion` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `activo` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `resultado_analisis`
--

INSERT INTO `resultado_analisis` (`id_resultado`, `id_analisis`, `id_paciente`, `id_medico`, `fecha`, `resultado`, `id_usuario_creacion`, `id_usuario_modificacion`, `fecha_creacion`, `activo`) VALUES
(401, 1, 1, 1, '2025-10-10 09:12:00', 'Hemograma dentro de límites normales', 1, NULL, '2025-11-18 05:10:16', 1),
(402, 2, 2, 2, '2025-10-11 10:30:00', 'Glicemia 95 mg/dL (ayunas)', 2, NULL, '2025-11-18 05:10:16', 1),
(403, 3, 3, 3, '2025-10-12 11:45:00', 'Colesterol total 180 mg/dL', 3, NULL, '2025-11-18 05:10:16', 1),
(404, 4, 4, 4, '2025-10-13 08:20:00', 'PCR negativo', 4, NULL, '2025-11-18 05:10:16', 1),
(405, 5, 5, 5, '2025-10-14 12:00:00', 'Uremia levemente elevada', 5, NULL, '2025-11-18 05:10:16', 1),
(406, 6, 6, 6, '2025-10-15 13:10:00', 'TSH 2.1 mIU/L', 6, NULL, '2025-11-18 05:10:16', 1),
(407, 7, 7, 7, '2025-10-16 09:00:00', 'Electrolitos dentro de rango', 7, NULL, '2025-11-18 05:10:16', 1),
(408, 8, 8, 8, '2025-10-17 15:30:00', 'Hemocultivo sin crecimiento', 8, NULL, '2025-11-18 05:10:16', 1),
(409, 9, 9, 9, '2025-10-18 10:00:00', 'EGO: Leve piuria', 9, NULL, '2025-11-18 05:10:16', 1),
(410, 10, 10, 10, '2025-10-19 11:00:00', 'Beta HCG negativo', 10, NULL, '2025-11-18 05:10:16', 1),
(411, 11, 11, 11, '2025-10-20 09:50:00', 'Grupo sanguíneo O+', 11, NULL, '2025-11-18 05:10:16', 1),
(412, 12, 12, 12, '2025-10-21 14:00:00', 'Amilasa normal', 12, NULL, '2025-11-18 05:10:16', 1),
(413, 13, 13, 13, '2025-10-22 08:30:00', 'ALT elevada 56 U/L', 13, NULL, '2025-11-18 05:10:16', 1),
(414, 14, 14, 14, '2025-10-23 10:15:00', 'INR 1.0', 14, NULL, '2025-11-18 05:10:16', 1),
(415, 15, 15, 15, '2025-10-24 11:22:00', 'Troponina negativa', 15, NULL, '2025-11-18 05:10:16', 1),
(416, 16, 16, 16, '2025-10-25 09:35:00', 'Cultivo de orina con E. coli', 16, NULL, '2025-11-18 05:10:16', 1),
(417, 17, 17, 17, '2025-10-26 12:40:00', 'VDRL no reactivo', 17, NULL, '2025-11-18 05:10:16', 1),
(418, 18, 18, 18, '2025-10-27 13:55:00', 'HBsAg negativo', 18, NULL, '2025-11-18 05:10:16', 1),
(419, 19, 19, 19, '2025-10-28 08:05:00', 'Anti-HCV no detectado', 19, NULL, '2025-11-18 05:10:16', 1),
(420, 20, 20, 20, '2025-10-29 09:45:00', 'Prueba rápida negativa', 20, NULL, '2025-11-18 05:10:16', 1),
(421, 21, 21, 1, '2025-10-30 10:10:00', 'Perfil renal normal', 1, NULL, '2025-11-18 05:10:16', 1),
(422, 22, 22, 2, '2025-10-31 11:33:00', 'Gasometría: pH normal', 2, NULL, '2025-11-18 05:10:16', 1),
(423, 23, 23, 3, '2025-11-01 12:20:00', 'Test alergia: negativo', 3, NULL, '2025-11-18 05:10:16', 1),
(424, 24, 24, 4, '2025-11-02 09:11:00', 'Pantalla toxicológica sin hallazgos', 4, NULL, '2025-11-18 05:10:16', 1),
(425, 25, 25, 5, '2025-11-03 14:14:00', 'ANA negativo', 5, NULL, '2025-11-18 05:10:16', 1),
(426, 26, 26, 6, '2025-11-04 08:44:00', 'PCR Influenza A negativo', 6, NULL, '2025-11-18 05:10:16', 1),
(427, 27, 27, 7, '2025-11-05 10:50:00', 'Toxoplasma IgG positiva IgM negativa', 7, NULL, '2025-11-18 05:10:16', 1),
(428, 28, 28, 8, '2025-11-06 13:00:00', 'PCR respiratorio: negativo', 8, NULL, '2025-11-18 05:10:16', 1),
(429, 29, 29, 9, '2025-11-07 09:20:00', 'Carga viral no detectada', 9, NULL, '2025-11-18 05:10:16', 1),
(430, 1, 30, 10, '2025-11-08 15:30:00', 'Hemograma con anemia leve', 10, NULL, '2025-11-18 05:10:16', 1),
(431, 2, 31, 11, '2025-11-09 10:00:00', 'Resultado A', 11, NULL, '2025-11-18 05:10:16', 1),
(432, 3, 32, 12, '2025-11-10 11:00:00', 'Resultado B', 12, NULL, '2025-11-18 05:10:16', 1),
(433, 4, 33, 13, '2025-11-11 09:30:00', 'Resultado C', 13, NULL, '2025-11-18 05:10:16', 1),
(434, 5, 34, 14, '2025-11-12 14:15:00', 'Resultado D', 14, NULL, '2025-11-18 05:10:16', 1),
(435, 6, 35, 15, '2025-11-13 08:40:00', 'Resultado E', 15, NULL, '2025-11-18 05:10:16', 1),
(436, 7, 36, 16, '2025-11-14 12:12:00', 'Resultado F', 16, NULL, '2025-11-18 05:10:16', 1),
(437, 8, 37, 17, '2025-11-15 13:30:00', 'Resultado G', 17, NULL, '2025-11-18 05:10:16', 1),
(438, 9, 38, 18, '2025-11-16 09:05:00', 'Resultado H', 18, NULL, '2025-11-18 05:10:16', 1),
(439, 10, 39, 19, '2025-11-17 10:20:00', 'Resultado I', 19, NULL, '2025-11-18 05:10:16', 1),
(440, 11, 40, 20, '2025-11-18 11:45:00', 'Resultado J', 20, NULL, '2025-11-18 05:10:16', 1),
(441, 12, 41, 1, '2025-11-19 08:30:00', 'Resultado K', 1, NULL, '2025-11-18 05:10:16', 1),
(442, 13, 42, 2, '2025-11-20 09:15:00', 'Resultado L', 2, NULL, '2025-11-18 05:10:16', 1),
(443, 14, 43, 3, '2025-11-21 10:05:00', 'Resultado M', 3, NULL, '2025-11-18 05:10:16', 1),
(444, 15, 44, 4, '2025-11-22 11:50:00', 'Resultado N', 4, NULL, '2025-11-18 05:10:16', 1),
(445, 16, 45, 5, '2025-11-23 12:25:00', 'Resultado O', 5, NULL, '2025-11-18 05:10:16', 1),
(446, 17, 46, 6, '2025-11-24 09:40:00', 'Resultado P', 6, NULL, '2025-11-18 05:10:16', 1),
(447, 18, 47, 7, '2025-11-25 14:00:00', 'Resultado Q', 7, NULL, '2025-11-18 05:10:16', 1),
(448, 19, 48, 8, '2025-11-26 08:55:00', 'Resultado R', 8, NULL, '2025-11-18 05:10:16', 1),
(449, 20, 49, 9, '2025-11-27 10:10:00', 'Resultado S', 9, NULL, '2025-11-18 05:10:16', 1),
(450, 21, 50, 10, '2025-11-28 15:00:00', 'Resultado T', 10, NULL, '2025-11-18 05:10:16', 1),
(451, 22, 51, 11, '2025-11-29 09:00:00', 'Resultado U', 11, NULL, '2025-11-18 05:10:16', 1),
(452, 23, 52, 12, '2025-11-30 10:30:00', 'Resultado V', 12, NULL, '2025-11-18 05:10:16', 1),
(453, 24, 53, 13, '2025-12-01 11:00:00', 'Resultado W', 13, NULL, '2025-11-18 05:10:16', 1),
(454, 25, 54, 14, '2025-12-02 12:00:00', 'Resultado X', 14, NULL, '2025-11-18 05:10:16', 1),
(455, 26, 55, 15, '2025-12-03 13:20:00', 'Resultado Y', 15, NULL, '2025-11-18 05:10:16', 1),
(456, 27, 56, 16, '2025-12-04 08:10:00', 'Resultado Z', 16, NULL, '2025-11-18 05:10:16', 1),
(457, 28, 57, 17, '2025-12-05 09:50:00', 'Resultado AA', 17, NULL, '2025-11-18 05:10:16', 1),
(458, 29, 58, 18, '2025-12-06 11:40:00', 'Resultado BB', 18, NULL, '2025-11-18 05:10:16', 1),
(459, 1, 59, 19, '2025-12-07 10:25:00', 'Resultado CC', 19, NULL, '2025-11-18 05:10:16', 1),
(460, 2, 60, 20, '2025-12-08 14:10:00', 'Resultado DD', 20, NULL, '2025-11-18 05:10:16', 1),
(461, 3, 61, 1, '2025-12-09 09:45:00', 'Resultado EE', 1, NULL, '2025-11-18 05:10:16', 1),
(462, 4, 62, 2, '2025-12-10 11:15:00', 'Resultado FF', 2, NULL, '2025-11-18 05:10:16', 1),
(463, 5, 63, 3, '2025-12-11 10:55:00', 'Resultado GG', 3, NULL, '2025-11-18 05:10:16', 1),
(464, 6, 64, 4, '2025-12-12 13:05:00', 'Resultado HH', 4, NULL, '2025-11-18 05:10:16', 1),
(465, 7, 65, 5, '2025-12-13 09:35:00', 'Resultado II', 5, NULL, '2025-11-18 05:10:16', 1),
(466, 8, 66, 6, '2025-12-14 08:20:00', 'Resultado JJ', 6, NULL, '2025-11-18 05:10:16', 1),
(467, 9, 67, 7, '2025-12-15 12:30:00', 'Resultado KK', 7, NULL, '2025-11-18 05:10:16', 1),
(468, 10, 68, 8, '2025-12-16 14:40:00', 'Resultado LL', 8, NULL, '2025-11-18 05:10:16', 1),
(469, 11, 69, 9, '2025-12-17 09:10:00', 'Resultado MM', 9, NULL, '2025-11-18 05:10:16', 1),
(470, 12, 70, 10, '2025-12-18 10:00:00', 'Resultado NN', 10, NULL, '2025-11-18 05:10:16', 1),
(471, 13, 71, 11, '2025-12-19 11:20:00', 'Resultado OO', 11, NULL, '2025-11-18 05:10:16', 1),
(472, 14, 72, 12, '2025-12-20 08:50:00', 'Resultado PP', 12, NULL, '2025-11-18 05:10:16', 1),
(473, 15, 73, 13, '2025-12-21 09:30:00', 'Resultado QQ', 13, NULL, '2025-11-18 05:10:16', 1),
(474, 16, 74, 14, '2025-12-22 10:40:00', 'Resultado RR', 14, NULL, '2025-11-18 05:10:16', 1),
(475, 17, 75, 15, '2025-12-23 11:55:00', 'Resultado SS', 15, NULL, '2025-11-18 05:10:16', 1),
(476, 18, 76, 16, '2025-12-24 14:05:00', 'Resultado TT', 16, NULL, '2025-11-18 05:10:16', 1),
(477, 19, 77, 17, '2025-12-25 09:25:00', 'Resultado UU', 17, NULL, '2025-11-18 05:10:16', 1),
(478, 20, 78, 18, '2025-12-26 10:10:00', 'Resultado VV', 18, NULL, '2025-11-18 05:10:16', 1),
(479, 21, 79, 19, '2025-12-27 11:45:00', 'Resultado WW', 19, NULL, '2025-11-18 05:10:16', 1),
(480, 22, 80, 20, '2025-12-28 12:30:00', 'Resultado XX', 20, NULL, '2025-11-18 05:10:16', 1),
(481, 23, 81, 1, '2025-12-29 09:15:00', 'Resultado YY', 1, NULL, '2025-11-18 05:10:16', 1),
(482, 24, 82, 2, '2025-12-30 10:05:00', 'Resultado ZZ', 2, NULL, '2025-11-18 05:10:16', 1),
(483, 25, 83, 3, '2025-12-31 11:40:00', 'Resultado AAA', 3, NULL, '2025-11-18 05:10:16', 1),
(484, 26, 84, 4, '2026-01-01 13:30:00', 'Resultado BBB', 4, NULL, '2025-11-18 05:10:16', 1),
(485, 27, 85, 5, '2026-01-02 14:20:00', 'Resultado CCC', 5, NULL, '2025-11-18 05:10:16', 1),
(486, 28, 86, 6, '2026-01-03 09:00:00', 'Resultado DDD', 6, NULL, '2025-11-18 05:10:16', 1),
(487, 29, 87, 7, '2026-01-04 10:30:00', 'Resultado EEE', 7, NULL, '2025-11-18 05:10:16', 1),
(488, 1, 88, 8, '2026-01-05 11:10:00', 'Resultado FFF', 8, NULL, '2025-11-18 05:10:16', 1),
(489, 2, 89, 9, '2026-01-06 12:50:00', 'Resultado GGG', 9, NULL, '2025-11-18 05:10:16', 1),
(490, 3, 90, 10, '2026-01-07 09:40:00', 'Resultado HHH', 10, NULL, '2025-11-18 05:10:16', 1),
(491, 4, 91, 11, '2026-01-08 10:20:00', 'Resultado III', 11, NULL, '2025-11-18 05:10:16', 1),
(492, 5, 92, 12, '2026-01-09 11:55:00', 'Resultado JJJ', 12, NULL, '2025-11-18 05:10:16', 1),
(493, 6, 93, 13, '2026-01-10 09:35:00', 'Resultado KKK', 13, NULL, '2025-11-18 05:10:16', 1),
(494, 7, 94, 14, '2026-01-11 08:10:00', 'Resultado LLL', 14, NULL, '2025-11-18 05:10:16', 1),
(495, 8, 95, 15, '2026-01-12 12:00:00', 'Resultado MMM', 15, NULL, '2025-11-18 05:10:16', 1),
(496, 9, 96, 16, '2026-01-13 13:45:00', 'Resultado NNN', 16, NULL, '2025-11-18 05:10:16', 1),
(497, 10, 97, 17, '2026-01-14 10:10:00', 'Resultado OOO', 17, NULL, '2025-11-18 05:10:16', 1),
(498, 11, 98, 18, '2026-01-15 09:55:00', 'Resultado PPP', 18, NULL, '2025-11-18 05:10:16', 1),
(499, 12, 99, 19, '2026-01-16 11:30:00', 'Resultado QQQ', 19, NULL, '2025-11-18 05:10:16', 1),
(500, 13, 100, 20, '2026-01-17 12:05:00', 'Resultado RRR', 20, NULL, '2025-11-18 05:10:16', 1);

--
-- Triggers `resultado_analisis`
--
DELIMITER $$
CREATE TRIGGER `tr_update_resultado_analisis` AFTER UPDATE ON `resultado_analisis` FOR EACH ROW BEGIN
    INSERT INTO Historial_modificacion(
        id_tabla_afectada,
        id_registro,
        id_usuario_modificacion,
        fecha_modificacion
    )
    VALUES(
        6,
        OLD.id_resultado,
        NEW.id_usuario_modificacion,
        NOW()
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre`, `descripcion`) VALUES
(1, 'Administrador', 'Acceso total al sistema'),
(2, 'Recepcionista', 'Gestión de turnos y pacientes'),
(3, 'Médico', 'Acceso a historias clínicas y carga de resultados'),
(4, 'Laboratorista', 'Carga y control de análisis clínicos'),
(5, 'Caja', 'Gestión de pagos y facturación'),
(6, 'Director Médico', 'Supervisión general de servicios médicos');

-- --------------------------------------------------------

--
-- Table structure for table `servicios`
--

CREATE TABLE `servicios` (
  `id_servicio` int(11) NOT NULL,
  `nombre_servicio` varchar(150) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `precio_base` decimal(10,2) DEFAULT NULL,
  `activo` tinyint(4) DEFAULT 1,
  `id_usuario_modificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `servicios`
--

INSERT INTO `servicios` (`id_servicio`, `nombre_servicio`, `descripcion`, `precio_base`, `activo`, `id_usuario_modificacion`) VALUES
(1, 'Consulta General', 'Consulta médica general', 2500.00, 1, NULL),
(2, 'Consulta Pediatría', 'Atención pediátrica', 2200.00, 1, NULL),
(3, 'Electrocardiograma', 'ECG de 12 derivaciones', 4500.00, 1, NULL),
(4, 'Ecografía Abdominal', 'Ecografía completa', 7000.00, 1, NULL),
(5, 'Analítica Completa', 'Análisis sanguíneo panel básico', 3500.00, 1, NULL),
(6, 'Radiografía Torax', 'Rx de tórax 1 proyección', 3000.00, 1, NULL),
(7, 'Consulta Cardiología', 'Consulta con cardiólogo', 3500.00, 1, NULL),
(8, 'Control Dermatología', 'Revisión dermatológica', 2800.00, 1, NULL),
(9, 'Vacunación', 'Aplicación de vacunas', 800.00, 1, NULL),
(10, 'Consulta Ginecología', 'Atención ginecológica', 3200.00, 1, NULL),
(11, 'Procedimiento Menor', 'Pequeños procedimientos ambulatorios', 4200.00, 1, NULL),
(12, 'Electrolitos', 'Estudio electrolitos', 1800.00, 1, NULL),
(13, 'Testeo PCR', 'Test PCR COVID', 9000.00, 1, NULL),
(14, 'Evaluación Preoperatoria', 'Exámenes preoperatorios', 5000.00, 1, NULL),
(15, 'Ecografía Obstétrica', 'Control embarazo', 6000.00, 1, NULL),
(16, 'TAC Simple', 'Tomografía axial computarizada', 18000.00, 1, NULL),
(17, 'Consulta Neurología', 'Atención neurológica', 4000.00, 1, NULL),
(18, 'Consulta Endocrinología', 'Atención endocrinológica', 3600.00, 1, NULL),
(19, 'Kinesiología', 'Sesión de kinesiología', 2200.00, 1, NULL),
(20, 'Consulta Oftalmología', 'Revisión de la vista', 2100.00, 1, NULL);

--
-- Triggers `servicios`
--
DELIMITER $$
CREATE TRIGGER `tr_update_servicios` AFTER UPDATE ON `servicios` FOR EACH ROW BEGIN
    INSERT INTO Historial_modificacion(
        id_tabla_afectada,
        id_registro,
        id_usuario_modificacion,
        fecha_modificacion
    )
    VALUES(
        4,
        OLD.id_servicio,
        NEW.id_usuario_modificacion,
        NOW()
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tablasdb`
--

CREATE TABLE `tablasdb` (
  `id_tabladb` int(11) NOT NULL,
  `nombre_tabla` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tablasdb`
--

INSERT INTO `tablasdb` (`id_tabladb`, `nombre_tabla`) VALUES
(1, 'Pacientes'),
(2, 'Medicos'),
(3, 'Especialidad'),
(4, 'Servicios'),
(5, 'Turno'),
(6, 'Direccion'),
(7, 'Obra_social'),
(8, 'Persona'),
(9, 'Estado_turno'),
(10, 'Factura'),
(11, 'Detalle_factura'),
(12, 'Analisis'),
(13, 'Resultado_analisis'),
(14, 'Usuarios'),
(15, 'Roles'),
(16, 'Registro_turnos'),
(17, 'Paciente_obra_social'),
(18, 'Medico_paciente'),
(19, 'Historial_modificacion'),
(20, 'Metodo_pago'),
(21, 'Proveedor'),
(22, 'Inventario'),
(23, 'Horario_medico'),
(24, 'Dia_semana'),
(25, 'Departamento'),
(26, 'Localidad'),
(27, 'Provincia'),
(28, 'Medico_matricula'),
(29, 'Entidad_emisora'),
(30, 'Ambito');

-- --------------------------------------------------------

--
-- Table structure for table `turno`
--

CREATE TABLE `turno` (
  `id_turno` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_medico` int(11) NOT NULL,
  `id_estado` int(11) NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `observaciones` varchar(300) DEFAULT NULL,
  `id_usuario_creacion` int(11) DEFAULT NULL,
  `id_usuario_modificacion` int(11) DEFAULT NULL,
  `activo` tinyint(4) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `turno`
--

INSERT INTO `turno` (`id_turno`, `fecha`, `hora`, `id_paciente`, `id_medico`, `id_estado`, `id_servicio`, `observaciones`, `id_usuario_creacion`, `id_usuario_modificacion`, `activo`, `fecha_creacion`, `fecha_modificacion`) VALUES
(1, '2025-11-01', '09:00:00', 1, 1, 1, 1, 'Control anual', 2, NULL, 1, '2025-11-01 08:00:00', '2025-11-18 01:46:00'),
(2, '2025-11-02', '10:00:00', 2, 2, 2, 2, 'Consulta por fiebre', 3, NULL, 1, '2025-11-02 09:00:00', '2025-11-18 01:46:00'),
(3, '2025-11-03', '11:30:00', 3, 3, 1, 3, 'Chequeo cardiológico', 4, NULL, 1, '2025-11-03 10:20:00', '2025-11-18 01:46:00'),
(4, '2025-11-04', '14:00:00', 4, 4, 3, 4, 'Ecografía abdominal', 5, NULL, 1, '2025-11-04 12:45:00', '2025-11-18 01:46:00'),
(5, '2025-11-05', '08:30:00', 5, 5, 1, 5, 'Análisis preoperatorio', 6, NULL, 1, '2025-11-05 07:50:00', '2025-11-18 01:46:00'),
(6, '2025-11-06', '09:15:00', 6, 6, 2, 6, 'Consulta endocrinología', 7, NULL, 1, '2025-11-06 08:10:00', '2025-11-18 01:46:00'),
(7, '2025-11-07', '10:30:00', 7, 7, 1, 7, 'Control dermatológico', 8, NULL, 1, '2025-11-07 09:20:00', '2025-11-18 01:46:00'),
(8, '2025-11-08', '13:00:00', 8, 8, 4, 8, 'Seguimiento', 9, NULL, 1, '2025-11-08 11:45:00', '2025-11-18 01:46:00'),
(9, '2025-11-09', '15:00:00', 9, 9, 5, 9, 'Vacunación', 10, NULL, 1, '2025-11-09 13:30:00', '2025-11-18 01:46:00'),
(10, '2025-11-10', '16:30:00', 10, 10, 1, 10, 'Consulta ginecología', 11, NULL, 1, '2025-11-10 15:00:00', '2025-11-18 01:46:00'),
(11, '2025-11-11', '09:00:00', 11, 11, 1, 11, 'Procedimiento menor', 12, NULL, 1, '2025-11-11 08:00:00', '2025-11-18 01:46:00'),
(12, '2025-11-12', '10:20:00', 12, 12, 2, 12, 'Control electrolitos', 13, NULL, 1, '2025-11-12 09:10:00', '2025-11-18 01:46:00'),
(13, '2025-11-13', '11:40:00', 13, 13, 3, 13, 'Test PCR', 14, NULL, 1, '2025-11-13 10:30:00', '2025-11-18 01:46:00'),
(14, '2025-11-14', '09:30:00', 14, 14, 1, 14, 'Preoperatorio', 15, NULL, 1, '2025-11-14 08:40:00', '2025-11-18 01:46:00'),
(15, '2025-11-15', '08:45:00', 15, 15, 2, 15, 'Ecografía obstétrica', 16, NULL, 1, '2025-11-15 07:50:00', '2025-11-18 01:46:00'),
(16, '2025-11-16', '13:15:00', 16, 16, 1, 16, 'TAC', 17, NULL, 1, '2025-11-16 12:00:00', '2025-11-18 01:46:00'),
(17, '2025-11-17', '14:40:00', 17, 17, 1, 17, 'Consulta neurología', 18, NULL, 1, '2025-11-17 13:30:00', '2025-11-18 01:46:00'),
(18, '2025-11-18', '10:10:00', 18, 18, 2, 18, 'Control endocrino', 19, NULL, 1, '2025-11-18 09:00:00', '2025-11-18 01:46:00'),
(19, '2025-11-19', '11:25:00', 19, 19, 1, 19, 'Kinesiología', 20, NULL, 1, '2025-11-19 10:10:00', '2025-11-18 01:46:00'),
(20, '2025-11-20', '12:00:00', 20, 20, 1, 20, 'Consulta oftalmología', 21, NULL, 1, '2025-11-20 11:00:00', '2025-11-18 01:46:00'),
(21, '2025-11-21', '09:00:00', 21, 1, 1, 1, 'Consulta general', 22, NULL, 1, '2025-11-21 08:00:00', '2025-11-18 01:46:00'),
(22, '2025-11-22', '09:30:00', 22, 2, 1, 2, 'Control', 23, NULL, 1, '2025-11-22 08:40:00', '2025-11-18 01:46:00'),
(23, '2025-11-23', '10:00:00', 23, 3, 1, 3, 'Chequeo', 24, NULL, 1, '2025-11-23 09:00:00', '2025-11-18 01:46:00'),
(24, '2025-11-24', '10:30:00', 24, 4, 2, 4, 'Ecografía', 25, NULL, 1, '2025-11-24 09:20:00', '2025-11-18 01:46:00'),
(25, '2025-11-25', '11:00:00', 25, 5, 1, 5, 'Analítica', 26, NULL, 1, '2025-11-25 10:00:00', '2025-11-18 01:46:00'),
(26, '2025-11-26', '11:30:00', 26, 6, 1, 6, 'Consulta', 27, NULL, 1, '2025-11-26 10:40:00', '2025-11-18 01:46:00'),
(27, '2025-11-27', '12:00:00', 27, 7, 3, 7, 'Dermatología', 28, NULL, 1, '2025-11-27 11:00:00', '2025-11-18 01:46:00'),
(28, '2025-11-28', '12:30:00', 28, 8, 1, 8, 'Control', 29, NULL, 1, '2025-11-28 11:40:00', '2025-11-18 01:46:00'),
(29, '2025-11-29', '13:00:00', 29, 9, 5, 9, 'Vacuna', 30, NULL, 1, '2025-11-29 12:00:00', '2025-11-18 01:46:00'),
(30, '2025-11-30', '13:30:00', 30, 10, 1, 10, 'Ginecología', 31, NULL, 1, '2025-11-30 12:20:00', '2025-11-18 01:46:00'),
(31, '2025-12-01', '14:00:00', 31, 11, 1, 11, 'Procedimiento', 32, NULL, 1, '2025-12-01 13:00:00', '2025-11-18 01:46:00'),
(32, '2025-12-02', '14:30:00', 32, 12, 2, 12, 'Electrolitos', 33, NULL, 1, '2025-12-02 13:20:00', '2025-11-18 01:46:00'),
(33, '2025-12-03', '15:00:00', 33, 13, 1, 13, 'PCR', 34, NULL, 1, '2025-12-03 14:00:00', '2025-11-18 01:46:00'),
(34, '2025-12-04', '15:30:00', 34, 14, 3, 14, 'Preop', 35, NULL, 1, '2025-12-04 14:20:00', '2025-11-18 01:46:00'),
(35, '2025-12-05', '16:00:00', 35, 15, 1, 15, 'Obstetricia', 36, NULL, 1, '2025-12-05 15:00:00', '2025-11-18 01:46:00'),
(36, '2025-12-06', '16:30:00', 36, 16, 2, 16, 'TAC', 37, NULL, 1, '2025-12-06 15:20:00', '2025-11-18 01:46:00'),
(37, '2025-12-07', '08:00:00', 37, 17, 1, 17, 'Neurología', 38, NULL, 1, '2025-12-07 07:30:00', '2025-11-18 01:46:00'),
(38, '2025-12-08', '08:30:00', 38, 18, 1, 18, 'Endocrino', 39, NULL, 1, '2025-12-08 07:50:00', '2025-11-18 01:46:00'),
(39, '2025-12-09', '09:00:00', 39, 19, 4, 19, 'Kine', 40, NULL, 1, '2025-12-09 08:20:00', '2025-11-18 01:46:00'),
(40, '2025-12-10', '09:30:00', 40, 20, 1, 20, 'Oftalmo', 1, NULL, 1, '2025-12-10 08:30:00', '2025-11-18 01:46:00'),
(41, '2025-12-11', '10:00:00', 41, 1, 1, 1, 'Consulta', 2, NULL, 1, '2025-12-11 09:00:00', '2025-11-18 01:46:00'),
(42, '2025-12-12', '10:30:00', 42, 2, 2, 2, 'Consulta', 3, NULL, 1, '2025-12-12 09:20:00', '2025-11-18 01:46:00'),
(43, '2025-12-13', '11:00:00', 43, 3, 1, 3, 'Chequeo', 4, NULL, 1, '2025-12-13 10:00:00', '2025-11-18 01:46:00'),
(44, '2025-12-14', '11:30:00', 44, 4, 1, 4, 'Ecografía', 5, NULL, 1, '2025-12-14 10:20:00', '2025-11-18 01:46:00'),
(45, '2025-12-15', '12:00:00', 45, 5, 2, 5, 'Analítica', 6, NULL, 1, '2025-12-15 11:00:00', '2025-11-18 01:46:00'),
(46, '2025-12-16', '12:30:00', 46, 6, 1, 6, 'Consulta', 7, NULL, 1, '2025-12-16 11:20:00', '2025-11-18 01:46:00'),
(47, '2025-12-17', '13:00:00', 47, 7, 3, 7, 'Dermatología', 8, NULL, 1, '2025-12-17 12:00:00', '2025-11-18 01:46:00'),
(48, '2025-12-18', '13:30:00', 48, 8, 1, 8, 'Control', 9, NULL, 1, '2025-12-18 12:20:00', '2025-11-18 01:46:00'),
(49, '2025-12-19', '14:00:00', 49, 9, 5, 9, 'Vacuna', 10, NULL, 1, '2025-12-19 13:00:00', '2025-11-18 01:46:00'),
(50, '2025-12-20', '14:30:00', 50, 10, 1, 10, 'Ginecología', 11, NULL, 1, '2025-12-20 13:20:00', '2025-11-18 01:46:00'),
(51, '2025-12-21', '15:00:00', 51, 11, 1, 11, 'Procedimiento', 12, NULL, 1, '2025-12-21 14:00:00', '2025-11-18 01:46:00'),
(52, '2025-12-22', '15:30:00', 52, 12, 2, 12, 'Electrolitos', 13, NULL, 1, '2025-12-22 14:20:00', '2025-11-18 01:46:00'),
(53, '2025-12-23', '16:00:00', 53, 13, 3, 13, 'PCR', 14, NULL, 1, '2025-12-23 15:00:00', '2025-11-18 01:46:00'),
(54, '2025-12-24', '16:30:00', 54, 14, 1, 14, 'Preop', 15, NULL, 1, '2025-12-24 15:20:00', '2025-11-18 01:46:00'),
(55, '2025-12-25', '09:00:00', 55, 15, 1, 15, 'Obstetricia', 16, NULL, 1, '2025-12-25 08:00:00', '2025-11-18 01:46:00'),
(56, '2025-12-26', '09:30:00', 56, 16, 1, 16, 'TAC', 17, NULL, 1, '2025-12-26 08:20:00', '2025-11-18 01:46:00'),
(57, '2025-12-27', '10:00:00', 57, 17, 1, 17, 'Neurología', 18, NULL, 1, '2025-12-27 09:00:00', '2025-11-18 01:46:00'),
(58, '2025-12-28', '10:30:00', 58, 18, 2, 18, 'Endocrino', 19, NULL, 1, '2025-12-28 09:20:00', '2025-11-18 01:46:00'),
(59, '2025-12-29', '11:00:00', 59, 19, 1, 19, 'Kine', 20, NULL, 1, '2025-12-29 10:00:00', '2025-11-18 01:46:00'),
(60, '2025-12-30', '11:30:00', 60, 20, 1, 20, 'Oftalmo', 21, NULL, 1, '2025-12-30 10:20:00', '2025-11-18 01:46:00'),
(61, '2026-01-02', '12:00:00', 61, 21, 1, 1, 'Consulta', 22, NULL, 1, '2026-01-02 11:00:00', '2025-11-18 01:46:00'),
(62, '2026-01-03', '12:30:00', 62, 22, 2, 2, 'Consulta', 23, NULL, 1, '2026-01-03 11:20:00', '2025-11-18 01:46:00'),
(63, '2026-01-04', '13:00:00', 63, 23, 1, 3, 'Chequeo', 24, NULL, 1, '2026-01-04 12:00:00', '2025-11-18 01:46:00'),
(64, '2026-01-05', '13:30:00', 64, 24, 1, 4, 'Ecografía', 25, NULL, 1, '2026-01-05 12:20:00', '2025-11-18 01:46:00'),
(65, '2026-01-06', '14:00:00', 65, 25, 2, 5, 'Analítica', 26, NULL, 1, '2026-01-06 13:00:00', '2025-11-18 01:46:00'),
(66, '2026-01-07', '14:30:00', 66, 26, 1, 6, 'Consulta', 27, NULL, 1, '2026-01-07 13:20:00', '2025-11-18 01:46:00'),
(67, '2026-01-08', '15:00:00', 67, 27, 3, 7, 'Dermatología', 28, NULL, 1, '2026-01-08 14:00:00', '2025-11-18 01:46:00'),
(68, '2026-01-09', '15:30:00', 68, 28, 1, 8, 'Control', 29, NULL, 1, '2026-01-09 14:20:00', '2025-11-18 01:46:00'),
(69, '2026-01-10', '16:00:00', 69, 29, 5, 9, 'Vacuna', 30, NULL, 1, '2026-01-10 15:00:00', '2025-11-18 01:46:00'),
(70, '2026-01-11', '16:30:00', 70, 30, 1, 10, 'Ginecología', 31, NULL, 1, '2026-01-11 15:20:00', '2025-11-18 01:46:00'),
(71, '2026-01-12', '09:00:00', 71, 31, 1, 11, 'Procedimiento', 32, NULL, 1, '2026-01-12 08:00:00', '2025-11-18 01:46:00'),
(72, '2026-01-13', '09:30:00', 72, 32, 2, 12, 'Electrolitos', 33, NULL, 1, '2026-01-13 08:20:00', '2025-11-18 01:46:00'),
(73, '2026-01-14', '10:00:00', 73, 33, 1, 13, 'PCR', 34, NULL, 1, '2026-01-14 09:00:00', '2025-11-18 01:46:00'),
(74, '2026-01-15', '10:30:00', 74, 34, 3, 14, 'Preop', 35, NULL, 1, '2026-01-15 09:20:00', '2025-11-18 01:46:00'),
(75, '2026-01-16', '11:00:00', 75, 35, 1, 15, 'Obstetricia', 36, NULL, 1, '2026-01-16 10:00:00', '2025-11-18 01:46:00'),
(76, '2026-01-17', '11:30:00', 76, 36, 2, 16, 'TAC', 37, NULL, 1, '2026-01-17 10:20:00', '2025-11-18 01:46:00'),
(77, '2026-01-18', '12:00:00', 77, 37, 1, 17, 'Neurología', 38, NULL, 1, '2026-01-18 11:00:00', '2025-11-18 01:46:00'),
(78, '2026-01-19', '12:30:00', 78, 38, 1, 18, 'Endocrino', 39, NULL, 1, '2026-01-19 11:20:00', '2025-11-18 01:46:00'),
(79, '2026-01-20', '13:00:00', 79, 39, 1, 19, 'Kine', 40, NULL, 1, '2026-01-20 12:00:00', '2025-11-18 01:46:00'),
(80, '2026-01-21', '13:30:00', 80, 40, 1, 20, 'Oftalmo', 1, NULL, 1, '2026-01-21 12:20:00', '2025-11-18 01:46:00'),
(81, '2026-01-22', '14:00:00', 81, 1, 1, 1, 'Consulta', 2, NULL, 1, '2026-01-22 13:00:00', '2025-11-18 01:46:00'),
(82, '2026-01-23', '14:30:00', 82, 2, 2, 2, 'Consulta', 3, NULL, 1, '2026-01-23 13:20:00', '2025-11-18 01:46:00'),
(83, '2026-01-24', '15:00:00', 83, 3, 1, 3, 'Chequeo', 4, NULL, 1, '2026-01-24 14:00:00', '2025-11-18 01:46:00'),
(84, '2026-01-25', '15:30:00', 84, 4, 1, 4, 'Ecografía', 5, NULL, 1, '2026-01-25 14:20:00', '2025-11-18 01:46:00'),
(85, '2026-01-26', '16:00:00', 85, 5, 2, 5, 'Analítica', 6, NULL, 1, '2026-01-26 15:00:00', '2025-11-18 01:46:00'),
(86, '2026-01-27', '16:30:00', 86, 6, 1, 6, 'Consulta', 7, NULL, 1, '2026-01-27 15:20:00', '2025-11-18 01:46:00'),
(87, '2026-01-28', '09:00:00', 87, 7, 3, 7, 'Dermatología', 8, NULL, 1, '2026-01-28 08:00:00', '2025-11-18 01:46:00'),
(88, '2026-01-29', '09:30:00', 88, 8, 1, 8, 'Control', 9, NULL, 1, '2026-01-29 08:20:00', '2025-11-18 01:46:00'),
(89, '2026-01-30', '10:00:00', 89, 9, 5, 9, 'Vacuna', 10, NULL, 1, '2026-01-30 09:00:00', '2025-11-18 01:46:00'),
(90, '2026-01-31', '10:30:00', 90, 10, 1, 10, 'Ginecología', 11, NULL, 1, '2026-01-31 09:20:00', '2025-11-18 01:46:00'),
(91, '2026-02-01', '11:00:00', 91, 11, 1, 11, 'Procedimiento', 12, NULL, 1, '2026-02-01 10:00:00', '2025-11-18 01:46:00'),
(92, '2026-02-02', '11:30:00', 92, 12, 2, 12, 'Electrolitos', 13, NULL, 1, '2026-02-02 10:20:00', '2025-11-18 01:46:00'),
(93, '2026-02-03', '12:00:00', 93, 13, 1, 13, 'PCR', 14, NULL, 1, '2026-02-03 11:00:00', '2025-11-18 01:46:00'),
(94, '2026-02-04', '12:30:00', 94, 14, 3, 14, 'Preop', 15, NULL, 1, '2026-02-04 11:20:00', '2025-11-18 01:46:00'),
(95, '2026-02-05', '13:00:00', 95, 15, 1, 15, 'Obstetricia', 16, NULL, 1, '2026-02-05 12:00:00', '2025-11-18 01:46:00'),
(96, '2026-02-06', '13:30:00', 96, 16, 2, 16, 'TAC', 17, NULL, 1, '2026-02-06 12:20:00', '2025-11-18 01:46:00'),
(97, '2026-02-07', '14:00:00', 97, 17, 1, 17, 'Neurología', 18, NULL, 1, '2026-02-07 13:00:00', '2025-11-18 01:46:00'),
(98, '2026-02-08', '14:30:00', 98, 18, 1, 18, 'Endocrino', 19, NULL, 1, '2026-02-08 13:20:00', '2025-11-18 01:46:00'),
(99, '2026-02-09', '15:00:00', 99, 19, 1, 19, 'Kine', 20, NULL, 1, '2026-02-09 14:00:00', '2025-11-18 01:46:00'),
(100, '2026-02-10', '15:30:00', 100, 20, 1, 20, 'Oftalmo', 21, NULL, 1, '2026-02-10 14:20:00', '2025-11-18 01:46:00');

--
-- Triggers `turno`
--
DELIMITER $$
CREATE TRIGGER `tr_registro_cambio_estado_turno` BEFORE UPDATE ON `turno` FOR EACH ROW BEGIN
    
    IF NEW.id_estado <> OLD.id_estado THEN
        INSERT INTO Registro_turnos(
            id_turno,
            id_usuario,
            id_estado_anterior,
            id_estado_nuevo,
            fecha_cambio
        ) VALUES (
            OLD.id_turno,
            NEW.id_usuario_modificacion,
            OLD.id_estado,
            NEW.id_estado,
            NOW()
        );
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `tr_update_turno` AFTER UPDATE ON `turno` FOR EACH ROW BEGIN
    INSERT INTO Historial_modificacion(
        id_tabla_afectada,
        id_registro,
        id_usuario_modificacion,
        fecha_modificacion
    )
    VALUES(
        3,
        OLD.id_turno,
        NEW.id_usuario_modificacion,
        NOW()
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(100) NOT NULL,
  `contrasena` varchar(255) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `activo` tinyint(4) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_modificacion` datetime DEFAULT current_timestamp(),
  `id_usuario_modificacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `contrasena`, `id_persona`, `id_rol`, `activo`, `fecha_creacion`, `fecha_modificacion`, `id_usuario_modificacion`) VALUES
(1, 'admin_sima', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 1, 1, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(2, 'recep_sanpedro1', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 2, 2, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(3, 'recep_sanpedro2', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 3, 2, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(4, 'medico_cardio1', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 4, 3, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(5, 'medico_pediatria1', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 5, 3, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(6, 'lab1', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 6, 4, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(7, 'caja1', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 7, 5, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(8, 'director_medico', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 8, 6, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(9, 'medico_clinico1', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 9, 3, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(10, 'medico_derma1', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 10, 3, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(11, 'user11', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 11, 2, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(12, 'user12', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 12, 2, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(13, 'user13', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 13, 2, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(14, 'user14', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 14, 2, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(15, 'user15', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 15, 5, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(16, 'user16', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 16, 5, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(17, 'user17', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 17, 4, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(18, 'user18', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 18, 4, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(19, 'user19', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 19, 3, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(20, 'user20', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 20, 3, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(21, 'user21', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 21, 2, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(22, 'user22', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 22, 2, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(23, 'user23', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 23, 2, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(24, 'user24', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 24, 2, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(25, 'user25', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 25, 5, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(26, 'user26', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 26, 5, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(27, 'user27', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 27, 4, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(28, 'user28', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 28, 4, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(29, 'user29', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 29, 3, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(30, 'user30', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 30, 3, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(31, 'user31', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 31, 2, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(32, 'user32', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 32, 2, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(33, 'user33', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 33, 2, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(34, 'user34', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 34, 2, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(35, 'user35', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 35, 5, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(36, 'user36', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 36, 5, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(37, 'user37', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 37, 4, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(38, 'user38', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 38, 4, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(39, 'user39', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 39, 3, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1),
(40, 'user40', '057ba03d6c44104863dc7361fe4578965d1887360f90a0895882e58a6248fc86', 40, 3, 1, '2025-11-18 01:31:45', '2025-11-18 01:31:45', 1);

--
-- Triggers `usuarios`
--
DELIMITER $$
CREATE TRIGGER `tr_update_usuarios` AFTER UPDATE ON `usuarios` FOR EACH ROW BEGIN
    INSERT INTO Historial_modificacion(
        id_tabla_afectada,
        id_registro,
        id_usuario_modificacion,
        fecha_modificacion
    )
    VALUES(
        11,
        OLD.id_usuario,
        NEW.id_usuario_modificacion,
        NOW()
    );
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ambito`
--
ALTER TABLE `ambito`
  ADD PRIMARY KEY (`id_ambito`);

--
-- Indexes for table `analisis`
--
ALTER TABLE `analisis`
  ADD PRIMARY KEY (`id_analisis`),
  ADD KEY `id_servicio` (`id_servicio`),
  ADD KEY `fk_analisis_usuario_mod` (`id_usuario_modificacion`);

--
-- Indexes for table `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id_departamento`),
  ADD KEY `id_localidad` (`id_localidad`);

--
-- Indexes for table `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_factura` (`id_factura`),
  ADD KEY `id_servicio` (`id_servicio`),
  ADD KEY `id_usuario_modificacion` (`id_usuario_modificacion`);

--
-- Indexes for table `dia_semana`
--
ALTER TABLE `dia_semana`
  ADD PRIMARY KEY (`id_dia_semana`);

--
-- Indexes for table `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`id_direccion`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Indexes for table `entidad_emisora`
--
ALTER TABLE `entidad_emisora`
  ADD PRIMARY KEY (`id_entidad`),
  ADD KEY `id_provincia` (`id_provincia`),
  ADD KEY `id_ambito` (`id_ambito`);

--
-- Indexes for table `especialidad`
--
ALTER TABLE `especialidad`
  ADD PRIMARY KEY (`id_especialidad`);

--
-- Indexes for table `estado_turno`
--
ALTER TABLE `estado_turno`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indexes for table `Factura`
--
ALTER TABLE `Factura`
  ADD PRIMARY KEY (`id_factura`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_usuario_creacion` (`id_usuario_creacion`),
  ADD KEY `fk_factura_usuario_mod` (`id_usuario_modificacion`);

--
-- Indexes for table `Historial_modificacion`
--
ALTER TABLE `Historial_modificacion`
  ADD PRIMARY KEY (`id_historial`),
  ADD KEY `id_usuario_modificacion` (`id_usuario_modificacion`),
  ADD KEY `id_tabla_afectada` (`id_tabla_afectada`);

--
-- Indexes for table `horario_medico`
--
ALTER TABLE `horario_medico`
  ADD PRIMARY KEY (`id_horario`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_dia_semana` (`id_dia_semana`),
  ADD KEY `id_especialidad` (`id_especialidad`),
  ADD KEY `id_usuario_creador` (`id_usuario_creador`),
  ADD KEY `id_usuario_modificador` (`id_usuario_modificador`),
  ADD KEY `fk_horario_usuario_mod` (`id_usuario_modificacion`);

--
-- Indexes for table `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id_item`),
  ADD KEY `id_proveedor` (`id_proveedor`),
  ADD KEY `fk_inventario_usuario_mod` (`id_usuario_modificacion`);

--
-- Indexes for table `localidad`
--
ALTER TABLE `localidad`
  ADD PRIMARY KEY (`id_localidad`),
  ADD KEY `id_provincia` (`id_provincia`);

--
-- Indexes for table `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id_medico`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_especialidad` (`id_especialidad`),
  ADD KEY `fk_medicos_usuario_mod` (`id_usuario_modificacion`);

--
-- Indexes for table `medico_matricula`
--
ALTER TABLE `medico_matricula`
  ADD PRIMARY KEY (`id_medico_matricula`),
  ADD UNIQUE KEY `numero_matricula` (`numero_matricula`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_entidad` (`id_entidad`);

--
-- Indexes for table `medico_paciente`
--
ALTER TABLE `medico_paciente`
  ADD PRIMARY KEY (`id_medico_paciente`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_paciente` (`id_paciente`);

--
-- Indexes for table `metodo_pago`
--
ALTER TABLE `metodo_pago`
  ADD PRIMARY KEY (`id_metodo`);

--
-- Indexes for table `obra_social`
--
ALTER TABLE `obra_social`
  ADD PRIMARY KEY (`id_obra_social`),
  ADD KEY `id_direccion` (`id_direccion`);

--
-- Indexes for table `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id_paciente`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `fk_pacientes_usuario_mod` (`id_usuario_modificacion`);

--
-- Indexes for table `paciente_obra_social`
--
ALTER TABLE `paciente_obra_social`
  ADD PRIMARY KEY (`id_paciente_obra`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_obra_social` (`id_obra_social`);

--
-- Indexes for table `pago`
--
ALTER TABLE `pago`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `fk_pago_factura` (`id_factura`),
  ADD KEY `fk_pago_metodo` (`id_metodo`);

--
-- Indexes for table `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`id_persona`),
  ADD UNIQUE KEY `dni` (`dni`),
  ADD KEY `id_direccion` (`id_direccion`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id_proveedor`),
  ADD KEY `id_direccion` (`id_direccion`),
  ADD KEY `fk_proveedor_usuario_mod` (`id_usuario_modificacion`);

--
-- Indexes for table `provincia`
--
ALTER TABLE `provincia`
  ADD PRIMARY KEY (`id_provincia`);

--
-- Indexes for table `registro_turnos`
--
ALTER TABLE `registro_turnos`
  ADD PRIMARY KEY (`id_registro_tur`),
  ADD KEY `id_turno` (`id_turno`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indexes for table `resultado_analisis`
--
ALTER TABLE `resultado_analisis`
  ADD PRIMARY KEY (`id_resultado`),
  ADD KEY `id_analisis` (`id_analisis`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_usuario_creacion` (`id_usuario_creacion`),
  ADD KEY `fk_resultado_usuario_mod` (`id_usuario_modificacion`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indexes for table `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id_servicio`),
  ADD KEY `fk_servicios_usuario_mod` (`id_usuario_modificacion`);

--
-- Indexes for table `tablasdb`
--
ALTER TABLE `tablasdb`
  ADD PRIMARY KEY (`id_tabladb`);

--
-- Indexes for table `turno`
--
ALTER TABLE `turno`
  ADD PRIMARY KEY (`id_turno`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_medico` (`id_medico`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_servicio` (`id_servicio`),
  ADD KEY `id_usuario_creacion` (`id_usuario_creacion`),
  ADD KEY `id_usuario_modificacion` (`id_usuario_modificacion`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_rol` (`id_rol`),
  ADD KEY `fk_usuarios_usuario_mod` (`id_usuario_modificacion`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ambito`
--
ALTER TABLE `ambito`
  MODIFY `id_ambito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `analisis`
--
ALTER TABLE `analisis`
  MODIFY `id_analisis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `detalle_factura`
--
ALTER TABLE `detalle_factura`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `dia_semana`
--
ALTER TABLE `dia_semana`
  MODIFY `id_dia_semana` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `direccion`
--
ALTER TABLE `direccion`
  MODIFY `id_direccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `entidad_emisora`
--
ALTER TABLE `entidad_emisora`
  MODIFY `id_entidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `especialidad`
--
ALTER TABLE `especialidad`
  MODIFY `id_especialidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `estado_turno`
--
ALTER TABLE `estado_turno`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Factura`
--
ALTER TABLE `Factura`
  MODIFY `id_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `Historial_modificacion`
--
ALTER TABLE `Historial_modificacion`
  MODIFY `id_historial` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `horario_medico`
--
ALTER TABLE `horario_medico`
  MODIFY `id_horario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `localidad`
--
ALTER TABLE `localidad`
  MODIFY `id_localidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `medico_matricula`
--
ALTER TABLE `medico_matricula`
  MODIFY `id_medico_matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `medico_paciente`
--
ALTER TABLE `medico_paciente`
  MODIFY `id_medico_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `metodo_pago`
--
ALTER TABLE `metodo_pago`
  MODIFY `id_metodo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `obra_social`
--
ALTER TABLE `obra_social`
  MODIFY `id_obra_social` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `paciente_obra_social`
--
ALTER TABLE `paciente_obra_social`
  MODIFY `id_paciente_obra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `pago`
--
ALTER TABLE `pago`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `persona`
--
ALTER TABLE `persona`
  MODIFY `id_persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id_proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `provincia`
--
ALTER TABLE `provincia`
  MODIFY `id_provincia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `registro_turnos`
--
ALTER TABLE `registro_turnos`
  MODIFY `id_registro_tur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `resultado_analisis`
--
ALTER TABLE `resultado_analisis`
  MODIFY `id_resultado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=501;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id_servicio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `tablasdb`
--
ALTER TABLE `tablasdb`
  MODIFY `id_tabladb` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `turno`
--
ALTER TABLE `turno`
  MODIFY `id_turno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `analisis`
--
ALTER TABLE `analisis`
  ADD CONSTRAINT `analisis_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`),
  ADD CONSTRAINT `fk_analisis_usuario_mod` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `departamento`
--
ALTER TABLE `departamento`
  ADD CONSTRAINT `departamento_ibfk_1` FOREIGN KEY (`id_localidad`) REFERENCES `localidad` (`id_localidad`);

--
-- Constraints for table `detalle_factura`
--
ALTER TABLE `detalle_factura`
  ADD CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `Factura` (`id_factura`),
  ADD CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`),
  ADD CONSTRAINT `detalle_factura_ibfk_3` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `direccion`
--
ALTER TABLE `direccion`
  ADD CONSTRAINT `direccion_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`);

--
-- Constraints for table `entidad_emisora`
--
ALTER TABLE `entidad_emisora`
  ADD CONSTRAINT `entidad_emisora_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`),
  ADD CONSTRAINT `entidad_emisora_ibfk_2` FOREIGN KEY (`id_ambito`) REFERENCES `ambito` (`id_ambito`);

--
-- Constraints for table `Factura`
--
ALTER TABLE `Factura`
  ADD CONSTRAINT `Factura_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  ADD CONSTRAINT `Factura_ibfk_2` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `fk_factura_usuario_mod` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `Historial_modificacion`
--
ALTER TABLE `Historial_modificacion`
  ADD CONSTRAINT `Historial_modificacion_ibfk_1` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `Historial_modificacion_ibfk_2` FOREIGN KEY (`id_tabla_afectada`) REFERENCES `tablasdb` (`id_tabladb`);

--
-- Constraints for table `horario_medico`
--
ALTER TABLE `horario_medico`
  ADD CONSTRAINT `fk_horario_usuario_mod` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `horario_medico_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`),
  ADD CONSTRAINT `horario_medico_ibfk_2` FOREIGN KEY (`id_dia_semana`) REFERENCES `dia_semana` (`id_dia_semana`),
  ADD CONSTRAINT `horario_medico_ibfk_3` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`),
  ADD CONSTRAINT `horario_medico_ibfk_4` FOREIGN KEY (`id_usuario_creador`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `horario_medico_ibfk_5` FOREIGN KEY (`id_usuario_modificador`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `fk_inventario_usuario_mod` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`);

--
-- Constraints for table `localidad`
--
ALTER TABLE `localidad`
  ADD CONSTRAINT `localidad_ibfk_1` FOREIGN KEY (`id_provincia`) REFERENCES `provincia` (`id_provincia`);

--
-- Constraints for table `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `fk_medicos_usuario_mod` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `medicos_ibfk_2` FOREIGN KEY (`id_especialidad`) REFERENCES `especialidad` (`id_especialidad`);

--
-- Constraints for table `medico_matricula`
--
ALTER TABLE `medico_matricula`
  ADD CONSTRAINT `medico_matricula_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`),
  ADD CONSTRAINT `medico_matricula_ibfk_2` FOREIGN KEY (`id_entidad`) REFERENCES `entidad_emisora` (`id_entidad`);

--
-- Constraints for table `medico_paciente`
--
ALTER TABLE `medico_paciente`
  ADD CONSTRAINT `medico_paciente_ibfk_1` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`),
  ADD CONSTRAINT `medico_paciente_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`);

--
-- Constraints for table `obra_social`
--
ALTER TABLE `obra_social`
  ADD CONSTRAINT `obra_social_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`);

--
-- Constraints for table `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `fk_pacientes_usuario_mod` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`);

--
-- Constraints for table `paciente_obra_social`
--
ALTER TABLE `paciente_obra_social`
  ADD CONSTRAINT `paciente_obra_social_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  ADD CONSTRAINT `paciente_obra_social_ibfk_2` FOREIGN KEY (`id_obra_social`) REFERENCES `obra_social` (`id_obra_social`);

--
-- Constraints for table `pago`
--
ALTER TABLE `pago`
  ADD CONSTRAINT `fk_pago_factura` FOREIGN KEY (`id_factura`) REFERENCES `Factura` (`id_factura`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pago_metodo` FOREIGN KEY (`id_metodo`) REFERENCES `metodo_pago` (`id_metodo`) ON UPDATE CASCADE;

--
-- Constraints for table `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`);

--
-- Constraints for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fk_proveedor_usuario_mod` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`id_direccion`) REFERENCES `direccion` (`id_direccion`);

--
-- Constraints for table `registro_turnos`
--
ALTER TABLE `registro_turnos`
  ADD CONSTRAINT `registro_turnos_ibfk_1` FOREIGN KEY (`id_turno`) REFERENCES `turno` (`id_turno`),
  ADD CONSTRAINT `registro_turnos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `resultado_analisis`
--
ALTER TABLE `resultado_analisis`
  ADD CONSTRAINT `fk_resultado_usuario_mod` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `resultado_analisis_ibfk_1` FOREIGN KEY (`id_analisis`) REFERENCES `analisis` (`id_analisis`),
  ADD CONSTRAINT `resultado_analisis_ibfk_2` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  ADD CONSTRAINT `resultado_analisis_ibfk_3` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`),
  ADD CONSTRAINT `resultado_analisis_ibfk_4` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `servicios`
--
ALTER TABLE `servicios`
  ADD CONSTRAINT `fk_servicios_usuario_mod` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `turno`
--
ALTER TABLE `turno`
  ADD CONSTRAINT `turno_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id_paciente`),
  ADD CONSTRAINT `turno_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id_medico`),
  ADD CONSTRAINT `turno_ibfk_3` FOREIGN KEY (`id_estado`) REFERENCES `estado_turno` (`id_estado`),
  ADD CONSTRAINT `turno_ibfk_4` FOREIGN KEY (`id_servicio`) REFERENCES `servicios` (`id_servicio`),
  ADD CONSTRAINT `turno_ibfk_5` FOREIGN KEY (`id_usuario_creacion`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `turno_ibfk_6` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `usuarios` (`id_usuario`);

--
-- Constraints for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_usuario_mod` FOREIGN KEY (`id_usuario_modificacion`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
