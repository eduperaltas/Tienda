-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-04-2020 a las 19:59:30
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `katanalite`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buy`
--

CREATE TABLE `buy` (
  `id` int(11) NOT NULL,
  `k` varchar(20) DEFAULT NULL,
  `code` varchar(20) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `paymethod_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buy_product`
--

CREATE TABLE `buy_product` (
  `id` int(11) NOT NULL,
  `buy_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `q` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `short_name` varchar(200) DEFAULT NULL,
  `in_home` tinyint(1) DEFAULT 0,
  `in_menu` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `category`
--

INSERT INTO `category` (`id`, `name`, `short_name`, `in_home`, `in_menu`, `is_active`) VALUES
(1, 'Basico', 'basico', 0, 0, 1),
(2, 'Celulares', 'Cel', 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuration`
--

CREATE TABLE `configuration` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `label` varchar(200) DEFAULT NULL,
  `kind` int(11) DEFAULT NULL,
  `val` text DEFAULT NULL,
  `cfg_id` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `configuration`
--

INSERT INTO `configuration` (`id`, `name`, `label`, `kind`, `val`, `cfg_id`) VALUES
(1, 'general_main_title', 'Titulo Principal', 1, 'KATANA LITE', 1),
(2, 'general_main_email', 'Email Principal', 1, 'tuemail@tudominio.com', 1),
(3, 'general_country', 'Pais', 1, 'MX', 1),
(4, 'general_coin', 'Moneda', 1, '$', 1),
(5, 'general_iva_txt', 'Impuesto Texto', 1, 'I.V.A', 1),
(6, 'general_iva', 'Impuesto IVA (%)', 2, '16', 1),
(7, 'general_img_default', 'Imagen Default', 1, 'res/img/default.png', 1),
(8, 'bank_titular', 'Titular de la cuenta', 1, '', 1),
(9, 'bank_name', 'Nombre del Banco', 1, '', 1),
(10, 'bank_account', 'Numero de Cuenta', 1, '', 1),
(11, 'bank_card', 'Numero de Tarjeta', 1, '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `country`
--

CREATE TABLE `country` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `country`
--

INSERT INTO `country` (`id`, `name`) VALUES
(1, 'Argentina'),
(2, 'Chile'),
(3, 'Colombia'),
(4, 'España'),
(5, 'Mexico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `coupon`
--

CREATE TABLE `coupon` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `val` double DEFAULT NULL,
  `kind` int(11) DEFAULT 1,
  `is_multiple` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `start_at` date DEFAULT NULL,
  `finish_at` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paymethod`
--

CREATE TABLE `paymethod` (
  `id` int(11) NOT NULL,
  `short_name` varchar(100) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `paymethod`
--

INSERT INTO `paymethod` (`id`, `short_name`, `name`, `is_active`) VALUES
(1, 'bank', 'Deposito Bancario', 0),
(2, 'deliver', 'Pago Contra entrega', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `short_name` varchar(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `code` varchar(200) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `offer_txt` varchar(1000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `Image2` varchar(255) DEFAULT NULL,
  `Image3` varchar(255) DEFAULT NULL,
  `Image4` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT 0,
  `is_public` tinyint(1) DEFAULT 0,
  `in_existence` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL,
  `order_at` datetime DEFAULT NULL,
  `price` float DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_view`
--

CREATE TABLE `product_view` (
  `id` int(11) NOT NULL,
  `viewer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `realip` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT 0,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(1, 'Pendiente'),
(2, 'Pagado'),
(3, 'Cancelado'),
(4, 'Enviado'),
(5, 'Finalizado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unit`
--

CREATE TABLE `unit` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `unit`
--

INSERT INTO `unit` (`id`, `name`) VALUES
(1, 'Pieza'),
(2, 'Kit'),
(3, 'Juego'),
(4, 'Caja');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_admin` tinyint(1) DEFAULT 0,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `lastname`, `username`, `email`, `password`, `is_active`, `is_admin`, `created_at`) VALUES
(1, 'Admin', '', 'admin', '', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', 1, 1, '2020-04-29 12:43:59');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paymethod_id` (`paymethod_id`),
  ADD KEY `coupon_id` (`coupon_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indices de la tabla `buy_product`
--
ALTER TABLE `buy_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `buy_id` (`buy_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `configuration`
--
ALTER TABLE `configuration`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `paymethod`
--
ALTER TABLE `paymethod`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unit_id` (`unit_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indices de la tabla `product_view`
--
ALTER TABLE `product_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `viewer_id` (`viewer_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `unit`
--
ALTER TABLE `unit`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `buy`
--
ALTER TABLE `buy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `buy_product`
--
ALTER TABLE `buy_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `configuration`
--
ALTER TABLE `configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `country`
--
ALTER TABLE `country`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `paymethod`
--
ALTER TABLE `paymethod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `product_view`
--
ALTER TABLE `product_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `unit`
--
ALTER TABLE `unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `buy`
--
ALTER TABLE `buy`
  ADD CONSTRAINT `buy_ibfk_1` FOREIGN KEY (`paymethod_id`) REFERENCES `paymethod` (`id`),
  ADD CONSTRAINT `buy_ibfk_2` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`),
  ADD CONSTRAINT `buy_ibfk_3` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `buy_ibfk_4` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`);

--
-- Filtros para la tabla `buy_product`
--
ALTER TABLE `buy_product`
  ADD CONSTRAINT `buy_product_ibfk_1` FOREIGN KEY (`buy_id`) REFERENCES `buy` (`id`),
  ADD CONSTRAINT `buy_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Filtros para la tabla `coupon`
--
ALTER TABLE `coupon`
  ADD CONSTRAINT `coupon_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `unit` (`id`),
  ADD CONSTRAINT `product_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Filtros para la tabla `product_view`
--
ALTER TABLE `product_view`
  ADD CONSTRAINT `product_view_ibfk_1` FOREIGN KEY (`viewer_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `product_view_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
