/*
SQLyog Ultimate v12.4.0 (64 bit)
MySQL - 10.1.16-MariaDB : Database - apriori_toko
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`apriori_toko` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `apriori_toko`;

/*Table structure for table `confidence` */

DROP TABLE IF EXISTS `confidence`;

CREATE TABLE `confidence` (
  `kombinasi1` varchar(255) DEFAULT NULL,
  `kombinasi2` varchar(255) DEFAULT NULL,
  `support_xUy` double DEFAULT NULL,
  `support_x` double DEFAULT NULL,
  `confidence` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `min_support` double DEFAULT NULL,
  `min_confidence` double DEFAULT NULL,
  `nilai_uji_lift` double DEFAULT NULL,
  `korelasi_rule` varchar(100) DEFAULT NULL,
  `id_process` int(11) NOT NULL DEFAULT '0',
  `jumlah_a` int(11) DEFAULT NULL,
  `jumlah_b` int(11) DEFAULT NULL,
  `jumlah_ab` int(11) DEFAULT NULL,
  `px` double DEFAULT NULL,
  `py` double DEFAULT NULL,
  `pxuy` double DEFAULT NULL,
    `from_itemset` int(11) DEFAULT NULL COMMENT 'dari itemset 2/3'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `confidence` */

/*Table structure for table `itemset1` */

DROP TABLE IF EXISTS `itemset1`;

CREATE TABLE `itemset1` (
  `atribut` varchar(200) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `id_process` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `itemset1` */

/*Table structure for table `itemset2` */

DROP TABLE IF EXISTS `itemset2`;

CREATE TABLE `itemset2` (
  `atribut1` varchar(200) DEFAULT NULL,
  `atribut2` varchar(200) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `id_process` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `itemset2` */

/*Table structure for table `itemset3` */

DROP TABLE IF EXISTS `itemset3`;

CREATE TABLE `itemset3` (
  `atribut1` varchar(200) DEFAULT NULL,
  `atribut2` varchar(200) DEFAULT NULL,
  `atribut3` varchar(200) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `support` double DEFAULT NULL,
  `lolos` tinyint(4) DEFAULT NULL,
  `id_process` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `itemset3` */

/*Table structure for table `process_log` */

DROP TABLE IF EXISTS `process_log`;

CREATE TABLE `process_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `min_support` double DEFAULT NULL,
  `min_confidence` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `process_log` */

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_date` date DEFAULT NULL,
  `produk` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=271 DEFAULT CHARSET=latin1;

/*Data for the table `transaksi` */

insert  into `transaksi`(`id`,`transaction_date`,`produk`) values 

(1,'2015-06-01','nipple pigeon L,nipple ninio,mamamia L36,sweety FP XL34'),

(2,'2015-06-02','cuuson hair lotion,cutton buds huki,nipple pigeon L,happy nappy pant M20,nipple ninio,popoku pant M10,sweety FP XL34,sgm soya 3 van 400,bendera cair coklat botol,bendera cair straw kotak,tempat makan pang-pang'),

(3,'2015-06-03','zwitsal shampoo 300,mpoko pant standart L30,sweety FP L36,sgm soya 2 200,bendera cair coklat kotak,bendera cair straw botol,bendera cair straw kotak'),

(4,'2015-06-04','zwitsal soap milk & hiney 80,bendera cair straw kotak,happy nappy M8,bendera cair coklat kotak,cd cowok'),

(5,'2015-06-05','zwitsal powder MH & SF 300,zwitsal soap milk & hiney 80,bendera cair straw botol,sgm soya 4 400,bendera cair coklat botol,bendera cair coklat kotak'),

(6,'2015-06-06','cusson hair lotion,cuttob buds hki,niple pigeon L,dot huki 250,popoku pant L10,cutton buds huki,mpoko pant standart L20,cutton buds huki,mpoko pant standart L30,sayangku M72,mitu tissue basah,cutton buds huki,happy nappy L20,bendera cair coklat botol,happy nappy pant M20,sweety FP XL34,bendera cair coklat kotak,underpad,sgm soya 3 van 400'),

(7,'2015-06-07','cusson hair lotion,cutton buds huki,mpko pant standart L30,bendera cair straw kotak,sweety FP XXL20,fluffy L16,bendera cair coklat kotak,tissue passeo,mitu tissue basah'),

(8,'2015-06-08','cussons shampoo alomnd'),

(9,'2015-06-09','cussons baby bath,cusson hair lotion,cutton buds huki,niple pigeon L,nipple ninio,mpoko xtradry XXL28,sweety FP L36,bendera cair coklat kotak,sweety Fp XL34,bendera cair straw kotak,mitu tissue basah,sgm soya 4 400,bendera cair coklat botol,tempat makan pang-pang'),

(10,'2015-06-10','cusson baby bath,bendera cair coklat kotak,dot huki 250,bendera cair coklat botol,pampers AB XL34,sweety FP L36,bendera cair straw kotak,sgm 3 plus van 400,tempat makan pang-pang'),

(11,'2015-06-11','sayangku M72,sweety FP S20,bendera cair coklat kotak,bendera cair straw kotak'),

(12,'2015-06-12','cusson hair lotion,sleek refil,cutton buds huki,sayangku XL28,mitu tissue basah,sweety FP S10,bendera cair coklat kotak,cd cowok'),

(13,'2015-06-13','cusson hair lotion,niple pigeon L,zwitsal baby bath 2 in 1 200,cutton buds huki,mpoko pant standart M34,happy nappy L20,happy nappy pant M20,cd cowok,sweety Fp XXL18,bendera cair coklat kotak,sgm soya 4 400,bendera cair coklat botol,mitu tissue basah,bendera cair straw kotak'),

(14,'2015-06-14','CB powder  pink 50,sleek refil,sabun dettol sensitive,mkp konicare 125,bendera cair straw kotak,mpoko pant standart S40,bendera cair coklat kotak'),

(15,'2015-06-15','sweety FP XXL18,mamamia L36,bendera cair coklat botol'),

(16,'2015-06-16','cusson hair lotion,zwitsal soap milk & hiney 80,nipple ninio,cutton buds huki,popoku pant M10,popoku pant L10,mpoko xtradry XXL28,sweety FP XL34,tissue passeo'),

(17,'2015-06-17','bendera cair coklat kotak,bendera cair straw botol,bendera cair straw kotak'),

(18,'2015-06-18','cussons shampoo alomnd,tissue passeo,sleek refil,popoku M40'),

(19,'2015-06-19','mpoko pant standart XXL18,cd cowok,sweety FP XXL18,bendera cair coklat botol'),

(20,'2015-06-20','cusson hair lotion,nipple ninio,cutton buds huki,niple pigeon L,mpoko xtradry XXL28,happy nappy pant M20,sweety sns S12,sweety FP S10,sgm soya 4 400,sweety FP L36,sweety FP XL34,sweety FP XXL18,sgm soya 3 van 400,bendera cair coklat botol'),

(21,'2015-06-21','sleek refil,sgm soya 4 400'),

(22,'2015-06-22','nutrillon ryl 3 van 400,bendera cair coklat kotak,underpad,sweety FP L36,bendera cair straw kotak,happy nappy pant L8'),

(23,'2015-06-23','sgm soya 2 200,mamamia pant M18,sweety FP XL34,cusson hair lotion,popoku pant M10,nipple ninio,pasta gigi cussons'),

(24,'2015-06-24','sikat gigi kodomo,sweety FP L36,zwitsal soap milk & hiney 80,dot huki 250,cusson baby bath,zwitsal powder MH & SF 300,zwitsal baby bath MH 200'),

(25,'2015-06-25','mitu tissue basah,bendera cair coklat botol,cutton buds huki,sweety FP L36,sayangku M36,mpoko pant standart L30,milna bubur ayam wortel,cusson hair lotion'),

(26,'2015-06-26','topy baby,atasan libby,cd cewek,bendera cair coklat kotak,cd cowok,bendera cair straw kotak,zwitsal powder zink 300'),

(27,'2015-06-27','kaos kaki ideal,tempat makan pang-pang,pampers pant AB M44,mpoko pant standart L30,sweety sns M40,sweety FP S10'),

(28,'2015-06-28','pasta gigi cussons'),

(29,'2015-06-29','sikat botol yuki,kaos libby L,tissue passeo,mitu tissue ,basah,bendera cair coklat botol,sgm soya 4 400,swety FP XXL18,sweety FP L36,sweeety Fp S10,cutton buds huki,happy nappy pant XL20,happy nappy pant M20,popoku pant L10,dot huki 250,sleek refil,zwitsal shampo 300,zwitsal baby bath MH 200'),

(30,'2015-06-30','kaos kaki ideal,bendera cair coklat botol,bendera cair straw kotak,bendera cair coklat kotak,bendera cair straw botol,sgm soya 3 van 400,happy nappy pant M20,my baby telon plus,zwitsal shampoo 300'),

(31,'2015-07-01','bendera cair straw kotak,bendera cair coklat kotak,sweety FP L36,bendera cair coklat botol,sgm soya 3 van 400,sweety Fp S10,happy nappy pant M20,zwitsal baby bath MT 200,mpoko pant standart L30,pasta gigi cussons'),

(32,'2015-07-02','sgm soya 3 van 400,sweety FP XL34,cusson hair lotion,sweety FP L36,zwitsal baby bath MT 200,Sweety FP S20,cutton buds huki,sweety sns M40,JB cologne summer swing,nipple pigeon L'),

(33,'2015-07-03','sweety FP XXL18,sweety FP XL34,sweety FP L36,JB cologne summer swing,cutton buds huki,niple pigeon L,cussons shampoo alomnd,cusson hair lotion'),

(34,'2015-07-04','kaos libby L,tissue passeo,sgm soya 2 200,zwitsal baby bath 2 in 1 200'),

(35,'2015-07-05','bendera cair coklat botol,sgm soya 4 400,sweety Fp L36'),

(36,'2015-07-06','sgm soya 4 400,nutrillon soya 4 van 400,mamamia XL20,happy nappy pant XL20,popoku pant M10,sleek refil'),

(37,'2015-07-07','bendera cair straw kotak,bendera cair coklat kotak,mamamia L36,sweety FP XL34,cusson hair lotion,happy nappy pant XL20,zwitsal powder MH & SF 300'),

(38,'2015-07-08','mitu tissue basah,pasta gigi cussons,cutton buds huki,popoku pant M10,bendera cair coklat botol,happy nappy S10,sweety FP S10'),

(39,'2015-07-09','cd cewek,sgm soya 4 400,sayangku XL28,dot huki 250'),

(40,'2015-07-10','bendera cair straw kotak,sgm soya 3 van 400,bendera cair coklat botol,bendera cair coklat kotak,sgm soya 4 400'),

(41,'2015-07-11','underpad,bendera cair coklat botol,sweety FP XL34,cusson hair lotion,mpoko xtradry XXL28,nipple ninio,sabun dettol sensitive'),

(42,'2015-07-12','dot huki,cd cowok,bendera cair straw kotak,bendera cair straw botol,bendera cair coklat botol,sweety FP XL34,sgm soya 3 van 400,bendera cair coklat kotak,sweety FP L36,zwitsal shampoo AVKS 100,sweety FP S10,nipple ninio,cutton buds huki,cusson hair lotion,cussons baby powder'),

(43,'2015-07-13','tempat makan pang-pang,bendera cair coklat botol,sgm soya 3 van 400,sweety FP S10,popoku pant M10,nipple ninio,zwitsal shampoo AVKS 100'),

(44,'2015-07-14','bendera cair coklat kotak,mamamia L36,mpoko Xtradry XXL28,cutton buds huki,cusson hair lotion'),

(45,'2015-07-15','cd cowok,tissue passeo,bendera cair coklat kotak,bendera cair straw kotak,dot huki 250,bendera cair coklat botol,mamamia XL20,bendera cair straw kotak,dot huki 250,happy nappy XL20,happy nappy S10,cusson powder soft & smooth 50'),

(46,'2015-07-16','sikat gigi kodomo,nina night,bendera cair straw kotak,mkp caplang 60,bendera cair coklat kotak,syaangku XL28,popoku pant M10'),

(47,'2015-07-17','bendera cair straw botol,bendera cair coklat kotak'),

(48,'2015-07-18','bendera cair straw botol,bendera cair coklat kotak,bendera cair coklat botol,sgm soya 3 van 400,mpoko pant standart L30,pasat gigi cussons'),

(49,'2015-07-19','bendera cair straw botol,bendera cair coklat kotak,bendera cair coklat botol,sweety Fp XL34,sweety FP L36,happy nappy pant L8,happy nappy L20,pampers pant AB L58,nipple ninio,cusson hair lotion'),

(50,'2015-07-20','bendera cair straw botol,bendera cair coklat botol,bendera cair straw kotak,bendera cair coklat kotak,sgm soya 3 van 400,sweety FP L36,mpoko pant standart L30,mpoko pant standart M34,pasat gigi cussons'),

(51,'2015-07-21','kaos kaki ideal,nina night,sikat botol yuki,mitu tissue basah,mpoko pant standart M34,cusson hair lotion,cutton buds huki,dot huki 250,sweety FP XL34'),

(52,'2015-07-22','bendera cair straw botol,bendera cair coklat botol,sgm soya 3 van 400,mamamia pant M18,sweety FP XL34,sayangku M72,nipple ninio,sabun dettol sensitive,zwitsal soap milk & hiney 80,cusson hair lotion'),

(53,'2015-07-23','bendera cair straw botol,bendera cair coklat kotak,mamamia L36,happy nappy pant L8,sayangku M72'),

(54,'2015-07-24','bendera cair coklat kotak,sgm soya 3 van 400,sweety FP XL34,cusson hair lotion,pasta gigi cussons,nipple ninio,popoku pant M10,popoku pant L10,mpoko pant standart M34,happy nappy pant M20,happy nappy pant L8,happy nappy pant XL20'),

(55,'2015-07-25','sikat gigi kodomo,cd cewek,mitu tissue basah,bendera cair coklat botol,sweety FP XL34,happy nappy pant XL20,sayangku XL28,nipple ninio,cutton buds huki,zwitsal baby bath MT 200,zwitsal shampoo AVKS 100,zwitsal shampoo 300'),

(56,'2015-07-26','kaos kaki ideal,mitu tissue basah,bendera cair straw kotak,bendera cair coklat kotak,bendera cair straw botol,bendera cair coklat botol,happy nappy pant XL20,mpoko xtradry XXL28,nipple ninio,cutton buds huki,zwitsal baby bath MT 200,zwitsal hair lotion 200,zwitsal shampoo AVKS 100,zwitsal shampoo 300,cusson hair lotion,sweety FP XL34'),

(57,'2015-07-27','kaos kaki ideal,cd cewek,tissue passeo,bendera cair coklat botol,sgm soya 2 200,happy nappy diapers M20,happy nappy L20,popoku pant M10,popoku pant L10,sleek refil'),

(58,'2015-07-28','kaos libby L,tempat makan pang-pang,Dr P basic L8,sgm soya 3 van 400,nutrillon ryl 4 md 400,mamamia L36,mamamia XL20,mamamia pant M18,mamamia M10,happy nappy pant M20,mkp konicare 125,happy nappy pant L8,mpoko Xtradry XXL28,cutton buds huki,minyak telon lang 30,sleek refil,cusson hair lotion,zwitsal baby bath MT 200,zwitsal hair lotion 200'),

(59,'2015-07-29','DR p diapers M2,DR p basic L8,sgm 5 md 400,sgm ananda 2 150,bebelac 4 van 800,chilkid reg van 800,nutrlon 3 van 800,sweety FP S20,mpoko xtradry S50,merries L20'),

(60,'2015-07-30','sikat gigi kodomo,dot huki,kaos libby L,kaos kaki ideal,dancow 3 plus md 800,nutrillon soya 4 van 400,nutrillon ryl 3 van 800,sun beras merah,happy nappy S10,mpoko xtradry L40,mpoko pant standart XXL24,popoku pant XL20,mkp caplang 120,zwitsal baby bath 2 in 1 200'),

(61,'2015-08-01','tissue passeo,Dr p basic L8,bendera cair coklat kotak,bendera cair coklat botol,hilo joint,mamamia L36,happy nappy M20,happy nappy M8,mpoko xtradry XXL28,huki niple L,cutton buds huki,sun beras merah,sabun dettol sensitive,cusson hair lotion,Dr p basic M10'),

(62,'2015-08-02','sgm 3 plus md 900,sgm 3 plus van 400,milo 3 in 1 1000,mpoko pant standart M34,popoku diapers M20,JB cologne fresh blossoms 300,zwitsal powder pink 300,zwitsal powder MH & SF 300'),

(63,'2015-08-03','tempat makan pang-pang,topy baby,atasan libby,cd cewek,underpad baby,Dr p diapers M2,sgm 3 plus van 400,lactogen 4 van 750,sweety sns S27,pampers pant AB M44,merries Xl26,huki niple L'),

(64,'2015-08-04','tissue passeo,bendera cair straw kotak,happy nappy pant L8,happy nappy L20,cusson baby oil'),

(65,'2015-08-05','kaos baby M,bendera cair straw kotak,kaos libby L,mitu tissue basah,sweety FP M38'),

(66,'2015-08-06','kaos kaki ideal,cd cewek,bendera cair straw botol,tissue passeo,bendera cair straw kotak,bendera cair coklat botol,lactogen 4 van 750,sweety FP XXL20,sweety FP XL34,popoku pant XL20,pamper AB XL34,botol susu huki 120,nipple ninio,cutton buds huki,cusson baby powder,cusson hair lotion'),

(67,'2015-08-07','nina night,mitu tissue basah,bendera cair straw kotak.sgm soya 3 van 400,bendera cair coklat botol,sgm soya 4 400,sweety FP XXL20,sweety FP XL34,happy nappy pant M20,milna bubur ayam wortel,cusson hair lotion'),

(68,'2015-08-08','bendera cair straw botol,dancow batita madu 1000,mpoko pant standart L30'),

(69,'2015-08-09','tempat makan pang-pang,tissue passeo,mitu tissue basah,bendera cair straw kotak,sgm soya 3 van 400,cutton buds huki,happy nappy pant L8,milna bubur pisang'),

(70,'2015-08-10','nina night,tissue passeo,bendera cair coklat kotak,bendera air coklat botol,sgm soya 3 van 400,sgm 3 plus van 400,lactogen 4 van 750,happy nappy pant M20,happy nappy XL20'),

(71,'2015-08-11','bendera cair coklat kotak,v-vresh roll,happy nappy L20,sayangku M72,milna bubur ayam wortel'),

(72,'2015-08-12','sikat botol yuki,tissue passeo,underpad,merries Xl26,nipple ninio,sleek refil,cusson hair lotion,sweety FP Xl34,lactogen 4 van 750'),

(73,'2015-08-13','bendera cair coklat kotak,dancow batita md 1000,dancow 5 plus van 800,sweety FP XL34,nipple ninio,zwitsal soap milk & hiney 80,cusson hair lotion,cusson baby powder,tissue passeo,happy nappy L20,mpoko pant standart L20'),

(74,'2015-08-14','cusson baby powder,tissue passeo,milna bubur pisang,mpoko pant standart L20,happy nappy L20'),

(75,'2015-08-15','lactogen 4 van 750,sweety FP L36,sweety FP M38,sweety FP S20,mpoko pant standart L34,merries L20,cusson baby powder,cusson shampoo alomnd'),

(76,'2015-08-16','tissue passeo,underpad,bendera cair coklat botol,bendera cair coklat botol,bendera cair coklat kotak,bendera cair straw kotak,zwitsal powder MH & SF 300,sgm soya 3 van 400,lactogen 4 van 750,popoku pant M10'),

(77,'2015-08-17','kaos kaki ideal,tissue passeo,bendera cair coklat kotak,bendera cair straw kotak,sgm soya 3 van 400,lactogen 3 md 750,sweety FP L36,happy nappy pant M20,niple pigeon L,milna bubur ayam wortel,cusson hair lotion'),

(78,'2015-08-18','bendera cair coklat botol,fluffy L16,popoku pant L20,v-fresh roll'),

(79,'2015-08-19','mitu tissue  basah,happy nappy pant XL20'),

(80,'2015-08-20','sikat gigi kodomo,tissue passeo,bendera cair coklat botol,sgm 3 plus van 400,sweety FP XL34,happy nappy pant L20,happy nappy pant XL20,pampers AB XL34,nipple ninio,cusson baby powder,cusson hair lotion'),

(81,'2015-08-21','nina night,sikat botol yuki,mamamia L36,happy nappy L20,happy nappy M20'),

(82,'2015-08-22','dot huki,bendera cair coklat botol,sgm soya 3 van 400,sgm soya 4 400,sweety FP Xl34,sweety FP M38,happy nappy pant L8,happy nappy M20,mpoko pant standart L30,zwitsal baby bath MT 200,cusson hair lotion'),

(83,'2015-08-23','dot huki,bendera cair straw botol,sgm soya 4 400,happy nappy M20,sayangku M72,popoku L20,cutton buds huki,zwitsal soap milk & hiney 80,zwitsal powder zink 300,cusson baby powder,cusson hair lotion'),

(84,'2015-08-24','underpad,bendera cair straw botol,dancow batita md 1000,sgm soya 3 van 400,sgm soya 4 400,sweety FP S10,sweety sns L36,happy nappy pant L8,popoku pant L20'),

(85,'2015-08-25','bendera cair coklat botol,bendera cair coklat kotak,sgm soya 4 400,sweety FP S20,lactogen 4 van 750'),

(86,'2015-08-26','bendera cair coklat kotak,sayangku M36,zwitsal powder MH & SF 300'),

(87,'2015-08-27','tissue passeo,sgm 3 plus van 400,fluffy L16,happy nappy pant L8,happy nappy pant L20,zwitsal powder zink 300,zwitsal powder MH & SF 300,bendera cair straw kotak'),

(88,'2015-08-28','sikat gigi kodomo,bendera cair straw kotak,bendera cair coklat kotak,bendera cair coklat botol,sgm 3 plus van 400,happy nappy L20,mpoko pant standart L30,nipple ninio,pasat gigi cussons'),

(89,'2015-08-29','tempat makan pang-pang,tissue passeo,bendera cair straw kotak,sgm soya 3 van 400,happy nappy pant M20,nipple ninio,zwitsal powder MH & SF 300'),

(90,'2015-08-30','mitu tissue  basah,sgm 3 plus van 400,sweety FP XL34,popoku pant M20,merries Xl26,nipple ninio,cutton buds huki,sabun dettol sensitive,zwitsal soap milk & hiney 80,zwitsal powder MH & SF 300,cusson hair lotion'),

(91,'2015-08-31','tissue passeo,bendera cair coklat botol,dancow 5 plus van 800,sgm 3 plus van 400,sweety FP XXL20,sweety FP Xl34,swety FP L36,sweety FP M38,nipple ninio,nipple pigeon L'),

(92,'2015-09-01','sikat botol yuki,tempat makan pang-pang,bendera cair coklat kotak,tissue passeo,bendera cair coklat botol,sgm 3 plus van 400,happy nappy pant L20,happy nappy pant XL20,happy nappy XL20,popoku pant XL20,zwitsal shampoo 300,cusson baby powder,cusson shampoo alomnd,my baby telon plus'),

(93,'2015-09-02','tissue passeo,bendera cair coklat kotak,sgm 3 plus van 400,happy nappy pant XL20,promina daging brokoli,sweety FP S20'),

(94,'2015-09-03','tempat makan pang-pang,tissue passeo,bendera cair straw botol,sweety FP L36,pampers Ab XL34,sleek refil'),

(95,'2015-09-04','mitu tissue basah,bendera Cir straw kotak,bendera cair coklat kotak,cutton buds huki,nipple pigeon L'),

(96,'2015-09-05','sikat gigi kodomo,bendera cair straw botol,bendera cair straw kotak,dancow 5 plus van 800,sgm 3 plus van 400,zwitsal soap milk & hiney 80,pampers eko pant M20'),

(97,'2015-09-06','bendera cair coklat kotak,bendera cair straw botol,dancow 5 plus van 800,lactogen 4 van 750,sweety FP XXl20,sweety Fp M38,cusson hair lotion'),

(98,'2015-09-07','nina night,bendera cair coklat kotak,happy nappy XL20,bendera cair straw kotak,bendera cair coklat botol,sgm 3 plus van 400,dancow batita md 1000,sgm soya 3 van 400,lactogen 4 van 750,sweety FP Xl34,sweety FP L36,happy nappy pant L8,cusson hair lotion,sweety FP L20,sabun dettol sensitive,happy nappy pant M20,happy nappy L20,JB cologne fresh blossoms 300,merries M34,nipple ninio,zwitsal baby bath 2 in 1 200'),

(99,'2015-09-08','bendera cair coklat botol,bendera cair straw kotak,bendera cair coklat kotak,cusson hair lotion,bendera cair straw botol,sabun dettol sensitive'),

(100,'2015-09-09','mitu tissue basah,bendera Cair coklat kotak,underpad,fluffy L16 ,zwitsal hair lotion 200,sweety Fp Xl34,cutton buds huki,cusson hair lotion,cusson shampoo alomnd'),

(101,'2015-09-10','dot huki,mitu tissue basah,bendera cair coklat kotak,sgm soya 3 van 400,sweety FP XXL20,happy nappy pant M20,mpoko pant standart M34,nipple ninio,cutton buds huki'),

(102,'2015-09-11','bendera cair straw kotak,pasta gigi cussons,Dr p basic L8,bendera cair coklat botol,sweety sns S27,zwitsal baby bath MT 200'),

(103,'2015-09-12','mitu tissue basah,niple ninio,cutton buds huki,bendera cair straw kotak,happy nappy L20,bendera cair coklat kotak ,sgm soya 3 van 400,sgm soya 4 400,chilkid reg van 800,sweety FP XL34,sweety sns S27,happy nappy pant M20,mpoko pant standart XXL18,pasta gigi cusson,zwitsal baby bath MT 200'),

(104,'2015-09-13','dot huki,bendera cair coklat botol,bendera cair straw kotak,pampers AB S14,bendera cair coklat kotak ,merries M22,bendera cair straw botol,nipple ninio,pasta gigi cussons,cusson hair lotion,chilkid reg van 800,sweety FP XL34,pampers pant AB M44'),

(105,'2015-09-14','bendera cair straw kotak,bendera cair coklat kotak,bendera cair coklat botol,sgm 3 plus van 400'),

(106,'2015-09-16','bendera cair coklat kotak ,JB cologne fresh blossoms 300,bendera cair coklat botol,mpoko pant standart L30,sweety FP XXL20,pampers AB S14'),

(107,'2015-09-17','tissue passeo,cutton buds huki,cusson hair lotion,mitu tissue basah,underpad,dancow 5 plus van 800,sweety FP XL34,sweety FP S10'),

(108,'2015-09-18','cd cewek,bendera cair straw botol,sun beras merah,cusson hair lotion,bendera cair coklat botol,sgm soya 4 400,sgm 3 plus van 400,mamamia L36,sweety FP XL34,promina pisang'),

(109,'2015-09-19','mitu tissue basah,bendera Cair coklat kotak,sgm soya 4 400,nipple pigeon L,sweety FP XL34,sweety Fp S20,pampers AB S14,cutton buds huki,cusson hair lotion'),

(110,'2015-09-20','cd cewek,JB cologne fresh blossoms 300,cusson hair lotion,Dr p basic L8,sgm soya 4 400,sweety FP XL34,sweety FP XL20,happy nappy pant XL20,popoku pant XL20,merries XL26'),

(111,'2015-09-21','sgm soya 3 van 400,fluffy L16 ,sweety Fp XXL20,happy nappy pant M20,happy nappy  M20,happy nappy L20,promina daging brokoli,zwitsal shampoo 300,happy nappy M8'),

(112,'2015-09-22','kaos kaki ideal,mitu tissue basah,milna bubur ayam wortel,sgm 3 plus van 400.sleek refil,cusson hair lotion,sweety Fp XL34,sweety sns S27'),

(113,'2015-09-23','bendera cair straw kotak,mpoko pant standart L30,bendera cair coklat kotak ,bendera cair straw botol,sweety FP XL34,bendera cair coklat botol,chilkid reg van 800,happy nappy Xl20,cusson hair lotion'),

(114,'2015-09-24','dot huki,tempat makan pang-pang,zwitsal shampoo 300,kaos kaki ideal,bendera cair coklat kotak,milna bubur pisang,sweety FP XL34,sweety FP S10,cusson hair lotion,cusson shampoo alomnd'),

(115,'2015-09-25','mitu tissue basah,bendera cair coklat botol,sgm soya 3 van 400,sgm 3 plus van 400,sweety FP L36,cusson baby powder,happy nappy pant M20,pampers Ab XL34'),

(116,'2015-09-26','cd cewek,bendera cair coklat botol,mitu tissue basah,underpad,cutton buds huki,sgm 3 plus van 400,niple pigeon L,nipple ninio,biskuit KH'),

(117,'2015-09-27','bendera cair straw botol,bendera cair straw kotak,bendera cair coklatbotol.bendera cair coklat kotak,dancow batita van 500,sweety FP XL34,mpoko pant standart L30,sleek refil,cusson hair lotion'),

(118,'2015-09-29','bendera cair straw botol,dancow batita van 500,mamamia L36,sweety FP L36,mpoko pant standrt L36,popoku L20'),

(119,'2015-09-30','nutrillon ryl 3 md 400,sweety FP L36,sweety Fp L20,sweety sns S12,mpoko pant standart L36,mpoko pant standart M40,mpoko pant standart M34,popoku L20,merries Xl26'),

(120,'2015-10-01','tempat bedak leo,bendera cair straw botol,bendera cair straw kotak,happy nappy pant M20,dancow batita md 1000,bendera cair straw botol,bendera cair straw kotak,happy nappy pant M20,huki niple L,cair coklat kotak,sgm 1 plus van 900,sgm ananda 1 400,bonetto coklat 700,nipple ninio,zwitsal baby bath MH 200,nutrillon 3 van 800,nipple ninio,happy nappy pant L20,mpoko pant standart XXL18,popoku pant Xl20'),

(121,'2015-10-02','bendera cair coklat kotak,bendera cair straw botol,happy nappy pant M20,dancow 3 plus md 800,bendera cair coklat kotak,happy nappy pant M20,huki niple L,milo actigen 300,bendera cair coklat kotak,huki niple L,happy nappy pant M20,lactogen 3 md 750,JB cologne happy berries 125,chilkid reg van 800,chilkid plat van 800,nutrillon soya 3 van 400,nutrillon 4 van 800,mpoko xtradry L40,mpoko pant standart XL36,JB cologne fresh blossoms 300'),

(122,'2015-10-03','sgm soya 3 van 400,bendera cair straw botol,bendera cair coklat kotak,sgm soya 4 400,bendera cair straw botol,bendera cair coklat kotak,sgm 1 1000,bendera karya md 400,mpokp pant standart XL36,bendera cair coklat kotak,nutribaby ryl 2 soya  400,nutrillon  ryl 3 van 800,sweety sns M40,happy nappy pant M20,bendera cair coklat kotak,happy nappy L20,popoku pant Xl20,mkp caplang 120,cerelac ayam bawang,cerelac BM,cerelac KH'),

(123,'2015-10-04','mitu tissue  basah,bendera cair coklat kotak,bendera cair coklat botol,bendera cair straw botol,bendera cair straw kotak,sgm 5 md 400,sgm 1 plus van 900,sgm 1 plus md 900,nutrillon 4 van 800,sweety FP M38,mpoko pant standart XL20,mpoko pant standart L20,popoku L20,nipple pigeon L,minyak telong Lang 100'),

(124,'2015-10-05','sgm 1 plus van 400,BMT reg 800,chilschool reg van 800,nutrillon ryl 4 van 800,sweety FP XXL18,happy nappy S20,mpoko xtrasoft XXL20,mpoko pant standart L30,mkp caplang 210,cussons soap mild & gentle,zwitsal baby bath 2 in 1 200'),

(125,'2015-10-06','huki nipple L,chilschoool reg van 800,BMT reg 800,sgm 1 plus van 400,bendera cair coklat botol,underpad baby'),

(126,'2015-10-07','kaos kaki ideal,bendera cair straw botol,bendera cair cokalt botol,happy nappy pant XL20,sgm soya 4 400,sgm soya 3 van 400,mamamia L36,happy nappy pant M20,huki niple L,bendera cair coklat kotak,happy nappy L20,mpoko pant standart M20,popoku L40,nipple pigeon L,zwitsal hair lotion 200'),

(127,'2015-10-08','kaos kaki ideal,bendera cair straw botol,bendera cair coklat botol,zwitsal hair lotion 200,sgm soya 3 van 400,mamamia L36,happy nappy pant L20,happy nappy pant M20,huki niple L,bendera cair coklat kotak,happy nappy L20,mpoko xtradry XL50,mpoko pant standart M20,popoku L40,niple pigeon L'),

(128,'2015-10-09','bendera ciar coklat botol,sgm soya 4 400,bebelac 3 van 800,jb shampoo soft & shiny 100,sweety sns L36,mkp caplang 120,CB powder pink 50'),

(129,'2015-10-10','sgm soya 4 400,bebelove 1 800,chilkid reg van 800,nutrillon soya 3 van 400,happy nappy pant Xl20,happy nappy XL20,mpoko xtrasoft XXL20,mpoko xtradry Xl50,mpoko xtradry M46,mpoko pant standart L30,popoku pant XL20,cerelac BM'),

(130,'2015-10-11','bendera Cair straw kotak,mpoko pant standart M20,sgm soya 3 van 400,mpoko pant standart XL20,sgm 3 plus van 900,sgm 1 plus van 150,bonetto coklat 700,bendera jelajah md 400,pampers eko pant M20,nutrillon soya 3 van 400,CB powder pink 50,happy nappy pant M20,huki niple L,bendera cair coklat kotak'),

(131,'2015-10-12','mitu tissue basah,bendera cair straw botol,dancow 1 plus md 800,sgm soya 3 van 400,sgm 1 plus van 150,sgm ananda 2 150,chilschool van 800,nutrillon soya 3 van 400,sweety FP XXl18,sweety Fp L36,cutton buds huki,sweety sns L10,mpoko pant standart M20'),

(132,'2015-10-13','sikat gigi kodomo,underpad baby,bendera cair coklat kotak,bendera cair straw botol,bendera cair straw kotak,sgm soya 3 van 400,sgm 3 plus van 400,sgm 1 plus van 400,bebelac 4 van 800,chilschool van 800,chilschool van reg 800,nutrillon soya 3 van 400,milo 3 in 1 1000,sweety FP S10,happy nappy pant M20,bendera cair coklat kotak,mpoko pant standart XXL24,mpoko pant standart M20,mkp konicare 125'),

(133,'2015-10-14','underpad baby,sweety Fp L36,happy nappy pant L20,popoku pant Xl20,mpoko pant standart S20'),

(134,'2015-10-15','bendera cair coklat kotak,bendera cair straw botol,sgm 1 plus van 150,happy nappy pant L20,happy nappy L20,mpoko pant standart XL20,popoku pant M20,popoku S10'),

(135,'2015-10-16','bendera cair coklat kotak,sgm 1 plus van 150,lactogen 3 md 750,lactogen 1 750,chilschool van reg 800,sweety FP XL20,sweety FP L20,sweety FP S20,mpoko pant standart XL20,mpoko pant standart M20,pampers eko pant M20,huki nipple L,JB cologne happy berries 125,zwitsal shampoo AVKS 100'),

(136,'2015-10-17','bendera cair straw botol,sgm 1 plus van 900,chilschool Vn 800,nutrillon soya 3 van 400,popoku pant M20'),

(137,'2015-10-18','bendera cair cokalt kotak,bendera cair straw kotak,sgm 1 plus md 900,nutrillon ryl soya van 800,mpoko pant standart XL20,nipple ninio,mkp konicare 125'),

(138,'2015-10-19','bendera cair straw botol,bebelac 3 van 800,nutri abby ryl 1 800,lactogen 3 md 750,lactogen 1 350,fluffy L16,sweety FP L36,happy nappy pant S20,pampers eko pant M20,niple pigeon L,nipple ninio,mkp caplang 120,cerelac BM,Jb cologne fresh blossoms 300,mpoko xtrasoft XXL20,mpoko Xtradry L40'),

(139,'2015-10-20','bendera cair straw botol,sgm 1 plus van 150,chilschool van 800,nutrillon 4 van 800,popoku L20,nipple pigeon L,minyak telong Lang 100,huki nipple L,minyak telon lang 60'),

(140,'2015-10-21','underpad baby,nutrillon ryl 4 van 800,mpoko pant standart XL20,mpoko pant standart L30,pampers pant AB M44,v-fresh roll'),

(141,'2015-10-22','sgm soya 3 van 400,sgm soya 4 400,nutrillon soya 3 van 400,nutrillon soya 3 van 800,nutrillon soya 4 van 400,chilkid palt van 800,happy nappy pant M20,huki niple L,bendera cair coklat kotak'),

(142,'2015-10-23','bebelac 3 van 800,mpoko xtrasoft XXL20,mpoko xtradry XL50,mpoko pant standart XL20'),

(143,'2015-10-24','bendera cair coklat kotak,sgm 1 plus md 900,sgm ananda 1 400,bendera jelajah md 400,pampers eko pant M20,happy nappy S20,mpoko pant standart XXl24,huki nipple L,cerelac Ab,cerelac Bm,cerelac KH'),

(144,'2015-10-25','dancow 3 plus md 800,sgm 1 plus md 400,bebelac 3 van 800,bebelac 4 van 800,lactogen 1 750,nutrillon ryl 4 van 800,happy nappy M20,mpoko xtradry XXL28,popoku pant L20,popoku L40,niple pigeon L'),

(145,'2015-10-26','bendera cair coklat kotak,bendera cair straw botol,bendera cair straw kotak,sgm 1 plus md 900,bebelac 3 van 800,mpoko pant standart XXl18,mpoko pant standart Xl20,popoku pant XL20,popoku L40,huki niple L'),

(146,'2015-10-27','underpad baby,bendera cair coklat kotak,bendera cair straw kotak,bendera cair straw botol,sgm 1 plus md 400,milo actigen 30,bendera karya md 400,bebelac 3 van 800,nutrillon soya 3 van 400,popoku pant XL20,zwitsal hari lotion 200,zwitsal baby bath MH 200'),

(147,'2015-10-28','sgm 1 plus md 900,bendera karya md 400,fluffy L16,mpoko xtrasoft XXL20,bendera cair coklat kotak,bendera cair straw botol,mpoko xtradry L40,sgm soya 3 van 400,popoku pant L20'),

(148,'2015-10-29','bendera cair straw kotak,bendera cair coklat botol,sgm soya 3 van 400,sgm 3 plus md 900,bendera jelajah md 400,bebelac 3 van 800,chilkid reg md 800,sweety sns M40,happy nappy pant M20,popoku pant L20'),

(149,'2015-10-30','kaos kaki ideal,sgm soya 4 400,sgm 1 plus md 400,bebelac 3 van 800,nutrillon 3 van 800,nutrillon 3 md 800,nutrillon soya 2 800,nutrillon soya 3 van 400,sweety FP M38,sweety sns L10,mpoko xtradry S50,popoku pant M10,mkp caplang 120,cerelac BM,JB cologne happy berries 125'),

(150,'2015-10-31','sgm soya 4 400,sgm 3 plus md 900,bendera karya md 400,lactogen 3 md 750,nutrillon ryl 4 md 400,sweety sns L36,popoku L40'),

(151,'2015-11-01','mitu tisuh basah,bendera cair coklat kotak,bendera cair coklat botol,bendera cair straw kotak,sgm soya 3 van 400,sgm soya 4 400,sgm 3 plus md 900,beeblove 1 800,lactogen 1 350,sgm soya 3 van 400,BMT reg 800,milo 3 in1 1000,popoku S10,sgm soya 3 van 400,sweety FP XXL28,happy nappy pant M20,happy nappy M20,cutton buds huki,jb cologne happy berries 125,huki niple L,mpoko xtradry XL34,mpoko xtradry M46,zwitsal baby bath MH 200,zwitsal powder MH & SF 300'),

(152,'2015-11-02','sgm soya 4 400,JB shampoo soft & shiny 100,bendera jelajah md 400,nutrillon baby 2 400,mpoko xtradry NB52,chilkid reg van 400,mpko pant standart L30,dot huki,cerelac KH,cusson nipple L,huki niple L'),

(153,'2015-11-03','sweety FP M38,bendera karya md 400'),

(154,'2015-11-04','bendera cair coklat kotak,bendera cair straw kotak,cusson baby bath,dancow 1 plus md 800,sweety FP L20,zwitsal baby bath 2 in1 200,lactogen 1 750,happy nappy pant M20,sgm soya 3 van 400,sweety FP S20,zwitsal babay bath MT 200,nutrillon soya 3 van 400,mpoko xtrasoft XXL20,mpoko xtradry XL34,mpoko pant standart M20,popoku pant XL20'),

(155,'2015-11-05','sgm 1 plus van 400,popoku L40,lactogen 1 750,popoku pant XL20,happy nappy pant M20,happy nappy pant M20,huki niple L,cusson hair lotion,dot cusson 250,mpoko pant standart XXl18'),

(156,'2015-11-06','sgm soya 3 van 400,mpoko xtradry S50,sgm soya 4 400,mpoko pant standart L30,happy nappy pant M20,sgm soya 1 plus van 400,bebelac 3 md 400,sweety FP L20,merries Xl26'),

(157,'2015-11-07','bendera cair straw botol,nutrillon 3 van 800,popoku diapers M20,sweety FP M20,mpoko pant standart XXL24,mpoko pant standart XL20,cusson hair lotion'),

(158,'2015-11-08','sgm soya 1 200,sgm 1 plus van 150,JB shampoo S&S 100,chilschool van 800,cusson soap mild & gentle,chilkid reg van 800,mkp caplang 120,cusson shampoo alomnd,mpoko pant standart L20,nutrillon soya 4 van 400,popoku diapers M20,nutrillon 4 van 800,sweety FP S10'),

(159,'2015-11-09','sgm soya 3 van 400,sgm soya 4 400,sgm 3 plus md 900,sgm 1 plus md 900,v-fresh roll,bendera karya md 400,bebelac 3 md 400,popoku S20,cerelac BM,dot cusson 250,nutrillon 4 van 800,mpoko xtradry XXL18,happy nappy pant M20,huki niple L,bendera cair coklat kotak'),

(160,'2015-11-10','sgm 3 plus md 900,bendera cair coklat kotak,sweety sns XL32,popoku L40,niple pigeon L,mkp caplang 120'),

(161,'2015-11-11','sgm 1 plus van 900,sweety FP XL20,popoku pant Xl20,pampers eko pant M20,dot huki 250,huki niple L,minyak telon lang 30,zwitsal shampoo AVKS 300'),

(162,'2015-11-12','dancow 3 plus md 800,sgm soya 3 van 400,sgm 3 plus md 900,chilkid reg van 800,sgm ananda 1 400,chilschool van 800,happy nappy pant M20,bendera cair coklat kotak,mpoko xtradry NB52,mpoko pant standart XXL24,dot huki 250,zwitsal hair lotion 200'),

(163,'2015-11-13','sgm 3 plus md 900,sgm 1 plus md 400,bebelove 1 800,nutrillon soya 3 van 800,nutrillon soya 4 van 800,nutrillon ryl 4 van 800,nutrillon 3 van 800,sweety sns S12,happy nappy M20,mpoko xtrasoft XXL20,mpoko xtrasoft girl XL24,mpoko pant standart L30,popoku pant XL20,dot huki 250'),

(164,'2015-11-14','sgm 3 plus md 900,sgm 3 plus md 400,bebelac 3 md 400'),

(165,'2015-11-15','bendera cair coklat kotak,bendera cair straw kotak,cusson baby bath,sgm soya 3 van 400,sgm soya 4 400,sgm soya 2 200,sgm 1 plus md 800,sgm 1 plus van 150,chilschool van 800,mpoko pant standart L30,happy nappy pant M20,sgm soya 3 van 400,merries XL26,zwitsal baby bath MH 200,huki niple L,JB colegne happy berries 125,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak'),

(166,'2015-11-16','kaos kaki ideal,bendera cair coklat kotak,sgm soya 3 van 400,sgm soya 4 400,sgm soya 3 van 400,sgm 1 plus md 900,sgm 1 plus van 150,JB shampoo S&S 100,bendera ciar coklat kotak,bebelac 3 md 400,JB colgne fresh blossoms 300,bendera cair coklat kotak,lactogen 1 350,bendera cair coklat kotak,mpoko pant standrat L30,popoku pant XL20,niple pigeon L,mkp caplang 120,minyak telon lang 100,cerelac BM,JB cologne happy berries 125'),

(167,'2015-11-17','sgm soya 3 van 400,happy nappy pant M20,bendera cair coklat kotak,sgm soya 4 400,happy nappy pant M20,sgm 1 plus van 150,bebelac 3 md 400,sgm soya 3 van 400,chilkid reg van 800,nutrillon soya 3 van 800,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak,mpoko pant standart XXL18,sgm soya 3 van 400,mpoko pant standart L20,mpoko pant standart L30,cusson baby powder'),

(168,'2015-11-18','sgm 3 plus van 900,sgm soya 3 van 400,sgm ananda 1 400,sgm soya 3 van 400,bendera cair coklat kotak,nutrillon 4 van 800,mpoko xtrasoft boy XL24,bebelac 3 md 400,popoku L40,popoku S20,huki niple L'),

(169,'2015-11-19','sgm 1 plus van 150,bendera jelajah van 800,nutrillon soya 2 400,mpoko pant standart XL20,cusson hair lotion,cusson shampoo alomnd,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak'),

(170,'2015-11-20','lactogen 1 750,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak,sweety FP M38,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak,mpoko xtradry XXl28,mpoko xtradry XL34,mpko pant standart L30,niple pigeon L'),

(171,'2015-11-21','bendera cair coklat botol,sgm soya 3 van 400,cusson baby powder,bebelac 3 md 400,nutrillon 3 van 800,happy nappy pant M20,sgm soya 3 van 400,mkp caplang 210,zwitsal baby bath 2 in1 200,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak'),

(172,'2015-11-22','bendera cair starw kotak,bendera cair straw botol,sgm 3 plus md 900,happy nappy pant M20,sgm soya 3 Vn 400,bendera coklat kotak,sgm 1 plus md 900,happy nappy pant M20,lactogen 4 van 800,chilschool van 800,mpoko xtrasoft girl XL24'),

(173,'2015-11-23','bendera cair coklat botol,bebelove 1 800,cutton buds huki,bebelac 3 van 800,sweety sns S27,pasta gigi cussons,sgm soya 3 van 400,mpoko xtradry XXL28,mpoko xtradry M46,sgm soya 3 van 400,mpoko xtradry L40,sgm soya 3 van 400,popoku pant L20,huki niple L,mkp caplang 120,sgm soya van 400,minyak telon lang 30,zwitsal soap & milk Honey 80,happy nappy pant M20,sgm soya 3 van 400,bendera coklat kotak,'),

(174,'2015-11-24','BMT reg 800,chilkid reg van 800,sweety FP XXl18'),

(175,'2015-11-25','sgm soya 3 van 400,happy nappy pant M20,bendera cair coklat kotak,sgm soya 4 400,happy nappy pant M20,sgm soya 3 van 400,bendera coiklat kotak,nutrilon 3 van 800,zitsal shampoo AVKS 100,sgm soya 3 van 400,chilkid reg van 800,happy nappy pant XL20,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak,popoku pant M10,zwitsal baby bath MT 200'),

(176,'2015-11-26','sgm 1 plus md 400,sgm 3 plus md 900,lactogen 1 750,mamamia L36,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak,sweety FP XXl18,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak,mpoko pant standart XXL24,mpoko pant standart M34,popoku L20,sgm soya 3 van 400,huki niple L,niple pigeon L,zwitsal hair loton 200,sgm soya 3 van 400,bendera cair coklat kotak,cusson powder s&s 50,cusson baby bath'),

(177,'2015-11-27','sgm soya 3 van 400,happy nappy pant M20,bendera cair coklat kotak,sgm soya 4 400,happy nappy pant M20,sgm soya 3 van 400,bendera coiklat kotak,sgm 1 plus md 400,milo actigen 300,cusson hair lotion,sgm soya 3 van 400,sweety FP XXl18,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak'),

(178,'2015-11-28','sgm soya 3 van 400,bendera cair coklat kotak,sgm soya 4 400,nutrillon ryl 4 md 400,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak,happy nappy M20,popoku S20'),

(179,'2015-11-29','sgm 1 plus van 400,happy nappy pant M20,sgm soya 3 van 400,sgm 1 plus md 400,chilkid reg van 800,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak,sweety sns M40,sgm soya 3 van 400,sweety sns S12,sgm soya 3 van 400,popoku diapers M20,cusson powder s&s 50,huki niple L,happy nappy pant M20,sgm soya 3 van 400'),

(180,'2015-11-30','bendera cair coklat kotak,bendera cair straw kotak,huki niple L,happy nappy pant M20,sgm 3 plus md 900,milo actigen 300,nutrillon 4 van 800,huki niple L,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak,sweety FP XL20,sweety sns S12,popoku pant L10,dot huki 250,mkp caplang 30,sleek refil,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak'),

(181,'2015-12-01','sgm soyya 3 van 400,sgm 1 plus md 400,nutrillon 4 van 800,sweety sns XL32,happy nappy pant M20,mpoko pant standart XL26,mpoko pant standart L20'),

(182,'2015-12-02','dancow 3 plus md 800,sgm soyya 3 van 400,bebelac 3 md  400,nutribaby ryl 2 soya 400,lactogen 3 md 750,chilschool van 800,happy nappy pant M20,happy nappy M20,happy nappy S10,mpoko xtrasoft girl XL24,mpoko xtrasoft boy XL24,mpoko xtradry XXl28,mpoko xtradry M46,mpoko pant standart XL20,mpoko pant standart L30,merries XL26,niple pigeon L,sabun dettol sensitive,zwitsal baby bath MT 200,cusson hair lotion ,cusson shampoo alomnd'),

(183,'2015-12-03','bendera cair coklat kotak,nutrillon 3 van 800,cerelac BM,mamamia pant M18'),

(184,'2015-12-04','bendera cair straw kotak,pediasure van 800,nutrillon 3 van 800,lactogen 1 350,mpoko xtradry XXl28,mpoko xtradry L40'),

(185,'2015-12-05','nutrillon 3 van 800'),

(186,'2015-12-06','pediasure van 800,sgm soya 3 van 400,chilschool van reg 800,happy nappy pant M20,mpoko xtradry NB52,mkp konicare 125,zwitsal soap milk & honey 80,zwitsal shampoo AVKS 100,zwitsal powder MH & SF 300'),

(187,'2015-12-07','dancow 1 plus md 800,sgm 2 400,zwitsal shampoo AVKS 100'),

(188,'2015-12-08','mitu tissue basah,chilkid reg van 800,cutton buds huki,nutrillon ryl 4 van 800,mamamia pant M18,sweety FP XL20,sweety sns S27,happy nappy pant L20,popoku S20,zwitsal hari lotion 200'),

(189,'2015-12-09','mitu tissue basah,sgm soya 3 van 400,sgm 1 plus md 400,lactogen 1 750,BMT reg 800,sweety sns XL32,sweety sns L10,happy nappy pant M20,cutton buds huki'),

(190,'2015-12-10','bendera karya md 400,nutrillon 4 van 800,chilschool van 800,chilkid reg van 800,mpoko xtradry XXL28,mpoko xtarsoft girl XL24'),

(191,'2015-12-11','bendera cair coklat botol,sgm soya 3 van 400,chilkid plat van 800,nutrillon ryl 4 md 400,happy nappy pant M20,popoku L40'),

(192,'2015-12-12','dancow 5 plus van 800,sgm 1 plus van 150,sgm 1 plus md 400,mpoko xtradry XXl28,pampers eko pant M20'),

(193,'2015-12-13','chilkid reg van 800,chilschool van reg 800,mpoko pant standart M34,niple pigeon L'),

(194,'2015-12-14','sgm soya 3 van 400,sgm 3 plus md 400,bendera jelajah md 400,chilkid reg md 800,niple pigeon L,mkp caplang 210,zwitsal baby bath MT 200,sweety sns S27,zwitsal shampoo AVKS 100,happy nappy pant M20,mpoko pant standart XL26,popoku S10,dot huki 250'),

(195,'2015-12-15','mitu tissue basah,bebelac 3 md 400,mamamia M10,lactogen 1 350,mpoko xtradry XXl28'),

(196,'2015-12-16','sgm 1 plus van 900,sgm 1 plus md 900,sgm 1 plus md 400,sweety sns L36,mpoko xtradry L40,mpoko xtradry NB52,cerelac BM,cusson powder s&s 50'),

(197,'2015-12-17','nutrillon 3 van 400,lactogen 3 md 750,lactogen 1 750,mpoko pant standart XL20,mpoko pant standart L30,minyak telon lang 60'),

(198,'2015-12-18','sgm 1 plus van 150,lactogen 4 van 750,sweety sns M40,happy nappy XL20,happy nappy M20,happy nappy L20'),

(199,'2015-12-19','mitu tissue basah,chilkid reg van 800,huki niple L,mpoko pant standart M20,nutrillon 4 van 800'),

(200,'2015-12-20','sgm 1 plus md 900,sgm 1 plus md 400,nutrillon 4 van 800,mamamia pant M18,sweety sns Xl32,happy nappy XL20,popoku pant L20,niple pigeon L,mkp caplang 120,beeblove 1 800'),

(201,'2015-12-21','bebelove 1 800,chilkid reg md 800,dot cusson 250,mpoko xtrasoft girl XL24,mpoko pant standart L30'),

(202,'2015-12-22','chilkid reg van 800,nutrillon 4 van 400,mamamia pant M40,sweety FP S20,mpoko xtradry XXl28,popoku L20'),

(203,'2015-12-23','dancow 1 plus md 800,milo actigen 300,chilschool van reg 800,sweety FP Xl34,mpoko pant standart XL20,niple pigeon L,niple ninio,cusson powder soft & smooth 50,cusson hair lotion'),

(204,'2015-12-24','pediasure van 800,mpoko xtradry XL34,popoku L40,minyak telon lang 100'),

(205,'2015-12-25','sgm soya 3 van 400,sgm soya 4 400,sweety sns XL32,happy nappy pant M20,happy nappy pant L20'),

(206,'2015-12-26','sgm 1 plus md 900,chilkid reg md 900,sweety Fp S20,sweety sns XL32,cutton buds huki,cerelac BM,cusson soap s&s'),

(207,'2015-12-27','bendera cair straw botol,sgm soya 3 van 400,sgm soya 4 400,happy nappy pant M20,popoku pant L10'),

(208,'2015-12-28','dancow 5 plus van 800,sgm soya 4 400,beblac 4 van 800,chilkid reg van 800,milo 3 in1 100,sweety FP L36,mpoko xtradry XXL28,popoku L40'),

(209,'2015-12-29','sgm soya 4 400,sgm 3 plus md 400,sweety sns L10,mpoko pant standart L30,v-fresh roll'),

(210,'2015-12-30','mitu tissue basah,bendera cair coklat botol,dancow 5 plus van 800,happy nappy XL20,mpoko xtradry XXL28,mpoko xtradsoft girl XL24,mpoko xtradry Xl34,mkp konicare 125,cutton buds huki,sabun dettol sensitive'),

(211,'2015-12-31','dancow 3 plus md 800,dancow 1 plus md 800,mpoko xtradry NB52,mpoko pant standart XXL24'),

(212,'2016-01-01','niple pigeon L,merries XL 26,popoku L 40,nutrillon 4 van 800,sweety sns M40,sweety Fp XXL18,sikat botol yuki,nutrillon ryl 4 md 400,chilkid reg van 800,lactogen 3 md 750,bendera cair straw botol,sgm 1 plus md 400,sgm 1 plus md 900'),

(213,'2016-01-02','mitu tissue basah,dancow 3 plus md 800,dancow 1 plus md 800,sweety fp Xl 34,poko pant standart L20,pampers pant AB  L58,dot huki 250,cutton buds huki,MKP caplang 60,Cb powder pink 50,cusson shampoo alomnd'),

(214,'2016-01-03','mpoko pant standart L20,mpoko xtrasoft boy XL24,mamamia pant M18'),

(215,'2016-01-04','bendera cair coklat kotak,sgm soya 3 van 400,sweety FP Xl34,happy nappy pant XL20,happy nappy pant M20,mpoko pant standart XXL24,cusson hair lotion'),

(216,'2016-01-05','cutton buds huki,mpoko pant standart M20,mpoko pant standart L30,mpoko pant standart XXL24,mpoko xtrasoft boy XL24,happy nappy M20,chilkid reg van 800,lactogen 1 750,nutrillon 3 van 800,mitu tissue basah,bebelac 3 md 400,bendera cair straw botol,bendera jelajah van 800,sgm 1 plus van 150,sgm 1 plus md 400,bendera cair coklat botol'),

(217,'2016-01-06','bendera cair straw botol,bebelac 3 md 400,BMT reg 800,JB cologne summer swing,jb shampoo soft & shiny 100'),

(218,'2016-01-07','mpoko pant M20,mamamia L36,nutrillon ryl 4 van 800,nutrillon soya 2 400,chilschool van 800'),

(219,'2016-01-08','mittu tissue basah,bendera cair coklat kotak,bendera cair coklat botol,pampers eko pant M20,cutton buds huki'),

(220,'2016-01-09','cb powder pink 50,zwitsal baby bath MT 200,sabun dettol sensitive,huki niple M,mpoko pant standart L20,mpoko pant standart XXL18,mpoko xtradry XXL28,nutrillon 4 van 800,nutrillon ryl 4 van 800,bendera cair coklat kotak,dancow 5 plus van 800,bendera cair coklat botol'),

(221,'2016-01-10','bendera cair straw botol,bendera cair coklat botol,dancow 1 plus md 800,chilkid reg van 800,nutrillon soya 3 van 800,sweety FP  M38,mpoko xtrasoft girl Xl24'),

(222,'2016-01-11','v-fresh roll,mkp caplang 210,mkp caplang 120,mpoko xtrasoft boy XL24,sweety FP Xl34,BMT reg 800,chilschool van reg 800,milo actigen 300'),

(223,'2016-01-12','bendera cair coklat kotak,bendera cair straw kotak,bendera cair straw botol,chilkid reg van 800,happy nappy pant L20,JB cologne happy berries 125,happy nappy pany XL20,mpoko pant standart M20,merries XL 26,cutton buds huki'),

(224,'2016-01-13','popoku pant M20,mpoko pant standart M34,bendera cair straw kotak,nutrilon 3 van 800,bendera cair coklat kotak'),

(225,'2016-01-14','bendera cair coklat kotak,bendera cair straw kotak,dancow 5 plus van 800,sgm soya 3 van 400,sweety sns L36,happy nappy pant M20,happy nappy pant L20,happy nappy L20,mpoko xtradry XXL28,mpoko pant standart L20,huki niple L'),

(226,'2016-01-15','nutrillon 4 van 800,nutrilon soya 3 van 800,bebelac 4 van 800'),

(227,'2016-01-16','cerelac BM,mpoko pant standart XXL18,mpoko xtradry M46,happy nappy pant M20,sgm soya 3 van 400'),

(228,'2016-01-17','dot huki,bendera cair coklat kotak,dancow 5 plus van 800,dancow 3 plus md 800,sgm 3 plus van 900,sgm 1 plus md 400,bebelac 3 van 800,chilschool van reg 800,nutrillon ryl soya van 800,happy nappy M20,mpoko pant standart XL20,mpoko pant standart L30,mpoko pant standart M34'),

(229,'2016-01-18','cutton buds huki,nipple ninio,mpoko xtradry XXL28,mpoko xtrasoft boy Xl24,sweety FP L36,sweety FP XL34,chilkid palt van 800,chilkid reg van 800,dancow batita md 1000,bendera cair coklat kotak'),

(230,'2016-01-19','nutrillon 3 van 800,chilschool van  800,cerelac KH'),

(231,'2016-01-20','dot huki 250,pediasure van 850'),

(232,'2016-01-21','kaos kaki ideal,dancow 3 plus md 800,pediasure van 850,nutrillon ryl soya van 800,mpoko pant standart Xl26,mpoko pant standart L30,zwitsal baby bath MT 200'),

(233,'2016-01-22','zwitsal shamppoo AVKS 100,zwitsal baby bath 2 in 10 200,jb cologne happy berries 125,huki niple M,mpoko pant standart L20,mpoko xtarsoft boy XL24,sweety sns S27,sweety sns Xl32,nutrilon 3 van 800,BMT reg 800,bebelac 3 md 400,bendera jelajah van 800,bendera cair coklat kotak'),

(234,'2016-01-23','sgm soya 3 van 400,sgm soya 4 400,bendera jelajah van 800,happy nappy pant M20,happy nappy XL20,happy nappy diapers M20,mpoko xtradry NB52,niple pigeon L'),

(235,'2016-01-24','cb powder pink 50,zwitsal shamppoo AVKS 100,mkp caplang 120,niple pigeon L,popoku pant Xl20,happy nappy L20,happy nappy XL20,swety sns Xl32,sweety FP XXL18,bebelac 3 van 800,sgm soya 4 400,bendera cair coklat kotak'),

(236,'2016-01-25','bendera cair straw kotak,dancow 5 plus van 800,sgm soya 3 van 400,bebelac 4 van 800,nutrilon soya 3 van 400,sweety sns M40,happy nappy pant M20,mpoko xtradry S50,mpoko pant standart M20,popoku L40,dot huki 250,MKP konicare 125'),

(237,'2016-01-26','jb cologne fresh blossoms 300,mkp caplang 120,mpoko pant standart XXL18,mpoko xtradry L40,mpoko xtradry XXL28,happy nappy M20,sgm soya 4 400'),

(238,'2016-01-27','sgm soya 4 400,chilkid reg van 800,nutrilon soya 3 van 400,nutrilon ryl soya van 800,nutrilon 4 van 800,mpoko pant standrt M34,niple pigeon L'),

(239,'2016-01-28','cusson hair lotion,zwitsal baby bath MT 200,v fresh roll,cutton buds huki,dot huki 250,popoku L20,mpoko xtradry XXL28,happy nappy XL20,sweety FP L36,swety FP XL34,sweety FP XXL18,nutrilon soya 4 van 400,chilkid reg van 800,chilschool van 800,nutrilon 3 van 800,bebelac 3 van 800,bebelac 3 md 400,bendera karya md 400,dancow 1 plus md 800,dancow 3 plus md 800,bendera cair straw kotak'),

(240,'2016-01-29','sgm soya 4 400,sgm ananda 1 400,milo 3 in 1 1000,sweety fp L36,mpoko xtradry XL50,popoku l40,jb cologne fresh blossoms 300,popoku m40,niple pigeon L'),

(241,'2016-01-30','cusson hair lotion,jb cologne fresh blossoms 300,mpoko xtrasoft boy Xl24,swety FP Xl34,sweety FP XXL18,nutrilon ryl soya van 800,nutrillon soya 1 400,nutrilon soya 3 van 800,chilschool van reg 800,sgm soya 4 400,dancow 3 plus md 800'),

(242,'2016-01-31','bendera jelajah van 800,nutrilon soya 3 van 800,nutrilon ryl 4 van 800,milo 3 in 1 1000,zwitsal shampoo 300,mpoko xtarsoft boy XL24,mpoko pant standrat XL20,niple pigeon L'),

(243,'2016-02-01','tempat bedak leo,bendera cair straw botol,bendera cair straw kotak,happy nappy pant M20,dancow batita md 1000,bendera cair straw botol,bendera cair straw kotak,happy nappy pant M20,huki niple L,cair coklat kotak,sgm 1 plus van 900,sgm ananda 1 400,bonetto coklat 700,nipple ninio,zwitsal baby bath MH 200,nutrillon 3 van 800,nipple ninio,happy nappy pant L20,mpoko pant standart XXL18,popoku pant Xl20'),

(244,'2016-02-02','bendera cair coklat kotak,bendera cair straw botol,happy nappy pant M20,dancow 3 plus md 800,bendera cair coklat kotak,happy nappy pant M20,huki niple L,milo actigen 300,bendera cair coklat kotak,huki niple L,happy nappy pant M20,lactogen 3 md 750,JB cologne happy berries 125,chilkid reg van 800,chilkid plat van 800,nutrillon soya 3 van 400,nutrillon 4 van 800,mpoko xtradry L40,mpoko pant standart XL36,JB cologne fresh blossoms 300'),

(245,'2016-02-03','sgm soya 3 van 400,bendera cair straw botol,bendera cair coklat kotak,sgm soya 4 400,bendera cair straw botol,bendera cair coklat kotak,sgm 1 1000,bendera karya md 400,mpokp pant standart XL36,bendera cair coklat kotak,nutribaby ryl 2 soya  400,nutrillon  ryl 3 van 800,sweety sns M40,happy nappy pant M20,bendera cair coklat kotak,happy nappy L20,popoku pant Xl20,mkp caplang 120,cerelac ayam bawang,cerelac BM,cerelac KH'),

(246,'2016-02-04','mitu tissue  basah,bendera cair coklat kotak,bendera cair coklat botol,bendera cair straw botol,bendera cair straw kotak,sgm 5 md 400,sgm 1 plus van 900,sgm 1 plus md 900,nutrillon 4 van 800,sweety FP M38,mpoko pant standart XL20,mpoko pant standart L20,popoku L20,nipple pigeon L,minyak telong Lang 100'),

(247,'2016-02-05','sgm 1 plus van 400,BMT reg 800,chilschool reg van 800,nutrillon ryl 4 van 800,sweety FP XXL18,happy nappy S20,mpoko xtrasoft XXL20,mpoko pant standart L30,mkp caplang 210,cussons soap mild & gentle,zwitsal baby bath 2 in 1 200'),

(248,'2016-02-06','huki nipple L,chilschoool reg van 800,BMT reg 800,sgm 1 plus van 400,bendera cair coklat botol,underpad baby'),

(249,'2016-02-07','kaos kaki ideal,bendera cair straw botol,bendera cair cokalt botol,happy nappy pant XL20,sgm soya 4 400,sgm soya 3 van 400,mamamia L36,happy nappy pant M20,huki niple L,bendera cair coklat kotak,happy nappy L20,mpoko pant standart M20,popoku L40,nipple pigeon L,zwitsal hair lotion 200'),

(250,'2016-02-08','kaos kaki ideal,bendera cair straw botol,bendera cair coklat botol,zwitsal hair lotion 200,sgm soya 3 van 400,mamamia L36,happy nappy pant L20,happy nappy pant M20,huki niple L,bendera cair coklat kotak,happy nappy L20,mpoko xtradry XL50,mpoko pant standart M20,popoku L40,niple pigeon L'),

(251,'2016-02-09','bendera ciar coklat botol,sgm soya 4 400,bebelac 3 van 800,jb shampoo soft & shiny 100,sweety sns L36,mkp caplang 120,CB powder pink 50'),

(252,'2016-02-10','sgm soya 4 400,bebelove 1 800,chilkid reg van 800,nutrillon soya 3 van 400,happy nappy pant Xl20,happy nappy XL20,mpoko xtrasoft XXL20,mpoko xtradry Xl50,mpoko xtradry M46,mpoko pant standart L30,popoku pant XL20,cerelac BM'),

(253,'2016-02-11','sgm 1 plus van 900,sweety FP XL20,popoku pant Xl20,pampers eko pant M20,dot huki 250,huki niple L,minyak telon lang 30,zwitsal shampoo AVKS 300'),

(254,'2016-02-12','dancow 3 plus md 800,sgm soya 3 van 400,sgm 3 plus md 900,chilkid reg van 800,sgm ananda 1 400,chilschool van 800,happy nappy pant M20,bendera cair coklat kotak,mpoko xtradry NB52,mpoko pant standart XXL24,dot huki 250,zwitsal hair lotion 200'),

(255,'2016-02-13','sgm 3 plus md 900,sgm 1 plus md 400,bebelove 1 800,nutrillon soya 3 van 800,nutrillon soya 4 van 800,nutrillon ryl 4 van 800,nutrillon 3 van 800,sweety sns S12,happy nappy M20,mpoko xtrasoft XXL20,mpoko xtrasoft girl XL24,mpoko pant standart L30,popoku pant XL20,dot huki 250'),

(256,'2016-02-14','sgm 3 plus md 900,sgm 3 plus md 400,bebelac 3 md 400'),

(257,'2016-02-15','bendera cair coklat kotak,bendera cair straw kotak,cusson baby bath,sgm soya 3 van 400,sgm soya 4 400,sgm soya 2 200,sgm 1 plus md 800,sgm 1 plus van 150,chilschool van 800,mpoko pant standart L30,happy nappy pant M20,sgm soya 3 van 400,merries XL26,zwitsal baby bath MH 200,huki niple L,JB colegne happy berries 125,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak'),

(258,'2016-02-16','kaos kaki ideal,bendera cair coklat kotak,sgm soya 3 van 400,sgm soya 4 400,sgm soya 3 van 400,sgm 1 plus md 900,sgm 1 plus van 150,JB shampoo S&S 100,bendera ciar coklat kotak,bebelac 3 md 400,JB colgne fresh blossoms 300,bendera cair coklat kotak,lactogen 1 350,bendera cair coklat kotak,mpoko pant standrat L30,popoku pant XL20,niple pigeon L,mkp caplang 120,minyak telon lang 100,cerelac BM,JB cologne happy berries 125'),

(259,'2016-02-17','sgm soya 3 van 400,happy nappy pant M20,bendera cair coklat kotak,sgm soya 4 400,happy nappy pant M20,sgm 1 plus van 150,bebelac 3 md 400,sgm soya 3 van 400,chilkid reg van 800,nutrillon soya 3 van 800,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak,mpoko pant standart XXL18,sgm soya 3 van 400,mpoko pant standart L20,mpoko pant standart L30,cusson baby powder'),

(260,'2016-02-18','sgm 3 plus van 900,sgm soya 3 van 400,sgm ananda 1 400,sgm soya 3 van 400,bendera cair coklat kotak,nutrillon 4 van 800,mpoko xtrasoft boy XL24,bebelac 3 md 400,popoku L40,popoku S20,huki niple L'),

(261,'2016-02-19','sgm 1 plus van 150,bendera jelajah van 800,nutrillon soya 2 400,mpoko pant standart XL20,cusson hair lotion,cusson shampoo alomnd,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak'),

(262,'2016-02-20','lactogen 1 750,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak,sweety FP M38,happy nappy pant M20,sgm soya 3 van 400,bendera cair coklat kotak,mpoko xtradry XXl28,mpoko xtradry XL34,mpko pant standart L30,niple pigeon L'),

(263,'2016-02-21','sgm soya 3 van 400,fluffy L16 ,sweety Fp XXL20,happy nappy pant M20,happy nappy  M20,happy nappy L20,promina daging brokoli,zwitsal shampoo 300,happy nappy M8'),

(264,'2016-02-22','kaos kaki ideal,mitu tissue basah,milna bubur ayam wortel,sgm 3 plus van 400.sleek refil,cusson hair lotion,sweety Fp XL34,sweety sns S27'),

(265,'2016-02-23','bendera cair straw kotak,mpoko pant standart L30,bendera cair coklat kotak ,bendera cair straw botol,sweety FP XL34,bendera cair coklat botol,chilkid reg van 800,happy nappy Xl20,cusson hair lotion'),

(266,'2016-02-24','dot huki,tempat makan pang-pang,zwitsal shampoo 300,kaos kaki ideal,bendera cair coklat kotak,milna bubur pisang,sweety FP XL34,sweety FP S10,cusson hair lotion,cusson shampoo alomnd'),

(267,'2016-02-25','mitu tissue basah,bendera cair coklat botol,sgm soya 3 van 400,sgm 3 plus van 400,sweety FP L36,cusson baby powder,happy nappy pant M20,pampers Ab XL34'),

(268,'2016-02-26','cd cewek,bendera cair coklat botol,mitu tissue basah,underpad,cutton buds huki,sgm 3 plus van 400,niple pigeon L,nipple ninio,biskuit KH'),

(269,'2016-02-27','bendera cair straw botol,bendera cair straw kotak,bendera cair coklatbotol.bendera cair coklat kotak,dancow batita van 500,sweety FP XL34,mpoko pant standart L30,sleek refil,cusson hair lotion'),

(270,'2016-02-28','bendera cair straw botol,dancow batita van 500,mamamia L36,sweety FP L36,mpoko pant standrt L36,popoku L20');

/*Table structure for table `transaksi_old` */

DROP TABLE IF EXISTS `transaksi_old`;

CREATE TABLE `transaksi_old` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_date` date DEFAULT NULL,
  `produk` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;

/*Data for the table `transaksi_old` */

insert  into `transaksi_old`(`id`,`transaction_date`,`produk`) values 

(1,'2016-11-11','zwitsal shampoo AVKS 100'),

(2,'2016-11-11','minyak telon lang 30'),

(3,'2016-11-11','huki niple L'),

(4,'2016-11-11','dot huki 250'),

(5,'2016-11-11','pampers eko pant M20'),

(6,'2016-11-11','popoku pant XL20'),

(7,'2016-11-11','sweety FP XL20'),

(8,'2016-11-11','sgm 1 plus van 900'),

(9,'2016-11-12','zwitsal hair lotion 200'),

(10,'2016-11-12','dot huki 250'),

(11,'2016-11-12','mpoko pant standart XXL24'),

(12,'2016-11-12','mpoko xtradry NB52'),

(13,'2016-11-12','happy nappy pant M20'),

(14,'2016-11-12','chilkid reg van 800'),

(15,'2016-11-12','chilschool van 800'),

(16,'2016-11-12','sgm ananda 1 400'),

(17,'2016-11-12','sgm 3 plus md 900'),

(18,'2016-11-12','sgm soya 3 van 400'),

(19,'2016-11-12','dancow 3 plus md 800'),

(20,'2016-11-13','dot huki 250'),

(21,'2016-11-13','popoku pant XL20'),

(22,'2016-11-13','mpoko pant standart L30'),

(23,'2016-11-13','mpoko xtradry XXL28'),

(24,'2016-11-13','mpoko xtrasoft girl XL24'),

(25,'2016-11-13','mpoko xtrasoft XXL20'),

(26,'2016-11-13','happy nappy M20'),

(27,'2016-11-13','sweety sns S12'),

(28,'2016-11-13','nutrillon 4 van 400'),

(29,'2016-11-13','nutrlon 3 van 800'),

(30,'2016-11-13','nutrillon ryl 4 van 800'),

(31,'2016-11-13','nutrillon soya 3 van 800'),

(32,'2016-11-13','nutrillon soya 4 van 400'),

(33,'2016-11-13','bebelove 1 800'),

(34,'2016-11-13','sgm 1 plus md 400'),

(35,'2016-11-13','sgm 3 plus md 900'),

(36,'2016-11-14','bebelac 3 md 400'),

(37,'2016-11-14','sgm 3 plus md 400'),

(38,'2016-11-14','sgm 3 plus md 900'),

(39,'2016-11-15','zwitsal baby bath MH 200'),

(40,'2016-11-15','JB cologne happy berries 125'),

(41,'2016-11-15','huki niple L'),

(42,'2016-11-15','merries XL26'),

(43,'2016-11-15','mpoko pant standart M20'),

(44,'2016-11-15','mpoko pant standart L30'),

(45,'2016-11-15','happy nappy pant M20'),

(46,'2016-11-15','chilschool van 800'),

(47,'2016-11-15','sgm 1 plus van 150'),

(48,'2016-11-15','sgm 1 plus  md 900'),

(49,'2016-11-15','sgm soya 2 200'),

(50,'2016-11-15','sgm soya 3 van 400'),

(51,'2016-11-15','sgm soya 4 400'),

(52,'2016-11-15','bendera cair coklat kotak'),

(53,'2016-11-16','JB cologne fresh blossoms 300'),

(54,'2016-11-16','JB cologne happy berries 125'),

(55,'2016-11-16','cerelac BM'),

(56,'2016-11-16','minyak telon lang 100'),

(57,'2016-11-16','MKP caplang 120'),

(58,'2016-11-16','niple pigeon L'),

(59,'2016-11-16','nipple ninio'),

(60,'2016-11-16','popoku pant XL20'),

(61,'2016-11-16','mpoko pant standart L30'),

(62,'2016-11-16','lactogen 1 350'),

(63,'2016-11-16','bebelac 3 md 400'),

(64,'2016-11-16','sgm 1 plus van 150'),

(65,'2016-11-16','sgm 1 plus  md 900'),

(66,'2016-11-16','sgm soya 4 400'),

(67,'2016-11-16','bendera cair coklat kotak'),

(68,'2016-11-16','kaos kaki ideal'),

(69,'2016-11-17','cussons baby powder'),

(70,'2016-11-17','mpoko pant standart L20'),

(71,'2016-11-17','mpoko pant standart L30'),

(72,'2016-11-17','mpoko pant standart XXL18'),

(73,'2016-11-17','happy nappy pant M20'),

(74,'2016-11-17','nutrillon soya 3 van 800'),

(75,'2016-11-17','chilkid reg van 800'),

(76,'2016-11-17','bebelac 3 md 400'),

(77,'2016-11-17','sgm 1 plus van 150'),

(78,'2016-11-17','sgm soya 3 van 400'),

(79,'2016-11-17','sgm soya 4 400'),

(80,'2016-11-18','huki niple L'),

(81,'2016-11-18','popoku S20'),

(82,'2016-11-18','popoku L40'),

(83,'2016-11-18','mpoko xtrasoft boy XL24'),

(84,'2016-11-18','nutrilon 4 van 800'),

(85,'2016-11-18','bebelac 3 md 400'),

(86,'2016-11-18','sgm ananda 1 400'),

(87,'2016-11-18','sgm 3 plus van 900'),

(88,'2016-11-19','cusson hair lotion'),

(89,'2016-11-19','cussons shampoo alomnd'),

(90,'2016-11-19','mpoko pant standart XL20'),

(91,'2016-11-19','nutrillon soya 2 400'),

(92,'2016-11-19','bendera jelajah van 800'),

(93,'2016-11-19','sgm 1 plus van 150'),

(94,'2016-11-20','niple pigeon L'),

(95,'2016-11-20','mpoko pant standart L30'),

(96,'2016-11-20','mpoko xtradry XL34'),

(97,'2016-11-20','mpoko xtradry XXL28'),

(98,'2016-11-20','sweety FP M38'),

(99,'2016-11-20','lactogen 1 750'),

(100,'2016-09-20','cusson hair lotion'),

(101,'2016-09-20','JB cologne fresh blossoms 300'),

(102,'2016-09-20','merries XL26'),

(103,'2016-09-20','popoku pant XL20'),

(104,'2016-09-20','happy nappy pant XL20'),

(105,'2016-09-20','sweety FP XL20'),

(106,'2016-09-20','sweety FP XL34'),

(107,'2016-09-20','sgm soya 4 400'),

(108,'2016-09-20','DR p basic L8'),

(109,'2016-09-20','cd cewek'),

(110,'2016-09-21','zwitsal shampoo 300'),

(111,'2016-09-21','promina daging brokoli'),

(112,'2016-09-21','happy nappy M8'),

(113,'2016-09-21','happy nappy M20'),

(114,'2016-09-21','happy nappy L20'),

(115,'2016-09-21','happy nappy pant M20'),

(116,'2016-09-21','sweety FP XXL20'),

(117,'2016-09-21','fluffy L16'),

(118,'2016-09-21','sgm soya 3 van 400'),

(119,'2016-09-22','cusson hair lotion'),

(120,'2016-09-22','sleek refil'),

(121,'2016-09-22','milna bubur ayam wortel'),

(122,'2016-09-22','sweety sns S27'),

(123,'2016-09-22','sweety FP XL34'),

(124,'2016-09-22','sgm 3 plus van 400'),

(125,'2016-09-22','mitu tissue basah'),

(126,'2016-09-22','kaos kaki ideal'),

(127,'2016-09-23','cusson hair lotion'),

(128,'2016-09-23','mpoko pant standart L30'),

(129,'2016-09-23','happy nappy XL20'),

(130,'2016-09-23','sweety FP XL34'),

(131,'2016-09-23','chilkid reg van 800'),

(132,'2016-09-23','bendera cair coklat botol'),

(133,'2016-09-23','bendera cair coklat kotak'),

(134,'2016-09-23','bendera cair straw botol'),

(135,'2016-09-23','bendera cair straw kotak'),

(136,'2016-09-24','cusson hair lotion'),

(137,'2016-09-24','cussons shampoo alomnd'),

(138,'2016-09-24','zwitsal shampoo 300'),

(139,'2016-09-24','milna bubur pisang'),

(140,'2016-09-24','sweety FP S10'),

(141,'2016-09-24','sweety FP XL34'),

(142,'2016-09-24','bendera cair coklat kotak'),

(143,'2016-09-24','tempat makan pang-pang'),

(144,'2016-09-24','kaos kaki ideal'),

(145,'2016-09-24','dot huki'),

(146,'2016-09-25','cussons baby powder'),

(147,'2016-09-25','pampers AB XL34'),

(148,'2016-09-25','happy nappy pant M20'),

(149,'2016-09-25','sweety FP L36'),

(150,'2016-09-25','sgm 3 plus van 400'),

(151,'2016-09-25','sgm soya 3 van 400'),

(152,'2016-09-25','bendera cair coklat botol'),

(153,'2016-09-25','mitu tissue basah'),

(154,'2016-09-26','biscuit KH'),

(155,'2016-09-26','cutton buds huki'),

(156,'2016-09-26','niple pigeon L'),

(157,'2016-09-26','nipple ninio'),

(158,'2016-09-26','merries M34'),

(159,'2016-09-26','sgm 3 plus van 400'),

(160,'2016-09-26','bendera cair coklat botol'),

(161,'2016-09-26','mitu tissue basah'),

(162,'2016-09-26','underpad'),

(163,'2016-09-26','cd cewek'),

(164,'2016-09-27','cusson hair lotion'),

(165,'2016-09-27','sleek refil'),

(166,'2016-09-27','mpoko pant standart L30'),

(167,'2016-09-27','sweety FP XL34'),

(168,'2016-09-27','dancow batita van 500'),

(169,'2016-09-27','bendera cair coklat botol'),

(170,'2016-09-27','bendera cair coklat kotak'),

(171,'2016-09-27','bendera cair straw botol'),

(172,'2016-09-27','bendera cair straw kotak'),

(173,'2016-09-28',''),

(174,'2016-09-29','popoku L20'),

(175,'2016-09-29','mpoko pant standart L36'),

(176,'2016-09-29','sweety FP L36'),

(177,'2016-09-29','mamamia L36'),

(178,'2016-09-29','dancow batita van 500'),

(179,'2016-09-29','bendera cair straw botol');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(200) DEFAULT NULL,
  `nama` varchar(200) DEFAULT NULL,
  `password` text,
  `level` tinyint(4) NOT NULL DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `inactive` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`nama`,`password`,`level`,`last_login`,`inactive`) values 

(1,'admin','Administrator','21232f297a57a5a743894a0e4a801fc3',1,'2017-02-22 01:49:04',0),

(2,'user','User Direktur','ee11cbb19052e40b07aac0ca060c23ee',2,'2016-05-22 09:19:02',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
