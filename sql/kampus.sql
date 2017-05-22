/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50527
Source Host           : 127.0.0.1:3306
Source Database       : kampus

Target Server Type    : MYSQL
Target Server Version : 50527
File Encoding         : 65001

Date: 2017-05-22 12:43:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dosen
-- ----------------------------
DROP TABLE IF EXISTS `dosen`;
CREATE TABLE `dosen` (
  `iddosen` varchar(10) NOT NULL,
  `namadosen` varchar(20) NOT NULL,
  PRIMARY KEY (`iddosen`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of dosen
-- ----------------------------
INSERT INTO `dosen` VALUES ('01', 'Dosen 01');
INSERT INTO `dosen` VALUES ('321', 'Dosen 02');

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nama` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix1` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin 123 456');
INSERT INTO `tbl_user` VALUES ('2', 'admin2', '21232f297a57a5a743894a0e4a801fc3', 'admin 345');
