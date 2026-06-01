-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: sql302.infinityfree.com
-- Generation Time: Jun 01, 2026 at 12:54 PM
-- Server version: 11.4.12-MariaDB
-- PHP Version: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `if0_42008878_yum`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `stock` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `price`, `image`, `stock`) VALUES
(1, 'ยำปูม้า', '180.00', 'bluecrab.jpg', 29),
(2, 'ยำหมูยอ', '120.00', 'moo-yor.jpg', 49),
(3, 'ยำหอยนางรม', '150.00', 'oysters.jpg', 47),
(4, 'ยำทะเลรวมมิตร', '150.00', 'ruammit.jpg', 50),
(5, 'ยำแซลมอน', '200.00', 'salmon.jpg', 46),
(6, 'ยำไข่เค็ม', '150.00', 'saltedegg.jpg', 50);

-- --------------------------------------------------------

--
-- Table structure for table `noodle_options`
--

CREATE TABLE `noodle_options` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `noodle_options`
--

INSERT INTO `noodle_options` (`id`, `name`, `image`) VALUES
(1, 'วุ้นเส้น', 'woonsen.png'),
(2, 'เส้นเล็ก', 'senlek.png'),
(3, 'เส้นบุก', 'senbook.png'),
(4, 'ไม่ใส่เส้น', 'nosen.png');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `session_id` varchar(255) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `menu_price` decimal(10,2) NOT NULL,
  `noodle` varchar(100) DEFAULT NULL,
  `spicy` varchar(100) DEFAULT NULL,
  `fermented_fish` varchar(100) DEFAULT NULL,
  `pachana` varchar(100) DEFAULT NULL,
  `topping` text DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `total_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_admin`
--

CREATE TABLE `orders_admin` (
  `id` int(11) NOT NULL,
  `order_id` varchar(50) NOT NULL,
  `menu_name` varchar(255) NOT NULL,
  `noodle` varchar(100) DEFAULT NULL,
  `spicy` varchar(100) DEFAULT NULL,
  `fermented_fish` varchar(100) DEFAULT NULL,
  `pachana` varchar(100) DEFAULT NULL,
  `topping` text DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 1,
  `total_price` decimal(10,2) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT 'waiting',
  `order_time` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_admin`
--

INSERT INTO `orders_admin` (`id`, `order_id`, `menu_name`, `noodle`, `spicy`, `fermented_fish`, `pachana`, `topping`, `count`, `total_price`, `payment_method`, `status`, `order_time`) VALUES
(1, 'ORDER_6a1b2822ac06b', 'ยำปูม้า', 'ไม่ใส่เส้น', 'เผ็ดไฟลุก', 'ใส่ปลาร้า', 'ใส่ถุงกลับบ้าน', NULL, 1, '180.00', 'QR code', 'done', '2026-05-30 18:10:43'),
(2, 'ORDER_6a1b28fff18a5', 'ยำหอยนางรม', 'ไม่ใส่เส้น', 'เผ็ดไฟลุก', 'ไม่ใส่ปลาร้า', 'ใส่ถุงกลับบ้าน', 'ไส้กรอก (15.00)', 2, '330.00', 'cash', 'done', '2026-05-30 18:14:24'),
(3, 'ORDER_6a1b2ecbbd97c', 'ยำปูม้า', 'เส้นบุก', 'เผ็ดน้อย', 'ใส่ปลาร้า', 'ใส่ถ้วย', 'หมูยอ (15.00)', 1, '195.00', 'cash', 'done', '2026-05-30 18:39:08'),
(4, 'ORDER_6a1b2ecbbd97c', 'ยำหอยนางรม', 'ไม่ใส่เส้น', 'เผ็ดมาก', 'ไม่ใส่ปลาร้า', 'ใส่ถุงกลับบ้าน', 'ปูอัด (10.00)', 1, '160.00', 'cash', 'done', '2026-05-30 18:39:08'),
(5, 'ORDER_6a1b2f06d0e87', 'ยำหอยนางรม', 'วุ้นเส้น', 'เผ็ดกลาง', 'ไม่ใส่ปลาร้า', 'ใส่ถุงกลับบ้าน', 'ปูอัด (10.00), กุ้ง (20.00)', 1, '180.00', 'QR code', 'done', '2026-05-30 18:40:07'),
(6, 'ORDER_6a1b3057731a1', 'ยำหมูยอ', 'ไม่ใส่เส้น', 'เผ็ดไฟลุก', 'ไม่ใส่ปลาร้า', 'ใส่ถุงกลับบ้าน', 'ปูอัด (10.00), กุ้ง (20.00)', 1, '150.00', 'QR code', 'done', '2026-05-30 18:45:43'),
(7, 'ORDER_6a1b30969993c', 'ยำหอยนางรม', 'เส้นบุก', 'เผ็ดมาก', 'ไม่ใส่ปลาร้า', 'ใส่ถุงกลับบ้าน', NULL, 2, '300.00', 'cash', 'done', '2026-05-30 18:46:46'),
(8, 'ORDER_6a1b311cd1880', 'ยำปูม้า', 'ไม่ใส่เส้น', 'เผ็ดไฟลุก', 'ไม่ใส่ปลาร้า', 'ใส่ถุงกลับบ้าน', 'ไส้กรอก (15.00)', 1, '195.00', 'QR code', 'done', '2026-05-30 18:49:01'),
(9, 'ORDER_6a1b311cd1880', 'ยำแซลมอน', 'วุ้นเส้น', 'เผ็ดมาก', 'ใส่ปลาร้า', 'ใส่ถุงกลับบ้าน', 'ปูอัด (10.00), กุ้ง (20.00)', 1, '230.00', 'QR code', 'done', '2026-05-30 18:49:01'),
(10, 'ORDER_6a1b311cd1880', 'ยำแซลมอน', 'ไม่ใส่เส้น', 'เผ็ดมาก', 'ไม่ใส่ปลาร้า', 'ใส่ถุงกลับบ้าน', 'ปูอัด (10.00), กุ้ง (20.00)', 3, '690.00', 'QR code', 'done', '2026-05-30 18:49:01'),
(11, 'ORDER_6a1b322f0e551', 'ยำหอยนางรม', 'ไม่ใส่เส้น', 'เผ็ดไฟลุก', 'ไม่ใส่ปลาร้า', 'ใส่ถุงกลับบ้าน', 'ปูอัด (10.00)', 1, '160.00', 'cash', 'done', '2026-05-30 18:53:35');

-- --------------------------------------------------------

--
-- Table structure for table `pachana`
--

CREATE TABLE `pachana` (
  `id` int(11) NOT NULL,
  `option_name` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pachana`
--

INSERT INTO `pachana` (`id`, `option_name`, `image`) VALUES
(1, 'ใส่ถ้วย', 'tuay.png'),
(2, 'ใส่ถุงกลับบ้าน', 'bag.png');

-- --------------------------------------------------------

--
-- Table structure for table `sluttish`
--

CREATE TABLE `sluttish` (
  `id` int(11) NOT NULL,
  `option_sluttish` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sluttish`
--

INSERT INTO `sluttish` (`id`, `option_sluttish`, `image`) VALUES
(1, 'ใส่ปลาร้า', 'fishla.png'),
(2, 'ไม่ใส่ปลาร้า', 'nofishla.png');

-- --------------------------------------------------------

--
-- Table structure for table `spicy_options`
--

CREATE TABLE `spicy_options` (
  `id` int(11) NOT NULL,
  `level` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spicy_options`
--

INSERT INTO `spicy_options` (`id`, `level`, `image`) VALUES
(1, 'เผ็ดน้อย', 'chilli I.png'),
(2, 'เผ็ดกลาง', 'chilli II.png'),
(3, 'เผ็ดมาก', 'chilli III.png'),
(4, 'เผ็ดไฟลุก', 'chilli IV.png');

-- --------------------------------------------------------

--
-- Table structure for table `topping`
--

CREATE TABLE `topping` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topping`
--

INSERT INTO `topping` (`id`, `name`, `value`, `price`, `image`) VALUES
(1, 'หมูสับ', 'หมูสับ', '15.00', 'moo-bod.png'),
(2, 'หมูยอ', 'หมูยอ', '15.00', 'moo-yor.png'),
(3, 'ปูอัด', 'ปูอัด', '10.00', 'pooaud.png'),
(4, 'ไส้กรอก', 'ไส้กรอก', '15.00', 'sausage.png'),
(5, 'กุ้ง', 'กุ้ง', '20.00', 'shrimp.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `noodle_options`
--
ALTER TABLE `noodle_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders_admin`
--
ALTER TABLE `orders_admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pachana`
--
ALTER TABLE `pachana`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sluttish`
--
ALTER TABLE `sluttish`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `spicy_options`
--
ALTER TABLE `spicy_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topping`
--
ALTER TABLE `topping`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `noodle_options`
--
ALTER TABLE `noodle_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `orders_admin`
--
ALTER TABLE `orders_admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pachana`
--
ALTER TABLE `pachana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sluttish`
--
ALTER TABLE `sluttish`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `spicy_options`
--
ALTER TABLE `spicy_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `topping`
--
ALTER TABLE `topping`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
