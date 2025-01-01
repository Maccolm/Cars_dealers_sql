-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2025 at 01:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cars_dillers`
--

-- --------------------------------------------------------

--
-- Table structure for table `carinfo`
--

CREATE TABLE `carinfo` (
  `id` int(11) NOT NULL,
  `CarID` int(11) NOT NULL,
  `CelebrityID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carinfo`
--

INSERT INTO `carinfo` (`id`, `CarID`, `CelebrityID`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 2, 2),
(4, 3, 3),
(5, 4, 4),
(6, 4, 2),
(7, 5, 2),
(8, 6, 1),
(9, 6, 3),
(10, 7, 2),
(11, 8, 3),
(12, 9, 4),
(13, 9, 3),
(14, 10, 2);

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `Brand` varchar(80) NOT NULL,
  `Model` varchar(80) NOT NULL,
  `Year` int(11) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Color` varchar(30) NOT NULL,
  `Mileage` int(11) DEFAULT NULL,
  `DealerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `Brand`, `Model`, `Year`, `Price`, `Color`, `Mileage`, `DealerID`) VALUES
(1, 'Toyota', 'Corolla', 2019, 15000.00, 'Синій', 30000, 1),
(2, 'Ford', 'Focus', 2020, 17500.00, 'Червоний', 20000, 2),
(3, 'Honda', 'Accord', 2018, 18000.00, 'Чорний', 40000, 3),
(4, 'BMW', '3 Series', 2021, 25000.00, 'Білий', 10000, 10),
(5, 'Hyundai', 'Elantra', 2017, 12000.00, 'Сірий', 50000, 11),
(6, 'Toyota', 'Camry', 2019, 20000.00, 'Червоний', 35000, 1),
(7, 'Ford', 'Fiesta', 2020, 16000.00, 'Чорний', 25000, 2),
(8, 'Honda', 'Civic', 2018, 17000.00, 'Синій', 45000, 3),
(9, 'BMW', '5 Series', 2021, 30000.00, 'Сірий', 15000, 10),
(10, 'Hyundai', 'Sonata', 2017, 13000.00, 'Білий', 55000, 11);

-- --------------------------------------------------------

--
-- Table structure for table `celebrities`
--

CREATE TABLE `celebrities` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `celebrities`
--

INSERT INTO `celebrities` (`id`, `Name`) VALUES
(4, 'Бред Пітт'),
(3, 'Кіану Рівз'),
(1, 'Леонардо Ді Капріо'),
(2, 'Меган Фокс');

-- --------------------------------------------------------

--
-- Table structure for table `dealers`
--

CREATE TABLE `dealers` (
  `id` int(11) NOT NULL,
  `DealerName` varchar(100) NOT NULL,
  `DealerStreet` varchar(255) NOT NULL,
  `DealerStreetNumber` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dealers`
--

INSERT INTO `dealers` (`id`, `DealerName`, `DealerStreet`, `DealerStreetNumber`) VALUES
(1, 'AutoMarket', 'Лесі Українки', 10),
(2, 'FastCars', 'Квітки Цісик', 5),
(3, 'CarDealz', 'Івана Франка', 25),
(10, 'LuxAuto', 'Лаврська', 15),
(11, 'BestDeals', 'Драгоманова', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carinfo`
--
ALTER TABLE `carinfo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CarID` (`CarID`),
  ADD KEY `CelebrityID` (`CelebrityID`);

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`),
  ADD KEY `DealerID` (`DealerID`);

--
-- Indexes for table `celebrities`
--
ALTER TABLE `celebrities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- Indexes for table `dealers`
--
ALTER TABLE `dealers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `DealerName` (`DealerName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carinfo`
--
ALTER TABLE `carinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `celebrities`
--
ALTER TABLE `celebrities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dealers`
--
ALTER TABLE `dealers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carinfo`
--
ALTER TABLE `carinfo`
  ADD CONSTRAINT `carinfo_ibfk_1` FOREIGN KEY (`CarID`) REFERENCES `cars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `carinfo_ibfk_2` FOREIGN KEY (`CelebrityID`) REFERENCES `celebrities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `cars`
--
ALTER TABLE `cars`
  ADD CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`DealerID`) REFERENCES `dealers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
