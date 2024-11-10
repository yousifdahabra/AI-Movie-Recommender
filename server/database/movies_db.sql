-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:4308
-- Generation Time: Nov 10, 2024 at 06:53 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movies_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `discover_movies_tbl`
--

CREATE TABLE `discover_movies_tbl` (
  `iddiscover_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `movies_bookmark_tbl`
--

CREATE TABLE `movies_bookmark_tbl` (
  `bookmark_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `movies_rate_tbl`
--

CREATE TABLE `movies_rate_tbl` (
  `rate_id` int(11) NOT NULL,
  `scale` int(11) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `movies_tbl`
--

CREATE TABLE `movies_tbl` (
  `movie_id` int(11) NOT NULL,
  `movie_title` varchar(255) DEFAULT NULL,
  `movie_duration` varchar(45) DEFAULT NULL,
  `movie_image` mediumtext DEFAULT NULL,
  `movie_release_date` varchar(255) DEFAULT NULL,
  `movie_summary` mediumtext DEFAULT NULL,
  `movie_extra_information` mediumtext DEFAULT NULL,
  `movie_story_element` mediumtext DEFAULT NULL,
  `movie_link` mediumtext DEFAULT NULL,
  `movie_categories` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for table `discover_movies_tbl`
--
ALTER TABLE `discover_movies_tbl`
  ADD PRIMARY KEY (`iddiscover_id`),
  ADD UNIQUE KEY `iddiscover_id_UNIQUE` (`iddiscover_id`),
  ADD KEY `fk_discover_movies_tbl_movies_tbl1_idx` (`movie_id`),
  ADD KEY `fk_discover_movies_tbl_users_tbl1_idx` (`user_id`);

--
-- Indexes for table `movies_bookmark_tbl`
--
ALTER TABLE `movies_bookmark_tbl`
  ADD PRIMARY KEY (`bookmark_id`),
  ADD UNIQUE KEY `bookmark_id_UNIQUE` (`bookmark_id`),
  ADD KEY `fk_movies_bookmark_tbl_users_tbl_idx` (`user_id`),
  ADD KEY `fk_movies_bookmark_tbl_movies_tbl1_idx` (`movie_id`);

--
-- Indexes for table `movies_rate_tbl`
--
ALTER TABLE `movies_rate_tbl`
  ADD PRIMARY KEY (`rate_id`),
  ADD UNIQUE KEY `rate_id_UNIQUE` (`rate_id`),
  ADD KEY `fk_movies_rate_tbl_users_tbl1_idx` (`user_id`),
  ADD KEY `fk_movies_rate_tbl_movies_tbl1_idx` (`movie_id`);

--
-- Indexes for table `movies_tbl`
--
ALTER TABLE `movies_tbl`
  ADD PRIMARY KEY (`movie_id`),
  ADD UNIQUE KEY `movie_id_UNIQUE` (`movie_id`);

--
-- Indexes for table `users_tbl`
--
ALTER TABLE `users_tbl`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  ADD UNIQUE KEY `username_UNIQUE` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `discover_movies_tbl`
--
ALTER TABLE `discover_movies_tbl`
  MODIFY `iddiscover_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies_bookmark_tbl`
--
ALTER TABLE `movies_bookmark_tbl`
  MODIFY `bookmark_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies_rate_tbl`
--
ALTER TABLE `movies_rate_tbl`
  MODIFY `rate_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `movies_tbl`
--
ALTER TABLE `movies_tbl`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `users_tbl`
--
ALTER TABLE `users_tbl`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `discover_movies_tbl`
--
ALTER TABLE `discover_movies_tbl`
  ADD CONSTRAINT `fk_discover_movies_tbl_movies_tbl1` FOREIGN KEY (`movie_id`) REFERENCES `movies_tbl` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_discover_movies_tbl_users_tbl1` FOREIGN KEY (`user_id`) REFERENCES `users_tbl` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movies_bookmark_tbl`
--
ALTER TABLE `movies_bookmark_tbl`
  ADD CONSTRAINT `fk_movies_bookmark_tbl_movies_tbl1` FOREIGN KEY (`movie_id`) REFERENCES `movies_tbl` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movies_bookmark_tbl_users_tbl` FOREIGN KEY (`user_id`) REFERENCES `users_tbl` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `movies_rate_tbl`
--
ALTER TABLE `movies_rate_tbl`
  ADD CONSTRAINT `fk_movies_rate_tbl_movies_tbl1` FOREIGN KEY (`movie_id`) REFERENCES `movies_tbl` (`movie_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_movies_rate_tbl_users_tbl1` FOREIGN KEY (`user_id`) REFERENCES `users_tbl` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
