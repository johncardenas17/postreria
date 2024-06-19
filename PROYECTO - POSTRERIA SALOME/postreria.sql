-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-06-2024 a las 10:24:09
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `postreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_CLIENTE` int(11) NOT NULL,
  `NOMBRE` varchar(25) NOT NULL,
  `DIRECCION` varchar(25) DEFAULT NULL,
  `CIUDAD` varchar(25) DEFAULT NULL,
  `EMAIL` varchar(25) DEFAULT NULL,
  `TELEFONO` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle`
--

CREATE TABLE `detalle` (
  `id_PEDIDO` int(11) NOT NULL,
  `id_PRODUCTO` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `SUBTOTAL` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `id_EMPLEADO` int(11) NOT NULL,
  `NOMBRE` varchar(25) NOT NULL,
  `DIRECCION` varchar(25) DEFAULT NULL,
  `TELEFONO` varchar(25) DEFAULT NULL,
  `CARGO` varchar(25) DEFAULT NULL,
  `SALARIO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idINVENTARIO` int(11) NOT NULL,
  `idPRODUCTO` int(11) NOT NULL,
  `CANTIDAD` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id_PEDIDO` int(11) NOT NULL,
  `id_CLIENTE` int(11) NOT NULL,
  `id_EMPLEADO` int(11) NOT NULL,
  `FECHA` date DEFAULT NULL,
  `ESTADO` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id_PRODUCTO` int(11) NOT NULL,
  `NOMBRE` varchar(25) NOT NULL,
  `DESCRIPCION` tinytext DEFAULT NULL,
  `PRECIO` decimal(10,0) DEFAULT NULL,
  `STOCK` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_CLIENTE`),
  ADD UNIQUE KEY `idCLIENTE_UNIQUE` (`id_CLIENTE`);

--
-- Indices de la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`id_PEDIDO`),
  ADD UNIQUE KEY `id_PEDIDO_UNIQUE` (`id_PEDIDO`),
  ADD KEY `id_PRODUCTO_idx` (`id_PRODUCTO`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`id_EMPLEADO`),
  ADD UNIQUE KEY `id_EMPLEADO_UNIQUE` (`id_EMPLEADO`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idINVENTARIO`),
  ADD UNIQUE KEY `idINVENTARIO_UNIQUE` (`idINVENTARIO`),
  ADD KEY `idPRODUCTO_idx` (`idPRODUCTO`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_PEDIDO`),
  ADD UNIQUE KEY `id_PEDIDO_UNIQUE` (`id_PEDIDO`),
  ADD KEY `id_CLIENTE_idx` (`id_CLIENTE`),
  ADD KEY `id_EMPLEADO_idx` (`id_EMPLEADO`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_PRODUCTO`),
  ADD UNIQUE KEY `id_PRODUCTO_UNIQUE` (`id_PRODUCTO`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `id_PEDIDO` FOREIGN KEY (`id_PEDIDO`) REFERENCES `pedido` (`id_PEDIDO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_PRODUCTO` FOREIGN KEY (`id_PRODUCTO`) REFERENCES `producto` (`id_PRODUCTO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `id_CLIENTE` FOREIGN KEY (`id_CLIENTE`) REFERENCES `cliente` (`id_CLIENTE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_EMPLEADO` FOREIGN KEY (`id_EMPLEADO`) REFERENCES `empleado` (`id_EMPLEADO`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
