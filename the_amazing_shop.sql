-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 18, 2021 at 02:26 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3
SET
  SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET
  time_zone = "+00:00";
  /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
  /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
  /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
  /*!40101 SET NAMES utf8mb4 */;
--
  -- Database: `the-amazing-shop`
  --
  -- --------------------------------------------------------
  --
  -- Table structure for table `clients`
  --
  CREATE TABLE `clients` (
    `id` int(11) NOT NULL,
    `name` varchar(50) NOT NULL,
    `last_name` varchar(50) NOT NULL,
    `email` varchar(50) NOT NULL,
    `phone` varchar(20) NOT NULL,
    `address` varchar(50) NOT NULL,
    `VIP` tinyint(1) NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8;
--
  -- Dumping data for table `clients`
  --
INSERT INTO
  `clients` (
    `id`,
    `name`,
    `last_name`,
    `email`,
    `phone`,
    `address`,
    `VIP`
  )
VALUES
  (
    1,
    'idan',
    'magled',
    'Idanmagled@gmail.com',
    '0526651266',
    'the big world',
    0
  ),
  (
    2,
    'Matan',
    'zada',
    'Matan@gmail.com',
    '0509644553',
    'herzel ',
    1
  ),
  (
    3,
    'Snir',
    'inbar',
    'Snir@gmail.com',
    '050452125453',
    'haifa',
    0
  );
-- --------------------------------------------------------
  --
  -- Table structure for table `orders`
  --
  CREATE TABLE `orders` (
    `id` int(11) NOT NULL,
    `date` datetime NOT NULL DEFAULT current_timestamp(),
    `is_gift` tinyint(1) NOT NULL,
    `client_id` int(11) NOT NULL,
    `is_supplied` tinyint(1) NOT NULL,
    `price` float DEFAULT NULL,
    `is_canceled` tinyint(1) NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8;
--
  -- Dumping data for table `orders`
  --
INSERT INTO
  `orders` (
    `id`,
    `date`,
    `is_gift`,
    `client_id`,
    `is_supplied`,
    `price`,
    `is_canceled`
  )
VALUES
  (1, '2021-12-16 18:41:48', 1, 1, 0, 10, 0),
  (2, '2021-12-16 18:52:49', 0, 1, 0, 5, 0),
  (3, '2021-12-16 18:53:04', 0, 1, 0, 3, 0),
  (4, '2021-12-18 15:18:49', 0, 2, 0, 1, 1);
-- --------------------------------------------------------
  --
  -- Table structure for table `order_products`
  --
  CREATE TABLE `order_products` (
    `id` int(11) NOT NULL,
    `product_id` int(11) NOT NULL,
    `order_id` int(11) NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8;
--
  -- Dumping data for table `order_products`
  --
INSERT INTO
  `order_products` (`id`, `product_id`, `order_id`)
VALUES
  (1, 2, 1),
  (2, 3, 1),
  (3, 2, 2),
  (4, 2, 2),
  (5, 1, 3);
-- --------------------------------------------------------
  --
  -- Table structure for table `products`
  --
  CREATE TABLE `products` (
    `id` int(11) NOT NULL,
    `name` varchar(50) NOT NULL,
    `weight` int(11) NOT NULL,
    `price` int(11) NOT NULL,
    `description` varchar(200) NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8;
--
  -- Dumping data for table `products`
  --
INSERT INTO
  `products` (`id`, `name`, `weight`, `price`, `description`)
VALUES
  (1, 'water', 1, 4, 'נפח אחד ליטר'),
  (2, 'coffee', 2, 10, 'קפה מדהים'),
  (
    3,
    'espresso',
    3,
    40,
    'שרוול נספרסו (שרוויל מכיל 10 יחידות)'
  );
--
  -- Indexes for dumped tables
  --
  --
  -- Indexes for table `clients`
  --
ALTER TABLE
  `clients`
ADD
  PRIMARY KEY (`id`),
ADD
  UNIQUE KEY `clients.email` (`email`),
ADD
  UNIQUE KEY `clients.phone` (`phone`),
ADD
  KEY `clients.name` (`name`),
ADD
  KEY `clients.last_name` (`last_name`);
--
  -- Indexes for table `orders`
  --
ALTER TABLE
  `orders`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `client_id` (`client_id`);
--
  -- Indexes for table `order_products`
  --
ALTER TABLE
  `order_products`
ADD
  PRIMARY KEY (`id`),
ADD
  KEY `order_id` (`order_id`),
ADD
  KEY `product_id` (`product_id`);
--
  -- Indexes for table `products`
  --
ALTER TABLE
  `products`
ADD
  PRIMARY KEY (`id`),
ADD
  UNIQUE KEY `products.name` (`name`);
--
  -- AUTO_INCREMENT for dumped tables
  --
  --
  -- AUTO_INCREMENT for table `clients`
  --
ALTER TABLE
  `clients`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;
--
  -- AUTO_INCREMENT for table `orders`
  --
ALTER TABLE
  `orders`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 5;
--
  -- AUTO_INCREMENT for table `order_products`
  --
ALTER TABLE
  `order_products`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 6;
--
  -- AUTO_INCREMENT for table `products`
  --
ALTER TABLE
  `products`
MODIFY
  `id` int(11) NOT NULL AUTO_INCREMENT,
  AUTO_INCREMENT = 4;
--
  -- Constraints for dumped tables
  --
  --
  -- Constraints for table `orders`
  --
ALTER TABLE
  `orders`
ADD
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);
--
  -- Constraints for table `order_products`
  --
ALTER TABLE
  `order_products`
ADD
  CONSTRAINT `order_products_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
ADD
  CONSTRAINT `order_products_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;
  /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
  /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
  /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
SELECT
  SUM(price)
FROM
  orders
SELECT
  COUNT(is_canceled)
FROM
  orders
WHERE
  is_canceled
SELECT
  *
FROM
  orders
WHERE
  date BETWEEN '2021-12-17'
  AND '2021-12-19'
UPDATE
  `user`
SET
  `Host` = 'localhost'
WHERE
  `user`.`Host` = '%localhost'
  AND `user`.`User` = 'YonatanZada';
-- * A4B6157319038724E3560894F7F932C8886EBFCF