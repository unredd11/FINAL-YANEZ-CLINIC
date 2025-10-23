-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 23, 2025 at 08:02 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

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
(47, 7, 'Physical Examination', '2025-10-22', '10:00:00', 'Pending', '', 'online', '9249028586314710J', '2025-10-21 10:53:43'),
(48, 8, 'X-Ray', '2025-10-22', '13:00:00', 'Completed', 'Chest X-Ray', 'walkin', '', '2025-10-21 16:10:50'),
(54, 8, 'Laboratory Testing', '2025-10-22', '14:00:00', 'Pending', '', 'walkin', '', '2025-10-21 16:10:05'),
(55, 8, 'Laboratory Testing', '2025-10-22', '11:30:00', 'Pending', '', 'online', '76L54589599055640', '2025-10-21 23:46:30'),
(58, 10, 'Laboratory Testing', '2025-10-22', '15:30:00', 'Completed', '', 'online', '2V081566AF215002U', '2025-10-22 07:06:36'),
(59, 11, 'Laboratory Testing', '2025-10-23', '15:30:00', 'Accepted', '', 'walkin', '', '2025-10-22 07:17:32'),
(60, 12, 'Laboratory Testing', '2025-10-22', '15:30:00', 'Completed', '', 'online', '15094969RB4560832', '2025-10-22 07:28:23'),
(61, 13, 'X-Ray', '2025-10-22', '16:00:00', 'Completed', '', 'online', '90L92918AB987094C', '2025-10-22 07:34:07'),
(62, 1, 'Laboratory Testing', '2025-10-23', '14:00:00', 'Pending', '', 'walkin', '', '2025-10-22 13:40:15'),
(63, 1, 'X-Ray', '2025-10-23', '15:30:00', 'Completed', '', 'walkin', '', '2025-10-22 13:41:42'),
(65, 28, 'Physical Examination', '2025-10-23', '10:30:00', 'Completed', '', 'walkin', '', '2025-10-23 02:28:39'),
(66, 32, 'Laboratory Testing', '2025-10-23', '14:00:00', 'Completed', '', 'online', '4F5894318P141371T', '2025-10-23 02:53:16'),
(67, 1, 'Physical Examination', '2025-10-24', '15:30:00', 'Pending', '', 'walkin', '', '2025-10-23 03:23:07');

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
(1, 'Eddison', 'Abragan', 'eddison2x@gmail.com', '09059596798', '2005-08-11', NULL, 'edd2x', '$2y$10$KSM3erh49p5dk7bvH/krPuGgSBkfcRE3h/gOvWRB4vxGyqNPay2QW'),
(3, 'Kim', 'Escobido', 'kimescobido@gmail.com', '09356598799', '2004-08-29', NULL, 'kim2x', '$2y$10$l8VDTzksUhJhTd.fTMFneud5fNwuvdiNwnMwla.Dsh9Y1.6JEZkru'),
(5, 'Carl Louis', 'Lacre', 'carl@gmail.com', '09356598799', '2004-07-15', 'Brgy. Saray, Roosevelt', 'carl2x', '$2y$10$hUG/2voq.rqP8gwjJSAOeOeuKfgg0v0XG3bO0vDDcz2flKrN/fcoC'),
(6, 'Eddison', 'Abragan', 'gmyuriel@gmail.com', '09059596798', '2005-08-11', 'Brgy. Del Carmen, Zone 3', 'eddison2x', '$2y$10$PYy7uklb4OdS.LuZciibOeKOc8Yjh0iWdYBFBlbvOqOtcZ9f1HdT.'),
(7, 'Edwin Isagani', 'Abaragan', 'edwinisagani@gmail.com', '09265577557', '1964-09-26', 'zone 3 Brgy. Del Carmen', 'eisa_bragi', '$2y$10$9gmZQJjCJHFIokBR/wejjOtSUfr1DB85KjQof8X8EAAbQSua8pCOa'),
(8, 'Cristy', 'Abragan', 'cristy@gmail.com', '09058904331', '1974-11-06', 'Brgy. Del Carmen, Zone 3', 'cristy06', '$2y$10$9E2ikqRRemkDSXnyOEcYD.PSttMr5SMOSnHUrMvmxmTrwL2e5l5Ka'),
(9, 'Eddrian', 'Abragan', 'eddrianabragan@gmail.com', '09069253281', '2000-02-18', 'zone 3 Brgy. Del Carmen', 'Edd', '$2y$10$geuGkUmUv4M96rEELl5qW.pK1oe91.NhzfZpviD1/4GBYiHlCaiyi'),
(10, 'Maria Cristina', 'Abragan', 'cristina@gmail.com', '09171804679', '1973-06-09', 'Zone 3 Del Carmen', 'cristina09', '$2y$10$/ODCK8X3mx7NuZNZMeq4D.fCoBTNRQsCGxb3ixA6q3lzRV37xXda2'),
(11, 'Julia Cate', 'Ople', 'Juliacate.ople123@gmail.com', '09853381369', '2004-07-24', 'Dalipuga Iligan City', 'madam_baby', '$2y$10$NAsjG1WD6MJ9ugXXWOF7KO8pEIxlEpcWtJvyZ1ysM74aeZX54En72'),
(12, 'Vib', 'Gade', 'vib@gmail.com', '09942570945', '1979-05-01', 'Ubaldo Laya', 'vib01', '$2y$10$XpjviGuk28WajRMOtaMxmeKTC4LAXix7qqIUaDbjtCj8Lvw52PM0W'),
(13, 'Recardo Alvina', 'Castillo', 'recardo@gmail.com', '09678720889', '1970-03-27', 'Brgy. Tibanga', 'recardo27', '$2y$10$hzuQAFh28AYa9Rr9TWiBAubREjFUnoQPKe7YG5GAUyI4FND/dLiNy'),
(14, 'Flavia', 'Co', 'flavia05@gmail.com', '09548567167', '1944-10-05', 'Zone 3 Del Carmen', 'flavia05', '$2y$10$N9WJmbnpQ2nyxILoHDEzhepGz9glI3AND0kbQbebml09oAdaWya9W'),
(15, 'Vilma', 'Dela Torre', 'delatorrevilma5@gmail.com', '09525601525', '1973-06-17', 'Picardal St.Mahayay', 'vilma17', '$2y$10$QBgP97hQeqxUUXyBAyj0ZOP2uS4QSeEZFH70eaO2N5MofgVoWbtby'),
(16, 'Richard', 'Vallente', 'richard14@gmail.com', '09262157626', '1967-12-14', 'Zone 3 Del Carmen', 'richard14', '$2y$10$uQyZhzkT1aLExhO32vXXcucKKg/tzQtEukOYPElbPxH34jBEfahd.'),
(17, 'RicaMel', 'Diosmanos', 'vricamel@gmail.com', '09619978082', '1995-09-03', 'Zone 3 Del Carmen', 'ricamel03', '$2y$10$uDmB0NMFeIi3Y8CikbDPUOIfm1O5pYDk2Gv0acXj0XPAF3dTuAcw2'),
(18, 'Dante', 'Carbonel', 'dantecarbonel@gmail.com', '09066916899', '1960-11-09', 'Zone 3 Del Carmen', 'dante09', '$2y$10$l1aC/nBprwax8HBBRzZ7ieJSndAQwHwwAjSpyVhWHATCFvv.Yx6GS'),
(19, 'Estrella', 'Carbonel', 'estrellac@gmail.com', '09066916899', '1963-06-24', 'Zone 4 Del Carmen', 'estrella24', '$2y$10$x9/TYbWmD1AH3FrglK912usri5Po76qbV5KC4yoKgvd1x7oka1UeK'),
(20, 'Elizabeth', 'Subrado', 'elizabeth.12@gmail.com', '09553707232', '1960-12-06', 'Zone 3 Del Carmen', 'elizabeth06', '$2y$10$P5aAgClfkx6hwM17yGWy/.N45/kn/qxcEryf58EMGJDfTmfssckUC'),
(21, 'joely', 'subrado', 'joelysubrado08@gmail.com', '09359815397', '1958-04-08', 'Zone 3 Del Carmen', 'joely08', '$2y$10$9NXPbZQgOHJM8DimPFR.9e88S5L4HEoLdoYyHLFVQgFnCSx8xP6zi'),
(22, 'Juvy', 'Delana', 'juvy.subrado1@gmail.com', '09978716841', '1983-10-20', 'Zone 3 Del Carmen', 'juvys', '$2y$10$P4Zq7DtJsK7Zm79mqYZPN.23XoRqI7Ui3TwwvtkxpXIZBhH06WW/.'),
(23, 'James', 'Delana', 'jdelana@gmail.com', '09754079351', '1984-09-21', 'Zone 3 Del Carmen', 'james', '$2y$10$W.dT2MUVWtjTyx0kzBd6P.D/MsPY6e4jDFn6AgHZ/hzcPeTOmFvry'),
(24, 'Lyra', 'Ponce', 'lyr.mzp@gmail.com', '0955849732', '2006-08-21', 'Carbide Village Tubod Iligan City', 'lyra21', '$2y$10$oooEv1ENAyyX0NcCORaZ4.AKhdHg7LzLLzXqM29WJ6lXZI0NBj66O'),
(25, 'shekainah lou', 'carsido', 'shekainahcarsido@318gmail.com', '09126127246', '2006-09-10', 'Pugaan', 'shekainahcarsdio@318gmail.com', '$2y$10$Gn4mF97k9k60JTGch.1gv.YoTl3DShYsuBFVtpoB1HTiLyGP4S6a.'),
(26, 'jayford', 'saylan', 'jayfordsaylan@gmail.com', '09704917217', '2008-01-03', 'puro,lower,ruruanga pugaan iligan city', 'saylanjayford', '$2y$10$2GGy/yPbwGPj7P/gthNyXeWGs7MDyFHmQRcn/t77wwIfp.R4/wnIy'),
(27, 'jelwin', 'agcopra', 'agcopra_jelwin@gmail.com', '09811030961', '2008-04-22', 'pugaan', 'shibal', '$2y$10$1QoCUMglXmjAIGrNWbzhTuiPTl1H36ZyJoW8hd7qjr80m7wFSpZ9W'),
(28, 'Donatilla', 'Pancito', 'donatilla_pancito@yahoo.com', '09052337319', '1973-07-30', 'Purok 6 Bliss Upper Hinaplanon Iligan City', 'donatilla', '$2y$10$eeWAroofWitBfpqRbDkZG.jDdlJJrLfLbgBXm0m8LGpH/RLa6NF2K'),
(29, 'Grace', 'Alicabo', 'gracealicabo@gmail.com', '0935129423', '1977-04-11', 'Manticao Poblacion', 'grace11', '$2y$10$FfCRCINNcDLWQDwAIRLziOAI/2obege.XZMi2hweXLvwgajBSn5r.'),
(30, 'jhea', 'malinao', 'taberosjhea@gmail.com', '09652111318', '2007-04-17', 'linamon lanao del norte', 'jheaa', '$2y$10$VXTvKrl9qPyJrOw7soQ5L.oaRb0NBU6MPpMGLvKx94EJxXIVVeM1G'),
(31, 'Evangeline', 'malinao', 'evangeline03@gmail.com', '09652111318', '1981-03-03', 'linamon lanao del norte', 'evangeline03', '$2y$10$/0gnjKLSShex1JvZiSk8FOWoh/tHHtg7GA7.TRL5WOiOHRa2.02iS'),
(32, 'evan', 'bernos', 'fliesevan@yahoo.com', '09538967620', '1988-10-26', 'suarez,ic', 'fliesevan', '$2y$10$0WNpRqrv5lV1Yvp/aIy9aO6OyMJ2wb4magMS9vnzY4w1H0Dk.NU/K'),
(33, 'Melvin', 'Ponce', 'melvin_ponce19@gmail.com', '09558753282', '1970-12-19', 'Carbide Village ', 'melvin19', '$2y$10$deom5EmC/EU9biofj9E1pe8hryc6ym31qF3Dt05hEbuMAG6akTpca'),
(34, 'Jade Mariane', 'Pacatang', 'jadepacatang@gmail.com', '09169115435', '1992-09-08', 'Mahayahay', 'jademariane08', '$2y$10$bXgNo7wSXodmi8e4dVBvg.dxaZEOIzfGfQZxCf5JpXxqizkUMbBaa'),
(35, 'Paul Deber', 'Vallente', 'pdcabzvallz@gmail.com', '09309269505', '2000-12-03', 'zone 3 Brgy. Del Carmen', 'Paul2x32', '$2y$10$kQAR6LfaB9SK0OoMmUkIlu8RvAl.n0XJMkjTflV2cQ3Ct8rS3cHtq'),
(36, 'Amelia', 'Vallente', 'amelia1958@gmail.com', '09750878847', '1958-04-29', 'zone 3 Brgy. Del Carmen', 'AmeliaV', '$2y$10$SXjsxG/dBBTuQFWJNhO1ZeuQdV5HHDqG6H5SNvnljrw3pbYcbjRY.');

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
(39, 48, 8, 'test', '1761063050_result.pdf', NULL, '2025-10-21 16:10:50'),
(41, 58, 10, 'test 1', '1761116870_result.pdf', NULL, '2025-10-22 07:07:50'),
(42, 60, 12, 'test', '1761118103_result.pdf', NULL, '2025-10-22 07:28:23'),
(43, 61, 13, 'test', '1761118447_result.pdf', NULL, '2025-10-22 07:34:07'),
(44, 63, 1, 'test', '1761140502_result.pdf', NULL, '2025-10-22 13:41:42'),
(45, 65, 28, 'test', '1761186519_result.pdf', NULL, '2025-10-23 02:28:39'),
(46, 66, 32, 'test', '1761187996_result.pdf', NULL, '2025-10-23 02:53:16');

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
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `results`
--
ALTER TABLE `results`
  MODIFY `result_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

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
