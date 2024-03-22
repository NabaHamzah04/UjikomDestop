-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Mar 2024 pada 05.11
-- Versi server: 10.4.28-MariaDB
-- Versi PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir_drian`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detailpenjualan`
--

CREATE TABLE `detailpenjualan` (
  `DetailID` varchar(15) NOT NULL,
  `ProdukID` varchar(15) NOT NULL,
  `Harga` int(11) NOT NULL,
  `JumlahProduk` int(11) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `detailpenjualan`
--

INSERT INTO `detailpenjualan` (`DetailID`, `ProdukID`, `Harga`, `JumlahProduk`, `Subtotal`) VALUES
('DIDP001', '4970129732518', 7000, 1, 7000.00),
('DIDP002', '4970129732518', 7000, 2, 14000.00),
('DIDP003', '4970129732518', 7000, 1, 7000.00),
('DIDP004', '4970129732518', 7000, 7, 49000.00),
('DIDP005', '4970129732518', 7000, 1, 7000.00),
('DIDP006', '34567', 35000, 1, 35000.00),
('DIDP007', '4970129732518', 7000, 4, 28000.00);

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `LoginID` varchar(15) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `HakAkses` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`LoginID`, `Username`, `Password`, `HakAkses`) VALUES
('1', 'naba', '1234', 'Admin'),
('111', 'rafli', '1122', 'Admin'),
('1222', 'azi', '12345', 'Admin'),
('4970129732518', 'hamzah', '1111', 'Petugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pelanggan`
--

CREATE TABLE `pelanggan` (
  `PelangganID` varchar(15) NOT NULL,
  `NamaPelanggan` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `NomorTelepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pelanggan`
--

INSERT INTO `pelanggan` (`PelangganID`, `NamaPelanggan`, `Alamat`, `NomorTelepon`) VALUES
('122', 'rafli', 'ciakar', '08963214'),
('20180726288', 'adrian', 'pasjay 123', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `penjualan`
--

CREATE TABLE `penjualan` (
  `PenjualanID` varchar(15) NOT NULL,
  `DetailID` varchar(15) NOT NULL,
  `TanggalPenjualan` date NOT NULL,
  `TotalHarga` int(11) NOT NULL,
  `JamPenjualan` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `penjualan`
--

INSERT INTO `penjualan` (`PenjualanID`, `DetailID`, `TanggalPenjualan`, `TotalHarga`, `JamPenjualan`) VALUES
('IDP001', 'DIDP001', '2024-02-28', 700000, '08:47:39'),
('IDP002', 'DIDP002', '2024-02-28', 1400000, '08:56:22'),
('IDP003', 'DIDP003', '2024-02-28', 700000, '12:31:13'),
('IDP004', 'DIDP004', '2024-02-28', 4900000, '12:32:54'),
('IDP005', 'DIDP005', '2024-03-14', 700000, '10:21:20'),
('IDP006', 'DIDP006', '2024-03-14', 3500000, '11:46:42'),
('IDP007', 'DIDP007', '2024-03-14', 2800000, '11:47:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `ProdukID` varchar(15) NOT NULL,
  `NamaProduk` varchar(255) NOT NULL,
  `Harga` int(11) NOT NULL,
  `Stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`ProdukID`, `NamaProduk`, `Harga`, `Stok`) VALUES
('345', 'Es Teh', 3000, 150),
('3456', 'Es Jeruk', 5000, 150),
('34567', 'Kurma', 35000, 14),
('4970129732518', 'Tinta Refil', 7000, 85),
('4970129732519', 'HODIIE', 1500000, 15),
('8991389230008', 'buku', 3000, 300);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  ADD PRIMARY KEY (`DetailID`),
  ADD KEY `PenjualanID` (`ProdukID`);

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`LoginID`);

--
-- Indeks untuk tabel `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`PelangganID`);

--
-- Indeks untuk tabel `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`PenjualanID`),
  ADD KEY `PelangganID` (`JamPenjualan`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`ProdukID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
