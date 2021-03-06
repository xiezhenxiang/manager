/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : 127.0.0.1:3306
Source Database       : manager

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-05-09 16:56:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL COMMENT '理论成果、科技创新、科学成果',
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `start_time` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '综合', '2018第一届創新杯挑战赛', '各学院分团委：\r\n由共青团中央、教育部、中国科协、全国学联主办的 2018年“创青春”全国大学生创业大赛（原型为“挑战杯”中国大学生创业计划竞赛）将于2018年4月至11月举办。\r\n“创青春”创业大赛是为了适应大学生创业发展的形势需要，在原有“挑战杯”全国大学生创业计划竞赛的基础上发展而来，每两年举办一次。团中央和相关部委以“创青春”全国大学生创业大赛为载体，进一步建立健全大学生创业公共政策扶持体系、大学生创业资本市场支撑体系等，为大学生创业开辟广阔空间。\r\n在2016年“创青春”大学生创业大赛中，经积极培育，我校共有11个项目在省赛中获奖，2个项目在国赛中获奖，并获得优秀组织奖。为进一步推动我校创新与创业教育深入开展，浓厚校园科技学术氛围，培育学生健全的人格，锤炼学生的社会竞争力与创造力，学校决定举办2018“创青春” 郑州轻工业学院创业大赛，竞赛由校团委主办，经济管理学院承办。现将有关事宜通知如下：\r\n一、竞赛主题\r\n中国梦，创业梦，我的梦\r\n二、参赛对象\r\n1、参赛资格：郑州轻工业学院2017年7月1日前在册的全日制本（专）科生、硕士研究生个人和小组均可参加3项主题赛事。毕业3年以内（时间截至2018年7月1日）的专科生、本科生、硕士研究生可代表原所在学院参加创业实践挑战赛。\r\n2、组队要求：以创业团队的形式参加比赛，以学院为单位统一申报，原则上每个团队人数不超过10人。鼓励跨学历层次、跨专业、跨年级组队，鼓励参赛同学组成学科优势互补、专业配备科学、人员结构合理的创业团队，注意包括管理、财务、法律、计算机等企业管理运行所需专业同学。\r\n三、大赛项目类别及申报条件\r\n（一）依据2018年“创青春”全国创业大赛，主体赛事分为三项：\r\n1.创业计划竞赛：以商业计划书评审、现场答辩等作为参赛项目的主要评价内容，主要考察参赛项目的创业机会、发展战略、营销策略、财务管理、管理团队等。参加竞赛项目分为已创业与未创业两类；分为农林、畜牧、食品及相关产业，生物医药，化工技术和环境科学，信息技术和电子商务，材料，机械能源，文化创意和服务咨询等7个组别。实行分类、分组申报。已创业与未创业的申报条件为：\r\n（1）拥有或授权拥有产品或服务，并已在工商、民政等政府部门注册登记为企业、个体工商户、民办非企业单位等组织形式，且法人代表或经营者为符合“二、参赛对象”中规定的在校学生、运营时间在3个月以上（截至到2018年7月31日）的项目，可申报已创业类。\r\n（2）拥有或授权拥有产品或服务，具有核心团队，具备实施创业的基本条件，但尚未在工商、民政等政府部门注册登记或注册登记时间在3个月以下的项目（截至到2018年7月31日），可申报未创业类。\r\n2.创业实践挑战赛：以经营状况、发展前景、营销策略、财务管理等作为参赛项目的主要评价内容。要求拥有或授权拥有产品或服务，并已在工商、民政等政府部门注册登记为企业、个体工商户、民办非企业单位等组织形式，且法人代表或经营者运营时间在3个月以上（截至到2018年7月31日）的项目可申报该赛事。申报不区分具体类别、组别。\r\n3.公益创业赛：以创办非盈利性质社会组织的计划和实践等作为参赛项目的主要评价内容。要求拥有较强的公益特征（有效解决社会问题，项目收益主要用于进一步扩大项目的范围、规模或水平）、创业特征（通过商业运作的方式，运用前期的少量资源撬动外界更广大的资源来解决社会问题，并形成可自身维持的商业模式）、实践特征（团队须实践其公益创业计划，形成可衡量的项目成果，部分或完全实现其计划的目标成果）的项目可申报该赛事。申报不区分具体类别、组别。\r\n（二）大赛同时设立MBA、电子商务等专项竞赛。\r\nMBA专项赛：（1）参赛对象：就读于MBA专业的在校学生。（2）参赛形式：通过申报创业项目计划书（是否已投入创业及创业领域不限，申报不区分具体组别）参加该项赛事。\r\n电子商务专项赛：（1）参赛对象：全体在校学生。（2）参赛形式：通过提交基于电子商务领域的创业项目计划书（是否已投入创业不限，鼓励申报已运营的项目）参赛。\r\n   具体相关内容参见创青春全国大学生创业大赛官网： http://www.chuangqingchun.net\r\n四、作品要求\r\n1、对于经授权的发明创造或专利技术，在报名时需提交具有法律效力的发明创造或专利技术所有人的书面授权许可、项目鉴定证书、专利证书等。对于已注册运营项目的，在报名时需提交相关证明材料（含单位概况、法定代表人情况、营业执照复印件、税务登记证复印件、组织机构代码复印件等材料）。\r\n2、参赛项目涉及下列内容时，必须由申报者提供有关部门的证明材料，否则不予评审：动植物新品种的发现或培育，须有省级以上农科部门或科研院所开具证明。对国家保护动植物的研究，须有省级以上林业部门开具证明，证明该项研究的过程中未产生对所研究的动植物繁衍、生长不利的影响。新药物的研究须有卫生行政部门授权机构或具有同等资质机构的鉴定证明。医疗卫生研究须通过专家鉴定，并最好附有在公开发行的专业性杂志上发表过的文章。涉及燃气用具等与人民生命财产安全有关用具的研究，须有国家相应行政部门授权机构的认定证明。\r\n五、大赛流程\r\n1、宣传发动阶段(2017年10月28日- 11月25日)\r\n各学院要在全院范围内进行广泛宣传，动员、指导有实力或有潜力的同学积极参赛，组织有关专家进行专题培训和指导，充分利用课余时间及时开展调查、研究，并撰写(制作)或完善作品，做好相关参赛准备。请各学院于2018年11月25日（周六）前将竞赛作品申报汇总表（附件1）报校团委，电子版放团委网盘。\r\n2、学院初评阶段(2017年11月25日-12月10日)\r\n各学院举行院内选拔赛，组织有关专家评选出优秀作品，并将指导完善后的作品及《申报表》(附件2、3、4)于12月10日之前交至校团委(纸质、电子版各一份)。每个学院推荐作品参赛件数详见各学院参赛作品数额分配表（附件5），并提交按作品质量高低排序的参赛作品清单。\r\n3、学校决赛(2017年12月10日-12月23日)\r\n校团委邀请有关专家对各学院上报的作品进行复审，遴选其中有较高学术价值或应用价值的作品参加学校决赛。入围决赛选手要在赛前将汇报PPT课件、项目介绍视频报送东风校区团委办公室，并现场抽签确定汇报顺序。\r\n校内决赛采用现场公开答辩方式进行，准备好5分钟PPT进行汇报，并接受专家提问。校内决赛具体时间地点另文通知。\r\n六、奖项设置\r\n竞赛设特、一、二、三等奖各若干名，并对获奖作品在第二十三届科技文化艺术节总结表彰中予以表彰。其中优秀的作品推荐参加全省“创青春”大学生创业大赛，学校对在省及国家竞赛中获奖的作品和优秀指导教师，将按照校内分配制度等有关规定给予奖励。\r\n七、具体要求\r\n1、高度重视，加强领导。在当前“大众创业、万众创新”的时代背景下，举办“创青春”大学生创业大赛是推进我校创新创业工作的有力举措。各学院要成立相关的组织协调机构，做好竞赛组织的宣传发动、项目选拔、团队组建、评审推荐以及指导教师团队配备、开放资料室和实验室等有关工作。\r\n2、广泛动员，精心组织。各院系要广泛宣传、深入发掘优秀的创业团队及创业人才，为学生参加创业大赛创造良好的环境和平台；积极动员广大教师依托专业优势吸纳优秀学生组建团队，切实做好参赛团队的指导工作，确保参赛作品创意新、立意高、质量好。广泛发动学生加入本次大赛官方群：632388036，（备注：专业班级+姓名），以便相互交流组队和传达相关信息。\r\n3、注重结合，健全机制。各院系要注重将“创青春”竞赛与教师的科研课题、大学生科技立项课题相结合，与学生的各类创新实践活动、暑期社会实践活动等结合起来。各学院要建立健全相应的激励政策，吸引广大本专科生、研究生积极参与大学生创业活动，动员更多的专业教师参与竞赛指导工作，形成浓厚的大学生创新实践氛围，为建设高水平校园文化做出应有贡献。\r\n\r\n\r\n附件1：2018年“创青春” 郑州轻工业学院大学生创业大赛作品汇总表\r\n附件2：第十四届“挑战杯” 郑州轻工业学院大学生创业计划竞赛作品申报表\r\n附件3、2018年“创青春”郑州轻工业学院大学生创业实践挑战赛申报表\r\n附件4：2018年“创青春” 郑州轻工业学院大学生公益创业赛申报表\r\n附件5： 2018年“创青春” 郑州轻工业学院大学生创业大赛作品数额分配表。\r\n\r\n\r\n共青团郑州轻工业学院委员会\r\n                       2017年10月28日', '2018-05-09', '2018-05-16', 'C:/bsData/_5345.zip');
INSERT INTO `activity` VALUES ('2', '综合', '2018第一届青春杯挑战赛', '为鼓励我校学生发展创新创业能力，2018年下学期大学生创新项目申报正式开始了，申报对象：郑州轻工业全校学生，欢迎同学们踊跃申报！', '2018-01-01', '2018-09-01', null);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `type` int(1) DEFAULT '1' COMMENT '0:超管1：专家',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'root', 'root', '超管', null, '0');
INSERT INTO `admin` VALUES ('2', '123', '123', '审批人1', '15136231361', '1');

-- ----------------------------
-- Table structure for item
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL COMMENT '理论成果、科技创新、科学成果',
  `activityId` int(11) DEFAULT '0',
  `userId` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT '' COMMENT '项目名',
  `charge` varchar(255) DEFAULT NULL COMMENT '负责人',
  `domain` varchar(255) DEFAULT NULL COMMENT '领域',
  `description` text,
  `start_time` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) NOT NULL,
  `coin` varchar(255) DEFAULT NULL COMMENT '申请金额',
  `group` varchar(255) DEFAULT NULL COMMENT '研究成员',
  `unit` varchar(255) DEFAULT NULL COMMENT '合作单位',
  `check` int(1) DEFAULT '0' COMMENT '0未审核1同意立项2不同意立项3同意结项4不同意结项',
  `filePath` varchar(255) DEFAULT NULL COMMENT '立项材料',
  `filePath2` varchar(255) DEFAULT NULL COMMENT '结项材料',
  `comment` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`,`end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('3', '科学成果', '1', '1', '计算机黑客的防范技术论文', '张和平', '计算机、黑客防范', '什么是计算机黑客 “黑客”一词有很多定义，大部分定义都涉及高超的编程技术，强烈的解决理由和克服限制的 。一般认为，黑客起源于50年代麻省理工学院的实验室中，他们精力充沛，热衷于解决难题。60、70年代，...', '2018-01-01', '2018-08-08', '500', '张和平', '郑州轻工业学院', '1', 'C:/bsData/1_张和平_结项.zip', 'C:/bsData/1_张和平_结项.zip', '24');

-- ----------------------------
-- Table structure for notice
-- ----------------------------
DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pub_time` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `adminId` int(11) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of notice
-- ----------------------------
INSERT INTO `notice` VALUES ('1', '2018-05-01', '关于举办郑州轻工业学院“创青春”创业大赛的通知', '1', '各学院分团委：\r\n由共青团中央、教育部、中国科协、全国学联主办的 2018年“创青春”全国大学生创业大赛（原型为“挑战杯”中国大学生创业计划竞赛）将于2018年4月至11月举办。\r\n“创青春”创业大赛是为了适应大学生创业发展的形势需要，在原有“挑战杯”全国大学生创业计划竞赛的基础上发展而来，每两年举办一次。团中央和相关部委以“创青春”全国大学生创业大赛为载体，进一步建立健全大学生创业公共政策扶持体系、大学生创业资本市场支撑体系等，为大学生创业开辟广阔空间。\r\n在2016年“创青春”大学生创业大赛中，经积极培育，我校共有11个项目在省赛中获奖，2个项目在国赛中获奖，并获得优秀组织奖。为进一步推动我校创新与创业教育深入开展，浓厚校园科技学术氛围，培育学生健全的人格，锤炼学生的社会竞争力与创造力，学校决定举办2018“创青春” 郑州轻工业学院创业大赛，竞赛由校团委主办，经济管理学院承办。现将有关事宜通知如下：\r\n一、竞赛主题\r\n中国梦，创业梦，我的梦\r\n二、参赛对象\r\n1、参赛资格：郑州轻工业学院2017年7月1日前在册的全日制本（专）科生、硕士研究生个人和小组均可参加3项主题赛事。毕业3年以内（时间截至2018年7月1日）的专科生、本科生、硕士研究生可代表原所在学院参加创业实践挑战赛。\r\n2、组队要求：以创业团队的形式参加比赛，以学院为单位统一申报，原则上每个团队人数不超过10人。鼓励跨学历层次、跨专业、跨年级组队，鼓励参赛同学组成学科优势互补、专业配备科学、人员结构合理的创业团队，注意包括管理、财务、法律、计算机等企业管理运行所需专业同学。\r\n三、大赛项目类别及申报条件\r\n（一）依据2018年“创青春”全国创业大赛，主体赛事分为三项：\r\n1.创业计划竞赛：以商业计划书评审、现场答辩等作为参赛项目的主要评价内容，主要考察参赛项目的创业机会、发展战略、营销策略、财务管理、管理团队等。参加竞赛项目分为已创业与未创业两类；分为农林、畜牧、食品及相关产业，生物医药，化工技术和环境科学，信息技术和电子商务，材料，机械能源，文化创意和服务咨询等7个组别。实行分类、分组申报。已创业与未创业的申报条件为：\r\n（1）拥有或授权拥有产品或服务，并已在工商、民政等政府部门注册登记为企业、个体工商户、民办非企业单位等组织形式，且法人代表或经营者为符合“二、参赛对象”中规定的在校学生、运营时间在3个月以上（截至到2018年7月31日）的项目，可申报已创业类。\r\n（2）拥有或授权拥有产品或服务，具有核心团队，具备实施创业的基本条件，但尚未在工商、民政等政府部门注册登记或注册登记时间在3个月以下的项目（截至到2018年7月31日），可申报未创业类。\r\n2.创业实践挑战赛：以经营状况、发展前景、营销策略、财务管理等作为参赛项目的主要评价内容。要求拥有或授权拥有产品或服务，并已在工商、民政等政府部门注册登记为企业、个体工商户、民办非企业单位等组织形式，且法人代表或经营者运营时间在3个月以上（截至到2018年7月31日）的项目可申报该赛事。申报不区分具体类别、组别。\r\n3.公益创业赛：以创办非盈利性质社会组织的计划和实践等作为参赛项目的主要评价内容。要求拥有较强的公益特征（有效解决社会问题，项目收益主要用于进一步扩大项目的范围、规模或水平）、创业特征（通过商业运作的方式，运用前期的少量资源撬动外界更广大的资源来解决社会问题，并形成可自身维持的商业模式）、实践特征（团队须实践其公益创业计划，形成可衡量的项目成果，部分或完全实现其计划的目标成果）的项目可申报该赛事。申报不区分具体类别、组别。\r\n（二）大赛同时设立MBA、电子商务等专项竞赛。\r\nMBA专项赛：（1）参赛对象：就读于MBA专业的在校学生。（2）参赛形式：通过申报创业项目计划书（是否已投入创业及创业领域不限，申报不区分具体组别）参加该项赛事。\r\n电子商务专项赛：（1）参赛对象：全体在校学生。（2）参赛形式：通过提交基于电子商务领域的创业项目计划书（是否已投入创业不限，鼓励申报已运营的项目）参赛。\r\n   具体相关内容参见创青春全国大学生创业大赛官网： http://www.chuangqingchun.net\r\n四、作品要求\r\n1、对于经授权的发明创造或专利技术，在报名时需提交具有法律效力的发明创造或专利技术所有人的书面授权许可、项目鉴定证书、专利证书等。对于已注册运营项目的，在报名时需提交相关证明材料（含单位概况、法定代表人情况、营业执照复印件、税务登记证复印件、组织机构代码复印件等材料）。\r\n2、参赛项目涉及下列内容时，必须由申报者提供有关部门的证明材料，否则不予评审：动植物新品种的发现或培育，须有省级以上农科部门或科研院所开具证明。对国家保护动植物的研究，须有省级以上林业部门开具证明，证明该项研究的过程中未产生对所研究的动植物繁衍、生长不利的影响。新药物的研究须有卫生行政部门授权机构或具有同等资质机构的鉴定证明。医疗卫生研究须通过专家鉴定，并最好附有在公开发行的专业性杂志上发表过的文章。涉及燃气用具等与人民生命财产安全有关用具的研究，须有国家相应行政部门授权机构的认定证明。\r\n五、大赛流程\r\n1、宣传发动阶段(2017年10月28日- 11月25日)\r\n各学院要在全院范围内进行广泛宣传，动员、指导有实力或有潜力的同学积极参赛，组织有关专家进行专题培训和指导，充分利用课余时间及时开展调查、研究，并撰写(制作)或完善作品，做好相关参赛准备。请各学院于2018年11月25日（周六）前将竞赛作品申报汇总表（附件1）报校团委，电子版放团委网盘。\r\n2、学院初评阶段(2017年11月25日-12月10日)\r\n各学院举行院内选拔赛，组织有关专家评选出优秀作品，并将指导完善后的作品及《申报表》(附件2、3、4)于12月10日之前交至校团委(纸质、电子版各一份)。每个学院推荐作品参赛件数详见各学院参赛作品数额分配表（附件5），并提交按作品质量高低排序的参赛作品清单。\r\n3、学校决赛(2017年12月10日-12月23日)\r\n校团委邀请有关专家对各学院上报的作品进行复审，遴选其中有较高学术价值或应用价值的作品参加学校决赛。入围决赛选手要在赛前将汇报PPT课件、项目介绍视频报送东风校区团委办公室，并现场抽签确定汇报顺序。\r\n校内决赛采用现场公开答辩方式进行，准备好5分钟PPT进行汇报，并接受专家提问。校内决赛具体时间地点另文通知。\r\n3、注重结合，健全机制。各院系要注重将“创青春”竞赛与教师的科研课题、大学生科技立项课题相结合，与学生的各类创新实践活动、暑期社会实践活动等结合起来。各学院要建立健全相应的激励政策，吸引广大本专科生、研究生积极参与大学生创业活动，动员更多的专业教师参与竞赛指导工作，形成浓厚的大学生创新实践氛围，为建设高水平校园文化做出应有贡献。\r\n\r\n\r\n共青团郑州轻工业学院委员会\r\n                       2017年10月28日');
INSERT INTO `notice` VALUES ('2', '2018-06-01', '关于举办郑州轻工业学院“创青春”创业大赛的通知', '1', '各学院分团委：\r\n由共青团中央、教育部、中国科协、全国学联主办的 2018年“创青春”全国大学生创业大赛（原型为“挑战杯”中国大学生创业计划竞赛）将于2018年4月至11月举办。\r\n“创青春”创业大赛是为了适应大学生创业发展的形势需要，在原有“挑战杯”全国大学生创业计划竞赛的基础上发展而来，每两年举办一次。团中央和相关部委以“创青春”全国大学生创业大赛为载体，进一步建立健全大学生创业公共政策扶持体系、大学生创业资本市场支撑体系等，为大学生创业开辟广阔空间。\r\n在2016年“创青春”大学生创业大赛中，经积极培育，我校共有11个项目在省赛中获奖，2个项目在国赛中获奖，并获得优秀组织奖。为进一步推动我校创新与创业教育深入开展，浓厚校园科技学术氛围，培育学生健全的人格，锤炼学生的社会竞争力与创造力，学校决定举办2018“创青春” 郑州轻工业学院创业大赛，竞赛由校团委主办，经济管理学院承办。现将有关事宜通知如下：\r\n一、竞赛主题\r\n中国梦，创业梦，我的梦\r\n二、参赛对象\r\n1、参赛资格：郑州轻工业学院2017年7月1日前在册的全日制本（专）科生、硕士研究生个人和小组均可参加3项主题赛事。毕业3年以内（时间截至2018年7月1日）的专科生、本科生、硕士研究生可代表原所在学院参加创业实践挑战赛。\r\n2、组队要求：以创业团队的形式参加比赛，以学院为单位统一申报，原则上每个团队人数不超过10人。鼓励跨学历层次、跨专业、跨年级组队，鼓励参赛同学组成学科优势互补、专业配备科学、人员结构合理的创业团队，注意包括管理、财务、法律、计算机等企业管理运行所需专业同学。\r\n三、大赛项目类别及申报条件\r\n（一）依据2018年“创青春”全国创业大赛，主体赛事分为三项：\r\n1.创业计划竞赛：以商业计划书评审、现场答辩等作为参赛项目的主要评价内容，主要考察参赛项目的创业机会、发展战略、营销策略、财务管理、管理团队等。参加竞赛项目分为已创业与未创业两类；分为农林、畜牧、食品及相关产业，生物医药，化工技术和环境科学，信息技术和电子商务，材料，机械能源，文化创意和服务咨询等7个组别。实行分类、分组申报。已创业与未创业的申报条件为：\r\n（1）拥有或授权拥有产品或服务，并已在工商、民政等政府部门注册登记为企业、个体工商户、民办非企业单位等组织形式，且法人代表或经营者为符合“二、参赛对象”中规定的在校学生、运营时间在3个月以上（截至到2018年7月31日）的项目，可申报已创业类。\r\n（2）拥有或授权拥有产品或服务，具有核心团队，具备实施创业的基本条件，但尚未在工商、民政等政府部门注册登记或注册登记时间在3个月以下的项目（截至到2018年7月31日），可申报未创业类。\r\n2.创业实践挑战赛：以经营状况、发展前景、营销策略、财务管理等作为参赛项目的主要评价内容。要求拥有或授权拥有产品或服务，并已在工商、民政等政府部门注册登记为企业、个体工商户、民办非企业单位等组织形式，且法人代表或经营者运营时间在3个月以上（截至到2018年7月31日）的项目可申报该赛事。申报不区分具体类别、组别。\r\n3.公益创业赛：以创办非盈利性质社会组织的计划和实践等作为参赛项目的主要评价内容。要求拥有较强的公益特征（有效解决社会问题，项目收益主要用于进一步扩大项目的范围、规模或水平）、创业特征（通过商业运作的方式，运用前期的少量资源撬动外界更广大的资源来解决社会问题，并形成可自身维持的商业模式）、实践特征（团队须实践其公益创业计划，形成可衡量的项目成果，部分或完全实现其计划的目标成果）的项目可申报该赛事。申报不区分具体类别、组别。\r\n（二）大赛同时设立MBA、电子商务等专项竞赛。\r\nMBA专项赛：（1）参赛对象：就读于MBA专业的在校学生。（2）参赛形式：通过申报创业项目计划书（是否已投入创业及创业领域不限，申报不区分具体组别）参加该项赛事。\r\n电子商务专项赛：（1）参赛对象：全体在校学生。（2）参赛形式：通过提交基于电子商务领域的创业项目计划书（是否已投入创业不限，鼓励申报已运营的项目）参赛。\r\n   具体相关内容参见创青春全国大学生创业大赛官网： http://www.chuangqingchun.net\r\n四、作品要求\r\n1、对于经授权的发明创造或专利技术，在报名时需提交具有法律效力的发明创造或专利技术所有人的书面授权许可、项目鉴定证书、专利证书等。对于已注册运营项目的，在报名时需提交相关证明材料（含单位概况、法定代表人情况、营业执照复印件、税务登记证复印件、组织机构代码复印件等材料）。\r\n2、参赛项目涉及下列内容时，必须由申报者提供有关部门的证明材料，否则不予评审：动植物新品种的发现或培育，须有省级以上农科部门或科研院所开具证明。对国家保护动植物的研究，须有省级以上林业部门开具证明，证明该项研究的过程中未产生对所研究的动植物繁衍、生长不利的影响。新药物的研究须有卫生行政部门授权机构或具有同等资质机构的鉴定证明。医疗卫生研究须通过专家鉴定，并最好附有在公开发行的专业性杂志上发表过的文章。涉及燃气用具等与人民生命财产安全有关用具的研究，须有国家相应行政部门授权机构的认定证明。\r\n五、大赛流程\r\n1、宣传发动阶段(2017年10月28日- 11月25日)\r\n各学院要在全院范围内进行广泛宣传，动员、指导有实力或有潜力的同学积极参赛，组织有关专家进行专题培训和指导，充分利用课余时间及时开展调查、研究，并撰写(制作)或完善作品，做好相关参赛准备。请各学院于2018年11月25日（周六）前将竞赛作品申报汇总表（附件1）报校团委，电子版放团委网盘。\r\n2、学院初评阶段(2017年11月25日-12月10日)\r\n各学院举行院内选拔赛，组织有关专家评选出优秀作品，并将指导完善后的作品及《申报表》(附件2、3、4)于12月10日之前交至校团委(纸质、电子版各一份)。每个学院推荐作品参赛件数详见各学院参赛作品数额分配表（附件5），并提交按作品质量高低排序的参赛作品清单。\r\n3、学校决赛(2017年12月10日-12月23日)\r\n校团委邀请有关专家对各学院上报的作品进行复审，遴选其中有较高学术价值或应用价值的作品参加学校决赛。入围决赛选手要在赛前将汇报PPT课件、项目介绍视频报送东风校区团委办公室，并现场抽签确定汇报顺序。\r\n校内决赛采用现场公开答辩方式进行，准备好5分钟PPT进行汇报，并接受专家提问。校内决赛具体时间地点另文通知。\r\n3、注重结合，健全机制。各院系要注重将“创青春”竞赛与教师的科研课题、大学生科技立项课题相结合，与学生的各类创新实践活动、暑期社会实践活动等结合起来。各学院要建立健全相应的激励政策，吸引广大本专科生、研究生积极参与大学生创业活动，动员更多的专业教师参与竞赛指导工作，形成浓厚的大学生创新实践氛围，为建设高水平校园文化做出应有贡献。\r\n\r\n\r\n共青团郑州轻工业学院委员会\r\n                       2017年10月28日');

-- ----------------------------
-- Table structure for power
-- ----------------------------
DROP TABLE IF EXISTS `power`;
CREATE TABLE `power` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '权限名字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of power
-- ----------------------------
INSERT INTO `power` VALUES ('1', '发布公告');
INSERT INTO `power` VALUES ('2', '成果审批');
INSERT INTO `power` VALUES ('3', '项目审批');
INSERT INTO `power` VALUES ('4', '添加活动');
INSERT INTO `power` VALUES ('5', '用户管理');
INSERT INTO `power` VALUES ('6', '公告编辑');
INSERT INTO `power` VALUES ('7', '活动编辑');
INSERT INTO `power` VALUES ('8', '权限管理');
INSERT INTO `power` VALUES ('9', '成果录入');

-- ----------------------------
-- Table structure for results
-- ----------------------------
DROP TABLE IF EXISTS `results`;
CREATE TABLE `results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) DEFAULT NULL COMMENT '负责人Id',
  `activity_id` int(11) DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL COMMENT '理论成果、科技创新、科学成果',
  `charge` varchar(255) DEFAULT NULL COMMENT '负责人',
  `domain` varchar(255) DEFAULT '' COMMENT '领域',
  `description` text COMMENT '描述',
  `start_time` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `coin` double DEFAULT '0' COMMENT '申请金额',
  `group` varchar(255) DEFAULT NULL COMMENT '研究成员',
  `unit` varchar(255) DEFAULT NULL COMMENT '合作单位',
  `check` int(1) DEFAULT '0' COMMENT '审核是否通过',
  `filePath` varchar(255) DEFAULT NULL COMMENT '材料路径',
  `comment` varchar(255) DEFAULT '' COMMENT '审核评语',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of results
-- ----------------------------
INSERT INTO `results` VALUES ('1', '1', '0', '基于SSM的科研成果申报管理系统', '科技创新', '张和平', '计算机、javaWeb、B/S', '一个科研成果申报管理系统', '2018-01-01', '2018-06-06', '1000', '张和平、王小明', '郑州轻工业学院', '1', 'C:/bsData/1_张和平.zip', '123');
INSERT INTO `results` VALUES ('2', '1', '0', '有关基因工程的杂交水稻的研究', '理论成果', '张和平', '基因工程、杂交水稻', '该研究通过基因工程学、生物学的理论知识，对杂交水稻进行研究，培育出新型优良的水稻品种。', '2018-01-01', '2018-06-06', '500', '张和平、陈小力', '郑州轻工业学院', '1', 'C:/bsData/1_张和平.zip', '');
INSERT INTO `results` VALUES ('3', '1', '0', '浅谈水利工程大坝阻力因子系数', '理论成果', '张和平', '水利工程', '一篇理论成果论文，荣获论文评比一等奖', '2018-01-01', '2018-06-06', '200', '张和平', '郑州轻工业学院', '2', 'C:/bsData/1_张和平.zip', '');
INSERT INTO `results` VALUES ('4', '1', '0', '如何培养学生的朗读能力', '理论成果', '张和平', '教育', '灵活选用朗读训练的形式，培养学生的朗读能力', '2018-01-01', '2018-06-06', '200', '张和平、王小明', '郑州轻工业学院', '0', 'C:/bsData/1_张和平.zip', '');
INSERT INTO `results` VALUES ('12', '1', '0', '数学思想方法及其教学策略初探', '理论成果', '张和平', '思想方法； 教学策略； 数学史', '数学思想方法是数学的灵魂.', '2018-01-01', '2018-06-06', '200', '张和平', '郑州轻工业学院', '0', null, '');
INSERT INTO `results` VALUES ('13', '1', '0', '校园网基本网络搭建及网络安全设计分析', '理论成果', '张和平', '校园网；网络搭建；网络安全', '校园网网络中的主机可能会受到非法入侵者的攻击，网络中的敏感数据有可能泄露或被修改，保证网络系统的保密性、完整性、可用性、可控性、可审查性方面具有其重要意义。', '2018-01-01', '2018-06-06', '500', '张和平、王小明', '郑州轻工业学院', '0', null, '');
INSERT INTO `results` VALUES ('14', '1', '0', '水利工程计算机应用现状与思考', '理论成果', '张和平', '水电工程 计算机 应用 思考', '水利工程计算机应用具有广阔的发展前景，无论是数值计算、数据库应用，还是专家系统、网络系统，都大有用武之地；', '2018-01-01', '2018-06-06', '200', '张和平', '郑州轻工业学院', '0', null, '');
INSERT INTO `results` VALUES ('15', '1', '0', '浅析嵌入式系统支柱学科的交叉与融合', '理论成果', '张和平', '嵌入式系统；学科体系；平台模式；', '嵌入式系统的概念源于微型计算机的嵌入式应用。早期的嵌入式系统探索过工控机、单板机、微机单片化的专用计算机的形式，随后走上了独立的发展道路。', '2018-01-01', '2018-06-06', '200', '张和平、王小明', '郑州轻工业学院', '0', null, '');
INSERT INTO `results` VALUES ('16', '1', '0', '浅谈高职院校计算机网络实践教学', '理论成果', '张和平', '网络技术专业；实践教学；教学方法', '前大部分高职院校都开设有计算机网络技术专业，而实训教学则是计算机网络技术专业教学中很重要的一个组成部分。本文结合当前高职院校计算机网络技术专业的发展趋势，根据实训教学的特点，从网络实训课程的开设、网络实训的过程、网络综合实训等多方面对网络技术专业的实训教学进行了深入的探索。', '2018-01-01', '2018-06-06', '200', '张和平', '郑州轻工业学院', '0', 'C:/bsData/1_张和平.zip', '');
INSERT INTO `results` VALUES ('17', '1', '0', '项目教学法在计算机网络课程中的应用', '理论成果', '张和平', '项目教学法；计算机网络', '提高学生计算机知识水平和实践动手能力，是中职学校计算机教育的根本任务。由于中职学生学习积极性不高，计算机教学效率低下，在中职计算机网络课程中采用项目教学法十分必要。', '2018-01-01', '2018-06-06', '200', '张和平、王小明', '郑州轻工业学院', '0', null, '');
INSERT INTO `results` VALUES ('18', '1', '0', '测试数据', '理论成果', '张和平', '测试数据', '测试数据', '2018-01-01', '2018-06-06', '200', '测试数据', '测试数据', '0', 'C:/bsData/1_张和平.zip', '');
INSERT INTO `results` VALUES ('19', '1', '0', '测试数据', '科技创新', '张和平', '测试数据', '测试数据', '2018-01-01', '2018-06-06', '200', '测试数据', '测试数据', '0', null, '');
INSERT INTO `results` VALUES ('20', '1', '0', '测试数据', '理论成果', '张和平', '测试数据', '测试数据', '2018-01-01', '2018-06-06', '1000', '测试数据', '测试数据', '0', 'C:/bsData/1_张和平.zip', '');
INSERT INTO `results` VALUES ('21', '1', '0', '测试数据', '理论成果', '张和平', '测试数据', '测试数据', '2018-01-01', '2018-06-06', '500', '测试数据', '测试数据', '0', null, '');
INSERT INTO `results` VALUES ('22', '1', '0', '测试数据', '科技创新', '张和平', '测试数据', '测试数据', '2018-01-01', '2018-06-06', '200', '张和平、王小明', '郑州轻工业学院', '0', 'C:/bsData/1_张和平.zip', '');
INSERT INTO `results` VALUES ('23', '1', '0', '测试数据', '科学成果', '张和平', '测试数据', '测试数据', '2018-01-01', '2018-06-06', '1000', '张和平', '郑州轻工业学院', '0', null, '');
INSERT INTO `results` VALUES ('24', '1', '0', '测试数据', '科技创新', '张和平', '测试数据', '测试数据', '2018-01-01', '2018-06-06', '200', '张和平', '郑州轻工业学院', '0', 'C:/bsData/1_张和平.zip', '');
INSERT INTO `results` VALUES ('25', '1', '0', '浅谈水利工程大坝阻力因子系数', '科技创新', '张和平', '测试数据', '一个科研成果申报管理系统', '2018-01-01', '2018-06-06', '1000', '张和平、王小明', '郑州轻工业学院', '0', null, '');
INSERT INTO `results` VALUES ('26', '1', '0', '基于SSM的科研成果申报管理系统', '理论成果', '张和平', '测试数据', '一个科研成果申报管理系统', '2018-01-01', '2018-06-06', '200', '张和平', '郑州轻工业学院', '0', 'C:/bsData/1_张和平.zip', '');
INSERT INTO `results` VALUES ('27', '1', '0', '测试数据', '科技创新', '张和平', '测试数据', '测试数据', '2018-01-01', '2018-06-06', '1000', '张和平', '郑州轻工业学院', '0', null, '');
INSERT INTO `results` VALUES ('28', '1', '0', '浅谈水利工程大坝阻力因子系数', '科技创新', '张和平', '计算机、javaWeb、B/S', '一个科研成果申报管理系统', '2018-01-01', '2018-06-06', '200', '张和平、王小明', '郑州轻工业学院', '0', null, '');
INSERT INTO `results` VALUES ('29', null, '0', '测试数据', '理论成果', '张和平', '测试数据', '测试数据', '2018-01-01', '2018-08-08', '500', '张和平', '郑州轻工业学院', '1', null, '');
INSERT INTO `results` VALUES ('30', '1', '1', '计算机黑客的防范技术论文', '科学成果', '张和平', '计算机、黑客防范', '什么是计算机黑客 “黑客”一词有很多定义，大部分定义都涉及高超的编程技术，强烈的解决理由和克服限制的 。一般认为，黑客起源于50年代麻省理工学院的实验室中，他们精力充沛，热衷于解决难题。60、70年代，...', '2018-01-01', '2018-08-08', '500', '张和平', null, '1', 'C:/bsData/1_张和平_结项.zip', '');

-- ----------------------------
-- Table structure for rp
-- ----------------------------
DROP TABLE IF EXISTS `rp`;
CREATE TABLE `rp` (
  `rid` int(11) NOT NULL COMMENT '管理员ID',
  `pid` int(11) NOT NULL COMMENT '权限ID',
  UNIQUE KEY `rid` (`rid`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rp
-- ----------------------------
INSERT INTO `rp` VALUES ('1', '1');
INSERT INTO `rp` VALUES ('1', '2');
INSERT INTO `rp` VALUES ('1', '3');
INSERT INTO `rp` VALUES ('1', '4');
INSERT INTO `rp` VALUES ('1', '5');
INSERT INTO `rp` VALUES ('1', '6');
INSERT INTO `rp` VALUES ('1', '7');
INSERT INTO `rp` VALUES ('1', '8');
INSERT INTO `rp` VALUES ('1', '9');
INSERT INTO `rp` VALUES ('2', '2');
INSERT INTO `rp` VALUES ('2', '3');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL,
  `pwd` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123', '123', null, null, null, null, null);
