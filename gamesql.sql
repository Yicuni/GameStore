/*
 Navicat Premium Data Transfer

 Source Server         : Databases
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : gamesql

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 18/12/2023 17:16:03
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for game
-- ----------------------------
DROP TABLE IF EXISTS `game`;
CREATE TABLE `game`  (
  `GameId` int(0) NOT NULL AUTO_INCREMENT,
  `Title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `Description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `Price` decimal(10, 2) NULL DEFAULT NULL,
  `SaleNum` int(0) NULL DEFAULT NULL,
  `ReleaseDate` date NULL DEFAULT NULL,
  `Type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`GameId`) USING BTREE,
  INDEX `GenreID`(`Type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of game
-- ----------------------------
INSERT INTO `game` VALUES (12, 'Cyberpunk 2077', '一个开放世界的动作冒险游戏，讲述了在夜之城这个充满科技和犯罪的未来都市中，一个名为V的雇佣兵的故事', 298.00, 13000000, '2020-12-10', '角色扮演', '68eede6e-7f9c-4660-8ea8-d648b489d11a_cyberPunk2077.jpg', '/file/');
INSERT INTO `game` VALUES (13, 'Half-Life: Alyx	', '一个专为虚拟现实而设计的第一人称射击游戏，讲述了在《半衰期2》之前，Alyx Vance和她的父亲Eli如何领导反抗军对抗外星入侵者', 198.00, 2000000, '2023-12-04', '角色扮演', 'f5955aca-e746-4396-a974-27edcfaf7726_half-life-alyx.jpg', '/file/');
INSERT INTO `game` VALUES (14, 'Red Dead Redemption 2', '一个西部题材的开放世界的动作冒险游戏，讲述了在1899年美国的衰落时期，一个名为Arthur Morgan的逃犯和他的帮派的故事', 298.00, 36000000, '2019-11-05', '开放世界', '725d122d-d17a-44f1-b518-fc00741d758c_red_dead_redemption2.jpg', '/file/');
INSERT INTO `game` VALUES (15, 'Sekiro: Shadows Die Twice', '一个以日本战国时代为背景的动作冒险游戏，讲述了一个名为狼的忍者，为了保护他的主人，不惜一切代价复仇的故事', 268.00, 5000000, '2023-12-07', '角色扮演', 'fb4191dc-746e-4de7-8d64-0a5827a363e6_Sekiro-Shadows-Die-Twice.jpg', '/file/');
INSERT INTO `game` VALUES (16, 'Monster Hunter: World', '一个以狩猎怪物为主题的动作角色扮演游戏，讲述了一个名为猎人的角色，为了探索新大陆的秘密，而与各种各样的怪物战斗的故事	', 203.00, 17000000, '2018-08-09', '角色扮演', '840f4891-99d5-4f29-aeb6-367d52ebce04_Monster-Hunter-World.jpg', '/file/');
INSERT INTO `game` VALUES (17, 'Resident Evil 2', '一个恐怖题材的生存射击游戏，讲述了一个名为Leon和Claire的警察和学生，为了逃离一个被僵尸感染的城市，而与各种各样的恐怖生物战斗的故事	', 219.00, 8000000, '2023-12-07', '体育与竞速', 'a1bb2185-b45e-4a56-ae61-fdbc6833437a_Resident-Evil-2.jpg', '/file/');
INSERT INTO `game` VALUES (18, 'Doom Eternal', '一个以地狱为背景的第一人称射击游戏，讲述了一个名为末日战士的超级士兵，为了拯救人类，而与各种各样的恶魔战斗的故事', 165.00, 3000000, '2023-12-09', '体育与竞速', '1fab7137-d52f-4ed4-901b-1d84fc2f6204_Doom-Eternal.jpg', '/file/');
INSERT INTO `game` VALUES (19, 'Death Stranding', '一个以末日为背景的动作冒险游戏，讲述了一个名为Sam的快递员，为了重新连接一个被分裂的世界，而与各种各样的敌人和障碍战斗的故事	', 198.00, 5000000, '2023-12-10', '角色扮演', '58f06c9d-4981-495b-ad77-9f0f9ef870fd_DeathStranding.jpg', '/file/');
INSERT INTO `game` VALUES (20, 'The Elder Scrolls VI', '一个以泰姆瑞尔大陆为背景的角色扮演游戏，讲述了一个名为龙裔的英雄，为了阻止一个古老的邪恶，而踏上一段史诗般的冒险的故事', 298.00, 0, '2025-06-25', '开放世界', '87cb03a2-4dcb-4ae7-bc84-fe7cde3a1ff8_The-Elder-Scrolls-VI.jpg', '/file/');
INSERT INTO `game` VALUES (21, 'Grand Theft Auto VI', '一个以美国为背景的开放世界的动作冒险游戏，讲述了一个名为Tommy的罪犯，为了在黑道中崛起，而与各种各样的敌人和警察战斗的故事', 750.00, 0, '2024-10-25', '开放世界', '1bfd2f52-6176-4138-8b71-7c879aa628e2_GrandTheftAutoVI.jpg', '/file/');
INSERT INTO `game` VALUES (22, 'The Last of Us Part III', '一个以末日为背景的生存射击游戏，讲述了一个名为Ellie的女孩，为了寻找她的爱人，而与各种各样的感染者和人类战斗的故事', 398.00, 0, '2024-06-22', '角色扮演', 'a89d43a3-90c3-4265-a772-720b9adeb96c_TheLastofUs.jpg', '/file/');
INSERT INTO `game` VALUES (23, 'God of War: Ragnarok', '一个以北欧神话为背景的动作冒险游戏，讲述了一个名为Kratos的战神，为了保护他的儿子，而与各种各样的神灵和怪物战斗的故事', 368.00, 0, '2025-11-13', '角色扮演', 'e7fbabba-34c9-4885-ac2c-b9998ea72c0d_GodofWar.jpg', '/file/');
INSERT INTO `game` VALUES (24, 'Starfield', '一个以太空为背景的科幻角色扮演游戏，讲述了一个名为星际探险家的角色，为了探索一个充满奇异和危险的银河系，而与各种各样的外星生物和势力战斗的故事', 298.00, 0, '2024-01-01', '角色扮演', '81407bcd-c8bf-45e5-8048-fac2a6855380_Starfield.jpg', '/file/');
INSERT INTO `game` VALUES (25, 'Elden ring', '艾尔登法环是以正统黑暗奇幻世界为舞台的动作RPG游戏。 走进辽阔的场景与地下迷宫探索未知，挑战困难重重的险境，享受克服困境时的成就感吧。', 298.00, 10000000, '2022-02-25', '角色扮演', '32466333-00f1-44db-9888-0f1f6c80df65_Elden-ring.jpg', '/file/');
INSERT INTO `game` VALUES (27, 'Forza Horizon 5', '在世界上最盛大的汽车嘉年华上，不断变化的赛季改变着一切。单枪匹马或者与其他人组队，在一个共享开放世界中探索美丽而富有历史气息的英国。', 188.00, 20000000, '2021-03-10', '开放世界', '35cdc829-84e9-4745-bc1d-df7aae11d260_Forza-Horizon4.jpg', '/file/');

-- ----------------------------
-- Table structure for library
-- ----------------------------
DROP TABLE IF EXISTS `library`;
CREATE TABLE `library`  (
  `LibraryID` int(0) NOT NULL AUTO_INCREMENT,
  `PlayerID` int(0) NULL DEFAULT NULL,
  `GameID` int(0) NULL DEFAULT NULL,
  `PurchaseDate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`LibraryID`) USING BTREE,
  UNIQUE INDEX `unique_player_game`(`PlayerID`, `GameID`) USING BTREE,
  INDEX `GameID`(`GameID`) USING BTREE,
  CONSTRAINT `library_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `users` (`UserID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `library_ibfk_2` FOREIGN KEY (`GameID`) REFERENCES `game` (`GameId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of library
-- ----------------------------
INSERT INTO `library` VALUES (31, 1, 19, NULL);
INSERT INTO `library` VALUES (32, 1, 18, NULL);
INSERT INTO `library` VALUES (33, 1, 17, NULL);
INSERT INTO `library` VALUES (34, 1, 15, NULL);
INSERT INTO `library` VALUES (35, 1, 13, NULL);
INSERT INTO `library` VALUES (37, 1, 27, NULL);
INSERT INTO `library` VALUES (38, 1, 25, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `UserID` int(0) NOT NULL AUTO_INCREMENT,
  `Username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Gender` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `RegistrationTime` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0),
  `UserType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '玩家',
  `Bio` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`UserID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'R.DaneelOlivaw', '000000', 'm19159361751@gmail.com', 'male', '2023-12-11 16:31:11', '玩家', '我买了游戏！我为什么还要玩？');
INSERT INTO `users` VALUES (2, '_Kilimanjaro', '000000', 'm19159361751@hotmail.com', 'male', '2023-12-11 16:32:13', '管理员', ' 一人吃饱，全家不饿！');
INSERT INTO `users` VALUES (3, 'R.DaneelBro1', '000000', 'R.DaneelBro1@gmail.com', 'male', '2023-12-11 17:20:00', '玩家', '俺跟俺哥签名一样的！');
INSERT INTO `users` VALUES (8, '_KilimanjaroBro1', '000000', 'daishuobro1@gmail.com', 'male', '2023-12-11 19:14:27', '管理员', '俺跟俺哥签名一样的！');
INSERT INTO `users` VALUES (10, 'player1', '000000', '222@qq.com', 'male', '2023-12-18 14:57:00', '玩家', '喜欢开挂');
INSERT INTO `users` VALUES (11, '_KilimanjaroBro2', '000000', '333@qq.com', 'male', '2023-12-18 14:59:36', '管理员', '俺跟俺哥签名一样的！');

SET FOREIGN_KEY_CHECKS = 1;
