-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.27-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.3.0.6589
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para aries_db
CREATE DATABASE IF NOT EXISTS `aries_db` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `aries_db`;

-- Volcando estructura para tabla aries_db.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla aries_db.categories: ~4 rows (aproximadamente)
REPLACE INTO `categories` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'man', 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11'),
	(2, 'woman', 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11'),
	(3, 'child', 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11'),
	(4, 'accesories', 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11');

-- Volcando estructura para tabla aries_db.colors
CREATE TABLE IF NOT EXISTS `colors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla aries_db.colors: ~5 rows (aproximadamente)
REPLACE INTO `colors` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'red', 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11'),
	(2, 'blue', 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11'),
	(3, 'white', 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11'),
	(4, 'black', 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11'),
	(5, 'yellow', 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11');

-- Volcando estructura para tabla aries_db.products
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(500) NOT NULL,
  `product_img` varchar(100) DEFAULT NULL,
  `category_id` int(10) NOT NULL,
  `color_id` int(10) NOT NULL,
  `size_id` int(10) NOT NULL,
  `stock` int(10) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_category_id_idx` (`category_id`),
  KEY `fk_color_id_idx` (`color_id`),
  KEY `fk_size_id_idx` (`size_id`),
  CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_color_id` FOREIGN KEY (`color_id`) REFERENCES `colors` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_size_id` FOREIGN KEY (`size_id`) REFERENCES `sizes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla aries_db.products: ~13 rows (aproximadamente)
REPLACE INTO `products` (`id`, `name`, `description`, `product_img`, `category_id`, `color_id`, `size_id`, `stock`, `price`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'Casco Ovation Schooler', 'Casco para equitación super cómodo y liviano. Visera y arnés de cuero genuino. Dial de ajuste fácil para un ajuste perfecto. Acabado de goma fácil de limpiar.Forro extraíble lavable Coolmax®. Exclusivo clip de ajuste YKK® y hebilla. Certificado según las normas ASTM', 'casco.jpg', 4, 5, 1, 12, 55000.00, 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11'),
	(2, 'Montura salto competición armazón PVC', 'El asiento plano está diseñado para adoptar una posición de salto equilibrada, permitiendo al jinete una gran libertad de movimiento, manteniendo su posición, a lo que se le suma el contacto que le brinda el basto frances. El forrado en la falda favorece la estabilidad de la pierna. El armazon de PVC le da flexibilidad a la montura brindando comodidad al jinete y al caballo, ademas de su durabilidad.', 'montura.jpg', 4, 5, 3, 8, 132000.00, 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11'),
	(3, 'Chomba competición', 'Chomba equitacion liviana 100% algodón. Elegantes detalles en cuello y aberturas laterales. Botones de metal.Ligeramente mas larga atrás', 'prod1672271866155.jpg', 1, 5, 1, 23, 12000.00, 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11'),
	(4, 'Pantalón de Equitación Rider\'s Gene para Hombre KGrip', 'Pantalón para montar de la nueva marca italiana RG para hombre que ofrece una excelente combinación de funcionalidad y alto rendimiento con un diseño tecnológico', 'pantalonhombre.jpg', 1, 4, 3, 18, 40000.00, 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11'),
	(5, 'Chaqueta Concurso', 'La Chaqueta Concurso Animo Istrana de hombre combina tecnología y diseño al máximo nivel. La característica que le hace prácticamente única, es su cierre hasta el cuello.', 'prod1675639261190.jpg', 1, 2, 4, 9, 160000.00, 1, '2023-02-05 23:21:01', '2023-02-05 23:21:01'),
	(6, 'Pantalón Mujer Vestrum Syracuse Full Grip', 'Pantalones deportivos fabricados con la mejor calidad del material bielástico. Con culera de Grip', 'breechmujer.jpg', 2, 1, 1, 5, 90000.00, 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11'),
	(7, 'Camisa Mujer Medan Vestrum', 'Manga corta. Tejido técnico. Adornos en la parte delantera y logo Vestrum en el cuello.', 'camisamujer.jpg', 2, 3, 4, 31, 25000.00, 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11'),
	(8, 'Medias equitación Horseland', 'Medias para montar confeccionadas el pie en algodón, la caña en lycra, sumamente confortables para montar', 'prod1675383253196.jpg', 2, 2, 3, 10, 3000.00, 1, '2023-02-03 00:14:13', '2023-02-03 00:14:13'),
	(9, 'Breech Niños', 'Especialmente diseñadas y seleccionadas para niños. Los materiales para los lazos son una selección de calidad, 100% algodón marcella. Se entregan empaquetados en una caja de presentación ShowQuest', 'prod1675640148043.jpg', 3, 3, 1, 3, 3200.00, 1, '2023-02-05 23:35:48', '2023-02-05 23:35:48'),
	(11, 'Zapatillas Nike', 'Zapatillas Nike para equitacion para hombres', 'prod1676235860882.png', 1, 4, 4, 65, 55000.00, 1, '2023-02-12 21:04:21', '2023-02-12 21:04:21'),
	(15, 'Pelota', 'Producto de goma resistente al agua', 'prod1676337088542.jpeg', 2, 1, 1, 10, 12000.00, 1, '2023-02-24 20:37:10', '2023-02-24 20:37:10'),
	(16, 'Polo Stick 2', 'Palo de madera de alerce para polo', 'prod1676338270896.jpg', 4, 2, 4, 10, 5000.00, 1, '2023-02-23 23:50:22', '2023-02-23 23:50:22'),
	(20, 'ProductoPrueba', 'ProductoPruebaProductoPruebaProductoPrueba', 'prod1677806773924.jpg', 1, 1, 1, 1, 9999.00, 1, '2023-03-03 01:26:14', '2023-03-03 01:26:14'),
	(21, 'ProductoPrueba', 'ProductoPruebaProductoPruebaProductoPrueba', 'prod1677807019390.jpg', 1, 1, 1, 1, 999.00, 1, '2023-03-03 01:30:19', '2023-03-03 01:30:19');

-- Volcando estructura para tabla aries_db.sizes
CREATE TABLE IF NOT EXISTS `sizes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla aries_db.sizes: ~5 rows (aproximadamente)
REPLACE INTO `sizes` (`id`, `name`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'XS', 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11'),
	(2, 'S', 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11'),
	(3, 'M', 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11'),
	(4, 'L', 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11'),
	(5, 'XL', 1, '2023-01-31 20:15:11', '2023-01-31 20:15:11');

-- Volcando estructura para tabla aries_db.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `user_img` varchar(100) NOT NULL,
  `is_active` tinyint(4) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Volcando datos para la tabla aries_db.users: ~4 rows (aproximadamente)
REPLACE INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `type`, `user_img`, `is_active`, `created_at`, `updated_at`) VALUES
	(1, 'Mick', 'Jagger', 'mick.jagger@gmail.com', '$2a$10$rPhKqf8kisHnm9u2E2wd7u9ma3X9fCQJ50SRDGLiNI8sDrYc7Z58a', 'Customer', 'user1673206016637.jpg', 1, '2023-01-31 20:15:12', '2023-01-31 20:15:12'),
	(2, 'Keith', 'Richards', 'keith@gmail.com', '$2a$10$E43D/1XsGeiFovOHwW/ql.z9t5VdOTKHxRn7v0xGNWkrJBnyufc1q', 'Customer', 'user1673210420364.jpg', 1, '2023-01-31 20:15:12', '2023-01-31 20:15:12'),
	(3, 'Paul', 'McCartney', 'paul@gmail.com', '$2a$10$76VdRlmc9ZjCnLQEkGFcSe9YPnnOC330B/P0AWzfNwmEH4EEfjcoG', 'Customer', 'user1673310847926.jpg', 1, '2023-01-31 20:15:12', '2023-01-31 20:15:12'),
	(4, 'Admin', 'Strator', 'admin@gmail.com', 'abc123', 'admin', 'https://robohash.org/doloremetdoloribus.png?size=50x50&set=set1', 1, '2023-01-31 20:15:12', '2023-01-31 20:15:12');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
