/*
Navicat MySQL Data Transfer

Source Server         : VMWare_ubuntu
Source Server Version : 50534
Source Host           : 192.168.0.111:3306
Source Database       : clothing-store

Target Server Type    : MYSQL
Target Server Version : 50534
File Encoding         : 65001

Date: 2013-12-05 14:59:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `Brand`
-- ----------------------------
DROP TABLE IF EXISTS `Brand`;
CREATE TABLE `Brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Brand
-- ----------------------------
INSERT INTO `Brand` VALUES ('1', 'ALLEN DE LUX', '');
INSERT INTO `Brand` VALUES ('2', 'IVELTA PLUS', '');
INSERT INTO `Brand` VALUES ('3', 'NADIN-N', '');
INSERT INTO `Brand` VALUES ('4', 'VELONA', '');
INSERT INTO `Brand` VALUES ('5', 'NIDA', '');
INSERT INTO `Brand` VALUES ('6', 'МАГИЯ МОДЫ', '');
INSERT INTO `Brand` VALUES ('7', 'LAKBI', null);
INSERT INTO `Brand` VALUES ('8', 'ЮАНТА', '');

-- ----------------------------
-- Table structure for `cart_items`
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items` (
  `cart_id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  KEY `FK8907EDE119DB2023` (`cart_id`),
  CONSTRAINT `FK8907EDE119DB2023` FOREIGN KEY (`cart_id`) REFERENCES `ShoppingCart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart_items
-- ----------------------------

-- ----------------------------
-- Table structure for `Category`
-- ----------------------------
DROP TABLE IF EXISTS `Category`;
CREATE TABLE `Category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `path` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Category
-- ----------------------------
INSERT INTO `Category` VALUES ('1', '', 'Блузки', null);
INSERT INTO `Category` VALUES ('2', '', 'Брюки', null);
INSERT INTO `Category` VALUES ('3', '', 'Детская одежда', null);
INSERT INTO `Category` VALUES ('4', '', 'Платья', null);
INSERT INTO `Category` VALUES ('5', '', 'Пальто', null);
INSERT INTO `Category` VALUES ('6', '', 'Жакеты', null);
INSERT INTO `Category` VALUES ('7', '', 'Костюмы', null);
INSERT INTO `Category` VALUES ('8', '', 'Жилеты', null);

-- ----------------------------
-- Table structure for `Clothing`
-- ----------------------------
DROP TABLE IF EXISTS `Clothing`;
CREATE TABLE `Clothing` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `model` varchar(255) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `brand` int(11) DEFAULT NULL,
  `visible` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK450D2FA87E4832D2` (`category`),
  KEY `FK450D2FA837CA7DF8` (`brand`),
  CONSTRAINT `FK450D2FA837CA7DF8` FOREIGN KEY (`brand`) REFERENCES `Brand` (`id`),
  CONSTRAINT `FK450D2FA87E4832D2` FOREIGN KEY (`category`) REFERENCES `Category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Clothing
-- ----------------------------
INSERT INTO `Clothing` VALUES ('1', 'описание описание описание', '99', 'Ф-45-Т', 'model', '2', '3', null);
INSERT INTO `Clothing` VALUES ('2', 'описание описание описание', '473', 'F--24_HH', 'test', '1', '1', null);
INSERT INTO `Clothing` VALUES ('3', 'hrthrtnjrwthbrsb', '35', 'F-22-rt', 'rtdjr', '3', '4', null);
INSERT INTO `Clothing` VALUES ('4', 'dfbnbrsb', '34', 'H-47-YY', 'dabeb', '5', '6', null);
INSERT INTO `Clothing` VALUES ('5', 'hrthnregerbqre', '54', 'H-34-RR', 'gedsbe', '4', '4', null);
INSERT INTO `Clothing` VALUES ('6', 'erhrtnrsgbfrb', '323', 'G-77-EE', 'wgbdds', '4', '6', null);
INSERT INTO `Clothing` VALUES ('7', 'srehrsnbes', '24', 'G-55-RR', 'dser', '6', '1', null);
INSERT INTO `Clothing` VALUES ('8', 'ehern', '34', 'F-45-WW', 'ehbresn', '3', '3', null);
INSERT INTO `Clothing` VALUES ('9', 'цупуцпцу', '345', 'цпуцу', 'bedsbv', '2', '6', null);
INSERT INTO `Clothing` VALUES ('10', 'whbrerdb', '45', 'E-45-FF', 'fewghesr', '6', '8', null);
INSERT INTO `Clothing` VALUES ('11', 'екпрекуре5ру5екпр', '54', 'В-43-вс', 'кушск', '3', '3', null);

-- ----------------------------
-- Table structure for `Clothing_height`
-- ----------------------------
DROP TABLE IF EXISTS `Clothing_height`;
CREATE TABLE `Clothing_height` (
  `Clothing_id` int(11) NOT NULL,
  `height` smallint(6) DEFAULT NULL,
  KEY `FK3DFDF19E99B827E3` (`Clothing_id`),
  CONSTRAINT `FK3DFDF19E99B827E3` FOREIGN KEY (`Clothing_id`) REFERENCES `Clothing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Clothing_height
-- ----------------------------
INSERT INTO `Clothing_height` VALUES ('1', '160');
INSERT INTO `Clothing_height` VALUES ('1', '172');

-- ----------------------------
-- Table structure for `Clothing_size`
-- ----------------------------
DROP TABLE IF EXISTS `Clothing_size`;
CREATE TABLE `Clothing_size` (
  `Clothing_id` int(11) NOT NULL,
  `size` smallint(6) DEFAULT NULL,
  KEY `FK32F6F23899B827E3` (`Clothing_id`),
  CONSTRAINT `FK32F6F23899B827E3` FOREIGN KEY (`Clothing_id`) REFERENCES `Clothing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Clothing_size
-- ----------------------------
INSERT INTO `Clothing_size` VALUES ('1', '44');
INSERT INTO `Clothing_size` VALUES ('1', '42');
INSERT INTO `Clothing_size` VALUES ('1', '48');

-- ----------------------------
-- Table structure for `Contact`
-- ----------------------------
DROP TABLE IF EXISTS `Contact`;
CREATE TABLE `Contact` (
  `id` int(11) NOT NULL,
  `building` int(11) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `flat` int(11) DEFAULT NULL,
  `house` int(11) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of Contact
-- ----------------------------

-- ----------------------------
-- Table structure for `hibernate_sequences`
-- ----------------------------
DROP TABLE IF EXISTS `hibernate_sequences`;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hibernate_sequences
-- ----------------------------

-- ----------------------------
-- Table structure for `product_images`
-- ----------------------------
DROP TABLE IF EXISTS `product_images`;
CREATE TABLE `product_images` (
  `product_id` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_images
-- ----------------------------
INSERT INTO `product_images` VALUES ('1', 'http://192.168.0.103/resources/img/assets_images_FANTAZIA_57_1.jpg.ce19723794696a7d450fc4850919c696.jpg', 'ываывапывпывпывпыв');
INSERT INTO `product_images` VALUES ('2', 'http://192.168.0.103/resources/img/assets_images_FANTAZIA_57_1.jpg.ce19723794696a7d450fc4850919c696.jpg', 'риавытаыптыат');
INSERT INTO `product_images` VALUES ('3', '/resources/img/assets_images_FANTAZIA_57_1.jpg.ce19723794696a7d450fc4850919c696.jpg', null);
INSERT INTO `product_images` VALUES ('4', '/resources/img/assets_images_FANTAZIA_57_1.jpg.ce19723794696a7d450fc4850919c696.jpg', null);
INSERT INTO `product_images` VALUES ('5', '/resources/img/assets_images_FANTAZIA_57_1.jpg.ce19723794696a7d450fc4850919c696.jpg', null);
INSERT INTO `product_images` VALUES ('6', '/resources/img/assets_images_FANTAZIA_57_1.jpg.ce19723794696a7d450fc4850919c696.jpg', null);
INSERT INTO `product_images` VALUES ('7', '/resources/img/assets_images_FANTAZIA_57_1.jpg.ce19723794696a7d450fc4850919c696.jpg', null);
INSERT INTO `product_images` VALUES ('8', '/resources/img/assets_images_FANTAZIA_57_1.jpg.ce19723794696a7d450fc4850919c696.jpg', null);
INSERT INTO `product_images` VALUES ('9', '/resources/img/assets_images_FANTAZIA_57_1.jpg.ce19723794696a7d450fc4850919c696.jpg', null);

-- ----------------------------
-- Table structure for `ShoppingCart`
-- ----------------------------
DROP TABLE IF EXISTS `ShoppingCart`;
CREATE TABLE `ShoppingCart` (
  `id` int(11) NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ShoppingCart
-- ----------------------------
