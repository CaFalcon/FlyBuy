/*
 Navicat Premium Data Transfer

 Source Server         : WebShop
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : localhost
 Source Database       : FlyBuy

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : utf-8

 Date: 05/05/2021 18:18:31 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `Address`
-- ----------------------------
DROP TABLE IF EXISTS `Address`;
CREATE TABLE `Address` (
  `AddressID` int NOT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `Street` varchar(255) DEFAULT NULL,
  `StreetNum` int DEFAULT NULL,
  `Zip` int DEFAULT NULL,
  PRIMARY KEY (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `Address`
-- ----------------------------
BEGIN;
INSERT INTO `Address` VALUES ('1', 'Hungary', 'Budapest', 'Ferenc', '24', '5423'), ('2', 'Netherlands', 'Amsterdam', 'Tomo', '3', '8704'), ('3', 'Italy', 'Milano', 'Corvin', '24', '2127'), ('4', 'Switzerland', 'Bern', 'Dologo', '12', '9203'), ('5', 'Italy', 'Roma', 'Tartsay', '3', '5631'), ('6', 'Turkey', 'Ankara', 'Kleh', '29', '3595'), ('7', 'Cambodia', 'Phnom Penh', 'Veeweide', '53', '9051'), ('8', 'Montenegro', 'Kotor', 'Terlanen', '71', '4548'), ('9', 'France', 'Paris', 'Vest', '23', '6093'), ('10', 'Germany', 'Munich', 'Bisdom', '78', '9961'), ('11', 'Poland', 'Warszawa', 'Eirz', '12', '8702'), ('12', 'Germany', 'Hamburg', 'Otten', '3', '9976'), ('13', 'Austria', 'Wien', 'Babelom', '4', '1793'), ('14', 'Austria', 'Wien', 'Meer', '43', '7279'), ('15', 'Germany', 'Frankfurt', 'Bured', '12', '8000'), ('16', 'Austria', 'Wien', 'Distelstraat', '67', '1320'), ('17', 'Germany', 'Hannover', 'Sint', '8', '7279'), ('18', 'Austria', 'Graz', 'Violet', '4', '1468'), ('19', 'Czech', 'Praha', 'Viaduct', '20', '2152'), ('20', 'Czech ', 'Brno', 'Frankenlaan', '12', '8547'), ('21', 'Austria', 'Graz', 'Janonke', '65', '4102'), ('22', 'Hungary', 'Szeged', 'Inkoms', '23', '9209'), ('23', 'Czech ', 'Praha', 'Wouter', '23', '3586'), ('24', 'Croatia', 'Zagreb', 'Haspengo', '9', '5141'), ('25', 'Turkey', 'Istanbul', 'Koming', '12', '1407'), ('26', 'Belarus', 'Mihck', 'Attenhoven', '17', '3370'), ('27', 'Austria', 'Linz', 'Vande', '32', '5373'), ('28', 'Germany', 'Berlin', 'Overwind', '44', '4412'), ('29', 'Czech ', 'Praha', 'Tiensest', '27', '5853'), ('30', 'Hungary', 'Debrecen', 'Szechenyi', '12', '3958'), ('31', 'Spain', 'Madrid', 'Smetanova', '6', '4099'), ('32', 'Turkey', 'Istanbul', 'Paulinyho', '9', '4765'), ('33', 'Slovakia', 'Kosice', 'Rastislavova', '6', '4694'), ('34', 'Spain', 'Barcelona', 'Janteoa', '12', '6310'), ('35', 'Greece', 'Athens', 'Charokopou', '16', '7671'), ('36', 'Turkey', 'Ankara', 'Karanfil', '19', '3335'), ('37', 'Spain', 'Sevilla', 'Guvenlik', '5', '3564'), ('38', 'Greece', 'Athens', 'Charokopou', '24', '7671'), ('39', 'Romania', 'Timisoara', 'Mangalia', '43', '3361'), ('40', 'Romania', 'Bucuresti', 'Concordiei', '2', '5526'), ('41', 'Hungary', 'Budapest', 'Kerepesi', '23', '6378');
COMMIT;

-- ----------------------------
--  Table structure for `Administrator`
-- ----------------------------
DROP TABLE IF EXISTS `Administrator`;
CREATE TABLE `Administrator` (
  `ID` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `Administrator`
-- ----------------------------
BEGIN;
INSERT INTO `Administrator` VALUES ('A001', 'JAY', '345678fghj', '2021-03-10 08:35:04'), ('A002', 'MAY', '456rf8uy', '2021-03-11 08:35:18');
COMMIT;

-- ----------------------------
--  Table structure for `Manufacturer`
-- ----------------------------
DROP TABLE IF EXISTS `Manufacturer`;
CREATE TABLE `Manufacturer` (
  `ManufacturerID` varchar(255) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `AddressID` int DEFAULT NULL,
  `Principal` int DEFAULT NULL,
  `Website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ManufacturerID`),
  KEY `AddressID` (`AddressID`),
  KEY `Principal` (`Principal`),
  KEY `Principal_2` (`Principal`),
  CONSTRAINT `FK9` FOREIGN KEY (`Principal`) REFERENCES `PersonalInformation` (`PersonalID`),
  CONSTRAINT `PK8` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `Manufacturer`
-- ----------------------------
BEGIN;
INSERT INTO `Manufacturer` VALUES ('B001', 'AppleCompany', '6', '5', 'Apple.hu'), ('B002', 'ToyCompany', '5', '6', 'NULL'), ('B003', 'HomeStuff', '41', '34', 'NULL');
COMMIT;

-- ----------------------------
--  Table structure for `MerchantUser`
-- ----------------------------
DROP TABLE IF EXISTS `MerchantUser`;
CREATE TABLE `MerchantUser` (
  `ID` varchar(255) NOT NULL,
  `PersonalID` int DEFAULT NULL,
  `PaymentID` int DEFAULT NULL,
  `AddressID` int DEFAULT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `AdministratorID` varchar(255) DEFAULT NULL,
  `OrderNumber` int DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PaymentID` (`PaymentID`),
  KEY `AddressID` (`AddressID`),
  KEY `FK6` (`PersonalID`),
  KEY `AdministratorID` (`AdministratorID`),
  KEY `OrderNumber` (`OrderNumber`),
  CONSTRAINT `FK13` FOREIGN KEY (`OrderNumber`) REFERENCES `Order` (`OrderNumber`),
  CONSTRAINT `FK16` FOREIGN KEY (`AdministratorID`) REFERENCES `Administrator` (`ID`),
  CONSTRAINT `FK6` FOREIGN KEY (`PersonalID`) REFERENCES `PersonalInformation` (`PersonalID`),
  CONSTRAINT `FK7` FOREIGN KEY (`PaymentID`) REFERENCES `Payment` (`PaymentID`),
  CONSTRAINT `FK8` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `MerchantUser`
-- ----------------------------
BEGIN;
INSERT INTO `MerchantUser` VALUES ('M001', '3', '301', '2', 'Failler', '45678h', 'A002', '3200001', '2021-03-14 08:30:07'), ('M002', '4', '302', '4', 'T', 'yug8ijh', 'A002', '3400005', '2021-03-15 10:30:29'), ('M003', '37', '303', '39', 'Jacob', '1a26pj', 'A002', null, '2021-04-26 09:35:15');
COMMIT;

-- ----------------------------
--  Table structure for `Order`
-- ----------------------------
DROP TABLE IF EXISTS `Order`;
CREATE TABLE `Order` (
  `OrderNumber` int NOT NULL,
  `Quantity` int DEFAULT NULL,
  `State` varchar(255) NOT NULL,
  `Tracking` varchar(255) DEFAULT NULL,
  `TotallyPrice` decimal(10,0) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`OrderNumber`),
  KEY `Tracking` (`Tracking`),
  CONSTRAINT `FK15` FOREIGN KEY (`Tracking`) REFERENCES `Transportation` (`TrackingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `Order`
-- ----------------------------
BEGIN;
INSERT INTO `Order` VALUES ('3200001', '2', 'Transporting', '00129845', '354000', '2021-03-15 09:15:07'), ('3400005', '3', 'Not shipped', null, '433500', '2021-05-04 10:25:53'), ('3400008', '2', 'Transporting', '00348003', '800000', '2021-04-08 10:56:11'), ('3600002', '1', 'Transporting', '00554311', '45000', '2021-04-23 10:56:15');
COMMIT;

-- ----------------------------
--  Table structure for `OrderItem`
-- ----------------------------
DROP TABLE IF EXISTS `OrderItem`;
CREATE TABLE `OrderItem` (
  `OrderNumber` int NOT NULL,
  `ProductID` varchar(255) NOT NULL,
  `ProductName` varchar(255) NOT NULL,
  `Quantity` varchar(255) DEFAULT NULL,
  `Comments` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`OrderNumber`,`ProductID`),
  KEY `ProductID` (`ProductID`),
  KEY `ProductID_2` (`ProductID`),
  KEY `OrderNumber` (`OrderNumber`),
  KEY `ProductID_3` (`ProductID`,`ProductName`),
  CONSTRAINT `FK17` FOREIGN KEY (`OrderNumber`) REFERENCES `Order` (`OrderNumber`),
  CONSTRAINT `FK18` FOREIGN KEY (`ProductID`, `ProductName`) REFERENCES `Product` (`ProductID`, `ProductName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `OrderItem`
-- ----------------------------
BEGIN;
INSERT INTO `OrderItem` VALUES ('3200001', 'P002', 'IPHONE 12', '1', null), ('3200001', 'P003', 'TOY CAR', '1', null), ('3400005', 'P001', 'APPLE TV', '1', null), ('3400005', 'P002', 'IPHONE 12', '1', null), ('3400005', 'P008', 'COFFEE CUP', '1', null), ('3400008', 'P016', 'CAR MODEL', '2', null), ('3600002', 'P007', 'SOFA', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `Payment`
-- ----------------------------
DROP TABLE IF EXISTS `Payment`;
CREATE TABLE `Payment` (
  `PaymentID` int NOT NULL,
  `NameOnCard` varchar(100) DEFAULT NULL,
  `CreditCardNumber` varchar(20) DEFAULT NULL,
  `ExpYear` int DEFAULT NULL,
  `ExpMonth` varchar(20) DEFAULT NULL,
  `CVV` int DEFAULT NULL,
  PRIMARY KEY (`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `Payment`
-- ----------------------------
BEGIN;
INSERT INTO `Payment` VALUES ('298', 'AB', '9875363964824614', '2023', '3', '834'), ('299', 'EF', '6389357246390267', '2024', '4', '422'), ('301', 'IJ', '3987567302963790', '2024', '1', '490'), ('302', 'MN', '4567893456708799', '2022', '12', '803'), ('303', 'Jacob', '4762236527239998', '2024', '2', '350'), ('401', 'User-C', '7370733012032625', '2023', '7', '857'), ('402', 'Vivian', '6192331943284700', '2023', '7', '680'), ('403', 'Nancy', '1812675737245299', '2023', '8', '708'), ('404', 'Melody', '7058457507610420', '2023', '5', '944'), ('405', 'Alice', '2281403212241361', '2023', '4', '515'), ('406', 'Jacquelyn', '3782816047452535', '2023', '7', '786'), ('407', 'Sophia', '4425073323268645', '2023', '5', '126'), ('408', 'Gwndolyn', '5401715210694566', '2023', '3', '789'), ('409', 'Aurora', '5029674405504930', '2023', '6', '829'), ('410', 'Lydia', '8386936134105890', '2023', '3', '422'), ('411', 'Charlotte', '2464303131646635', '2024', '10', '895'), ('412', 'Lily', '5114753611685360', '2024', '3', '983'), ('413', 'Mandy', '8582763123787456', '2024', '6', '202'), ('414', 'Pheobe', '3319004778702303', '2024', '5', '959'), ('415', 'Eduth', '9951379233020728', '2024', '11', '327'), ('416', 'Karen', '3591444210548353', '2024', '1', '930'), ('417', 'Joyce', '3781494402384020', '2024', '5', '427'), ('418', 'Easter', '7352904664642853', '2024', '7', '991'), ('419', 'Ben', '2247386859174989', '2024', '8', '736'), ('420', 'Warren', '3556220315762813', '2024', '11', '728');
COMMIT;

-- ----------------------------
--  Table structure for `PersonalInformation`
-- ----------------------------
DROP TABLE IF EXISTS `PersonalInformation`;
CREATE TABLE `PersonalInformation` (
  `PersonalID` int NOT NULL,
  `Title` varchar(10) DEFAULT NULL,
  `FirstName` varchar(45) DEFAULT NULL,
  `LastName` varchar(45) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telephone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PersonalID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `PersonalInformation`
-- ----------------------------
BEGIN;
INSERT INTO `PersonalInformation` VALUES ('1', 'Mr.', 'A', 'B', 'C', 'D'), ('2', 'Mrs.', 'E', 'F', 'G', 'H'), ('3', 'Mr.', 'I', '', 'K', 'L'), ('4', 'Mr.', 'Vivian', '', '6wqukhbi@gmail.com', '432705550'), ('5', 'Miss', 'Nancy', '', '', '147323581'), ('6', 'Miss', 'Emma', '', '', '477043424'), ('7', 'Mr.', 'Melody', '', 'melody@gmail.com', '231528919'), ('8', 'Miss', 'Alice', '', null, '033185368'), ('9', null, 'Jacquelyn', '', 'f4m95zba@163.com', null), ('10', 'Miss', 'Bella', '', 'bella@gmail.com', '781803894'), ('11', null, 'Selina', '', null, null), ('12', 'Mr.', 'Kate', '', null, '051958331'), ('13', 'Miss', 'Sophia', '', 'sophia33@gmail.com', '520974240'), ('14', null, 'Irene', '', null, '819529083'), ('15', 'Miss', 'Abby', '', 'ucg1oy6k@gmail.com', '307733006'), ('16', 'Mr.', 'Gwndolyn', '', null, null), ('17', null, 'Susan', '', null, '770708554'), ('18', 'Mr.', 'Fiona', '', 'b6rqs520@gmail.com', null), ('19', null, 'Leilani', '', 'leilani@gmail.com', null), ('20', 'Miss', 'Aurora', '', 'ovaybm4f@gmail.com', '273609812'), ('21', null, 'Lydia', '', null, '678780610'), ('22', 'Miss', 'Charlotte', '', 'char@gmail.com', '290346320'), ('23', 'Miss', 'Lily', '', null, '788825960'), ('24', null, 'Karen', '', 'ee5221e0@gmail.com', null), ('25', 'Miss', 'Mandy', '', 'tml4kegl@gmail.com', null), ('26', null, 'Pheobe', '', '9yiby5af@gmail.com', '062934786'), ('27', 'Miss', 'Anne', '', 'anne@gmail.com', null), ('28', null, 'Eduth', '', '5cpuhu1t@gmail.com', '725931977'), ('29', 'Miss', 'Larissa', '', 'larissa@gmail.com', null), ('30', 'Mr.', 'Glen', '', null, '287141598'), ('31', null, 'Joyce', '', 'joyce@gmail.com', '813752683'), ('32', 'Mr.', 'Carl', '', null, '915780906'), ('33', 'Mr.', 'Bill', '', null, '287141598'), ('34', 'Miss', 'Easter', '', 'vpjxnbn8@gmail.com', null), ('35', 'Mr.', 'Ben', '', null, null), ('36', null, 'Warren', '', 'war@gmail.com', '561624883'), ('37', 'Mr.', 'Jacob', null, 'Jacob@gmail.com', '908763216'), ('40', 'Mr.', 'Jack', null, 'Jack789@gmail.com', '678780610');
COMMIT;

-- ----------------------------
--  Table structure for `Product`
-- ----------------------------
DROP TABLE IF EXISTS `Product`;
CREATE TABLE `Product` (
  `ProductID` varchar(255) NOT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `TypeOfProduct` varchar(255) DEFAULT NULL,
  `ProductOwner` varchar(255) DEFAULT NULL,
  `InventoryQuantity` int DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `Currency` varchar(255) DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  `Manufacturer` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  KEY `TypeOfProduct` (`TypeOfProduct`),
  KEY `TypeOfProduct_2` (`TypeOfProduct`),
  KEY `TypeOfProduct_3` (`TypeOfProduct`),
  KEY `TypeOfProduct_4` (`TypeOfProduct`),
  KEY `TypeOfProduct_5` (`TypeOfProduct`),
  KEY `ProductOwner` (`ProductOwner`),
  KEY `ProductOwner_2` (`ProductOwner`),
  KEY `Manufacturer` (`Manufacturer`),
  KEY `Manufacturer_2` (`Manufacturer`),
  KEY `Manufacturer_3` (`Manufacturer`),
  KEY `Manufacturer_4` (`Manufacturer`),
  KEY `Manufacturer_5` (`Manufacturer`),
  KEY `ProductID` (`ProductID`,`ProductName`),
  KEY `ProductID_2` (`ProductID`,`ProductName`,`ProductOwner`),
  CONSTRAINT `FK10` FOREIGN KEY (`Manufacturer`) REFERENCES `Manufacturer` (`ManufacturerID`),
  CONSTRAINT `FK4` FOREIGN KEY (`TypeOfProduct`) REFERENCES `TypeOfProduct` (`ID`),
  CONSTRAINT `FK5` FOREIGN KEY (`ProductOwner`) REFERENCES `MerchantUser` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `Product`
-- ----------------------------
BEGIN;
INSERT INTO `Product` VALUES ('P001', 'APPLE TV', 'T001', 'M003', '10', 'APPLE TV 4K,64GB', 'FT', '79000', 'B001'), ('P002', 'IPHONE 12', 'T001', 'M003', '8', 'IPHONE 12, 64GB,Blue', 'FT', '350000', 'B001'), ('P003', 'TOY CAR', 'T002', 'M002', '2', 'AUDI,A6L,Black', 'FT', '4000', 'B002'), ('P004', 'IPHONE 11', 'T001', 'M003', '12', 'IPHONE 11,128GB,Black', 'FT', '282000', 'B001'), ('P005', 'WALL MURAL', 'T003', 'M001', '2', '0.8m*0.6m', 'FT', '20000', 'B003'), ('P006', 'IPAD AIR', 'T001', 'M003', '5', 'IPAD AIR,256GB,EZUST', 'FT', '300000', 'B001'), ('P007', 'SOFA', 'T003', 'M001', '3', 'LEATHER SOFA,3m*0.9m*0.9m', 'FT', '45000', 'B003'), ('P008', 'COFFEE CUP', 'T003', 'M001', '18', '220ml', 'FT', '4500', 'B003'), ('P009', 'LEGO BUGATTI', 'T002', 'M002', '4', 'BUGATTI', 'FT', '120000', 'B002'), ('P010', 'LEGO PORSCHE', 'T002', 'M002', '6', 'PORSCHE 1974', 'FT', '6500', 'B002'), ('P011', 'LEGO SPACE STATION', 'T002', 'M002', '2', 'SPACE STATION', 'FT', '26000', 'B002'), ('P012', 'IKEA CHAIR', 'T003', 'M001', '3', null, 'FT', '9999', 'B003'), ('P013', 'DYSON VACUUM CLEANER', 'T003', 'M001', '7', 'V11 FLUFFY', 'FT', '220000', 'B003'), ('P014', 'DINING TABLE', 'T003', 'M001', '4', 'WOODEN,1.5m*0.8m*0.8m', 'FT', '60000', 'B003'), ('P015', 'APPLE DISPLAY', 'T001', 'M003', '1', 'PRO DISPLAY XDR NORMAL', 'FT', '1900000', 'B001'), ('P016', 'CAR MODEL', 'T002', 'M002', '9', 'RANGE ROVER VELAR BLACK-RED', 'FT', '40000', 'B002');
COMMIT;

-- ----------------------------
--  Table structure for `ShoppingCart`
-- ----------------------------
DROP TABLE IF EXISTS `ShoppingCart`;
CREATE TABLE `ShoppingCart` (
  `CartID` varchar(255) NOT NULL,
  `ProductID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`CartID`),
  KEY `ProductID` (`ProductID`),
  KEY `ProductID_2` (`ProductID`),
  CONSTRAINT `FK19` FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`),
  CONSTRAINT `FK20` FOREIGN KEY (`CartID`) REFERENCES `User` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `ShoppingCart`
-- ----------------------------
BEGIN;
INSERT INTO `ShoppingCart` VALUES ('U001', 'P002'), ('U004', 'P003'), ('U007', 'P015');
COMMIT;

-- ----------------------------
--  Table structure for `Transportation`
-- ----------------------------
DROP TABLE IF EXISTS `Transportation`;
CREATE TABLE `Transportation` (
  `TrackingID` varchar(255) NOT NULL,
  `StartingPlace` varchar(255) DEFAULT NULL,
  `Destination` varchar(255) DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`TrackingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `Transportation`
-- ----------------------------
BEGIN;
INSERT INTO `Transportation` VALUES ('00129845', 'Pecs', 'Budapest', '2021-03-15 09:21:02'), ('00348003', 'Budapest', 'Phnom Penh', '2021-04-09 10:58:03'), ('00554311', 'Budapest', 'Graz', '2021-04-24 10:58:11');
COMMIT;

-- ----------------------------
--  Table structure for `TypeOfProduct`
-- ----------------------------
DROP TABLE IF EXISTS `TypeOfProduct`;
CREATE TABLE `TypeOfProduct` (
  `ID` varchar(255) NOT NULL,
  `Type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `TypeOfProduct`
-- ----------------------------
BEGIN;
INSERT INTO `TypeOfProduct` VALUES ('T001', 'Electronic '), ('T002', 'Toy'), ('T003', 'HomeStuff');
COMMIT;

-- ----------------------------
--  Table structure for `User`
-- ----------------------------
DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `ID` varchar(255) NOT NULL,
  `PersonalID` int DEFAULT NULL,
  `PaymentID` int DEFAULT NULL,
  `AddressID` int DEFAULT NULL,
  `UserName` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `AdministratorID` varchar(255) DEFAULT NULL,
  `OrderNumber` int DEFAULT NULL,
  `CreatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PersonalID` (`PersonalID`),
  KEY `PaymentID` (`PaymentID`),
  KEY `AddressID` (`AddressID`),
  KEY `AdministratorID` (`AdministratorID`),
  KEY `AdministratorID_2` (`AdministratorID`),
  KEY `AdministratorID_3` (`AdministratorID`),
  KEY `AdministratorID_4` (`AdministratorID`),
  KEY `AdministratorID_5` (`AdministratorID`),
  KEY `OrderNumber` (`OrderNumber`),
  CONSTRAINT `FK` FOREIGN KEY (`PersonalID`) REFERENCES `PersonalInformation` (`PersonalID`),
  CONSTRAINT `FK11` FOREIGN KEY (`AdministratorID`) REFERENCES `Administrator` (`ID`),
  CONSTRAINT `FK14` FOREIGN KEY (`OrderNumber`) REFERENCES `Order` (`OrderNumber`),
  CONSTRAINT `FK2` FOREIGN KEY (`PaymentID`) REFERENCES `Payment` (`PaymentID`),
  CONSTRAINT `FK3` FOREIGN KEY (`AddressID`) REFERENCES `Address` (`AddressID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `User`
-- ----------------------------
BEGIN;
INSERT INTO `User` VALUES ('U001', '1', '298', '1', 'User-A', '123456', 'A001', '3200001', '2021-03-15 04:27:20'), ('U002', '2', '299', '3', 'User-B', '987654', 'A001', '3400005', '2021-03-15 08:28:13'), ('U003', '3', '401', '5', 'User-C', '123333', 'A001', null, '2021-03-16 17:51:03'), ('U004', '4', '402', '6', 'Vivian', 'IzWGhO46', 'A001', null, '2021-03-18 10:09:14'), ('U005', '5', '403', '7', 'Nancy', 'AVtVngMG', 'A001', '3400008', '2022-03-18 17:29:22'), ('U006', '6', null, '8', 'Emma', 'zoVT83Ls', 'A001', null, '2021-04-19 10:09:50'), ('U007', '7', '404', '9', 'Melody', 'dMjbYzCn', 'A001', null, '2021-04-19 12:15:14'), ('U008', '8', '405', '11', 'Alice', 'FcBCHMZX', 'A001', null, '2021-04-19 13:32:02'), ('U009', '9', '406', '12', 'Jacquelyn', 'vbVtUnuR', 'A001', null, '2021-04-19 17:03:35'), ('U010', '10', null, '13', 'Bella', 'jt8epdjZ', 'A001', null, '2021-04-19 19:28:51'), ('U011', '11', null, '15', 'Selina', '8AjEh2eu', 'A001', null, '2021-04-21 07:41:10'), ('U012', '12', null, '14', 'Kate', 'dTA287Uk', 'A001', null, '2021-04-21 10:49:24'), ('U013', '13', '407', '10', 'Sophia', 'ioFPZePv', 'A001', null, '2021-04-21 13:31:34'), ('U014', '14', null, '19', 'Irene', 'l70IC7vS', 'A001', null, '2021-04-21 16:29:52'), ('U015', '15', null, '17', 'Abby', 'DG59vQ8w', 'A001', null, '2021-04-21 19:31:07'), ('U016', '16', '408', '18', 'Gwndolyn', 'HuQNgsBC', 'A001', '3600002', '2021-04-22 02:43:21'), ('U017', '17', null, '16', 'Susan', 'WdEpMLtM', 'A001', null, '2021-04-22 03:42:36'), ('U018', '18', null, '20', 'Fiona', 'd4xTzIla', 'A001', null, '2021-04-22 05:34:57'), ('U019', '19', null, '21', 'Leilani', 'UbEjjFPG', 'A001', null, '2021-04-22 10:14:50'), ('U020', '20', '409', '22', 'Aurora', 'pyAIjXDk', 'A001', null, '2021-04-24 03:14:31'), ('U021', '21', '410', '23', 'Lydia', 'phhPUVE1', 'A001', null, '2021-04-24 07:32:11'), ('U022', '22', '411', '24', 'Charlotte', 'cyVzOIZV', 'A001', null, '2021-04-25 22:12:11'), ('U023', '23', '412', '25', 'Lily', 'VqKhkjdD', 'A001', null, '2021-04-27 08:42:31'), ('U024', '24', null, '26', 'Karen', 'zLMo7JzM', 'A001', null, '2021-04-27 12:12:11'), ('U025', '25', '413', '27', 'Mandy', '2XAjouWg', 'A001', null, '2021-04-27 16:52:26'), ('U026', '26', '414', '28', 'Pheobe', '4xJ7n0Ww', 'A001', null, '2021-04-27 20:42:53'), ('U027', '27', null, '29', 'Anne', 'w3SKbZCM', 'A001', null, '2021-04-27 21:42:51'), ('U028', '28', '415', '30', 'Eduth', 'ZNYLB6HI', 'A001', null, '2021-04-27 23:12:11'), ('U029', '29', null, '31', 'Larissa', 'nL3XaMgg', 'A001', null, '2021-04-29 13:04:27'), ('U030', '30', '416', '32', 'Glen', 'sTMMEM12', 'A001', null, '2021-04-30 21:11:17'), ('U031', '31', '417', '33', 'Joyce', 'iPMvFFMp', 'A001', null, '2021-04-30 23:11:07'), ('U032', '32', null, '34', 'Carl', 'I55LRAAH', 'A001', null, '2021-05-01 20:10:58'), ('U033', '33', null, '35', 'Bill', 'lAA0zDnE', 'A001', null, '2021-05-02 19:10:46'), ('U034', '34', '418', '36', 'Easter', 'REEnuIly', 'A001', null, '2021-05-03 10:10:38'), ('U035', '35', '419', '37', 'Ben', 'reM9mTas', 'A001', null, '2021-05-04 22:10:22'), ('U036', '36', '420', '38', 'Warren', 'fT92zfVg', 'A001', null, '2021-05-03 10:10:11'), ('U037', '40', null, null, 'Jack', 'cdVT83Ls', 'A001', null, '2021-05-04 09:02:52');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
