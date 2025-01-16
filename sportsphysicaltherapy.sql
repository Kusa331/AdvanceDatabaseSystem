-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 16, 2025 at 08:53 AM
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
-- Database: `sportsphysicaltherapy`
--

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `Patient_Number` int(4) NOT NULL,
  `Patient_Name` varchar(100) NOT NULL,
  `Patient_Address` varchar(200) DEFAULT NULL,
  `Patient_Balance` decimal(10,2) DEFAULT 0.00,
  `Email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `session`
--

CREATE TABLE `session` (
  `Session_Number` int(4) NOT NULL,
  `Session_Name` varchar(100) NOT NULL,
  `Therapist_Number` int(4) NOT NULL,
  `Therapy_Number` int(4) NOT NULL,
  `Patient_Number` int(4) NOT NULL,
  `Session_Date` date NOT NULL,
  `Session_Length` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `therapies`
--

CREATE TABLE `therapies` (
  `Therapy_Number` int(4) NOT NULL,
  `Description` varchar(200) NOT NULL,
  `Session_Length` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `therapists`
--

CREATE TABLE `therapists` (
  `Therapist_Number` int(4) NOT NULL,
  `Patient_Number` int(4) NOT NULL,
  `Therapist_Name` varchar(100) NOT NULL,
  `Therapist_Address` varchar(200) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`Patient_Number`);

--
-- Indexes for table `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`Session_Number`),
  ADD KEY `fk_session_therapist` (`Therapist_Number`),
  ADD KEY `fk_session_therapy` (`Therapy_Number`),
  ADD KEY `fk_session_patient` (`Patient_Number`);

--
-- Indexes for table `therapies`
--
ALTER TABLE `therapies`
  ADD PRIMARY KEY (`Therapy_Number`);

--
-- Indexes for table `therapists`
--
ALTER TABLE `therapists`
  ADD PRIMARY KEY (`Therapist_Number`),
  ADD KEY `fk_patient` (`Patient_Number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `Patient_Number` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `session`
--
ALTER TABLE `session`
  MODIFY `Session_Number` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `therapies`
--
ALTER TABLE `therapies`
  MODIFY `Therapy_Number` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `therapists`
--
ALTER TABLE `therapists`
  MODIFY `Therapist_Number` int(4) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `fk_session_patient` FOREIGN KEY (`Patient_Number`) REFERENCES `patients` (`Patient_Number`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_session_therapist` FOREIGN KEY (`Therapist_Number`) REFERENCES `therapists` (`Therapist_Number`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_session_therapy` FOREIGN KEY (`Therapy_Number`) REFERENCES `therapies` (`Therapy_Number`) ON DELETE CASCADE;

--
-- Constraints for table `therapists`
--
ALTER TABLE `therapists`
  ADD CONSTRAINT `fk_patient` FOREIGN KEY (`Patient_Number`) REFERENCES `patients` (`Patient_Number`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
