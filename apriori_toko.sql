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
  `id_process` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `confidence` */

insert  into `confidence`(`kombinasi1`,`kombinasi2`,`support_xUy`,`support_x`,`confidence`,`lolos`,`min_support`,`min_confidence`,`id_process`) values 
('happy nappy pant M20','sgm soya 3 van 400',25,25,100,1,20,85,1),
('sgm soya 3 van 400','happy nappy pant M20',25,25,100,1,20,85,1),
('mpoko pant standart L30','bendera cair coklat kotak',20,35,57.142857142857,0,20,85,1),
('bendera cair coklat kotak','mpoko pant standart L30',20,25,80,0,20,85,1),
('cusson hair lotion','sweety FP XL34',25,30,83.333333333333,0,20,85,1),
('sweety FP XL34','cusson hair lotion',25,25,100,1,20,85,1);

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

insert  into `itemset1`(`atribut`,`jumlah`,`support`,`lolos`,`id_process`) values 
('zwitsal shampoo AVKS 100',1,5,0,1),
('minyak telon lang 30',1,5,0,1),
('huki niple L',3,15,0,1),
('dot huki 250',3,15,0,1),
('pampers eko pant M20',1,5,0,1),
('popoku pant XL20',4,20,1,1),
('sweety FP XL20',2,10,0,1),
('sgm 1 plus van 900',1,5,0,1),
('zwitsal hair lotion 200',1,5,0,1),
('mpoko pant standart XXL24',1,5,0,1),
('mpoko xtradry NB52',1,5,0,1),
('happy nappy pant M20',5,25,1,1),
('chilkid reg van 800',3,15,0,1),
('chilschool van 800',2,10,0,1),
('sgm ananda 1 400',2,10,0,1),
('sgm 3 plus md 900',3,15,0,1),
('sgm soya 3 van 400',5,25,1,1),
('dancow 3 plus md 800',1,5,0,1),
('mpoko pant standart L30',7,35,1,1),
('mpoko xtradry XXL28',2,10,0,1),
('mpoko xtrasoft girl XL24',1,5,0,1),
('mpoko xtrasoft XXL20',1,5,0,1),
('happy nappy M20',2,10,0,1),
('sweety sns S12',1,5,0,1),
('nutrillon 4 van 400',1,5,0,1),
('nutrlon 3 van 800',1,5,0,1),
('nutrillon ryl 4 van 800',1,5,0,1),
('nutrillon soya 3 van 800',2,10,0,1),
('nutrillon soya 4 van 400',1,5,0,1),
('bebelove 1 800',1,5,0,1),
('sgm 1 plus md 400',1,5,0,1),
('bebelac 3 md 400',4,20,1,1),
('sgm 3 plus md 400',1,5,0,1),
('zwitsal baby bath MH 200',1,5,0,1),
('JB cologne happy berries 125',2,10,0,1),
('merries XL26',2,10,0,1),
('mpoko pant standart M20',1,5,0,1),
('sgm 1 plus van 150',4,20,1,1),
('sgm 1 plus  md 900',2,10,0,1),
('sgm soya 2 200',1,5,0,1),
('sgm soya 4 400',4,20,1,1),
('bendera cair coklat kotak',5,25,1,1),
('JB cologne fresh blossoms 300',2,10,0,1),
('cerelac BM',1,5,0,1),
('minyak telon lang 100',1,5,0,1),
('MKP caplang 120',1,5,0,1),
('niple pigeon L',3,15,0,1),
('nipple ninio',2,10,0,1),
('lactogen 1 350',1,5,0,1),
('kaos kaki ideal',3,15,0,1),
('cussons baby powder',2,10,0,1),
('mpoko pant standart L20',1,5,0,1),
('mpoko pant standart XXL18',1,5,0,1),
('popoku S20',1,5,0,1),
('popoku L40',1,5,0,1),
('mpoko xtrasoft boy XL24',1,5,0,1),
('nutrilon 4 van 800',1,5,0,1),
('sgm 3 plus van 900',1,5,0,1),
('cusson hair lotion',6,30,1,1),
('cussons shampoo alomnd',2,10,0,1),
('mpoko pant standart XL20',1,5,0,1),
('nutrillon soya 2 400',1,5,0,1),
('bendera jelajah van 800',1,5,0,1),
('mpoko xtradry XL34',1,5,0,1),
('sweety FP M38',1,5,0,1),
('lactogen 1 750',1,5,0,1),
('happy nappy pant XL20',1,5,0,1),
('sweety FP XL34',5,25,1,1),
('DR p basic L8',1,5,0,1),
('cd cewek',2,10,0,1),
('zwitsal shampoo 300',2,10,0,1),
('promina daging brokoli',1,5,0,1),
('happy nappy M8',1,5,0,1),
('happy nappy L20',1,5,0,1),
('sweety FP XXL20',1,5,0,1),
('fluffy L16',1,5,0,1),
('sleek refil',2,10,0,1),
('milna bubur ayam wortel',1,5,0,1),
('sweety sns S27',1,5,0,1),
('sgm 3 plus van 400',3,15,0,1),
('mitu tissue basah',3,15,0,1),
('happy nappy XL20',1,5,0,1),
('bendera cair coklat botol',4,20,1,1),
('bendera cair straw botol',3,15,0,1),
('bendera cair straw kotak',2,10,0,1),
('milna bubur pisang',1,5,0,1),
('sweety FP S10',1,5,0,1),
('tempat makan pang-pang',1,5,0,1),
('dot huki',1,5,0,1),
('pampers AB XL34',1,5,0,1),
('sweety FP L36',2,10,0,1),
('biscuit KH',1,5,0,1),
('cutton buds huki',1,5,0,1),
('merries M34',1,5,0,1),
('underpad',1,5,0,1),
('dancow batita van 500',2,10,0,1),
('popoku L20',1,5,0,1),
('mpoko pant standart L36',1,5,0,1),
('mamamia L36',1,5,0,1);

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

insert  into `itemset2`(`atribut1`,`atribut2`,`jumlah`,`support`,`lolos`,`id_process`) values 
('popoku pant XL20','happy nappy pant M20',0,0,0,1),
('popoku pant XL20','sgm soya 3 van 400',0,0,0,1),
('popoku pant XL20','mpoko pant standart L30',2,10,0,1),
('popoku pant XL20','bebelac 3 md 400',1,5,0,1),
('popoku pant XL20','sgm 1 plus van 150',1,5,0,1),
('popoku pant XL20','sgm soya 4 400',2,10,0,1),
('popoku pant XL20','bendera cair coklat kotak',1,5,0,1),
('popoku pant XL20','cusson hair lotion',1,5,0,1),
('popoku pant XL20','sweety FP XL34',1,5,0,1),
('popoku pant XL20','bendera cair coklat botol',0,0,0,1),
('happy nappy pant M20','sgm soya 3 van 400',5,25,1,1),
('happy nappy pant M20','mpoko pant standart L30',2,10,0,1),
('happy nappy pant M20','bebelac 3 md 400',1,5,0,1),
('happy nappy pant M20','sgm 1 plus van 150',2,10,0,1),
('happy nappy pant M20','sgm soya 4 400',2,10,0,1),
('happy nappy pant M20','bendera cair coklat kotak',1,5,0,1),
('happy nappy pant M20','cusson hair lotion',0,0,0,1),
('happy nappy pant M20','sweety FP XL34',0,0,0,1),
('happy nappy pant M20','bendera cair coklat botol',1,5,0,1),
('sgm soya 3 van 400','mpoko pant standart L30',2,10,0,1),
('sgm soya 3 van 400','bebelac 3 md 400',1,5,0,1),
('sgm soya 3 van 400','sgm 1 plus van 150',2,10,0,1),
('sgm soya 3 van 400','sgm soya 4 400',2,10,0,1),
('sgm soya 3 van 400','bendera cair coklat kotak',1,5,0,1),
('sgm soya 3 van 400','cusson hair lotion',0,0,0,1),
('sgm soya 3 van 400','sweety FP XL34',0,0,0,1),
('sgm soya 3 van 400','bendera cair coklat botol',1,5,0,1),
('mpoko pant standart L30','bebelac 3 md 400',2,10,0,1),
('mpoko pant standart L30','sgm 1 plus van 150',3,15,0,1),
('mpoko pant standart L30','sgm soya 4 400',3,15,0,1),
('mpoko pant standart L30','bendera cair coklat kotak',4,20,1,1),
('mpoko pant standart L30','cusson hair lotion',2,10,0,1),
('mpoko pant standart L30','sweety FP XL34',2,10,0,1),
('mpoko pant standart L30','bendera cair coklat botol',2,10,0,1),
('bebelac 3 md 400','sgm 1 plus van 150',2,10,0,1),
('bebelac 3 md 400','sgm soya 4 400',2,10,0,1),
('bebelac 3 md 400','bendera cair coklat kotak',1,5,0,1),
('bebelac 3 md 400','cusson hair lotion',0,0,0,1),
('bebelac 3 md 400','sweety FP XL34',0,0,0,1),
('bebelac 3 md 400','bendera cair coklat botol',0,0,0,1),
('sgm 1 plus van 150','sgm soya 4 400',3,15,0,1),
('sgm 1 plus van 150','bendera cair coklat kotak',2,10,0,1),
('sgm 1 plus van 150','cusson hair lotion',1,5,0,1),
('sgm 1 plus van 150','sweety FP XL34',0,0,0,1),
('sgm 1 plus van 150','bendera cair coklat botol',0,0,0,1),
('sgm soya 4 400','bendera cair coklat kotak',2,10,0,1),
('sgm soya 4 400','cusson hair lotion',1,5,0,1),
('sgm soya 4 400','sweety FP XL34',1,5,0,1),
('sgm soya 4 400','bendera cair coklat botol',0,0,0,1),
('bendera cair coklat kotak','cusson hair lotion',3,15,0,1),
('bendera cair coklat kotak','sweety FP XL34',3,15,0,1),
('bendera cair coklat kotak','bendera cair coklat botol',2,10,0,1),
('cusson hair lotion','sweety FP XL34',5,25,1,1),
('cusson hair lotion','bendera cair coklat botol',2,10,0,1),
('sweety FP XL34','bendera cair coklat botol',2,10,0,1);

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

insert  into `itemset3`(`atribut1`,`atribut2`,`atribut3`,`jumlah`,`support`,`lolos`,`id_process`) values 
('happy nappy pant M20','mpoko pant standart L30','sgm soya 3 van 400',2,10,0,1),
('happy nappy pant M20','mpoko pant standart L30','bendera cair coklat kotak',1,5,0,1),
('happy nappy pant M20','sgm soya 3 van 400','bendera cair coklat kotak',1,5,0,1),
('mpoko pant standart L30','sgm soya 3 van 400','bendera cair coklat kotak',1,5,0,1),
('happy nappy pant M20','cusson hair lotion','sgm soya 3 van 400',0,0,0,1),
('happy nappy pant M20','cusson hair lotion','sweety FP XL34',0,0,0,1),
('happy nappy pant M20','sgm soya 3 van 400','sweety FP XL34',0,0,0,1),
('cusson hair lotion','sgm soya 3 van 400','sweety FP XL34',0,0,0,1),
('mpoko pant standart L30','cusson hair lotion','bendera cair coklat kotak',2,10,0,1),
('mpoko pant standart L30','cusson hair lotion','sweety FP XL34',2,10,0,1),
('mpoko pant standart L30','bendera cair coklat kotak','sweety FP XL34',2,10,0,1),
('cusson hair lotion','bendera cair coklat kotak','sweety FP XL34',3,15,0,1);

/*Table structure for table `process_log` */

DROP TABLE IF EXISTS `process_log`;

CREATE TABLE `process_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `min_support` double DEFAULT NULL,
  `min_confidence` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `process_log` */

insert  into `process_log`(`id`,`start_date`,`end_date`,`min_support`,`min_confidence`) values 
(1,'2016-09-01','2017-09-30',20,85);

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transaction_date` date DEFAULT NULL,
  `produk` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

/*Data for the table `transaksi` */

insert  into `transaksi`(`id`,`transaction_date`,`produk`) values 
(1,'2016-11-11','zwitsal shampoo AVKS 100,minyak telon lang 30,huki niple L,dot huki 250,pampers eko pant M20,popoku pant XL20,sweety FP XL20,sgm 1 plus van 900'),
(2,'2016-11-12','zwitsal hair lotion 200,dot huki 250,mpoko pant standart XXL24,mpoko xtradry NB52,happy nappy pant M20,chilkid reg van 800,chilschool van 800,sgm ananda 1 400,sgm 3 plus md 900,sgm soya 3 van 400,dancow 3 plus md 800'),
(3,'2016-11-13','dot huki 250,popoku pant XL20,mpoko pant standart L30,mpoko xtradry XXL28,mpoko xtrasoft girl XL24,mpoko xtrasoft XXL20,happy nappy M20,sweety sns S12,nutrillon 4 van 400,nutrlon 3 van 800,nutrillon ryl 4 van 800,nutrillon soya 3 van 800,nutrillon soya 4 van 400,bebelove 1 800,sgm 1 plus md 400,sgm 3 plus md 900'),
(4,'2016-11-14','bebelac 3 md 400,sgm 3 plus md 400,sgm 3 plus md 900'),
(5,'2016-11-15','zwitsal baby bath MH 200,JB cologne happy berries 125,huki niple L,merries XL26,mpoko pant standart M20,mpoko pant standart L30,happy nappy pant M20,chilschool van 800,sgm 1 plus van 150,sgm 1 plus  md 900,sgm soya 2 200,sgm soya 3 van 400,sgm soya 4 400,bendera cair coklat kotak'),
(6,'2016-11-16','JB cologne fresh blossoms 300,JB cologne happy berries 125,cerelac BM,minyak telon lang 100,MKP caplang 120,niple pigeon L,nipple ninio,popoku pant XL20,mpoko pant standart L30,lactogen 1 350,bebelac 3 md 400,sgm 1 plus van 150,sgm 1 plus  md 900,sgm soya 4 400,bendera cair coklat kotak,kaos kaki ideal'),
(7,'2016-11-17','cussons baby powder,mpoko pant standart L20,mpoko pant standart L30,mpoko pant standart XXL18,happy nappy pant M20,nutrillon soya 3 van 800,chilkid reg van 800,bebelac 3 md 400,sgm 1 plus van 150,sgm soya 3 van 400,sgm soya 4 400'),
(8,'2016-11-18','huki niple L,popoku S20,popoku L40,mpoko xtrasoft boy XL24,nutrilon 4 van 800,bebelac 3 md 400,sgm ananda 1 400,sgm 3 plus van 900'),
(9,'2016-11-19','cusson hair lotion,cussons shampoo alomnd,mpoko pant standart XL20,nutrillon soya 2 400,bendera jelajah van 800,sgm 1 plus van 150'),
(10,'2016-11-20','niple pigeon L,mpoko pant standart L30,mpoko xtradry XL34,mpoko xtradry XXL28,sweety FP M38,lactogen 1 750'),
(11,'2016-09-20','cusson hair lotion,JB cologne fresh blossoms 300,merries XL26,popoku pant XL20,happy nappy pant XL20,sweety FP XL20,sweety FP XL34,sgm soya 4 400,DR p basic L8,cd cewek'),
(12,'2016-09-21','zwitsal shampoo 300,promina daging brokoli,happy nappy M8,happy nappy M20,happy nappy L20,happy nappy pant M20,sweety FP XXL20,fluffy L16,sgm soya 3 van 400'),
(13,'2016-09-22','cusson hair lotion,sleek refil,milna bubur ayam wortel,sweety sns S27,sweety FP XL34,sgm 3 plus van 400,mitu tissue basah,kaos kaki ideal'),
(14,'2016-09-23','cusson hair lotion,mpoko pant standart L30,happy nappy XL20,sweety FP XL34,chilkid reg van 800,bendera cair coklat botol,bendera cair coklat kotak,bendera cair straw botol,bendera cair straw kotak'),
(15,'2016-09-24','cusson hair lotion,cussons shampoo alomnd,zwitsal shampoo 300,milna bubur pisang,sweety FP S10,sweety FP XL34,bendera cair coklat kotak,tempat makan pang-pang,kaos kaki ideal,dot huki'),
(16,'2016-09-25','cussons baby powder,pampers AB XL34,happy nappy pant M20,sweety FP L36,sgm 3 plus van 400,sgm soya 3 van 400,bendera cair coklat botol,mitu tissue basah'),
(17,'2016-09-26','biscuit KH,cutton buds huki,niple pigeon L,nipple ninio,merries M34,sgm 3 plus van 400,bendera cair coklat botol,mitu tissue basah,underpad,cd cewek'),
(18,'2016-09-27','cusson hair lotion,sleek refil,mpoko pant standart L30,sweety FP XL34,dancow batita van 500,bendera cair coklat botol,bendera cair coklat kotak,bendera cair straw botol,bendera cair straw kotak'),
(19,'2016-09-28',''),
(20,'2016-09-29','popoku L20,mpoko pant standart L36,sweety FP L36,mamamia L36,dancow batita van 500,bendera cair straw botol');

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
