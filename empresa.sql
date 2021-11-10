-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2021 a las 03:23:08
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `idCliente` int(11) NOT NULL,
  `Nombres` varchar(60) DEFAULT NULL,
  `Apellidos` varchar(60) DEFAULT NULL,
  `NIT` varchar(12) DEFAULT NULL,
  `Genero` bit(1) DEFAULT NULL,
  `Telefono` varchar(25) DEFAULT NULL,
  `Correo_electronico` varchar(45) DEFAULT NULL,
  `Fechaingreso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`idCliente`, `Nombres`, `Apellidos`, `NIT`, `Genero`, `Telefono`, `Correo_electronico`, `Fechaingreso`) VALUES
(5, 'Tony', 'Stark', '0301', b'0', '56194604', 'tony@gmail.com', '2021-10-21 12:00:00'),
(6, 'Steve', 'Rogers', '0201', b'0', '2222', 'america@gmail.com', '2021-10-20 01:00:00'),
(11, 'Clarck', 'Kent', '12345678', b'0', '3333', 'superman@gmail.com', '2021-10-23 21:23:37');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idCompra` int(11) NOT NULL,
  `No_orden_compra` int(11) DEFAULT NULL,
  `idProveedor` int(11) DEFAULT NULL,
  `Fecha_orden` date DEFAULT NULL,
  `Fechaingreso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idCompra`, `No_orden_compra`, `idProveedor`, `Fecha_orden`, `Fechaingreso`) VALUES
(18, 1, 1, '2022-11-22', '2022-10-14 09:34:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras_detalle`
--

CREATE TABLE `compras_detalle` (
  `idCompra_detalle` bigint(20) NOT NULL,
  `idCompra` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_costo_unitario` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `compras_detalle`
--

INSERT INTO `compras_detalle` (`idCompra_detalle`, `idCompra`, `idProducto`, `Cantidad`, `Precio_costo_unitario`) VALUES
(9, 1, 10, 22, '100.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `idEmpleado` int(11) NOT NULL,
  `Nombres` varchar(60) DEFAULT NULL,
  `Apellidos` varchar(60) DEFAULT NULL,
  `Direccion` varchar(80) DEFAULT NULL,
  `Telefono` varchar(25) DEFAULT NULL,
  `DPI` varchar(15) DEFAULT NULL,
  `Genero` bit(1) DEFAULT NULL,
  `Fecha_nacimiento` date DEFAULT NULL,
  `idPuesto` smallint(6) DEFAULT NULL,
  `Fecha_inicio_labores` date DEFAULT NULL,
  `Fechaingreso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`idEmpleado`, `Nombres`, `Apellidos`, `Direccion`, `Telefono`, `DPI`, `Genero`, `Fecha_nacimiento`, `idPuesto`, `Fecha_inicio_labores`, `Fechaingreso`) VALUES
(1, 'JORGE', 'MUNOZ', 'Antigua Guatemala', '12345678', '987654321', b'0', '1998-10-12', 1, '2018-01-01', '2021-10-19 23:31:59'),
(26, 'Tony', 'Parker', 'New York', '4567877', 'E002', NULL, '2021-10-21', 1, NULL, NULL),
(28, 'Peter', 'Parker', 'New York', '4567877', 'E002', NULL, '2021-10-30', 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `idMarca` smallint(6) NOT NULL,
  `Marca` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`idMarca`, `Marca`) VALUES
(1, 'Huawei'),
(3, 'HP'),
(9, 'Apple');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id_menu` smallint(6) NOT NULL,
  `contenido` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `roles` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id_menu`, `contenido`, `roles`) VALUES
(1, 'puestos', 1),
(2, 'empleados', 1),
(3, 'clientes', 1),
(4, 'proveedores', 1),
(5, 'marcas', 1),
(6, 'productos', 1),
(7, 'ventas', 1),
(8, 'compras', 1),
(9, 'reporte-Clientes', 1),
(10, 'reporte-Proveedores', 1),
(11, 'reporte-Ventas', 1),
(12, 'reporte-Compras', 1),
(13, 'reporte-Productos', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `idProducto` int(11) NOT NULL,
  `Producto` varchar(50) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `idMarca` int(11) DEFAULT NULL,
  `Descripcion` varchar(100) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Imagen` varchar(250) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Precio_costo` int(11) DEFAULT NULL,
  `Precio_venta` int(11) DEFAULT NULL,
  `Existencia` int(11) DEFAULT NULL,
  `Fecha_ingreso` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`idProducto`, `Producto`, `idMarca`, `Descripcion`, `Imagen`, `Precio_costo`, `Precio_venta`, `Existencia`, `Fecha_ingreso`) VALUES
(1, 'Laptop', 1, 'nuevos', 'https://images.unsplash.com/photo-1561154464-82e9adf32764?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDV8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60', 100, 200, 1, '2021-10-20'),
(2, 'Ipad', 9, ' 20 pulgadas', 'https://images.unsplash.com/photo-1548874468-025d0edfdf8b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDZ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60', 150, 250, 0, '2021-10-21'),
(5, 'Tablet', 10, 'mi9', 'https://images.unsplash.com/photo-1548874468-025d0edfdf8b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1yZWxhdGVkfDZ8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60', 300, 400, 0, '2021-10-21'),
(10, 'Pantalla', 1, 'LED', 'https://images.unsplash.com/photo-1617122287896-8638ac5c5414?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHBhbnRhbGxhfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60', 1, 2, 0, '2021-10-21');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `idProveedor` int(11) NOT NULL,
  `Proveedor` varchar(60) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `NIT` varchar(12) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Direccion` varchar(80) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `Telefono` varchar(25) COLLATE utf8_spanish2_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`idProveedor`, `Proveedor`, `NIT`, `Direccion`, `Telefono`) VALUES
(1, 'PAIZ', '11', 'JOCOTENANGO', '111'),
(4, 'LA TORRRE', '543566', 'GUATEMALA', '45657689');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puestos`
--

CREATE TABLE `puestos` (
  `idPuesto` smallint(6) NOT NULL,
  `puesto` varchar(11) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `puestos`
--

INSERT INTO `puestos` (`idPuesto`, `puesto`) VALUES
(1, 'PROGRAMADOR'),
(2, 'JEFE'),
(4, 'AVENGER'),
(6, 'SECRETARIA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuarios` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `contra` varchar(45) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `rol` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idUsuarios`, `nombre`, `contra`, `rol`) VALUES
(1, 'admin', 'admin', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `idVenta` int(11) NOT NULL,
  `Nofactura` int(11) NOT NULL,
  `Serie` char(1) COLLATE utf8_spanish2_ci NOT NULL,
  `Fechafactura` date NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `Fechaingreso` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`idVenta`, `Nofactura`, `Serie`, `Fechafactura`, `idCliente`, `idEmpleado`, `Fechaingreso`) VALUES
(1, 1, 'A', '2021-10-21', 5, 1, '2021-10-23 01:55:20'),
(16, 4, 'C', '2021-10-23', 11, 28, '2021-10-20 03:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas_detalle`
--

CREATE TABLE `ventas_detalle` (
  `idVenta_detalle` bigint(20) NOT NULL,
  `idVenta` int(11) DEFAULT NULL,
  `idProducto` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio_unitario` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `ventas_detalle`
--

INSERT INTO `ventas_detalle` (`idVenta_detalle`, `idVenta`, `idProducto`, `Cantidad`, `Precio_unitario`) VALUES
(1, 1, 1, 1, '111.00'),
(16, 4, 5, 3, '300.00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`idCliente`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idCompra`),
  ADD KEY `idProveedor_idx` (`idProveedor`);

--
-- Indices de la tabla `compras_detalle`
--
ALTER TABLE `compras_detalle`
  ADD PRIMARY KEY (`idCompra_detalle`),
  ADD KEY `idProducto_idx` (`idProducto`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idPuesto_idx` (`idPuesto`);

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`idMarca`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProducto`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `puestos`
--
ALTER TABLE `puestos`
  ADD PRIMARY KEY (`idPuesto`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuarios`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `idEmpleado_idx` (`idEmpleado`),
  ADD KEY `idCliente_idx` (`idCliente`);

--
-- Indices de la tabla `ventas_detalle`
--
ALTER TABLE `ventas_detalle`
  ADD PRIMARY KEY (`idVenta_detalle`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `idCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `compras_detalle`
--
ALTER TABLE `compras_detalle`
  MODIFY `idCompra_detalle` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `idEmpleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `idMarca` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id_menu` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `idProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `idProveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `puestos`
--
ALTER TABLE `puestos`
  MODIFY `idPuesto` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuarios` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `ventas_detalle`
--
ALTER TABLE `ventas_detalle`
  MODIFY `idVenta_detalle` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `idProveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `idCliente` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`idCliente`),
  ADD CONSTRAINT `idEmpleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleados` (`idEmpleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
