CREATE DATABASE  IF NOT EXISTS `dbpointofsale`;
USE `dbpointofsale`;

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `User_ID` int(3) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Full_Name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `User_Type` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `activitylog`;
CREATE TABLE `activitylog` (
  `Activity_Log_ID` int unsigned NOT NULL AUTO_INCREMENT,
  `User_ID` int(3) unsigned zerofill NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Activity` varchar(45) NOT NULL,
  `Created_At` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Activity_Log_ID`),
  FOREIGN KEY (`User_ID`) REFERENCES `user`(`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `additional_products`;
CREATE TABLE `additional_products` (
  `Additional_Products_ID` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Price` int unsigned NOT NULL,
  `Status` varchar(45) NOT NULL,
  `Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Additional_Products_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `cup_size`;
CREATE TABLE `cup_size` (
  `Cup_Size_ID` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Price` int unsigned NOT NULL,
  `Stocks` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`Cup_Size_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `customertype`;
CREATE TABLE `customertype` (
  `Customer_Type_ID` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Discount` double NOT NULL,
  PRIMARY KEY (`Customer_Type_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `Customer_ID` int(4) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Customer_Type_ID` int(2) unsigned zerofill NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Contact_Number` varchar(11) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Number_of_Purchase` int NOT NULL,
  `Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Customer_ID`),
  FOREIGN KEY (`Customer_Type_ID`) REFERENCES `customertype`(`Customer_Type_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `milktea`;
CREATE TABLE `milktea` (
  `Milktea_ID` int(5) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Price` int unsigned NOT NULL,
  `Status` varchar(45) NOT NULL,
  `Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Milktea_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `others`;
CREATE TABLE `others` (
  `Others_ID` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Stock` int unsigned NOT NULL DEFAULT '0',
  `is_displayed` tinyint(1) NOT NULL DEFAULT '0',
  `Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Others_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `payment_type`;
CREATE TABLE `payment_type` (
  `Payment_Type_ID` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Payment_Type_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `promo`;
CREATE TABLE `promo` (
  `Promo_ID` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Description` longtext NOT NULL,
  `Discount` double NOT NULL DEFAULT '0',
  `Enable` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`Promo_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `service_type`;
CREATE TABLE `service_type` (
  `Service_Type_ID` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Service_Type_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `sugar_level`;
CREATE TABLE `sugar_level` (
  `Sugar_Level_ID` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  PRIMARY KEY (`Sugar_Level_ID`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `add_ons`;
CREATE TABLE `add_ons` (
  `Add_Ons_ID` int(2) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Price` int unsigned NOT NULL,
  `Status` varchar(45) NOT NULL,
  `Updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Add_Ons_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

DROP TABLE IF EXISTS `receipt`;CREATE TABLE `receipt` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Receipt_ID` int(6) unsigned zerofill NOT NULL,
  `Payment_Type_ID` int(2) unsigned zerofill NOT NULL,
  `Service_Type_ID` int(2) unsigned zerofill NOT NULL,
  `User_ID` int(3) unsigned zerofill NOT NULL,
  `Customer_ID` int(4) unsigned zerofill ,
  `Milktea_ID` int(5) unsigned zerofill,
  `Cup_Size_ID` int(2) unsigned zerofill,
  `Add_Ons_ID` int(2) unsigned zerofill,
  `Additional_Products_ID` int(2) unsigned zerofill,
  `Quantity` int NOT NULL,
  `Price` DECIMAL NOT NULL,
  `Date_Processed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  FOREIGN KEY (`Payment_Type_ID`) REFERENCES `payment_type`(`Payment_Type_ID`),
  FOREIGN KEY (`Service_Type_ID`) REFERENCES `service_type`(`Service_Type_ID`),
  FOREIGN KEY (`User_ID`) REFERENCES `user`(`User_ID`),
  FOREIGN KEY (`Customer_ID`) REFERENCES `customer`(`Customer_ID`),
  FOREIGN KEY (`Milktea_ID`) REFERENCES `milktea`(`Milktea_ID`),
  FOREIGN KEY (`Cup_Size_ID`) REFERENCES `cup_size`(`Cup_Size_ID`),
  FOREIGN KEY (`Add_Ons_ID`) REFERENCES `add_ons`(`Add_Ons_ID`),
  FOREIGN KEY (`Additional_Products_ID`) REFERENCES `additional_products`(`Additional_Products_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction` (
  `Transaction_ID` int(6) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Receipt_ID` int(6) unsigned zerofill NOT NULL,
  `Payment_Type_ID` int(2) unsigned zerofill NOT NULL,
  `Service_Type_ID` int(2) unsigned zerofill NOT NULL,
  `User_ID` int(3) unsigned zerofill NOT NULL,
  `Customer_ID` int(4) unsigned zerofill ,
  `Milktea_ID` int(5) unsigned zerofill,
  `Cup_Size_ID` int(2) unsigned zerofill,
  `Add_Ons_ID` int(2) unsigned zerofill,
  `Additional_Products_ID` int(2) unsigned zerofill,
  `Sugar_Level_ID` int(2) unsigned zerofill,
  `Others_ID` int(2) unsigned zerofill,
  `Other_Items` json DEFAULT NULL,
  `Price` int NOT NULL,
  `Quantity` int unsigned NOT NULL,
  `Promo_Discount` DECIMAL DEFAULT NULL,
  `Customer_Discount` DECIMAL DEFAULT NULL,
  `Total_Discount` DECIMAL DEFAULT NULL,
  `Total` DECIMAL unsigned NOT NULL,
  `Payment` DECIMAL NOT NULL DEFAULT '0',
  `Change` DECIMAL NOT NULL DEFAULT '0',
  `Date_Processed` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Transaction_ID`),
  FOREIGN KEY (`Payment_Type_ID`) REFERENCES `payment_type`(`Payment_Type_ID`),
  FOREIGN KEY (`Service_Type_ID`) REFERENCES `service_type`(`Service_Type_ID`),
  FOREIGN KEY (`User_ID`) REFERENCES `user`(`User_ID`),
  FOREIGN KEY (`Customer_ID`) REFERENCES `customer`(`Customer_ID`),
  FOREIGN KEY (`Milktea_ID`) REFERENCES `milktea`(`Milktea_ID`),
  FOREIGN KEY (`Cup_Size_ID`) REFERENCES `cup_size`(`Cup_Size_ID`),
  FOREIGN KEY (`Add_Ons_ID`) REFERENCES `add_ons`(`Add_Ons_ID`),
  FOREIGN KEY (`Additional_Products_ID`) REFERENCES `additional_products`(`Additional_Products_ID`),
  FOREIGN KEY (`Sugar_Level_ID`) REFERENCES `sugar_level`(`Sugar_Level_ID`),
  FOREIGN KEY (`Others_ID`) REFERENCES `others`(`Others_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=100000 DEFAULT CHARSET=utf8mb4;

INSERT INTO `customertype` VALUES (01,'Regular',0);
INSERT INTO `service_type` VALUES (01,'Dine-in'), (02,'Take-out');
INSERT INTO `sugar_level` VALUES (01,'0%'), (02,'25%'), (03,'50%'), (04,'75%'), (05,'100%');
INSERT INTO `payment_type` VALUES (01,'Cash');
INSERT INTO `add_ons` VALUES (01,'None',0,'Available','2022-02-17 00:27:59');
INSERT INTO `promo` VALUES (01,'None','No Discount',0, true);