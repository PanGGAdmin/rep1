/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.5.28-enterprise-commercial-advanced-log : Database - navigator
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`navigator` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `navigator`;

/*Table structure for table `accsubjects` */

DROP TABLE IF EXISTS `accsubjects`;

CREATE TABLE `accsubjects` (
  `AccsubjectID` varchar(20) NOT NULL,
  `AccsubjectName` varchar(50) NOT NULL,
  PRIMARY KEY (`AccsubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `accsubjects` */

insert  into `accsubjects`(`AccsubjectID`,`AccsubjectName`) values ('1001','现金'),('1002','银行存款'),('1003','原材料'),('1004','包装物'),('1005','营业费用'),('1006','发出商品'),('1007','其他业务支出'),('1008','其他业务收入'),('1009','主营业务收入'),('1010','主营业务成本'),('1011','库存商品');

/*Table structure for table `checkdetailed` */

DROP TABLE IF EXISTS `checkdetailed`;

CREATE TABLE `checkdetailed` (
  `clId` varchar(15) NOT NULL COMMENT '单据编号',
  `columnId` int(11) NOT NULL COMMENT '栏号',
  `materielId` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `zhangmianCount` double(18,2) DEFAULT NULL COMMENT '账面数量',
  `pandianCount` double(18,2) DEFAULT NULL COMMENT '盘点数量',
  `price` double(18,6) DEFAULT NULL COMMENT '单价',
  `yingkuiPrice` double(18,6) DEFAULT NULL COMMENT '盈亏金额',
  `cause` varchar(100) DEFAULT NULL COMMENT '原因',
  PRIMARY KEY (`clId`,`columnId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `checkdetailed` */

insert  into `checkdetailed`(`clId`,`columnId`,`materielId`,`zhangmianCount`,`pandianCount`,`price`,`yingkuiPrice`,`cause`) values ('20180102001',1,'2',40.00,41.00,50.000000,-50.000000,'啦啦啦'),('20180103001',1,'1',50.00,49.00,40.000000,40.000000,'哈哈哈');

/*Table structure for table `checklist` */

DROP TABLE IF EXISTS `checklist`;

CREATE TABLE `checklist` (
  `clId` varchar(20) NOT NULL COMMENT '编号Id',
  `cldate` datetime DEFAULT NULL COMMENT '单据日期',
  `warehouseId` int(11) DEFAULT NULL COMMENT '仓库编号',
  `pandianuserId` int(11) DEFAULT NULL COMMENT '盘点人Id',
  `departmentId` int(11) DEFAULT NULL COMMENT '部门id',
  `zhidanuserId` int(11) DEFAULT NULL COMMENT '制单人员',
  `fuheuserId` int(11) DEFAULT NULL COMMENT '复核人员',
  PRIMARY KEY (`clId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `checklist` */

insert  into `checklist`(`clId`,`cldate`,`warehouseId`,`pandianuserId`,`departmentId`,`zhidanuserId`,`fuheuserId`) values ('20180102001','2018-01-02 05:00:00',1,1,1,1,1),('20180103001','2018-01-03 00:00:00',2,2,2,2,2);

/*Table structure for table `custclass` */

DROP TABLE IF EXISTS `custclass`;

CREATE TABLE `custclass` (
  `classID` varchar(11) NOT NULL COMMENT '类别编号',
  `className` varchar(20) NOT NULL COMMENT '类别名称',
  `engName` varchar(20) DEFAULT NULL COMMENT '英文名称',
  `memo` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`classID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `custclass` */

insert  into `custclass`(`classID`,`className`,`engName`,`memo`) values ('1','大客户','engName','memo'),('2','中客户','engName','memo'),('3','大客户','engName','memo');

/*Table structure for table `customeraccounts` */

DROP TABLE IF EXISTS `customeraccounts`;

CREATE TABLE `customeraccounts` (
  `custId` int(11) DEFAULT NULL COMMENT '客户ID（外键，主键客户表）',
  `serNo` int(11) NOT NULL COMMENT '主键',
  `billType` varchar(50) DEFAULT NULL COMMENT '来源单别',
  `billNo` varchar(50) DEFAULT NULL COMMENT '来源单号',
  `totalMoney` double DEFAULT NULL COMMENT '原单金额',
  `blance` double DEFAULT NULL COMMENT '现行余额',
  PRIMARY KEY (`serNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `customeraccounts` */

/*Table structure for table `department` */

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `DepartID` int(11) NOT NULL COMMENT '部门编号',
  `DepartName` varchar(25) NOT NULL COMMENT '部门名称',
  `EngName` varchar(50) NOT NULL COMMENT '英文名称',
  `Memo` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`DepartID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `department` */

insert  into `department`(`DepartID`,`DepartName`,`EngName`,`Memo`) values (1,'采购部','CGB',''),(2,'销售部','XSB',''),(3,'财务部','CWB',''),(4,'储运部','CYB',''),(5,'研发部','YFB',''),(6,'生产部','SCB',''),(7,'直销部','ZXB',''),(8,'综合管理部','ZHGLB',''),(9,'服务中心','FWZX','');

/*Table structure for table `dropout` */

DROP TABLE IF EXISTS `dropout`;

CREATE TABLE `dropout` (
  `Id` int(11) NOT NULL,
  `DiaoChuCangku` varchar(50) DEFAULT NULL,
  `DiaoRuCangKu` varchar(50) DEFAULT NULL,
  `DanJvRiQi` datetime DEFAULT NULL,
  `DanJvHaoMan` varchar(50) DEFAULT NULL,
  `ZhiDanRenYuan` varchar(50) DEFAULT NULL,
  `FuHeRenYuan` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dropout` */

insert  into `dropout`(`Id`,`DiaoChuCangku`,`DiaoRuCangKu`,`DanJvRiQi`,`DanJvHaoMan`,`ZhiDanRenYuan`,`FuHeRenYuan`) values (0,'原料仓','成品仓','2018-05-05 00:00:00','20180505001','admin','admin'),(2,'原料仓','成品仓','2018-05-05 00:00:00','20180505002','admin','admin');

/*Table structure for table `dropouts` */

DROP TABLE IF EXISTS `dropouts`;

CREATE TABLE `dropouts` (
  `Id` int(11) NOT NULL,
  `Did` varchar(50) DEFAULT NULL,
  `Bid` varchar(50) DEFAULT NULL,
  `ShuLiang` varchar(50) DEFAULT NULL,
  `BeiZhu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dropouts` */

insert  into `dropouts`(`Id`,`Did`,`Bid`,`ShuLiang`,`BeiZhu`) values (1,'1','1','1','BeiZhu'),(2,'2','2','2','BeiZhu');

/*Table structure for table `dsacceptexpect` */

DROP TABLE IF EXISTS `dsacceptexpect`;

CREATE TABLE `dsacceptexpect` (
  `funBillNo` varchar(20) DEFAULT NULL COMMENT '单据号码（外键，主键应收冲款单）',
  `serNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '单据行号',
  `billType` varchar(20) DEFAULT NULL COMMENT '来源单别',
  `billNo` varchar(20) DEFAULT NULL COMMENT '来源单号',
  `originNO` varchar(20) DEFAULT NULL COMMENT '原预收款单号',
  `prepayLeft` double DEFAULT NULL COMMENT '预收余额',
  `localMoeny` double DEFAULT NULL COMMENT '取用预收金额',
  PRIMARY KEY (`serNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `dsacceptexpect` */

insert  into `dsacceptexpect`(`funBillNo`,`serNo`,`billType`,`billNo`,`originNO`,`prepayLeft`,`localMoeny`) values ('2017021201',2,'销售出库','2017021201','2017021201',58500,58500);

/*Table structure for table `dsassignbuymain` */

DROP TABLE IF EXISTS `dsassignbuymain`;

CREATE TABLE `dsassignbuymain` (
  `BillNO` varchar(20) NOT NULL,
  `BillDate` date NOT NULL,
  `AssignStyle` varchar(50) NOT NULL,
  `VoucherNo` varchar(50) DEFAULT NULL,
  `MLAmount` decimal(10,2) DEFAULT NULL,
  `MakerID` varchar(20) DEFAULT NULL,
  `Maker` varchar(50) DEFAULT NULL,
  `PermitterID` varchar(20) DEFAULT NULL,
  `Permitter` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`BillNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dsassignbuymain` */

insert  into `dsassignbuymain`(`BillNO`,`BillDate`,`AssignStyle`,`VoucherNo`,`MLAmount`,`MakerID`,`Maker`,`PermitterID`,`Permitter`) values ('20180520001','2018-05-20','按金额',NULL,'300.00','1001','admin',NULL,NULL);

/*Table structure for table `dsassignbuysub` */

DROP TABLE IF EXISTS `dsassignbuysub`;

CREATE TABLE `dsassignbuysub` (
  `SerNo` int(11) NOT NULL,
  `FromNO` varchar(20) NOT NULL,
  `ProdID` varchar(20) NOT NULL,
  `ProdName` varchar(50) NOT NULL,
  `ProdSize` varchar(50) DEFAULT NULL,
  `VAmount` decimal(10,2) NOT NULL,
  `VQuantity` int(11) NOT NULL,
  `SUnit` varchar(50) NOT NULL,
  `MLAmount` decimal(10,2) DEFAULT NULL,
  `BillNO` varchar(20) NOT NULL,
  PRIMARY KEY (`SerNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dsassignbuysub` */

insert  into `dsassignbuysub`(`SerNo`,`FromNO`,`ProdID`,`ProdName`,`ProdSize`,`VAmount`,`VQuantity`,`SUnit`,`MLAmount`,`BillNO`) values (1,'20180520001','1001','雷蛇鼠标',NULL,'5000.00',10,'PLS','300.00','20180520001');

/*Table structure for table `dsassignfee` */

DROP TABLE IF EXISTS `dsassignfee`;

CREATE TABLE `dsassignfee` (
  `SerNo` int(11) NOT NULL,
  `BillNO` varchar(20) NOT NULL,
  `FareClassID` varchar(20) NOT NULL,
  `FareClassName` varchar(50) NOT NULL,
  `CurrID` varchar(50) NOT NULL,
  `ExchRate` decimal(10,4) NOT NULL,
  `Amount` decimal(10,2) NOT NULL,
  `MLAmount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`SerNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dsassignfee` */

insert  into `dsassignfee`(`SerNo`,`BillNO`,`FareClassID`,`FareClassName`,`CurrID`,`ExchRate`,`Amount`,`MLAmount`) values (1,'20180520001','01','主营业务收入','人民币','1.0000','200.00','200.00'),(2,'20180520001','02','其他业务收入','人民币','1.0000','100.00','100.00');

/*Table structure for table `dsdssalemain` */

DROP TABLE IF EXISTS `dsdssalemain`;

CREATE TABLE `dsdssalemain` (
  `billNo` varchar(20) NOT NULL COMMENT '单据号码',
  `billDate` date DEFAULT NULL COMMENT '单据日期',
  `custId` int(11) DEFAULT NULL COMMENT '客户id（外键，主键客户表）',
  `custShortName` varchar(50) DEFAULT NULL COMMENT '客户简称',
  `custAddress` varchar(250) DEFAULT NULL COMMENT '送货地址',
  `saleClassName` varchar(50) DEFAULT NULL COMMENT '销售出库类型名称',
  `currencyName` varchar(20) DEFAULT NULL COMMENT '币别',
  `exchRete` decimal(10,0) DEFAULT NULL COMMENT '汇率',
  `priceofTax` varchar(10) DEFAULT NULL COMMENT '单价是否含税',
  `wareId` int(11) DEFAULT NULL COMMENT '仓库id（外键，主键仓库表）',
  `wareName` varchar(50) DEFAULT NULL COMMENT '仓库名称',
  `salesID` int(11) DEFAULT NULL COMMENT '业务人员id（外键，主键人员表）',
  `salesName` varchar(50) DEFAULT NULL COMMENT '业务人员名称',
  `departId` int(11) DEFAULT NULL COMMENT '部门id（外键，主键部门表）',
  `departNmae` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `maker` varchar(20) DEFAULT NULL COMMENT '制单人员',
  `permitter` varchar(20) DEFAULT NULL COMMENT '复核人员',
  `remark` varchar(250) DEFAULT NULL COMMENT '备注',
  `spareFieid` varchar(250) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`billNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dsdssalemain` */

insert  into `dsdssalemain`(`billNo`,`billDate`,`custId`,`custShortName`,`custAddress`,`saleClassName`,`currencyName`,`exchRete`,`priceofTax`,`wareId`,`wareName`,`salesID`,`salesName`,`departId`,`departNmae`,`maker`,`permitter`,`remark`,`spareFieid`) values ('2017021201','2017-02-12',1,'三国公司','湖南省株洲市石峰区205号','紧急出库','人民币','1','未税',1,'上海分仓',1,'张大发',1,'销售部','admin','admin',NULL,NULL),('2017021202','2017-02-12',1,'三国公司','湖南省株洲市石峰区205号','紧急出库','人民币','1','未税',1,'上海分仓',1,'张大发',1,'销售部','admin','admin',NULL,NULL);

/*Table structure for table `dsfundaddprepay` */

DROP TABLE IF EXISTS `dsfundaddprepay`;

CREATE TABLE `dsfundaddprepay` (
  `AddMoney` decimal(10,2) NOT NULL,
  `OrderNO` varchar(20) NOT NULL,
  `BillType` varchar(50) NOT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `FundBillID` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dsfundaddprepay` */

insert  into `dsfundaddprepay`(`AddMoney`,`OrderNO`,`BillType`,`Description`,`FundBillID`) values ('300.00','20180520001','采购订单',NULL,'20180520001');

/*Table structure for table `dsfundmain` */

DROP TABLE IF EXISTS `dsfundmain`;

CREATE TABLE `dsfundmain` (
  `CustomerID` varchar(20) NOT NULL,
  `FundBillID` varchar(20) NOT NULL,
  `FundBillDate` date NOT NULL,
  `CashStyleID` varchar(20) NOT NULL,
  `CashStyleName` varchar(50) NOT NULL,
  `CashStyleMoney` decimal(10,2) NOT NULL,
  `VisaStyleID` varchar(20) NOT NULL,
  `VisaStyleName` varchar(50) NOT NULL,
  `VisaStyleMoney` decimal(10,2) NOT NULL,
  `OtherPayStyleID` varchar(20) DEFAULT NULL,
  `OtherPayStyleName` varchar(50) DEFAULT NULL,
  `OtherPayStyleMoney` decimal(10,2) NOT NULL,
  `CurrID` varchar(50) NOT NULL,
  `ExchRate` decimal(10,4) NOT NULL,
  `DiscountPer` decimal(10,2) NOT NULL,
  `OffSetStyle` varchar(50) DEFAULT NULL,
  `AccMonthMonth` varchar(50) DEFAULT NULL,
  `VoucherNo` varchar(50) DEFAULT NULL,
  `DeptFrom` varchar(20) DEFAULT NULL,
  `DepartNameFrom` varchar(50) DEFAULT NULL,
  `ProjectTo` varchar(20) DEFAULT NULL,
  `ProjectNameTo` varchar(50) DEFAULT NULL,
  `MakerID` varchar(20) DEFAULT NULL,
  `Maker` varchar(50) DEFAULT NULL,
  `PermitterID` varchar(20) DEFAULT NULL,
  `Permitter` varchar(50) DEFAULT NULL,
  `Memo` varchar(200) DEFAULT NULL,
  `OrigAddPrepay` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`FundBillID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dsfundmain` */

insert  into `dsfundmain`(`CustomerID`,`FundBillID`,`FundBillDate`,`CashStyleID`,`CashStyleName`,`CashStyleMoney`,`VisaStyleID`,`VisaStyleName`,`VisaStyleMoney`,`OtherPayStyleID`,`OtherPayStyleName`,`OtherPayStyleMoney`,`CurrID`,`ExchRate`,`DiscountPer`,`OffSetStyle`,`AccMonthMonth`,`VoucherNo`,`DeptFrom`,`DepartNameFrom`,`ProjectTo`,`ProjectNameTo`,`MakerID`,`Maker`,`PermitterID`,`Permitter`,`Memo`,`OrigAddPrepay`) values ('BDQN','20180520001','2018-05-20','01','转账','200.00','02','汇票','100.00',NULL,NULL,'0.00','人民币','1.0000','0.00','预付款',NULL,NULL,'1001','市场部',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'200.00');

/*Table structure for table `dsinvoicelist` */

DROP TABLE IF EXISTS `dsinvoicelist`;

CREATE TABLE `dsinvoicelist` (
  `billNo` varchar(20) DEFAULT NULL COMMENT '单据号码（外键，主键销售出库单）',
  `serNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '单据行号',
  `prodID` varchar(20) DEFAULT NULL COMMENT '物料编号（外键，主键物料主文件表）',
  `prodName` varchar(150) DEFAULT NULL COMMENT '物料名称',
  `prodSize` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `unitName` varchar(20) DEFAULT NULL COMMENT '单位名称',
  `sQuantity` int(11) DEFAULT NULL COMMENT '数量',
  `rebatePrice` double DEFAULT NULL COMMENT '折扣前单价',
  `rebate` double DEFAULT NULL COMMENT '折数（%）',
  `price` double DEFAULT NULL COMMENT '单价',
  `money` double DEFAULT NULL COMMENT '金额',
  `taxes` double DEFAULT NULL COMMENT '税率（%）',
  `tax` double DEFAULT NULL COMMENT '税额',
  `taxMoney` double DEFAULT NULL COMMENT '含税金额',
  `gift` tinyint(1) DEFAULT NULL COMMENT '赠品',
  `numbers` varchar(50) DEFAULT NULL COMMENT '来源单号',
  `source` varchar(50) DEFAULT NULL COMMENT '来源单别',
  `spareFieid` varchar(250) DEFAULT NULL COMMENT '备用字段',
  PRIMARY KEY (`serNo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `dsinvoicelist` */

insert  into `dsinvoicelist`(`billNo`,`serNo`,`prodID`,`prodName`,`prodSize`,`unitName`,`sQuantity`,`rebatePrice`,`rebate`,`price`,`money`,`taxes`,`tax`,`taxMoney`,`gift`,`numbers`,`source`,`spareFieid`) values ('2017021201',5,'1','联想主机',NULL,'台',10,5000,100,5000,50000,17,8500,58500,0,NULL,NULL,NULL),('2017021201',6,'2','自行车',NULL,'辆',10,500,100,500,5000,17,850,5850,0,NULL,NULL,NULL),('2017021202',7,'3','手机',NULL,'台',10,5000,100,5000,50000,17,8500,58500,0,NULL,NULL,NULL),('2017021202',8,'4','肾',NULL,'个',10,50000,100,50000,500000,17,85000,585000,0,NULL,NULL,NULL);

/*Table structure for table `dsparticular` */

DROP TABLE IF EXISTS `dsparticular`;

CREATE TABLE `dsparticular` (
  `funBillNo` varchar(20) DEFAULT NULL COMMENT '单据号码（外键，主键应收冲款单）',
  `serNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '单据行号',
  `originFlag` varchar(20) DEFAULT NULL COMMENT '单别',
  `originBillDate` date DEFAULT NULL COMMENT '原单日期',
  `originBillNo` varchar(20) DEFAULT NULL COMMENT '原单单号',
  `total` double DEFAULT NULL COMMENT '原单金额',
  `discount` double DEFAULT NULL COMMENT '折让金额',
  `offSet` double DEFAULT NULL COMMENT '冲款金额',
  `offSetMoney` double DEFAULT NULL COMMENT '冲抵金额',
  PRIMARY KEY (`serNo`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `dsparticular` */

insert  into `dsparticular`(`funBillNo`,`serNo`,`originFlag`,`originBillDate`,`originBillNo`,`total`,`discount`,`offSet`,`offSetMoney`) values ('2017021201',5,'销售出库','2017-02-12','2017021201',58500,0,58500,58500),('2017021201',6,'销售出库','2017-02-12','2017021201',5850,0,5850,5850),('2017021201',7,'销售出库','2017-02-12','2017021202',58500,0,58500,58500),('2017021201',8,'销售出库','2017-02-12','2017021202',585000,0,585000,585000);

/*Table structure for table `dsproductclass` */

DROP TABLE IF EXISTS `dsproductclass`;

CREATE TABLE `dsproductclass` (
  `ClassID` varchar(20) NOT NULL,
  `ClassName` varchar(50) NOT NULL,
  `EngName` varchar(50) DEFAULT NULL,
  `AccInventoryID` varchar(20) DEFAULT NULL,
  `AccInventoryName` varchar(50) DEFAULT NULL,
  `AccSaleID` varchar(20) DEFAULT NULL,
  `AccSaleName` varchar(50) DEFAULT NULL,
  `AccSaleCostID` varchar(20) DEFAULT NULL,
  `AccSaleCostName` varchar(50) DEFAULT NULL,
  `SendOutWareID` varchar(20) DEFAULT NULL,
  `SendOutWateName` varchar(50) DEFAULT NULL,
  `GiftExpenseID` varchar(20) DEFAULT NULL,
  `GiftExpenseName` varchar(50) DEFAULT NULL,
  `OtherIncomeID` varchar(20) DEFAULT NULL,
  `OtherIncomeName` varchar(50) DEFAULT NULL,
  `OtherExpenseID` varchar(20) DEFAULT NULL,
  `OtherExpenseName` varchar(50) DEFAULT NULL,
  `OtherCostID` varchar(20) DEFAULT NULL,
  `OtherCostName` varchar(50) DEFAULT NULL,
  `Memo` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dsproductclass` */

insert  into `dsproductclass`(`ClassID`,`ClassName`,`EngName`,`AccInventoryID`,`AccInventoryName`,`AccSaleID`,`AccSaleName`,`AccSaleCostID`,`AccSaleCostName`,`SendOutWareID`,`SendOutWateName`,`GiftExpenseID`,`GiftExpenseName`,`OtherIncomeID`,`OtherIncomeName`,`OtherExpenseID`,`OtherExpenseName`,`OtherCostID`,`OtherCostName`,`Memo`) values ('1001','主机包装物',NULL,'1004','包装物','1008','其他业务收入','1007','其他业务支出','1006','发出商品','1005','营业费用',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1002','主机',NULL,'1011','库存商品','1009','主营业务收入','1010','主营业务成本','1006','发出商品','1005','营业费用',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1003','显示器',NULL,'1011','库存商品','1009','主营业务收入','1010','主营业务成本','1006','发出商品','1005','营业费用',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1004','键盘',NULL,'1003','原材料','1009','主营业务收入','1010','主营业务成本','1006','发出商品','1005','营业费用',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1005','鼠标',NULL,'1003','原材料','1009','主营业务收入','1010','主营业务成本','1006','发出商品','1005','营业费用',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1006','显卡',NULL,'1003','原材料','1009','主营业务收入','1010','主营业务成本','1006','发出商品','1005','营业费用',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1007','硬盘',NULL,'1003','原材料','1009','主营业务收入','1010','主营业务成本','1006','发出商品','1005','营业费用',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1008','机箱',NULL,'1003','原材料','1009','主营业务收入','1010','主营业务成本','1006','发出商品','1005','营业费用',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `fareclass` */

DROP TABLE IF EXISTS `fareclass`;

CREATE TABLE `fareclass` (
  `FareClassID` varchar(20) NOT NULL,
  `FareClassName` varchar(50) NOT NULL,
  `EngName` varchar(50) DEFAULT NULL,
  `AccSubjectID` varchar(20) DEFAULT NULL,
  `AccSubjectName` varchar(50) DEFAULT NULL,
  `Mome` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`FareClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `fareclass` */

insert  into `fareclass`(`FareClassID`,`FareClassName`,`EngName`,`AccSubjectID`,`AccSubjectName`,`Mome`) values ('01','主营业务收入',NULL,NULL,NULL,NULL),('02','其他业务收入',NULL,NULL,NULL,NULL),('03','营业外收入',NULL,NULL,NULL,NULL);

/*Table structure for table `jiliang` */

DROP TABLE IF EXISTS `jiliang`;

CREATE TABLE `jiliang` (
  `jlId` int(11) NOT NULL COMMENT '计量单位Id',
  `jlName` varchar(20) DEFAULT NULL COMMENT '计量单位名称',
  `Beizhu` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`jlId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `jiliang` */

insert  into `jiliang`(`jlId`,`jlName`,`Beizhu`) values (1,'呵呵','MD没有');

/*Table structure for table `master` */

DROP TABLE IF EXISTS `master`;

CREATE TABLE `master` (
  `Id` int(11) NOT NULL,
  `BianHao` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `Type` varchar(50) DEFAULT NULL,
  `JilLiangDanWei` varchar(50) DEFAULT NULL,
  `Price` varchar(50) DEFAULT NULL,
  `Pricea` varchar(50) DEFAULT NULL,
  `Priceb` varchar(50) DEFAULT NULL,
  `BiaoZhuenJingJiaoi` varchar(50) DEFAULT NULL,
  `BiBei` varchar(50) DEFAULT NULL,
  `ZhuangTai` varchar(50) DEFAULT NULL,
  `HanShuei` varchar(50) DEFAULT NULL,
  `ShuieLv` varchar(50) DEFAULT NULL,
  `CaiGouTiQianQi` varchar(50) DEFAULT NULL,
  `ZhuGongYingShang` varchar(50) DEFAULT NULL,
  `QiChuChenBen` varchar(50) DEFAULT NULL,
  `PingJunChenBen` varchar(50) DEFAULT NULL,
  `BIaozhuenChenBen` varchar(50) DEFAULT NULL,
  `QiChuZongChenBen` varchar(50) DEFAULT NULL,
  `XianYouZongShuLiang` varchar(50) DEFAULT NULL,
  `XianXingPingJunChenBen` varchar(50) DEFAULT NULL,
  `BiaoZhuenZongChenBen` varchar(50) DEFAULT NULL,
  `MasterBh` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `master` */

insert  into `master`(`Id`,`BianHao`,`Name`,`Model`,`Type`,`JilLiangDanWei`,`Price`,`Pricea`,`Priceb`,`BiaoZhuenJingJiaoi`,`BiBei`,`ZhuangTai`,`HanShuei`,`ShuieLv`,`CaiGouTiQianQi`,`ZhuGongYingShang`,`QiChuChenBen`,`PingJunChenBen`,`BIaozhuenChenBen`,`QiChuZongChenBen`,`XianYouZongShuLiang`,`XianXingPingJunChenBen`,`BiaoZhuenZongChenBen`,`MasterBh`) values (1,'001','哈哈哈','主机','gggtg','pcs','30000','28888','27777','28888','人民币','采购件','未税','17.0','0','神州数码','5','3370','3370','16.850','24','3370','80880','80880'),(2,'002','呵呵呵','主机','gggtg','pcs','30000','28888','27777','28888','人民币','采购件','未税','17.0','0','神州数码','5','3370','3370','16.850','24','3370','80880','80880');

/*Table structure for table `material` */

DROP TABLE IF EXISTS `material`;

CREATE TABLE `material` (
  `id` varchar(15) NOT NULL COMMENT 'id',
  `BianHao` varchar(11) NOT NULL COMMENT '编号',
  `Name` varchar(15) NOT NULL COMMENT '名称',
  `BeiZhu` varchar(50) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `material` */

/*Table structure for table `modifydetailed` */

DROP TABLE IF EXISTS `modifydetailed`;

CREATE TABLE `modifydetailed` (
  `mdId` varchar(15) NOT NULL COMMENT '单据号码',
  `columnId` int(11) DEFAULT NULL COMMENT '栏号',
  `materielId` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `avgVost` double(18,6) DEFAULT NULL COMMENT '现行平均成本价',
  `price` double(18,6) DEFAULT NULL COMMENT '单价',
  `tiaojiajine` double(18,6) DEFAULT NULL COMMENT '调价金额',
  `cause` varchar(100) DEFAULT NULL COMMENT '原因',
  PRIMARY KEY (`mdId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `modifydetailed` */

insert  into `modifydetailed`(`mdId`,`columnId`,`materielId`,`avgVost`,`price`,`tiaojiajine`,`cause`) values ('20180101001',1,'1',51.000000,50.000000,50.000000,'hhh'),('20180102001',2,'2',41.000000,40.000000,40.000000,'啦啦啦');

/*Table structure for table `modifyprice` */

DROP TABLE IF EXISTS `modifyprice`;

CREATE TABLE `modifyprice` (
  `mpId` varchar(15) NOT NULL COMMENT '调价编号',
  `madate` datetime DEFAULT NULL COMMENT '单据日期',
  `warehouseId` int(11) DEFAULT NULL COMMENT '仓库编号',
  `modifyType` int(11) DEFAULT NULL COMMENT '调整方式 1调单价/2调金额',
  `zhidanuserId` int(11) DEFAULT NULL COMMENT '制单人员',
  `fuheuserId` int(11) DEFAULT NULL COMMENT '复核人员',
  PRIMARY KEY (`mpId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `modifyprice` */

insert  into `modifyprice`(`mpId`,`madate`,`warehouseId`,`modifyType`,`zhidanuserId`,`fuheuserId`) values ('20180101001','2018-01-01 00:00:00',1,1,1,1),('20180102001','2018-01-02 00:00:00',2,2,2,2);

/*Table structure for table `moneypayable` */

DROP TABLE IF EXISTS `moneypayable`;

CREATE TABLE `moneypayable` (
  `FundbillID` varchar(20) NOT NULL COMMENT '单据号码',
  `FundbillDate` date NOT NULL COMMENT '单据日期',
  `RcurrencyName` varchar(10) NOT NULL COMMENT '币别名称',
  `ExchRate` double(19,4) NOT NULL COMMENT '汇率',
  `CustomerID` varchar(15) NOT NULL COMMENT '供应商编号',
  `CustomerName` varchar(30) NOT NULL COMMENT '供应商名称',
  `Cash` double(19,4) DEFAULT NULL COMMENT '结算方式一',
  `Visa` double(19,4) DEFAULT NULL COMMENT '结算方式二',
  `OtherPay` double(19,4) DEFAULT NULL COMMENT '结算方式三',
  `DiscountPer` double(19,4) DEFAULT NULL COMMENT '折扣率',
  `AccMonthToMonth` date DEFAULT NULL COMMENT '终止帐月',
  `DeptFromID` int(11) NOT NULL COMMENT '所属部门编号',
  `DeptFrom` varchar(25) NOT NULL COMMENT '所属部门',
  `Project` varchar(25) DEFAULT NULL COMMENT '所属项目',
  `MakerID` int(11) NOT NULL COMMENT '制单人员编号',
  `Maker` varchar(25) NOT NULL COMMENT '制单人员',
  `PermitterID` int(11) DEFAULT NULL COMMENT '复核人员编号',
  `Permitter` varchar(25) DEFAULT NULL COMMENT '复核人员',
  `Memo` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FundbillID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `moneypayable` */

insert  into `moneypayable`(`FundbillID`,`FundbillDate`,`RcurrencyName`,`ExchRate`,`CustomerID`,`CustomerName`,`Cash`,`Visa`,`OtherPay`,`DiscountPer`,`AccMonthToMonth`,`DeptFromID`,`DeptFrom`,`Project`,`MakerID`,`Maker`,`PermitterID`,`Permitter`,`Memo`) values ('20141225001','2014-12-25','人民币',1.0000,'','',NULL,NULL,NULL,NULL,NULL,0,'',NULL,10007,'刘财务',NULL,NULL,NULL),('20181225001','2018-12-25','人民币',1.0000,'','',NULL,NULL,NULL,NULL,NULL,0,'',NULL,10008,'李财务',NULL,NULL,NULL);

/*Table structure for table `order_detail` */

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `serNo` int(11) NOT NULL AUTO_INCREMENT COMMENT '行号',
  `billNo` varchar(12) NOT NULL COMMENT '单据号码',
  `prodID` varchar(30) NOT NULL COMMENT '物料编号',
  `prodName` varchar(20) DEFAULT NULL COMMENT '物料名称',
  `prodSize` varchar(20) DEFAULT NULL COMMENT '规格型号',
  `unitName` varchar(20) DEFAULT NULL COMMENT '单位',
  `sQuantity` int(11) DEFAULT NULL COMMENT '数量',
  `oldPrice` double DEFAULT NULL COMMENT '折前单价',
  `disCount` int(11) DEFAULT NULL COMMENT '折数',
  `unitPrice` double DEFAULT NULL COMMENT '单价',
  `amount` double DEFAULT NULL COMMENT '金额',
  `taxRate` double DEFAULT NULL COMMENT '税率',
  `taxAmt` double DEFAULT NULL COMMENT '含税金额',
  `preInDate` date NOT NULL COMMENT '预入库日',
  `isGift` varchar(10) DEFAULT NULL COMMENT '是否赠品',
  `fromNo` varchar(20) DEFAULT NULL COMMENT '来源单别',
  `tranType` varchar(20) DEFAULT NULL COMMENT '来源单号',
  `itemRemark` varchar(200) DEFAULT NULL COMMENT '分录备注',
  `vftotal` double DEFAULT NULL COMMENT '税额',
  `qtyRemain` int(11) DEFAULT NULL COMMENT '未入库量',
  PRIMARY KEY (`serNo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `order_detail` */

insert  into `order_detail`(`serNo`,`billNo`,`prodID`,`prodName`,`prodSize`,`unitName`,`sQuantity`,`oldPrice`,`disCount`,`unitPrice`,`amount`,`taxRate`,`taxAmt`,`preInDate`,`isGift`,`fromNo`,`tranType`,`itemRemark`,`vftotal`,`qtyRemain`) values (1,'2018050202','C01-W-HP-DC7900-307','HP DC7900CMT-NA307PA','','PCS',20,3370,100,3370,67400,17,25903.8,'2018-05-02','是','销售订单','2018041602','',11458,20),(2,'2018050202','C01-W-HP-DC7900-307','C01-W-HP-DC7900-307P','','PCS',20,3370,100,3370,67400,17,25903.8,'2018-05-02','是','销售订单','2018041602','',11458,10);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `billNo` varchar(12) NOT NULL COMMENT '单据号码',
  `billDate` date NOT NULL COMMENT '单据日期',
  `customerID` int(11) NOT NULL COMMENT '供应商',
  `addressID` int(11) DEFAULT NULL COMMENT '供应商地址',
  `billStyleID` int(11) DEFAULT NULL COMMENT '采购订单类型',
  `curCurrencyName` varchar(30) DEFAULT NULL COMMENT '币别',
  `priceOfTax` varchar(20) DEFAULT NULL COMMENT '单价是否含税',
  `billStatus` varchar(20) DEFAULT NULL COMMENT '单况',
  `giveAddress` varchar(50) DEFAULT NULL COMMENT '送货地址',
  `exchRate` double DEFAULT NULL COMMENT '汇率',
  `salesID` int(11) NOT NULL COMMENT '采购人员',
  `departID` int(11) NOT NULL COMMENT '所属部门',
  `marker` varchar(20) DEFAULT NULL COMMENT '制单人员',
  `permitter` varchar(20) DEFAULT NULL COMMENT '审核人员',
  `projectID` int(11) DEFAULT NULL COMMENT '所属项目',
  `headerID` int(11) DEFAULT NULL COMMENT '表头条文(关联报表条文)',
  `footerID` int(11) DEFAULT NULL COMMENT '表尾条文(关联报表条文)',
  `userDef1` varchar(20) DEFAULT NULL COMMENT '自定栏一',
  `userDef2` varchar(20) DEFAULT NULL COMMENT '自定栏二',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `dueTo` int(11) DEFAULT NULL COMMENT '帐款归属',
  `gatherStyle` varchar(20) DEFAULT NULL COMMENT '帐款条件',
  `gatherDay` int(11) DEFAULT NULL COMMENT '帐款天数',
  `prepayDay` date DEFAULT NULL COMMENT '帐款日期',
  `accMonth` date DEFAULT NULL COMMENT '帐款月份',
  `deleteStatus` int(11) DEFAULT NULL COMMENT '是否可用  0不可用 1可用(删除是改为不可用)',
  PRIMARY KEY (`billNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`billNo`,`billDate`,`customerID`,`addressID`,`billStyleID`,`curCurrencyName`,`priceOfTax`,`billStatus`,`giveAddress`,`exchRate`,`salesID`,`departID`,`marker`,`permitter`,`projectID`,`headerID`,`footerID`,`userDef1`,`userDef2`,`remark`,`dueTo`,`gatherStyle`,`gatherDay`,`prepayDay`,`accMonth`,`deleteStatus`) values ('2018050201','2018-05-02',0,1,1,'人民币','未税','未结案','送货地址',1,1,1,'admin','admin',1,1,1,'userDef1','userDef2','remark',0,'货到',0,'2018-05-02','2018-05-02',1),('2018050202','2018-05-02',0,1,1,'人民币','未税','未结案','送货地址',1,1,1,'admin','admin',1,1,1,'userDef1','userDef2','remark',0,'货到',0,'2018-05-02','2018-05-02',1);

/*Table structure for table `outinto` */

DROP TABLE IF EXISTS `outinto`;

CREATE TABLE `outinto` (
  `documentsNo` varchar(20) NOT NULL,
  `documentsDate` date DEFAULT NULL,
  `Foreign` int(11) DEFAULT NULL,
  `tax` int(11) DEFAULT NULL,
  `documentNo` varchar(20) DEFAULT NULL,
  `note` varchar(200) DEFAULT NULL,
  `supplierId` int(11) DEFAULT NULL,
  `storageTypeId` int(11) DEFAULT NULL,
  `houseId` int(11) DEFAULT NULL,
  `purchasePersonnelId` int(11) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  `ordersPersonnelId` int(11) DEFAULT NULL,
  `reviewPersonnelId` int(11) DEFAULT NULL,
  `restocking` int(11) DEFAULT NULL,
  PRIMARY KEY (`documentsNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `outinto` */

insert  into `outinto`(`documentsNo`,`documentsDate`,`Foreign`,`tax`,`documentNo`,`note`,`supplierId`,`storageTypeId`,`houseId`,`purchasePersonnelId`,`projectId`,`ordersPersonnelId`,`reviewPersonnelId`,`restocking`) values ('2018050501','2018-05-05',1,1,NULL,NULL,1,1,1,1,NULL,1,NULL,1);

/*Table structure for table `outintodetails` */

DROP TABLE IF EXISTS `outintodetails`;

CREATE TABLE `outintodetails` (
  `detailsId` int(11) NOT NULL AUTO_INCREMENT,
  `materialsId` int(11) DEFAULT NULL,
  `documentsId` int(11) DEFAULT NULL,
  `ordersType` varchar(15) DEFAULT NULL,
  `ordersId` int(11) DEFAULT NULL,
  `apportionment` float DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `priceBeforeDiscount` float DEFAULT NULL,
  `disCount` float DEFAULT NULL,
  `gifts` int(11) DEFAULT NULL,
  `apportionmentNote` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`detailsId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `outintodetails` */

insert  into `outintodetails`(`detailsId`,`materialsId`,`documentsId`,`ordersType`,`ordersId`,`apportionment`,`number`,`priceBeforeDiscount`,`disCount`,`gifts`,`apportionmentNote`) values (1,1,1,'采购入库单',2018050501,0,1,100,1,0,NULL);

/*Table structure for table `payforcontent` */

DROP TABLE IF EXISTS `payforcontent`;

CREATE TABLE `payforcontent` (
  `LanHao` int(11) NOT NULL COMMENT '栏号',
  `FundbillID` varchar(20) DEFAULT NULL COMMENT '主单单号',
  `SourceName` varchar(25) DEFAULT NULL COMMENT '单别',
  `YuandanDate` date DEFAULT NULL COMMENT '原单日期',
  `YuandanID` varchar(20) DEFAULT NULL COMMENT '原单单号',
  `Fapiao` varchar(20) DEFAULT NULL COMMENT '发票号码',
  `TradingDX` int(11) DEFAULT NULL COMMENT '交易对象',
  `TradingDXName` varchar(25) DEFAULT NULL COMMENT '交易对象名称',
  `DeptFromID` int(11) DEFAULT NULL COMMENT '部门编号',
  `DeptFrom` varchar(25) DEFAULT NULL COMMENT '部门名称',
  `Purchasers` varchar(25) DEFAULT NULL COMMENT '采购人员',
  `ProjectName` varchar(25) DEFAULT NULL COMMENT '项目名称',
  `CurrID` varchar(10) DEFAULT NULL COMMENT '币别',
  `ExchRate` double(19,4) DEFAULT NULL COMMENT '汇率',
  `originmoney` double(19,4) DEFAULT NULL COMMENT '原单金额',
  `Balance` double(19,4) DEFAULT NULL COMMENT '现行金额',
  `Discountmoney` double(19,4) DEFAULT NULL COMMENT '折让金额',
  `Payformoney` double(19,4) DEFAULT NULL COMMENT '冲款金额',
  `Flushingmoney` double(19,4) DEFAULT NULL COMMENT '冲抵金额',
  PRIMARY KEY (`LanHao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `payforcontent` */

/*Table structure for table `personnel` */

DROP TABLE IF EXISTS `personnel`;

CREATE TABLE `personnel` (
  `PersonID` int(11) NOT NULL COMMENT '人员编号',
  `PersonName` varchar(25) NOT NULL COMMENT '人员姓名',
  `EngName` varchar(50) NOT NULL COMMENT '英文姓名',
  `Sex` int(11) NOT NULL COMMENT '性别    0：女  1：男',
  `DepartID` int(11) NOT NULL COMMENT '所属部门编号',
  `DepartName` varchar(25) NOT NULL COMMENT '所属部门名称',
  `IdentityNumber` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `Birthday` date DEFAULT NULL COMMENT '出生日期',
  `Email` varchar(20) DEFAULT NULL COMMENT '联系邮箱',
  `Phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `Address` varchar(50) DEFAULT NULL COMMENT '联系地址',
  `Schooling` varchar(10) DEFAULT NULL COMMENT '最高学历',
  `School` varchar(50) DEFAULT NULL COMMENT '毕业学校',
  `DepMemo` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`PersonID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `personnel` */

insert  into `personnel`(`PersonID`,`PersonName`,`EngName`,`Sex`,`DepartID`,`DepartName`,`IdentityNumber`,`Birthday`,`Email`,`Phone`,`Address`,`Schooling`,`School`,`DepMemo`) values (10001,'刘采购','LCG',1,1,'采购部','','0000-00-00','','','','','',''),(10002,'王采购','LCG',0,1,'采购部','','0000-00-00','','','','','',''),(10003,'李采购','LCG',1,1,'采购部','','0000-00-00','','','','','',''),(10004,'刘销售','LXS',1,2,'销售部','','0000-00-00','','','','','',''),(10005,'王销售','WXS',0,2,'销售部','','0000-00-00','','','','','',''),(10006,'李销售','LXS',1,2,'销售部','','0000-00-00','','','','','',''),(10007,'刘财务','LCW',1,3,'财务部','','0000-00-00','','','','','',''),(10008,'李财务','LCW',0,3,'财务部','','0000-00-00','','','','','',''),(10009,'王财务','WCW',1,3,'财务部','','0000-00-00','','','','','',''),(10010,'刘储运','LCY',1,4,'储运部','','0000-00-00','','','','','',''),(10011,'王储运','WCY',0,4,'储运部','','0000-00-00','','','','','',''),(10012,'李储运','LCY',1,4,'储运部','','0000-00-00','','','','','',''),(10013,'刘研发','LYF',1,5,'研发部','','0000-00-00','','','','','',''),(10014,'李研发','LYF',0,5,'研发部','','0000-00-00','','','','','',''),(10015,'成研发','CYF',1,5,'研发部','','0000-00-00','','','','','',''),(10016,'何生产','HSC',1,6,'生产部','','0000-00-00','','','','','',''),(10017,'刘生产','LSC',0,6,'生产部','','0000-00-00','','','','','',''),(10018,'李生产','LSC',1,6,'生产部','','0000-00-00','','','','','',''),(10019,'言直销','YZX',1,7,'直销部','','0000-00-00','','','','','',''),(10020,'刘直销','LZX',0,7,'直销部','','0000-00-00','','','','','',''),(10021,'李直销','LZX',1,7,'直销部','','0000-00-00','','','','','',''),(10022,'王管理','WGL',1,8,'综合管理部','','0000-00-00','','','','','',''),(10023,'刘管理','LGL',0,8,'综合管理部','','0000-00-00','','','','','',''),(10024,'严管理','YGL',1,8,'综合管理部','','0000-00-00','','','','','',''),(10025,'刘服务','LFW',1,9,'服务中心','','0000-00-00','','','','','',''),(10026,'成服务','CFW',0,9,'服务中心','','0000-00-00','','','','','',''),(10027,'陈服务','CFW',1,9,'服务中心','','0000-00-00','','','','','','');

/*Table structure for table `requisitions` */

DROP TABLE IF EXISTS `requisitions`;

CREATE TABLE `requisitions` (
  `billNo` varchar(12) NOT NULL COMMENT '单据号码',
  `billDate` date NOT NULL COMMENT '单据日期',
  `billStyleID` varchar(50) NOT NULL COMMENT '采购请购类型（关联采购请购类别设定）',
  `billStatus` varchar(30) DEFAULT NULL COMMENT '单况（1.已结案，2.未结',
  `salesID` int(11) NOT NULL COMMENT '请购人员（关联人员主文件设定）',
  `departID` int(11) NOT NULL COMMENT '请购部门(关联部门设定)',
  `maker` varchar(20) DEFAULT NULL COMMENT '制单人员',
  `permitter` varchar(20) DEFAULT NULL COMMENT '复核人员',
  `headerID` int(11) DEFAULT NULL COMMENT '表头条文(关联报表条文)',
  `footerID` int(11) DEFAULT NULL COMMENT '表尾条文(关联报表条文)',
  `userDef1` varchar(20) DEFAULT NULL COMMENT '自定栏一',
  `userDef2` varchar(20) DEFAULT NULL COMMENT '自定栏二',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `deleteStatus` int(11) DEFAULT NULL COMMENT '是否可用  0不可用 1可用(删除是改为不可用)',
  PRIMARY KEY (`billNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `requisitions` */

insert  into `requisitions`(`billNo`,`billDate`,`billStyleID`,`billStatus`,`salesID`,`departID`,`maker`,`permitter`,`headerID`,`footerID`,`userDef1`,`userDef2`,`remark`,`deleteStatus`) values ('2018050201','2018-05-02','1','未结案',1,1,'Admin','Admin',1,1,'userDef1','userDef2','remark',1),('2018050202','2018-05-02','1','未结案',1,1,'Admin','Admin',1,1,'userDef1','userDef2','remark',1);

/*Table structure for table `requisitions_detail` */

DROP TABLE IF EXISTS `requisitions_detail`;

CREATE TABLE `requisitions_detail` (
  `serNO` int(11) NOT NULL AUTO_INCREMENT COMMENT '栏号',
  `billNo` varchar(12) NOT NULL COMMENT '单据号码',
  `prodID` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `prodName` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `predSize` varchar(20) DEFAULT NULL COMMENT '规格型号',
  `unitName` varchar(20) DEFAULT NULL COMMENT '单位名称',
  `sQuantity` int(11) DEFAULT NULL COMMENT '数量',
  `currID` varchar(20) DEFAULT NULL COMMENT '标准币别',
  `sPrice` double DEFAULT NULL COMMENT '标准进价',
  `amount` double DEFAULT NULL COMMENT '标准进价金额',
  `lastestCurrID` varchar(20) DEFAULT NULL COMMENT '最后一次币别',
  `lastestPrice` double DEFAULT NULL COMMENT '最后一次单价',
  `lastestsPrice` double DEFAULT NULL COMMENT '最后一次进价金额',
  `preInDate` date NOT NULL COMMENT '需求日期',
  `suggestPurDate` date DEFAULT NULL COMMENT '建议采购日期',
  `qtyRemain` int(11) DEFAULT NULL COMMENT '未采购量',
  `itemRemark` varchar(100) DEFAULT NULL COMMENT '备注',
  `tranType` varchar(20) DEFAULT NULL COMMENT '来源单别',
  `tranNO` varchar(11) DEFAULT NULL COMMENT '来源单号',
  `deleteStatus` int(11) DEFAULT NULL COMMENT '是否可用  0不可用 1可用(删除是改为不可用)',
  PRIMARY KEY (`serNO`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `requisitions_detail` */

insert  into `requisitions_detail`(`serNO`,`billNo`,`prodID`,`prodName`,`predSize`,`unitName`,`sQuantity`,`currID`,`sPrice`,`amount`,`lastestCurrID`,`lastestPrice`,`lastestsPrice`,`preInDate`,`suggestPurDate`,`qtyRemain`,`itemRemark`,`tranType`,`tranNO`,`deleteStatus`) values (1,'2018050201','C01-W-HP-DC7900-307','HP DC7900CMT-NA307PA#AB2台式机','','PCS',1,'RMB',3370,3370,'RMB',3370,3370,'2018-05-02','2018-04-22',1,'itemRemark','','',1),(2,'2018050202','C01-W-HP-DC7900-308','HP DC7900CMT-NA308PA#AB2台式机','','PCS',1,'RMB',3370,3370,'RMB',3370,3370,'2018-05-02','2018-04-22',1,'itemRemark','','',1);

/*Table structure for table `s_sell_ quote` */

DROP TABLE IF EXISTS `s_sell_ quote`;

CREATE TABLE `s_sell_ quote` (
  `qu_id` varchar(100) NOT NULL COMMENT '1、单据号码',
  `qu_cid` int(11) DEFAULT NULL COMMENT '2、客户编号id',
  `qu_cname` varchar(50) DEFAULT NULL COMMENT '3、客户名称',
  `qu_caddress` varchar(100) DEFAULT NULL COMMENT '4、送货地址（客户表中带出）',
  `qu_date` date DEFAULT NULL COMMENT '5、单据日期',
  `qu_effectdate` date DEFAULT NULL COMMENT '6、有效日期',
  `qu_pricetax` int(11) DEFAULT NULL COMMENT '7、单价是否含税 (1代表是0代表否)',
  `qu_moneytype` varchar(20) DEFAULT NULL COMMENT '8、币别',
  `qu_ exchangerate` double DEFAULT NULL COMMENT '9、汇率',
  `qu_peoyw_id` int(11) DEFAULT NULL COMMENT '10、业务人员id',
  `qu_peoyw_name` varchar(50) DEFAULT NULL COMMENT '11、业务人员名称',
  `qu_emp_id` int(11) DEFAULT NULL COMMENT '12、所属部门id ',
  `qu_emp_name` varchar(50) DEFAULT NULL COMMENT '13、所属部门名称',
  `qu_perzd_id` int(11) DEFAULT NULL COMMENT '14、制单人员id',
  `qu_perzd_name` varchar(50) DEFAULT NULL COMMENT '15、制单人员名称',
  `qu_perck_id` int(11) DEFAULT NULL COMMENT '16、审核人员id ',
  `qu_perck_name` varchar(50) DEFAULT NULL COMMENT '17、审核人员name',
  `qu_checkstatus` int(11) DEFAULT NULL COMMENT '18、是否审核  (1代表审核，0代表未审核)',
  PRIMARY KEY (`qu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `s_sell_ quote` */

/*Table structure for table `s_sell_ quoteparticular` */

DROP TABLE IF EXISTS `s_sell_ quoteparticular`;

CREATE TABLE `s_sell_ quoteparticular` (
  `qp_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '栏号',
  `qp_quid` varchar(100) DEFAULT NULL COMMENT '单据号码',
  `qp_ materielid` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `qp_ materielname` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `qp_model` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `qp_unitname` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `qp_number` double DEFAULT NULL COMMENT '数量',
  `qp_ discountprice` double DEFAULT NULL COMMENT '折扣前单价',
  `qp_ discount` double DEFAULT NULL COMMENT '折数',
  `qp_price` double DEFAULT NULL COMMENT '单价',
  `qp_sum` double DEFAULT NULL COMMENT '金额',
  `qp_rate` double DEFAULT NULL COMMENT '税率',
  `qp_tatemoney` double DEFAULT NULL COMMENT '税额',
  `qp_totalmoney` double DEFAULT NULL COMMENT '含税金额',
  `qp_ largess` int(11) DEFAULT NULL COMMENT '赠品  （1代表是、0代表否）',
  `qp_remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`qp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `s_sell_ quoteparticular` */

/*Table structure for table `s_sell_order` */

DROP TABLE IF EXISTS `s_sell_order`;

CREATE TABLE `s_sell_order` (
  `or_id` varchar(100) NOT NULL COMMENT '单据号码',
  `or_clientid` int(11) DEFAULT NULL COMMENT '客户ID',
  `or_clientname` varchar(50) DEFAULT NULL COMMENT '客户名称',
  `or_clientaddress` varchar(100) DEFAULT NULL COMMENT '送货地址',
  `or_type` varchar(50) DEFAULT NULL COMMENT '订单类型',
  `or_shuik` int(11) DEFAULT NULL COMMENT '单据是否含税',
  `or_dank` varchar(50) DEFAULT NULL COMMENT '单况',
  `or_orderdate` date DEFAULT NULL COMMENT '单据日期',
  `or_state` int(11) DEFAULT NULL COMMENT '审核状态',
  `or_userid` int(11) DEFAULT NULL COMMENT '业务人员ID',
  `or_username` varchar(50) DEFAULT NULL COMMENT '业务人员姓名',
  `or_emp_id` int(11) DEFAULT NULL COMMENT '所属部门id',
  `or_emp_name` varchar(50) DEFAULT NULL COMMENT '所属部门姓名',
  `or_perzd_id` int(11) DEFAULT NULL COMMENT '制单人员id',
  `or_perzd_name` varchar(50) DEFAULT NULL COMMENT '制单人员姓名',
  `or_perck_id` int(11) DEFAULT NULL COMMENT '复核人员id',
  `or_perck_name` varchar(50) DEFAULT NULL COMMENT '复核人员姓名',
  `or_Customerordere` varchar(100) DEFAULT NULL COMMENT '客户订单',
  `or_moneytype` varchar(50) DEFAULT NULL COMMENT '币别',
  `or_exchangerate` double DEFAULT NULL COMMENT '汇率',
  PRIMARY KEY (`or_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `s_sell_order` */

/*Table structure for table `s_sell_orderparticular` */

DROP TABLE IF EXISTS `s_sell_orderparticular`;

CREATE TABLE `s_sell_orderparticular` (
  `opa_line_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '栏号',
  `opa_id` varchar(50) DEFAULT NULL COMMENT '物料编号',
  `opa_name` varchar(50) DEFAULT NULL COMMENT '物料名称',
  `opa_or_id` varchar(100) DEFAULT NULL COMMENT '单据号码',
  `opa_model` varchar(50) DEFAULT NULL COMMENT '规格型号',
  `opa_unit` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `opa_count` double DEFAULT NULL COMMENT '数量',
  `opa_beforeprice` double DEFAULT NULL COMMENT '折扣前单价',
  `opa_break` double DEFAULT NULL COMMENT '折数',
  `opa_price` double DEFAULT NULL COMMENT '单价',
  `opa_money` double DEFAULT NULL COMMENT '金额',
  `opa_cess` double DEFAULT NULL COMMENT '税率',
  `opa_duty` double DEFAULT NULL COMMENT '税额',
  `opa_hansmoney` double DEFAULT NULL COMMENT '含税金额',
  `opa_chukdate` date DEFAULT NULL COMMENT '预出库日期',
  `opa_weichcount` double DEFAULT NULL COMMENT '未出数量',
  `opa_ present` int(11) DEFAULT NULL COMMENT '赠品',
  `opa_dantype` varchar(50) DEFAULT NULL COMMENT '来源单别',
  `opa_dan_id` varchar(100) DEFAULT NULL COMMENT '来源单号',
  `opa_remark` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`opa_line_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `s_sell_orderparticular` */

/*Table structure for table `sales_detail` */

DROP TABLE IF EXISTS `sales_detail`;

CREATE TABLE `sales_detail` (
  `LineNo` int(11) NOT NULL AUTO_INCREMENT,
  `FundbillID` varchar(50) DEFAULT NULL,
  `Sourcedifference` varchar(50) DEFAULT NULL,
  `Sourcesinglenumber` varchar(50) DEFAULT NULL,
  `Amountinadvance` float DEFAULT NULL,
  `abstract` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LineNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `sales_detail` */

insert  into `sales_detail`(`LineNo`,`FundbillID`,`Sourcedifference`,`Sourcesinglenumber`,`Amountinadvance`,`abstract`) values (1,'2018050501','销售订单','2018050501',7200,NULL);

/*Table structure for table `sales_payment` */

DROP TABLE IF EXISTS `sales_payment`;

CREATE TABLE `sales_payment` (
  `FundbillID` varchar(50) NOT NULL,
  `FundBillDate` datetime DEFAULT NULL,
  `CustomerID` varchar(50) DEFAULT NULL,
  `CustomerName` varchar(50) DEFAULT NULL,
  `moneyType` varchar(50) DEFAULT NULL,
  `Rate` float DEFAULT NULL,
  `DepartID` int(11) DEFAULT NULL,
  `DepartName` varchar(50) DEFAULT NULL,
  `MakerID` int(11) DEFAULT NULL,
  `Maker` varchar(50) DEFAULT NULL,
  `PermitterID` int(11) DEFAULT NULL,
  `Permitter` varchar(50) DEFAULT NULL,
  `Project` varchar(50) DEFAULT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  `Settlementmethod` varchar(50) DEFAULT NULL,
  `Settlementamount` float DEFAULT NULL,
  `Examinestate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`FundbillID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sales_payment` */

insert  into `sales_payment`(`FundbillID`,`FundBillDate`,`CustomerID`,`CustomerName`,`moneyType`,`Rate`,`DepartID`,`DepartName`,`MakerID`,`Maker`,`PermitterID`,`Permitter`,`Project`,`ProjectID`,`Settlementmethod`,`Settlementamount`,`Examinestate`) values ('2018050501','2018-05-05 00:00:00','154001','株洲总代理','RMB',1,6,'财务部',7,'罗娜',8,'马丁','月末收款',1,'现金',7200,'否');

/*Table structure for table `sales_return_detailed` */

DROP TABLE IF EXISTS `sales_return_detailed`;

CREATE TABLE `sales_return_detailed` (
  `LineNo` int(11) NOT NULL AUTO_INCREMENT,
  `BillNO` varchar(50) DEFAULT NULL,
  `MaterielId` varchar(50) DEFAULT NULL,
  `MaterieName` varchar(50) DEFAULT NULL,
  `Specifications` varchar(50) DEFAULT NULL,
  `Unitname` varchar(50) DEFAULT NULL,
  `MaterielNumbers` varchar(50) DEFAULT NULL,
  `DiscountPrice` int(11) DEFAULT NULL,
  `FoldNumber` float DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `AmountOfMoney` float DEFAULT NULL,
  `TaxRate` float DEFAULT NULL,
  `TaxAmount` float DEFAULT NULL,
  `totalamount` float DEFAULT NULL,
  `Batchnumber` varchar(50) DEFAULT NULL,
  `Gift` varchar(50) DEFAULT NULL,
  `Invoicedetail` varchar(50) DEFAULT NULL,
  `Unopenedinvoicenumber` int(11) DEFAULT NULL,
  `Memonotes` varchar(50) DEFAULT NULL,
  `OddNumbers` varchar(50) DEFAULT NULL,
  `OddSingle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`LineNo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `sales_return_detailed` */

insert  into `sales_return_detailed`(`LineNo`,`BillNO`,`MaterielId`,`MaterieName`,`Specifications`,`Unitname`,`MaterielNumbers`,`DiscountPrice`,`FoldNumber`,`Price`,`AmountOfMoney`,`TaxRate`,`TaxAmount`,`totalamount`,`Batchnumber`,`Gift`,`Invoicedetail`,`Unopenedinvoicenumber`,`Memonotes`,`OddNumbers`,`OddSingle`) values (1,'2018050501','C01-W-HP-DC7900-307','HP DC7900CMT-NA307PA#AB2台式机','FG','PCS','2',1228,1,1228,2100,0.17,357,NULL,NULL,'否','否',2,NULL,NULL,NULL),(3,'2018050501','C02-W-HP-GS917AA-AB2','HP L1710 (17\"LCD,VGA接口,300nits,800:1,5ms)','FGF','PCS','2',5733,1,5733,9800,0.17,1666,NULL,NULL,'否','否',2,NULL,NULL,NULL),(4,'2018050501','C02-W-HP-PF996AA-AB2','HP V7650 17\" Flat Color Monitor','KK','PCS','2',4446,1,4446,7600,0.17,1292,NULL,NULL,'否','否',2,NULL,NULL,NULL);

/*Table structure for table `sales_return_master` */

DROP TABLE IF EXISTS `sales_return_master`;

CREATE TABLE `sales_return_master` (
  `BillNO` varchar(50) NOT NULL,
  `CustID` varchar(50) DEFAULT NULL,
  `CustName` varchar(50) DEFAULT NULL,
  `PriceoffTax` int(11) DEFAULT NULL,
  `moneyType` varchar(50) DEFAULT NULL,
  `WareID` int(11) DEFAULT NULL,
  `WareName` varchar(50) DEFAULT NULL,
  `rate` float DEFAULT NULL,
  `BillDate` datetime DEFAULT NULL,
  `IsDeduct` int(11) DEFAULT NULL,
  `ItemRemark` varchar(50) DEFAULT NULL,
  `AddrID` int(11) DEFAULT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `SalesID` int(11) DEFAULT NULL,
  `SalesName` varchar(50) DEFAULT NULL,
  `MakerID` int(11) DEFAULT NULL,
  `Maker` varchar(50) DEFAULT NULL,
  `PermitterID` int(11) DEFAULT NULL,
  `Permitter` varchar(50) DEFAULT NULL,
  `DepartID` int(11) DEFAULT NULL,
  `DepartName` varchar(50) DEFAULT NULL,
  `Examinestate` varchar(50) DEFAULT NULL,
  `Project` varchar(50) DEFAULT NULL,
  `ProjectID` int(11) DEFAULT NULL,
  PRIMARY KEY (`BillNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sales_return_master` */

insert  into `sales_return_master`(`BillNO`,`CustID`,`CustName`,`PriceoffTax`,`moneyType`,`WareID`,`WareName`,`rate`,`BillDate`,`IsDeduct`,`ItemRemark`,`AddrID`,`Address`,`SalesID`,`SalesName`,`MakerID`,`Maker`,`PermitterID`,`Permitter`,`DepartID`,`DepartName`,`Examinestate`,`Project`,`ProjectID`) values ('2018050501','154001','株洲总代理',1,'RMB',1,'长沙仓库',1,'2018-05-05 00:00:00',1,'此批货物，务必小心!',1,'株洲市天元区泰山街道黄山路205号。',2,'张铁柱',3,'张启山',4,'张启德',1,'销售部','否','区域销售项目',1);

/*Table structure for table `settlementmethod` */

DROP TABLE IF EXISTS `settlementmethod`;

CREATE TABLE `settlementmethod` (
  `ClassID` varchar(20) NOT NULL,
  `ClassName` varchar(50) NOT NULL,
  `EngClassName` varchar(50) DEFAULT NULL,
  `AccSubjectID` varchar(20) DEFAULT NULL,
  `AccSubjectName` varchar(50) DEFAULT NULL,
  `Mome` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `settlementmethod` */

insert  into `settlementmethod`(`ClassID`,`ClassName`,`EngClassName`,`AccSubjectID`,`AccSubjectName`,`Mome`) values ('01','转账',NULL,NULL,NULL,NULL),('02','汇票',NULL,NULL,NULL,NULL),('03','现金',NULL,NULL,NULL,NULL);

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL,
  `BianHao` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `BeiZhu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `supplier` */

insert  into `supplier`(`id`,`BianHao`,`Name`,`BeiZhu`) values (1,'001','神州供应商','BeiZhu'),(2,'002','神州供应商','BeiZhu');

/*Table structure for table `t_client_masterfile` */

DROP TABLE IF EXISTS `t_client_masterfile`;

CREATE TABLE `t_client_masterfile` (
  `ID` varchar(20) NOT NULL,
  `FundsAttribution` varchar(20) NOT NULL,
  `FullName` varchar(20) NOT NULL,
  `ClassID` varchar(20) NOT NULL,
  `ShortName` varchar(20) NOT NULL,
  `AreaID` varchar(20) DEFAULT NULL,
  `EngFullName` varchar(20) DEFAULT NULL,
  `CurrencyID` varchar(20) DEFAULT NULL,
  `EngShortName` varchar(20) DEFAULT NULL,
  `ChiefName` varchar(20) DEFAULT NULL,
  `PersonID` varchar(20) NOT NULL,
  `LinkMan` varchar(20) DEFAULT NULL,
  `TaxNo` varchar(20) DEFAULT NULL,
  `Telephone1` varchar(20) DEFAULT NULL,
  `Capitalization` varchar(20) DEFAULT NULL,
  `Telephone2` varchar(20) DEFAULT NULL,
  `IndustrialClass` varchar(20) DEFAULT NULL,
  `Telephone3` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `MobileTel` varchar(20) DEFAULT NULL,
  `WebAddress` varchar(20) DEFAULT NULL,
  `BankAccount` varchar(20) DEFAULT NULL,
  `FaxNo` varchar(20) DEFAULT NULL,
  `BankID` varchar(20) DEFAULT NULL,
  `EarliestTradeDate` date DEFAULT NULL,
  `RateOfDiscount` float NOT NULL,
  `FirstTreadeDate` date DEFAULT NULL,
  `PriceRank` varchar(20) NOT NULL,
  `LatelyTradeDate` date DEFAULT NULL,
  `PriceofTax` int(11) NOT NULL,
  `LatelyReturnDate` date DEFAULT NULL,
  `TransNewID` int(11) DEFAULT NULL,
  `LastVisitDate` date DEFAULT NULL,
  `BuildUpDate` date NOT NULL,
  `BookVisitDate` date DEFAULT NULL,
  `InvalidDate` date DEFAULT NULL,
  `AmountQuota` float NOT NULL,
  `StartAdvRecv` float NOT NULL,
  `RemainQuota` float NOT NULL,
  `StartReceivable` float NOT NULL,
  `RecvWay` varchar(20) NOT NULL,
  `CurAdvRecy` float NOT NULL,
  `DayOfClose` date NOT NULL,
  `CurReceivable` float NOT NULL,
  `CreditLevel` varchar(20) NOT NULL,
  `NotInvQuota` float NOT NULL,
  `InvoTypeID` varchar(20) DEFAULT NULL,
  `AccAdvRecv` varchar(20) DEFAULT NULL,
  `AccReceivable` varchar(20) DEFAULT NULL,
  `AddField1` varchar(20) DEFAULT NULL,
  `AddField2` varchar(20) DEFAULT NULL,
  `Memo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_client_masterfile` */

insert  into `t_client_masterfile`(`ID`,`FundsAttribution`,`FullName`,`ClassID`,`ShortName`,`AreaID`,`EngFullName`,`CurrencyID`,`EngShortName`,`ChiefName`,`PersonID`,`LinkMan`,`TaxNo`,`Telephone1`,`Capitalization`,`Telephone2`,`IndustrialClass`,`Telephone3`,`Email`,`MobileTel`,`WebAddress`,`BankAccount`,`FaxNo`,`BankID`,`EarliestTradeDate`,`RateOfDiscount`,`FirstTreadeDate`,`PriceRank`,`LatelyTradeDate`,`PriceofTax`,`LatelyReturnDate`,`TransNewID`,`LastVisitDate`,`BuildUpDate`,`BookVisitDate`,`InvalidDate`,`AmountQuota`,`StartAdvRecv`,`RemainQuota`,`StartReceivable`,`RecvWay`,`CurAdvRecy`,`DayOfClose`,`CurReceivable`,`CreditLevel`,`NotInvQuota`,`InvoTypeID`,`AccAdvRecv`,`AccReceivable`,`AddField1`,`AddField2`,`Memo`) values ('200903K00001','200903K00001','株洲伟大电脑有限公司','代理商','株洲伟大','华中区',NULL,'人民币',NULL,NULL,'戴经理',NULL,NULL,NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,100,NULL,'建议售价',NULL,0,NULL,NULL,NULL,'2018-05-05',NULL,NULL,0,0,0,0,'货到',0,'0000-00-00',0,'A',0,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `t_client_masterfile_address` */

DROP TABLE IF EXISTS `t_client_masterfile_address`;

CREATE TABLE `t_client_masterfile_address` (
  `AddrID` int(11) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `ZipCode` varchar(20) NOT NULL,
  `LinkMan` varchar(20) DEFAULT NULL,
  `LinkManProf` varchar(20) DEFAULT NULL,
  `Telephone` varchar(20) DEFAULT NULL,
  `FaxNo` varchar(20) DEFAULT NULL,
  `WalkAddr` varchar(20) DEFAULT NULL,
  `Memo` varchar(20) DEFAULT NULL,
  `AddressID` varchar(20) NOT NULL,
  PRIMARY KEY (`AddrID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_client_masterfile_address` */

insert  into `t_client_masterfile_address`(`AddrID`,`Address`,`ZipCode`,`LinkMan`,`LinkManProf`,`Telephone`,`FaxNo`,`WalkAddr`,`Memo`,`AddressID`) values (1024001,'株洲市天元区黄山路','1056','潘盈安','员工','17673246089',NULL,NULL,NULL,'200903K00001');

/*Table structure for table `t_customer_category` */

DROP TABLE IF EXISTS `t_customer_category`;

CREATE TABLE `t_customer_category` (
  `ClassID` int(11) NOT NULL,
  `ClassName` varchar(20) NOT NULL,
  `EngName` varchar(20) NOT NULL,
  `Memo` varchar(20) DEFAULT NULL,
  `ClassNameID` varchar(20) NOT NULL,
  PRIMARY KEY (`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_customer_category` */

/*Table structure for table `t_inquiry_content` */

DROP TABLE IF EXISTS `t_inquiry_content`;

CREATE TABLE `t_inquiry_content` (
  `SerID` int(11) NOT NULL AUTO_INCREMENT,
  `ProdID` varchar(20) NOT NULL,
  `ProdName` varchar(20) NOT NULL,
  `ProdSize` varchar(20) DEFAULT NULL,
  `Sunit` varchar(20) NOT NULL,
  `sQuantity` int(11) NOT NULL,
  `OldPrice` float NOT NULL,
  `Discount` float NOT NULL,
  `sParic` float NOT NULL,
  `Amount` float NOT NULL,
  `PrdBusiTaxRate` float NOT NULL,
  `TaxAmt` float NOT NULL,
  `VFTotal` float NOT NULL,
  `IsGift` int(11) NOT NULL,
  `TranType` varchar(20) DEFAULT NULL,
  `FromNO` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SerID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_inquiry_content` */

insert  into `t_inquiry_content`(`SerID`,`ProdID`,`ProdName`,`ProdSize`,`Sunit`,`sQuantity`,`OldPrice`,`Discount`,`sParic`,`Amount`,`PrdBusiTaxRate`,`TaxAmt`,`VFTotal`,`IsGift`,`TranType`,`FromNO`) values (1,'C02-W-HP-GS917AA-AB2','HP L1710 (17\"LCD,VGA',NULL,'PCS',1,990,100,990,990,17,168.3,1158.3,0,NULL,NULL),(2,'C01-W-HP-DC7900-307','HP DC7900CMT-NA307PA',NULL,'PCS',1,3370,100,3370,3370,17,572.9,3942.9,0,NULL,NULL);

/*Table structure for table `t_potential_client_master_file` */

DROP TABLE IF EXISTS `t_potential_client_master_file`;

CREATE TABLE `t_potential_client_master_file` (
  `ID` varchar(20) NOT NULL,
  `CustIntro` varchar(20) DEFAULT NULL,
  `FullName` varchar(20) NOT NULL,
  `ClazzID` varchar(20) NOT NULL,
  `ShortName` varchar(20) NOT NULL,
  `AreaID` varchar(20) NOT NULL,
  `EngShortName` varchar(20) DEFAULT NULL,
  `CurrencyID` varchar(20) NOT NULL,
  `LevelID` varchar(20) DEFAULT NULL,
  `BeginStageDate` date DEFAULT NULL,
  `Efficiency` float DEFAULT NULL,
  `BargainAmt` float DEFAULT NULL,
  `PersonID` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_potential_client_master_file` */

/*Table structure for table `t_potential_client_master_file_address` */

DROP TABLE IF EXISTS `t_potential_client_master_file_address`;

CREATE TABLE `t_potential_client_master_file_address` (
  `AddrID` varchar(20) NOT NULL,
  `Address` varchar(20) DEFAULT NULL,
  `ZipCode` varchar(20) DEFAULT NULL,
  `LinkMan` varchar(20) DEFAULT NULL,
  `LinkManProf` varchar(20) DEFAULT NULL,
  `Telephone` varchar(20) DEFAULT NULL,
  `FaxNo` varchar(20) DEFAULT NULL,
  `WalkAddr` varchar(20) DEFAULT NULL,
  `Memo` varchar(20) DEFAULT NULL,
  `AddressID` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AddrID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_potential_client_master_file_address` */

/*Table structure for table `t_potential_client_master_file_requirements` */

DROP TABLE IF EXISTS `t_potential_client_master_file_requirements`;

CREATE TABLE `t_potential_client_master_file_requirements` (
  `SerNO` varchar(20) NOT NULL,
  `ProdID` varchar(20) NOT NULL,
  `ProdName` varchar(20) NOT NULL,
  `ProdSize` varchar(20) NOT NULL,
  `StdUnitName` varchar(20) DEFAULT NULL,
  `DemandQty` int(11) DEFAULT NULL,
  `EndureAmt` float DEFAULT NULL,
  `EngageAmt` float DEFAULT NULL,
  `IsQuoteAmt` float DEFAULT NULL,
  `EstStockOutDate` date DEFAULT NULL,
  `Memo` varchar(50) DEFAULT NULL,
  `CustIntroID` varchar(20) NOT NULL,
  PRIMARY KEY (`SerNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_potential_client_master_file_requirements` */

/*Table structure for table `t_purchase_inquiry` */

DROP TABLE IF EXISTS `t_purchase_inquiry`;

CREATE TABLE `t_purchase_inquiry` (
  `Billno` varchar(20) NOT NULL,
  `BillDate` date NOT NULL,
  `CustomerID` varchar(20) NOT NULL,
  `CustAddress` varchar(20) DEFAULT NULL,
  `ValidDate` date DEFAULT NULL,
  `CurrID` varchar(20) NOT NULL,
  `PriceOfTax` int(11) NOT NULL,
  `ExchRate` varchar(20) NOT NULL,
  `OutAddress` varchar(20) DEFAULT NULL,
  `Maker` varchar(20) NOT NULL,
  `SalesName` varchar(20) NOT NULL,
  `Permitter` varchar(20) NOT NULL,
  `DepartID` varchar(20) NOT NULL,
  `HeaderID` varchar(50) DEFAULT NULL,
  `UserDef1` varchar(50) DEFAULT NULL,
  `FooterID` varchar(50) DEFAULT NULL,
  `UserDef2` varchar(50) DEFAULT NULL,
  `Remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Billno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_purchase_inquiry` */

insert  into `t_purchase_inquiry`(`Billno`,`BillDate`,`CustomerID`,`CustAddress`,`ValidDate`,`CurrID`,`PriceOfTax`,`ExchRate`,`OutAddress`,`Maker`,`SalesName`,`Permitter`,`DepartID`,`HeaderID`,`UserDef1`,`FooterID`,`UserDef2`,`Remark`) values ('2018050501','2018-05-05','上海佳杰',NULL,NULL,'人民币',0,'1.0000',NULL,'admin','牛采购','admin','采购部',NULL,NULL,NULL,NULL,NULL),('2018050502','2018-05-05','长沙新良',NULL,NULL,'人民币',0,'1.0000',NULL,'admin','林副总','admin','综合管理部',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `t_vendor_masterfile` */

DROP TABLE IF EXISTS `t_vendor_masterfile`;

CREATE TABLE `t_vendor_masterfile` (
  `ID` varchar(20) NOT NULL,
  `FundsAttribution` varchar(20) NOT NULL,
  `FullName` varchar(20) NOT NULL,
  `ClassID` varchar(20) NOT NULL,
  `ShortName` varchar(20) NOT NULL,
  `AreaID` varchar(20) DEFAULT NULL,
  `EngFullName` varchar(20) DEFAULT NULL,
  `CurrencyID` varchar(20) DEFAULT NULL,
  `EngShortName` varchar(20) DEFAULT NULL,
  `ChiefName` varchar(20) DEFAULT NULL,
  `PersonID` varchar(20) NOT NULL,
  `LinkMan` varchar(20) DEFAULT NULL,
  `TaxNo` varchar(20) DEFAULT NULL,
  `Telephone1` varchar(20) DEFAULT NULL,
  `Capitalization` varchar(20) DEFAULT NULL,
  `Telephone2` varchar(20) DEFAULT NULL,
  `IndustrialClass` varchar(20) DEFAULT NULL,
  `Telephone3` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `MobileTel` varchar(20) DEFAULT NULL,
  `WebAddress` varchar(20) DEFAULT NULL,
  `BankAccount` varchar(20) DEFAULT NULL,
  `FaxNo` varchar(20) DEFAULT NULL,
  `BankID` varchar(20) DEFAULT NULL,
  `EarliestTradeDate` date DEFAULT NULL,
  `FirstTreadeDate` date DEFAULT NULL,
  `LatelyTradeDate` date DEFAULT NULL,
  `LatelyReturnDate` date DEFAULT NULL,
  `PriceofTax` int(11) NOT NULL,
  `InvalidDate` date DEFAULT NULL,
  `AmountQuota` float DEFAULT NULL,
  `StartAdvRecv` float DEFAULT NULL,
  `RemainQuota` float NOT NULL,
  `StartReceivable` float NOT NULL,
  `RecvWay` varchar(20) NOT NULL,
  `CurAdvRecy` float NOT NULL,
  `DayOfClose` date NOT NULL,
  `CurReceivable` float NOT NULL,
  `CreditLevel` varchar(20) NOT NULL,
  `NotInvQuota` float NOT NULL,
  `InvoTypeID` varchar(20) DEFAULT NULL,
  `AccAdvRecv` varchar(20) DEFAULT NULL,
  `AccReceivable` varchar(20) DEFAULT NULL,
  `AccReceivableTemp` varchar(20) DEFAULT NULL,
  `AddField1` varchar(20) DEFAULT NULL,
  `AddField2` varchar(20) DEFAULT NULL,
  `Memo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_vendor_masterfile` */

insert  into `t_vendor_masterfile`(`ID`,`FundsAttribution`,`FullName`,`ClassID`,`ShortName`,`AreaID`,`EngFullName`,`CurrencyID`,`EngShortName`,`ChiefName`,`PersonID`,`LinkMan`,`TaxNo`,`Telephone1`,`Capitalization`,`Telephone2`,`IndustrialClass`,`Telephone3`,`Email`,`MobileTel`,`WebAddress`,`BankAccount`,`FaxNo`,`BankID`,`EarliestTradeDate`,`FirstTreadeDate`,`LatelyTradeDate`,`LatelyReturnDate`,`PriceofTax`,`InvalidDate`,`AmountQuota`,`StartAdvRecv`,`RemainQuota`,`StartReceivable`,`RecvWay`,`CurAdvRecy`,`DayOfClose`,`CurReceivable`,`CreditLevel`,`NotInvQuota`,`InvoTypeID`,`AccAdvRecv`,`AccReceivable`,`AccReceivableTemp`,`AddField1`,`AddField2`,`Memo`) values ('CSXL','CSXL','长沙新良电脑有限公司','委外厂','长沙新良',NULL,NULL,'人民币',NULL,NULL,'欧经理',NULL,NULL,NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,0,0,0,0,'货到',0,'0000-00-00',0,'A',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `t_vendor_masterfile_address` */

DROP TABLE IF EXISTS `t_vendor_masterfile_address`;

CREATE TABLE `t_vendor_masterfile_address` (
  `AddrID` int(11) NOT NULL,
  `Address` varchar(20) NOT NULL,
  `ZipCode` varchar(20) NOT NULL,
  `LinkMan` varchar(20) DEFAULT NULL,
  `LinkManProf` varchar(20) DEFAULT NULL,
  `Telephone` varchar(20) DEFAULT NULL,
  `FaxNo` varchar(20) DEFAULT NULL,
  `WalkAddr` varchar(20) DEFAULT NULL,
  `Memo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`AddrID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_vendor_masterfile_address` */

insert  into `t_vendor_masterfile_address`(`AddrID`,`Address`,`ZipCode`,`LinkMan`,`LinkManProf`,`Telephone`,`FaxNo`,`WalkAddr`,`Memo`) values (1024001,'株洲市天元区黄山路','1026','潘盈安','员工','17673246089',NULL,NULL,NULL);

/*Table structure for table `takeprepay` */

DROP TABLE IF EXISTS `takeprepay`;

CREATE TABLE `takeprepay` (
  `Qy_ID` varchar(11) NOT NULL COMMENT '应付款单单号  不显示(外键)',
  `MoneyPayableID` varchar(11) DEFAULT NULL COMMENT '应付冲款单号(来源于预付款单',
  `SourceName` varchar(10) DEFAULT NULL COMMENT '来源别(默认是采购订单',
  `SourceID` varchar(11) DEFAULT NULL COMMENT '来源单号(来源于采购订单单号',
  `CurpreRecv` double(19,4) DEFAULT NULL COMMENT '预付余额(跟采购订单一起带入的，是采购订单的订单总金额，即含税金额',
  `DepartID` int(11) DEFAULT NULL COMMENT '部门编号',
  `DepartName` varchar(25) DEFAULT NULL COMMENT '部门名称',
  `OrigprepayUsed` double(19,4) DEFAULT NULL COMMENT '取用预付金额(手动填写，但金额<=预付余额',
  `Remark` varchar(100) DEFAULT NULL COMMENT '来源摘要(注释该条明细记录，是由预付款单带入的',
  PRIMARY KEY (`Qy_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `takeprepay` */

/*Table structure for table `warehouse` */

DROP TABLE IF EXISTS `warehouse`;

CREATE TABLE `warehouse` (
  `id` int(11) NOT NULL,
  `BianHao` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `LianXiDianHuai` varchar(50) DEFAULT NULL,
  `CangKuDiZhi` varchar(50) DEFAULT NULL,
  `BeiZhu` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `warehouse` */

insert  into `warehouse`(`id`,`BianHao`,`Name`,`LianXiDianHuai`,`CangKuDiZhi`,`BeiZhu`) values (1,'001','神州仓库','kbz','株洲','BeiZhu'),(2,'002','kbz仓库','kbz','株洲','BeiZhu');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
