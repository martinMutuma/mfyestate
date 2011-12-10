CREATE DATABASE /*!32312 IF NOT EXISTS*/`estate` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `estate`;

DROP TABLE IF EXISTS `t_d_data`;

CREATE TABLE `t_d_data` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `pid` int(11) default NULL COMMENT 'definationID',
  `name` varchar(30) default NULL COMMENT '名称',
  `code` varchar(10) default NULL COMMENT '编码',
  `descr` varchar(50) default NULL COMMENT '描述',
  `minvalue` varchar(10) default NULL COMMENT '最小值',
  `maxvalue` varchar(10) default NULL COMMENT '最大值',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_d_data` */

/*Table structure for table `t_d_defination` */

DROP TABLE IF EXISTS `t_d_defination`;

CREATE TABLE `t_d_defination` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `name` varchar(30) default NULL COMMENT '名称',
  `code` varchar(10) default NULL COMMENT '编码',
  `searchType` varchar(2) default NULL COMMENT '搜索类型',
  `descr` varchar(50) default NULL COMMENT '描述',
  `category` varchar(2) default NULL COMMENT '码表类型',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_d_defination` */

/*Table structure for table `t_s_menu` */

DROP TABLE IF EXISTS `t_s_menu`;

CREATE TABLE `t_s_menu` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `name` varchar(50) default NULL COMMENT '菜单名字 ',
  `url` varchar(100) default NULL COMMENT '菜单路径',
  `tip` varchar(50) default NULL COMMENT '提示',
  `descr` varchar(100) default NULL COMMENT '描述',
  `orderNum` int(2) default NULL COMMENT '序号',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_s_menu` */

/*Table structure for table `t_s_pro` */

DROP TABLE IF EXISTS `t_s_pro`;

CREATE TABLE `t_s_pro` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `name` varchar(30) default NULL COMMENT '项目名',
  `descr` varchar(50) default NULL COMMENT '描述',
  `orderNum` int(2) default NULL COMMENT '序号',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_s_pro` */

/*Table structure for table `t_s_user` */

DROP TABLE IF EXISTS `t_s_user`;

CREATE TABLE `t_s_user` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `username` varchar(20) default NULL COMMENT '登录名',
  `password` varchar(20) default NULL COMMENT '密码',
  `name` varchar(30) default NULL COMMENT '真实姓名',
  `level` varchar(2) default NULL COMMENT '等级',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;



/*Table structure for table `t_s_pro_defination` */
DROP TABLE IF EXISTS `t_s_pro_defination`;

CREATE TABLE `t_s_pro_defination` (                            
  `id` int(11) NOT NULL auto_increment COMMENT '主键',       
  `proId` int(11) default NULL COMMENT '项目主键',         
  `definationId` int(11) default NULL COMMENT '码表主键',  
  `orderNum` varchar(2) default NULL COMMENT '显示顺序',      
  PRIMARY KEY  (`id`)                                          
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

/*Table structure for table `t_s_pro_defination` */
DROP TABLE IF EXISTS `t_m_baseinfo`;

CREATE TABLE `t_m_baseinfo` (                                                                                                   
    `id` int(11) NOT NULL auto_increment COMMENT '主键',                                                                        
    `username` varchar(20) default NULL COMMENT '登陆名',                                                                      
    `password` varchar(20) default NULL COMMENT '密码',                                                                         
    `type` varchar(2) default NULL COMMENT '用户类型',                                                                        
    `discode` varchar(10) default NULL COMMENT '所属地区码',                                                                 
    `email` varchar(50) default NULL COMMENT '电子邮件',                                                                      
    `realName` varchar(30) default NULL COMMENT '真实姓名',                                                                   
    `stores` varchar(50) default NULL COMMENT '门店',                                                                           
    `company` varchar(50) default NULL COMMENT '所属公司名',                                                                 
    `mobile` varchar(15) default NULL COMMENT '手机号',                                                                        
    `tel` varchar(15) default NULL COMMENT '固定电话',                                                                        
    `status` char(1) default NULL COMMENT '用户状态',                                                                         
    `certification` char(1) default NULL COMMENT '认证',                                                                        
    `money` double(15,2) default NULL COMMENT '金币',                                                                           
    `integral` int(11) default NULL COMMENT '积分',                                                                             
    `mouseWord` int(11) default NULL COMMENT '口碑',                                                                            
    `level` int(2) default 0 COMMENT '等级',                                                                                 
    `virtualCurrency` double(15,2) default NULL COMMENT '虚拟金钱',                                                           
    `introduction` varchar(500) default NULL COMMENT '自我介绍',                                                              
    `lastLoginTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '最后一次登陆时间',  
    PRIMARY KEY  (`id`)                                                                                                           
  ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
  
  /*新增字段  zh  2011-06-05*/
   ALTER TABLE `estate`.`t_m_baseinfo`     ADD COLUMN `disname` VARCHAR(50) NULL COMMENT '所属地区名称' AFTER `discode`;
  
  /*Table structure for table `t_s_pro_defination` */
DROP TABLE IF EXISTS `t_p_office`;

CREATE TABLE `t_p_office` (                                                 
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `num` varchar(15) default NULL COMMENT '房源编号',                   
  `category` varchar(2) default NULL COMMENT '写字楼类型',             
  `name` varchar(100) default NULL COMMENT '楼盘名称',                  
  `address` varchar(200) default NULL COMMENT '楼盘地址',               
  `propertyManagement` double(5,2) default NULL COMMENT '物业管理费',  
  `floorType` char(1) default NULL COMMENT '楼层',                        
  `price` double(15,2) default NULL COMMENT '租金单价',                 
  `area` double(5,2) default NULL COMMENT '建筑面积',                   
  `successPre` double(5,2) default NULL COMMENT '得房率',                
  `title` varchar(100) default NULL COMMENT '案源标题',                 
  `content` varchar(2000) default NULL COMMENT '案源描述',              
  `imgName1` varchar(50) default NULL COMMENT '图片名称1',              
  `imgType1` char(1) default NULL COMMENT '图片类型1',                  
  `imgUrl1` varchar(200) default NULL COMMENT '图片地址1',              
  `imgName2` varchar(50) default NULL,                                      
  `imgType2` char(1) default NULL,                                          
  `imgUrl2` varchar(200) default NULL,                                      
  `imgName3` varchar(50) default NULL,                                      
  `imgType3` char(1) default NULL,                                          
  `imgUrl3` varchar(200) default NULL,                                      
  `imgName4` varchar(50) default NULL,                                      
  `imgType4` char(1) default NULL,                                          
  `imgUrl4` varchar(200) default NULL,                                      
  `imgName5` varchar(50) default NULL,                                      
  `imgType5` char(1) default NULL,                                          
  `imgUrl5` varchar(200) default NULL,                                      
  `positionX` varchar(20) default NULL COMMENT '地图坐标X',             
  `positionY` varchar(20) default NULL COMMENT '地图坐标Y',             
  `authorId` int(11) default NULL COMMENT '发布人id',                    
  `flag` char(1) default NULL COMMENT '类别',                             
  PRIMARY KEY  (`id`)                                                       
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

  /*Table structure for table `t_p_estate` */
DROP TABLE IF EXISTS `t_p_estate`;

CREATE TABLE `t_p_estate` (                                                    
  `id` int(11) NOT NULL auto_increment COMMENT '主键',                       
  `name` varchar(50) default NULL COMMENT '楼盘名称',                      
  `pinyin` varchar(50) default NULL COMMENT '拼音缩写',                    
  `address` varchar(200) default NULL COMMENT '地址',                        
  `district` varchar(10) default NULL COMMENT '所属城市/区',              
  `propertyCompany` varchar(50) default NULL COMMENT '物业公司',           
  `propertyDevelopers` varchar(50) default NULL COMMENT '物业开发公司',  
  `packingRent` double(5,2) default NULL COMMENT '车位租金',               
  `packingCount` int(5) default NULL COMMENT '车位数量',                   
  `propertyFees` double(5,2) default NULL COMMENT '物业管理费',           
  `propertyLevel` char(1) default NULL COMMENT '物业级别',                 
  `customElevator` int(3) default NULL COMMENT '客梯数量',                 
  `fireElevator` int(3) default NULL COMMENT '消防电梯数量',             
  `totalArea` double(15,2) default NULL COMMENT '总建筑面积',             
  `standardArea` double(15,2) default NULL COMMENT '标准层面积',          
  `floorCount` int(3) default NULL COMMENT '总层数',                        
  `groundFloor` int(3) default NULL COMMENT '地上层数',                    
  `undergroundFloor` int(1) default NULL COMMENT '地下层数',               
  `traffic` varchar(100) default NULL COMMENT '交通状况',                  
  `propertyDesc` varchar(1000) default NULL COMMENT '物业描述',
  `imgName1` varchar(50) default NULL COMMENT '图片名称1',              
  `imgType1` char(1) default NULL COMMENT '图片类型1',                  
  `imgUrl1` varchar(200) default NULL COMMENT '图片地址1',              
  `imgName2` varchar(50) default NULL,                                      
  `imgType2` char(1) default NULL,                                          
  `imgUrl2` varchar(200) default NULL,                                      
  `imgName3` varchar(50) default NULL,                                      
  `imgType3` char(1) default NULL,                                          
  `imgUrl3` varchar(200) default NULL,                                      
  `imgName4` varchar(50) default NULL,                                      
  `imgType4` char(1) default NULL,                                          
  `imgUrl4` varchar(200) default NULL,                                      
  `imgName5` varchar(50) default NULL,                                      
  `imgType5` char(1) default NULL,                                          
  `imgUrl5` varchar(200) default NULL,                                      
  `positionX` varchar(20) default NULL COMMENT '地图坐标X',             
  `positionY` varchar(20) default NULL COMMENT '地图坐标Y',             
  `authorId` int(11) default NULL COMMENT '发布人id',    
  PRIMARY KEY  (`id`)                                                          
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  /*Table structure for table `t_p_officeneed` */
DROP TABLE IF EXISTS `t_p_officeneed`;

CREATE TABLE `t_p_officeneed` (                                       
  `id` int(11) NOT NULL auto_increment COMMENT '主键',              
  `district` varchar(10) default NULL COMMENT '地区码',            
  `address` varchar(100) default NULL COMMENT '地址',               
  `nearAddress` varchar(100) default NULL COMMENT '附件地址',     
  `minArea` double(5,2) default NULL COMMENT '建筑面积(最小)',  
  `maxArea` double(5,2) default NULL COMMENT '建筑面积(最大)',  
  `minPrice` double(5,2) default NULL COMMENT '最少租金',         
  `maxPrice` double(5,2) default NULL COMMENT '最大租金',         
  `title` varchar(100) default NULL COMMENT '需求标题',           
  `descr` varchar(1000) default NULL COMMENT '需求描述',          
  `authorId` int(11) default NULL COMMENT '发布人id',              
  `flag` char(1) default NULL COMMENT '1:求租 2：求购',          
  PRIMARY KEY  (`id`)                                                 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


 alter table `estate`.`t_s_user` add column `state`  int(1)  NULL comment '用户状态0正常1禁用' ;
  

alter table `estate`.`t_p_office` add column `createTime` timestamp NULL COMMENT '发布时间' after `authorId`
, add column `auditingState` char(1) default 0 COMMENT '审核状态' after `createTime`;

alter table `estate`.`t_s_menu` add column `pid` int NULL COMMENT '父菜单id' after `orderNum`;

alter table `estate`.`t_p_officeneed` add column `createTime` timestamp NULL COMMENT '发布时间' after `authorId`, add column `auditing` char(1) default 0 COMMENT '审核状态' after `createTime`;

/*20110513修改菜单表*/
alter table `estate`.`t_s_menu` change `pid` `mainMenu` char(1) NULL  comment '是否是主菜单0否1是';

/*Data for the table `t_s_user` */

insert  into `t_s_user`(`id`,`username`,`password`,`name`,`level`,`state`) values (1,'admin','admin',NULL,NULL,0);

/*20110514添加表字段*/
alter table `estate`.`T_S_PRO_DEFINATION` add column `addressName`  varchar(50)  NULL comment '标注名称' ;

alter table `estate`.`T_P_OFFICENEED` add column `category`  char(1)  NULL comment '种类/适合行业' ;
alter table `estate`.`T_P_OFFICENEED` add column `needType`  char(1)  NULL comment '需求种类:1写字楼2商铺3工业地产4大型项目' ;

DROP TABLE IF EXISTS `T_S_SHOPS`;
CREATE TABLE `T_S_SHOPS` (
`id` int(11) NOT NULL auto_increment COMMENT '主键',
`district` varchar(10) default NULL COMMENT '省/市/区',
`address` varchar(200) default NULL COMMENT '地址',
`nearAddress` varchar(200) default NULL COMMENT '临近',
`ugOneFloor` double(5,2) default NULL COMMENT '楼层/面积：地下一层',
`ugTwoFloor` double(5,2) default NULL COMMENT '地下二层',
`firstFloor` double(5,2) default NULL COMMENT '1层',
`secondFloor` double(5,2) default NULL COMMENT '2层',
`thirdFloor` double(5,2) default NULL COMMENT '3层',
`fourceFloor` double(5,2) default NULL COMMENT '4层',
`fifthFloor` double(5,2) default NULL COMMENT '5层',
`sixFloor` double(5,2) default NULL COMMENT '6层',
`sevenFloor` double(5,2) default NULL COMMENT '7层',
`eightFloor` double(5,2) default NULL COMMENT '8层',
`suitIndustry` varchar(20) default NULL COMMENT '适合行业',
`propertyManagement` double(5,2) default NULL COMMENT '物业管理费',
`bursary` double(5,2) default NULL COMMENT '年租金/出售总价',
`title` varchar(100) default NULL COMMENT '案源标题',
`consYear` varchar(4) default NULL COMMENT '建筑年代',
`content` varchar(2000) default NULL COMMENT '案源描述',
`imgName1` varchar(50) default NULL COMMENT '图片名称1',
`imgType1` char(1) default NULL COMMENT '图片类型1',
`imgUrl1` varchar(200) default NULL COMMENT '图片地址1',
`imgName2` varchar(50) default NULL COMMENT '图片名称2',
`imgType2` char(1) default NULL COMMENT '图片类型2',
`imgUrl2` varchar(200) default NULL COMMENT '图片地址2',
`imgName3` varchar(50) default NULL COMMENT '图片名称3',
`imgType3` char(1) default NULL COMMENT '图片类型3',
`imgUrl3` varchar(200) default NULL COMMENT '图片地址3',
`imgName4` varchar(50) default NULL COMMENT '图片名称4',
`imgType4` char(1) default NULL COMMENT '图片类型4',
`imgUrl4` varchar(200) default NULL COMMENT '图片地址4',
`imgName5` varchar(50) default NULL COMMENT '图片名称5',
`imgType5` char(1) default NULL COMMENT '图片类型5',
`imgUrl5` varchar(200) default NULL COMMENT '图片地址5',
`positionX` varchar(20) default NULL COMMENT '纬度',
`positionY` varchar(20) default NULL COMMENT '经度',
`addressName` varchar(50) default NULL COMMENT '标注名称',
`authorId` Int(11) default NULL COMMENT '发布人id',
`createTime` timestamp  NULL COMMENT '发布时间',
`auditingState` Char(1) default 0 COMMENT '审核状态:0未审核1审核成功2审核失败3成交通过4成交失败',
`Flag` Char(1) default NULL COMMENT '标识',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `T_P_BUSINESS`;
CREATE TABLE `T_P_BUSINESS` (                          
`id` int(11) NOT NULL auto_increment COMMENT '主键',
`category` char(1) default NULL COMMENT'行业类别',
`district` varchar(10) default NULL COMMENT'省/市/区',
`title` varchar(100) default NULL COMMENT'信息标题',
`address` varchar(100) default NULL COMMENT'地址',
`area` double(5,2) default NULL COMMENT'物业面积',
`price` double(5,2) default NULL COMMENT'转让价格',
`state` char(1) default NULL COMMENT'房源持有状态',
`propertyRent` double(5,2) default NULL COMMENT'物业状况:租金',
`rentDate` timestamp  NULL COMMENT'租赁到期日',
`payWay` varchar(50) default NULL COMMENT'租金付款方式',
`rentState` varchar(50) default NULL COMMENT'租金递增状况',
`companyType` char(1) default NULL COMMENT'经营状况:公司类型',
`capital` double(5,2) default NULL COMMENT'注册资金',
`scope` varchar(100) default NULL COMMENT'经营范围',
`businessTax` double(5,2) default NULL COMMENT'过去一年营业税',
`incomeTax` double(5,2) default NULL COMMENT'过去一年所得税',
`businessYear` int(2) default NULL COMMENT'已经营年限',
`consumer` double(5,2) default NULL COMMENT'人均消费',
`numCount` int(3) default NULL COMMENT'每平方米日均容客流量',
`employees` int(4) default NULL COMMENT'雇员',
`isMember` char(1) default NULL COMMENT'是否会员制',
`members` int(6) default NULL COMMENT'已有会员',
`shares` double(4,2) default NULL COMMENT'转让股份',
`content` varchar(2000) default NULL COMMENT'案源描述',
`imgName1` varchar(50) default NULL COMMENT'图片名称1',
`imgType1` char(1) default NULL COMMENT'图片类型1',
`imgUrl1` varchar(200) default NULL COMMENT'图片地址1',
`imgName2` varchar(50) default NULL COMMENT'图片名称2',
`imgType2` char(1) default NULL COMMENT'图片类型2',
`imgUrl2` varchar(200) default NULL COMMENT'图片地址2',
`imgName3` varchar(50) default NULL COMMENT'图片名称3',
`imgType3` char(1) default NULL COMMENT'图片类型3',
`imgUrl3` varchar(200) default NULL COMMENT'图片地址3',
`imgName4` varchar(50) default NULL COMMENT'图片名称4',
`imgType4` char(1) default NULL COMMENT'图片类型4',
`imgUrl4` varchar(200) default NULL COMMENT'图片地址4',
`imgName5` varchar(50) default NULL COMMENT'图片名称5',
`imgType5` char(1) default NULL COMMENT'图片类型5',
`imgUrl5` varchar(200) default NULL COMMENT'图片地址5',
`positionX` varchar(20) default NULL COMMENT'纬度',
`positionY` varchar(20) default NULL COMMENT'经度',
`addressName` varchar(50) default NULL COMMENT'标注名称',
`authorId` Int(11) default NULL COMMENT'发布人id',
`createTime` timestamp  NULL COMMENT'发布时间',
`auditingState` Char(1) default NULL COMMENT'审核状态',
  PRIMARY KEY  (`id`)                
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `T_P_INDUSTRY`;

CREATE TABLE `T_P_INDUSTRY` (                          
`id` int(11) NOT NULL auto_increment COMMENT '主键',
`district` varchar(10) default NULL COMMENT'省/市/区',
`address` varchar(100) default NULL COMMENT'地址',
`constructionArea` double(6,2) default NULL COMMENT'建筑面积',
`area` double(6,2) default NULL COMMENT'占地面积',
`spaceArea` double(6,2) default NULL COMMENT'空地面积',
`far` double(4,2) default NULL COMMENT'容积率',
`greenRate` double(4,2) default NULL COMMENT'绿化率',
`industry` char(1) default NULL COMMENT'行业',
`category` char(1) default NULL COMMENT'种类',
`type` char(1) default NULL COMMENT'类型',
`floorHeight` varchar(20) default NULL COMMENT'层高',
`car` varchar(20) default NULL COMMENT'行车',
`structure` varchar(20) default NULL COMMENT'结构',
`bear` varchar(20) default NULL COMMENT'承重',
`power` double(5,2) default NULL COMMENT'配电功率',
`water` double(5,2) default NULL COMMENT'水',
`communicate` varchar(20) default NULL COMMENT'通讯情况',
`isSingle` char(1) default NULL COMMENT'是否独门独院',
`facilities` varchar(100) default NULL COMMENT'配套设施说明',
`propertyManagement` double(5,2) default NULL COMMENT'物业管理费',
`bursary` double(5,2) default NULL COMMENT'年租金/出售总价',
`title` varchar(100) default NULL COMMENT'案源标题',
`content` varchar(2000) default NULL COMMENT'案源描述',
`imgName1` varchar(50) default NULL COMMENT'图片名称1',
`imgType1` char(1) default NULL COMMENT'图片类型1',
`imgUrl1` varchar(200) default NULL COMMENT'图片地址1',
`imgName2` varchar(50) default NULL COMMENT'图片名称2',
`imgType2` char(1) default NULL COMMENT'图片类型2',
`imgUrl2` varchar(200) default NULL COMMENT'图片地址2',
`imgName3` varchar(50) default NULL COMMENT'图片名称3',
`imgType3` char(1) default NULL COMMENT'图片类型3',
`imgUrl3` varchar(200) default NULL COMMENT'图片地址3',
`imgName4` varchar(50) default NULL COMMENT'图片名称4',
`imgType4` char(1) default NULL COMMENT'图片类型4',
`imgUrl4` varchar(200) default NULL COMMENT'图片地址4',
`imgName5` varchar(50) default NULL COMMENT'图片名称5',
`imgType5` char(1) default NULL COMMENT'图片类型5',
`imgUrl5` varchar(200) default NULL COMMENT'图片地址5',
`positionX` varchar(20) default NULL COMMENT'纬度',
`positionY` varchar(20) default NULL COMMENT'经度',
`addressName` varchar(50) default NULL COMMENT'标注名称',
`authorId` Int(11) default NULL COMMENT'发布人id',
`createTime` timestamp  NULL COMMENT'发布时间',
`auditingState` Char(1) default NULL COMMENT'审核状态',
`Flag` Char(1) default NULL COMMENT'标识',
  PRIMARY KEY  (`id`)                
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `T_P_LARGEPRO`;
    
            
CREATE TABLE `T_P_LARGEPRO` (                          
`id` int(11) NOT NULL auto_increment COMMENT '主键',
`district` varchar(10) default NULL COMMENT'省/市/区',
`address` varchar(100) default NULL COMMENT'地址',
`payWay` char(1) default NULL COMMENT'交易方式',
`price` double(5,2) default NULL COMMENT'价格',
`title` varchar(100) default NULL COMMENT'项目名称',
`content` varchar(2000) default NULL COMMENT'案源描述',
`imgName1` varchar(50) default NULL COMMENT'图片名称1',
`imgType1` char(1) default NULL COMMENT'图片类型1',
`imgUrl1` varchar(200) default NULL COMMENT'图片地址1',
`imgName2` varchar(50) default NULL COMMENT'图片名称2',
`imgType2` char(1) default NULL COMMENT'图片类型2',
`imgUrl2` varchar(200) default NULL COMMENT'图片地址2',
`imgName3` varchar(50) default NULL COMMENT'图片名称3',
`imgType3` char(1) default NULL COMMENT'图片类型3',
`imgUrl3` varchar(200) default NULL COMMENT'图片地址3',
`imgName4` varchar(50) default NULL COMMENT'图片名称4',
`imgType4` char(1) default NULL COMMENT'图片类型4',
`imgUrl4` varchar(200) default NULL COMMENT'图片地址4',
`imgName5` varchar(50) default NULL COMMENT'图片名称5',
`imgType5` char(1) default NULL COMMENT'图片类型5',
`imgUrl5` varchar(200) default NULL COMMENT'图片地址5',
`positionX` varchar(20) default NULL COMMENT'纬度',
`positionY` varchar(20) default NULL COMMENT'经度',
`addressName` varchar(50) default NULL COMMENT'标注名称',
`authorId` Int(11) default NULL COMMENT'发布人id',
`createTime` timestamp  NULL COMMENT'发布时间',
`auditingState` Char(1) default NULL COMMENT'审核状态',
  PRIMARY KEY  (`id`)                
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
        


/*20110515增加新闻表*/
DROP TABLE IF EXISTS `t_s_news`;                                                              
CREATE TABLE `t_s_news` (                             
`id` int(11) NOT NULL auto_increment COMMENT '主键',
`Title` varchar(200) default NULL COMMENT'标题',
`CreateTime` timestamp NULL COMMENT'发布时间',
`Source` Varchar(100) default NULL COMMENT'来源',
`Summary` varchar(500) default NULL COMMENT'摘要',
`Content` Text NULL COMMENT'正文',
`ColumnType` Char(1) default 1 COMMENT'栏目类型',
`ImgFlag` Char(1) default 1 COMMENT'精彩图文',
`Imgurl` Varchar(200) default NULL COMMENT'图文url',
`StressFlag` Char(1) default 1 COMMENT'重点新闻',
`recommendFlag` Char(1) default 1 COMMENT'是否推荐',
`ClickNum` Int(6) default 0 COMMENT'点击数',
`Creator` Varchar(11) default NULL COMMENT'创建人',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*在商铺表中增加两个字段 lgc 2011-5-17  */
ALTER TABLE `estate`.`t_s_shops` 
   ADD COLUMN `ninthFloor` DOUBLE(5,2) NULL COMMENT '9层' AFTER `Flag`, 
   ADD COLUMN `tenthFloor` DOUBLE(5,2) NULL COMMENT '10层' AFTER `ninthFloor`,
   CHANGE `eightFloor` `eightFloor` DOUBLE(5,2) NULL  COMMENT '8层', 
   CHANGE `Flag` `Flag` CHAR(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL  COMMENT '标识';
   /*在生意转让表中增加两个字段 lgc 2011-5-19  */
   ALTER TABLE `estate`.`T_P_BUSINESS` 
   ADD COLUMN `businessturnover` DOUBLE(5,2) NULL COMMENT '过去一年营业额' AFTER `scope`, 
   ADD COLUMN `businessprofits` DOUBLE(5,2) NULL COMMENT '过去一年利润' AFTER `businessturnover`,
   CHANGE `scope` `scope` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL  COMMENT '经营范围';
   ALTER TABLE `estate`.`t_p_business`  change `shares` `shares` DOUBLE(5,2) NULL  COMMENT '转让股份';
   
/*留言表 2011-05-26*/

/*0530新闻表加默认值*/
alter table `estate`.`t_s_news` change `CreateTime` `CreateTime` timestamp default current_timestamp NULL  comment '发布时间', change `ClickNum` `ClickNum` int(6) default '0' NULL  comment '点击数';

/*2011-06-04  留言、站内信*/
DROP TABLE IF EXISTS `t_s_message`;

CREATE TABLE `t_s_message` (
  `id` int(11) NOT NULL auto_increment COMMENT '主键',
  `toId` int(11) NOT NULL COMMENT '被留言人的ID',
  `toUserName` varchar(20) default NULL COMMENT '被留言人的UserName',
  `toHeadUrl` varchar(200) default NULL COMMENT '被流言人的头像',
  `fromId` int(11) NOT NULL COMMENT '留言人的ID',
  `fromUserName` varchar(20) default NULL COMMENT '留言人的UserName',
  `fromHeadUrl` varchar(200) default NULL COMMENT '留言人的头像',
  `messageTitle` varchar(200) default NULL COMMENT '留言标题',
  `messageContent` varchar(2000) default NULL COMMENT '留言内容',
  `phone` varchar(20) default NULL COMMENT '留言人电话',
  `email` varchar(40) default NULL COMMENT '留言人电子邮件',
  `replayFlag` char(1) default NULL COMMENT '是否已经回复',
  `replyContent` varchar(500) default NULL COMMENT '回复内容',
  `replayTime` timestamp NULL default NULL COMMENT '回复时间',
  `createTime` timestamp NULL default CURRENT_TIMESTAMP COMMENT '留言时间',
  `flag` char(1) default NULL COMMENT '1、留言  2、站内信',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*增加字段 zh 2011-06-04*/
ALTER TABLE `estate`.`t_m_baseinfo`     ADD COLUMN `headUrl` VARCHAR(50) NULL COMMENT '头像' AFTER `lastLoginTime`,    CHANGE `stores` `stores` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL  COMMENT '门店',     CHANGE `introduction` `introduction` VARCHAR(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL  COMMENT '自我介绍';
alter table `estate`.`t_m_baseinfo`    change `password` `password` varchar(60) character set utf8 collate utf8_general_ci NULL  comment '密码';
   /*地区表 fc 2011-06-02*/
   DROP TABLE IF EXISTS `t_s_district`;
   CREATE TABLE `t_s_district` (                                            
    `id` int(11) NOT NULL COMMENT '主键',                 
    `year_start` varchar(4) default NULL COMMENT '地区码开始年份',  
    `YEAR_END` varchar(4) default NULL COMMENT '有效截止年份',       
    `CODE` varchar(10) default NULL COMMENT 'ICD10编码',                 
    `NAME` varchar(50) default NULL COMMENT '地区名称（简写）',    
    `LONG_NAME` varchar(100) default NULL COMMENT '地区完整名称',    
    `LEVEL` varchar(1) default NULL COMMENT '地区等级',      
    `ACTIVITY` char(1) default NULL COMMENT '是否激活',          
    PRIMARY KEY  (`id`)                                                    

  ) ENGINE=InnoDB AUTO_INCREMENT=53138 DEFAULT CHARSET=utf8;



/*文件表 2011-06-05  zh*/
DROP TABLE IF EXISTS `t_s_file`;
CREATE TABLE `t_s_file` (
   `id` int(11) NOT NULL auto_increment COMMENT '主键',
   `category` char(1) default NULL COMMENT '类别',
   `fileName` varchar(200) default NULL COMMENT '文件名',
   `fileType` varchar(10) default NULL COMMENT '文件格式',
   `filePath` varchar(200) default NULL COMMENT '路径',
   `integral` int(10) default '0' COMMENT '费用',
   `vipIntegral` int(10) default '0' COMMENT 'VIP费用',
   `upLoadTime` timestamp NULL default CURRENT_TIMESTAMP COMMENT '上传时间',
   PRIMARY KEY  (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
   /* 写字楼需求表  新增字段 lgc 2011-06-05 **/
   ALTER TABLE `estate`.`t_p_officeneed`     ADD COLUMN `disname` VARCHAR(100) NULL COMMENT '地区名' AFTER `district`;
   ALTER TABLE `estate`.`t_p_office`     ADD COLUMN `discode` VARCHAR(10) NULL COMMENT '地区编码' AFTER `flag`,     ADD COLUMN `disname` VARCHAR(100) NULL COMMENT '地区名字' AFTER `discode`;
   ALTER TABLE `estate`.`t_p_estate`     ADD COLUMN `disname` VARCHAR(100) NULL COMMENT '地区名字' AFTER `district`;
    ALTER TABLE `estate`.`t_s_shops`     ADD COLUMN `disname` VARCHAR(100) NULL COMMENT '地区名字' AFTER `district`;
     ALTER TABLE `estate`.`t_p_business`     ADD COLUMN `disname` VARCHAR(100) NULL COMMENT '地区名字' AFTER `district`;
    ALTER TABLE `estate`.`t_p_industry`     ADD COLUMN `disname` VARCHAR(100) NULL COMMENT '地区名字' AFTER `district`;
     ALTER TABLE `estate`.`t_p_largepro`     ADD COLUMN `disname` VARCHAR(100) NULL COMMENT '地区' AFTER `district`;
   ALTER TABLE `estate`.`t_p_office`     ADD COLUMN `compressUrl` VARCHAR(200) NULL COMMENT '压缩url' AFTER `disname`;
   ALTER TABLE `estate`.`t_s_shops`     ADD COLUMN `compressUrl` VARCHAR(100) NULL COMMENT '压缩url' AFTER `tenthFloor`;
   ALTER TABLE `estate`.`t_p_business`     ADD COLUMN `compressUrl` VARCHAR(100) NULL COMMENT '压缩url' AFTER `auditingState`;
   ALTER TABLE `estate`.`t_p_industry`     ADD COLUMN `compressUrl` VARCHAR(100) NULL COMMENT '压缩url' AFTER `Flag`;
   ALTER TABLE `estate`.`t_p_largepro`     ADD COLUMN `compressUrl` VARCHAR(100) NULL COMMENT '压缩url' AFTER `auditingState`;
   ALTER TABLE `estate`.`t_s_shops`     ADD COLUMN `num` VARCHAR(100) NULL COMMENT '按源编号' AFTER `compressUrl`;
    /*2011-06-06*/
    alter table `estate`.`t_p_office` change `discode` `district` varchar(10) character set utf8 collate utf8_general_ci NULL  comment '地区编码';
    alter table `estate`.`t_p_business` add column `num` varchar(15) NULL COMMENT '房源编号' after `id`;
    alter table `estate`.`t_p_industry` add column `num` varchar(15) NULL COMMENT '房源编号' after `id`;
    alter table `estate`.`t_p_largepro` add column `num` varchar(15) NULL COMMENT '房源编号' after `id`;
    alter table `estate`.`t_p_officeneed` add column `num` varchar(15) NULL COMMENT '房源编号' after `id`;
    
    
    alter table `estate`.`t_p_office` add column `attentionNum` int(11) NULL COMMENT '关注数' after `compressUrl`, add column `views` int(11) NULL COMMENT '浏览数' after `attentionNum`;
     alter table `estate`.`t_p_estate` add column `createTime` timestamp NULL COMMENT '发布时间' after `authorId`, add column `auditingState` char(1) NULL COMMENT '审核状态' after `createTime`, add column `Flag` char(1) NULL COMMENT '标识:1:出租  2：出售' after `auditingState`, add column `attentionNum` int(11) NULL COMMENT '关注数' after `Flag`, add column `views` int(11) NULL COMMENT '浏览数' after `attentionNum`;
alter table `estate`.`t_p_officeneed` add column `attentionNum` int(11) NULL COMMENT '关注数' after `needType`, add column `views` int(11) NULL  COMMENT '浏览数' after `attentionNum`;
 alter table `estate`.`t_s_shops` add column `attentionNum` int(11) NULL COMMENT '关注数' after `num`, add column `views` int(11) NULL  COMMENT '浏览数' after `attentionNum`;
 alter table `estate`.`t_p_business` add column `attentionNum` int(11) NULL COMMENT '关注数' after `compressUrl`, add column `views` int(11) NULL COMMENT '浏览数' after `attentionNum`;
 alter table `estate`.`t_p_industry` add column `attentionNum` int(11) NULL COMMENT '关注数' after `compressUrl`, add column `views` int(11) NULL COMMENT '浏览数' after `attentionNum`;
 alter table `estate`.`t_p_largepro` add column `attentionNum` int(11) NULL COMMENT '关注数' after `compressUrl`, add column `views` int(11) NULL COMMENT '浏览数' after `attentionNum`;
 
 /*收藏表*/
 DROP TABLE IF EXISTS `t_p_collect`;
 CREATE TABLE `t_p_collect` (
   `id` int(11) NOT NULL auto_increment COMMENT '主键',
   `title` varchar(200) default NULL COMMENT '我的标题',
   `targetTitle` varchar(200) default NULL COMMENT '案源标题',
   `targetType` varchar(10) default NULL COMMENT '    案源类型',
   `rentOrsale` varchar(10) default NULL COMMENT '租售',
   `price` double default NULL COMMENT '租金/售价(万元)',
   `publish` varchar(10) default NULL COMMENT '发布者',
   `status` char(1) default NULL COMMENT '状态',
   `publishTime` timestamp NULL default NULL COMMENT '发布时间',
   `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP COMMENT '收藏时间',
   PRIMARY KEY  (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
 
 /* 楼盘表 */
 DROP TABLE IF EXISTS `t_p_building`;
 CREATE TABLE `t_p_building` (
   `Id` int(11) NOT NULL auto_increment COMMENT '主键',
   `num` varchar(15) default NULL COMMENT '房源编号',
   `NAME` varchar(50) default NULL COMMENT '项目名称',
   `SALES_STATUS` char(1) default NULL COMMENT '销售状态',
   `building_type` varchar(20) default NULL COMMENT '楼盘类型',
   `FEATURES` varchar(20) default NULL COMMENT '项目特色',
   `DISTRICT` varchar(10) default NULL COMMENT '所在区域',
   `ADDRESS` varchar(50) default NULL COMMENT '楼盘地址',
   `MAIN_UNIT` varchar(30) default NULL COMMENT '主力户',
   `FIT_CONDITION` varchar(100) default NULL COMMENT '装修状况',
   `BUILD_STATUS` varchar(200) default NULL COMMENT '楼盘状况',
   `OPEN_DATE` timestamp NULL default NULL COMMENT '开盘日期',
   `CHECK_DATE` timestamp NULL default NULL COMMENT '入住日期',
   `MIN_PRICE` double(8,2) default NULL COMMENT '楼盘起价',
   `AVERAGE_PRICE` double(8,2) default NULL COMMENT '楼盘均价',
   `MAX_PRICE` double(8,2) default NULL COMMENT '楼盘最高价',
   `IS_FORWARD` char(1) default NULL COMMENT '现房期房',
   `BUILDING_COUNT` int(3) default NULL COMMENT '总栋数',
   `UNIT_COUNT` int(11) default NULL COMMENT '总套数',
   `AREA` int(11) default NULL COMMENT '占地面积',
   `CONSTRUCTION_AREA` int(11) default NULL COMMENT '建筑面积',
   `GREEN_RATE` double(5,2) default NULL COMMENT '绿 化 率',
   `CAPACITY_RATE` int(1) default NULL COMMENT '容 积 率',
   `OUTTER_WALL` varchar(50) default NULL COMMENT '外 墙',
   `STRUCTURE` varchar(100) default NULL COMMENT '结 构',
   `CONTRACTORS` varchar(50) default NULL COMMENT '承 建 商',
   `ARCH_FORMS` varchar(10) default NULL COMMENT '建筑形式',
   `car_pat` int(5) default NULL COMMENT '车位',
   `propertyManagement` double(5,2) default NULL COMMENT '物 业 费',
   `propertyCompany` varchar(80) default NULL COMMENT '物业公司',
   `water_supply` varchar(30) default NULL COMMENT '供水',
   `heating_supply` varchar(50) default NULL COMMENT '供暖',
   `BUSINESS_DEVELOPMENT` varchar(80) default NULL COMMENT '开发商',
   `INVESTORS` varchar(50) default NULL COMMENT '投资商',
   `PRE_LICENSE` varchar(30) default NULL COMMENT '预售许可证',
   `PROJECT_INS` text COMMENT '项目介绍',
   `TRENDS` text COMMENT '最新动态',
   `LIFE_SUPPORT` varchar(200) default NULL COMMENT '生活配套',
   `NEIGHBORHOODS` varchar(200) default NULL COMMENT '小区配套',
   `TRAFFIC` varchar(200) default NULL COMMENT '交通状况',
   `OTHER` varchar(200) default NULL COMMENT '其他',
   `positionX` varchar(20) default NULL COMMENT '纬度',
   `positionY` varchar(20) default NULL COMMENT '经度',
   `addressName` varchar(50) default NULL COMMENT '标注名称',
   `authorId` int(11) default NULL COMMENT '发布人id',
   `compressUrl` varchar(200) default NULL COMMENT '压缩图片',
   `attentionNum` int(11) default NULL COMMENT '关注数',
   `views` int(11) default NULL COMMENT '浏览数',
   PRIMARY KEY  (`Id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
 /*楼盘图像表*/
DROP TABLE IF EXISTS `t_p_image`;
CREATE TABLE `t_p_image` (
   `Id` int(11) NOT NULL auto_increment COMMENT '主键',
   `PID` int(11) default NULL COMMENT '项目id',
   `IMG_NAME` varchar(30) default NULL COMMENT '图片名称',
   `IMG_URL` varchar(300) default NULL COMMENT '图片路径',
   `CATEGORY` char(1) default NULL COMMENT '图片种类',
   `IMG_TYPE` char(1) default NULL COMMENT '类型',
   `DESR` varchar(100) default NULL COMMENT '图片说明',
   PRIMARY KEY  (`Id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
 
 
 DROP TABLE IF EXISTS `t_m_proinfo`;
 CREATE TABLE `t_m_proinfo` (                                                              
               `id` int(11) NOT NULL auto_increment,                                                   
               `authorId` int(11) default NULL,                                                        
               `proId` int(11) default NULL,                                                           
               `proType` char(1) default NULL,                                                         
               `operateType` char(1) default NULL,                                                     
               `remark` varchar(100) default NULL,                                                     
               `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,  
               PRIMARY KEY  (`id`)                                                                     
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;
  alter table `estate`.`t_p_building` add column `createTime` timestamp NULL COMMENT '创建日期' after `authorId`,change `OPEN_DATE` `OPEN_DATE` timestamp NULL  comment '开盘日期';
  alter table `estate`.`t_p_building` add column `DISNAME` varchar(30) NULL COMMENT '区域名称' after `DISTRICT`;
    
  alter table `estate`.`t_p_building` add column `showingsnum` int(11) NULL COMMENT '看房人' after `views`;
  
 DROP TABLE IF EXISTS `t_p_showings`;
CREATE TABLE `t_p_showings` (                                                                                 
                `id` int(11) NOT NULL auto_increment,                                                                       
                `pid` int(11) NOT NULL COMMENT '项目id',                                                                  
                `pname` varchar(50) default NULL COMMENT '项目名',                                                       
                `ptype` char(1) default NULL COMMENT '案源类型',                                                        
                `participantsid` int(11) default NULL COMMENT '参与者id',                                                
                `name` varchar(12) default NULL COMMENT '参加者姓名',                                                  
                `sex` char(1) default NULL COMMENT '0男1女',                                                              
                `tel` varchar(15) default NULL COMMENT '手机号码',                                                      
                `email` varchar(50) default NULL COMMENT '邮箱',                                                          
                `in_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '参与时间',  
                `state` char(1) default NULL COMMENT '0取消1正常',                                                      
                PRIMARY KEY  (`id`)                                                                                         
              ) ENGINE=InnoDB DEFAULT CHARSET=utf8 ;                                                                      

alter table `estate`.`t_p_image` add column `PROTYPE` char(1) NULL COMMENT '项目类型' after `DESR`;

 DROP TABLE IF EXISTS `t_p_second_buliding`;
CREATE TABLE `t_p_second_buliding` (                                          
   `id` int(11) NOT NULL auto_increment COMMENT '主键',                      
   `num` varchar(15) default NULL COMMENT '案源编码',                      
   `district` varchar(10) default NULL COMMENT '地区编码',                 
   `disname` varchar(30) default NULL COMMENT '地区名',                     
   `address` varchar(50) default NULL COMMENT '地址',                        
   `title` varchar(50) default NULL COMMENT '标题',                          
   `tip` char(1) default NULL COMMENT '精、急',                             
   `respDistrict` varchar(50) default NULL COMMENT '所属小区',             
   `price` double(5,2) default NULL COMMENT '售价',                          
   `unitPrice` double(5,2) default NULL COMMENT '单价',                      
   `home` char(1) default NULL COMMENT '房型-居',                           
   `hall` char(1) default NULL COMMENT '房型-厅',                           
   `bathroom` char(1) default NULL COMMENT '房型-卫',                       
   `consArea` int(4) default NULL COMMENT '建筑面积',                      
   `toward` varchar(20) default NULL COMMENT '朝向',                         
   `floor` int(2) default NULL COMMENT '房源楼层',                         
   `floorCount` int(2) default NULL COMMENT '共几层',                       
   `createTime` varchar(4) default NULL COMMENT '建筑年代',                
   `age` int(3) default NULL COMMENT '房龄',                                 
   `fitCondition` char(1) default NULL COMMENT '装修状况',                 
   `furniture` varchar(50) default NULL COMMENT '家具',                      
   `introduction` varchar(10000) default NULL COMMENT '介绍',                
   `phone` varchar(30) default NULL COMMENT '咨询电话',                    
   `authorId` int(11) default NULL COMMENT '发布人id,t_m_member表主键',  
   `flag` char(1) default NULL COMMENT '1:出租 2：出售',                  
   `compressUrl` varchar(200) default NULL COMMENT '压缩图片',             
   `attentionNum` int(5) default NULL COMMENT '关注数',                     
   `views` int(5) default NULL COMMENT '浏览数',                            
   `addressName` varchar(50) default NULL COMMENT '标注名称',              
   `positionX` varchar(20) default NULL COMMENT '纬度',                      
   `positionY` varchar(20) default NULL COMMENT '经度',                      
   `auditingState` char(1) default NULL COMMENT '审核状态',                
   `recommendedWeight` varchar(10) default NULL COMMENT '推荐权重',        
   PRIMARY KEY  (`id`)                                                         
 ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
 alter table `estate`.`t_p_second_buliding` add column `bulidNo` varchar(3) NULL COMMENT '号/栋' after `respDistrict`, add column `room` varchar(5) NULL COMMENT '室' after `bulidNo`,change `disname` `disname` varchar(30) character set utf8 collate utf8_general_ci NULL  comment '地区名';
 alter table `estate`.`t_p_image` change `IMG_NAME` `IMG_NAME` varchar(100) character set utf8 collate utf8_general_ci NULL  comment '图片名称';
 alter table `estate`.`t_p_second_buliding` add column `useType` char(1) NULL COMMENT '用途' after `title`, add column `createDate` timestamp NULL COMMENT '创建日期' after `recommendedWeight`,change `title` `title` varchar(50) character set utf8 collate utf8_general_ci NULL  comment '标题';
 alter table `estate`.`t_m_baseinfo` add column `createTime` timestamp NULL COMMENT '注册时间' after `headUrl`;
 alter table `estate`.`t_p_second_buliding` add column `sourceUrl` varchar(200) NULL COMMENT '原图地址' after `flag`;
 alter table `estate`.`t_p_second_buliding` add column `updateDate` timestamp NULL COMMENT '更新日期' after `createDate`, add column `slogan` varchar(100) NULL COMMENT '标语' after `updateDate`;
  DROP TABLE IF EXISTS `t_p_specials`;
CREATE TABLE `t_p_specials` (                                        
	`id` int(11) NOT NULL auto_increment COMMENT '主键',             
	`descr` varchar(200) default NULL COMMENT '信息简述',          
	`startTime` timestamp NULL default NULL COMMENT '开始时间',    
	`endTime` timestamp NULL default NULL COMMENT '结束时间',      
	`specialsMes` varchar(30) default NULL COMMENT '优惠信息',     
	`line` varchar(50) default NULL COMMENT '专线',                  
	`imgOne` varchar(100) default NULL COMMENT '图片1',              
	`imgTwo` varchar(100) default NULL COMMENT '图片2',              
	`imgThree` varchar(100) default NULL COMMENT '图片3',            
	`imgFour` varchar(100) default NULL COMMENT '图片4',             
	`bulidDesc` varchar(200) default NULL COMMENT '楼盘简述',      
	`avgPrice` double(5,2) default NULL COMMENT '市场参考均价',  
	`minPrice` double(5,2) default NULL COMMENT '折后参考起价',  
	`specials` varchar(50) default NULL COMMENT '享受折扣',        
	`information` text COMMENT '团购、特价详细信息',          
	`flag` char(1) default NULL COMMENT '标识',                      
    PRIMARY KEY  (`id`)                                                
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
  DROP TABLE IF EXISTS `t_p_spe_activity`;
  CREATE TABLE `t_p_spe_activity` (                                                                          
    `id` int(11) NOT NULL auto_increment COMMENT '主键',                                                   
    `title` varchar(50) default NULL COMMENT '信息标题',                                                 
    `content` varchar(1000) default NULL COMMENT '内容',                                                   
    `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '时间',  
    `pid` int(11) default NULL COMMENT '活动id',                                                           
    `flag` char(1) default NULL COMMENT '活动类型',                                                      
    PRIMARY KEY  (`id`)                                                                                      
  ) ENGINE=InnoDB DEFAULT CHARSET=utf8;
   DROP TABLE IF EXISTS `t_p_spe_person`;
  CREATE TABLE `t_p_spe_person` (                                                                                
  `id` int(11) NOT NULL auto_increment COMMENT '主键',                                                       
  `mobile` varchar(15) default NULL COMMENT '手机号码',                                                    
  `tel` varchar(20) default NULL COMMENT '联系电话',                                                       
  `name` varchar(30) default NULL COMMENT '姓名',                                                            
  `sex` char(1) default NULL COMMENT '性别',                                                                 
  `type` char(1) default NULL COMMENT '下定标识',                                                          
  `joinTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP COMMENT '参加时间',  
  `confirmTime` timestamp NOT NULL default '0000-00-00 00:00:00' COMMENT '下定时间',                       
  `pid` int(11) default NULL COMMENT '活动id',                                                               
  `flag` char(1) default NULL COMMENT '活动类型',                                                          
  PRIMARY KEY  (`id`)                                                                                          
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
alter table `estate`.`t_p_specials` add column `bulidingId` int NULL COMMENT '楼盘ID' after `flag`;
alter table `estate`.`t_p_specials` add column `joinCount` int(3) NULL COMMENT '参加人数' after `line`;
alter table `estate`.`t_p_specials` change `avgPrice` `avgPrice` double(7,2) NULL  comment '市场参考均价', change `minPrice` `minPrice` double(7,2) NULL  comment '折后参考起价';
alter table `estate`.`t_p_building` add column `auditingState` char(1) NULL COMMENT '审核状态' after `showingsnum`;

  DROP TABLE IF EXISTS `t_p_suggestion`;
create table `estate`.`t_p_suggestion`( 
`id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键', 
`title` varchar(200) COMMENT '主题', 
`userName` varchar(50) COMMENT '用户名',
 `tel` varchar(20) COMMENT '号码', 
`email` varchar(50) COMMENT '邮箱', `comObject` varchar(50) COMMENT '投诉对象', 
`userfrom` varchar(50) COMMENT '用户所在地', `content` varchar(2000) COMMENT '投诉内容', 
`createtime` datetime COMMENT '投诉时间', `state` char(1) COMMENT '处理状态：0未处理1处理中2处理完毕', 
`completionTime` datetime COMMENT '处理时间', 
`Handler` varchar(50) COMMENT '处理者', 
`results` varchar(2000) COMMENT '处理结果', 
PRIMARY KEY (`id`))  ;

/*Table structure for table `t_p_need` */

DROP TABLE IF EXISTS `t_p_need`;

CREATE TABLE `t_p_need` (
   `id` int(11) NOT NULL auto_increment COMMENT '主键',
   `city` varchar(100) default NULL COMMENT '置业城市 ',
   `preference` varchar(100) default NULL COMMENT '物业类型   ',
   `purpose` varchar(100) default NULL COMMENT '置业目的  ',
   `needRoom` varchar(20) default NULL COMMENT '置业户型 ',
   `area` varchar(20) default NULL COMMENT '置业面积',
   `totalPrice` varchar(20) default NULL COMMENT '预算单价',
   `name` varchar(20) default NULL COMMENT '真实姓名',
   `phone` varchar(20) default NULL COMMENT '手机号码',
   `sex` char(1) default NULL COMMENT '性别 1 先生 2女士',
   `otherDemand` varchar(2000) default NULL COMMENT '特殊需求',
   PRIMARY KEY  (`id`)
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

 alter table `estate`.`t_m_baseinfo` add column `sex` char(1) NULL COMMENT '性别' after `realName`;
 alter table `estate`.`t_p_specials` add column `createTime` timestamp DEFAULT CURRENT_TIMESTAMP NULL after `bulidingId`;
 alter table `estate`.`t_m_baseinfo` add column  `totalIntegral` int(11) NULL COMMENT '总积分' after `integral`,change `integral` `integral` int(11) NULL  comment '当前积分';
 alter table `estate`.`t_m_baseinfo` add column `honorType` char(1) NULL COMMENT '头衔类型' after `totalIntegral`;
 alter table `estate`.`t_m_baseinfo` change `honorType` `honorType` char(1) character set utf8 collate utf8_general_ci default '1' NULL  comment '头衔类型';
 alter table `estate`.`t_m_baseinfo` 
   change `integral` `integral` int(11) default '1' NULL  comment '当前积分', 
   change `totalIntegral` `totalIntegral` int(11) default '1' NULL  comment '总积分', 
   change `level` `level` int(2) default '1' NULL  comment '等级';


ALTER TABLE `estate`.`t_p_building`     CHANGE `ADDRESS` `ADDRESS` VARCHAR(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL  COMMENT '楼盘地址';
ALTER TABLE `estate`.`t_p_industry`     CHANGE `content` `content` TEXT NULL  COMMENT '案源描述';
ALTER TABLE `estate`.`t_p_building`     CHANGE `BUILDING_COUNT` `BUILDING_COUNT` INT(11) NULL  COMMENT '总栋数';
ALTER TABLE `estate`.`t_p_building`     CHANGE `propertyManagement` `propertyManagement` DOUBLE(8,2) NULL  COMMENT '物 业 费';
ALTER TABLE `estate`.`t_p_office`     CHANGE `content` `content` TEXT NULL  COMMENT '案源描述';
ALTER TABLE `estate`.`t_s_shops`     CHANGE `content` `content` TEXT NULL  COMMENT '案源描述';
ALTER TABLE `estate`.`t_p_officeneed`     CHANGE `descr` `descr` TEXT NULL  COMMENT '需求描述';
ALTER TABLE `estate`.`t_p_largepro`     CHANGE `content` `content` TEXT NULL  COMMENT '案源描述';
UPDATE t_m_baseinfo t SET t.level=1 WHERE t.level IS NULL;
UPDATE t_m_baseinfo t SET t.honorType=1 WHERE t.honorType IS NULL;
UPDATE t_m_baseinfo t SET t.totalIntegral=10 WHERE t.totalIntegral IS NULL;

DROP TABLE IF EXISTS `t_s_announcement`;
CREATE TABLE `t_s_announcement` (                                                         
    `id` int(11) NOT NULL auto_increment,                                                   
    `title` varchar(50) default NULL,                                                       
    `content` text,                                                                         
    `createTime` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,  
    `invalidTime` timestamp NULL default NULL,                                              
    PRIMARY KEY  (`id`)                                                                     
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
alter table `estate`.`t_p_office` add column `floorCategory` char(1) NULL COMMENT '楼层类型' after `views`, add column `subFloor` int(3) NULL COMMENT '所在层1' after `floorCategory`, add column `floor2` int(3) NULL COMMENT '所在层2' after `subFloor`, add column `totalFloor` int(3) NULL COMMENT '楼盘总层数' after `floor2`, add column `areauseful` double(10,2) NULL COMMENT '使用面积' after `totalFloor`, add column `consYear` varchar(4) NULL COMMENT '建筑年代' after `areauseful`, add column `mright` char(1) NULL COMMENT '权属' after `consYear`, add column `fitment` char(1) NULL COMMENT '装修程度' after `mright`, add column `forward` varchar(2) NULL COMMENT '朝向' after `fitment`, add column `cbd` varchar(20) NULL COMMENT '所属商圈' after `forward`,change `propertyManagement` `propertyManagement` double(10,2) NULL  comment '物业管理费', change `area` `area` double(10,2) NULL  comment '建筑面积';
 alter table `estate`.`t_p_office` add column `rentType` char(1) NULL COMMENT '租赁方式' after `cbd`, add column `enterDate` timestamp NULL COMMENT '可入住时间' after `rentType`, add column `officeCost` char(1) NULL COMMENT '是否包含物业费' after `enterDate`;
 alter table `estate`.`t_p_office` add column `baseService` varchar(2) NULL COMMENT '基础设施' after `officeCost`, add column `equipment` varchar(2) NULL COMMENT '房屋设备' after `baseService`, add column `traffic` varchar(100) NULL COMMENT '交通线路' after `equipment`;
 alter table `estate`.`t_p_office` add column `payInfo` char(1) NULL COMMENT '支付方式' after `traffic`;
 alter table `estate`.`t_p_office` change `baseService` `baseService` varchar(50) character set utf8 collate utf8_general_ci NULL  comment '基础设施', change `equipment` `equipment` varchar(50) character set utf8 collate utf8_general_ci NULL  comment '房屋设备';
 
 /*sff修改楼盘价格类型为int型 */
 alter table `estate`.`t_p_building` change `MIN_PRICE` `MIN_PRICE` int(11) NULL  comment '楼盘起价', change `AVERAGE_PRICE` `AVERAGE_PRICE` int(11) NULL  comment '楼盘均价', change `MAX_PRICE` `MAX_PRICE` int(11) NULL  comment '楼盘最高价', change `AREA` `AREA` int(11) NULL  comment '占地面积';
alter table `estate`.`t_s_shops` drop column `eightFloor`, drop column `sevenFloor`, drop column `sixFloor`, drop column `fifthFloor`, drop column `fourceFloor`, drop column `thirdFloor`, drop column `secondFloor`, drop column `firstFloor`, drop column `ugTwoFloor`, drop column `ugOneFloor`,
   add column `name` varchar(100) NULL COMMENT '名称' after `views`, 
   add column `area` double(10,2) NULL COMMENT '建筑面积' after `NAME`, 
   add column `areauseful` double(10,2) NULL COMMENT '使用面积' after `area`, 
   add column `floorCategory` char(1) NULL COMMENT '楼层类型' after `areauseful`, 
   add column `subFloor` int(3) NULL COMMENT '所在层1' after `floorCategory`, 
   add column `floor2` int(3) NULL COMMENT '所在层2' after `subFloor`, 
   add column `totalFloor` int(3) NULL COMMENT '楼盘总层数' after `floor2`, 
   add column `mright` char(1) NULL COMMENT '权属' after `totalFloor`, 
   add column `fitment` char(1) NULL COMMENT '装修程度' after `mright`, 
   add column `forward` varchar(2) NULL COMMENT '朝     向' after `fitment`, 
   add column `cbd` varchar(20) NULL COMMENT '所属商圈' after `forward`, 
   /* add column `consYear` varchar(4) NULL COMMENT '建筑年代' after `cbd`, */ 
   add column `category` varchar(2) NULL COMMENT '商铺类型' after `consYear`, 
   add column `baseService` varchar(50) NULL COMMENT '基础设施' after `category`, 
   add column `equipment` varchar(50) NULL COMMENT '房屋设备' after `baseService`, 
   add column `traffic` varchar(100) NULL COMMENT '交通线路' after `equipment`;
   alter table `estate`.`t_s_shops` drop column `ninthFloor`, drop column `tenthFloor`;
   alter table `estate`.`t_s_shops` 
   add column `rentType` char(1) NULL COMMENT '租赁方式' after `name`, 
   add column `officeCost` char(1) NULL COMMENT '是否包含物业费' after `rentType`, 
   add column `payInfo` char(1) NULL COMMENT '租赁支付方式' after `officeCost`;
   alter table `estate`.`t_p_officeneed` 
   add column `userName` varchar(20) NULL COMMENT '联系人' after `views`, 
   add column `phone` varchar(20) NULL COMMENT '联系电话' after `userName`, 
   add column `consYear` varchar(4) NULL COMMENT '建筑年代' after `phone`;
   
   /**lgc 住宅新增字段**/
 ALTER TABLE `estate`.`t_p_building`     CHANGE `AREA` `AREA` DOUBLE(8,2) NULL  COMMENT '占地面积',     CHANGE `CONSTRUCTION_AREA` `CONSTRUCTION_AREA` DOUBLE(8,2) NULL  COMMENT '建筑面积';
ALTER TABLE `estate`.`t_p_second_buliding`     ADD COLUMN `name` VARCHAR(50) NULL COMMENT '名称' AFTER `address`,     ADD COLUMN `chu` CHAR(1) NULL COMMENT '房型-厨' AFTER `bathroom`,     ADD COLUMN `yangTai` CHAR(1) NULL COMMENT '房型-阳台' AFTER `chu`,     ADD COLUMN `userArea` DOUBLE(8,2) NULL COMMENT '使用面积' AFTER `yangTai`,    CHANGE `address` `address` VARCHAR(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL  COMMENT '地址',     CHANGE `consArea` `consArea` DOUBLE(8,2) NULL  COMMENT '建筑面积';
ALTER TABLE `estate`.`t_p_second_buliding`     ADD COLUMN `nature` CHAR(1) NULL COMMENT '产权性质' AFTER `tip`;
   alter table `estate`.`t_p_officeneed` 
   add column `rentType` char(1) NULL COMMENT '租赁方式' after `consYear`;
   alter table `estate`.`t_p_largepro` 
   add column `area` double(5,2) NULL after `views`, 
   add column `areauseful` double(5,2) NULL after `area`;
   alter table `estate`.`t_p_largepro` 
   add column `nearAddress` varchar(100) NULL after `areauseful`;
   alter table `estate`.`t_p_largepro` 
   add column `flag` char(1) NULL COMMENT '交易类型' after `nearAddress`;
   alter table `estate`.`t_p_largepro` drop column `payWay`;
   /**alter table `estate`.`t_s_shops` change `buildingYear` `consYear` varchar(4) character set utf8 collate utf8_general_ci NULL  comment '建筑年代';**/
   alter table `estate`.`t_p_business` 
   change `area` `area` double(8,2) NULL  comment '物业面积', 
   change `price` `price` double(8,2) NULL  comment '转让价格', 
   change `propertyRent` `propertyRent` double(8,2) NULL  comment '物业状况:租金', 
   change `capital` `capital` double(8,2) NULL  comment '注册资金', 
   change `businessprofits` `businessprofits` double(8,2) NULL  comment '过去一年利润', 
   change `businessTax` `businessTax` double(8,2) NULL  comment '过去一年营业税', 
   change `incomeTax` `incomeTax` double(8,2) NULL  comment '过去一年所得税', 
   change `consumer` `consumer` double(8,2) NULL  comment '人均消费', 
   change `shares` `shares` double(8,2) NULL  comment '转让股份';
   alter table `estate`.`t_s_shops` 
   change `propertyManagement` `propertyManagement` double(8,2) NULL  comment '物业管理费', 
   change `bursary` `bursary` double(8,2) NULL  comment '年租金/出售总价', 
   change `area` `area` double(12,2) NULL  comment '建筑面积', 
   change `areauseful` `areauseful` double(12,2) NULL  comment '使用面积';
   alter table `estate`.`t_p_officeneed` 
   change `minArea` `minArea` double(8,2) NULL  comment '建筑面积(最小)', 
   change `maxArea` `maxArea` double(8,2) NULL  comment '建筑面积(最大)', 
   change `minPrice` `minPrice` double(8,2) NULL  comment '最少租金', 
   change `maxPrice` `maxPrice` double(8,2) NULL  comment '最大租金';
   alter table `estate`.`t_p_officeneed` 
   add column `consYearEnd` varchar(4) NULL after `consYearStart`,
   change `consYear` `consYearStart` varchar(4) character set utf8 collate utf8_general_ci NULL  comment '建筑年代';
    ALTER TABLE `estate`.`t_p_officeneed`     CHANGE `minArea` `minArea` DOUBLE(8,2) NULL  COMMENT '建筑面积(最小)',     CHANGE `maxArea` `maxArea` DOUBLE(8,2) NULL  COMMENT '建筑面积(最大)',     CHANGE `minPrice` `minPrice` DOUBLE(8,2) NULL  COMMENT '最少租金',     CHANGE `maxPrice` `maxPrice` DOUBLE(8,2) NULL ;
    alter table `estate`.`t_p_second_buliding` 
   change `price` `price` double(8,2) NULL  comment '售价', 
   change `unitPrice` `unitPrice` double(8,2) NULL  comment '单价';
ALTER TABLE `estate`.`t_d_data` CHANGE COLUMN `minvalue` `min_value` VARCHAR(10) NULL DEFAULT NULL COMMENT '最小值'  , CHANGE COLUMN `maxvalue` `max_value` VARCHAR(10) NULL DEFAULT NULL COMMENT '最大值'  ;
ALTER TABLE `estate`.`t_d_defination` CHANGE COLUMN `code` `code` VARCHAR(64) NULL DEFAULT NULL COMMENT '编码'  ;
alter table `estate`.`t_p_office` add column `auditingRemark` varchar(2000) NULL COMMENT '审核意见' after `payInfo`;
alter table `estate`.`t_p_office` 
   add column `auditingUser` int(11) NULL COMMENT '审核人' after `auditingRemark`, 
   add column `auditingTime` timestamp NULL COMMENT '审核时间' after `auditingUser`;
   alter table `estate`.`t_s_shops` add column `auditingRemark` varchar(2000) NULL COMMENT '审核意见' after `payInfo`;
alter table `estate`.`t_s_shops` 
   add column `auditingUser` int(11) NULL COMMENT '审核人' after `auditingRemark`, 
   add column `auditingTime` timestamp NULL COMMENT '审核时间' after `auditingUser`;