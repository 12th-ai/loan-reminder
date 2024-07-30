-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 06, 2024 at 12:50 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stock_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `stock_in`
--

CREATE TABLE `stock_in` (
  `stock_id` int(11) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `unit_price` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `amount` varchar(255) NOT NULL,
  `total_price` varchar(355) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `suppliers` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_in`
--

INSERT INTO `stock_in` (`stock_id`, `product_code`, `product_name`, `unit_price`, `date`, `amount`, `total_price`, `owner`, `suppliers`) VALUES
(45, '62', 'Mara Mcdonald', '587', '1984-11-18', '2', '1174', 'damse', 'Atque hic ea et ad e'),
(47, 'Esse et vel aliqua ', 'Marshall Bradford', '317', '2024-03-08', '30', '9510', 'damse', 'Aliquid qui rerum nu'),
(48, 'Cumque porro ipsam d', 'Scott Buckner', '668', '2024-06-12', '17', '11356', 'damse', 'In enim aperiam sit '),
(49, 'Ad et consequuntur v', 'Keely Castro', '491', '2024-05-27', '89', '43699', 'damse', 'Labore veniam rerum'),
(50, 'Ad et consequuntur v', 'Keely Castro', '491', '2024-05-27', '89', '43699', 'damse', 'Labore veniam rerum'),
(51, 'Omnis proident quis', 'Aphrodite Yang', '844', '2018-03-16', '59', '49796', 'damse', 'Nemo unde possimus '),
(52, 'Modi consectetur dol', 'Robin Stewart', '831', '2024-06-28', '33', '27423', 'damse', 'Necessitatibus labor'),
(54, 'Molestias blanditiis', 'Hilel Joyner', '232', '2021-03-01', '83', '19256', 'damse', 'Eligendi veniam nob'),
(55, 'Deserunt hic proiden', 'Ivan Mcgowan', '208', '1984-05-20', '47', '9776', 'damse', 'Ut ipsa nisi dolor '),
(56, 'Voluptatibus quia ex', 'Chiquita Gilliam', '568', '2024-06-24', '56', '31808', 'damse', 'Laboris commodo saep'),
(57, 'Reiciendis commodo o', 'Nelle Campbell', '453', '2020-12-03', '52', '23556', 'kuru', 'Illum ut fugiat dol'),
(58, 'Qui aut et mollit au', 'Jaquelyn Mann', '433', '1999-07-08', '72', '31176', 'kuru', 'Nobis neque deserunt'),
(59, 'Ullam dolor deserunt', 'Quon Mcdonald', '673', '1986-09-03', '73', '49129', 'kuru', 'At sunt dolore vitae'),
(60, 'Ad dolorem voluptate', 'Kirk Yang', '918', '1991-05-27', '50', '45900', 'kuru', 'Pariatur Sapiente v'),
(61, 'Sint enim corrupti', 'Kimberly Douglas', '726', '1981-01-11', '52', '37752', 'kuru', 'Odio voluptatem mod'),
(62, 'Magnam hic architect', 'Rooney Rogers', '349', '2019-07-04', '56', '19544', 'kuru', 'Culpa sit ut anim a');

-- --------------------------------------------------------

--
-- Table structure for table `stock_out`
--

CREATE TABLE `stock_out` (
  `stock_id` int(11) NOT NULL,
  `product_code` varchar(255) NOT NULL,
  `amount` varchar(255) NOT NULL,
  `unit_price` varchar(255) NOT NULL,
  `payment` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `total_price` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stock_out`
--

INSERT INTO `stock_out` (`stock_id`, `product_code`, `amount`, `unit_price`, `payment`, `date`, `total_price`, `owner`) VALUES
(21, '58', '83', ' 88', 'MOMO', '1990-06-22', '7304', 'hudutykys'),
(26, '38', '84', ' 94', 'MOMO', '1995-02-23', '7896', 'hudutykys'),
(27, '58', '14', '525', '0', '1980-03-29', '9207', 'hudutykys'),
(29, '99', '76', ' 74', 'MOMO', '2013-08-21', '5624', 'hudutykys'),
(32, '69', '25', '7', 'CREDIT CARD', '2000-11-05', '80', 'hudutykys'),
(33, '69', '20', ' 2', 'CASH', '2023-11-05', '40', 'hudutykys'),
(37, '', '52', ' 73', 'MOMO', '2014-03-19', '3796', ''),
(38, '84', '30', ' 10', 'CREDIT CARD', '2023-11-23', '300', ''),
(39, '84', '20', ' 10', 'MOMO', '2023-11-06', '200', 'wykivulo');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `dob` date DEFAULT NULL,
  `privillage` int(11) NOT NULL,
  `user_profile` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `user_name`, `user_email`, `user_password`, `dob`, `privillage`, `user_profile`) VALUES
(14, 'Sage Guerra', 'jifypywi', 'zebywamydy@mailinator.com', '$2b$10$2Nij1Dr0j1/rWlgiOFOURuwZtSYcnnCVvcu3WUvI.C6Oyla2V6zSu', '1996-02-23', 0, '😊'),
(15, 'Venus Roberson', 'bigizewy', 'defumaramu@mailinator.com', '$2b$10$miEZMWQH4dXxfHv1Vf09iutep9u//lCwBLYrVtZsG3s4brxioYtfK', '2009-11-25', 2, '😊'),
(16, 'Gavin Stanley', 'hocegut', 'ripodo@mailinator.com', '$2b$10$I2CrxOfZwxbBkxx73rPTlOS7ahP2QTnHrR9Sy8RSYHv6M7SSfxew6', '2021-04-05', 0, '😊'),
(17, 'Patrick Wolfe', 'disutos', 'lipinabel@mailinator.com', '$2b$10$onn5VUVqxuVvVIwxCkK9wuBQvD9gQxjxyGwV7bO7zeDxTfytJz14S', '1986-11-02', 0, '😊'),
(18, 'Hermione Gregory', 'byjyx', 'wapyfume@mailinator.com', '$2b$10$OJG1EKMQGa.3Y/TGN3JV2eahthLHrPcAjuFg2rN9W3EJIzAb1oULu', '2015-05-16', 2, '😊'),
(19, 'Zahir Everett', 'capawo', 'keko@mailinator.com', '$2b$10$SnZ.lVLK29ciRu7F/e5.6.hwNJYkMx5sQEFbPYnVlF2VB/zQHAy0a', '2019-07-07', 1, '😊'),
(20, 'Athena Campos', 'zyrokam', 'tajyw@mailinator.com', '$2b$10$6xyMA/zYyQZHnX4Uh3cksedn2an.im3HCMqUb.QgVUy3c8U3vRFQi', '2011-03-05', 1, '😊'),
(21, 'Xenos Sawyer', 'zexigukoc', 'lahyhytip@mailinator.com', '$2b$10$2BY5UXzcpWsI7hLTmpmG...SsyfbnZ4jIqLg.RE4KUxPskc9YvtRa', '2009-10-22', 2, '😊'),
(22, 'Coby Rose', 'suwunel', 'gasi@mailinator.com', '$2b$10$MkH2kmExW2EcfrvBzjx4Z.bCbcl/ob0o8IjpHYvultWez85lVVB6G', '2017-04-06', 0, '😊'),
(23, 'Britanney Erickson', 'sixarebita', 'pylyr@mailinator.com', '$2b$10$mC/dzYXLquKkOsLRn0EzdeQJQ8EOj0asAJ0XILdqvn6mDmzFP.RC.', '1996-07-19', 1, '😊'),
(24, 'Damian Austin', 'senyler', 'cywydutuxy@mailinator.com', '$2b$10$1OVKO1dpumzqjMPKGEKXqupVY6f5jSPCrUifTEgrbSyvGCZd0RS2q', '2011-05-20', 1, '😊'),
(25, 'Regina Cooke', 'xotorudyqu', 'coqiwuru@mailinator.com', '$2b$10$kOVKoMnwfUb1/2lIV96v..2vag/.Bhcy0UjY9e1VDzK98KukKmE4O', '2021-03-28', 1, '😊'),
(26, 'mihigo', 'princess', 'mihigoprince@gmail.com', '$2b$10$woyf3xWN7z42c7WfJTCQh.oL6x0cSUtUMDSoSjRMQ4nuDXxoLp04O', '2024-05-30', 0, '😊'),
(27, 'dam', 'damse', 'mihigodamas@gmail.com', '$2b$10$bmdJsLFNk1BC4uhFo17CXufBCRgMgqTeF1uuF4a9KgA9VioF8BlfK', '2024-01-18', 0, 'image_1717573594806.jpeg'),
(28, 'Indigo Roman', 'juwakyloto', 'tizany@mailinator.com', '$2b$10$KYiNAVK/Xc86Hn0ELTzmLubw03oVULbWwNxEv7wfVpvpIE6OLMJvq', '2010-09-15', 1, 'default-profile.png'),
(40, 'Clinton Dillon', 'hydyvel', 'vekyteci@mailinator.com', '$2b$10$BA24vdZCx7votUfmjXVQheWoCBxP.BwxfMi/qCLHTEKKpoYelmEGu', '2006-06-15', 2, 'default-profile.png'),
(41, 'Leroy Schroeder', 'qecagohap', 'zipafup@mailinator.com', '$2b$10$lbgfJephz3wZ95ZxXm6c6udEu7Kd5TiqiMNCKfoZTHMTCSYLvESWe', '2010-05-12', 1, 'default-profile.png'),
(42, 'Aubrey Terry', 'sebywiwa', 'pebaqety@mailinator.com', '$2b$10$.AFXG8p93XlRproFUypyMOBSe/JEUNfQZkN66L8lb8/O383iZXzui', '1975-11-05', 2, 'image_1714601382542.jpeg'),
(43, 'Rana Ramsey', 'nomuziqyr', 'jylux@mailinator.com', '$2b$10$.geLAZSBjk/B/UnA7TFN5eKqq6HIRxCReXoKHpXCAQZ8iFdKWH2Ay', '2005-08-14', 0, 'image_1714601382542.jpeg'),
(44, 'Mohammad Grimes', 'bb', 'lezoqe@mailinator.com', '$2b$10$1MY7/NnDDAH1oqhOfO3nGu1.glLPige3Qu3c5.5ShiX2S1cmRx3Qu', '1993-10-07', 1, 'image_1714601382542.jpeg'),
(45, 'Camille Rowland', 'hukuredepy', 'gaga@mailinator.com', '$2b$10$fsV9KlljjlAKOkPJrhAKE.lAihHBntaRnu0zC8/wqU1ghEonTIu9K', '1987-08-09', 1, 'image_1714601382542.jpeg'),
(46, 'Galvin Navarro', 'cyqunax', 'vimat@mailinator.com', '$2b$10$93TsJb.nuDLv87qeTPZLUughJuAFMUagPp4cUk/s4u7YPhnNcNtMe', '1989-01-01', 2, 'image_1718180702621.webp'),
(47, 'Hiroko Ratliff', 'xogaq', 'devewijog@mailinator.com', '$2b$10$.PpGpVM0BPvYi2ssfFryf.h3MkT1tl1uGjP.lFjAJNLB1V7xyWSMO', '2020-05-22', 2, 'image_1718180736357.avif'),
(48, 'Charlotte Larsen', 'kuru', 'suxew@mailinator.com', '$2b$10$/zqD0uJfmuBtvGJ5eBCGN.sJu2/HWWPLYr4ydOIxgOKhTaX44UI5O', '1986-04-26', 2, 'image_1718180736357.avif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `stock_in`
--
ALTER TABLE `stock_in`
  ADD PRIMARY KEY (`stock_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

-- AUTO_INCREMENT for table `stock_in`
--
ALTER TABLE `stock_in`
  MODIFY `stock_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
