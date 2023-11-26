-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2023 at 12:00 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_komputer`
--

-- --------------------------------------------------------

--
-- Table structure for table `mst_barang`
--

CREATE TABLE `mst_barang` (
  `kd_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(100) NOT NULL,
  `kategori_barang` varchar(25) NOT NULL,
  `merek` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mst_barang`
--

INSERT INTO `mst_barang` (`kd_barang`, `nama_barang`, `kategori_barang`, `merek`) VALUES
('B001', 'INTEL 7', 'Processor', 'INTEL'),
('B002', 'RYZEN 5', 'Processor', 'AMD');

-- --------------------------------------------------------

--
-- Table structure for table `trx_barang_keluar`
--

CREATE TABLE `trx_barang_keluar` (
  `kd_barang_keluar` char(15) NOT NULL,
  `kd_barang_masuk` char(15) NOT NULL,
  `jumlah` double NOT NULL,
  `tanggal_keluar` date DEFAULT NULL,
  `keterangan` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trx_barang_keluar`
--

INSERT INTO `trx_barang_keluar` (`kd_barang_keluar`, `kd_barang_masuk`, `jumlah`, `tanggal_keluar`, `keterangan`) VALUES
('OUT0001', 'IN0002', 1, '2023-11-26', 'RUSAK');

-- --------------------------------------------------------

--
-- Table structure for table `trx_barang_masuk`
--

CREATE TABLE `trx_barang_masuk` (
  `kd_barang_masuk` char(15) NOT NULL,
  `kd_barang` varchar(10) NOT NULL,
  `jumlah` float NOT NULL,
  `nilai_barang` float NOT NULL,
  `tanggal_masuk` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trx_barang_masuk`
--

INSERT INTO `trx_barang_masuk` (`kd_barang_masuk`, `kd_barang`, `jumlah`, `nilai_barang`, `tanggal_masuk`) VALUES
('IN0002', 'B002', 5, 12000, '2023-11-26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `mst_barang`
--
ALTER TABLE `mst_barang`
  ADD PRIMARY KEY (`kd_barang`);

--
-- Indexes for table `trx_barang_keluar`
--
ALTER TABLE `trx_barang_keluar`
  ADD PRIMARY KEY (`kd_barang_keluar`),
  ADD KEY `kd_barang_masuk` (`kd_barang_masuk`);

--
-- Indexes for table `trx_barang_masuk`
--
ALTER TABLE `trx_barang_masuk`
  ADD PRIMARY KEY (`kd_barang_masuk`),
  ADD KEY `kd_barang` (`kd_barang`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `trx_barang_keluar`
--
ALTER TABLE `trx_barang_keluar`
  ADD CONSTRAINT `trx_barang_keluar_ibfk_1` FOREIGN KEY (`kd_barang_masuk`) REFERENCES `trx_barang_masuk` (`kd_barang_masuk`);

--
-- Constraints for table `trx_barang_masuk`
--
ALTER TABLE `trx_barang_masuk`
  ADD CONSTRAINT `trx_barang_masuk_ibfk_1` FOREIGN KEY (`kd_barang`) REFERENCES `mst_barang` (`kd_barang`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
