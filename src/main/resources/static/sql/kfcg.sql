/*
Navicat MySQL Data Transfer

Source Server         : kfcg
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : kfcg

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-11-02 13:28:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `advert`
-- ----------------------------
DROP TABLE IF EXISTS `advert`;
CREATE TABLE `advert` (
  `advert_id` int(11) NOT NULL AUTO_INCREMENT,
  `advert_position` varchar(20) NOT NULL,
  `advert_url` varchar(100) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `demo_url` varchar(100) DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL,
  `advert_page` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`advert_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of advert
-- ----------------------------
INSERT INTO `advert` VALUES ('1', 'header', '/img/advert/index_gg.jpg', '1200', '80', null, '2017-10-30 18:48:52', 'index');
INSERT INTO `advert` VALUES ('2', 'footer', '/img/advert/footer.jpg', '1200', '165', null, '2017-10-30 18:50:17', 'index');
INSERT INTO `advert` VALUES ('3', 'gg_fz', '/img/advert/gg_fz.jpg', '160', '600', null, '2017-10-31 18:10:42', 'index');
INSERT INTO `advert` VALUES ('4', 'gg_py', '/img/advert/gg_py.png', '280', '80', null, '2017-10-31 18:11:24', 'index');
INSERT INTO `advert` VALUES ('5', 'gg_zp', '/img/advert/gg_zp.png', '280', '80', null, '2017-10-31 18:11:52', 'index');

-- ----------------------------
-- Table structure for `collection`
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `user_id` int(11) NOT NULL,
  `pi_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`pi_id`),
  KEY `fk_pi_user_id` (`pi_id`),
  CONSTRAINT `fk_pi_user_id` FOREIGN KEY (`pi_id`) REFERENCES `push_info` (`pi_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_pi_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collection
-- ----------------------------
INSERT INTO `collection` VALUES ('10', '9');
INSERT INTO `collection` VALUES ('8', '10');
INSERT INTO `collection` VALUES ('8', '11');

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `company_id` int(11) NOT NULL AUTO_INCREMENT,
  `cp_name` varchar(100) NOT NULL,
  `cp_contactPerson` varchar(20) NOT NULL,
  `cp_address` varchar(100) DEFAULT NULL,
  `cp_net` varchar(100) DEFAULT NULL,
  `cp_sc` int(11) DEFAULT NULL COMMENT '公司所属副类行业',
  `cp_description` varchar(5000) DEFAULT NULL,
  `cp_user` int(11) NOT NULL,
  `cp_img` varchar(300) DEFAULT NULL,
  `cp_num` varchar(100) NOT NULL COMMENT '注册号',
  `cp_pz_img` varchar(100) DEFAULT NULL COMMENT '公司凭证图片',
  PRIMARY KEY (`company_id`),
  KEY `fk_user_cp` (`cp_user`),
  KEY `fk_sc_cp` (`cp_sc`),
  CONSTRAINT `fk_sc_cp` FOREIGN KEY (`cp_sc`) REFERENCES `secondclass` (`sc_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_cp` FOREIGN KEY (`cp_user`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', 'dsadas', 'eqwe', null, null, null, null, '8', null, 'qweqwe', null);

-- ----------------------------
-- Table structure for `cv`
-- ----------------------------
DROP TABLE IF EXISTS `cv`;
CREATE TABLE `cv` (
  `user_id` int(11) DEFAULT NULL,
  `cv_id` int(11) NOT NULL AUTO_INCREMENT,
  `gra_coll` varchar(20) DEFAULT NULL COMMENT '毕业院校',
  `born_year` datetime DEFAULT NULL COMMENT '出生年份',
  `dream_work` int(11) DEFAULT NULL COMMENT '梦想职位',
  `gender` char(2) DEFAULT NULL,
  `dream_district` int(11) DEFAULT NULL COMMENT '想去的区',
  `jiguan` varchar(20) DEFAULT NULL,
  `minzu` char(10) DEFAULT NULL,
  `tall` bigint(3) DEFAULT NULL COMMENT '身高',
  `marital_status` bigint(1) DEFAULT '0' COMMENT '婚姻状况,0未婚1已婚',
  `max_edu` varchar(8) DEFAULT NULL,
  `gra_date` datetime DEFAULT NULL COMMENT '毕业时间',
  `stu_pro` varchar(20) DEFAULT NULL COMMENT '专业',
  `english` varchar(10) DEFAULT NULL COMMENT '英语水平',
  `computer` varchar(10) DEFAULT NULL COMMENT '电脑水平',
  `job_year` varchar(8) DEFAULT NULL COMMENT '工作经验',
  `job_detail` varchar(200) DEFAULT NULL,
  `income` varchar(15) DEFAULT NULL COMMENT '期望月薪',
  `jineng` varchar(20) DEFAULT NULL COMMENT '擅长技能',
  `zitui` varchar(200) DEFAULT NULL COMMENT '自推简言',
  `phone` char(11) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `qq` varchar(20) DEFAULT NULL,
  `real_name` varchar(10) DEFAULT NULL,
  `weight` bigint(3) DEFAULT NULL,
  `health` bigint(1) DEFAULT '0' COMMENT '健康状况，0健康，1残疾',
  `cv_img` varchar(80) DEFAULT NULL COMMENT '个人图片介绍,1张',
  `other_stu` varchar(200) DEFAULT NULL,
  `work_time` varchar(10) NOT NULL DEFAULT '可随时到岗' COMMENT '几个月后到岗',
  PRIMARY KEY (`cv_id`),
  KEY `fk_user_cv_id` (`user_id`),
  KEY `fk_district_cv_id` (`dream_district`),
  CONSTRAINT `fk_district_cv_id` FOREIGN KEY (`dream_district`) REFERENCES `district` (`district_id`),
  CONSTRAINT `fk_user_cv_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cv
-- ----------------------------

-- ----------------------------
-- Table structure for `district`
-- ----------------------------
DROP TABLE IF EXISTS `district`;
CREATE TABLE `district` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `district_name` varchar(20) DEFAULT NULL COMMENT '区域名',
  PRIMARY KEY (`district_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of district
-- ----------------------------
INSERT INTO `district` VALUES ('1', '鼓楼区');
INSERT INTO `district` VALUES ('2', '龙亭区');
INSERT INTO `district` VALUES ('3', '顺河区');
INSERT INTO `district` VALUES ('4', '禹王台区');
INSERT INTO `district` VALUES ('5', '杞县');
INSERT INTO `district` VALUES ('6', '通许');
INSERT INTO `district` VALUES ('7', '尉氏');
INSERT INTO `district` VALUES ('8', '开封县');
INSERT INTO `district` VALUES ('9', '兰考');

-- ----------------------------
-- Table structure for `hotsearch`
-- ----------------------------
DROP TABLE IF EXISTS `hotsearch`;
CREATE TABLE `hotsearch` (
  `hot_search_id` int(11) NOT NULL AUTO_INCREMENT,
  `hot_search_bz` int(11) NOT NULL DEFAULT '0' COMMENT '标注为红色:1，标注，0不标注',
  `hot_search_ct` varchar(30) NOT NULL COMMENT '热词内容',
  PRIMARY KEY (`hot_search_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotsearch
-- ----------------------------
INSERT INTO `hotsearch` VALUES ('1', '1', '出租二手房');
INSERT INTO `hotsearch` VALUES ('2', '0', '转让');
INSERT INTO `hotsearch` VALUES ('3', '1', '装修公司');
INSERT INTO `hotsearch` VALUES ('4', '0', '同城租车');
INSERT INTO `hotsearch` VALUES ('5', '1', '家教老师');
INSERT INTO `hotsearch` VALUES ('6', '0', '陪练');

-- ----------------------------
-- Table structure for `mainclass`
-- ----------------------------
DROP TABLE IF EXISTS `mainclass`;
CREATE TABLE `mainclass` (
  `mc_id` int(11) NOT NULL AUTO_INCREMENT,
  `mc_img` varchar(50) DEFAULT NULL COMMENT '主分类图标',
  `mc_name` varchar(20) DEFAULT NULL COMMENT '大类名称',
  `mc_click_nums` int(11) DEFAULT NULL COMMENT '大类点击量',
  PRIMARY KEY (`mc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mainclass
-- ----------------------------
INSERT INTO `mainclass` VALUES ('1', 'img/qzzp.png', '招聘', null);
INSERT INTO `mainclass` VALUES ('2', 'img/fwzs.png', '房产', null);
INSERT INTO `mainclass` VALUES ('3', 'img/essc.png', '二手市场', null);
INSERT INTO `mainclass` VALUES ('4', 'img/shfw.png', '生活服务', null);
INSERT INTO `mainclass` VALUES ('5', 'img/cw.png', '名师培优', null);
INSERT INTO `mainclass` VALUES ('6', 'img/mqzp.png', '名企招聘', null);

-- ----------------------------
-- Table structure for `pic_content`
-- ----------------------------
DROP TABLE IF EXISTS `pic_content`;
CREATE TABLE `pic_content` (
  `pic_id` int(11) NOT NULL,
  `pc_id` int(11) NOT NULL,
  `pc_content` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`pc_id`,`pic_id`),
  KEY `fk_pic_pi` (`pic_id`),
  CONSTRAINT `fk_conent_pushInfo` FOREIGN KEY (`pc_id`) REFERENCES `push_info` (`pi_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pic_pi` FOREIGN KEY (`pic_id`) REFERENCES `push_info_class` (`pic_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pic_content
-- ----------------------------
INSERT INTO `pic_content` VALUES ('4', '6', '220平方米');
INSERT INTO `pic_content` VALUES ('5', '6', '166666');
INSERT INTO `pic_content` VALUES ('1', '9', '服务员');
INSERT INTO `pic_content` VALUES ('11', '9', '河南金源大酒店有限公司');
INSERT INTO `pic_content` VALUES ('4', '10', '118平方米');
INSERT INTO `pic_content` VALUES ('5', '10', '18000');
INSERT INTO `pic_content` VALUES ('4', '11', '118平方米');
INSERT INTO `pic_content` VALUES ('5', '11', '18000');
INSERT INTO `pic_content` VALUES ('1', '14', '攻击测试');
INSERT INTO `pic_content` VALUES ('11', '14', '攻击测试');
INSERT INTO `pic_content` VALUES ('1', '19', '基础信息');
INSERT INTO `pic_content` VALUES ('11', '19', 'qweqweqweqweqw');
INSERT INTO `pic_content` VALUES ('1', '22', '文章测试项');
INSERT INTO `pic_content` VALUES ('11', '22', '文章测试项');
INSERT INTO `pic_content` VALUES ('1', '23', 'xss');
INSERT INTO `pic_content` VALUES ('11', '23', 'xss测试');
INSERT INTO `pic_content` VALUES ('1', '24', '测试ip字段信息');
INSERT INTO `pic_content` VALUES ('11', '24', '测试ip字段信息');

-- ----------------------------
-- Table structure for `push_info`
-- ----------------------------
DROP TABLE IF EXISTS `push_info`;
CREATE TABLE `push_info` (
  `pi_id` int(11) NOT NULL AUTO_INCREMENT,
  `pi_title` varchar(200) DEFAULT NULL COMMENT '信息标题',
  `pi_content` varchar(5000) DEFAULT NULL COMMENT '信息描述',
  `pi_mc` int(11) DEFAULT NULL COMMENT '所属主类',
  `pi_sc` int(11) DEFAULT NULL COMMENT '所属次类',
  `pi_user` int(11) DEFAULT NULL COMMENT '发布人',
  `pi_address` varchar(300) DEFAULT NULL COMMENT '发布人位置',
  `pi_img` varchar(300) DEFAULT NULL COMMENT '图片,以#分割',
  `pi_scan` int(11) DEFAULT NULL COMMENT '浏览量',
  `pi_push_date` datetime DEFAULT NULL COMMENT '发布日期',
  `pi_chujia` double DEFAULT NULL COMMENT '竞价排名出价',
  `pi_zhiding` varchar(5) NOT NULL DEFAULT '否' COMMENT '是否置顶',
  `pi_contact_person` varchar(20) DEFAULT NULL,
  `pi_phone` varchar(15) DEFAULT NULL,
  `pi_qq` varchar(15) DEFAULT NULL,
  `pi_district` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '文章状态:0 正常,1正在审核',
  `pi_ip` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pi_id`),
  KEY `fk_push_district` (`pi_district`),
  KEY `fk_push_mc_id` (`pi_mc`),
  KEY `fk_push_sc_id` (`pi_sc`),
  KEY `fk_push_user_id` (`pi_user`),
  CONSTRAINT `fk_push_district` FOREIGN KEY (`pi_district`) REFERENCES `district` (`district_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_push_mc_id` FOREIGN KEY (`pi_mc`) REFERENCES `mainclass` (`mc_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_push_sc_id` FOREIGN KEY (`pi_sc`) REFERENCES `secondclass` (`sc_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_push_user_id` FOREIGN KEY (`pi_user`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of push_info
-- ----------------------------
INSERT INTO `push_info` VALUES ('6', '名下房产转让', '急用钱,现低价转让\r\n                ', '2', '1', '1', '开封市金明区人民路', 'img/pushimg/class2/f679efb8-4924-49ed-bb40-889093fb7754.jpg', '0', '2017-09-29 17:01:20', '0', '否', '赵女士', '18236556108', '1823655610', '2', '0', null);
INSERT INTO `push_info` VALUES ('9', '餐饮服务员', '岗位职责：\r\n1、按照领班安排认真做好桌椅、餐厅卫生，餐厅铺台，准备好各种用品，确保正常营业使用。\r\n2、接待顾客应主动、热情、礼貌、耐心、周到，使顾客有宾至如归之感；\r\n3、运用礼貌语言，为客人提供最佳服务，\r\n4、善于向顾客介绍和推销本餐厅饮品及特色菜点；\r\n5、配合领班工作，服从领班或以上领导指挥，团结及善于帮助同事工作；\r\n6、积极参加培训，不断提高服务技能。\r\n                ', '1', '1', '1', '开封市鼓楼区大庆路2号西郊商场往南200米长风花园隔壁', 'img/pushimg/class1/48fc7eb2-b2d3-418d-bdfc-898e9ef7a9d5.jpg#img/pushimg/class1/527eb4e4-91b2-4b4f-b568-ff5c00bc7990.jpg', '29', '2017-10-03 22:12:44', '0', '否', '河南金源大酒店', '18236556108', '182356554', '1', '0', null);
INSERT INTO `push_info` VALUES ('10', '安联青年城 2室2厅1卫', '房源详情小区详情\r\n房屋亮点普通装修\r\n房源描述房屋亮点 新上 配套齐全 南北通透 *出租 随时看房 出租要求 中介勿扰 禁止养宠物 租户稳定 房源描述带*的，另外详谈。\r\n\r\n                ', '2', '17', '1', '西环和东京大道交叉口北200米', 'img/pushimg/class2/d04335e4-3503-44b9-9f56-fe0d07d8d356.jpg', '0', '2017-10-03 22:20:23', '0', '否', '潘文豪(经纪人)', '13137818876', '', '3', '0', null);
INSERT INTO `push_info` VALUES ('11', '安联青年城 123123', '房源详情小区详情\r\n房屋亮点普通装修\r\n房源描述房屋亮点 新上 配套齐全 南北通透 *出租 随时看房 出租要求 中介勿扰 禁止养宠物 租户稳定 房源描述带*的，另外详谈。\r\n\r\n                ', '2', '17', '1', '西环和东京大道交叉口北200米', 'img/pushimg/class2/ca92c231-ed57-4f45-a32c-ed1f8fe9c786.jpg', '0', '2017-10-03 22:21:25', '0', '否', '潘文豪(经纪人)', '13137818876', '', '3', '0', null);
INSERT INTO `push_info` VALUES ('14', 'xss攻击测试', '&lt;script&gt;alert(\'攻击测试\')&lt;/script&gt;', '1', '2', '8', '攻击测试', null, '2', '2017-10-06 23:35:38', '0', '否', '攻击测', '18236556108', '', '1', '1', null);
INSERT INTO `push_info` VALUES ('18', '请问请问请问请问', '我去饿请问请问请问请问恶趣味请问请问', '4', '40', '8', 'qweqwewwe', null, '1', '2017-10-08 15:36:14', '0', '否', '我去饿', '18236556108', '', '1', '1', null);
INSERT INTO `push_info` VALUES ('19', '基础信息修改', '展示孔家你,天禧adas', '1', '1', '8', 'sajdasdasd', 'img/pushimg/eb40f44f-bac8-40bf-8298-36b1db48d604.png#img/pushimg/a7b4c3be-25a1-469d-b2bf-c9c8d5226f5b.png#img/pushimg/aa707c41-5296-46b8-a8cd-58e66d4bf8e0.png#img/pushimg/63551ecc-7d16-415f-a92a-7aa8df68410b.png', '0', '2017-10-12 17:20:38', '0', '否', '王女士', '18236556108', '', '4', '0', null);
INSERT INTO `push_info` VALUES ('22', '文章测试项', '文章测试项文章测试项文章测试项', '1', '4', '8', '文章测试项', 'img/pushimg/14f78c1a-422c-4fe8-b346-9dbc3faff4c7.png#img/pushimg/c854852d-670a-499c-b41e-0f66097bb412.png#img/pushimg/5a89473c-f5e1-4065-813a-e7be48bccd1d.png#img/pushimg/194f110c-bc0e-436c-ad99-19ded72d10bd.png', '0', '2017-10-20 09:08:22', '0', '否', '文章测试项', '18236556108', '', '1', '0', null);
INSERT INTO `push_info` VALUES ('23', 'xss测试', 'xss测试文章，即将删除...................', '1', '1', '10', '&lt;script&gt;alert(&#39;xxs测试&#39;)&lt;/script&gt;', 'img/pushimg/65cff5e7-0c07-4532-a02a-1ba38443ed5b.jpg', '1', '2017-10-28 11:46:35', '0', '否', '小王', '18236556108', '', '1', '0', null);
INSERT INTO `push_info` VALUES ('24', '测试ip字段信息', '测试ip字段信息测试ip字段信息测试ip字段信息', '1', '1', '10', '测试ip字段信息', 'img/pushimg/033d8ac0-189f-434d-a520-5bc41141ddd9.png', '1', '2017-10-29 14:45:49', '0', '否', '测试', '18236556108', '', '1', '0', '0:0:0:0:0:0:0:1');

-- ----------------------------
-- Table structure for `push_info_class`
-- ----------------------------
DROP TABLE IF EXISTS `push_info_class`;
CREATE TABLE `push_info_class` (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `mc_id` int(11) NOT NULL,
  `pic_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pic_id`),
  KEY `fk_pic_mc` (`mc_id`),
  CONSTRAINT `fk_pic_mc` FOREIGN KEY (`mc_id`) REFERENCES `mainclass` (`mc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of push_info_class
-- ----------------------------
INSERT INTO `push_info_class` VALUES ('1', '1', '职位名称');
INSERT INTO `push_info_class` VALUES ('4', '2', '房屋面积');
INSERT INTO `push_info_class` VALUES ('5', '2', '价格');
INSERT INTO `push_info_class` VALUES ('7', '3', '价格');
INSERT INTO `push_info_class` VALUES ('8', '3', '新旧程度');
INSERT INTO `push_info_class` VALUES ('10', '5', '价格');
INSERT INTO `push_info_class` VALUES ('11', '1', '公司名称');

-- ----------------------------
-- Table structure for `push_info_tag`
-- ----------------------------
DROP TABLE IF EXISTS `push_info_tag`;
CREATE TABLE `push_info_tag` (
  `tag_id` int(11) NOT NULL,
  `pi_id` int(11) NOT NULL,
  `pi_tag_content` int(11) DEFAULT NULL,
  PRIMARY KEY (`tag_id`,`pi_id`),
  KEY `fk_pit_pi_id` (`pi_id`),
  KEY `fk_pit_pic_id` (`pi_tag_content`),
  CONSTRAINT `fk_pit_pi_id` FOREIGN KEY (`pi_id`) REFERENCES `push_info` (`pi_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pit_pic_id` FOREIGN KEY (`pi_tag_content`) REFERENCES `tagcontent` (`tc_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pit_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of push_info_tag
-- ----------------------------
INSERT INTO `push_info_tag` VALUES ('1', '9', '1');
INSERT INTO `push_info_tag` VALUES ('1', '14', '1');
INSERT INTO `push_info_tag` VALUES ('1', '22', '1');
INSERT INTO `push_info_tag` VALUES ('1', '23', '1');
INSERT INTO `push_info_tag` VALUES ('1', '24', '1');
INSERT INTO `push_info_tag` VALUES ('1', '19', '5');
INSERT INTO `push_info_tag` VALUES ('2', '9', '8');
INSERT INTO `push_info_tag` VALUES ('2', '14', '8');
INSERT INTO `push_info_tag` VALUES ('2', '22', '8');
INSERT INTO `push_info_tag` VALUES ('2', '23', '8');
INSERT INTO `push_info_tag` VALUES ('2', '24', '8');
INSERT INTO `push_info_tag` VALUES ('2', '19', '13');
INSERT INTO `push_info_tag` VALUES ('3', '9', '17');
INSERT INTO `push_info_tag` VALUES ('3', '14', '17');
INSERT INTO `push_info_tag` VALUES ('3', '22', '17');
INSERT INTO `push_info_tag` VALUES ('3', '23', '17');
INSERT INTO `push_info_tag` VALUES ('3', '24', '17');
INSERT INTO `push_info_tag` VALUES ('3', '19', '20');
INSERT INTO `push_info_tag` VALUES ('4', '9', '23');
INSERT INTO `push_info_tag` VALUES ('4', '14', '23');
INSERT INTO `push_info_tag` VALUES ('4', '19', '23');
INSERT INTO `push_info_tag` VALUES ('4', '22', '23');
INSERT INTO `push_info_tag` VALUES ('4', '23', '23');
INSERT INTO `push_info_tag` VALUES ('4', '24', '23');

-- ----------------------------
-- Table structure for `secondclass`
-- ----------------------------
DROP TABLE IF EXISTS `secondclass`;
CREATE TABLE `secondclass` (
  `sc_id` int(11) NOT NULL AUTO_INCREMENT,
  `sc_name` varchar(30) DEFAULT NULL COMMENT '小类名称',
  `sc_mc_id` int(11) DEFAULT NULL,
  `sc_click_nums` int(11) NOT NULL DEFAULT '0' COMMENT '小类点击量',
  PRIMARY KEY (`sc_id`),
  KEY `fk_mc_sc_id` (`sc_mc_id`),
  CONSTRAINT `fk_mc_sc_id` FOREIGN KEY (`sc_mc_id`) REFERENCES `mainclass` (`mc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of secondclass
-- ----------------------------
INSERT INTO `secondclass` VALUES ('1', '\n营业员/店员', '1', '0');
INSERT INTO `secondclass` VALUES ('2', '\n销售/业务', '1', '0');
INSERT INTO `secondclass` VALUES ('3', '\n兼职/促销/实习', '1', '0');
INSERT INTO `secondclass` VALUES ('4', '\n行政/文秘/助理', '1', '0');
INSERT INTO `secondclass` VALUES ('5', '\n保安/司机', '1', '0');
INSERT INTO `secondclass` VALUES ('6', '\n财务/会计/出纳', '1', '0');
INSERT INTO `secondclass` VALUES ('7', '\n美容师/美发师', '1', '0');
INSERT INTO `secondclass` VALUES ('8', '\n电脑技术员', '1', '0');
INSERT INTO `secondclass` VALUES ('9', '\n厨师/服务员', '1', '0');
INSERT INTO `secondclass` VALUES ('10', '\n技师/工人/学徒', '1', '0');
INSERT INTO `secondclass` VALUES ('11', '\n平面/装修设计', '1', '0');
INSERT INTO `secondclass` VALUES ('12', '\n教育/培训/老师', '1', '0');
INSERT INTO `secondclass` VALUES ('13', '\n清洁工/仓管员', '1', '0');
INSERT INTO `secondclass` VALUES ('14', '\n医护人员', '1', '0');
INSERT INTO `secondclass` VALUES ('15', '\n网吧招聘', '1', '0');
INSERT INTO `secondclass` VALUES ('16', '\n其他职位', '1', '0');
INSERT INTO `secondclass` VALUES ('17', '\n旺铺/店面/仓库/厂房', '2', '0');
INSERT INTO `secondclass` VALUES ('18', '\n个人二手房出售', '2', '0');
INSERT INTO `secondclass` VALUES ('19', '\n中介二手房出售', '2', '0');
INSERT INTO `secondclass` VALUES ('20', '\n出租房屋', '2', '0');
INSERT INTO `secondclass` VALUES ('21', '\n求购房屋', '2', '0');
INSERT INTO `secondclass` VALUES ('22', '\n求租房屋', '2', '0');
INSERT INTO `secondclass` VALUES ('23', '\n房屋装修/工程/施工', '2', '0');
INSERT INTO `secondclass` VALUES ('24', '\n手机交易/配件', '3', '0');
INSERT INTO `secondclass` VALUES ('25', '\n二手电脑/配件', '3', '0');
INSERT INTO `secondclass` VALUES ('26', '\n数码产品/游戏机', '3', '0');
INSERT INTO `secondclass` VALUES ('27', '\n虚拟物品/QQ号', '3', '0');
INSERT INTO `secondclass` VALUES ('28', '\n二手汽车买卖', '3', '0');
INSERT INTO `secondclass` VALUES ('29', '\n摩托车/电动车/单车', '3', '0');
INSERT INTO `secondclass` VALUES ('30', '\n饰品/化妆品', '3', '0');
INSERT INTO `secondclass` VALUES ('31', '\n家具/日用品/家用电器', '3', '0');
INSERT INTO `secondclass` VALUES ('32', '\n食品', '3', '0');
INSERT INTO `secondclass` VALUES ('33', '\n母婴儿童用品', '3', '0');
INSERT INTO `secondclass` VALUES ('34', '\n办公用品/办公设备', '3', '0');
INSERT INTO `secondclass` VALUES ('35', '\n服装/鞋帽/箱包', '3', '0');
INSERT INTO `secondclass` VALUES ('36', '\n文化体育用品/乐器', '3', '0');
INSERT INTO `secondclass` VALUES ('37', '\n健身卡/优惠券/电影票', '3', '0');
INSERT INTO `secondclass` VALUES ('38', '\n个人求购/专业收购', '3', '0');
INSERT INTO `secondclass` VALUES ('39', '\n急开锁/管道疏通/堵漏', '4', '0');
INSERT INTO `secondclass` VALUES ('40', '\n健身/瑜伽/跆拳道', '4', '0');
INSERT INTO `secondclass` VALUES ('41', '\n家政/钟点工/月嫂', '4', '0');
INSERT INTO `secondclass` VALUES ('42', '\n家电/电脑维修', '4', '0');
INSERT INTO `secondclass` VALUES ('43', '\n美容/美发/美体', '4', '0');
INSERT INTO `secondclass` VALUES ('44', '\n搬家/快递/汽车租赁', '4', '0');
INSERT INTO `secondclass` VALUES ('45', '\n婚庆/礼仪/鲜花/摄影', '4', '0');
INSERT INTO `secondclass` VALUES ('46', '\n课业家教/艺术家教', '4', '0');
INSERT INTO `secondclass` VALUES ('47', '\n教育培训/学校招生', '4', '0');
INSERT INTO `secondclass` VALUES ('48', '\n餐饮/送餐/送水', '4', '0');
INSERT INTO `secondclass` VALUES ('49', '\n咨询/代办/顾问', '4', '0');
INSERT INTO `secondclass` VALUES ('50', '\n招商/合作/融资/创业', '4', '0');
INSERT INTO `secondclass` VALUES ('51', '\n印刷/喷绘/字牌/旗帜', '4', '0');
INSERT INTO `secondclass` VALUES ('52', '\n宾馆住宿/旅行/度假', '4', '0');
INSERT INTO `secondclass` VALUES ('53', '\n汽车维修/加装/保养', '4', '0');
INSERT INTO `secondclass` VALUES ('54', '外语培训', '5', '0');
INSERT INTO `secondclass` VALUES ('55', '婴幼儿.学历教育', '5', '0');
INSERT INTO `secondclass` VALUES ('56', '职业培训', '5', '0');
INSERT INTO `secondclass` VALUES ('57', '中小学一对一', '5', '0');
INSERT INTO `secondclass` VALUES ('58', '\n中小学辅导班', '5', '0');
INSERT INTO `secondclass` VALUES ('59', '\n家教机构', '5', '0');
INSERT INTO `secondclass` VALUES ('60', '家教个人', '5', '0');

-- ----------------------------
-- Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(20) DEFAULT NULL COMMENT '标签名',
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES ('1', '月薪');
INSERT INTO `tag` VALUES ('2', '单位性质');
INSERT INTO `tag` VALUES ('3', '学历');
INSERT INTO `tag` VALUES ('4', '性别要求');
INSERT INTO `tag` VALUES ('5', '来源');

-- ----------------------------
-- Table structure for `tagcontent`
-- ----------------------------
DROP TABLE IF EXISTS `tagcontent`;
CREATE TABLE `tagcontent` (
  `tc_id` int(11) NOT NULL AUTO_INCREMENT,
  `tc_name` varchar(20) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL COMMENT '标签ID',
  PRIMARY KEY (`tc_id`),
  KEY `fk_tag_tc_id` (`tag_id`),
  CONSTRAINT `fk_tag_tc_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tagcontent
-- ----------------------------
INSERT INTO `tagcontent` VALUES ('1', '面议', '1');
INSERT INTO `tagcontent` VALUES ('2', '1000以下', '1');
INSERT INTO `tagcontent` VALUES ('3', '1000~2000', '1');
INSERT INTO `tagcontent` VALUES ('4', '2000~3000', '1');
INSERT INTO `tagcontent` VALUES ('5', '3000~6000', '1');
INSERT INTO `tagcontent` VALUES ('6', '6000~8000', '1');
INSERT INTO `tagcontent` VALUES ('7', '8000以上', '1');
INSERT INTO `tagcontent` VALUES ('8', '私营', '2');
INSERT INTO `tagcontent` VALUES ('9', '国有', '2');
INSERT INTO `tagcontent` VALUES ('10', '股份制', '2');
INSERT INTO `tagcontent` VALUES ('11', '外商独资办事处', '2');
INSERT INTO `tagcontent` VALUES ('12', '中外合资/合作', '2');
INSERT INTO `tagcontent` VALUES ('13', '上市公司', '2');
INSERT INTO `tagcontent` VALUES ('14', '事业单位', '2');
INSERT INTO `tagcontent` VALUES ('15', '政府机关', '2');
INSERT INTO `tagcontent` VALUES ('16', '其他', '2');
INSERT INTO `tagcontent` VALUES ('17', '博士及以上', '3');
INSERT INTO `tagcontent` VALUES ('18', '硕士', '3');
INSERT INTO `tagcontent` VALUES ('19', '本科', '3');
INSERT INTO `tagcontent` VALUES ('20', '大专', '3');
INSERT INTO `tagcontent` VALUES ('21', '高中/中专', '3');
INSERT INTO `tagcontent` VALUES ('22', '初中及以下', '3');
INSERT INTO `tagcontent` VALUES ('23', '男', '4');
INSERT INTO `tagcontent` VALUES ('24', '女', '4');
INSERT INTO `tagcontent` VALUES ('25', '无', '4');
INSERT INTO `tagcontent` VALUES ('26', '个人', '5');
INSERT INTO `tagcontent` VALUES ('27', '商家', '5');

-- ----------------------------
-- Table structure for `tip`
-- ----------------------------
DROP TABLE IF EXISTS `tip`;
CREATE TABLE `tip` (
  `pi_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tip_content` varchar(500) DEFAULT NULL,
  `tip_id` int(11) NOT NULL AUTO_INCREMENT,
  `tip_status` int(11) NOT NULL DEFAULT '0' COMMENT '0:未处理,1:已处理',
  PRIMARY KEY (`tip_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tip
-- ----------------------------

-- ----------------------------
-- Table structure for `tm`
-- ----------------------------
DROP TABLE IF EXISTS `tm`;
CREATE TABLE `tm` (
  `tag_id` int(11) NOT NULL,
  `mc_id` int(11) NOT NULL,
  PRIMARY KEY (`tag_id`,`mc_id`),
  KEY `fk_mc_tm_id` (`mc_id`),
  CONSTRAINT `fk_mc_tm_id` FOREIGN KEY (`mc_id`) REFERENCES `mainclass` (`mc_id`),
  CONSTRAINT `fk_tag_tm_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm
-- ----------------------------
INSERT INTO `tm` VALUES ('1', '1');
INSERT INTO `tm` VALUES ('2', '1');
INSERT INTO `tm` VALUES ('3', '1');
INSERT INTO `tm` VALUES ('4', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL COMMENT '用户名',
  `user_password` varchar(50) NOT NULL,
  `user_phone` varchar(11) DEFAULT NULL,
  `user_email` varchar(30) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `lasted_time` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `status` bigint(1) NOT NULL DEFAULT '1' COMMENT '1:有效,0:禁止登陆',
  `user_description` varchar(200) DEFAULT NULL,
  `user_push` int(11) NOT NULL DEFAULT '0',
  `user_collection` int(11) DEFAULT '0',
  `user_img` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `user_attc` int(1) NOT NULL DEFAULT '1' COMMENT '用户是否验证0:认证,1:未认证,2:等待审核',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '张三', '123456', '18236556108', null, '2017-10-12 14:51:02', null, '1', '', '0', '0', null, '1');
INSERT INTO `user` VALUES ('2', 'wangermazi', 'DrvRNdqXUVdynOf0L/q78w==', null, '1724940662@qq.com', '2017-10-12 14:51:10', null, '1', '', '0', '0', null, '1');
INSERT INTO `user` VALUES ('3', '周杰伦', 'DrvRNdqXUVdynOf0L/q78w==', null, '1823655608@163.com', '2017-10-12 14:51:13', null, '1', '', '0', '0', null, '1');
INSERT INTO `user` VALUES ('4', '李晓武', 'DrvRNdqXUVdynOf0L/q78w==', null, '18236556108@163.com', '2017-10-12 14:51:16', null, '1', '', '0', '0', null, '1');
INSERT INTO `user` VALUES ('5', '456', 'DrvRNdqXUVdynOf0L/q78w==', null, '18236556108@163.com', '2017-10-17 14:51:18', null, '1', '', '0', '0', null, '1');
INSERT INTO `user` VALUES ('6', '赵四', 'UC9nvZTDwEDjKY04wkmfvw==', null, '1823655608@163.com', '2017-10-10 14:51:21', null, '1', '', '0', '0', null, '1');
INSERT INTO `user` VALUES ('7', '小龙', 'DrvRNdqXUVdynOf0L/q78w==', null, '18236556108@163.com', '2017-10-06 14:51:24', null, '1', '', '0', '0', null, '1');
INSERT INTO `user` VALUES ('8', '赵六', 'M7qNV38i6Rq8DIb389Of9g==', '18236556299', '1724940662@163.com', '2017-10-17 14:51:27', '2017-10-21 10:55:58', '1', '没有', '0', '0', 'img/headImg/d74b6b7e-5551-436c-ab4d-4b567714ca79.jpg', '0');
INSERT INTO `user` VALUES ('9', 'zhaoliu', 'DrvRNdqXUVdynOf0L/q78w==', null, '1234@qq.com', '2017-10-15 15:15:26', '2017-10-15 15:15:31', '1', null, '0', '0', null, '1');
INSERT INTO `user` VALUES ('10', 'a18236556108', 'DrvRNdqXUVdynOf0L/q78w==', null, '1724940@qq.com', '2017-10-20 18:21:03', '2017-10-30 15:34:56', '1', null, '0', '0', null, '1');
