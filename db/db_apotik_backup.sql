-- MariaDB dump 10.19  Distrib 10.9.4-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_apotik
-- ------------------------------------------------------
-- Server version	10.9.4-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kategori` (
  `id_kategori` int(11) NOT NULL AUTO_INCREMENT,
  `nama_kategori` varchar(20) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES
(1,'Cream'),
(2,'Sirup'),
(3,'Tablet');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lemari`
--

DROP TABLE IF EXISTS `lemari`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lemari` (
  `id_lemari` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lemari` varchar(20) NOT NULL,
  PRIMARY KEY (`id_lemari`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lemari`
--

LOCK TABLES `lemari` WRITE;
/*!40000 ALTER TABLE `lemari` DISABLE KEYS */;
INSERT INTO `lemari` VALUES
(1,'Lemari A'),
(2,'Lemari B'),
(3,'Lemari C'),
(4,'Lemari D'),
(5,'Lemari E'),
(6,'Lemari F'),
(7,'Lemari G'),
(8,'Lemari H'),
(9,'Lemari I'),
(10,'Lemari J'),
(11,'Lemari K'),
(12,'Lemari L'),
(13,'Lemari M'),
(14,'Lemari N'),
(15,'Lemari O'),
(16,'Lemari P'),
(17,'Lemari Q'),
(18,'Lemari R'),
(19,'Lemari S'),
(20,'Lemari T'),
(21,'Lemari U'),
(22,'Lemari V'),
(23,'Lemari W'),
(24,'Lemari X'),
(25,'Lemari Y'),
(26,'Lemari Z');
/*!40000 ALTER TABLE `lemari` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obat`
--

DROP TABLE IF EXISTS `obat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obat` (
  `id_obat` int(11) NOT NULL AUTO_INCREMENT,
  `nama_obat` varchar(40) NOT NULL,
  `kategori_obat` int(11) DEFAULT NULL,
  `indikasi` varchar(50) NOT NULL,
  `stok_obat` int(11) NOT NULL,
  `tanggal_expired` date NOT NULL,
  `harga` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_obat`),
  KEY `jenis_obat` (`kategori_obat`),
  CONSTRAINT `obat_ibfk_1` FOREIGN KEY (`kategori_obat`) REFERENCES `kategori` (`id_kategori`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obat`
--

LOCK TABLES `obat` WRITE;
/*!40000 ALTER TABLE `obat` DISABLE KEYS */;
INSERT INTO `obat` VALUES
(1,'Amoxcillin',1,'Mengatasi Infeksi Akibat Bakteri',120,'2023-04-19',12000),
(2,'Ampicillin',2,'Mengatasi Infeksi Akibat Bakteri',120,'2023-03-19',12000),
(3,'Co-Amoxiclav',3,'Mengatasi Infeksi Akibat Bakteri',120,'2023-05-19',12000),
(4,'Cefixime',1,'Mengatasi Infeksi Akibat Bakteri',120,'2023-06-19',12000),
(5,'Cefadroxil',2,'Mengatasi Infeksi Akibat Bakteri',120,'2023-07-19',12000),
(6,'Chiorampenicol',3,'Mengatasi Infeksi Akibat Bakteri',120,'2023-08-19',12000),
(7,'Clindamycin',1,'Mengatasi Infeksi Akibat Bakteri',120,'2023-09-19',12000),
(8,'Ciprofloxacin',2,'Mengatasi Infeksi Akibat Bakteri',120,'2023-10-19',12000),
(9,'Thiampenikol',3,'Mengatasi Infeksi Akibat Bakteri',120,'2023-11-19',12000),
(10,'Tetracyclin',3,'Mengatasi Infeksi Akibat Bakteri',120,'2023-03-19',12000),
(11,'Sulfamethoxazole',1,'Mengatasi Infeksi Akibat Bakteri',120,'2023-04-19',12000),
(12,'Ketoconazok',2,'Mengatasi Infeksi Akibat Bakteri',120,'2023-05-19',12000),
(13,'Micoral',3,'Mengatasi Infeksi Akibat Bakteri',120,'2023-05-19',12000),
(14,'Andgesik',1,'Meredakan Rasa Nyeri',100,'2023-08-19',10000),
(15,'Asam Asetil Salisilat',2,'Menurunkan Suhu Badan',100,'2023-04-19',10000),
(16,'Acetaminophen',3,'Menurunkan Suhu Badan',100,'2023-04-19',10000),
(17,'Mitamizole Sedioan',1,'Menurunkan Suhu Badan',100,'2023-08-19',10000),
(18,'Meloxicam',2,'Menurunkan Suhu Badan',100,'2023-10-19',10000),
(19,'Metformin',3,'Menurunkan Suhu Badan',100,'2023-11-19',10000),
(20,'Na. Diklofenak',3,'Menurunkan Suhu Badan',100,'2023-12-19',10000),
(21,'Ka. Diklofenak',1,'Menurunkan Suhu Badan',100,'2023-05-19',10000),
(22,'Piroxicam',2,'Menurunkan Suhu Badan',100,'2023-06-19',10000),
(23,'Ibu Profen',3,'Menurunkan Suhu Badan',100,'2023-08-19',10000),
(24,'Ketoprofen',1,'Menurunkan Suhu Badan',100,'2023-09-19',10000),
(25,'Tramaclol',2,'Menurunkan Suhu Badan',100,'2023-10-19',10000),
(26,'Cetirizene',3,'Mengatasi Alergi Atau Gatal - Gatal',40,'2023-01-19',4000),
(27,'Dexametazone',1,'Mengatasi Alergi Atau Gatal - Gatal',40,'2023-04-19',4000),
(28,'Dexchlor Pheniramine Maleate',2,'Mengatasi Alergi Atau Gatal - Gatal',40,'2023-02-20',4000),
(29,'Loratadine',3,'Mengatasi Alergi Atau Gatal - Gatal',40,'2023-01-19',4000),
(30,'Acarbose',3,'Mengatasi Kencing Manis',30,'2023-07-12',3000),
(31,'Glimpiride',1,'Mengatasi Kencing Manis',30,'2023-09-12',3000),
(32,'Glibenclamide',2,'Mengatasi Kencing Manis',30,'2023-10-12',3000),
(33,'Fenofibrate',3,'Mengatasi Kolestrol',40,'2023-03-12',4000),
(34,'Simfastatin',1,'Mengatasi Kolestrol',40,'2023-04-12',4000),
(35,'Gemfibrozil',2,'Mengatasi Kolestrol',40,'2023-04-13',4000),
(36,'Atorfastatin',3,'Mengatasi Kolestrol',40,'2023-01-13',4000),
(37,'Al. Hydroxida',1,'Menetralisirkan Asam Lambung',30,'2023-04-13',3000),
(38,'Domperidone',2,'Menetralisirkan Asam Lambung',30,'2023-05-13',3000),
(39,'Nietoclopramide HCL',3,'Menetralisirkan Asam Lambung',30,'2023-06-13',3000),
(40,'Dexametazone',3,'Mengatasi Radang',30,'2023-10-13',3000),
(41,'Prednizone',1,'Mengatasi Radang',30,'2023-11-13',3000),
(42,'Metly Prednisolone',2,'Mengatasi Radang',30,'2023-12-13',3000),
(43,'Amlodipine',3,'Menurunkan Tekanan Darah',30,'2023-05-13',3000),
(44,'Lisonopril',1,'Menurunkan Tekanan Darah',30,'2023-06-13',3000),
(45,'Catopril',2,'Menurunkan Tekanan Darah',30,'2023-06-13',3000),
(46,'Digoxin',3,'Mengatasi Penyakit Jantung',30,'2023-08-13',3000),
(47,'Nefidipine',1,'Mengatasi Penyakit Jantung',30,'2023-09-13',3000),
(48,'Spironolactone',2,'Mengatasi Penyakit Jantung',30,'2023-10-13',3000),
(49,'Allupurinol',3,'Mengatasi Asam Urat',10,'2023-10-13',1000),
(50,'Asam Tranexamat',3,'Mengatasi Pendarahan',20,'2023-03-13',2000),
(51,'Norethisterone',1,'Mengatasi Pendarahan',20,'2023-04-13',2000),
(52,'Allylestranol',2,'Menguatkan Kandungan',20,'2023-05-13',2000),
(53,'Folid Acid',3,'Menguatkan Kandungan',20,'2023-06-13',2000),
(54,'Ketoconazole',1,'Anti Fungi',20,'2023-07-13',2000),
(55,'Miconazole',2,'Anti Fungi',20,'2023-08-13',2000),
(56,'Attapulgite Pecfin',3,'Menghentikan BAB Yang Bersifat Diare',20,'2023-10-13',2000),
(57,'Loperamid',1,'Menghentikan BAB Yang Bersifat Diare',20,'2023-11-13',2000);
/*!40000 ALTER TABLE `obat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal_transaksi` date DEFAULT NULL,
  `id_obat_id` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`),
  KEY `id_obat_id` (`id_obat_id`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_obat_id`) REFERENCES `obat` (`id_obat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(75) NOT NULL,
  `password` varchar(75) NOT NULL,
  `nama_lengkap` varchar(75) NOT NULL,
  `sebagai` enum('ADMIN','GUEST') NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(1,'adim','21232f297a57a5a743894a0e4a801fc3','abdul adim mubarok','ADMIN'),
(2,'syarif','59202463fd4c312b063293b88f6063b2','Syarif Yahya','GUEST'),
(3,'guest','084e0343a0486ff05530df6c705c8bb4','Pengunjung dan Calon Pembeli','GUEST');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-01  8:03:48
