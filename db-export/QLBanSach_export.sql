-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: QLBanSach
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ChiTietDonHang`
--

DROP TABLE IF EXISTS `ChiTietDonHang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ChiTietDonHang` (
  `MaDonHang` varchar(36) NOT NULL,
  `MaSach` varchar(36) NOT NULL,
  `SoLuong` int NOT NULL,
  `DonGia` float NOT NULL,
  PRIMARY KEY (`MaDonHang`,`MaSach`),
  KEY `FK_ChiTietDonHangToSach` (`MaSach`),
  CONSTRAINT `FK_ChiTietDonHangToDonHang` FOREIGN KEY (`MaDonHang`) REFERENCES `DonHang` (`MaDonHang`),
  CONSTRAINT `FK_ChiTietDonHangToSach` FOREIGN KEY (`MaSach`) REFERENCES `Sach` (`MaSach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChiTietDonHang`
--

LOCK TABLES `ChiTietDonHang` WRITE;
/*!40000 ALTER TABLE `ChiTietDonHang` DISABLE KEYS */;
/*!40000 ALTER TABLE `ChiTietDonHang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ChuDe`
--

DROP TABLE IF EXISTS `ChuDe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ChuDe` (
  `MaChuDe` varchar(36) NOT NULL,
  `TenChuDe` varchar(255) NOT NULL,
  PRIMARY KEY (`MaChuDe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ChuDe`
--

LOCK TABLES `ChuDe` WRITE;
/*!40000 ALTER TABLE `ChuDe` DISABLE KEYS */;
/*!40000 ALTER TABLE `ChuDe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DonHang`
--

DROP TABLE IF EXISTS `DonHang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DonHang` (
  `MaDonHang` varchar(36) NOT NULL,
  `NgayGiao` date NOT NULL,
  `NgayDat` date NOT NULL,
  `TinhTrangGH` varchar(50) DEFAULT NULL,
  `DaThanhToan` tinyint(1) NOT NULL,
  `MaKH` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`MaDonHang`),
  KEY `FK_DonHangToKhachHang` (`MaKH`),
  CONSTRAINT `FK_DonHangToKhachHang` FOREIGN KEY (`MaKH`) REFERENCES `KhachHang` (`MaKH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DonHang`
--

LOCK TABLES `DonHang` WRITE;
/*!40000 ALTER TABLE `DonHang` DISABLE KEYS */;
/*!40000 ALTER TABLE `DonHang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KhachHang`
--

DROP TABLE IF EXISTS `KhachHang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KhachHang` (
  `MaKH` varchar(36) NOT NULL,
  `HoTen` varchar(255) NOT NULL,
  `NgaySinh` date NOT NULL,
  `GioiTinh` bit(1) DEFAULT NULL,
  `DienThoai` varchar(10) DEFAULT NULL,
  `TaiKhoan` varchar(50) NOT NULL,
  `MatKhau` varchar(50) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MaKH`),
  UNIQUE KEY `TaiKhoan` (`TaiKhoan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KhachHang`
--

LOCK TABLES `KhachHang` WRITE;
/*!40000 ALTER TABLE `KhachHang` DISABLE KEYS */;
/*!40000 ALTER TABLE `KhachHang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `NhaXuatBan`
--

DROP TABLE IF EXISTS `NhaXuatBan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NhaXuatBan` (
  `MaNSX` varchar(36) NOT NULL,
  `TenNSB` varchar(255) NOT NULL,
  `DienThoai` varchar(10) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MaNSX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `NhaXuatBan`
--

LOCK TABLES `NhaXuatBan` WRITE;
/*!40000 ALTER TABLE `NhaXuatBan` DISABLE KEYS */;
/*!40000 ALTER TABLE `NhaXuatBan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sach`
--

DROP TABLE IF EXISTS `Sach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sach` (
  `MaSach` varchar(36) NOT NULL,
  `TenSach` varchar(255) NOT NULL,
  `GiaSach` float DEFAULT NULL,
  `MoTa` varchar(255) DEFAULT NULL,
  `AnhBia` varchar(500) DEFAULT NULL,
  `NgayCapNhat` date DEFAULT NULL,
  `SoLuongTon` int DEFAULT NULL,
  `MaChuDe` varchar(36) DEFAULT NULL,
  `MaNSX` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`MaSach`),
  KEY `FK_SachToNhaXuatBan` (`MaNSX`),
  KEY `FK_SachToChuDe` (`MaChuDe`),
  CONSTRAINT `FK_SachToChuDe` FOREIGN KEY (`MaChuDe`) REFERENCES `ChuDe` (`MaChuDe`),
  CONSTRAINT `FK_SachToNhaXuatBan` FOREIGN KEY (`MaNSX`) REFERENCES `NhaXuatBan` (`MaNSX`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sach`
--

LOCK TABLES `Sach` WRITE;
/*!40000 ALTER TABLE `Sach` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sach_TacGia`
--

DROP TABLE IF EXISTS `Sach_TacGia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sach_TacGia` (
  `MaSach` varchar(36) NOT NULL,
  `MaTacGia` varchar(36) NOT NULL,
  `VaiTro` varchar(255) DEFAULT NULL,
  `ViTri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MaSach`,`MaTacGia`),
  KEY `FK_SachTacGiaToTacGia` (`MaTacGia`),
  CONSTRAINT `FK_SachTacGiaToSach` FOREIGN KEY (`MaSach`) REFERENCES `Sach` (`MaSach`),
  CONSTRAINT `FK_SachTacGiaToTacGia` FOREIGN KEY (`MaTacGia`) REFERENCES `TacGia` (`MaTacGia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sach_TacGia`
--

LOCK TABLES `Sach_TacGia` WRITE;
/*!40000 ALTER TABLE `Sach_TacGia` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sach_TacGia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TacGia`
--

DROP TABLE IF EXISTS `TacGia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TacGia` (
  `MaTacGia` varchar(36) NOT NULL,
  `TenTacGia` varchar(255) NOT NULL,
  `TieuSu` text,
  `DienThoai` varchar(10) DEFAULT NULL,
  `DiaChi` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`MaTacGia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TacGia`
--

LOCK TABLES `TacGia` WRITE;
/*!40000 ALTER TABLE `TacGia` DISABLE KEYS */;
/*!40000 ALTER TABLE `TacGia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-27 22:34:51
