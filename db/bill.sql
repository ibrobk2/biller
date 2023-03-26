-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2023 at 05:46 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bill`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `fname` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `fname`, `username`, `password`) VALUES
(1, '', 'admin', 'Admin@123'),
(2, '', 'admin2', 'Admin@123'),
(3, 'fadil Isah', 'fadil', 'Fadil@123');

-- --------------------------------------------------------

--
-- Table structure for table `complains`
--

CREATE TABLE `complains` (
  `id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `complain` varchar(250) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complains`
--

INSERT INTO `complains` (`id`, `email`, `complain`, `status`) VALUES
(3, 'ibrobk@gmail.com', 'I want you to help and configure my SSL certificate.', 'Pending..'),
(4, 'ibrobk@gamiold', 'Hi there my complain is  I am  lazy.', 'Pending..'),
(5, 'ibrobk12@gmail.com', 'I am very busy writing codes...', 'Resolved'),
(6, 'ibrobk@outlook.com', 'another complain..', 'Pending..'),
(10, 'usmanhassanmashi23@gmail.com', 'I have issue with my printer.', 'pending'),
(11, 'abubakarbishir081@gmail.com', 'My meter failed to load a Token.', 'Resolved'),
(12, 'abubakarbishir081@gmail.com', 'Chapter 4 and Chapter 5.', 'pending'),
(13, 'zeeisah94@gmail.com', 'My meter is tripping after every 5 hours.', 'Resolved');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `userId` int(11) NOT NULL,
  `fname` text NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `balance_bf` varchar(10) NOT NULL,
  `balance_af` varchar(10) NOT NULL,
  `trx_type` varchar(50) NOT NULL,
  `trx_id` int(11) NOT NULL,
  `trx_time` datetime NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `balance` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `username`, `phone`, `email`, `pass`, `balance`) VALUES
(6, 'Hassan Abubakar', 'aahassan', '09876534656780', 'ahsa@gmail.com', '866f6a6fbbd7a335657481b14a1ef879', '0'),
(7, 'Amina Aminu', 'aabakori', '08024772431', 'aaminu@gmail.com', '745268e347a01cd43f3008c9eb354ce9', '0'),
(8, 'Ibrahim Umar', 'mashi', '07030401020', 'abbaumr1020@gmail.com', 'd7a6c9cd1649cdb1eb4ab4dd909f7959', '0'),
(10, 'Ibrahim Yusuf', 'ibrobk2', '08135363779', 'ibrobk@yahoo.com', 'b713e325db1b3d1f3ff78eeb2a924ff5', '0'),
(15, 'Ishaq Aminu', 'iaminu', '0908978765', 'iaminu@gmail.com', 'a891e49a784efc153dd28596dbdfc047', '0'),
(16, 'Sani Musa', 'smusa', '08079865746', 'smusa@gmail.com', 'cee35689fcb111fcf1c4918992b44268', '0'),
(17, 'Umar Musa', 'yaradua', '09097656565', 'um@gmail.com', '6679b0839ac2390752037d14db4065c3', '0'),
(18, 'Zainab Lawal', 'zeelawal', '08798765867', 'zee@yahoo.com', '4a85d40cff7f6bf0afa1cb061f9517f3', '0'),
(19, 'Ibrahim Yusuf', 'ibrobk12', '08105212354', 'ibrobk12@gmail.com', 'd445c7e17d708b55e9a31f35aaff0335', '1320'),
(20, 'Nura Bishir', 'nurab', '08167900247', 'abubakarbishir081@gmail.com', 'af7c6b3bceff1cec5881264e473ea77e', '0'),
(21, 'Yusuf Ibrahim', 'narara', '08031827099', 'nararabkr@gmail.com', '4249489ae87222c51f5857db253a60e0', '0'),
(22, 'Zainab Isah Iliya', 'zee12', '08136097454', 'zeeisah94@gmail.com', '870b4712d03ec46f0ac9214c8bb412cd', '100');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complains`
--
ALTER TABLE `complains`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `complains`
--
ALTER TABLE `complains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
