-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-11-2024 a las 02:01:13
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `id` smallint(4) UNSIGNED NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `fechanacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`id`, `apellidos`, `nombres`, `fechanacimiento`) VALUES
(1, 'Vallejo Mendoza', 'César Abraham', '1892-03-16'),
(2, 'Vargas Llosa', 'Jorge Mario Pedro', '1936-03-28'),
(3, 'Alegría Bazán', 'Ciro', '1909-11-04'),
(4, 'García Márquez', 'Gabriel José de la Concordia', '1927-03-06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `uuid` char(36) NOT NULL,
  `libro_isbn` char(12) NOT NULL,
  `usuario_id` smallint(3) UNSIGNED NOT NULL,
  `fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`uuid`, `libro_isbn`, `usuario_id`, `fecha`) VALUES
('1373c6a9-a46c-11ef-a557-68f728c96ef2', '480129403571', 2, '2024-11-16 17:42:35'),
('5f9c5b22-a47e-11ef-a557-68f728c96ef2', '383370912281', 6, '2024-11-16 19:53:33'),
('5fa6730d-a462-11ef-a557-68f728c96ef2', '238874100138', 2, '2024-11-16 16:33:08'),
('70d677e8-a462-11ef-a557-68f728c96ef2', '480129403571', 2, '2024-11-16 16:33:36'),
('730f8ebc-a46a-11ef-a557-68f728c96ef2', '930281938211', 2, '2024-11-16 17:30:56'),
('74ef4030-a465-11ef-a557-68f728c96ef2', '483240184226', 3, '2024-11-16 16:55:12'),
('b7fd37f8-a465-11ef-a557-68f728c96ef2', '892014771852', 3, '2024-11-16 16:57:04'),
('c006f327-a466-11ef-a557-68f728c96ef2', '483240184226', 3, '2024-11-16 17:04:27');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `isbn` char(12) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `autor_id` smallint(4) UNSIGNED NOT NULL,
  `anoedicion` year(4) NOT NULL,
  `precio` decimal(3,0) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`isbn`, `titulo`, `autor_id`, `anoedicion`, `precio`) VALUES
('238874100138', 'Conversación en La Catedral', 2, '1951', 70),
('383370912281', 'El mundo es ancho y ajeno', 3, '1941', 65),
('480129403571', 'La ciudad y los perros', 2, '1963', 81),
('483240184226', 'La serpiente de oro', 3, '1935', 85),
('589120131047', 'Los perros hambrientos', 3, '1939', 31),
('591338770183', 'Paco Yunque', 1, '1951', 55),
('661984010128', 'El general en su laberinto', 4, '1989', 110),
('683425019133', 'El coronel no tiene quien le escriba', 4, '1961', 42),
('762841019387', 'Cien años de soledad', 4, '1967', 75),
('890366138239', 'La fiesta del Chivo', 2, '2000', 30),
('892014771852', 'Poemas humanos', 1, '1939', 120),
('930281938211', 'El amor en los tiempos del cólera', 4, '1985', 38),
('978318472263', 'Los heraldos negros', 1, '1919', 48),
('981402938251', 'La casa verde', 2, '1966', 105);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipousuario`
--

CREATE TABLE `tipousuario` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tipousuario`
--

INSERT INTO `tipousuario` (`id`, `nombre`) VALUES
(1, 'Administrados'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` smallint(3) UNSIGNED NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` char(200) NOT NULL,
  `tipousuario_id` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `usuario`, `password`, `tipousuario_id`) VALUES
(1, 'ADMIN', 'scrypt:32768:8:1$29OCblawTh4qNlsb$a601161ac83d609b8a895534de1b190bf48e6338bce27ca4a41c602a943c2a8ad23acd11a832b73651f42f111eb64dafa472fdc8ccb9f9a31386493f428da73e', 1),
(2, 'RAFAEL', 'scrypt:32768:8:1$29OCblawTh4qNlsb$a601161ac83d609b8a895534de1b190bf48e6338bce27ca4a41c602a943c2a8ad23acd11a832b73651f42f111eb64dafa472fdc8ccb9f9a31386493f428da73e', 2),
(3, 'MARIA', 'scrypt:32768:8:1$29OCblawTh4qNlsb$a601161ac83d609b8a895534de1b190bf48e6338bce27ca4a41c602a943c2a8ad23acd11a832b73651f42f111eb64dafa472fdc8ccb9f9a31386493f428da73e', 2),
(6, 'JOSE', 'pbkdf2:sha256:1000000$PGVN7AIEBVSdp6dH$8a632b95233dc56c035dba7a82477995314b99cde6de3662e711191f2593e8d7', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`uuid`),
  ADD KEY `FK_compra_libro` (`libro_isbn`),
  ADD KEY `FK_compra_usuario` (`usuario_id`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`isbn`),
  ADD KEY `FK_libro_autor` (`autor_id`);

--
-- Indices de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_usuario_tipousuario` (`tipousuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipousuario`
--
ALTER TABLE `tipousuario`
  MODIFY `id` tinyint(1) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` smallint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `FK_compra_libro` FOREIGN KEY (`libro_isbn`) REFERENCES `libro` (`isbn`),
  ADD CONSTRAINT `FK_compra_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `libro`
--
ALTER TABLE `libro`
  ADD CONSTRAINT `FK_libro_autor` FOREIGN KEY (`autor_id`) REFERENCES `autor` (`id`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `FK_usuario_tipousuario` FOREIGN KEY (`tipousuario_id`) REFERENCES `tipousuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
