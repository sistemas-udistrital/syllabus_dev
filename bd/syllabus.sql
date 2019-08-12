-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 11, 2019 at 09:05 PM
-- Server version: 10.4.7-MariaDB-1:10.4.7+maria~bionic-log
-- PHP Version: 7.2.19-0ubuntu0.19.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `syllabusdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `capitulo_academico`
--

CREATE TABLE `capitulo_academico` (
  `id` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `docente`
--

CREATE TABLE `docente` (
  `doc_id` int(11) NOT NULL,
  `doc_nombre` varchar(50) NOT NULL,
  `doc_apellido` varchar(50) NOT NULL,
  `doc_email` varchar(100) DEFAULT NULL,
  `doc_documento` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `docente`
--

INSERT INTO `docente` (`doc_id`, `doc_nombre`, `doc_apellido`, `doc_email`, `doc_documento`) VALUES
(1, 'Alejandro Paolo', 'Daza Corredor', 'apdazac@udistrital.edu.co', '79777053'),
(2, 'Lilia Marcela', 'Espinosa Rodríguez', 'marcespinosa@gmail.com', '39763179');

-- --------------------------------------------------------

--
-- Table structure for table `espacio_academico`
--

CREATE TABLE `espacio_academico` (
  `esa_id` int(11) NOT NULL,
  `esa_nombre` varchar(150) DEFAULT NULL,
  `esa_codigo` varchar(10) DEFAULT NULL,
  `prc_id` int(11) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `espacio_academico`
--

INSERT INTO `espacio_academico` (`esa_id`, `esa_nombre`, `esa_codigo`, `prc_id`, `doc_id`) VALUES
(1, 'Modelos de programación 1', '416', 1, NULL),
(2, 'Modelos de programación 2', '422', 1, NULL),
(3, 'Programación orientada a objetos', '10', 1, NULL),
(4, 'Programación básica', '6', 1, NULL),
(5, 'Programación avanzada', '16', 1, NULL),
(6, 'matematicas', '2', 1, NULL),
(7, 'Ciencias de la computación 3', '496', 1, NULL),
(8, 'Ciencias de la computación 2', '499', 1, 1),
(9, 'Ciencias de la computación 1', '400', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `espacio_academico_tipo`
--

CREATE TABLE `espacio_academico_tipo` (
  `eat_id` int(11) NOT NULL,
  `esa_id` int(11) DEFAULT NULL,
  `tea_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `proyecto_curricular`
--

CREATE TABLE `proyecto_curricular` (
  `prc_id` int(11) NOT NULL,
  `prc_nombre` varchar(50) NOT NULL,
  `prc_codigo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `proyecto_curricular`
--

INSERT INTO `proyecto_curricular` (`prc_id`, `prc_nombre`, `prc_codigo`) VALUES
(1, 'Ingeniería de Sistemas', '0091'),
(2, 'Ingeniería Electrónica', '0092'),
(3, 'Ingeniería Industrial', '0093');

-- --------------------------------------------------------

--
-- Table structure for table `tipo_espacio_academico`
--

CREATE TABLE `tipo_espacio_academico` (
  `tea_id` int(11) NOT NULL,
  `tea_nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `unidad_academica`
--

CREATE TABLE `unidad_academica` (
  `una_id` int(11) NOT NULL,
  `una_id_padre` int(11) DEFAULT NULL,
  `una_nombre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `capitulo_academico`
--
ALTER TABLE `capitulo_academico`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`doc_id`);

--
-- Indexes for table `espacio_academico`
--
ALTER TABLE `espacio_academico`
  ADD PRIMARY KEY (`esa_id`),
  ADD KEY `fk_proyecto_curricular` (`prc_id`),
  ADD KEY `fk_docente` (`doc_id`);

--
-- Indexes for table `espacio_academico_tipo`
--
ALTER TABLE `espacio_academico_tipo`
  ADD PRIMARY KEY (`eat_id`),
  ADD KEY `fk_espacio_academico` (`esa_id`),
  ADD KEY `fk_tipo_espacio_academico` (`tea_id`);

--
-- Indexes for table `proyecto_curricular`
--
ALTER TABLE `proyecto_curricular`
  ADD PRIMARY KEY (`prc_id`);

--
-- Indexes for table `tipo_espacio_academico`
--
ALTER TABLE `tipo_espacio_academico`
  ADD PRIMARY KEY (`tea_id`);

--
-- Indexes for table `unidad_academica`
--
ALTER TABLE `unidad_academica`
  ADD PRIMARY KEY (`una_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `capitulo_academico`
--
ALTER TABLE `capitulo_academico`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `docente`
--
ALTER TABLE `docente`
  MODIFY `doc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `espacio_academico`
--
ALTER TABLE `espacio_academico`
  MODIFY `esa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `espacio_academico_tipo`
--
ALTER TABLE `espacio_academico_tipo`
  MODIFY `eat_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `proyecto_curricular`
--
ALTER TABLE `proyecto_curricular`
  MODIFY `prc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tipo_espacio_academico`
--
ALTER TABLE `tipo_espacio_academico`
  MODIFY `tea_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unidad_academica`
--
ALTER TABLE `unidad_academica`
  MODIFY `una_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `espacio_academico`
--
ALTER TABLE `espacio_academico`
  ADD CONSTRAINT `fk_docente` FOREIGN KEY (`doc_id`) REFERENCES `docente` (`doc_id`),
  ADD CONSTRAINT `fk_proyecto_curricular` FOREIGN KEY (`prc_id`) REFERENCES `proyecto_curricular` (`prc_id`);

--
-- Constraints for table `espacio_academico_tipo`
--
ALTER TABLE `espacio_academico_tipo`
  ADD CONSTRAINT `fk_espacio_academico` FOREIGN KEY (`esa_id`) REFERENCES `espacio_academico` (`esa_id`),
  ADD CONSTRAINT `fk_tipo_espacio_academico` FOREIGN KEY (`tea_id`) REFERENCES `tipo_espacio_academico` (`tea_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
