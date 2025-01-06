-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jan 06, 2025 at 09:41 PM
-- Server version: 8.0.40
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oopb`
--

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `product_code` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `product_name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `product_image` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `product_category` int NOT NULL,
  `product_supplier` int NOT NULL,
  `product_price_s` double NOT NULL,
  `product_price_b` double NOT NULL,
  `product_stock` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_code`, `product_name`, `product_image`, `product_category`, `product_supplier`, `product_price_s`, `product_price_b`, `product_stock`) VALUES
(4, 'P00001', 'Printer', 'C:\\Users\\LABKOM\\Pictures\\Driver-Mongo.PNG', 1, 2, 5000000, 4000000, 50),
(5, 'P00002', 'Laptop Dell', 'C:\\Users\\LABKOM\\Pictures\\Driver-Mongo.PNG', 1, 2, 7500000, 5000000, 30),
(6, 'P00003', 'dsfdsfdssdfdsf', 'fdsfdsfdsfdsfds', 1, 2, 555, 5555, 5),
(7, 'P00004', 'AC Daikin', 'C:\\Users\\LABKOM\\Pictures\\Save-as-icon.png', 1, 2, 3000000, 2500000, 15),
(8, 'P00005', 'Mesin Cuci 2 tabung', 'C:\\Users\\LABKOM\\Pictures\\Driver-Mongo.PNG', 1, 2, 6000000, 5000000, 50),
(9, 'P00006', 'Printer 3D', 'C:\\Users\\LABKOM\\Pictures\\Capture.PNG', 1, 2, 5000000, 450000, 5),
(10, '9983601475', 'Blender X', 'C:\\Users\\LABKOM\\Pictures\\bgsplash.PNG', 1, 2, 750000, 500000, 5),
(11, '4970129727514', 'SNOWMAN', 'C:\\Users\\LABKOM\\Pictures\\Driver-Mongo.PNG', 1, 2, 7500, 5000, 50);

-- --------------------------------------------------------

--
-- Table structure for table `product_category`
--

CREATE TABLE `product_category` (
  `id` int NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_category`
--

INSERT INTO `product_category` (`id`, `name`, `description`) VALUES
(1, 'Elektronik', 'Elektronik'),
(2, 'Fashion', '');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(13) COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(225) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `name`, `phone`, `address`) VALUES
(1, 'AFFA COLLECTION', '08151222444', 'A'),
(2, 'ElektronikQ', '081577744411', 'B'),
(3, 'Sinar Jaya', '0816458545', 'Tegal');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id` int NOT NULL,
  `tanggal` date NOT NULL,
  `customer` int NOT NULL,
  `cashier_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`id`, `tanggal`, `customer`, `cashier_id`) VALUES
(1, '2024-12-10', 0, 1),
(2, '2024-12-31', 0, 1),
(3, '2024-12-31', 0, 1),
(4, '2024-12-31', 0, 1),
(5, '2024-12-31', 0, 1),
(6, '2025-01-07', 0, 1),
(7, '2025-01-07', 0, 1),
(8, '2025-01-07', 0, 1),
(9, '2025-01-07', 0, 11),
(10, '2025-01-07', 0, 11),
(11, '2025-01-07', 0, 11),
(12, '2025-01-07', 0, 11),
(13, '2025-01-07', 0, 12),
(14, '2025-01-07', 0, 12),
(15, '2025-01-07', 0, 12),
(16, '2025-01-07', 0, 11),
(17, '2025-01-07', 0, 11),
(18, '2025-01-07', 0, 11),
(19, '2025-01-07', 0, 11),
(20, '2025-01-07', 0, 11),
(21, '2025-01-07', 0, 11);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_detail`
--

CREATE TABLE `transaction_detail` (
  `id` int NOT NULL,
  `id_transaction` int NOT NULL,
  `id_product` int NOT NULL,
  `qty` int NOT NULL,
  `transaction_date` date DEFAULT NULL,
  `price` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_detail`
--

INSERT INTO `transaction_detail` (`id`, `id_transaction`, `id_product`, `qty`, `transaction_date`, `price`) VALUES
(1, 1, 4, 2, '2024-12-10', 5000000),
(2, 1, 5, 3, '2024-12-10', 7500000),
(3, 2, 4, 1, '2024-12-31', 5000000),
(4, 3, 4, 1, '2024-12-31', 5000000),
(5, 4, 4, 1, '2024-12-31', 5000000),
(6, 4, 6, 1, '2024-12-31', 555),
(7, 5, 4, 2, '2024-12-31', 5000000),
(8, 6, 4, 1, '2025-01-07', 5000000),
(9, 6, 5, 1, '2025-01-07', 7500000),
(10, 6, 7, 1, '2025-01-07', 3000000),
(11, 7, 4, 1, '2025-01-07', 5000000),
(12, 7, 5, 1, '2025-01-07', 7500000),
(13, 7, 7, 1, '2025-01-07', 3000000),
(14, 8, 4, 2, '2025-01-07', 5000000),
(15, 8, 5, 2, '2025-01-07', 7500000),
(16, 8, 7, 1, '2025-01-07', 3000000),
(17, 9, 4, 2, '2025-01-07', 5000000),
(18, 10, 4, 1, '2025-01-07', 5000000),
(19, 10, 5, 1, '2025-01-07', 7500000),
(20, 11, 4, 2, '2025-01-07', 5000000),
(21, 12, 4, 1, '2025-01-07', 5000000),
(22, 12, 6, 1, '2025-01-07', 555),
(23, 13, 4, 1, '2025-01-07', 5000000),
(24, 13, 5, 1, '2025-01-07', 7500000),
(25, 14, 4, 1, '2025-01-07', 5000000),
(26, 15, 4, 1, '2025-01-07', 5000000),
(27, 16, 4, 1, '2025-01-07', 5000000),
(28, 18, 4, 1, '2025-01-07', 5000000),
(29, 19, 4, 1, '2025-01-07', 5000000),
(30, 20, 4, 1, '2025-01-07', 5000000),
(31, 21, 4, 1, '2025-01-07', 5000000);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `fullname` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(32) COLLATE utf8mb4_general_ci NOT NULL,
  `level` enum('kasir','admin','owner') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'kasir'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullname`, `username`, `password`, `level`) VALUES
(1, 'SEKAR QYNASIH INGGIL ARDINSYAH', 'sena', '1234', 'admin'),
(2, 'AHMAT FAUZI', 'fauzi', '123', 'kasir'),
(11, 'wahyu akhmad fadillah', 'fadil', 'kasir', 'kasir'),
(12, 'dede fernanda', 'dede', 'kasir', 'kasir'),
(16, 'fahmi', 'fahmi', '1234', 'owner'),
(17, 'fahmi', 'fahmi2', '1234', 'owner'),
(18, 'fahmi', 'fahmi3', '1234', 'owner'),
(19, 'sena2', 'sena2', '1234', 'kasir'),
(20, 'A', 'A', 'A', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_supplier` (`product_supplier`),
  ADD KEY `product_category` (`product_category`);

--
-- Indexes for table `product_category`
--
ALTER TABLE `product_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cashier` (`cashier_id`);

--
-- Indexes for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_category`
--
ALTER TABLE `product_category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `transaction_detail`
--
ALTER TABLE `transaction_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_supplier`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`product_category`) REFERENCES `product_category` (`id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `fk_cashier` FOREIGN KEY (`cashier_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
