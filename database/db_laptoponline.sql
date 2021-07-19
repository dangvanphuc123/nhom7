-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 17, 2021 lúc 01:53 PM
-- Phiên bản máy phục vụ: 10.4.19-MariaDB
-- Phiên bản PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_laptoponline`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getcat` (IN `cid` INT)  SELECT * FROM categories WHERE cat_id=cid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin_info`
--

CREATE TABLE `admin_info` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(300) NOT NULL,
  `admin_password` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `admin_info`
--

INSERT INTO `admin_info` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'admin', 'vanphuc@gmail.com', '123');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'HP'),
(2, 'Samsung'),
(3, 'Apple'),
(4, 'motorolla'),
(5, 'LG'),
(6, 'Cloth Brand');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(6, 26, '::1', 4, 1),
(9, 10, '::1', 7, 1),
(10, 11, '::1', 7, 1),
(44, 5, '::1', 3, 0),
(46, 2, '::1', 3, 0),
(48, 72, '::1', 3, 0),
(49, 60, '::1', 8, 1),
(51, 1, '::1', 8, 1),
(52, 5, '::1', 9, 1),
(53, 2, '::1', 14, 1),
(54, 3, '::1', 14, 1),
(55, 5, '::1', 14, 1),
(56, 1, '::1', 9, 1),
(57, 2, '::1', 9, 1),
(71, 61, '127.0.0.1', -1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(1, 'Macbook'),
(2, 'Hp'),
(3, 'Asus'),
(4, 'Acer'),
(5, 'Lenovo');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `email_info`
--

CREATE TABLE `email_info` (
  `email_id` int(100) NOT NULL,
  `email` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `email_info`
--

INSERT INTO `email_info` (`email_id`, `email`) VALUES
(3, 'admin@gmail.com'),
(4, 'puneethreddy951@gmail.com'),
(5, 'puneethreddy@gmail.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `trx_id` varchar(255) NOT NULL,
  `p_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`, `trx_id`, `p_status`) VALUES
(1, 12, 7, 1, '07M47684BS5725041', 'Completed'),
(2, 14, 2, 1, '07M47684BS5725041', 'Completed');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders_info`
--

CREATE TABLE `orders_info` (
  `order_id` int(10) NOT NULL,
  `user_id` int(11) NOT NULL,
  `f_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `zip` int(10) NOT NULL,
  `cardname` varchar(255) NOT NULL,
  `cardnumber` varchar(20) NOT NULL,
  `expdate` varchar(255) NOT NULL,
  `prod_count` int(15) DEFAULT NULL,
  `total_amt` int(15) DEFAULT NULL,
  `cvv` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `orders_info`
--

INSERT INTO `orders_info` (`order_id`, `user_id`, `f_name`, `email`, `address`, `city`, `state`, `zip`, `cardname`, `cardnumber`, `expdate`, `prod_count`, `total_amt`, `cvv`) VALUES
(1, 12, 'Puneeth', 'puneethreddy951@gmail.com', 'Bangalore, Kumbalagodu, Karnataka', 'Bangalore', 'Karnataka', 560074, 'pokjhgfcxc', '4321 2345 6788 7654', '12/90', 3, 77000, 1234),
(2, 12, 'phuc dang', 'phuc@gmail.com', 'binhduong', 'tr', 'tr', 0, '', '', '', 1, 30500000, 0),
(3, 12, 'phuc dang', 'phuc@gmail.com', 'binhduong', 'tr', 'ter', 0, '', '', '', 1, 29000000, 0),
(4, 12, 'phuc dang', 'phuc@gmail.com', 'binhduong', 'tr', 'tr', 0, '', '', '', 1, 30500000, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_products`
--

CREATE TABLE `order_products` (
  `order_pro_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(15) DEFAULT NULL,
  `amt` int(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `order_products`
--

INSERT INTO `order_products` (`order_pro_id`, `order_id`, `product_id`, `qty`, `amt`) VALUES
(73, 1, 1, 1, 5000),
(74, 1, 4, 2, 64000),
(75, 1, 8, 1, 40000),
(91, 2, 1, 1, 30500000),
(92, 3, 5, 1, 29000000),
(93, 4, 1, 1, 30500000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(100) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_desc`, `product_image`, `product_keywords`) VALUES
(1, 1, 2, 'Apple MacBook Air M1 16GB 256GB 2020 I Chính hãng Apple', 30500000, 'hello', 'macbook1.png', 'macbook'),
(2, 1, 3, 'Apple MacBook Air M1 16GB 512GB 2020 ', 25000000, 'Apple MacBook Air ', 'macbook2.png', 'mobile iphone apple'),
(3, 1, 3, 'Apple MacBook Air M1 512GB 2020 I I Chính hãng Apple Vi?t Nam', 55000000, 'Apple MacBook Air M1 512GB 2020 I', 'macbook3.png', 'Apple MacBook '),
(4, 1, 3, 'Apple MacBook Air M1 16GB 512GB 2020 ', 32000, 'Apple MacBook Air M1 16GB 512GB 2020 ', 'macbook4.png', 'Apple MacBook Air M1 16GB 512GB 2020 '),
(5, 1, 2, 'MacBook Pro Touch 16 inch 2019', 29000000, 'MacBook Pro Touch 16 inch 2019', 'macbook5.png', 'MacBook Pro Touch 16 inch 2019'),
(7, 1, 1, 'Apple MacBook Pro Touch 2020 i5 256GB (MXK32SA/A)', 45000000, 'Apple MacBook Pro Touch 2020 i5 256GB (MXK32SA/A)', 'laptop_PNG5930.png', 'Apple MacBook Pro Touch 2020 i5 256GB (MXK32SA/A)'),
(8, 1, 4, 'Apple Macbook Pro 2019 Touch i5 2.4GHz/8GB/256GB', 40000000, 'Apple Macbook Pro 2019 Touch i5 2.4GHz/8GB/256GB', 'macbook7.png', 'Apple Macbook Pro 2019 Touch i5 2.4GHz/8GB/256GB'),
(9, 1, 3, 'Macbook Pro 2018 256GB', 12000, 'Macbook Pro 2018 256GB', 'macbook6.png', 'Macbook Pro 2018 256GB'),
(10, 2, 6, 'HP Pavilion Gaming 15 dk1159TX i7 10750H', 39000000, 'HP Pavilion Gaming 15 dk1159TX i7 10750H', 'hp1.png', 'HP Pavilion Gaming 15 dk1159TX i7 10750H'),
(11, 2, 6, 'HP Pavilion 15 eg0505TU i5 1135G7 (46M02PA)', 28000000, 'HP Pavilion 15 eg0505TU i5 1135G7 (46M02PA)', 'hp2.png', 'HP Pavilion 15 eg0505TU i5 1135G7 (46M02PA)'),
(12, 2, 6, 'HP 340s G7 i5 1035G1 (36A35PA)', 45000000, 'HP 340s G7 i5 1035G1 (36A35PA)', 'hp3.png', 'HP 340s G7 i5 1035G1 (36A35PA)'),
(13, 2, 6, 'HP Omen 15 ek0079TX RTX2060', 23000000, 'HP Omen 15 ek0079TX RTX2060', 'hp4.png', 'HP Omen 15 ek0079TX RTX2060'),
(14, 2, 6, 'HP EliteBook X360 1030 G8 i7 1165G7 (3G1C4PA)', 34000000, 'HP EliteBook X360 1030 G8 i7 1165G7 (3G1C4PA)', 'hp5.png', 'HP EliteBook X360 1030 G8 i7 1165G7 (3G1C4PA)'),
(15, 2, 6, 'HP 340s G7 i5 1035G1 (36A35PA)', 16000000, 'HP 340s G7 i5 1035G1 (36A35PA)', 'hp7.png', 'HP 340s G7 i5 1035G1 (36A35PA)'),
(16, 3, 6, 'Asus ZenBook Duo UX482EG i5 1135G7 (KA166T)', 24000000, 'Asus ZenBook Duo UX482EG i5 1135G7 (KA166T)', 'asus2.png\r\n', 'Asus ZenBook Duo UX482EG i5 1135G7 (KA166T)'),
(17, 3, 6, 'Asus ZenBook Flip UX363EA 13 i5 1135G7 (HP130T)', 21000000, 'Asus ZenBook Flip UX363EA 13 i5 1135G7 (HP130T)', 'asus3.png', 'Asus ZenBook Flip UX363EA 13 i5 1135G7 (HP130T)'),
(19, 3, 6, 'Asus ZenBook UX425EA i5 1135G7 (KI429T)', 30000000, 'Asus ZenBook UX425EA i5 1135G7 (KI429T)', 'asus1.png', 'Asus ZenBook UX425EA i5 1135G7 (KI429T)'),
(20, 3, 6, 'Asus ZenBook 15 UX533FD i7 8565U (A9027T)', 16000000, 'Asus ZenBook 15 UX533FD i7 8565U (A9027T)', 'asus4.png', 'Asus ZenBook 15 UX533FD i7 8565U (A9027T)'),
(21, 3, 6, 'Asus ZenBook UX362FA i5 8265U (EL205T)', 18000000, 'Asus ZenBook UX362FA i5 8265U (EL205T)', 'asus5.png', 'Asus ZenBook UX362FA i5 8265U (EL205T)'),
(27, 4, 6, 'HP ZBook FireFly 14 G7 i5 10210U (8VK70AV)', 23000000, 'HP ZBook FireFly 14 G7 i5 10210U (8VK70AV)', 'hp9.png', 'HP ZBook FireFly 14 G7 i5 10210U (8VK70AV)'),
(33, 6, 2, 'Refrigerator', 35000, 'Refrigerator', 'CT_WM_BTS-BTC-AppliancesHome_20150723.jpg', 'refrigerator samsung'),
(34, 6, 4, 'Emergency Light', 1000, 'Emergency Light', 'emergency light.JPG', 'emergency light'),
(35, 5, 5, 'Lenovo ThinkBook 14IIL i7 1065G7 (20SL00MEVN)', 36000000, 'Lenovo ThinkBook 14IIL i7 1065G7 (20SL00MEVN)', 'lenovo3.png', 'Lenovo ThinkBook 14IIL i7 1065G7 (20SL00MEVN)'),
(36, 5, 5, 'Lenovo Yoga Duet 7 13IML05 i5 10210U (82AS007BVN)', 25000000, 'Lenovo Yoga Duet 7 13IML05 i5 10210U (82AS007BVN)', 'lenovo2.png', 'Lenovo Yoga Duet 7 13IML05 i5 10210U (82AS007BVN)'),
(37, 5, 5, 'Lenovo Yoga 7 14ITL5 i7 1165G7 (82BH00CKVN)', 20000000, 'Lenovo Yoga 7 14ITL5 i7 1165G7 (82BH00CKVN)', 'lenovo1.png', 'Lenovo Yoga 7 14ITL5 i7 1165G7 (82BH00CKVN)'),
(38, 6, 4, 'Microwave Oven', 3500, 'Microwave Oven', 'images.jpg', 'Microwave Oven'),
(39, 6, 5, 'Mixer Grinder', 2500, 'Mixer Grinder', 'singer-mixer-grinder-mg-46-medium_4bfa018096c25dec7ba0af40662856ef.jpg', 'Mixer Grinder'),
(45, 1, 2, 'Samsung Galaxy Note 3', 10000, '0', 'samsung_galaxy_note3_note3neo.JPG', 'samsung galaxy Note 3 neo'),
(46, 1, 2, 'Samsung Galaxy Note 3', 10000, '', 'samsung_galaxy_note3_note3neo.JPG', 'samsung galxaxy note 3 neo'),
(47, 4, 6, 'Acer Aspire 7 Gaming A715 75G 52S5 i5 9300H (NH.Q85SV.002)', 25000000, 'Acer Aspire 7 Gaming A715 75G 52S5 i5 9300H (NH.Q85SV.002)', 'acer2.png', 'Acer Aspire 7 Gaming A715 75G 52S5 i5 9300H (NH.Q85SV.002)'),
(54, 3, 6, 'Lenovo IdeaPad Gaming 3 15IMH05 i7 10750H', 29000000, 'Lenovo IdeaPad Gaming 3 15IMH05 i7 10750H', 'lenovo1.png', 'Lenovo IdeaPad Gaming 3 15IMH05 i7 10750H'),
(64, 3, 6, 'Asus VivoBook X415EA i3 1115G4 (EB263T)', 46000000, 'Asus VivoBook X415EA i3 1115G4 (EB263T)', 'asus1.png', 'Asus VivoBook X415EA i3 1115G4 (EB263T)'),
(70, 3, 6, 'Asus TUF Gaming FX506LH i5 10300H (BQ046T)', 39900000, 'Asus TUF Gaming FX506LH i5 10300H (BQ046T)', 'asus3.png', 'Asus TUF Gaming FX506LH i5 10300H (BQ046T)'),
(71, 1, 2, 'Macbook Pro 2018 256GB', 5000, 'Macbook Pro 2018 256GB', 'macbook5.png', 'Macbook Pro 2018 256GB'),
(72, 7, 2, 'MacBook Air M1 2020 Silver (MGN93SA/A)', 35000000, 'MacBook Air M1 2020 Silver (MGN93SA/A)', 'macbook3.png', 'MacBook Air M1 2020 Silver (MGN93SA/A)'),
(73, 7, 2, 'samsung Headphones', 3500, 'samsung Headphones', 'product05.png', 'samsung Headphones electronics gadgets'),
(74, 1, 1, 'HP i5 laptop', 5500, 'HP i5 laptop', 'product01.png', 'HP i5 laptop electronics'),
(75, 1, 1, 'HP i7 laptop 8gb ram', 5500, 'HP i7 laptop 8gb ram', 'product03.png', 'HP i7 laptop 8gb ram electronics'),
(77, 1, 4, 'MSV laptop 16gb ram NVIDEA Graphics', 5499, 'MSV laptop 16gb ram', 'product06.png', 'MSV laptop 16gb ram NVIDEA Graphics electronics'),
(78, 1, 5, 'dell laptop 8gb ram intel integerated Graphics', 4579, 'dell laptop 8gb ram intel integerated Graphics', 'product08.png', 'dell laptop 8gb ram intel integerated Graphics electronics'),
(79, 7, 2, 'camera with 3D pixels', 2569, 'camera with 3D pixels', 'product09.png', 'camera with 3D pixels camera electronics gadgets'),
(80, 1, 1, 'MacBook Air M1 2020 Gold (MGNE3SA/A)', 35000000, 'MacBook Air M1 2020 Gold (MGNE3SA/A)', 'macbook4.png', 'MacBook Air M1 2020 Gold (MGNE3SA/A)'),
(81, 4, 6, 'Acer Nitro 5 Gaming AN515 45 R3SM R5 5600H/144Hz', 30000000, 'Acer Nitro 5 Gaming AN515 45 R3SM R5 5600H/144Hz', 'acer1.png', 'Acer Nitro 5 Gaming AN515 45 R3SM R5 5600H/144Hz');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'phuc', 'dang', 'phuc@gmail.com', '123', '9448121558', 'binhduong', 'tr');

--
-- Bẫy `user_info`
--
DELIMITER $$
CREATE TRIGGER `after_user_info_insert` AFTER INSERT ON `user_info` FOR EACH ROW BEGIN 
INSERT INTO user_info_backup VALUES(new.user_id,new.first_name,new.last_name,new.email,new.password,new.mobile,new.address1,new.address2);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_info_backup`
--

CREATE TABLE `user_info_backup` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `user_info_backup`
--

INSERT INTO `user_info_backup` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(12, 'puneeth', 'Reddy', 'puneethreddy951@gmail.com', '123456789', '9448121558', '123456789', 'sdcjns,djc'),
(14, 'hemanthu', 'reddy', 'hemanthreddy951@gmail.com', '123456788', '6526436723', 's,dc wfjvnvn', 'b efhfhvvbr'),
(15, 'hemu', 'ajhgdg', 'keeru@gmail.com', '346778', '536487276', ',mdnbca', 'asdmhmhvbv'),
(16, 'venky', 'vs', 'venkey@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(19, 'abhishek', 'bs', 'abhishekbs@gmail.com', 'asdcsdcc', '9871236534', 'bangalore', 'hassan'),
(20, 'pramod', 'vh', 'pramod@gmail.com', '124335353', '9767645653', 'ksbdfcdf', 'sjrgrevgsib'),
(21, 'prajval', 'mcta', 'prajvalmcta@gmail.com', '1234545662', '202-555-01', 'bangalore', 'kumbalagodu'),
(22, 'puneeth', 'v', 'hemu@gmail.com', '1234534', '9877654334', 'snhdgvajfehyfygv', 'asdjbhfkeur'),
(23, 'hemanth', 'reddy', 'hemanth@gmail.com', 'Puneeth@123', '9876543234', 'Bangalore', 'Kumbalagodu'),
(24, 'newuser', 'user', 'newuser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu'),
(25, 'otheruser', 'user', 'otheruser@gmail.com', 'puneeth@123', '9535688928', 'Bangalore', 'Kumbalagodu');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin_info`
--
ALTER TABLE `admin_info`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Chỉ mục cho bảng `email_info`
--
ALTER TABLE `email_info`
  ADD PRIMARY KEY (`email_id`);

--
-- Chỉ mục cho bảng `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Chỉ mục cho bảng `orders_info`
--
ALTER TABLE `orders_info`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_products`
--
ALTER TABLE `order_products`
  ADD PRIMARY KEY (`order_pro_id`),
  ADD KEY `order_products` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Chỉ mục cho bảng `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `user_info_backup`
--
ALTER TABLE `user_info_backup`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin_info`
--
ALTER TABLE `admin_info`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `email_info`
--
ALTER TABLE `email_info`
  MODIFY `email_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `orders_info`
--
ALTER TABLE `orders_info`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `order_products`
--
ALTER TABLE `order_products`
  MODIFY `order_pro_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT cho bảng `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT cho bảng `user_info_backup`
--
ALTER TABLE `user_info_backup`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders_info`
--
ALTER TABLE `orders_info`
  ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `user_info` (`user_id`);

--
-- Các ràng buộc cho bảng `order_products`
--
ALTER TABLE `order_products`
  ADD CONSTRAINT `order_products` FOREIGN KEY (`order_id`) REFERENCES `orders_info` (`order_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `product_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
