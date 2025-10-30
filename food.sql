-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2025 at 01:06 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Món Khai Vị'),
(2, 'Món Chính'),
(3, 'Món Lẩu'),
(4, 'Món Nướng'),
(5, 'Món Chiên'),
(6, 'Món Xào'),
(7, 'Món Chay'),
(8, 'Món Hải Sản'),
(9, 'Món Cơm'),
(10, 'Món Mì & Bún');

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `id` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `last_modified_date` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` varchar(200) NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `start_date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('DELETED','ON_SALE','STOPPED') NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`id`, `description`, `image_url`, `last_modified_date`, `name`, `price`, `start_date`, `status`, `category_id`) VALUES
('dfdb1092-b569-11f0-8f4b-00155d6438bf', 'Món khai vị nhẹ, tươi mát', 'https://img.example.com/goi-cuon.jpg', '2025-10-30 15:24:38', 'Gỏi Cuốn Tôm Thịt', 35000.00, '2025-10-30 15:24:38', 'ON_SALE', 1),
('dfdb215e-b569-11f0-8f4b-00155d6438bf', 'Giòn rụm, thơm ngon', 'https://img.example.com/cha-gio.jpg', '2025-10-30 15:24:38', 'Chả Giò Rế', 40000.00, '2025-10-30 15:24:38', 'ON_SALE', 1),
('dfdb225b-b569-11f0-8f4b-00155d6438bf', 'Món chính đậm đà vị bò', 'https://img.example.com/bo-luc-lac.jpg', '2025-10-30 15:24:38', 'Bò Lúc Lắc', 95000.00, '2025-10-30 15:24:38', 'ON_SALE', 2),
('dfdb22db-b569-11f0-8f4b-00155d6438bf', 'Cơm chiên thập cẩm quen thuộc', 'https://img.example.com/com-chien.jpg', '2025-10-30 15:24:38', 'Cơm Chiên Dương Châu', 55000.00, '2025-10-30 15:24:38', 'ON_SALE', 9),
('dfdb23be-b569-11f0-8f4b-00155d6438bf', 'Cá basa kho tộ kiểu Nam Bộ', 'https://img.example.com/ca-kho.jpg', '2025-10-30 15:24:38', 'Cá Kho Tộ', 70000.00, '2025-10-30 15:24:38', 'ON_SALE', 2),
('dfdb2446-b569-11f0-8f4b-00155d6438bf', 'Chua cay đậm đà, đủ vị', 'https://img.example.com/lau-thai.jpg', '2025-10-30 15:24:38', 'Lẩu Thái Hải Sản', 180000.00, '2025-10-30 15:24:38', 'ON_SALE', 3),
('dfdb24c8-b569-11f0-8f4b-00155d6438bf', 'Nước dùng thanh, ngọt tự nhiên', 'https://img.example.com/lau-nam-chay.jpg', '2025-10-30 15:24:38', 'Lẩu Nấm Chay', 160000.00, '2025-10-30 15:24:38', 'ON_SALE', 7),
('dfdb255a-b569-11f0-8f4b-00155d6438bf', 'Tôm tươi nướng cay nhẹ', 'https://img.example.com/tom-nuong.jpg', '2025-10-30 15:24:38', 'Tôm Nướng Muối Ớt', 120000.00, '2025-10-30 15:24:38', 'ON_SALE', 4),
('dfdb25b4-b569-11f0-8f4b-00155d6438bf', 'Đậm vị cay nồng', 'https://img.example.com/muc-nuong.jpg', '2025-10-30 15:24:38', 'Mực Nướng Sa Tế', 110000.00, '2025-10-30 15:24:38', 'ON_SALE', 4),
('dfdb2603-b569-11f0-8f4b-00155d6438bf', 'Món chiên được yêu thích', 'https://img.example.com/ga-chien.jpg', '2025-10-30 15:24:38', 'Gà Chiên Nước Mắm', 95000.00, '2025-10-30 15:24:38', 'ON_SALE', 5),
('dfdb2652-b569-11f0-8f4b-00155d6438bf', 'Khoai giòn vàng ruộm', 'https://img.example.com/khoai-tay.jpg', '2025-10-30 15:24:38', 'Khoai Tây Chiên', 35000.00, '2025-10-30 15:24:38', 'ON_SALE', 5),
('dfdb26a1-b569-11f0-8f4b-00155d6438bf', 'Bò mềm thơm mùi hành', 'https://img.example.com/bo-xao.jpg', '2025-10-30 15:24:38', 'Bò Xào Hành Tây', 90000.00, '2025-10-30 15:24:38', 'ON_SALE', 6),
('dfdb26f7-b569-11f0-8f4b-00155d6438bf', 'Mì giòn kết hợp hải sản tươi', 'https://img.example.com/mi-xao.jpg', '2025-10-30 15:24:38', 'Mì Xào Giòn Hải Sản', 85000.00, '2025-10-30 15:24:38', 'ON_SALE', 10),
('dfdb2751-b569-11f0-8f4b-00155d6438bf', 'Món cơm nổi tiếng Singapore', 'https://img.example.com/com-ga.jpg', '2025-10-30 15:24:38', 'Cơm Gà Hải Nam', 75000.00, '2025-10-30 15:24:38', 'ON_SALE', 9),
('dfdb279e-b569-11f0-8f4b-00155d6438bf', 'Đậm đà hương vị miền Trung', 'https://img.example.com/bun-bo-hue.jpg', '2025-10-30 15:24:38', 'Bún Bò Huế', 65000.00, '2025-10-30 15:24:38', 'ON_SALE', 10),
('dfdb27ef-b569-11f0-8f4b-00155d6438bf', 'Đặc sản Việt Nam', 'https://img.example.com/pho-bo.jpg', '2025-10-30 15:24:38', 'Phở Bò Tái', 60000.00, '2025-10-30 15:24:38', 'ON_SALE', 10),
('dfdb2843-b569-11f0-8f4b-00155d6438bf', 'Món chay cay nhẹ kiểu Hoa', 'https://img.example.com/dau-hu.jpg', '2025-10-30 15:24:38', 'Đậu Hũ Sốt Tứ Xuyên', 70000.00, '2025-10-30 15:24:38', 'ON_SALE', 7),
('dfdb288f-b569-11f0-8f4b-00155d6438bf', 'Thơm béo hương bơ', 'https://img.example.com/ca-hoi.jpg', '2025-10-30 15:24:38', 'Cá Hồi Nướng Bơ Tỏi', 190000.00, '2025-10-30 15:24:38', 'ON_SALE', 8),
('dfdb28df-b569-11f0-8f4b-00155d6438bf', 'Chua ngọt hấp dẫn', 'https://img.example.com/tom-rang-me.jpg', '2025-10-30 15:24:38', 'Tôm Rang Me', 105000.00, '2025-10-30 15:24:38', 'ON_SALE', 8),
('dfdb292d-b569-11f0-8f4b-00155d6438bf', 'Món xào cay nhẹ', 'https://img.example.com/muc-xao.jpg', '2025-10-30 15:24:38', 'Mực Xào Sa Tế', 115000.00, '2025-10-30 15:24:38', 'ON_SALE', 6),
('dfdb297a-b569-11f0-8f4b-00155d6438bf', 'Hương vị Bắc truyền thống', 'https://img.example.com/bun-cha.jpg', '2025-10-30 15:24:38', 'Bún Chả Hà Nội', 60000.00, '2025-10-30 15:24:38', 'ON_SALE', 10),
('dfdb29c8-b569-11f0-8f4b-00155d6438bf', 'Món cơm quốc dân', 'https://img.example.com/com-tam.jpg', '2025-10-30 15:24:38', 'Cơm Tấm Sườn Bì Chả', 70000.00, '2025-10-30 15:24:38', 'ON_SALE', 9),
('dfdb2a14-b569-11f0-8f4b-00155d6438bf', 'Món lẩu dân dã, đậm đà', 'https://img.example.com/lau-rieu.jpg', '2025-10-30 15:24:38', 'Lẩu Riêu Cua Đồng', 175000.00, '2025-10-30 15:24:38', 'ON_SALE', 3),
('dfdb2a62-b569-11f0-8f4b-00155d6438bf', 'Đặc sản miền Trung', 'https://img.example.com/mi-quang.jpg', '2025-10-30 15:24:38', 'Mì Quảng', 65000.00, '2025-10-30 15:24:38', 'ON_SALE', 10),
('dfdb2ab3-b569-11f0-8f4b-00155d6438bf', 'Giòn ngoài mềm trong', 'https://img.example.com/tom-chien.jpg', '2025-10-30 15:24:38', 'Tôm Chiên Xù', 95000.00, '2025-10-30 15:24:38', 'ON_SALE', 5),
('dfdb2b00-b569-11f0-8f4b-00155d6438bf', 'Chua ngọt hấp dẫn', 'https://img.example.com/ca-chien.jpg', '2025-10-30 15:24:38', 'Cá Chiên Sốt Me', 85000.00, '2025-10-30 15:24:38', 'ON_SALE', 5),
('dfdb2b51-b569-11f0-8f4b-00155d6438bf', 'Món nướng thơm lừng', 'https://img.example.com/bo-nuong.jpg', '2025-10-30 15:24:38', 'Bò Nướng Lá Lốt', 100000.00, '2025-10-30 15:24:38', 'ON_SALE', 4),
('dfdb2ba1-b569-11f0-8f4b-00155d6438bf', 'Món ăn yêu thích mọi lứa tuổi', 'https://img.example.com/ga-nuong.jpg', '2025-10-30 15:24:38', 'Cánh Gà Nướng Mật Ong', 95000.00, '2025-10-30 15:24:38', 'ON_SALE', 4),
('dfdb2bf6-b569-11f0-8f4b-00155d6438bf', 'Khai vị thanh mát', 'https://img.example.com/goi-ngo-sen.jpg', '2025-10-30 15:24:38', 'Gỏi Ngó Sen Tôm Thịt', 40000.00, '2025-10-30 15:24:38', 'ON_SALE', 1),
('dfdb2c49-b569-11f0-8f4b-00155d6438bf', 'Tráng miệng mát lạnh', 'https://img.example.com/che-ba-mau.jpg', '2025-10-30 15:24:38', 'Chè Ba Màu', 30000.00, '2025-10-30 15:24:38', 'ON_SALE', 1),
('dfdb2c99-b569-11f0-8f4b-00155d6438bf', 'Món chay cay nhẹ', 'https://img.example.com/dau-hu-chien.jpg', '2025-10-30 15:24:38', 'Đậu Hũ Chiên Sả Ớt', 50000.00, '2025-10-30 15:24:38', 'ON_SALE', 7),
('dfdb2ce6-b569-11f0-8f4b-00155d6438bf', 'Món hấp kiểu Hoa', 'https://img.example.com/ca-hap.jpg', '2025-10-30 15:24:38', 'Cá Hấp Xì Dầu', 120000.00, '2025-10-30 15:24:38', 'ON_SALE', 8),
('dfdb2d35-b569-11f0-8f4b-00155d6438bf', 'Giữ vị ngọt tự nhiên', 'https://img.example.com/tom-hap.jpg', '2025-10-30 15:24:38', 'Tôm Hấp Nước Dừa', 125000.00, '2025-10-30 15:24:38', 'ON_SALE', 8),
('dfdb2d84-b569-11f0-8f4b-00155d6438bf', 'Thơm lừng gừng tươi', 'https://img.example.com/ga-rang.jpg', '2025-10-30 15:24:38', 'Gà Rang Gừng', 85000.00, '2025-10-30 15:24:38', 'ON_SALE', 6),
('dfdb2dd2-b569-11f0-8f4b-00155d6438bf', 'Món Âu kiểu Việt', 'https://img.example.com/bo-ham.jpg', '2025-10-30 15:24:38', 'Bò Hầm Rượu Vang', 130000.00, '2025-10-30 15:24:38', 'ON_SALE', 2),
('dfdb2e21-b569-11f0-8f4b-00155d6438bf', 'Món Âu dễ ăn', 'https://img.example.com/spaghetti.jpg', '2025-10-30 15:24:38', 'Mì Ý Sốt Bò Bằm', 90000.00, '2025-10-30 15:24:38', 'ON_SALE', 10),
('dfdb2e72-b569-11f0-8f4b-00155d6438bf', 'Đầy đủ hương vị biển', 'https://img.example.com/com-chien-hai-san.jpg', '2025-10-30 15:24:38', 'Cơm Chiên Hải Sản', 75000.00, '2025-10-30 15:24:38', 'ON_SALE', 9),
('dfdb2ec1-b569-11f0-8f4b-00155d6438bf', 'Đậm vị miền Nam', 'https://img.example.com/lau-bo.jpg', '2025-10-30 15:24:38', 'Lẩu Bò Nhúng Dấm', 185000.00, '2025-10-30 15:24:38', 'ON_SALE', 3),
('dfdb2f10-b569-11f0-8f4b-00155d6438bf', 'Giòn rụm, vàng ươm', 'https://img.example.com/banh-xeo.jpg', '2025-10-30 15:24:38', 'Bánh Xèo Tôm Thịt', 65000.00, '2025-10-30 15:24:38', 'ON_SALE', 5),
('dfdb2f5d-b569-11f0-8f4b-00155d6438bf', 'Món chay ngon miệng', 'https://img.example.com/dau-hu-kho.jpg', '2025-10-30 15:24:38', 'Đậu Hũ Kho Nấm', 60000.00, '2025-10-30 15:24:38', 'ON_SALE', 7),
('dfdb2fac-b569-11f0-8f4b-00155d6438bf', 'Cá kho truyền thống', 'https://img.example.com/ca-basa.jpg', '2025-10-30 15:24:38', 'Cá Basa Kho Riềng', 85000.00, '2025-10-30 15:24:38', 'ON_SALE', 2),
('dfdb2ff8-b569-11f0-8f4b-00155d6438bf', 'Cay nhẹ, thơm lừng', 'https://img.example.com/ga-xao.jpg', '2025-10-30 15:24:38', 'Gà Xào Sả Ớt', 95000.00, '2025-10-30 15:24:38', 'ON_SALE', 6),
('dfdb3045-b569-11f0-8f4b-00155d6438bf', 'Tôm tươi, cay nồng', 'https://img.example.com/tom-su.jpg', '2025-10-30 15:24:38', 'Tôm Sú Nướng Muối Ớt', 125000.00, '2025-10-30 15:24:38', 'ON_SALE', 4),
('dfdb3092-b569-11f0-8f4b-00155d6438bf', 'Bò mềm, mì thơm', 'https://img.example.com/mi-xao-bo.jpg', '2025-10-30 15:24:38', 'Mì Xào Bò', 85000.00, '2025-10-30 15:24:38', 'ON_SALE', 10),
('dfdb30e1-b569-11f0-8f4b-00155d6438bf', 'Món ăn nhanh gọn', 'https://img.example.com/com-trung.jpg', '2025-10-30 15:24:38', 'Cơm Chiên Trứng', 50000.00, '2025-10-30 15:24:38', 'ON_SALE', 9),
('dfdb312c-b569-11f0-8f4b-00155d6438bf', 'Chua cay, đặc trưng Nam Bộ', 'https://img.example.com/lau-ga.jpg', '2025-10-30 15:24:38', 'Lẩu Gà Lá Giang', 165000.00, '2025-10-30 15:24:38', 'ON_SALE', 3),
('dfdb3177-b569-11f0-8f4b-00155d6438bf', 'Giòn rụm, thơm ngon', 'https://img.example.com/ca-gion.jpg', '2025-10-30 15:24:38', 'Cá Chiên Giòn', 90000.00, '2025-10-30 15:24:38', 'ON_SALE', 5),
('dfdb31c2-b569-11f0-8f4b-00155d6438bf', 'Béo mặn hấp dẫn', 'https://img.example.com/tom-trung-muoi.jpg', '2025-10-30 15:24:38', 'Tôm Sốt Trứng Muối', 130000.00, '2025-10-30 15:24:38', 'ON_SALE', 8),
('dfdb3210-b569-11f0-8f4b-00155d6438bf', 'Món chay lạ miệng', 'https://img.example.com/dau-hu-muoi.jpg', '2025-10-30 15:24:38', 'Đậu Hũ Rang Muối', 55000.00, '2025-10-30 15:24:38', 'ON_SALE', 7),
('dfdb325c-b569-11f0-8f4b-00155d6438bf', 'Mì xào rau củ', 'https://img.example.com/mi-xao-chay.jpg', '2025-10-30 15:24:38', 'Mì Xào Chay', 70000.00, '2025-10-30 15:24:38', 'ON_SALE', 10),
('dfdb32ac-b569-11f0-8f4b-00155d6438bf', 'Món đặc sản miền Nam', 'https://img.example.com/banh-canh.jpg', '2025-10-30 15:24:38', 'Bánh Canh Cua', 65000.00, '2025-10-30 15:24:38', 'ON_SALE', 10);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `description` text NOT NULL,
  `thumbnail_url` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `started_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `udpated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `deleted_at` datetime NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKgbu6erefir17660qutbbjnma7` (`category_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_categories_id_food` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dishes`
--
ALTER TABLE `dishes`
  ADD CONSTRAINT `FKgbu6erefir17660qutbbjnma7` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `fk_categories_id_food` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
