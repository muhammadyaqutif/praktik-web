-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2026 at 03:43 AM
-- Server version: 10.11.16-MariaDB
-- PHP Version: 8.3.36

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `244222011`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `author_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `author_name`) VALUES
(1, 'Andi Pratama'),
(2, 'Siti Rahma');

-- --------------------------------------------------------

--
-- Table structure for table `bookauthors`
--

CREATE TABLE `bookauthors` (
  `book_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookauthors`
--

INSERT INTO `bookauthors` (`book_id`, `author_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `bookgenres`
--

CREATE TABLE `bookgenres` (
  `book_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookgenres`
--

INSERT INTO `bookgenres` (`book_id`, `genre_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `publication_year` year(4) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT 0 CHECK (`stock` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `title`, `isbn`, `publication_year`, `stock`) VALUES
(1, 'Dasar Pemrograman Web', '9780000000001', '2024', 5),
(2, 'Basis Data Relasional', '9780000000002', '2023', 3);

-- --------------------------------------------------------

--
-- Table structure for table `borrowings`
--

CREATE TABLE `borrowings` (
  `borrow_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `borrow_date` date NOT NULL,
  `due_date` date NOT NULL,
  `return_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowings`
--

INSERT INTO `borrowings` (`borrow_id`, `book_id`, `member_id`, `borrow_date`, `due_date`, `return_date`) VALUES
(1, 1, 1, '2026-11-10', '2026-11-17', NULL),
(2, 2, 2, '2026-11-01', '2026-11-08', '2026-11-07');

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `genre_id` int(11) NOT NULL,
  `genre_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES
(2, 'Pendidikan'),
(1, 'Teknologi');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `member_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `first_name`, `last_name`, `address`, `phone`, `email`) VALUES
(1, 'Dani', 'Kurnia', 'Jakarta', '081234567890', 'dani@example.com'),
(2, 'Budi', 'Santoso', 'Bekasi', '081234567891', 'budi@example.com');

-- --------------------------------------------------------

--
-- Table structure for table `shop_categories`
--

CREATE TABLE `shop_categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_customers`
--

CREATE TABLE `shop_customers` (
  `customer_id` int(11) NOT NULL,
  `full_name` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `shipping_address` text NOT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_orders`
--

CREATE TABLE `shop_orders` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `status` varchar(30) NOT NULL DEFAULT 'Pending',
  `total_price` decimal(12,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_order_items`
--

CREATE TABLE `shop_order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price_at_order` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_products`
--

CREATE TABLE `shop_products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(12,2) NOT NULL,
  `sku` varchar(50) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shop_product_categories`
--

CREATE TABLE `shop_product_categories` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `bookauthors`
--
ALTER TABLE `bookauthors`
  ADD PRIMARY KEY (`book_id`,`author_id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `bookgenres`
--
ALTER TABLE `bookgenres`
  ADD PRIMARY KEY (`book_id`,`genre_id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `isbn` (`isbn`);

--
-- Indexes for table `borrowings`
--
ALTER TABLE `borrowings`
  ADD PRIMARY KEY (`borrow_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `member_id` (`member_id`),
  ADD KEY `idx_borrowings_status` (`return_date`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`genre_id`),
  ADD UNIQUE KEY `genre_name` (`genre_name`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`member_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `shop_categories`
--
ALTER TABLE `shop_categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`);

--
-- Indexes for table `shop_customers`
--
ALTER TABLE `shop_customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `shop_orders`
--
ALTER TABLE `shop_orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `shop_order_items`
--
ALTER TABLE `shop_order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `shop_products`
--
ALTER TABLE `shop_products`
  ADD PRIMARY KEY (`product_id`),
  ADD UNIQUE KEY `sku` (`sku`);

--
-- Indexes for table `shop_product_categories`
--
ALTER TABLE `shop_product_categories`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `borrowings`
--
ALTER TABLE `borrowings`
  MODIFY `borrow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `genre_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `shop_categories`
--
ALTER TABLE `shop_categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_customers`
--
ALTER TABLE `shop_customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_orders`
--
ALTER TABLE `shop_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_order_items`
--
ALTER TABLE `shop_order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shop_products`
--
ALTER TABLE `shop_products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookauthors`
--
ALTER TABLE `bookauthors`
  ADD CONSTRAINT `bookauthors_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookauthors_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bookgenres`
--
ALTER TABLE `bookgenres`
  ADD CONSTRAINT `bookgenres_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookgenres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`genre_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `borrowings`
--
ALTER TABLE `borrowings`
  ADD CONSTRAINT `borrowings_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `borrowings_ibfk_2` FOREIGN KEY (`member_id`) REFERENCES `members` (`member_id`) ON UPDATE CASCADE;

--
-- Constraints for table `shop_orders`
--
ALTER TABLE `shop_orders`
  ADD CONSTRAINT `shop_orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `shop_customers` (`customer_id`) ON UPDATE CASCADE;

--
-- Constraints for table `shop_order_items`
--
ALTER TABLE `shop_order_items`
  ADD CONSTRAINT `shop_order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `shop_orders` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shop_order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`product_id`) ON UPDATE CASCADE;

--
-- Constraints for table `shop_product_categories`
--
ALTER TABLE `shop_product_categories`
  ADD CONSTRAINT `shop_product_categories_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `shop_products` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shop_product_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `shop_categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
