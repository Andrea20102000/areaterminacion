-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-09-2019 a las 00:16:23
-- Versión del servidor: 10.1.34-MariaDB
-- Versión de PHP: 7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `areaterminacion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cantidad`
--

CREATE TABLE `cantidad` (
  `idCantidad` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `idTalla` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16le;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL,
  `nombre` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16le;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `color`
--

CREATE TABLE `color` (
  `idColor` int(11) NOT NULL,
  `nomcolor` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16le;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entidades`
--

CREATE TABLE `entidades` (
  `idPedido` int(11) NOT NULL,
  `idFecha` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idReferencia` int(11) NOT NULL,
  `idColor` int(11) NOT NULL,
  `idTalla` int(11) NOT NULL,
  `idCantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16le;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `fecha`
--

CREATE TABLE `fecha` (
  `idFecha` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16le;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `referencia`
--

CREATE TABLE `referencia` (
  `idReferencia` int(11) NOT NULL,
  `nrorefe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16le;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `talla`
--

CREATE TABLE `talla` (
  `idTalla` int(11) NOT NULL,
  `talla` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16le;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cantidad`
--
ALTER TABLE `cantidad`
  ADD PRIMARY KEY (`idCantidad`),
  ADD KEY `idTalla` (`idTalla`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`idColor`);

--
-- Indices de la tabla `entidades`
--
ALTER TABLE `entidades`
  ADD PRIMARY KEY (`idPedido`),
  ADD KEY `idCantidad` (`idCantidad`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idColor` (`idColor`),
  ADD KEY `idFecha` (`idFecha`),
  ADD KEY `idReferencia` (`idReferencia`),
  ADD KEY `idTalla` (`idTalla`);

--
-- Indices de la tabla `fecha`
--
ALTER TABLE `fecha`
  ADD PRIMARY KEY (`idFecha`);

--
-- Indices de la tabla `referencia`
--
ALTER TABLE `referencia`
  ADD PRIMARY KEY (`idReferencia`);

--
-- Indices de la tabla `talla`
--
ALTER TABLE `talla`
  ADD PRIMARY KEY (`idTalla`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cantidad`
--
ALTER TABLE `cantidad`
  MODIFY `idCantidad` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `color`
--
ALTER TABLE `color`
  MODIFY `idColor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entidades`
--
ALTER TABLE `entidades`
  MODIFY `idPedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `fecha`
--
ALTER TABLE `fecha`
  MODIFY `idFecha` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `referencia`
--
ALTER TABLE `referencia`
  MODIFY `idReferencia` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `talla`
--
ALTER TABLE `talla`
  MODIFY `idTalla` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cantidad`
--
ALTER TABLE `cantidad`
  ADD CONSTRAINT `cantidad_ibfk_1` FOREIGN KEY (`idTalla`) REFERENCES `talla` (`idTalla`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `entidades`
--
ALTER TABLE `entidades`
  ADD CONSTRAINT `entidades_ibfk_1` FOREIGN KEY (`idCantidad`) REFERENCES `cantidad` (`idCantidad`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entidades_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entidades_ibfk_3` FOREIGN KEY (`idColor`) REFERENCES `color` (`idColor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entidades_ibfk_4` FOREIGN KEY (`idFecha`) REFERENCES `fecha` (`idFecha`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entidades_ibfk_5` FOREIGN KEY (`idReferencia`) REFERENCES `referencia` (`idReferencia`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `entidades_ibfk_6` FOREIGN KEY (`idTalla`) REFERENCES `talla` (`idTalla`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
