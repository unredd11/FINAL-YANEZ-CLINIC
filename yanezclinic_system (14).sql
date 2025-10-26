-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2025 at 05:39 PM
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
-- Database: `yanezclinic_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_users`
--

CREATE TABLE `admin_users` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_users`
--

INSERT INTO `admin_users` (`admin_id`, `email`, `password`, `name`) VALUES
(1, 'admin@yanezclinic.com', '$2y$10$9s8d7f6g5h4j3k2l1m0nOpQrsTuVwXyZzAaBbCcDdEeFfGgHhIi', 'Administrator'),
(2, 'adminyanez@gmail.com', '$2y$10$EWAy2vGNwUkYBumZF67FUes4A6ZxDG6mpqOm82TAuMuYFT/c/AzQK', 'Admin'),
(4, 'admin', '$2y$10$zn0wtFNfE.paiURuReiDHeTXUtNeD7DUJQywIEXPw3tnwZJ96V.G6', 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `service` varchar(100) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `status` enum('Pending','Accepted','Rejected','Completed') DEFAULT 'Pending',
  `appointment_details` text DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `paypal_transaction_id` varchar(255) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`appointment_id`, `patient_id`, `service`, `appointment_date`, `appointment_time`, `status`, `appointment_details`, `payment_method`, `paypal_transaction_id`, `updated_at`) VALUES
(9, 1, 'Laboratory Testing', '2025-10-22', '15:30:00', '', 'urine acid', NULL, NULL, '2025-10-21 11:14:23'),
(11, 1, 'X-ray & Diagnostics', '2025-10-25', '10:30:00', '', 'chest pain', NULL, NULL, '2025-10-21 11:04:23'),
(18, 1, 'X-Ray', '2025-10-24', '10:30:00', '', 'chest checkup', NULL, NULL, '2025-10-21 11:14:14'),
(19, 1, 'Laboratory Testing', '2025-10-22', '10:30:00', 'Pending', 'urine', NULL, NULL, '2025-10-10 16:04:28'),
(22, 3, 'Physical Examination', '2025-10-11', '01:30:00', 'Completed', 'Galabad ulo', 'walkin', NULL, '2025-10-13 15:03:05'),
(24, 3, 'Physical Examination', '2025-11-12', '01:00:00', 'Completed', 'sakit ulo', 'walkin', NULL, '2025-10-15 15:44:48'),
(26, 3, 'Physical Examination', '2025-10-13', '11:30:00', 'Accepted', 'galain tiyan', 'walkin', NULL, '2025-10-13 15:57:48'),
(27, 1, 'Laboratory Testing', '2025-10-29', '01:00:00', 'Accepted', 'Blood chemistry', 'walkin', NULL, '2025-10-14 02:38:59'),
(28, 1, 'Laboratory Testing', '2025-10-14', '01:00:00', '', 'Blood Chemistry', 'walkin', NULL, '2025-10-21 11:24:12'),
(29, 6, 'X-Ray', '2025-10-17', '09:00:00', 'Accepted', 'Hands X-ray', 'walkin', '', '2025-10-16 15:56:47'),
(30, 5, 'Laboratory Testing', '2025-10-18', '02:30:00', '', 'test', 'walkin', '', '2025-10-20 11:22:22'),
(34, 5, 'Physical Examination', '2025-10-21', '09:00:00', 'Accepted', '', 'walkin', '', '2025-10-21 05:21:47'),
(35, 5, 'Laboratory Testing', '2025-10-21', '01:00:00', 'Completed', '', 'walkin', '', '2025-10-21 04:45:18'),
(44, 5, 'Laboratory Testing', '2025-10-21', '14:00:00', 'Pending', '', 'walkin', '', '2025-10-21 05:15:14'),
(47, 7, 'Physical Examination', '2025-10-22', '10:00:00', 'Pending', '', 'online', '9249028586314710J', '2025-10-21 10:53:43'),
(48, 8, 'X-Ray', '2025-10-22', '13:00:00', '', 'Chest X-Ray', 'walkin', '', '2025-10-21 10:58:17'),
(49, 9, 'Physical Examination', '2025-10-22', '08:00:00', 'Pending', '', 'online', '4A387182HF673232L', '2025-10-21 11:00:58'),
(53, 8, 'X-Ray', '2025-10-22', '15:30:00', '', '', 'online', '95E57796EW356050L', '2025-10-21 12:09:20');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`patient_id`, `first_name`, `last_name`, `email`, `phone_number`, `birthdate`, `address`, `username`, `password`) VALUES
(1, 'E', 'A', 'eddison2x@gmail.com', '09059596798', '2005-08-11', NULL, 'edd2x', '$2y$10$KSM3erh49p5dk7bvH/krPuGgSBkfcRE3h/gOvWRB4vxGyqNPay2QW'),
(3, 'Kim', 'Escobido', 'kimescobido@gmail.com', '09356598799', '2004-08-29', NULL, 'kim2x', '$2y$10$l8VDTzksUhJhTd.fTMFneud5fNwuvdiNwnMwla.Dsh9Y1.6JEZkru'),
(5, 'Carl Louis', 'Lacre', 'carl@gmail.com', '09356598799', '2004-07-15', 'Brgy. Saray, Roosevelt', 'carl2x', '$2y$10$hUG/2voq.rqP8gwjJSAOeOeuKfgg0v0XG3bO0vDDcz2flKrN/fcoC'),
(6, 'Eddison', 'Abragan', 'gmyuriel@gmail.com', '09059596798', '2005-08-11', 'Brgy. Del Carmen, Zone 3', 'eddison2x', '$2y$10$PYy7uklb4OdS.LuZciibOeKOc8Yjh0iWdYBFBlbvOqOtcZ9f1HdT.'),
(7, 'Edwin Isagani', 'Abaragan', 'edwinisagani@gmail.com', '09265577557', '1964-09-26', 'zone 3 Brgy. Del Carmen', 'eisa_bragi', '$2y$10$9gmZQJjCJHFIokBR/wejjOtSUfr1DB85KjQof8X8EAAbQSua8pCOa'),
(8, 'Cristy', 'Abragan', 'cristy@gmail.com', '09058904331', '1974-11-06', 'Brgy. Del Carmen, Zone 3', 'cristy06', '$2y$10$9E2ikqRRemkDSXnyOEcYD.PSttMr5SMOSnHUrMvmxmTrwL2e5l5Ka'),
(9, 'Eddrian', 'Abragan', 'eddrianabragan@gmail.com', '09069253281', '2000-02-18', 'zone 3 Brgy. Del Carmen', 'Edd', '$2y$10$geuGkUmUv4M96rEELl5qW.pK1oe91.NhzfZpviD1/4GBYiHlCaiyi');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE `results` (
  `result_id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `result_text` text DEFAULT NULL,
  `result_file` varchar(255) DEFAULT NULL,
  `pdf_file` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `results`
--

INSERT INTO `results` (`result_id`, `appointment_id`, `patient_id`, `result_text`, `result_file`, `pdf_file`, `created_at`) VALUES
(21, 24, 3, 'Drug Name & Strength	Amoxicillin 500 mg tablets\r\nSig. (Directions to Patient)	Take one (1) tablet by mouth (PO) three times a day (TID) for 10 days.\r\nDisp. (Quantity to Dispense)	Dispense #30 (Thirty) tablets\r\nRefills	0 (Zero)\r\nDispense as Written (DAW)	(Checked or written out if brand name is required)\r\nIndication (Optional)	For Strep Throat', '1760369554_result.pdf', NULL, '2025-10-13 15:32:34'),
(22, 24, 3, 'yeah', '1760369707_result.pdf', NULL, '2025-10-13 15:35:07'),
(23, 24, 3, 'You\'re now okay.', '1760369731_result.pdf', NULL, '2025-10-13 15:35:31'),
(24, 26, 3, 'lugia', '1760370848_result.pdf', NULL, '2025-10-13 15:54:08'),
(25, 24, 3, 'pokemon mew', '1760370978_result.pdf', NULL, '2025-10-13 15:56:18'),
(27, 24, 3, 'Impression:\r\nCOPD. No acute pulmonary disease.\r\nFindings:\r\nthe lungs are clear. there is hyperinflation of the lungs. there is no pleural effusion or pneumothorax. the heart and mediastinum\r\nare normal. the skeletal structures are normal.\r\nLabels:\r\nhyperinflation; chronic obstructive;\r\ncopd; pulmonary disease', '1760543132_result.pdf', NULL, '2025-10-15 15:45:32'),
(28, 24, 3, 'Impression:\r\nCOPD. No acute pulmonary disease.\r\nFindings:\r\nthe lungs are clear. there is hyperinflation of the lungs. there is no pleural effusion or pneumothorax. the heart and mediastinum\r\nare normal. the skeletal structures are normal.\r\nLabels:\r\nhyperinflation; chronic obstructive;\r\ncopd; pulmonary disease', '1760543152_result.pdf', NULL, '2025-10-15 15:45:52'),
(35, 35, 5, 'test', '1761021975_result.pdf', NULL, '2025-10-21 04:46:15');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_users`
--
ALTER TABLE `admin_users`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appointment_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`patient_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `results`
--
ALTER TABLE `results`
  ADD PRIMARY KEY (`result_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `results_ibfk_1` (`appointment_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_users`
--
ALTER TABLE `admin_users`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `results`
--
ALTER TABLE `results`
  ADD CONSTRAINT `results_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `results_ibfk_2` FOREIGN KEY (`patient_id`) REFERENCES `patient` (`patient_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
