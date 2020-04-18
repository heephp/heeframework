/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : heeframework

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 18/04/2020 11:58:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for heeframework_config
-- ----------------------------
DROP TABLE IF EXISTS `heeframework_config`;
CREATE TABLE `heeframework_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of heeframework_config
-- ----------------------------
INSERT INTO `heeframework_config` VALUES (1, '网站名称', 'website_name', '', NULL);
INSERT INTO `heeframework_config` VALUES (2, '网站关键词', 'website_keyword', '', NULL);
INSERT INTO `heeframework_config` VALUES (3, '网站描述', 'website_description', '', NULL);
INSERT INTO `heeframework_config` VALUES (4, '网站网址', 'website_url', '', NULL);
INSERT INTO `heeframework_config` VALUES (5, '网站统计', 'website_tongji', NULL, NULL);
INSERT INTO `heeframework_config` VALUES (6, '网站Logo', 'website_logo', '', NULL);
INSERT INTO `heeframework_config` VALUES (7, '公司名称', 'company_name', '', NULL);
INSERT INTO `heeframework_config` VALUES (8, '公司地址', 'company_addr', NULL, NULL);
INSERT INTO `heeframework_config` VALUES (9, '公司电话', 'company_tel', NULL, NULL);
INSERT INTO `heeframework_config` VALUES (10, '公司联系人', 'company_contact', '', NULL);
INSERT INTO `heeframework_config` VALUES (11, '公司联系人电话', 'company_contact_mobile', '', NULL);
INSERT INTO `heeframework_config` VALUES (12, '公司邮箱', 'company_email', '', NULL);
INSERT INTO `heeframework_config` VALUES (13, '开启验证码', 'is_vcode', '1', NULL);
INSERT INTO `heeframework_config` VALUES (14, '上传文件目录', 'upload_dir', './uploads/', NULL);
INSERT INTO `heeframework_config` VALUES (15, '上传文件大小', 'upload_size', '500', '单位K');
INSERT INTO `heeframework_config` VALUES (16, '上传文件格式', 'upload_ext', '*.*', '*.jpg,*.gif');
INSERT INTO `heeframework_config` VALUES (17, '验证码宽度', 'vcode_width', '100', NULL);
INSERT INTO `heeframework_config` VALUES (18, '验证码高度', 'vcode_heigh', '36', NULL);
INSERT INTO `heeframework_config` VALUES (19, '验证码干扰数量', 'vcode_line_count', '20', '5-20');
INSERT INTO `heeframework_config` VALUES (20, '上传文件命名', 'upload_file_name', 'md5', 'md5,timespan,guid');
INSERT INTO `heeframework_config` VALUES (21, '分页数量', 'pagesize', '0', '如果该值为0，则采用系统配置的值');
INSERT INTO `heeframework_config` VALUES (22, '新用户组', 'newusergroup', NULL, '新用户注册后的用户组');
INSERT INTO `heeframework_config` VALUES (23, '是否开启水印', 'watermark', '1', NULL);
INSERT INTO `heeframework_config` VALUES (24, '水印位置', 'watermark_postion', '8', NULL);
INSERT INTO `heeframework_config` VALUES (25, '水印图片', 'watermark_img', '', NULL);
INSERT INTO `heeframework_config` VALUES (26, '水印字体', 'watermark_font', '', NULL);
INSERT INTO `heeframework_config` VALUES (27, '水印字体大小', 'watermark_fontsize', '16', NULL);
INSERT INTO `heeframework_config` VALUES (28, '发邮件主机', 'mail_smtp_server', '', NULL);
INSERT INTO `heeframework_config` VALUES (29, '发邮件用户名', 'mail_smtp_username', '', NULL);
INSERT INTO `heeframework_config` VALUES (30, '发邮件密码', 'mail_smtp_password', '', NULL);
INSERT INTO `heeframework_config` VALUES (31, '发邮件端口', 'mail_smtp_port', '25', NULL);
INSERT INTO `heeframework_config` VALUES (32, '发件人邮箱', 'mail_sender', '', NULL);
INSERT INTO `heeframework_config` VALUES (33, '短信AccessKeyId', 'sms_accessKeyId', '', NULL);
INSERT INTO `heeframework_config` VALUES (34, '短信签名', 'sms_SingName', '', '短信签名多个用半角逗号分隔');
INSERT INTO `heeframework_config` VALUES (35, '短信模板', 'sms_TemplateCode', '', '短信模板多个用半个逗号分隔');
INSERT INTO `heeframework_config` VALUES (36, '公司介绍', 'company_desc', '', NULL);
INSERT INTO `heeframework_config` VALUES (37, '水印文字', 'watermark_txt', '水印文字', NULL);
INSERT INTO `heeframework_config` VALUES (38, '验证码位数', 'vcode_num', '4', '验证码生成的位数');
INSERT INTO `heeframework_config` VALUES (39, '验证码字符', 'vcode_char', 'lower', 'all所有 char字母 upper大写 lower小写 number数字');
INSERT INTO `heeframework_config` VALUES (40, '验证码字体大小', 'vcode_fontsize', '20', NULL);
INSERT INTO `heeframework_config` VALUES (41, '短信AccessKeySecret', 'sms_accessKeySecret', '', NULL);

-- ----------------------------
-- Table structure for heeframework_country
-- ----------------------------
DROP TABLE IF EXISTS `heeframework_country`;
CREATE TABLE `heeframework_country`  (
  `country_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`country_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of heeframework_country
-- ----------------------------
INSERT INTO `heeframework_country` VALUES (1, '中国', 'CHINA');
INSERT INTO `heeframework_country` VALUES (2, '阿尔巴尼亚', 'ALB');
INSERT INTO `heeframework_country` VALUES (3, '阿尔及利亚', 'DZA');
INSERT INTO `heeframework_country` VALUES (4, '阿富汗', 'AFG');
INSERT INTO `heeframework_country` VALUES (5, '阿根廷', 'ARG');
INSERT INTO `heeframework_country` VALUES (6, '阿拉伯联合酋长国', 'ARE');
INSERT INTO `heeframework_country` VALUES (7, '阿鲁巴', 'ABW');
INSERT INTO `heeframework_country` VALUES (8, '阿曼', 'OMN');
INSERT INTO `heeframework_country` VALUES (9, '阿塞拜疆', 'AZE');
INSERT INTO `heeframework_country` VALUES (10, '阿森松岛', 'ASC');
INSERT INTO `heeframework_country` VALUES (11, '埃及', 'EGY');
INSERT INTO `heeframework_country` VALUES (12, '埃塞俄比亚', 'ETH');
INSERT INTO `heeframework_country` VALUES (13, '爱尔兰', 'IRL');
INSERT INTO `heeframework_country` VALUES (14, '爱沙尼亚', 'EST');
INSERT INTO `heeframework_country` VALUES (15, '安道尔', 'AND');
INSERT INTO `heeframework_country` VALUES (16, '安哥拉', 'AGO');
INSERT INTO `heeframework_country` VALUES (17, '安圭拉', 'AIA');
INSERT INTO `heeframework_country` VALUES (18, '安提瓜岛和巴布达', 'ATG');
INSERT INTO `heeframework_country` VALUES (19, '奥地利', 'AUT');
INSERT INTO `heeframework_country` VALUES (20, '奥兰群岛', 'ALA');
INSERT INTO `heeframework_country` VALUES (21, '澳大利亚', 'AUS');
INSERT INTO `heeframework_country` VALUES (22, '巴巴多斯岛', 'BRB');
INSERT INTO `heeframework_country` VALUES (23, '巴布亚新几内亚', 'PNG');
INSERT INTO `heeframework_country` VALUES (24, '巴哈马', 'BHS');
INSERT INTO `heeframework_country` VALUES (25, '巴基斯坦', 'PAK');
INSERT INTO `heeframework_country` VALUES (26, '巴拉圭', 'PRY');
INSERT INTO `heeframework_country` VALUES (27, '巴勒斯坦', 'PSE');
INSERT INTO `heeframework_country` VALUES (28, '巴林', 'BHR');
INSERT INTO `heeframework_country` VALUES (29, '巴拿马', 'PAN');
INSERT INTO `heeframework_country` VALUES (30, '巴西', 'BRA');
INSERT INTO `heeframework_country` VALUES (31, '白俄罗斯', 'BLR');
INSERT INTO `heeframework_country` VALUES (32, '百慕大', 'BMU');
INSERT INTO `heeframework_country` VALUES (33, '保加利亚', 'BGR');
INSERT INTO `heeframework_country` VALUES (34, '北马里亚纳群岛', 'MNP');
INSERT INTO `heeframework_country` VALUES (35, '贝宁', 'BEN');
INSERT INTO `heeframework_country` VALUES (36, '比利时', 'BEL');
INSERT INTO `heeframework_country` VALUES (37, '冰岛', 'ISL');
INSERT INTO `heeframework_country` VALUES (38, '波多黎各', 'PRI');
INSERT INTO `heeframework_country` VALUES (39, '波兰', 'POL');
INSERT INTO `heeframework_country` VALUES (40, '波斯尼亚和黑塞哥维那', 'BIH');
INSERT INTO `heeframework_country` VALUES (41, '玻利维亚', 'BOL');
INSERT INTO `heeframework_country` VALUES (42, '伯利兹', 'BLZ');
INSERT INTO `heeframework_country` VALUES (43, '博茨瓦纳', 'BWA');
INSERT INTO `heeframework_country` VALUES (44, '不丹', 'BTN');
INSERT INTO `heeframework_country` VALUES (45, '布基纳法索', 'BFA');
INSERT INTO `heeframework_country` VALUES (46, '布隆迪', 'BDI');
INSERT INTO `heeframework_country` VALUES (47, '布韦岛', 'BVT');
INSERT INTO `heeframework_country` VALUES (48, '朝鲜', 'PRK');
INSERT INTO `heeframework_country` VALUES (49, '丹麦', 'DNK');
INSERT INTO `heeframework_country` VALUES (50, '德国', 'DEU');
INSERT INTO `heeframework_country` VALUES (51, '东帝汶', 'TLS');
INSERT INTO `heeframework_country` VALUES (52, '多哥', 'TGO');
INSERT INTO `heeframework_country` VALUES (53, '多米尼加', 'DMA');
INSERT INTO `heeframework_country` VALUES (54, '多米尼加共和国', 'DOM');
INSERT INTO `heeframework_country` VALUES (55, '俄罗斯', 'RUS');
INSERT INTO `heeframework_country` VALUES (56, '厄瓜多尔', 'ECU');
INSERT INTO `heeframework_country` VALUES (57, '厄立特里亚', 'ERI');
INSERT INTO `heeframework_country` VALUES (58, '法国', 'FRA');
INSERT INTO `heeframework_country` VALUES (59, '法罗群岛', 'FRO');
INSERT INTO `heeframework_country` VALUES (60, '法属波利尼西亚', 'PYF');
INSERT INTO `heeframework_country` VALUES (61, '法属圭亚那', 'GUF');
INSERT INTO `heeframework_country` VALUES (62, '法属南部领地', 'ATF');
INSERT INTO `heeframework_country` VALUES (63, '梵蒂冈', 'VAT');
INSERT INTO `heeframework_country` VALUES (64, '菲律宾', 'PHL');
INSERT INTO `heeframework_country` VALUES (65, '斐济', 'FJI');
INSERT INTO `heeframework_country` VALUES (66, '芬兰', 'FIN');
INSERT INTO `heeframework_country` VALUES (67, '佛得角', 'CPV');
INSERT INTO `heeframework_country` VALUES (68, '弗兰克群岛', 'FLK');
INSERT INTO `heeframework_country` VALUES (69, '冈比亚', 'GMB');
INSERT INTO `heeframework_country` VALUES (70, '刚果', 'COG');
INSERT INTO `heeframework_country` VALUES (71, '刚果民主共和国', 'COD');
INSERT INTO `heeframework_country` VALUES (72, '哥伦比亚', 'COL');
INSERT INTO `heeframework_country` VALUES (73, '哥斯达黎加', 'CRI');
INSERT INTO `heeframework_country` VALUES (74, '格恩西岛', 'GGY');
INSERT INTO `heeframework_country` VALUES (75, '格林纳达', 'GRD');
INSERT INTO `heeframework_country` VALUES (76, '格陵兰', 'GRL');
INSERT INTO `heeframework_country` VALUES (77, '古巴', 'CUB');
INSERT INTO `heeframework_country` VALUES (78, '瓜德罗普', 'GLP');
INSERT INTO `heeframework_country` VALUES (79, '关岛', 'GUM');
INSERT INTO `heeframework_country` VALUES (80, '圭亚那', 'GUY');
INSERT INTO `heeframework_country` VALUES (81, '哈萨克斯坦', 'KAZ');
INSERT INTO `heeframework_country` VALUES (82, '海地', 'HTI');
INSERT INTO `heeframework_country` VALUES (83, '韩国', 'KOR');
INSERT INTO `heeframework_country` VALUES (84, '荷兰', 'NLD');
INSERT INTO `heeframework_country` VALUES (85, '荷属安地列斯', 'ANT');
INSERT INTO `heeframework_country` VALUES (86, '赫德和麦克唐纳群岛', 'HMD');
INSERT INTO `heeframework_country` VALUES (87, '洪都拉斯', 'HND');
INSERT INTO `heeframework_country` VALUES (88, '基里巴斯', 'KIR');
INSERT INTO `heeframework_country` VALUES (89, '吉布提', 'DJI');
INSERT INTO `heeframework_country` VALUES (90, '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `heeframework_country` VALUES (91, '几内亚', 'GIN');
INSERT INTO `heeframework_country` VALUES (92, '几内亚比绍', 'GNB');
INSERT INTO `heeframework_country` VALUES (93, '加拿大', 'CAN');
INSERT INTO `heeframework_country` VALUES (94, '加纳', 'GHA');
INSERT INTO `heeframework_country` VALUES (95, '加蓬', 'GAB');
INSERT INTO `heeframework_country` VALUES (96, '柬埔寨', 'KHM');
INSERT INTO `heeframework_country` VALUES (97, '捷克共和国', 'CZE');
INSERT INTO `heeframework_country` VALUES (98, '津巴布韦', 'ZWE');
INSERT INTO `heeframework_country` VALUES (99, '喀麦隆', 'CMR');
INSERT INTO `heeframework_country` VALUES (100, '卡塔尔', 'QAT');
INSERT INTO `heeframework_country` VALUES (101, '开曼群岛', 'CYM');
INSERT INTO `heeframework_country` VALUES (102, '科科斯群岛', 'CCK');
INSERT INTO `heeframework_country` VALUES (103, '科摩罗', 'COM');
INSERT INTO `heeframework_country` VALUES (104, '科特迪瓦', 'CIV');
INSERT INTO `heeframework_country` VALUES (105, '科威特', 'KWT');
INSERT INTO `heeframework_country` VALUES (106, '克罗地亚', 'HRV');
INSERT INTO `heeframework_country` VALUES (107, '肯尼亚', 'KEN');
INSERT INTO `heeframework_country` VALUES (108, '库克群岛', 'COK');
INSERT INTO `heeframework_country` VALUES (109, '拉脱维亚', 'LVA');
INSERT INTO `heeframework_country` VALUES (110, '莱索托', 'LSO');
INSERT INTO `heeframework_country` VALUES (111, '老挝', 'LAO');
INSERT INTO `heeframework_country` VALUES (112, '黎巴嫩', 'LBN');
INSERT INTO `heeframework_country` VALUES (113, '立陶宛', 'LTU');
INSERT INTO `heeframework_country` VALUES (114, '利比里亚', 'LBR');
INSERT INTO `heeframework_country` VALUES (115, '利比亚', 'LBY');
INSERT INTO `heeframework_country` VALUES (116, '列支敦士登', 'LIE');
INSERT INTO `heeframework_country` VALUES (117, '留尼旺岛', 'REU');
INSERT INTO `heeframework_country` VALUES (118, '卢森堡', 'LUX');
INSERT INTO `heeframework_country` VALUES (119, '卢旺达', 'RWA');
INSERT INTO `heeframework_country` VALUES (120, '罗马尼亚', 'ROU');
INSERT INTO `heeframework_country` VALUES (121, '马达加斯加', 'MDG');
INSERT INTO `heeframework_country` VALUES (122, '马尔代夫', 'MDV');
INSERT INTO `heeframework_country` VALUES (123, '马耳他', 'MLT');
INSERT INTO `heeframework_country` VALUES (124, '马拉维', 'MWI');
INSERT INTO `heeframework_country` VALUES (125, '马来西亚', 'MYS');
INSERT INTO `heeframework_country` VALUES (126, '马里', 'MLI');
INSERT INTO `heeframework_country` VALUES (127, '马其顿', 'MKD');
INSERT INTO `heeframework_country` VALUES (128, '马绍尔群岛', 'MHL');
INSERT INTO `heeframework_country` VALUES (129, '马提尼克', 'MTQ');
INSERT INTO `heeframework_country` VALUES (130, '马约特岛', 'MYT');
INSERT INTO `heeframework_country` VALUES (131, '曼岛', 'IMN');
INSERT INTO `heeframework_country` VALUES (132, '毛里求斯', 'MUS');
INSERT INTO `heeframework_country` VALUES (133, '毛里塔尼亚', 'MRT');
INSERT INTO `heeframework_country` VALUES (134, '美国', 'USA');
INSERT INTO `heeframework_country` VALUES (135, '美属萨摩亚', 'ASM');
INSERT INTO `heeframework_country` VALUES (136, '美属外岛', 'UMI');
INSERT INTO `heeframework_country` VALUES (137, '蒙古', 'MNG');
INSERT INTO `heeframework_country` VALUES (138, '蒙特塞拉特', 'MSR');
INSERT INTO `heeframework_country` VALUES (139, '孟加拉', 'BGD');
INSERT INTO `heeframework_country` VALUES (140, '秘鲁', 'PER');
INSERT INTO `heeframework_country` VALUES (141, '密克罗尼西亚', 'FSM');
INSERT INTO `heeframework_country` VALUES (142, '缅甸', 'MMR');
INSERT INTO `heeframework_country` VALUES (143, '摩尔多瓦', 'MDA');
INSERT INTO `heeframework_country` VALUES (144, '摩洛哥', 'MAR');
INSERT INTO `heeframework_country` VALUES (145, '摩纳哥', 'MCO');
INSERT INTO `heeframework_country` VALUES (146, '莫桑比克', 'MOZ');
INSERT INTO `heeframework_country` VALUES (147, '墨西哥', 'MEX');
INSERT INTO `heeframework_country` VALUES (148, '纳米比亚', 'NAM');
INSERT INTO `heeframework_country` VALUES (149, '南非', 'ZAF');
INSERT INTO `heeframework_country` VALUES (150, '南极洲', 'ATA');
INSERT INTO `heeframework_country` VALUES (151, '南乔治亚和南桑德威奇群岛', 'SGS');
INSERT INTO `heeframework_country` VALUES (152, '瑙鲁', 'NRU');
INSERT INTO `heeframework_country` VALUES (153, '尼泊尔', 'NPL');
INSERT INTO `heeframework_country` VALUES (154, '尼加拉瓜', 'NIC');
INSERT INTO `heeframework_country` VALUES (155, '尼日尔', 'NER');
INSERT INTO `heeframework_country` VALUES (156, '尼日利亚', 'NGA');
INSERT INTO `heeframework_country` VALUES (157, '纽埃', 'NIU');
INSERT INTO `heeframework_country` VALUES (158, '挪威', 'idR');
INSERT INTO `heeframework_country` VALUES (159, '诺福克', 'NFK');
INSERT INTO `heeframework_country` VALUES (160, '帕劳群岛', 'PLW');
INSERT INTO `heeframework_country` VALUES (161, '皮特凯恩', 'PCN');
INSERT INTO `heeframework_country` VALUES (162, '葡萄牙', 'PRT');
INSERT INTO `heeframework_country` VALUES (163, '乔治亚', 'GEO');
INSERT INTO `heeframework_country` VALUES (164, '日本', 'JPN');
INSERT INTO `heeframework_country` VALUES (165, '瑞典', 'SWE');
INSERT INTO `heeframework_country` VALUES (166, '瑞士', 'CHE');
INSERT INTO `heeframework_country` VALUES (167, '萨尔瓦多', 'SLV');
INSERT INTO `heeframework_country` VALUES (168, '萨摩亚', 'WSM');
INSERT INTO `heeframework_country` VALUES (169, '塞尔维亚,黑山', 'SCG');
INSERT INTO `heeframework_country` VALUES (170, '塞拉利昂', 'SLE');
INSERT INTO `heeframework_country` VALUES (171, '塞内加尔', 'SEN');
INSERT INTO `heeframework_country` VALUES (172, '塞浦路斯', 'CYP');
INSERT INTO `heeframework_country` VALUES (173, '塞舌尔', 'SYC');
INSERT INTO `heeframework_country` VALUES (174, '沙特阿拉伯', 'SAU');
INSERT INTO `heeframework_country` VALUES (175, '圣诞岛', 'CXR');
INSERT INTO `heeframework_country` VALUES (176, '圣多美和普林西比', 'STP');
INSERT INTO `heeframework_country` VALUES (177, '圣赫勒拿', 'SHN');
INSERT INTO `heeframework_country` VALUES (178, '圣基茨和尼维斯', 'KNA');
INSERT INTO `heeframework_country` VALUES (179, '圣卢西亚', 'LCA');
INSERT INTO `heeframework_country` VALUES (180, '圣马力诺', 'SMR');
INSERT INTO `heeframework_country` VALUES (181, '圣皮埃尔和米克隆群岛', 'SPM');
INSERT INTO `heeframework_country` VALUES (182, '圣文森特和格林纳丁斯', 'VCT');
INSERT INTO `heeframework_country` VALUES (183, '斯里兰卡', 'LKA');
INSERT INTO `heeframework_country` VALUES (184, '斯洛伐克', 'SVK');
INSERT INTO `heeframework_country` VALUES (185, '斯洛文尼亚', 'SVN');
INSERT INTO `heeframework_country` VALUES (186, '斯瓦尔巴和扬马廷', 'SJM');
INSERT INTO `heeframework_country` VALUES (187, '斯威士兰', 'SWZ');
INSERT INTO `heeframework_country` VALUES (188, '苏丹', 'SDN');
INSERT INTO `heeframework_country` VALUES (189, '苏里南', 'SUR');
INSERT INTO `heeframework_country` VALUES (190, '所罗门群岛', 'SLB');
INSERT INTO `heeframework_country` VALUES (191, '索马里', 'SOM');
INSERT INTO `heeframework_country` VALUES (192, '塔吉克斯坦', 'TJK');
INSERT INTO `heeframework_country` VALUES (193, '泰国', 'THA');
INSERT INTO `heeframework_country` VALUES (194, '坦桑尼亚', 'TZA');
INSERT INTO `heeframework_country` VALUES (195, '汤加', 'TON');
INSERT INTO `heeframework_country` VALUES (196, '特克斯和凯克特斯群岛', 'TCA');
INSERT INTO `heeframework_country` VALUES (197, '特里斯坦达昆哈', 'TAA');
INSERT INTO `heeframework_country` VALUES (198, '特立尼达和多巴哥', 'TTO');
INSERT INTO `heeframework_country` VALUES (199, '突尼斯', 'TUN');
INSERT INTO `heeframework_country` VALUES (200, '图瓦卢', 'TUV');
INSERT INTO `heeframework_country` VALUES (201, '土耳其', 'TUR');
INSERT INTO `heeframework_country` VALUES (202, '土库曼斯坦', 'TKM');
INSERT INTO `heeframework_country` VALUES (203, '托克劳', 'TKL');
INSERT INTO `heeframework_country` VALUES (204, '瓦利斯和福图纳', 'WLF');
INSERT INTO `heeframework_country` VALUES (205, '瓦努阿图', 'VUT');
INSERT INTO `heeframework_country` VALUES (206, '危地马拉', 'GTM');
INSERT INTO `heeframework_country` VALUES (207, '维尔京群岛，美属', 'VIR');
INSERT INTO `heeframework_country` VALUES (208, '维尔京群岛，英属', 'VGB');
INSERT INTO `heeframework_country` VALUES (209, '委内瑞拉', 'VEN');
INSERT INTO `heeframework_country` VALUES (210, '文莱', 'BRN');
INSERT INTO `heeframework_country` VALUES (211, '乌干达', 'UGA');
INSERT INTO `heeframework_country` VALUES (212, '乌克兰', 'UKR');
INSERT INTO `heeframework_country` VALUES (213, '乌拉圭', 'URY');
INSERT INTO `heeframework_country` VALUES (214, '乌兹别克斯坦', 'UZB');
INSERT INTO `heeframework_country` VALUES (215, '西班牙', 'ESP');
INSERT INTO `heeframework_country` VALUES (216, '希腊', 'GRC');
INSERT INTO `heeframework_country` VALUES (217, '新加坡', 'SGP');
INSERT INTO `heeframework_country` VALUES (218, '新喀里多尼亚', 'NCL');
INSERT INTO `heeframework_country` VALUES (219, '新西兰', 'NZL');
INSERT INTO `heeframework_country` VALUES (220, '匈牙利', 'HUN');
INSERT INTO `heeframework_country` VALUES (221, '叙利亚', 'SYR');
INSERT INTO `heeframework_country` VALUES (222, '牙买加', 'JAM');
INSERT INTO `heeframework_country` VALUES (223, '亚美尼亚', 'ARM');
INSERT INTO `heeframework_country` VALUES (224, '也门', 'YEM');
INSERT INTO `heeframework_country` VALUES (225, '伊拉克', 'IRQ');
INSERT INTO `heeframework_country` VALUES (226, '伊朗', 'IRN');
INSERT INTO `heeframework_country` VALUES (227, '以色列', 'ISR');
INSERT INTO `heeframework_country` VALUES (228, '意大利', 'ITA');
INSERT INTO `heeframework_country` VALUES (229, '印度', 'IND');
INSERT INTO `heeframework_country` VALUES (230, '印度尼西亚', 'IDN');
INSERT INTO `heeframework_country` VALUES (231, '英国', 'GBR');
INSERT INTO `heeframework_country` VALUES (232, '英属印度洋领地', 'IOT');
INSERT INTO `heeframework_country` VALUES (233, '约旦', 'JOR');
INSERT INTO `heeframework_country` VALUES (234, '越南', 'VNM');
INSERT INTO `heeframework_country` VALUES (235, '赞比亚', 'ZMB');
INSERT INTO `heeframework_country` VALUES (236, '泽西岛', 'JEY');
INSERT INTO `heeframework_country` VALUES (237, '乍得', 'TCD');
INSERT INTO `heeframework_country` VALUES (238, '直布罗陀', 'GIB');
INSERT INTO `heeframework_country` VALUES (239, '智利', 'CHL');
INSERT INTO `heeframework_country` VALUES (240, '中非共和国', 'CAF');

-- ----------------------------
-- Table structure for heeframework_menus
-- ----------------------------
DROP TABLE IF EXISTS `heeframework_menus`;
CREATE TABLE `heeframework_menus`  (
  `menus_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '图标',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `ord` int(255) DEFAULT NULL COMMENT '排序',
  `create_users_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`menus_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for heeframework_message
-- ----------------------------
DROP TABLE IF EXISTS `heeframework_message`;
CREATE TABLE `heeframework_message`  (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `users_id` int(11) DEFAULT NULL,
  `receiver_users_id` int(11) DEFAULT NULL,
  `all` int(255) DEFAULT NULL COMMENT '是否是所有人都接收',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `isread` int(1) DEFAULT 0 COMMENT '是否已读  1已读 0未读',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of heeframework_message
-- ----------------------------
INSERT INTO `heeframework_message` VALUES (3, 1, 3, 0, 'title', 'contet', 0, 1586695173, NULL, NULL);
INSERT INTO `heeframework_message` VALUES (4, 1, 2, 0, '欢迎使用', '欢迎使用！！', 1, 1587103078, 1587103078, 1587103078);
INSERT INTO `heeframework_message` VALUES (5, 1, 3, 0, '欢迎使用', '123456欢迎使用！！', 0, 1586695273, NULL, NULL);
INSERT INTO `heeframework_message` VALUES (6, 1, 2, 0, 'title ABCDEFG', 'ABDEFAGE', 1, 1587103069, 1587103069, 1587103069);
INSERT INTO `heeframework_message` VALUES (7, 1, 3, 0, 'title&nbsp;ABCDEFG', 'ABDEFAGE', 0, 1586698639, NULL, NULL);
INSERT INTO `heeframework_message` VALUES (8, 1, 2, 0, 'title', 'contenxta123123', 1, 1587103080, 1587103080, 1587103080);
INSERT INTO `heeframework_message` VALUES (9, 1, 1, 0, 'abc', 'abdd', 1, 1586832328, 1586832328, NULL);
INSERT INTO `heeframework_message` VALUES (10, 1, 2, 0, 't123', 't234', 1, 1587103075, 1587103075, 1587103075);
INSERT INTO `heeframework_message` VALUES (11, 1, 3, 0, 't123', 't234', 0, 1586732982, NULL, NULL);
INSERT INTO `heeframework_message` VALUES (12, 1, 2, 0, 'tt123123', '123123', 1, 1587103073, 1587103073, 1587103073);
INSERT INTO `heeframework_message` VALUES (13, 1, 3, 0, 'tt123123', '123123', 0, 1586733088, NULL, NULL);

-- ----------------------------
-- Table structure for heeframework_sys_resources
-- ----------------------------
DROP TABLE IF EXISTS `heeframework_sys_resources`;
CREATE TABLE `heeframework_sys_resources`  (
  `sys_resources_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '标题',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '路径 \\控制器\\方法',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT '上级资源Id',
  `users_id` int(11) DEFAULT NULL COMMENT '创建人',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`sys_resources_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of heeframework_sys_resources
-- ----------------------------
INSERT INTO `heeframework_sys_resources` VALUES (1, '用户管理', 'users', '', 0, 1, 1586476453, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (2, '用户添加', '/users/add', '', 1, 1, 1586476580, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (3, '用户修改', '/users/edit', '', 1, 1, 1586476617, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (4, '用户保存', '/users/save', '', 1, 1, 1586476661, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (5, '用户删除', '/users/delete', '', 1, 1, 1586476699, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (6, '用户组管理', '/users_group', '', 0, 2, 1586480307, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (7, '用户组添加', '/users_group/add', '', 6, 2, 1586480361, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (8, '用户组修改', '/users_group/edit', '', 6, 3, 1586480381, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (9, '用户组删除', '/users_group/delete', '', 6, 1, 1586480444, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (10, '用户组保存', '/users_group/save', '', 6, 1, 1586480471, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (11, '用户管理', '/users/manager', '', 1, 1, 1586481179, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (12, '用户组管理', '/users_group/manager', '', 6, 1, 1586481202, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (13, '消息管理', 'message', '', 0, 1, 1586492696, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (14, '消息管理', '/message/manager', '', 13, 1, 1586492718, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (15, '消息添加', '/message/add', '', 13, 1, 1586492750, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (16, '消息删除', '/message/delete', '', 13, 1, 1586492777, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (17, '资源管理', 'sys_resources', '', 0, 1, 1586492824, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (18, '资源添加', '/sys_resources/add', '', 17, 1, 1586492845, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (19, '资源编辑', '/sys_resources/edit', '', 17, 1, 1586492868, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (20, '资源删除', '/sys_resources/delete', '', 17, 1, 1586492912, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (21, '资源保存', '/sys_resources/save', '', 17, 1, 1586492933, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (22, '资源管理', '/sys_resources/manager', '', 17, 1, 1586492955, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (23, '权限管理', 'users_group_sys_resources', '', 0, 1, 1586492989, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (33, '消息编辑', '/message/edit', '', 13, 1, 1586678131, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (25, '权限保存', '/users_group/save_sys_resource', '', 23, 1, 1586493060, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (26, '菜单管理', 'menus', '', 0, 1, 1586493093, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (27, '菜单管理', '/menus/manager', '', 26, 1, 1586493120, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (28, '菜单添加', '/menus/add', '', 26, 1, 1586493150, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (29, '菜单编辑', '/menus/edit', '', 26, 1, 1586493169, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (30, '菜单删除', '/menus/delete', '', 26, 1, 1586493186, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (31, '菜单保存', '/menus/save', '', 26, 1, 1586493221, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (32, '权限编辑', '/users_group/sys_resource', '', 23, 1, 1586653522, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (34, '消息保存', '/message/save', '', 13, 1, 1586678174, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (35, '系统设置功能', 'setting', '', 0, 1, 1586775690, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (36, '系统设置', '/index/setting', '', 35, 1, 1586775876, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (37, '系统设置保存', '/index/save_setting', '', 35, 1, 1586775902, NULL, NULL);
INSERT INTO `heeframework_sys_resources` VALUES (38, '消息详细', '/message/detail', '', 13, 1, 1586776255, NULL, NULL);

-- ----------------------------
-- Table structure for heeframework_users
-- ----------------------------
DROP TABLE IF EXISTS `heeframework_users`;
CREATE TABLE `heeframework_users`  (
  `users_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `header` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `users_group_id` int(11) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `birthday` int(255) DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(255) DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `postcode` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `qq` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `wechat` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`users_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of heeframework_users
-- ----------------------------
INSERT INTO `heeframework_users` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin_', '/upload/20200413/82b64f473a8acaa3948bab0548090020.jpg', 1, 1, 1586361600, '', 1, '', '', '', '123123', 'abc@qq.com', '', 999999999, NULL, NULL);
INSERT INTO `heeframework_users` VALUES (2, 'wangyingzhe', '25f9e794323b453885f5181f1b624d0b', 'wangyingzhe', NULL, 2, 0, 1586275200, '', 1, '', '', '', '', 'abc@qq.com', '', 1586328207, NULL, NULL);
INSERT INTO `heeframework_users` VALUES (3, 'wangyingzhe2', 'fcea920f7412b5da7be0cf42b8c93759', 'wyz1234', NULL, 8, 1, 1586448000, '上海', 1, '上海', '200010', '', '123123', 'abc@qq.com', '', 1586430365, NULL, 0);
INSERT INTO `heeframework_users` VALUES (5, 'test122', 'f5bb0c8de146c67b44babbf4e6584cc0', '123123', NULL, 1, 1, 1587098949, '', 1, '', '', '', '', 'abc@qq.com', '', 1587098949, NULL, NULL);
INSERT INTO `heeframework_users` VALUES (6, 'eesdfa', 'f5bb0c8de146c67b44babbf4e6584cc0', 'admin_123', NULL, 1, 1, 1587098970, '', 1, '', '', '', '', 'abc@qq.com', '', 1587098970, NULL, NULL);
INSERT INTO `heeframework_users` VALUES (7, 'asdfasdfa', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `heeframework_users` VALUES (8, 'asdfadf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `heeframework_users` VALUES (9, 'asdfasdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `heeframework_users` VALUES (10, 'ertwert', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `heeframework_users` VALUES (11, 'wertw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1587102715);
INSERT INTO `heeframework_users` VALUES (12, 'wertw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1587102707);
INSERT INTO `heeframework_users` VALUES (13, 'ertw', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1587102701);
INSERT INTO `heeframework_users` VALUES (14, 'fasdf', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1587102695);
INSERT INTO `heeframework_users` VALUES (15, 'rtwer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1587102656);

-- ----------------------------
-- Table structure for heeframework_users_group
-- ----------------------------
DROP TABLE IF EXISTS `heeframework_users_group`;
CREATE TABLE `heeframework_users_group`  (
  `users_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `isadmin` int(255) DEFAULT 0 COMMENT '是否是管理员  仅管理员可以登录后台',
  `create_users_id` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`users_group_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of heeframework_users_group
-- ----------------------------
INSERT INTO `heeframework_users_group` VALUES (1, '超级管理员', '', 1, 1, NULL, NULL, NULL);
INSERT INTO `heeframework_users_group` VALUES (2, '管理员', '', 1, 1, NULL, NULL, NULL);
INSERT INTO `heeframework_users_group` VALUES (8, '管理员Test', '', 1, 2, 1587087745, NULL, 0);

-- ----------------------------
-- Table structure for heeframework_users_group_sys_resources
-- ----------------------------
DROP TABLE IF EXISTS `heeframework_users_group_sys_resources`;
CREATE TABLE `heeframework_users_group_sys_resources`  (
  `users_group_sys_resources_id` int(11) NOT NULL AUTO_INCREMENT,
  `users_group_id` int(11) DEFAULT NULL,
  `sys_resources_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`users_group_sys_resources_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 394 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of heeframework_users_group_sys_resources
-- ----------------------------
INSERT INTO `heeframework_users_group_sys_resources` VALUES (1, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (2, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (5, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (4, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (6, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (7, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (8, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (9, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (10, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (11, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (12, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (13, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (14, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (15, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (16, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (17, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (18, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (19, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (20, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (21, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (22, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (23, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (24, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (25, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (26, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (27, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (28, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (29, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (30, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (31, 2, 18);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (32, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (33, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (34, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (35, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (36, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (37, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (38, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (39, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (40, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (41, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (42, 2, 18);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (43, 2, 21);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (44, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (45, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (46, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (47, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (48, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (49, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (50, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (51, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (52, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (53, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (54, 2, 18);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (55, 2, 19);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (56, 2, 21);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (57, 2, 22);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (58, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (226, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (210, 2, 21);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (209, 2, 20);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (208, 2, 19);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (63, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (64, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (65, 2, 4);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (66, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (67, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (68, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (69, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (70, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (71, 2, 10);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (72, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (73, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (74, 2, 15);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (75, 2, 18);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (76, 2, 19);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (77, 2, 20);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (78, 2, 21);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (79, 2, 22);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (80, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (225, 2, 10);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (207, 2, 18);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (206, 2, 38);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (205, 2, 34);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (85, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (86, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (87, 2, 4);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (88, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (89, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (90, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (91, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (92, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (93, 2, 10);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (94, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (95, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (96, 2, 15);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (97, 2, 18);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (98, 2, 19);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (99, 2, 20);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (100, 2, 21);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (101, 2, 22);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (108, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (103, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (224, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (204, 2, 33);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (203, 2, 16);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (202, 2, 15);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (109, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (110, 2, 4);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (111, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (112, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (113, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (114, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (115, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (116, 2, 10);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (117, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (118, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (119, 2, 15);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (120, 2, 18);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (121, 2, 19);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (122, 2, 20);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (123, 2, 21);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (124, 2, 22);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (125, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (223, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (201, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (200, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (199, 2, 10);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (130, 2, 36);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (131, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (132, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (133, 2, 4);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (134, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (135, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (136, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (137, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (138, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (139, 2, 10);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (140, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (141, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (142, 2, 15);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (143, 2, 16);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (144, 2, 33);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (145, 2, 34);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (146, 2, 38);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (147, 2, 18);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (148, 2, 19);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (149, 2, 20);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (150, 2, 21);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (151, 2, 22);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (152, 2, 25);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (222, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (154, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (221, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (198, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (197, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (196, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (159, 2, 36);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (195, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (161, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (162, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (163, 2, 4);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (164, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (165, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (166, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (167, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (168, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (169, 2, 10);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (170, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (171, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (172, 2, 15);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (173, 2, 16);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (174, 2, 33);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (175, 2, 34);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (176, 2, 38);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (177, 2, 18);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (178, 2, 19);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (179, 2, 20);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (180, 2, 21);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (181, 2, 22);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (182, 2, 25);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (220, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (184, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (219, 2, 4);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (194, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (193, 2, 4);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (192, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (189, 2, 36);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (191, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (211, 2, 22);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (212, 2, 25);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (218, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (214, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (217, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (216, 2, 36);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (227, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (228, 2, 15);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (229, 2, 16);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (230, 2, 33);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (231, 2, 34);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (232, 2, 38);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (233, 2, 18);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (234, 2, 19);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (235, 2, 20);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (236, 2, 21);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (237, 2, 22);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (238, 2, 25);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (239, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (240, 2, 36);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (241, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (242, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (243, 2, 4);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (244, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (245, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (246, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (247, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (248, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (249, 2, 10);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (250, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (251, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (252, 2, 15);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (253, 2, 16);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (254, 2, 33);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (255, 2, 34);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (256, 2, 38);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (257, 2, 18);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (258, 2, 19);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (259, 2, 20);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (260, 2, 21);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (261, 2, 22);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (262, 2, 25);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (263, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (264, 2, 36);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (265, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (266, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (267, 2, 4);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (268, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (269, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (270, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (271, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (272, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (273, 2, 10);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (274, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (275, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (276, 2, 15);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (277, 2, 16);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (278, 2, 33);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (279, 2, 34);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (280, 2, 38);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (281, 2, 18);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (282, 2, 19);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (283, 2, 20);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (284, 2, 21);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (285, 2, 22);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (286, 2, 25);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (287, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (292, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (291, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (290, 2, 36);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (293, 2, 4);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (294, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (295, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (296, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (297, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (298, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (299, 2, 10);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (300, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (301, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (302, 2, 15);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (303, 2, 16);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (304, 2, 33);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (305, 2, 34);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (306, 2, 38);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (307, 2, 18);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (308, 2, 19);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (309, 2, 20);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (310, 2, 21);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (311, 2, 22);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (312, 2, 25);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (313, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (314, 2, 36);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (315, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (316, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (317, 2, 4);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (318, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (319, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (320, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (321, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (322, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (323, 2, 10);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (324, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (325, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (326, 2, 15);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (327, 2, 16);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (328, 2, 33);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (329, 2, 34);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (330, 2, 38);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (331, 2, 18);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (332, 2, 19);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (333, 2, 20);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (334, 2, 21);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (335, 2, 22);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (336, 2, 25);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (337, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (338, 2, 36);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (339, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (340, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (341, 2, 4);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (342, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (343, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (344, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (345, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (346, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (347, 2, 10);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (348, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (349, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (350, 2, 15);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (351, 2, 16);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (352, 2, 33);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (353, 2, 34);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (354, 2, 38);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (355, 2, 18);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (356, 2, 19);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (357, 2, 20);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (358, 2, 21);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (359, 2, 22);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (360, 2, 25);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (361, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (362, 2, 30);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (363, 2, 36);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (364, 2, 2);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (365, 2, 3);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (366, 2, 4);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (367, 2, 5);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (368, 2, 11);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (369, 2, 7);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (370, 2, 8);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (371, 2, 9);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (372, 2, 10);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (373, 2, 12);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (374, 2, 14);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (375, 2, 15);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (376, 2, 16);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (377, 2, 33);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (378, 2, 34);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (379, 2, 38);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (380, 2, 18);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (381, 2, 19);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (382, 2, 20);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (383, 2, 21);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (384, 2, 22);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (385, 2, 25);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (386, 2, 27);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (387, 2, 30);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (388, 2, 36);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (389, 2, 37);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (390, 8, 19);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (391, 8, 19);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (392, 8, 18);
INSERT INTO `heeframework_users_group_sys_resources` VALUES (393, 8, 19);

SET FOREIGN_KEY_CHECKS = 1;
