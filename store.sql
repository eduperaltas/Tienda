-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-05-2020 a las 04:28:08
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
-- Base de datos: `store`
--
CREATE DATABASE IF NOT EXISTS `store` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `store`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buy`
--

DROP TABLE IF EXISTS `buy`;
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

--
-- Volcado de datos para la tabla `buy`
--

INSERT INTO `buy` (`id`, `k`, `code`, `client_id`, `coupon_id`, `status_id`, `created_at`, `paymethod_id`) VALUES
(1, 'qFZ8tUD9xpw', '5iA1G-GyDFj', 1, NULL, 3, '2020-04-29 15:19:44', 1),
(2, 'OPaLbyHjfJ_', 'Qyv7NjkG3vx', 1, NULL, 5, '2020-04-29 20:45:49', 1),
(3, 'n1qifhJS-9K', 'rPesZ_s15QG', 1, NULL, 5, '2020-04-30 20:06:00', 1),
(4, 'ZTG2633Tns4', '6m8OQsfdcZa', 1, NULL, 3, '2020-04-30 20:09:12', 1),
(5, 'jepbmhawL_3', 'bRVo86VseP0', 1, NULL, 5, '2020-04-30 20:13:06', 1),
(6, 'si_ABJEfpR2', 'L95yt8_1n9L', 1, NULL, 3, '2020-04-30 20:15:38', 1),
(7, 'FztetiwUDFt', 'NKHWh1I7H2U', 1, NULL, 5, '2020-04-30 20:18:04', 1),
(8, 'WPcoF_h_6VA', 'GIKNs_VHHvb', 1, NULL, 5, '2020-04-30 20:31:45', 1),
(9, 'bWlQASnRb6e', 'DMTCSue2uJT', 1, NULL, 5, '2020-04-30 23:02:37', 1),
(10, 'pwb3Kbl9rKF', 'Ttu-gOyoUvU', 1, NULL, 5, '2020-04-30 23:13:38', 1),
(11, 'jHbdUz4WTb7', 'gEM_ohFV0Hz', 1, NULL, 1, '2020-05-01 15:50:17', 2),
(12, 'qmbQSA0xa8b', '79SZE2_6D_L', 1, NULL, 5, '2020-05-01 16:03:31', 2),
(13, 'fh_Qh-InrOz', 'NQt4cEWrJBE', 4, NULL, 1, '2020-05-01 21:18:48', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `buy_product`
--

DROP TABLE IF EXISTS `buy_product`;
CREATE TABLE `buy_product` (
  `id` int(11) NOT NULL,
  `buy_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `q` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `buy_product`
--

INSERT INTO `buy_product` (`id`, `buy_id`, `product_id`, `q`) VALUES
(1, 1, 16, 1),
(2, 1, 17, 1),
(3, 1, 5, 1),
(4, 2, 7, 2),
(5, 3, 17, 1),
(6, 4, 7, 1),
(7, 5, 7, 1),
(8, 6, 7, 1),
(9, 7, 5, 1),
(10, 8, 7, 1),
(11, 9, 7, 10),
(12, 10, 5, 1),
(13, 11, 11, 1),
(14, 11, 17, 1),
(16, 13, 5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `category`
--

DROP TABLE IF EXISTS `category`;
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

DROP TABLE IF EXISTS `client`;
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

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`id`, `name`, `lastname`, `email`, `phone`, `address`, `password`, `is_active`, `created_at`) VALUES
(1, 'eduardo', 'peralta', 'eduperaltas@gmail.com', '', '', 'ab0ef57f283c0839c6352e673ecef0977e3176a0', 1, '2020-04-29 15:18:08'),
(2, 'alan', 'user', 'user@gmail.com', '', '', 'ab0ef57f283c0839c6352e673ecef0977e3176a0', 1, '2020-05-01 15:51:07'),
(3, 'otra', 'cuenta', 'otracueta@gmail.com', '', '', 'ab0ef57f283c0839c6352e673ecef0977e3176a0', 1, '2020-05-01 21:17:17'),
(4, 'nuevo', 'hola', 'nuevo@gmail.com', '', '', '60a67b9a2c5fd83a2b99ec4af3b1f6064abe3ba7', 1, '2020-05-01 21:18:09'),
(5, 'pruebaTD', 'tedi', 'alala@gmail.com', '951597854', 'av.higuereta 139', 'ab0ef57f283c0839c6352e673ecef0977e3176a0', 1, '2020-05-01 21:41:06');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuration`
--

DROP TABLE IF EXISTS `configuration`;
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
(1, 'general_main_title', 'Titulo Principal', 1, 'STORE LITE', 1),
(2, 'general_main_email', 'Email Principal', 1, 'tuemail@tudominio.com', 1),
(3, 'general_country', 'Pais', 1, 'PE', 1),
(4, 'general_coin', 'Moneda', 1, 'S/.', 1),
(5, 'general_iva_txt', 'Impuesto Texto', 1, 'I.G.V.', 1),
(6, 'general_iva', 'Impuesto IVA (%)', 2, '18', 1),
(7, 'general_img_default', 'Imagen Default', 1, 'res/img/default.png', 1),
(8, 'bank_titular', 'Titular de la cuenta', 1, 'eduardo peralta', 1),
(9, 'bank_name', 'Nombre del Banco', 1, 'BCP', 1),
(10, 'bank_account', 'Numero de Cuenta', 1, '10102125452102', 1),
(11, 'bank_card', 'Numero de Tarjeta', 1, '1412445874', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `country`
--

DROP TABLE IF EXISTS `country`;
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

DROP TABLE IF EXISTS `coupon`;
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

DROP TABLE IF EXISTS `paymethod`;
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
(1, 'bank', 'Deposito Bancario', 1),
(2, 'deliver', 'Pago Contra entrega', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

DROP TABLE IF EXISTS `product`;
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
  `video` varchar(255) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `is_featured` tinyint(1) DEFAULT 0,
  `is_public` tinyint(1) DEFAULT 0,
  `in_existence` tinyint(1) DEFAULT 0,
  `Stock` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `order_at` datetime DEFAULT NULL,
  `price` float DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `meta_title` varchar(100) DEFAULT NULL,
  `meta_description` varchar(255) DEFAULT NULL,
  `meta_keywords` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `short_name`, `name`, `code`, `description`, `offer_txt`, `image`, `Image2`, `Image3`, `Image4`, `video`, `link`, `is_featured`, `is_public`, `in_existence`, `Stock`, `created_at`, `order_at`, `price`, `category_id`, `unit_id`, `meta_title`, `meta_description`, `meta_keywords`) VALUES
(5, 'IUwouO_NbWk', 'Google Pixel 4', 'TGP4202029', 'vabd asb dasb djasb d basdasdn   bbbb b bb b bn', NULL, 'google-pixel-4-xl-en-negro-de-64gb_1_4.jpg', '', '', '', '_yy4lO0h2OY', '', 1, 1, 1, 5, '2020-04-29 13:13:35', NULL, 1499, 2, 1, NULL, NULL, NULL),
(7, 'qSoE6wBvAzP', 'Iphone 11 PRO', 'TIPH11202004', 'asdasdasd asd asd as as a asd ', NULL, 'Captura_de_Pantalla_2019-10-24_a_la_s_18.11.17_45599abb-79c6-4fc5-b801-a01fc50701b8_8.png', '1568121499_490816_1568143364_sumario_normal.jpg', 'c562eadf58dccf8ee15e4ecac2d4da74.jpg', '', 'cVEemOmHw9Y', '', 1, 1, 1, 2, '2020-04-29 13:15:27', NULL, 5899, 2, 1, NULL, NULL, NULL),
(8, 'sQhDh3mAHWO', 'Xiaomi MI10', 'TXM10202004', 'hgug agh aj sac sc a sasc ', NULL, 'mi10pc_2.png', '', '', '', '', '', 1, 1, 1, NULL, '2020-04-29 13:16:00', NULL, 2199, 2, 1, NULL, NULL, NULL),
(9, '7efDO19qj3x', 'Huawei P40', 'THP40202004', 'b hjvxj cx  sdcs dcs dc sd csdcs', NULL, 'huawei-p40-pro-plus-5g_4.png', '', '', '', '', '', 1, 1, 1, NULL, '2020-04-29 13:16:38', NULL, 2199, 2, 1, NULL, NULL, NULL),
(10, '_9v06wLpoD7', 'Iphone 11', 'IPH11202004', 'ghjsabjhabjasb jbhbdab b asdb hjab dads ', NULL, 'iphone11_15.jpg', '', '', '', '', '', 1, 1, 1, NULL, '2020-04-29 13:17:08', NULL, 2399, 2, 1, NULL, NULL, NULL),
(11, '_p9hjTacb03', 'IPHONE XR', 'TIPH10R202004', 'bhjvhj hjv hjvjgv hjv ', NULL, 'iphone-xr-64gb-apple-libre-colores-tienda-garantia-D_NQ_NP_776758-MPE31422683494_072019-F_5.jpg', '', '', '', '', '', 1, 1, 1, 15, '2020-04-29 13:17:49', NULL, 1999, 2, 1, NULL, NULL, NULL),
(12, 'kwBkwTeZc6T', 'Galaxy s20', 'TSG20202004', 'jhvhjav hvasv ssa as  ', NULL, 'minitura-147_1.png', '', '', '', '', '', 1, 1, 1, NULL, '2020-04-29 13:18:33', NULL, 2599, 2, 1, NULL, NULL, NULL),
(13, 'WOBtrQ4FKsr', 'Iphone 8', 'TIPH8202004', 'hbasbjk asj bx sab as asd ', NULL, 'refurb-iphone8-silver_1.jpg', '', '', '', '', '', 1, 1, 1, NULL, '2020-04-29 13:19:14', NULL, 1899, 2, 1, NULL, NULL, NULL),
(14, 'T9umoCJ97wM', 'Samsung A51', 'TSGA51202004', 'lhjhsajh djsa hjd d jdahsd a ad sasd a ', NULL, 'SAMSUNG-GALAXY-A51-NEGRO-1_1.jpg', '', '', '', '', '', 1, 1, 1, NULL, '2020-04-29 13:19:43', NULL, 899, 2, 1, NULL, NULL, NULL),
(15, '2nmdWP6nyjf', 'Samsung A71', 'TSGA71', 'bhasjdhajs dasj bas jd asdad ad ada a das ', NULL, 'Samsung-galaxy-a71-ambos-plata_1.jpg', '', '', '', '', '', 1, 1, 1, NULL, '2020-04-29 13:20:20', NULL, 1099, 2, 1, NULL, NULL, NULL),
(16, '2iaJGAxUgBC', 'Samsung galaxy s10', 'TSGS10202004', 'bhjvgashbdhasb hasb hjsab sb hjas as ', NULL, 'SAMSUNG-GALAXY-S10-PLUS-VERDE_1_2.jpg', '', '', '', 'CMCun6AOS44', '', 1, 1, 1, 6, '2020-04-29 13:20:48', NULL, 1599, 2, 1, NULL, NULL, NULL),
(17, 'na0rJA3gKiu', 'Xiaomi MI 9T Pro', 'TXM10202004', 'nasdnasj ndj andj najs na dasd asd asd', NULL, 'xiaomi-mi-9t-pro-128gb-27w-lfa-android-90-pie-obsequio-D_NQ_NP_970907-MPE32158968910_092019-F_3.jpg', 'mi9tpro2.png', 'xiaomi-mi-9T-pro-test-review-avis-recensione-opinion-revision-photo-1-1400x934.jpg', 'xiaomi-mi-9T-pro-test-review-avis-recensione-opinion-revision-photo-2.jpg', 'mCWEbovLKuQ', '', 1, 1, 1, 9, '2020-04-29 13:21:16', NULL, 1499, 2, 1, NULL, NULL, NULL),
(18, 'e3QNRn73fnA', 'Samsung galaxy s10e', 'SGS10E202004', 'jbbjksbjcbjk sbjkdbjksd bjkf bjksdf  fsfsd sdf f sd', NULL, 'descargar_1_1.jpg', '', '', '', '', '', 1, 1, 1, 10, '2020-04-29 13:25:13', NULL, 1299, 2, 1, NULL, NULL, NULL),
(21, 'sQx2u41EOK7', 'Huawei Mate 30', 'CHM30202016', 'jkbasdbjasn as ddas d a RAM:2gb', NULL, 'huawei-mate-30-pro_7.jpg', '', '', '', 'Bj2ffS-H6WY', '', 1, 1, 1, 10, '2020-04-30 14:36:49', NULL, 1599, 2, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product_view`
--

DROP TABLE IF EXISTS `product_view`;
CREATE TABLE `product_view` (
  `id` int(11) NOT NULL,
  `viewer_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `realip` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `product_view`
--

INSERT INTO `product_view` (`id`, `viewer_id`, `product_id`, `created_at`, `realip`) VALUES
(6, NULL, 18, '2020-04-29 13:25:18', '::1'),
(7, NULL, 16, '2020-04-29 13:25:28', '::1'),
(8, NULL, 7, '2020-04-29 13:57:05', '::1'),
(9, NULL, 10, '2020-04-29 14:05:08', '::1'),
(10, NULL, 13, '2020-04-29 14:06:15', '::1'),
(11, NULL, 14, '2020-04-29 14:06:20', '::1'),
(12, NULL, 8, '2020-04-29 14:06:30', '::1'),
(13, NULL, 9, '2020-04-29 14:52:24', '::1'),
(14, NULL, 12, '2020-04-29 15:34:14', '::1'),
(15, NULL, 5, '2020-04-29 15:34:36', '::1'),
(16, NULL, 11, '2020-04-29 16:39:21', '::1'),
(17, NULL, 15, '2020-04-29 17:36:25', '::1'),
(21, NULL, 14, '2020-04-30 07:57:41', '::1'),
(24, NULL, 11, '2020-04-30 10:45:15', '::1'),
(25, NULL, 15, '2020-04-30 10:47:44', '::1'),
(26, NULL, 10, '2020-04-30 13:00:47', '::1'),
(27, NULL, 5, '2020-04-30 13:01:22', '::1'),
(30, NULL, 21, '2020-04-30 14:37:01', '::1'),
(31, NULL, 7, '2020-04-30 16:40:35', '::1'),
(32, NULL, 18, '2020-04-30 17:23:09', '::1'),
(33, NULL, 11, '2020-05-01 10:03:35', '::1'),
(34, NULL, 9, '2020-05-01 10:04:02', '::1'),
(35, NULL, 5, '2020-05-01 10:09:09', '192.168.1.138'),
(36, NULL, 18, '2020-05-01 10:09:51', '192.168.1.138'),
(37, NULL, 5, '2020-05-01 12:00:58', '::1'),
(38, NULL, 7, '2020-05-01 12:39:07', '::1'),
(40, NULL, 15, '2020-05-01 21:12:32', '::1'),
(41, NULL, 16, '2020-05-02 10:20:53', '::1'),
(42, NULL, 5, '2020-05-02 10:21:06', '::1'),
(43, NULL, 17, '2020-05-02 10:33:20', '::1'),
(44, NULL, 18, '2020-05-02 10:55:49', '::1'),
(45, NULL, 21, '2020-05-02 11:06:32', '::1'),
(46, NULL, 7, '2020-05-02 12:51:50', '::1'),
(47, NULL, 14, '2020-05-02 13:00:43', '::1'),
(48, NULL, 10, '2020-05-02 13:00:50', '::1'),
(49, NULL, 8, '2020-05-02 13:00:59', '::1'),
(50, NULL, 9, '2020-05-02 15:18:30', '::1'),
(51, NULL, 21, '2020-05-03 21:04:35', '::1'),
(52, NULL, 8, '2020-05-03 21:04:57', '::1'),
(53, NULL, 17, '2020-05-03 21:05:03', '::1'),
(54, NULL, 18, '2020-05-03 21:25:15', '::1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `slide`
--

DROP TABLE IF EXISTS `slide`;
CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `title` varchar(200) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT 0,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `slide`
--

INSERT INTO `slide` (`id`, `title`, `image`, `is_public`, `position`, `created_at`) VALUES
(3, '', 'slides_16_thumb_2.jpg', 1, NULL, '2020-04-29 13:21:40'),
(4, '', 'slides_15.jpg', 1, NULL, '2020-04-29 13:21:46'),
(5, '', 'slides_23_thumb_3.jpg', 1, NULL, '2020-04-29 13:21:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `status`
--

DROP TABLE IF EXISTS `status`;
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

DROP TABLE IF EXISTS `unit`;
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

DROP TABLE IF EXISTS `user`;
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
(1, 'Admin', '', 'admin', '', '90b9aa7e25f80cf4f64e990b78a9fc5ebd6cecad', 1, 1, '2020-04-29 12:43:59'),
(2, 'admin2', 'pralta', 'vendedor 1', 'vendedor@gmail.com', 'a000db4cb82cd0d0b77646bbb103d8a2c01b208e', 1, 0, '2020-05-01 16:01:32');

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
  ADD KEY `buy_product_ibfk_2` (`product_id`);

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
  ADD KEY `product_ibfk_1` (`unit_id`),
  ADD KEY `product_ibfk_2` (`category_id`);

--
-- Indices de la tabla `product_view`
--
ALTER TABLE `product_view`
  ADD PRIMARY KEY (`id`),
  ADD KEY `viewer_id` (`viewer_id`),
  ADD KEY `product_view_ibfk_2` (`product_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `buy_product`
--
ALTER TABLE `buy_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `product_view`
--
ALTER TABLE `product_view`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT de la tabla `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `buy_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
  ADD CONSTRAINT `product_view_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
