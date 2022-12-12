-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th12 12, 2022 lúc 04:30 PM
-- Phiên bản máy phục vụ: 5.7.36
-- Phiên bản PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `ltw`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `categorieId` int(12) NOT NULL AUTO_INCREMENT,
  `categorieName` varchar(255) NOT NULL,
  `categorieDesc` text NOT NULL,
  `categorieCreateDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`categorieId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`categorieId`, `categorieName`, `categorieDesc`, `categorieCreateDate`) VALUES
(24, 'Hoa cÆ°á»›i', 'HÃ£y lÃ  cÃ´ dÃ¢u ráº¡ng rá»¡ nháº¥t vá»›i bÃ³ hoa cÆ°á»›i xinh Ä‘áº¹p trÃªn tay!', '2022-12-12 00:16:35'),
(25, 'Hoa tá»‘t nghiá»‡p', ' Gá»­i hoa chÃºc má»«ng cÃ¡c tÃ¢n khoa!', '2022-12-12 00:16:49'),
(26, 'Sinh nháº­t', 'HÃ£y lÃ m cho ngÃ y sinh nháº­t cá»§a ngÆ°á»i thÃ¢n yÃªu trá»Ÿ nÃªn khÃ³ quÃªn vá»›i hoa, bÃ¡nh ngá»t, bÃ³ng bay vÃ  nhiá»u mÃ³n quÃ  khÃ¡c!', '2022-12-12 00:17:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `contactId` int(21) NOT NULL AUTO_INCREMENT,
  `userId` int(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `orderId` int(21) NOT NULL DEFAULT '0' COMMENT 'If problem is not related to the order then order id = 0',
  `message` text NOT NULL,
  `time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`contactId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`contactId`, `userId`, `email`, `phoneNo`, `orderId`, `message`, `time`) VALUES
(1, 1, 'admin@gmail.com', 1111111111, 0, 'Æ°qeqÆ°eqweqwe', '2022-12-12 16:01:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contactreply`
--

DROP TABLE IF EXISTS `contactreply`;
CREATE TABLE IF NOT EXISTS `contactreply` (
  `id` int(21) NOT NULL AUTO_INCREMENT,
  `contactId` int(21) NOT NULL,
  `userId` int(23) NOT NULL,
  `message` text NOT NULL,
  `datetime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `contactreply`
--

INSERT INTO `contactreply` (`id`, `contactId`, `userId`, `message`, `datetime`) VALUES
(1, 1, 1, 'aaaaa', '2022-12-12 16:03:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `deliverydetails`
--

DROP TABLE IF EXISTS `deliverydetails`;
CREATE TABLE IF NOT EXISTS `deliverydetails` (
  `id` int(21) NOT NULL AUTO_INCREMENT,
  `orderId` int(21) NOT NULL,
  `deliveryBoyName` varchar(35) NOT NULL,
  `deliveryBoyPhoneNo` bigint(25) NOT NULL,
  `deliveryTime` int(200) NOT NULL COMMENT 'Time in minutes',
  `dateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orderId` (`orderId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flower`
--

DROP TABLE IF EXISTS `flower`;
CREATE TABLE IF NOT EXISTS `flower` (
  `pizzaId` int(12) NOT NULL AUTO_INCREMENT,
  `pizzaName` varchar(255) NOT NULL,
  `pizzaPrice` int(12) NOT NULL,
  `pizzaDesc` text NOT NULL,
  `pizzaCategorieId` int(12) NOT NULL,
  `pizzaPubDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`pizzaId`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `flower`
--

INSERT INTO `flower` (`pizzaId`, `pizzaName`, `pizzaPrice`, `pizzaDesc`, `pizzaCategorieId`, `pizzaPubDate`) VALUES
(70, 'ROSY ROSIE', 399000, 'Chiáº¿c bÃ¡nh kem tá»« nhá»¯ng bÃ´ng hoa há»“ng vÃ  hoa cáº©m chÆ°á»›ng vÃ´ cÃ¹ng ngá»t ngÃ o sáº½ lÃ  mÃ³n quÃ  Ã½ nghÄ©a nháº¥t gá»­i táº·ng Ä‘áº¿n ngÆ°á»i thÃ¢n yÃªu.', 26, '2022-12-12 00:18:55'),
(71, 'BE MINE', 299000, 'BÃ³ hoa Be Mine khÃ´ng chá»‰ lÃ  sá»± káº¿t há»£p cá»§a hoa há»“ng Ä‘á» ná»“ng nÃ n, mÃ  cÃ²n cá»§a cáº£ nhá»¯ng bÃ´ng há»“ng báº¡c láº¥p lÃ¡nh, nhÆ° tÃ¬nh cáº£m cá»§a báº¡n dÃ nh cho Ä‘á»‘i phÆ°Æ¡ng, vá»«a tháº¯m thiáº¿t, dáº¡t dÃ o, láº¡i vá»«a trÃ¢n quÃ½, nÃ¢ng niu.', 26, '2022-12-12 00:19:36'),
(72, 'STROKE OF LUCK', 499000, 'BÃ³ bÃ´ng hoa Lily Ä‘Æ°á»£c káº¿t há»£p vá»›i giáº¥y gÃ³i hÃ i hÃ²a vÃ  trang nhÃ£. LÃ  sá»± lá»±a chá»n hoÃ n háº£o cho ngÃ y Valentine hoáº·c báº¥t ká»³ dá»‹p Ä‘áº·c biá»‡t nÃ o.', 25, '2022-12-12 00:20:32'),
(73, 'DREAMLIKE', 199000, 'Giá» hoa rá»±c rá»¡ vÃ  Ä‘áº§y sá»©c sá»‘ng vá»›i hoa Há»“ng, Äá»“ng Tiá»n & Cáº©m ChÆ°á»›ng tÆ°Æ¡i táº¯n. ÄÃ¢y sáº½ lÃ  mÃ³n quÃ  báº¥t ngá» vÃ  hoÃ n háº£o dÃ nh táº·ng ngÆ°á»i thÆ°Æ¡ng, gia Ä‘Ã¬nh hoáº·c báº¡n bÃ¨.', 25, '2022-12-12 00:21:08'),
(74, 'HOA CÆ¯á»šI CINDERELLA BRIDAL', 799000, 'BÃ³ hoa há»“ng nhÃ£ nháº·n, tinh khiáº¿t vÃ  thanh lá»‹ch sáº½ tÃ´ Ä‘iá»ƒm thÃªm cho báº¡n trong ngÃ y trá»ng Ä‘áº¡i cá»§a mÃ¬nh.', 24, '2022-12-12 00:22:12'),
(75, 'BIBI BERRY PREMIUM', 600000, 'Náº±m trong Bá»™ sÆ°u táº­p ChÃ o Ä‘Ã³n GiÃ¡ng Sinh, bÃ³ hoa Bibi Berry Premium mang váº» Ä‘áº¹p tinh khÃ´i vÃ  ngá»t ngÃ o, thay cho lá»i yÃªu thÆ°Æ¡ng cá»§a báº¡n Ä‘áº¿n nÃ ng. ', 24, '2022-12-12 00:22:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
CREATE TABLE IF NOT EXISTS `orderitems` (
  `id` int(21) NOT NULL AUTO_INCREMENT,
  `orderId` int(21) NOT NULL,
  `pizzaId` int(21) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orderitems`
--

INSERT INTO `orderitems` (`id`, `orderId`, `pizzaId`, `itemQuantity`) VALUES
(1, 1, 71, 1),
(2, 2, 74, 1),
(3, 3, 73, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orderId` int(21) NOT NULL AUTO_INCREMENT,
  `userId` int(21) NOT NULL,
  `address` varchar(255) NOT NULL,
  `zipCode` int(21) NOT NULL,
  `phoneNo` bigint(21) NOT NULL,
  `amount` int(200) NOT NULL,
  `paymentMode` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=cash on delivery, \r\n1=online ',
  `orderStatus` enum('0','1','2','3','4','5','6') NOT NULL DEFAULT '0' COMMENT '0=Order Placed.\r\n1=Order Confirmed.\r\n2=Preparing your Order.\r\n3=Your order is on the way!\r\n4=Order Delivered.\r\n5=Order Denied.\r\n6=Order Cancelled.',
  `orderDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`orderId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`orderId`, `userId`, `address`, `zipCode`, `phoneNo`, `amount`, `paymentMode`, `orderStatus`, `orderDate`) VALUES
(2, 1, '180 cao lá»—, 180 cao lo F4 Q8', 123123, 1231231231, 799000, '0', '1', '2022-12-12 15:46:03'),
(3, 1, '180 cao lá»—, 180 cao lo F4 Q8', 123123, 1231231231, 597000, '0', '4', '2022-12-12 16:11:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sitedetail`
--

DROP TABLE IF EXISTS `sitedetail`;
CREATE TABLE IF NOT EXISTS `sitedetail` (
  `tempId` int(11) NOT NULL AUTO_INCREMENT,
  `systemName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `contact1` bigint(21) NOT NULL,
  `contact2` bigint(21) DEFAULT NULL COMMENT 'Optional',
  `address` text NOT NULL,
  `dateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`tempId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `sitedetail`
--

INSERT INTO `sitedetail` (`tempId`, `systemName`, `email`, `contact1`, `contact2`, `address`, `dateTime`) VALUES
(1, 'FlowerStore', 'tetsu@gmail.com', 707697854, 6304468851, '180 cao lá»—', '2021-03-23 19:56:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(21) NOT NULL AUTO_INCREMENT,
  `username` varchar(21) NOT NULL,
  `firstName` varchar(21) NOT NULL,
  `lastName` varchar(21) NOT NULL,
  `email` varchar(35) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `userType` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0=user\r\n1=admin',
  `password` varchar(255) NOT NULL,
  `joinDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `firstName`, `lastName`, `email`, `phone`, `userType`, `password`, `joinDate`) VALUES
(1, 'admin', 'admin', 'admin', 'admin@gmail.com', 1111111111, '1', '$2y$10$AAfxRFOYbl7FdN17rN3fgeiPu/xQrx6MnvRGzqjVHlGqHAM4d9T1i', '2021-04-11 11:40:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `viewcart`
--

DROP TABLE IF EXISTS `viewcart`;
CREATE TABLE IF NOT EXISTS `viewcart` (
  `cartItemId` int(11) NOT NULL AUTO_INCREMENT,
  `pizzaId` int(11) NOT NULL,
  `itemQuantity` int(100) NOT NULL,
  `userId` int(11) NOT NULL,
  `addedDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cartItemId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `viewcart`
--

INSERT INTO `viewcart` (`cartItemId`, `pizzaId`, `itemQuantity`, `userId`, `addedDate`) VALUES
(1, 72, 2, 2, '2022-12-12 00:44:01'),
(5, 73, 1, 1, '2022-12-12 16:18:08');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories` ADD FULLTEXT KEY `categorieName` (`categorieName`,`categorieDesc`);

--
-- Chỉ mục cho bảng `flower`
--
ALTER TABLE `flower` ADD FULLTEXT KEY `pizzaName` (`pizzaName`,`pizzaDesc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
