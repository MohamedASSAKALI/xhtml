-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 08 juin 2024 à 17:32
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `g_cabinet`
--

-- --------------------------------------------------------

--
-- Structure de la table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
CREATE TABLE IF NOT EXISTS `appointment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `duration` int NOT NULL,
  `patient_id` int NOT NULL,
  `doctor_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_appointment_patient` (`patient_id`),
  KEY `fk_appointment_doctor` (`doctor_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctor`
--

DROP TABLE IF EXISTS `doctor`;
CREATE TABLE IF NOT EXISTS `doctor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `specialization` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `revenu_total` decimal(10,2) NOT NULL,
  `status` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_patient` (`patient_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `invoice`
--

INSERT INTO `invoice` (`id`, `patient_id`, `revenu_total`, `status`) VALUES
(1, 2, 202.00, 'paid'),
(2, 2, 400.00, 'paid'),
(3, 3, 100.00, 'unpaid');

-- --------------------------------------------------------

--
-- Structure de la table `invoiceitem`
--

DROP TABLE IF EXISTS `invoiceitem`;
CREATE TABLE IF NOT EXISTS `invoiceitem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `prix` decimal(10,2) NOT NULL,
  `quantite` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `acte` varchar(100) DEFAULT NULL,
  `invoice_id` int NOT NULL,
  `appointment_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoiceitem_invoice` (`invoice_id`),
  KEY `fk_invoiceitem_appointment` (`appointment_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `patient`
--

DROP TABLE IF EXISTS `patient`;
CREATE TABLE IF NOT EXISTS `patient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date_naiss` date NOT NULL,
  `address` varchar(100) NOT NULL,
  `numtelephone` varchar(20) NOT NULL,
  `antecedents_medicaux` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`, `email`) VALUES
(1, 'zaki', '$2y$10$5BmtqpS4QtBwTeIcshtHe.KOYzGmYJJWm90dXZF/GM6QfkcuXQxG6', '', 'Zaki@gmail.com'),
(2, 'few', '$2y$10$W1CgkkOpn4ZELyD6m1YbuOfxooe8JYQNXeFKgAOiVMr3Xiw0hvzC2', 'Apah', 'feeew@gmail.com');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
