-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 06, 2023 at 03:22 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sixproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `creationDate`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '2017-01-24 16:21:18', '21-06-2018 08:27:55 PM');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(7, 'MEN', 'Fashion forward clothing for men, blending style and comfort effortlessly.', '2023-07-09 11:25:13', NULL),
(8, 'WOMEN', 'Trendy and stylish clothing designed specifically for women.', '2023-07-09 11:28:16', NULL),
(9, 'ACCESSORIES', 'Stylish additions that enhance and complement your outfits', '2023-07-09 11:29:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `item_rating`
--

CREATE TABLE `item_rating` (
  `ratingId` int(11) NOT NULL,
  `productId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `ratingNumber` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `comments` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `modified` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `item_rating`
--

INSERT INTO `item_rating` (`ratingId`, `productId`, `userId`, `ratingNumber`, `title`, `comments`, `created`, `modified`, `status`) VALUES
(52, 23, 13, 5, 'rate', 'nice', '2023-11-23 04:11:38', '2023-11-23 04:11:38', 0),
(53, 93, 13, 5, 'rating item', 'awesome', '2023-11-23 04:14:14', '2023-11-23 04:14:14', 0),
(54, 74, 13, 4, 'rate', 'Very nice product', '2023-11-23 04:15:04', '2023-11-23 04:15:04', 0),
(55, 23, 12, 4, 'review', 'amazing', '2023-11-23 04:16:58', '2023-11-23 04:16:58', 0),
(56, 93, 12, 5, 'rating item', 'awesome', '2023-11-23 04:17:52', '2023-11-23 04:17:52', 0),
(57, 25, 12, 4, 'review', 'nice', '2023-11-25 14:07:24', '2023-11-25 14:07:24', 0),
(58, 25, 14, 5, 'product review', 'nice', '2023-11-25 14:14:44', '2023-11-25 14:14:44', 0),
(59, 31, 13, 3, 'review', 'nice', '2023-11-25 20:31:29', '2023-11-25 20:31:29', 0),
(60, 53, 13, 4, 'review', 'nice', '2023-11-25 21:22:52', '2023-11-25 21:22:52', 0),
(61, 24, 12, 1, 'rate', 'not so good', '2023-11-26 16:27:23', '2023-11-26 16:27:23', 0),
(62, 23, 14, 1, 'review', 'nice', '2023-11-26 23:57:24', '2023-11-26 23:57:24', 0),
(63, 23, 14, 1, 'review', 'nice', '2023-11-26 23:57:25', '2023-11-26 23:57:25', 0),
(64, 32, 14, 5, 'review', 'good', '2023-11-26 23:58:35', '2023-11-26 23:58:35', 0),
(65, 32, 14, 5, 'review', 'good', '2023-11-26 23:58:37', '2023-11-26 23:58:37', 0),
(66, 76, 13, 2, 'review', 'nice', '2023-11-27 01:32:26', '2023-11-27 01:32:26', 0),
(67, 75, 13, 5, 'review', 'nice', '2023-11-27 02:06:20', '2023-11-27 02:06:20', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `orderDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `paymentMethod` varchar(50) NOT NULL DEFAULT 'Paid By Khalti',
  `orderStatus` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `userId`, `productId`, `quantity`, `orderDate`, `paymentMethod`, `orderStatus`) VALUES
(110, 12, '23', 1, '2023-11-27 02:14:24', 'Paid By Khalti', 'Delivered'),
(111, 12, '24', 1, '2023-11-27 02:14:24', 'Paid By Khalti', NULL),
(112, 12, '52', 1, '2023-11-27 02:26:51', 'Paid By Khalti', NULL),
(113, 14, '52', 3, '2023-11-27 04:46:51', 'Paid By Khalti', 'Cancelled'),
(114, 14, '53', 1, '2023-11-27 04:46:51', 'Paid By Khalti', NULL),
(115, 14, '24', 1, '2023-12-05 11:31:15', 'Paid By Khalti', NULL),
(116, 14, '52', 1, '2023-12-05 11:31:16', 'Paid By Khalti', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ordertrackhistory`
--

CREATE TABLE `ordertrackhistory` (
  `id` int(11) NOT NULL,
  `orderId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ordertrackhistory`
--

INSERT INTO `ordertrackhistory` (`id`, `orderId`, `status`, `remark`, `postingDate`) VALUES
(5, 110, 'Delivered', 'good', '2023-11-27 04:51:04');

-- --------------------------------------------------------

--
-- Table structure for table `productreviews`
--

CREATE TABLE `productreviews` (
  `id` int(11) NOT NULL,
  `productId` int(11) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `review` longtext DEFAULT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `productreviews`
--

INSERT INTO `productreviews` (`id`, `productId`, `quality`, `price`, `value`, `rating`, `name`, `summary`, `review`, `reviewDate`) VALUES
(5, 24, 5, 3, 4, 0, 'Asha Silwal', 'Good', 'This product is good.', '2023-07-13 12:39:37'),
(6, 24, 5, 5, 5, 0, 'Sita', 'Best', 'Best Product', '2023-07-13 12:42:35'),
(7, 24, 5, 5, 5, 0, 'Sita', 'Best', 'Best Product', '2023-07-13 12:45:04'),
(8, 24, 5, 5, 5, 0, 'Sita', 'Best', 'Best Product', '2023-07-13 12:47:27'),
(9, 24, 5, 5, 5, 0, 'Sita', 'Best', 'Best Product', '2023-07-13 12:48:16'),
(10, 24, 1, 2, 1, 0, 'Hari', 'bad', 'not so good', '2023-07-13 13:14:18');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `subCategory` int(11) DEFAULT NULL,
  `productName` varchar(255) DEFAULT NULL,
  `productCompany` varchar(255) DEFAULT NULL,
  `productPrice` int(11) DEFAULT NULL,
  `productPriceBeforeDiscount` int(11) DEFAULT NULL,
  `productDescription` longtext DEFAULT NULL,
  `productImage1` varchar(255) DEFAULT NULL,
  `productImage2` varchar(255) DEFAULT NULL,
  `productImage3` varchar(255) DEFAULT NULL,
  `shippingCharge` int(11) DEFAULT NULL,
  `productAvailability` varchar(255) DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category`, `subCategory`, `productName`, `productCompany`, `productPrice`, `productPriceBeforeDiscount`, `productDescription`, `productImage1`, `productImage2`, `productImage3`, `shippingCharge`, `productAvailability`, `postingDate`, `updationDate`) VALUES
(22, 7, 13, 'Black Color Gucci T-Shirt', 'Gucci', 1800, 2000, 'A fashionable and high-quality shirt by the luxury brand Gucci, known for its iconic logo and exquisite designs.<br>', NULL, NULL, 'guccit3.jpg', 100, 'In Stock', '2023-07-09 11:41:57', NULL),
(23, 7, 13, 'White Color Chanel T-Shirt', 'Chanel', 1700, 2000, 'A classic and iconic piece featuring the renowned Chanel logo, embodying timeless elegance and luxury.<br>', NULL, NULL, 'chanelt2.jpg', 200, 'In Stock', '2023-07-09 11:46:59', NULL),
(24, 7, 13, 'Chanel Logo Print T-Shirt', 'Chanel', 2700, 3000, 'A classic and iconic piece featuring the renowned Chanel logo, embodying timeless elegance and luxury.<br>', NULL, NULL, 'chanelt3.jpg', 200, 'In Stock', '2023-07-09 11:48:19', NULL),
(25, 7, 14, 'Printed Shirt', 'Guess', 2500, 3000, 'A stylish black shirt with a floral print from the brand Guess.<br>', NULL, NULL, 'guesss2.jpg', 300, 'In Stock', '2023-07-09 11:52:18', NULL),
(26, 7, 14, 'Two Mixed Color Shirt', 'Guess', 1500, 2000, 'A trendy shirt featuring a combination of vibrant colors, adding a unique and eye-catching element to your wardrobe.<br>', 'shirt.jpg', NULL, 'shirt.jpg', 250, 'In Stock', '2023-07-09 11:54:57', NULL),
(27, 7, 14, 'Checked Shirt', 'Zara', 3800, 4000, '&nbsp;A fashionable button-down shirt with a trendy checked pattern, perfect for adding a touch of style to your casual or formal look.<br>', NULL, NULL, 'zaras2.jpg', 100, 'In Stock', '2023-07-09 11:56:57', NULL),
(28, 7, 14, 'Plain Formal Shirt', 'Zara', 3600, 4000, 'A sleek and minimalist button-down shirt perfect for professional occasions, featuring a clean design and high-quality fabric.<br>', NULL, NULL, 'zaras1.jpg', 300, 'In Stock', '2023-07-09 11:59:40', NULL),
(29, 7, 15, 'Golden Printed Blazer In Black Color', 'H And M', 6300, 7000, 'A sleek and sophisticated blazer featuring a black color with elegant golden printed designs, adding a touch of luxury to your ensemble.<br>', NULL, NULL, 'hmb1.jpg', 300, 'In Stock', '2023-07-09 12:05:26', NULL),
(30, 7, 15, 'White Color Blazer', 'H And M', 8500, 9000, '&nbsp;A sleek and fashionable white blazer from H&amp;M, crafted with meticulous attention to detail and a modern aesthetic.<br>', NULL, NULL, 'hmb2.jpg', 300, 'In Stock', '2023-07-09 12:08:25', NULL),
(31, 7, 15, 'Two-Tone Color Blazer', 'Zara', 5100, 6000, 'A versatile blazer featuring a unique two-tone color scheme, adding a modern twist to your professional or casual look.<br>', NULL, NULL, 'zarab1.jpeg', 400, 'In Stock', '2023-07-09 12:11:30', NULL),
(32, 7, 15, 'Checked Pattern Blazer', 'Zara', 7000, 7500, 'Zara Checked Design Blazer: A trendy blazer featuring a stylish checked pattern, perfect for adding a touch of sophistication to any outfit.<br>', NULL, NULL, 'hmb3.jpg', 300, 'In Stock', '2023-07-09 12:14:09', NULL),
(33, 7, 15, 'Dark Olive Color Blazer', 'Zara', 5400, 6000, 'Zara Dark Olive Design Blazer: A sophisticated and trendy blazer in a rich dark olive color, perfect for adding a touch of elegance to any outfit.<br>', NULL, NULL, 'zarab3.jpg', 300, 'In Stock', '2023-07-09 12:16:23', NULL),
(34, 7, 16, 'Simple Formal Pant', 'H And M', 2700, 3000, 'A sleek and versatile pair of trousers designed for a polished and professional look.<br>', NULL, NULL, 'hmp1.jpg', 100, 'In Stock', '2023-07-09 12:19:14', NULL),
(35, 7, 16, 'Grey Colored Pant ', 'Zara', 1700, 2000, 'Sleek and versatile bottoms in a chic shade of grey, perfect for any occasion.<br>', NULL, NULL, 'hmp2.jpg', 100, 'In Stock', '2023-07-09 12:23:40', NULL),
(36, 7, 16, 'Cream Colored Pant', 'Guess', 1500, 2000, 'Sleek and versatile bottoms in a chic shade of cream, perfect for any occasion.<br>', NULL, NULL, 'hmp3.jpg', 200, 'In Stock', '2023-07-09 12:25:12', NULL),
(37, 7, 17, 'Dark Olive Color Jacket', 'Prada', 3800, 4000, 'A stylish outerwear piece in a deep green shade, perfect for adding a touch of sophistication to any outfit.<br>', NULL, NULL, 'pradaj3.jpg', 100, 'In Stock', '2023-07-09 12:28:58', NULL),
(38, 7, 17, 'White And Black Jacket', 'Prada', 2700, 3000, 'A stylish outerwear piece in a black and white shade, perfect for adding a touch of sophistication to any outfit.<br>', NULL, NULL, 'pradaj2.jpg', 200, 'In Stock', '2023-07-09 12:30:52', NULL),
(39, 7, 17, 'Black Color Winter Jacket', 'Prada', 4500, 5000, 'A stylish outerwear piece in a black shade, perfect for adding a touch of sophistication to any outfit.<br>', NULL, NULL, 'pradaj1.jpg', 300, 'In Stock', '2023-07-09 12:32:57', NULL),
(40, 7, 18, 'Unique  Color Pattern Hoodie', 'Guess', 2700, 3000, 'A standout hoodie featuring a distinct and eye-catching color scheme that sets it apart from the rest.<br>', NULL, NULL, 'guessh3.jpg', 200, 'In Stock', '2023-07-09 12:35:15', NULL),
(41, 7, 18, 'White Color Hoodie', 'Guess', 2500, 3000, 'A standout hoodie featuring a distinct and eye-catching white color scheme that sets it apart from the rest.<br>', NULL, NULL, 'guessh1.jpg', 300, 'In Stock', '2023-07-09 12:36:50', NULL),
(42, 7, 18, 'Mixed Color Pattern Hoodie', 'Puma', 1500, 2000, 'A standout hoodie featuring a distinct and eye-catching color scheme that sets it apart from the rest.<br>', NULL, NULL, 'pumah2.jpg', 200, 'In Stock', '2023-07-09 12:38:30', NULL),
(43, 7, 18, 'Two In One Color Hoodie', 'Puma', 2700, 3000, 'A standout hoodie featuring a distinct and eye-catching color scheme that sets it apart from the rest.<br>', NULL, NULL, 'pumah1.jpg', 200, 'In Stock', '2023-07-09 12:39:31', NULL),
(44, 8, 19, 'Pink Color Gucci T-Shirt ', 'Gucci', 1200, 1500, '&nbsp;A fashionable and feminine pink t-shirt designed by Gucci for women.<br>', NULL, NULL, 'guccit2.jpg', 100, 'In Stock', '2023-07-09 14:47:18', NULL),
(45, 8, 19, 'White Colored Gucci Logo Print T-Shirt For Women', 'Gucci', 1600, 2000, '&nbsp;A fashionable and feminine white t-shirt designed by Gucci for women.<br>', NULL, NULL, 'guccit1.jpg', 200, 'In Stock', '2023-07-09 14:49:13', NULL),
(46, 8, 19, 'Black Color Channel T-Shirt For Women', 'Chanel', 1500, 2000, 'A classic and sophisticated black t-shirt from Chanel, exuding timeless elegance and style.<br>', NULL, NULL, 'chanelt2.jpg', 250, 'In Stock', '2023-07-09 14:51:03', NULL),
(47, 8, 19, 'White Color Channel T-Shirt For Women', 'Chanel', 1800, 2000, 'A classic and sophisticated white t-shirt from Chanel, exuding timeless elegance and style.<br>', NULL, NULL, 'chanelt1.jpg', 100, 'In Stock', '2023-07-09 14:52:02', NULL),
(48, 8, 20, 'Jeans Pant For Women', 'Gucci', 2500, 3000, 'Versatile and timeless pants that offer a comfortable and fashionable option for everyday wear, featuring a variety of cuts, washes, and styles.<br>', NULL, NULL, 'guccip2.jpg', 200, 'In Stock', '2023-07-09 14:54:33', NULL),
(49, 8, 20, 'Sports Trouser For Women', 'Adidas', 2400, 3000, 'Comfortable and functional athletic pants designed to support active movement during sports and fitness activities.<br>', NULL, NULL, 'adidasp1.jpg', 200, 'In Stock', '2023-07-09 14:56:52', NULL),
(50, 8, 20, 'High Waisted Jeans For Women', 'Gucci', 2700, 2900, 'Flattering denim bottoms that sit above the natural waistline, accentuating curves and providing a sleek, retro-inspired look.<br>', NULL, NULL, 'guccip1.jpg', 100, 'In Stock', '2023-07-09 14:58:46', NULL),
(51, 8, 20, 'White Pant For Women', 'Chanel', 2400, 3000, 'Versatile and chic bottoms that bring a fresh and modern touch to any outfit.<br>', NULL, NULL, 'guccip3.jpg', 300, 'In Stock', '2023-07-09 15:02:03', NULL),
(52, 8, 21, 'Sports Jacket For Women', 'Adidas', 2200, 3000, 'A sleek and sporty outerwear option designed for comfort and style, featuring the iconic Adidas logo.<br>', NULL, NULL, 'adidasj1.jpg', 300, 'In Stock', '2023-07-09 15:03:58', NULL),
(53, 8, 21, 'Pink Color Adidas Jacket For Women ', 'Adidas', 2300, 2500, 'A sleek&nbsp; outerwear option designed for comfort and style, featuring the iconic Adidas logo.<br>', NULL, NULL, 'adidasj2.jpg', 100, 'In Stock', '2023-07-09 15:05:23', NULL),
(54, 8, 21, 'Adidas Logo Jacket For Women', 'Adidas', 2700, 3000, 'A sleek and sporty outerwear option designed for comfort and style, featuring the iconic Adidas logo.<br>', NULL, NULL, 'adidasj3.jpg', 100, 'In Stock', '2023-07-09 15:06:48', NULL),
(55, 8, 21, 'Denim Jacket For Women', 'Gucci', 3500, 4000, 'A timeless and versatile outerwear piece, perfect for adding a touch of cool and casual style to any outfit.<br>', NULL, NULL, 'guciij1.jpg', 200, 'In Stock', '2023-07-09 15:08:20', NULL),
(56, 8, 22, 'Green Color One-Piece For Women', 'Guess', 1800, 2000, 'A stunning and vibrant single-piece garment designed to flatter and empower women with a refreshing touch of green.<br>', NULL, NULL, 'guess02.jpg', 100, 'In Stock', '2023-07-09 15:10:57', NULL),
(57, 8, 22, 'Black Color One-Piece For Women', 'Guess', 1500, 2000, 'A stunning and vibrant single-piece garment designed to flatter and empower women with a refreshing touch of black.<br>', NULL, NULL, 'guesso1.jpg', 300, 'In Stock', '2023-07-09 15:12:16', NULL),
(58, 8, 22, 'Printed One-Piece For Women', 'Zara', 1800, 2000, 'A stunning and vibrant single-piece garment designed to flatter and empower women with a refreshing touch of printed color.<br>', NULL, NULL, 'zarao2.jpg', 100, 'In Stock', '2023-07-09 15:17:42', NULL),
(59, 8, 22, 'Plain Green Color One-Piece For Women', 'Zara', 1700, 2000, 'A stunning and vibrant single-piece garment designed to flatter and empower women with a refreshing touch of green.<br>', NULL, NULL, 'zarao3.jpg', 100, 'In Stock', '2023-07-09 15:18:48', NULL),
(60, 8, 23, 'Black Color Sari For Women', 'Zara', 3800, 4000, 'Traditional and elegant draped garment worn by women, typically consisting of a long piece of fabric wrapped around the body, showcasing grace and cultural heritage.<br>', NULL, NULL, 'zaras1.jpg', 100, 'In Stock', '2023-07-09 15:21:02', NULL),
(61, 8, 23, 'Two In One Color Sari For Women', 'Zara', 2700, 3000, 'Traditional and elegant draped garment worn by women, typically consisting of a long piece of fabric wrapped around the body, showcasing grace and cultural heritage.<br>', NULL, NULL, 'zaras3.jpg', 200, 'In Stock', '2023-07-09 15:21:56', NULL),
(62, 8, 23, 'Dazzling Sari For Women', 'Zara', 2700, 3000, 'A dazzling and glamorous traditional&nbsp; garment adorned with shimmering sequins or metallic embellishments, perfect for special occasions.<br>', NULL, NULL, 'zaras2.jpg', 250, 'In Stock', '2023-07-09 15:24:01', NULL),
(63, 8, 24, 'Pakistani Kurtha Set For Women', 'Guess', 1500, 3000, 'A traditional and comfortable tunic-style garment with intricate designs, often worn with leggings or pants.<br>', NULL, NULL, 'guessk2.jpg', 200, 'In Stock', '2023-07-09 15:26:17', NULL),
(64, 8, 24, 'Red Color Kurtha Set For Women', 'Zara', 2000, 2000, 'A traditional and comfortable tunic-style garment with intricate designs, often worn with leggings or pants.<br>', NULL, NULL, 'guessk3.jpg', 100, 'In Stock', '2023-07-09 15:27:44', NULL),
(65, 8, 24, 'Pink Color Kurtha Set For Women', 'H And M', 1800, 2000, 'A traditional and comfortable tunic-style garment with intricate designs, often worn with leggings or pants.<br>', NULL, NULL, 'guessk1.jpg', 100, 'In Stock', '2023-07-09 15:31:21', NULL),
(66, 8, 25, 'Floral Print Blazer Set For Women', 'Guess', 3500, 4000, 'A coordinated ensemble consisting of a blazer and matching bottoms, perfect for a polished and sophisticated look.<br>', NULL, NULL, 'guessb3.jpg', 300, 'In Stock', '2023-07-09 15:33:53', NULL),
(67, 8, 25, 'Pink Color Blazer Set For Women', 'Guess', 5500, 6000, 'A coordinated ensemble consisting of a blazer and matching bottoms, perfect for a polished and sophisticated look.<br>', NULL, NULL, 'guessb2.jpg', 200, 'In Stock', '2023-07-09 15:34:56', NULL),
(68, 8, 25, 'Printed Blazer Set For Women', 'Guess', 4700, 5000, 'A coordinated ensemble consisting of a blazer and matching bottoms, perfect for a polished and sophisticated look.<br>', NULL, NULL, 'zarab2.jpg', 150, 'In Stock', '2023-07-09 15:36:42', NULL),
(69, 8, 25, 'White Color Blazer Set For Women', 'Zara', 3800, 4000, 'A coordinated ensemble consisting of a blazer and matching bottoms, perfect for a polished and sophisticated look.<br>', NULL, NULL, 'hmb3.jpg', 100, 'In Stock', '2023-07-09 15:37:44', NULL),
(70, 8, 25, 'Checked Pattern Blazer Set For Women', 'Zara', 5600, 6000, 'A coordinated ensemble consisting of a blazer and matching bottoms, perfect for a polished and sophisticated look.<br>', NULL, NULL, 'zarab3.jpg', 200, 'In Stock', '2023-07-09 15:39:50', NULL),
(71, 8, 26, 'Long Hoodie For Women', 'Guess', 2600, 3000, 'A comfortable and versatile garment with a hood, perfect for casual and cozy style.<br>', NULL, NULL, 'hmh3.jpg', 300, 'In Stock', '2023-07-09 15:41:52', NULL),
(72, 8, 26, 'Snoopy Printed Hoodie For Women', 'H And M', 2700, 3000, 'A comfortable and versatile garment with a hood, perfect for casual and cozy style.<br>', NULL, NULL, 'hmh2.jpg', 200, 'In Stock', '2023-07-09 15:42:52', NULL),
(73, 8, 26, 'Brown Color Hoodie For Women', 'Zara', 2700, 3000, 'A comfortable and versatile garment with a hood, perfect for casual and cozy style.<br>', NULL, NULL, 'hmh1.jpg', 200, 'In Stock', '2023-07-09 15:44:06', NULL),
(74, 9, 28, 'Adidas Logo FootWear For Women', 'Adidas', 2700, 3000, 'Trendy footwear that combines style and functionality to complete your look with flair.<br>', NULL, NULL, 'adidassg1.jpg', 100, 'In Stock', '2023-07-09 15:45:22', NULL),
(75, 9, 28, 'Adidas Logo Shoes For Women', 'Adidas', 1800, 2000, 'Trendy footwear that combines style and functionality to complete your look with flair.<br>', NULL, NULL, 'adidassg3.jpg', 100, 'In Stock', '2023-07-09 15:47:21', NULL),
(76, 9, 28, 'Jordan Shoes For Women ', 'Jordan', 2700, 3000, 'Trendy footwear that combines style and functionality to complete your look with flair.<br>', NULL, NULL, 'jordansg1.jpg', 100, 'In Stock', '2023-07-09 15:48:56', NULL),
(77, 9, 27, 'Adidas Logo FootWear For Men', 'Adidas', 2700, 3000, 'Trendy footwear that combines style and functionality to complete your look with flair.<br>', NULL, NULL, 'adidassm3.jpg', 100, 'In Stock', '2023-07-09 15:49:52', NULL),
(78, 9, 27, 'Jordan Shoes For Men ', 'Jordan', 2500, 3000, 'Trendy footwear that combines style and functionality to complete your look with flair.<br>', NULL, NULL, 'jordansm1.jpg', 250, 'In Stock', '2023-07-09 15:50:51', NULL),
(79, 9, 29, 'LV bag For Men', 'Louis Vuitton', 1500, 2000, 'Trendy and functional accessories for carrying personal items, in required sizes, styles, and materials.<br>', NULL, NULL, 'louisbm3.jpg', 200, 'In Stock', '2023-07-09 15:53:31', NULL),
(80, 9, 29, 'Puma Logo Bag For Men', 'Puma', 2000, 2000, 'Trendy and functional accessories for carrying personal items, in required sizes, styles, and materials.<br>', NULL, NULL, 'pumabm3.jpg', 100, 'In Stock', '2023-07-09 15:55:27', NULL),
(81, 9, 30, 'Gucci Bag For Women', 'Gucci', 2500, 3000, 'Trendy and functional accessories for carrying personal items, in required sizes, styles, and materials.<br>', NULL, NULL, 'guccibg1.jpg', 200, 'In Stock', '2023-07-09 15:56:51', NULL),
(82, 9, 30, 'LV Bag For Women', 'Louis Vuitton', 3100, 3500, 'Trendy and functional accessories for carrying personal items, in required sizes, styles, and materials.<br>', NULL, NULL, 'louisbg2.jpg', 200, 'In Stock', '2023-07-09 15:58:35', NULL),
(83, 9, 30, 'Gucci Black Color Bag For Women', 'Gucci', 2600, 3000, 'Trendy and functional accessories for carrying personal items, in required sizes, styles, and materials.<br>', NULL, NULL, 'guccibg2.jpg', 200, 'In Stock', '2023-07-09 15:59:35', NULL),
(84, 9, 31, 'Summer Scarf For Women', 'Guess', 500, 500, 'Versatile and fashionable fabric accessory worn around the neck or as a head covering, adding elegance and warmth to any outfit.<br>', NULL, NULL, 'guesssc2.jpg', 0, 'In Stock', '2023-07-09 16:02:36', NULL),
(85, 9, 31, 'Thin Scarf For Women', 'Zara', 500, 500, 'Versatile and fashionable fabric accessory worn around the neck or as a head covering, adding elegance and warmth to any outfit.', NULL, NULL, 'zarasc1.jpg', 0, 'In Stock', '2023-07-09 16:04:12', NULL),
(86, 9, 31, 'Brown Color Scarf For Women', 'H And M', 600, 700, 'Versatile and fashionable fabric accessory worn around the neck or as a head covering, adding elegance and warmth to any outfit.<br>', NULL, NULL, 'hmsc2.jpg', 50, 'In Stock', '2023-07-09 16:05:14', NULL),
(87, 9, 32, 'Cap For Men', 'Adidas', 800, 1000, 'A headwear accessory that provides both style and protection from the sun.<br>', NULL, NULL, 'adidashm2.jpg', 100, 'In Stock', '2023-07-09 16:07:07', NULL),
(88, 9, 32, 'Black Cap For Men', 'Adidas', 950, 1100, 'A headwear accessory that provides both style and protection from the sun.<br>', NULL, NULL, 'adidashm1.jpg', 100, 'In Stock', '2023-07-09 16:08:07', NULL),
(89, 9, 32, 'Puma Logo Cap For Men', 'Puma', 800, 900, 'A headwear accessory that provides both style and protection from the sun.<br>', NULL, NULL, 'pumahm3.jpg', 50, 'In Stock', '2023-07-09 16:09:11', NULL),
(90, 9, 33, 'Adidas Cap For Women', 'Adidas', 100, 1200, 'A headwear accessory that provides both style and protection from the sun.<br>', NULL, NULL, 'adidashg1.jpg', 100, 'In Stock', '2023-07-09 16:10:32', NULL),
(91, 9, 33, 'Women-Adidas Cap ', 'Adidas', 700, 1000, 'A headwear accessory that provides both style and protection from the sun.<br>', NULL, NULL, 'adidashg3.jpg', 150, 'In Stock', '2023-07-09 16:12:37', NULL),
(92, 9, 33, 'H And M Cap For Women', 'H And M', 800, 1000, 'A headwear accessory that provides both style and protection from the sun.<br>', NULL, NULL, 'hmhg2.jpg', 100, 'In Stock', '2023-07-09 16:13:40', NULL),
(93, 9, 35, 'Gucci Perfume For Women', 'Gucci', 3800, 4000, 'Captivating scents that evoke femininity and add an alluring touch to any occasion.<br>', NULL, NULL, 'guccipg1.jpg', 100, 'In Stock', '2023-07-09 16:16:05', NULL),
(94, 9, 35, 'Women-Gucci Perfume', 'Gucci', 2700, 3000, 'Captivating scents that evoke femininity and add an alluring touch to any occasion.<br>', NULL, NULL, 'guccipg2.jpg', 100, 'In Stock', '2023-07-09 16:16:58', NULL),
(95, 9, 35, 'Women-Perfume-Gucci', 'Gucci', 3800, 4000, 'Captivating scents that evoke femininity and add an alluring touch to any occasion.<br>', NULL, NULL, 'guccipg3.jpg', 100, 'In Stock', '2023-07-09 16:18:00', NULL),
(96, 9, 35, 'Chanel-Perfume For Women', 'Chanel', 2500, 3000, 'Captivating scents that evoke femininity and add an alluring touch to any occasion.<br>', 'chanelpg1.png', NULL, 'chanelpg3.jpg', 200, 'In Stock', '2023-07-09 16:20:02', NULL),
(97, 9, 35, 'Women-Chanel Perfume', 'Chanel', 3800, 4000, 'Captivating scents that evoke femininity and add an alluring touch to any occasion.<br>', NULL, NULL, 'chanelpg1.png', 100, 'In Stock', '2023-07-09 16:21:05', NULL),
(98, 9, 35, 'Women-Chanel-Perfume ', 'Chanel', 2700, 3000, 'Captivating scents that evoke femininity and add an alluring touch to any occasion.<br>', NULL, NULL, 'chanelpg2.png', 100, 'In Stock', '2023-07-09 16:23:04', NULL),
(99, 9, 36, 'Blue Denver For Men', 'Denver', 2500, 3000, 'Invigorating scents designed to enhance confidence and leave a lasting impression.<br>', NULL, NULL, 'denver2.jpg', 200, 'In Stock', '2023-07-09 16:29:02', NULL),
(100, 9, 36, 'Black Denver For Men', 'Denver', 2700, 3000, 'Invigorating scents designed to enhance confidence and leave a lasting impression.<br>', NULL, NULL, 'denverp1.png', 100, 'In Stock', '2023-07-09 16:30:20', NULL),
(101, 9, 36, 'Green Denver For Men', 'Denver', 3800, 4000, 'Invigorating scents designed to enhance confidence and leave a lasting impression.<br>', NULL, NULL, 'denver3.jpg', 100, 'In Stock', '2023-07-09 16:31:22', NULL),
(102, 9, 36, 'Chanel-Perfume For Men', 'Chanel', 3800, 4000, 'Invigorating scents designed to enhance confidence and leave a lasting impression.<br>', NULL, NULL, 'chanelp1.png', 100, 'In Stock', '2023-07-09 16:32:26', NULL),
(103, 9, 36, 'Men-Perfume-Chanel', 'Chanel', 2700, 3000, 'Invigorating scents designed to enhance confidence and leave a lasting impression.<br>', NULL, NULL, 'chanelpm3.jpg', 100, 'In Stock', '2023-07-09 16:33:25', NULL),
(104, 9, 36, 'Men-Chanel-Perfume ', 'Chanel', 4500, 5000, 'Invigorating scents designed to enhance confidence and leave a lasting impression.<br>', NULL, NULL, 'chanelpm2.jpg', 200, 'In Stock', '2023-07-09 16:34:43', NULL),
(105, 9, 30, 'White Chanel Bag For Women', 'Chanel', 3800, 4000, 'A fashionable and functional accessory for carrying essentials, combining style and practicality.<br>', NULL, NULL, 'chanelbg1.jpg', 100, 'In Stock', '2023-07-09 16:36:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(13, 7, 'T-Shirt', '2023-07-09 11:30:36', NULL),
(14, 7, 'Shirt', '2023-07-09 11:30:43', NULL),
(15, 7, 'Blazer', '2023-07-09 11:30:52', NULL),
(16, 7, 'Pants', '2023-07-09 11:30:59', NULL),
(17, 7, 'Jacket', '2023-07-09 11:31:09', NULL),
(18, 7, 'Hoodie', '2023-07-09 11:31:16', NULL),
(19, 8, 'T-Shirt', '2023-07-09 11:31:26', NULL),
(20, 8, 'Pants', '2023-07-09 11:31:34', NULL),
(21, 8, 'Jacket', '2023-07-09 11:31:43', NULL),
(22, 8, 'Onepiece', '2023-07-09 11:31:54', NULL),
(23, 8, 'Sari', '2023-07-09 11:32:03', NULL),
(24, 8, 'Kurtha', '2023-07-09 11:32:11', NULL),
(25, 8, 'Blazer Set', '2023-07-09 11:32:24', NULL),
(26, 8, 'Hoodie', '2023-07-09 11:32:32', NULL),
(27, 9, 'Men-Shoes', '2023-07-09 11:32:50', NULL),
(28, 9, 'Women-Shoes', '2023-07-09 11:32:58', NULL),
(29, 9, 'Men-bag', '2023-07-09 11:33:07', NULL),
(30, 9, 'Women-bag', '2023-07-09 11:33:16', NULL),
(31, 9, 'Women-scarf', '2023-07-09 11:34:03', NULL),
(32, 9, 'Men-cap', '2023-07-09 11:34:13', NULL),
(33, 9, 'Women-cap', '2023-07-09 11:34:24', NULL),
(35, 9, 'Women-Perfume', '2023-07-09 11:34:59', NULL),
(36, 9, 'Men-Perfume', '2023-07-09 12:25:55', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `userip` binary(16) DEFAULT NULL,
  `loginTime` timestamp NULL DEFAULT current_timestamp(),
  `logout` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `userEmail`, `userip`, `loginTime`, `logout`, `status`) VALUES
(24, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-13 01:42:49', NULL, 0),
(25, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-13 01:43:04', NULL, 1),
(26, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-13 11:47:17', '13-07-2023 05:47:42 PM', 1),
(27, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-13 12:20:06', '13-07-2023 05:58:54 PM', 1),
(28, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-13 12:29:23', '13-07-2023 05:59:32 PM', 1),
(29, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-13 12:30:41', '13-07-2023 06:01:42 PM', 1),
(30, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-07-13 12:37:38', '13-07-2023 06:11:15 PM', 1),
(31, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-26 04:38:19', NULL, 0),
(32, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-26 04:38:35', NULL, 0),
(33, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-26 04:38:48', NULL, 0),
(34, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-26 04:39:10', NULL, 0),
(35, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-26 04:39:31', NULL, 1),
(36, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-08-27 01:30:34', NULL, 1),
(37, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-10-05 14:53:24', NULL, 1),
(38, 'Aaaa@gmail.com', 0x3a3a3100000000000000000000000000, '2023-10-18 15:14:26', NULL, 0),
(39, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-07 13:13:13', NULL, 1),
(40, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-09 14:55:01', NULL, 1),
(41, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-09 15:36:29', NULL, 1),
(42, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-09 15:46:27', NULL, 1),
(43, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-09 15:58:11', '09-11-2023 10:05:53 PM', 1),
(44, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-17 17:01:10', NULL, 1),
(45, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-18 15:41:33', NULL, 1),
(46, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-18 16:10:12', NULL, 1),
(47, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-18 16:30:20', '18-11-2023 10:40:09 PM', 1),
(48, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-19 10:59:33', '19-11-2023 06:34:10 PM', 1),
(49, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-19 12:53:46', '19-11-2023 07:11:55 PM', 1),
(50, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-19 13:27:26', NULL, 0),
(51, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-19 13:27:41', NULL, 0),
(52, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-19 13:29:10', NULL, 1),
(53, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-19 13:41:19', '19-11-2023 07:42:09 PM', 1),
(54, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-19 13:57:24', '19-11-2023 08:27:43 PM', 1),
(55, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-19 14:43:01', NULL, 1),
(56, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-20 12:53:55', NULL, 1),
(57, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-23 01:46:03', '23-11-2023 07:43:43 AM', 1),
(58, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-23 02:04:07', NULL, 1),
(59, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-23 08:23:39', '23-11-2023 02:25:53 PM', 1),
(60, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-23 08:41:07', NULL, 1),
(61, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-23 08:56:20', '23-11-2023 02:45:26 PM', 1),
(62, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-23 09:00:47', '23-11-2023 08:31:18 PM', 1),
(63, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-23 14:54:58', NULL, 1),
(64, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-23 16:10:01', NULL, 1),
(65, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-24 00:29:35', '24-11-2023 06:17:20 AM', 1),
(66, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-24 00:32:32', '24-11-2023 06:19:19 AM', 1),
(67, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-24 00:36:02', NULL, 1),
(68, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-24 01:31:37', NULL, 1),
(69, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-24 03:12:36', NULL, 1),
(70, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-24 07:17:34', '24-11-2023 03:19:27 PM', 1),
(71, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-24 15:47:22', NULL, 1),
(72, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 15:31:06', NULL, 1),
(73, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 15:43:55', NULL, 0),
(74, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 15:44:04', NULL, 0),
(75, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 15:44:15', '25-11-2023 09:39:40 PM', 1),
(76, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 15:54:58', '25-11-2023 09:42:08 PM', 1),
(77, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 15:57:21', NULL, 0),
(78, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 15:57:30', '25-11-2023 10:08:21 PM', 1),
(79, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 16:23:37', '25-11-2023 10:08:56 PM', 1),
(80, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 16:24:16', '25-11-2023 10:30:03 PM', 1),
(81, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 16:45:24', NULL, 0),
(82, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 16:45:40', NULL, 1),
(83, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 16:55:05', NULL, 0),
(84, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 16:55:15', '25-11-2023 10:41:28 PM', 1),
(85, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 16:56:49', '25-11-2023 10:44:45 PM', 1),
(86, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 17:00:04', '25-11-2023 11:09:16 PM', 1),
(87, 'sumin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 17:26:25', '25-11-2023 11:26:37 PM', 1),
(88, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 17:41:53', '25-11-2023 11:27:13 PM', 1),
(89, 'sumin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 17:42:36', NULL, 1),
(90, 'sumin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 18:00:53', '26-11-2023 12:25:16 AM', 1),
(91, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 18:31:47', NULL, 1),
(92, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 18:40:35', '26-11-2023 12:37:41 AM', 1),
(93, 'sumin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-25 18:58:57', NULL, 1),
(94, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-26 00:41:05', NULL, 0),
(95, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-26 00:41:22', '26-11-2023 07:02:17 AM', 1),
(96, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-26 01:18:36', NULL, 1),
(97, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-26 16:23:06', '26-11-2023 10:08:19 PM', 1),
(98, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-26 18:41:17', '27-11-2023 12:26:56 AM', 1),
(99, 'ram@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-26 18:45:41', '27-11-2023 12:30:59 AM', 1),
(100, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-26 18:46:20', NULL, 1),
(101, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-26 20:44:31', NULL, 1),
(102, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-26 20:50:09', NULL, 1),
(103, 'asha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-27 00:25:40', '27-11-2023 07:18:23 AM', 1),
(104, 'puja@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-27 01:33:40', NULL, 1),
(105, 'sumin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-27 04:39:47', '27-11-2023 10:33:27 AM', 1),
(106, 'sumin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-27 05:00:33', NULL, 0),
(107, 'sumin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-27 05:00:52', '27-11-2023 11:02:11 AM', 1),
(108, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-27 05:59:14', '27-11-2023 11:44:31 AM', 1),
(109, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-27 06:16:54', '27-11-2023 12:02:52 PM', 1),
(110, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-27 06:41:49', NULL, 1),
(111, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-27 15:01:59', NULL, 1),
(112, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-28 15:06:57', '28-11-2023 10:17:40 PM', 1),
(113, 'sumin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-28 16:33:16', '29-11-2023 12:32:50 AM', 1),
(114, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-28 19:05:03', '29-11-2023 01:11:41 AM', 1),
(115, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-11-29 17:12:26', '29-11-2023 10:57:33 PM', 1),
(116, 'aasha@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-03 14:44:06', NULL, 1),
(117, 'sumin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-05 11:30:31', NULL, 0),
(118, 'sumin@gmail.com', 0x3a3a3100000000000000000000000000, '2023-12-05 11:30:44', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `contactno` bigint(11) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `shippingAddress` longtext DEFAULT NULL,
  `shippingState` varchar(255) DEFAULT NULL,
  `shippingCity` varchar(255) DEFAULT NULL,
  `shippingPincode` int(11) DEFAULT NULL,
  `billingAddress` longtext DEFAULT NULL,
  `billingState` varchar(255) DEFAULT NULL,
  `billingCity` varchar(255) DEFAULT NULL,
  `billingPincode` int(11) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `updationDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `contactno`, `password`, `shippingAddress`, `shippingState`, `shippingCity`, `shippingPincode`, `billingAddress`, `billingState`, `billingCity`, `billingPincode`, `regDate`, `updationDate`) VALUES
(12, 'Puja Thapa', 'puja@gmail.com', 9876543211, '4e367ad99c6f38ca4d656c247ae30825', NULL, NULL, NULL, NULL, 'lalitpur', 'lalitpur', 'lalitpur', 123456, '2023-11-19 13:28:59', NULL),
(13, 'Aasha Silwal', 'aasha@gmail.com', 9876543212, 'ae37257974558d7e917de8e9af479f98', NULL, NULL, NULL, NULL, 'lele', 'lele', 'lele', 44600, '2023-11-23 08:56:02', NULL),
(14, 'Sumin Godar', 'sumin@gmail.com', 9876543213, 'd7b7e528a6132ba1cec1885aebe767a1', NULL, NULL, NULL, NULL, 'godwari', 'godwari', 'lele', 0, '2023-11-25 17:26:07', NULL),
(15, 'ram', 'ram@gmail.com', 9823764088, '74df827952e926c8f3aaef5e9b1e5acc', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-11-26 18:45:27', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_clicks`
--

CREATE TABLE `user_clicks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `click_timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_clicks`
--

INSERT INTO `user_clicks` (`id`, `user_id`, `product_id`, `click_timestamp`) VALUES
(1, 13, 24, '2023-11-28 15:53:36'),
(2, 13, 24, '2023-11-28 15:57:13'),
(3, 13, 24, '2023-11-28 15:57:21'),
(4, 13, 24, '2023-11-28 15:57:21'),
(5, 13, 24, '2023-11-28 15:57:21'),
(6, 13, 24, '2023-11-28 15:57:22'),
(7, 13, 24, '2023-11-28 15:58:11'),
(8, 13, 24, '2023-11-28 15:59:22'),
(9, 13, 24, '2023-11-28 16:03:31'),
(12, 13, 24, '2023-11-28 16:26:49'),
(13, 13, 24, '2023-11-28 16:32:06'),
(14, 13, 75, '2023-11-28 16:32:13'),
(15, 14, 25, '2023-11-28 16:33:22'),
(16, 14, 52, '2023-11-28 16:33:51'),
(17, 14, 52, '2023-11-28 16:42:55'),
(18, 14, 52, '2023-11-28 16:45:26'),
(19, 14, 52, '2023-11-28 16:46:11'),
(20, 14, 52, '2023-11-28 16:46:33'),
(21, 14, 52, '2023-11-28 16:47:58'),
(22, 14, 52, '2023-11-28 16:48:24'),
(23, 14, 52, '2023-11-28 16:48:50'),
(24, 14, 52, '2023-11-28 16:50:13'),
(25, 14, 52, '2023-11-28 16:50:34'),
(26, 14, 52, '2023-11-28 16:50:56'),
(27, 14, 52, '2023-11-28 16:51:43'),
(28, 14, 52, '2023-11-28 16:53:30'),
(29, 14, 52, '2023-11-28 16:54:27'),
(30, 14, 52, '2023-11-28 16:54:52'),
(31, 14, 52, '2023-11-28 16:55:15'),
(32, 14, 52, '2023-11-28 16:56:10'),
(33, 14, 52, '2023-11-28 16:56:29'),
(34, 14, 52, '2023-11-28 16:56:49'),
(35, 14, 52, '2023-11-28 16:57:12'),
(36, 14, 52, '2023-11-28 16:58:06'),
(37, 14, 52, '2023-11-28 16:58:33'),
(38, 14, 52, '2023-11-28 16:58:52'),
(39, 14, 52, '2023-11-28 17:00:01'),
(40, 14, 52, '2023-11-28 17:02:01'),
(41, 14, 52, '2023-11-28 17:03:13'),
(42, 14, 52, '2023-11-28 17:03:35'),
(43, 14, 52, '2023-11-28 17:04:24'),
(44, 14, 52, '2023-11-28 17:04:52'),
(45, 14, 52, '2023-11-28 17:06:27'),
(46, 14, 52, '2023-11-28 17:07:25'),
(47, 14, 52, '2023-11-28 17:07:43'),
(48, 14, 52, '2023-11-28 17:09:42'),
(49, 14, 52, '2023-11-28 17:09:50'),
(50, 14, 52, '2023-11-28 17:10:07'),
(51, 14, 52, '2023-11-28 17:10:29'),
(52, 14, 52, '2023-11-28 17:11:53'),
(53, 14, 52, '2023-11-28 17:12:29'),
(54, 14, 52, '2023-11-28 17:12:49'),
(55, 14, 52, '2023-11-28 17:13:11'),
(56, 14, 52, '2023-11-28 17:13:27'),
(57, 14, 52, '2023-11-28 17:14:04'),
(58, 14, 52, '2023-11-28 17:15:38'),
(59, 14, 52, '2023-11-28 17:16:10'),
(60, 14, 52, '2023-11-28 17:16:47'),
(61, 14, 52, '2023-11-28 17:17:22'),
(62, 14, 52, '2023-11-28 17:17:41'),
(63, 14, 52, '2023-11-28 17:18:00'),
(64, 14, 52, '2023-11-28 17:18:18'),
(65, 14, 52, '2023-11-28 17:20:29'),
(66, 14, 52, '2023-11-28 17:21:36'),
(67, 14, 52, '2023-11-28 17:22:08'),
(68, 14, 52, '2023-11-28 17:22:40'),
(69, 14, 52, '2023-11-28 17:23:28'),
(70, 14, 52, '2023-11-28 17:23:58'),
(71, 14, 52, '2023-11-28 17:24:14'),
(72, 14, 52, '2023-11-28 17:29:22'),
(73, 14, 52, '2023-11-28 17:30:15'),
(74, 14, 52, '2023-11-28 17:31:05'),
(75, 14, 52, '2023-11-28 17:31:18'),
(76, 14, 52, '2023-11-28 17:31:34'),
(77, 14, 52, '2023-11-28 17:31:49'),
(78, 14, 52, '2023-11-28 17:32:49'),
(79, 14, 52, '2023-11-28 17:33:29'),
(80, 14, 52, '2023-11-28 17:34:57'),
(81, 14, 52, '2023-11-28 17:35:25'),
(82, 14, 52, '2023-11-28 17:35:49'),
(83, 14, 52, '2023-11-28 17:43:25'),
(84, 14, 52, '2023-11-28 17:43:52'),
(85, 14, 52, '2023-11-28 17:44:24'),
(86, 14, 52, '2023-11-28 17:44:53'),
(87, 14, 52, '2023-11-28 17:47:39'),
(88, 14, 52, '2023-11-28 17:50:05'),
(89, 14, 52, '2023-11-28 17:51:47'),
(90, 14, 52, '2023-11-28 17:52:15'),
(91, 14, 52, '2023-11-28 17:52:38'),
(92, 14, 52, '2023-11-28 17:53:13'),
(93, 14, 52, '2023-11-28 17:53:30'),
(94, 14, 52, '2023-11-28 18:00:13'),
(95, 14, 52, '2023-11-28 18:01:05'),
(96, 14, 52, '2023-11-28 18:01:26'),
(97, 14, 52, '2023-11-28 18:01:50'),
(98, 14, 52, '2023-11-28 18:02:47'),
(99, 14, 52, '2023-11-28 18:04:18'),
(100, 14, 52, '2023-11-28 18:04:51'),
(101, 14, 52, '2023-11-28 18:05:30'),
(102, 14, 52, '2023-11-28 18:06:23'),
(103, 14, 52, '2023-11-28 18:08:11'),
(104, 14, 52, '2023-11-28 18:10:45'),
(105, 14, 52, '2023-11-28 18:14:37'),
(106, 14, 52, '2023-11-28 18:26:29'),
(107, 14, 52, '2023-11-28 18:28:10'),
(108, 14, 52, '2023-11-28 18:29:42'),
(109, 14, 53, '2023-11-28 18:31:03'),
(110, 14, 53, '2023-11-28 18:31:42'),
(111, 14, 53, '2023-11-28 18:32:16'),
(112, 14, 53, '2023-11-28 18:32:33'),
(113, 14, 53, '2023-11-28 18:32:51'),
(114, 14, 31, '2023-11-28 18:33:12'),
(115, 14, 31, '2023-11-28 18:35:34'),
(116, 14, 31, '2023-11-28 18:35:57'),
(117, 14, 31, '2023-11-28 18:36:31'),
(118, 14, 31, '2023-11-28 18:37:21'),
(119, 14, 31, '2023-11-28 18:37:45'),
(120, 14, 31, '2023-11-28 18:38:13'),
(121, 14, 31, '2023-11-28 18:39:50'),
(122, 14, 31, '2023-11-28 18:40:31'),
(123, 14, 31, '2023-11-28 18:40:59'),
(124, 14, 31, '2023-11-28 18:41:18'),
(125, 14, 31, '2023-11-28 18:41:54'),
(126, 14, 31, '2023-11-28 18:42:17'),
(127, 14, 31, '2023-11-28 18:42:40'),
(128, 14, 31, '2023-11-28 18:43:01'),
(129, 14, 31, '2023-11-28 18:47:05'),
(130, 14, 95, '2023-11-28 18:47:22');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `productId` int(11) DEFAULT NULL,
  `postingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item_rating`
--
ALTER TABLE `item_rating`
  ADD PRIMARY KEY (`ratingId`),
  ADD KEY `userId` (`userId`),
  ADD KEY `productId` (`productId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `productreviews`
--
ALTER TABLE `productreviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_clicks`
--
ALTER TABLE `user_clicks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `item_rating`
--
ALTER TABLE `item_rating`
  MODIFY `ratingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `ordertrackhistory`
--
ALTER TABLE `ordertrackhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `productreviews`
--
ALTER TABLE `productreviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `user_clicks`
--
ALTER TABLE `user_clicks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=131;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `item_rating`
--
ALTER TABLE `item_rating`
  ADD CONSTRAINT `item_rating_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `item_rating_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_clicks`
--
ALTER TABLE `user_clicks`
  ADD CONSTRAINT `user_clicks_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `user_clicks_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
