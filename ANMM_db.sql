-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2020 at 01:17 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `impal_acim_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id_barang` varchar(10) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `stok_barang` int(11) NOT NULL DEFAULT 0,
  `harga_barang` double NOT NULL,
  `tgl_kadaluarsa` date NOT NULL,
  `id_supplier` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id_barang`, `nama_barang`, `stok_barang`, `harga_barang`, `tgl_kadaluarsa`, `id_supplier`) VALUES
('111', 'Betadin', 77, 19000, '2021-11-30', 3),
('112', 'Masker N95', 230, 21000, '2021-11-18', 2),
('113', 'Sabun Lifeboy', 23, 14750, '2022-10-09', 2),
('114', 'Hand Sanitiezer', 79, 19290, '2022-12-30', 1),
('115', 'Panadol', 90, 4000, '2021-11-30', 4),
('116', 'Aqua 1500ml', 120, 6000, '2021-11-30', 1);

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `id_karyawan` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(1) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `alamat` varchar(150) NOT NULL,
  `jabatan` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`id_karyawan`, `email`, `nama`, `jenis_kelamin`, `no_telp`, `alamat`, `jabatan`, `password`) VALUES
('101', 'hadi.sabililhaq@gmail.com', 'Hadi Sabililhaq', 'L', '0813704426', 'Kebumen', 'ADMIN', 'f99aecef3d12e02dcbb6260bbdd35189c89e6e73'),
('102', 'Mroihan@gmail.com', 'M Roihan F', 'L', '08225124611', ' Jakarta Timur', 'KASIR', 'f99aecef3d12e02dcbb6260bbdd35189c89e6e73');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id_penjualan` int(12) NOT NULL,
  `id_karyawan` varchar(10) NOT NULL,
  `tgl_penjualan` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id_penjualan`, `id_karyawan`, `tgl_penjualan`) VALUES
(49, '102', '2018-11-20 18:43:29'),
(50, '102', '2020-08-10 05:35:00'),
(51, '102', '2020-08-10 06:01:06'),
(52, '102', '2020-08-10 06:01:46');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan_detail`
--

CREATE TABLE `penjualan_detail` (
  `id` int(11) NOT NULL,
  `id_penjualan` int(12) NOT NULL,
  `id_barang` varchar(10) NOT NULL,
  `jumlah` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `penjualan_detail`
--

INSERT INTO `penjualan_detail` (`id`, `id_penjualan`, `id_barang`, `jumlah`) VALUES
(42, 49, '111', 6),
(43, 50, '111', 1),
(44, 51, '111', 1),
(45, 52, '111', 1);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id_supplier` int(10) NOT NULL,
  `nama_supplier` varchar(50) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `no_telp` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id_supplier`, `nama_supplier`, `alamat`, `no_telp`) VALUES
(1, 'CV Mulia Utama', 'Jakarta Utara', '088767887654'),
(2, 'CV Multiguna', 'Buah Batu', '123123123123'),
(3, 'CV Agung Abadi', 'Jakarta Timur', '082119874517'),
(4, 'CV Abadi Grup', 'Sukapura', '082567735566');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id_barang`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`id_karyawan`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id_penjualan`);

--
-- Indexes for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id_penjualan` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `penjualan_detail`
--
ALTER TABLE `penjualan_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id_supplier` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
