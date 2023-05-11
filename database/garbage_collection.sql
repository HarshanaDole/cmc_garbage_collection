-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2023 at 04:40 PM
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
-- Database: `garbage_collection`
--

-- --------------------------------------------------------

--
-- Table structure for table `captains`
--

CREATE TABLE `captains` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `captains`
--

INSERT INTO `captains` (`id`, `username`, `email`, `password`) VALUES
(1, 'admin', 'admin@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef');

-- --------------------------------------------------------

--
-- Table structure for table `incidents`
--

CREATE TABLE `incidents` (
  `id` int(11) UNSIGNED NOT NULL,
  `latitude` decimal(10,6) NOT NULL,
  `longitude` decimal(10,6) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) NOT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `importance` enum('low','medium','high') DEFAULT 'low',
  `user_id` int(11) DEFAULT NULL,
  `description` varchar(600) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `incidents`
--

INSERT INTO `incidents` (`id`, `latitude`, `longitude`, `name`, `image_path`, `status`, `importance`, `user_id`, `description`) VALUES
(4, 6.890735, 79.930978, 'ministry', 'uploads/645a445a68bad-ministry.jpg', 'pending', 'low', NULL, NULL),
(5, 6.887703, 79.918748, 'traaash', 'uploads/645a4839081f0-trash.jpg', 'pending', 'low', NULL, NULL),
(9, 7.944297, 81.022288, 'polonnaruwa', 'uploads/645b69c09377c-shit.jpg', 'pending', 'low', NULL, NULL),
(10, 8.127316, 80.036112, 'new', 'uploads/645b6ac28dde1-gu.jpg', 'pending', 'low', NULL, NULL),
(11, 7.696720, 80.650108, 'naula', 'uploads/645b6c956a796-trash.jpg', 'pending', 'low', NULL, NULL),
(13, 6.135594, 81.107141, 'hambantota', 'uploads/645b6f07edf3d-gu.jpg', 'pending', 'low', NULL, NULL),
(14, 6.896048, 80.587915, 'hatton', 'uploads/645b725ecbde5-gu.jpg', 'pending', 'low', NULL, NULL),
(15, 7.001401, 80.772858, 'piduru', 'uploads/645b73091f395-trash.jpg', 'pending', 'low', NULL, NULL),
(19, 7.141629, 80.105371, 'nittambuwa', 'uploads/645b73d5b9b82-gu.jpg', 'pending', 'low', NULL, NULL),
(21, 7.560715, 80.690198, 'new user test', 'uploads/645cc1bd282fb-shit.jpg', 'pending', 'low', NULL, NULL),
(22, 7.059800, 79.910300, 'ja el', 'uploads/645cc21bc42b7-gu.jpg', 'pending', 'low', 3, ''),
(24, 6.928750, 79.983210, 'Kaduwela', 'uploads/645ccdb472f9d-ministry.jpg', 'pending', 'low', 3, 'test'),
(25, 7.548742, 80.189093, 'katu', 'uploads/645cedb725e19-gu.jpg', 'pending', 'low', 3, ''),
(26, 7.326500, 80.026283, 'pannala', 'uploads/645cedd242cb3-shit.jpg', 'pending', 'low', 3, ''),
(27, 6.950548, 80.768671, 'nuwara', 'uploads/645cedf2b92e1-trash.jpg', 'pending', 'low', 3, ''),
(28, 7.468543, 80.036707, 'Test incident with long desc', 'uploads/645cf93d824eb-gu.jpg', 'pending', 'low', 3, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`) VALUES
(2, 'test', 'test@gmail.com', '40bd001563085fc35165329ea1ff5c5ecbdbbeef'),
(3, 'Haru', 'harudole@gmail.com', '58a43ad22c5ed16b16a29ae01ec9427ed83d5a06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `captains`
--
ALTER TABLE `captains`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_username` (`username`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- Indexes for table `incidents`
--
ALTER TABLE `incidents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_incidents_users` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_username` (`username`),
  ADD UNIQUE KEY `unique_email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `captains`
--
ALTER TABLE `captains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `incidents`
--
ALTER TABLE `incidents`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `incidents`
--
ALTER TABLE `incidents`
  ADD CONSTRAINT `fk_incidents_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
