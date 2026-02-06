-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2026 at 02:29 AM
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
-- Database: `tvlstc_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `logo_initials` varchar(10) DEFAULT NULL,
  `color_class` varchar(50) DEFAULT NULL,
  `overview` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `mission` text DEFAULT NULL,
  `vision` text DEFAULT NULL,
  `services` text DEFAULT NULL,
  `social_fb` varchar(255) DEFAULT NULL,
  `social_web` varchar(255) DEFAULT NULL,
  `social_linkedin` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `name`, `image_url`, `logo_initials`, `color_class`, `overview`, `description`, `mission`, `vision`, `services`, `social_fb`, `social_web`, `social_linkedin`) VALUES
(1, 'ATB Car Rental Services', 'assets/images/CAR_RENTAL_LOGO.png', 'ATB', 'bg-blue-600', 'Reliable car rental services for corporate and personal use.', 'Antonio T. Biñas (ATB) Car Rental Services is a customer-focused transportation company dedicated to providing secure, dependable, and practical mobility solutions. ATB Car Rental Services provides a varied fleet of well-maintained vehicles to fulfill the growing need for accessible and flexible travel options.', 'To offer comfortable, convenient, and reasonably priced transportation options while guaranteeing top-notch customer service on every journey.', 'To become the most reputable and preferred automobile rental company, known for dependability, cost-effectiveness, and first-rate service.', 'Short-term car rentals, Long-term rentals, Airport pick-up/drop-off services', '#', '#', '#'),
(2, 'ETB Industrial Facilities Construction', 'assets/images/ETB_logo.png', 'ETB', 'bg-slate-700', 'Trusted construction company specializing in high-quality industrial facilities.', 'ETB Industrial Facilities Construction is a trusted construction company specializing in the design, development, and construction of high-quality industrial facilities. We are committed to delivering safe, durable, and cost-efficient structures that support the operational success of our clients.', 'To deliver high-quality, safe, and cost-efficient industrial construction projects on time and within budget through reliable project management, skilled workmanship, and ethical business practices.', 'To deliver high-quality, safe, and cost-efficient industrial construction projects on time and within budget through reliable project management, skilled workmanship, and ethical business practices.', 'Warehouses and distribution centers, Manufacturing and production plants, Steel structure buildings, Factory and processing facilities', '#', '#', '#'),
(3, 'LABANGO LAUNDRY SERVICES', 'assets/images/laba_logo.png', 'LLS', 'bg-cyan-500', 'Modern laundromat redefining the everyday laundry experience.', 'LABANGO LAUNDRY SERVICES is a modern laundromat brand built to redefine the everyday laundry experience. Our mission is simple: provide fast, reliable, and hassle-free laundry services in a clean, comfortable, and technologically enhanced environment. LABANGO serves individuals, families, students, and local businesses that value quality, convenience, and affordability.', 'To provide clean, fast and reliable laundry solutions through modern equipment, exceptional customer service, and environmentally responsible practices making everyday life easier.', 'To Become the most trusted and recognized laundromat brand in the Philippines through consistent service, versatile solutions and a commitment to customer comfort and sustainability.', 'Wash, Fold, Dry, Ironing, Free Delivery Option', '#', '#', '#'),
(4, 'ATB Apartment', 'assets/images/apartment_logo.png', 'ATB', 'bg-blue-600', 'Affordable, practical, and secure living spaces for professionals and small families.', 'ATB Apartment offers affordable, practical, and comfortable living spaces specifically designed for individuals, small families, and starting professionals. Committed to providing a safe and clean environment, ATB offers budget-friendly units that maximize comfort and convenience for those beginning their independent journey.', 'To provide affordable, secure, and comfortable living spaces that support individuals and families in building a stable, convenient, and practical start in life.', 'To be a trusted apartment provider known for accessible rates, well-maintained units, and reliable service—helping more people find a comfortable home within their means.', 'Budget-friendly Units, Spacious Family Units, Secure & Maintained Facility', '#', '#', '#');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
