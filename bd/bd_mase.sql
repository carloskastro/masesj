-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-04-2022 a las 21:19:45
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mase`
--
CREATE DATABASE IF NOT EXISTS `mase` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `mase`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `idadministrador` int(20) NOT NULL,
  `cedula` int(10) NOT NULL,
  `nombre` varchar(35) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(35) COLLATE utf8_spanish2_ci NOT NULL,
  `tipouser` varchar(10) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'admin',
  `user` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `pass` varchar(60) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aprendiz`
--

CREATE TABLE `aprendiz` (
  `idaprendiz` int(11) NOT NULL,
  `nombre` varchar(35) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(35) COLLATE utf8_spanish2_ci NOT NULL,
  `tipodoc` char(2) COLLATE utf8_spanish2_ci NOT NULL,
  `documento` int(10) NOT NULL,
  `tipouser` varchar(10) COLLATE utf8_spanish2_ci NOT NULL DEFAULT 'aprendiz',
  `user` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `pass` varchar(60) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fichamat`
--

CREATE TABLE `fichamat` (
  `idfichamat` int(11) NOT NULL,
  `programa_idprograma` int(11) NOT NULL,
  `aprendiz_idaprendiz` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `apellido` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` date NOT NULL,
  `lugarexpedoc` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `fechaexpe` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `fechanac` date NOT NULL,
  `lugarnac` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `sexo` varchar(1) COLLATE utf8_spanish2_ci NOT NULL,
  `libretamilitar` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `tiposangre` varchar(4) COLLATE utf8_spanish2_ci NOT NULL,
  `estadocivil` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `eps` varchar(2) COLLATE utf8_spanish2_ci NOT NULL,
  `nombreeps` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `departamento` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `municipio` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `direccion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `barriovereda` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `tiporesidencia` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `celular` int(10) NOT NULL,
  `estrato` int(1) NOT NULL,
  `tipopoblacion` varchar(45) COLLATE utf8_spanish2_ci NOT NULL,
  `hechosvictimizantes` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa`
--

CREATE TABLE `programa` (
  `idprograma` int(11) NOT NULL,
  `nombre` varchar(60) COLLATE utf8_spanish2_ci NOT NULL,
  `tipo` varchar(45) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`idadministrador`),
  ADD UNIQUE KEY `cedulaadministrador_UNIQUE` (`cedula`),
  ADD UNIQUE KEY `useradministrador_UNIQUE` (`user`);

--
-- Indices de la tabla `aprendiz`
--
ALTER TABLE `aprendiz`
  ADD PRIMARY KEY (`idaprendiz`);

--
-- Indices de la tabla `fichamat`
--
ALTER TABLE `fichamat`
  ADD PRIMARY KEY (`idfichamat`),
  ADD KEY `fk_fichamat_programa_idx` (`programa_idprograma`),
  ADD KEY `fk_fichamat_aprendiz1_idx` (`aprendiz_idaprendiz`);

--
-- Indices de la tabla `programa`
--
ALTER TABLE `programa`
  ADD PRIMARY KEY (`idprograma`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `fichamat`
--
ALTER TABLE `fichamat`
  MODIFY `idfichamat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programa`
--
ALTER TABLE `programa`
  MODIFY `idprograma` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `fichamat`
--
ALTER TABLE `fichamat`
  ADD CONSTRAINT `fk_fichamat_aprendiz1` FOREIGN KEY (`aprendiz_idaprendiz`) REFERENCES `aprendiz` (`idaprendiz`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fichamat_programa` FOREIGN KEY (`programa_idprograma`) REFERENCES `programa` (`idprograma`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
