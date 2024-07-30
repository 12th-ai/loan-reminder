-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2023 at 05:38 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loan_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `debtors`
--

CREATE TABLE `debtors` (
  `Id` int(11) NOT NULL,
  `Firstname` varchar(100) DEFAULT NULL,
  `Lastname` varchar(100) NOT NULL,
  `Phone` varchar(30) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `MadeDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `debtors`
--

INSERT INTO `debtors` (`Id`, `Firstname`, `Lastname`, `Phone`, `Email`, `Amount`, `Status`, `MadeDate`, `ReturnDate`, `UserId`) VALUES
(6, 'Mpuhwe', 'Claude', '02378732', 'clauderug@mail.rw', 12000, 1, '2023-06-20', '2023-06-29', 1),
(7, 'Djum', 'Clement', '23090', 'honore@gm.com', 1232, 0, '2023-06-15', '2023-06-28', 1);

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `Id` int(11) NOT NULL,
  `Title` varchar(1000) NOT NULL,
  `Description` varchar(1000) NOT NULL,
  `Date` date NOT NULL,
  `Month` int(11) NOT NULL,
  `Year` int(11) NOT NULL,
  `Amount` int(11) NOT NULL,
  `UserId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`Id`, `Title`, `Description`, `Date`, `Month`, `Year`, `Amount`, `UserId`) VALUES
(1, 'Car Fuel', 'Fillng car gas, 10,000', '2023-06-15', 6, 2023, 12500, 1),
(2, 'Food', 'Buying Rice, 10 kg, buying drinks, 2 juices', '2023-06-14', 6, 2023, 12000, 1),
(6, 'Clothes', 'Bought 2 jeans', '2023-06-07', 6, 2023, 12000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `lenders`
--

CREATE TABLE `lenders` (
  `Id` int(11) NOT NULL,
  `Phone` varchar(30) DEFAULT NULL,
  `Firstname` varchar(100) DEFAULT NULL,
  `Lastname` varchar(100) NOT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `Amount` int(11) DEFAULT NULL,
  `MadeDate` date DEFAULT NULL,
  `ReturnDate` date DEFAULT NULL,
  `UserId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lenders`
--

INSERT INTO `lenders` (`Id`, `Phone`, `Firstname`, `Lastname`, `Email`, `Amount`, `MadeDate`, `ReturnDate`, `UserId`) VALUES
(14, '0348349', 'Rugaju', 'Claude', 'clauderug@mail.rw', 15000, '2023-06-14', '2023-06-15', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserId` int(11) NOT NULL,
  `Firstname` varchar(30) DEFAULT NULL,
  `Lastname` varchar(30) DEFAULT NULL,
  `Phone` varchar(20) DEFAULT NULL,
  `Email` varchar(20) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserId`, `Firstname`, `Lastname`, `Phone`, `Email`, `Password`) VALUES
(1, 'Ntirana', 'Claude', '078956114', 'ntirantaclaude@gmail', '1111'),
(3, 'Mugabo', 'Danniel', '07852635263', '', '123'),
(5, 'Mugabo', 'Hussein', '0782372323', '', '123'),
(6, 'Kagam', 'Kevin', '091298239283', 'kev@mail.com', '123'),
(7, 'Uwiyaremye', 'Eric', '0782182010', 'eric@gmail.com', '1234'),
(8, 'Nshuti', 'Aime', '078888888823', 'honore@gm.com', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `debtors`
--
ALTER TABLE `debtors`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `UserId` (`UserId`);

--
-- Indexes for table `lenders`
--
ALTER TABLE `lenders`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `debtors`
--
ALTER TABLE `debtors`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `lenders`
--
ALTER TABLE `lenders`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `debtors`
--
ALTER TABLE `debtors`
  ADD CONSTRAINT `debtors_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_ibfk_1` FOREIGN KEY (`UserId`) REFERENCES `users` (`UserId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
