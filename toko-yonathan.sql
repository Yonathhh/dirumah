-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2024 at 08:17 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko-yonathan`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(10) UNSIGNED NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kategori` enum('makanan','minuman') NOT NULL,
  `stok` int(10) UNSIGNED NOT NULL,
  `harga_beli` int(10) UNSIGNED NOT NULL,
  `harga_jual` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama`, `kategori`, `stok`, `harga_beli`, `harga_jual`, `created_at`, `updated_at`) VALUES
(1, 'fanta', 'minuman', 488, 5000, 6000, '2024-01-25 01:04:41', '2024-01-26 02:51:57'),
(2, 'coca-cola', 'minuman', 495, 5000, 6000, '2024-01-25 01:04:41', '2024-01-26 02:41:01'),
(3, 'sprite', 'minuman', 500, 5000, 6000, '2024-01-25 01:04:41', '2024-01-26 02:40:41'),
(4, 'pepsi', 'minuman', 495, 10000, 11000, '2024-01-25 01:04:41', '2024-01-26 02:40:02'),
(5, 'happytos', 'makanan', 495, 10000, 11000, '2024-01-25 01:04:41', '2024-01-26 02:39:29'),
(6, 'lays', 'makanan', 500, 12000, 13000, '2024-01-26 02:20:54', '2024-01-26 02:39:06'),
(8, 'nipis madu', 'minuman', 5000, 3000, 4000, '2024-01-26 02:30:24', '2024-01-26 02:36:39'),
(12, 'asd', 'makanan', 2, 123, 32423, '2024-01-26 02:48:57', NULL),
(13, 'asdas', 'makanan', 434, 432, 432, '2024-01-26 02:49:59', NULL),
(14, 'ashd', 'makanan', 123, 765432, 4294967295, '2024-01-26 02:50:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_barang` int(10) UNSIGNED NOT NULL,
  `jumlah` int(10) UNSIGNED NOT NULL,
  `total_harga` int(10) UNSIGNED NOT NULL,
  `id_staff` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `id_barang`, `jumlah`, `total_harga`, `id_staff`, `created_at`, `updated_at`) VALUES
(1, 1, 500, 2500000, 1, '2024-01-25 01:13:39', NULL),
(2, 2, 500, 2500000, 1, '2024-01-25 01:13:39', NULL),
(3, 3, 500, 2500000, 1, '2024-01-25 01:15:03', NULL),
(4, 4, 500, 5000000, 1, '2024-01-25 01:15:03', NULL),
(5, 5, 500, 5000000, 1, '2024-01-25 01:15:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_barang` int(10) UNSIGNED NOT NULL,
  `jumlah` int(10) UNSIGNED NOT NULL,
  `total_harga` int(10) UNSIGNED NOT NULL,
  `id_staff` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `id_barang`, `jumlah`, `total_harga`, `id_staff`, `created_at`, `updated_at`) VALUES
(1, 1, 10, 25000, 3, '2024-01-25 01:18:47', NULL),
(2, 1, 2, 5000, 5, '2024-01-25 01:18:47', NULL),
(3, 5, 5, 50000, 1, '2024-01-25 01:18:47', '2024-01-25 07:41:11'),
(4, 4, 5, 50000, 1, '2024-01-25 01:18:47', '2024-01-25 07:41:17'),
(5, 2, 5, 25000, 1, '2024-01-25 01:18:47', '2024-01-25 07:41:21');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('admin','keuangan','logistik') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `level`, `created_at`, `updated_at`) VALUES
(1, 'yonathan', '$2a$12$z15zQV19wDyh8JSbUXYjyunc.uH5wSztW9WPn2CEJQRQy/A9K6ZH6', 'admin', '2024-01-25 01:08:00', '2024-01-25 01:08:16'),
(2, 'yoaso', '$2y$10$tN6DmoJB/DzdyRexVlh6ZOSpoTRRmEFpi912wwWlfhU4ESnXEuf/2', 'admin', '2024-01-25 01:08:00', '2024-01-25 07:35:24'),
(3, 'luffy', '$2a$12$fj0CCe8JUQYAr.deN9N.O.ZP9moGBX79Awkv/S3ySAl6LVVJADYfS', 'admin', '2024-01-25 01:08:00', '2024-01-25 01:08:35'),
(5, 'sanji', '$2a$12$SoObogfWhvDWcJcP25Sfnex/SpNX8eNDEGjJ8UPyb6CgtYMTngYG.', 'logistik', '2024-01-25 01:08:00', '2024-01-25 01:08:40'),
(6, 'robin', '$2y$10$U35NXcSDrwCf4TzR3bnNmu.N2MpQlBoAUdwRVxIj1KWHo2K1njcvW', 'admin', '2024-01-25 07:20:34', NULL),
(7, 'nami', '$2y$10$VmVtSdiuPNt/ftS3uQC2EeQB9dZfE3oqpY4MgRfSXi3gYLfbYddmC', 'keuangan', '2024-01-26 02:07:44', NULL),
(8, 'k', '$2y$10$XhN5H0ALyYhFFRVwYIjrTuE.XcfTgqoBTzjm3X0Ex1jTb4SvkuxIC', 'admin', '2024-01-26 02:52:31', '2024-01-26 02:53:26');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_staff` (`id_staff`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_barang` (`id_barang`),
  ADD KEY `id_staff` (`id_staff`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`id_staff`) REFERENCES `user` (`id`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id_barang`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`id_staff`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
