-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for vohbs
CREATE DATABASE IF NOT EXISTS `vohbs` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `vohbs`;

-- Dumping structure for table vohbs.account
CREATE TABLE IF NOT EXISTS `account` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `user_email` varchar(255) DEFAULT NULL,
  `user_password` varchar(255) DEFAULT NULL,
  `user_type` varchar(50) DEFAULT NULL,
  `fullname` varchar(255) DEFAULT NULL,
  `user_phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table vohbs.account: ~1 rows (approximately)
DELETE FROM `account`;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`userID`, `user_email`, `user_password`, `user_type`, `fullname`, `user_phone`) VALUES
	(1, 'hepa@gmail.com', '123123123', '1', 'HEPA', NULL),
	(2, 'client@gmail.com', '123123123', '0', 'CLIENT', '0123456798'),
	(4, 'president@gmail.com', '123123123', '2', 'PRESIDENT', '0123456798');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- Dumping structure for table vohbs.instrumentbooking
CREATE TABLE IF NOT EXISTS `instrumentbooking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organization` varchar(255) DEFAULT NULL,
  `objective` text,
  `bookDateTime` datetime DEFAULT NULL,
  `instrumentID` int(11) DEFAULT NULL,
  `userID` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table vohbs.instrumentbooking: ~1 rows (approximately)
DELETE FROM `instrumentbooking`;
/*!40000 ALTER TABLE `instrumentbooking` DISABLE KEYS */;
INSERT INTO `instrumentbooking` (`id`, `organization`, `objective`, `bookDateTime`, `instrumentID`, `userID`, `status`) VALUES
	(1, '123123', '123123123', '2023-12-16 14:58:00', 1, 2, NULL);
/*!40000 ALTER TABLE `instrumentbooking` ENABLE KEYS */;

-- Dumping structure for table vohbs.instrumenttype
CREATE TABLE IF NOT EXISTS `instrumenttype` (
  `instrumentID` int(11) NOT NULL AUTO_INCREMENT,
  `instrumentName` varchar(255) DEFAULT NULL,
  `instrumentImg` varchar(255) DEFAULT NULL,
  `instrumentDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`instrumentID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table vohbs.instrumenttype: ~10 rows (approximately)
DELETE FROM `instrumenttype`;
/*!40000 ALTER TABLE `instrumenttype` DISABLE KEYS */;
INSERT INTO `instrumenttype` (`instrumentID`, `instrumentName`, `instrumentImg`, `instrumentDescription`) VALUES
	(1, 'ree', NULL, '324wafd df'),
	(2, 'drum', NULL, NULL),
	(3, '234234234', NULL, NULL),
	(4, '5t', NULL, NULL),
	(5, 'teasadsasd', NULL, NULL),
	(6, 'tesatas', NULL, NULL),
	(7, 'testa', '/studio\\7_EWDAn-XWkAs3Y5T.jpg', NULL),
	(8, 'teasadsasd', '/FYP/studio\\8_coachella.JPG', NULL),
	(9, 'ascsvs', '/FYP/instrument\\9_ryzenwallapaper2.png', NULL),
	(10, 'teasadasd', '/FYP/instrument\\10_EWDAn-XWkAs3Y5T.jpg', 'tested');
/*!40000 ALTER TABLE `instrumenttype` ENABLE KEYS */;

-- Dumping structure for table vohbs.performancebooking
CREATE TABLE IF NOT EXISTS `performancebooking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` varchar(50) NOT NULL DEFAULT '',
  `performanceID` int(11) NOT NULL,
  `performanceDateTime` datetime NOT NULL,
  `objective` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `paymentReceipt` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

-- Dumping data for table vohbs.performancebooking: ~26 rows (approximately)
DELETE FROM `performancebooking`;
/*!40000 ALTER TABLE `performancebooking` DISABLE KEYS */;
INSERT INTO `performancebooking` (`id`, `userID`, `performanceID`, `performanceDateTime`, `objective`, `organization`, `paymentReceipt`, `status`) VALUES
	(1, '2', 1, '2023-12-18 02:40:00', '123123', '123', NULL, 'approved'),
	(2, '2', 1, '2023-12-21 21:29:00', '123123', '123', NULL, 'approved'),
	(3, '2', 1, '2023-12-17 22:43:00', '12312', '3123123', NULL, 'declined'),
	(4, '2', 1, '2023-12-17 22:43:00', '12312', '3123123', NULL, NULL),
	(5, '2', 1, '2023-12-17 22:43:00', '12312', '3123123', NULL, NULL),
	(6, '2', 1, '2023-12-17 22:43:00', '12312', '3123123', NULL, NULL),
	(7, '2', 1, '2023-12-17 22:43:00', '12312', '3123123', NULL, NULL),
	(8, '2', 1, '2023-12-17 22:43:00', '12312', '3123123', NULL, NULL),
	(9, '2', 1, '2023-12-17 22:43:00', '12312', '3123123', NULL, NULL),
	(10, '2', 1, '2023-12-17 22:43:00', '12312', '3123123', NULL, NULL),
	(11, '2', 1, '2023-12-17 22:43:00', '12312', '3123123', NULL, NULL),
	(12, '2', 1, '2023-12-17 22:43:00', '12312', '3123123', NULL, NULL),
	(13, '2', 1, '2023-12-17 22:43:00', '12312', '3123123', NULL, NULL),
	(14, '2', 1, '2023-12-17 22:43:00', '12312', '3123123', NULL, NULL),
	(15, '2', 1, '2023-12-17 22:43:00', '12312', '3123123', NULL, NULL),
	(16, '2', 1, '2023-12-17 22:43:00', '12312', '3123123', NULL, NULL),
	(17, '2', 1, '2023-12-28 23:10:00', '2123', '1231', NULL, NULL),
	(18, '2', 1, '2023-12-28 23:10:00', '2123', '1231', NULL, NULL),
	(19, '2', 1, '2023-12-28 23:10:00', '2123', '1231', NULL, NULL),
	(20, '2', 1, '2023-12-28 23:10:00', '2123', '1231', 'E:\\WORKPLACE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\FYP\\payments\\20_WhatsApp Image 2023-12-06 at 10.01.37 PM.jpeg', NULL),
	(21, '2', 1, '2023-12-28 23:10:00', '2123', '1231', NULL, NULL),
	(22, '2', 1, '2023-12-28 23:10:00', '2123', '1231', NULL, NULL),
	(23, '2', 1, '2023-12-28 23:10:00', '2123', '1231', NULL, NULL),
	(24, '2', 1, '2023-12-28 23:10:00', '2123', '1231', NULL, NULL),
	(25, '2', 1, '2023-12-28 23:10:00', '2123', '1231', NULL, NULL),
	(26, '2', 1, '2023-12-28 23:10:00', '2123', '1231', 'E:\\WORKPLACE\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\FYP\\payments\\26_WhatsApp Image 2023-12-06 at 9.58.20 PM (1).jpeg', NULL),
	(27, '2', 1, '2023-12-19 02:14:00', '213123', 'teast', '/FYP/studio\\27_Capture.JPG', NULL),
	(28, '2', 1, '2023-12-28 03:24:00', 'gj', 'fdsdfsdf', '/FYP/studio\\28_Capture.JPG', NULL),
	(29, '2', 1, '2023-12-28 03:24:00', 'gjrtyrty', 'fdsdfsdfrtyrty', '/FYP/studio\\29_187554049_5556084047766476_8399719802538659129_n.jpg', NULL);
/*!40000 ALTER TABLE `performancebooking` ENABLE KEYS */;

-- Dumping structure for table vohbs.performancetype
CREATE TABLE IF NOT EXISTS `performancetype` (
  `performanceID` int(11) NOT NULL AUTO_INCREMENT,
  `performanceName` varchar(255) DEFAULT NULL,
  `performanceDesc` text,
  `image` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  PRIMARY KEY (`performanceID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table vohbs.performancetype: ~1 rows (approximately)
DELETE FROM `performancetype`;
/*!40000 ALTER TABLE `performancetype` DISABLE KEYS */;
INSERT INTO `performancetype` (`performanceID`, `performanceName`, `performanceDesc`, `image`, `price`) VALUES
	(1, 'Solo', 'Solo', 'https://cdn.store-assets.com/s/261800/f/9445770.jpg', 50),
	(3, 'Acoustic', 'Acoustic', '/FYP/performance\\3_Capture.JPG', 100),
	(4, 'Full Band', 'Full Band', '/FYP/performance\\20231219032343_ahla-logo.png', 200);
/*!40000 ALTER TABLE `performancetype` ENABLE KEYS */;

-- Dumping structure for table vohbs.studiobooking
CREATE TABLE IF NOT EXISTS `studiobooking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `studioID` int(11) DEFAULT NULL,
  `startDateTime` datetime DEFAULT NULL,
  `finishDateTime` datetime DEFAULT NULL,
  `objective` varchar(255) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table vohbs.studiobooking: ~0 rows (approximately)
DELETE FROM `studiobooking`;
/*!40000 ALTER TABLE `studiobooking` DISABLE KEYS */;
INSERT INTO `studiobooking` (`id`, `userID`, `studioID`, `startDateTime`, `finishDateTime`, `objective`, `organization`, `status`) VALUES
	(2, 2, 1, '2023-12-17 12:00:00', '2023-12-20 12:00:00', '123', '123', NULL),
	(3, 2, 1, '2023-12-25 12:00:00', '2023-12-27 12:00:00', '112312', '3123123', NULL),
	(4, 1, 11, '2023-12-26 12:00:00', '2023-12-26 12:00:00', '4534', '4353', NULL);
/*!40000 ALTER TABLE `studiobooking` ENABLE KEYS */;

-- Dumping structure for table vohbs.studiotype
CREATE TABLE IF NOT EXISTS `studiotype` (
  `studioID` int(11) NOT NULL AUTO_INCREMENT,
  `studioName` varchar(255) DEFAULT NULL,
  `studioImg` varchar(255) DEFAULT NULL,
  `studioDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`studioID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table vohbs.studiotype: ~9 rows (approximately)
DELETE FROM `studiotype`;
/*!40000 ALTER TABLE `studiotype` DISABLE KEYS */;
INSERT INTO `studiotype` (`studioID`, `studioName`, `studioImg`, `studioDescription`) VALUES
	(11, 'teasdasd', '/FYP/studio\\11_Capture.JPG', '23423');
/*!40000 ALTER TABLE `studiotype` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
