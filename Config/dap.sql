-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 04 Feb 2024 pada 02.17
-- Versi server: 8.0.30
-- Versi PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dap`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `keuangan`
--

CREATE TABLE `keuangan` (
  `id` int NOT NULL,
  `status` varchar(30) NOT NULL,
  `keterangan` longtext NOT NULL,
  `tanggal` date NOT NULL,
  `nominal` int NOT NULL,
  `is_Deleted` tinyint(1) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `keuangan`
--

INSERT INTO `keuangan` (`id`, `status`, `keterangan`, `tanggal`, `nominal`, `is_Deleted`, `createdAt`, `updatedAt`) VALUES
(26, 'pengeluaran', 'nnnnn', '2024-02-02', 1, 0, '2024-02-02 08:42:17', '2024-02-02 08:42:17'),
(27, 'pengeluaran', 'nnnnn', '2024-02-03', 100000, 0, '2024-02-03 06:17:29', '2024-02-03 06:17:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id` int NOT NULL,
  `jenis_bantuan` varchar(30) NOT NULL,
  `nominal` int NOT NULL,
  `keterangan` longtext NOT NULL,
  `dokumen` longtext NOT NULL,
  `batas_waktu` int NOT NULL,
  `is_Deleted` tinyint(1) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id`, `jenis_bantuan`, `nominal`, `keterangan`, `dokumen`, `batas_waktu`, `is_Deleted`, `createdAt`, `updatedAt`) VALUES
(43, 'mmm', 1000000, 'untuk kamu menikah', 'buku menikah', 9999999, 1, '2024-02-02 07:57:55', '2024-02-02 08:16:17'),
(44, 'dwd', 1000000, 'untuk kamu menikah', 'buku menikah', 9999999, 1, '2024-02-02 07:57:55', '2024-02-02 08:15:16'),
(45, 'dwwdd', 1000000, 'untuk kamu menikah', 'buku menikah', 9999999, 1, '2024-02-02 07:57:55', '2024-02-02 08:15:22'),
(46, 'nnin', 1000000, 'untuk kamu menikah', 'buku menikah', 99999, 1, '2024-02-02 07:57:55', '2024-02-02 08:15:29'),
(47, 'mmjmi', 1000000, 'untuk kamu menikah', 'buku menikah', 99999, 1, '2024-02-02 07:57:55', '2024-02-02 08:15:33'),
(48, 'oopop', 1000000, 'untuk kamu menikah', 'buku menikah', 9999, 1, '2024-02-02 07:57:55', '2024-02-02 08:15:37'),
(49, 'ppppp', 1000000, 'untuk kamu menikah', 'buku menikah', 9999, 1, '2024-02-02 07:57:55', '2024-02-02 08:15:40'),
(50, 'iiiii', 1000000, 'untuk kamu menikah', 'buku menikah', 999, 0, '2024-02-02 07:57:55', '2024-02-02 08:15:44'),
(51, 'o', 1000000, 'untuk kamu menikah', 'buku menikah', 99, 0, '2024-02-02 07:57:55', '2024-02-02 08:18:32'),
(52, 'nnnnn', 1000000, 'untuk kamu menikah', 'buku menikah', 99, 0, '2024-02-02 07:57:55', '2024-02-02 08:15:52');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengajuan`
--

CREATE TABLE `pengajuan` (
  `id` int NOT NULL,
  `tanggal` date NOT NULL,
  `nominal` bigint NOT NULL,
  `deskripsi` varchar(500) COLLATE utf8mb4_general_ci NOT NULL,
  `bukti` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `bukti_transfer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `deskripsi_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_Deleted` tinyint(1) NOT NULL,
  `id_users` int NOT NULL,
  `id_kriteria` int NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pengajuan`
--

INSERT INTO `pengajuan` (`id`, `tanggal`, `nominal`, `deskripsi`, `bukti`, `bukti_transfer`, `status`, `deskripsi_status`, `is_Deleted`, `id_users`, `id_kriteria`, `createdAt`, `updatedAt`) VALUES
(128, '2024-02-02', 1, 'untuk anak saya menikah', '170686212623929652926413687e197594b72d6c7eff7.jpg', '170686333735329652926413687e197594b72d6c7eff7.jpg', 'selesai', 'selesai', 0, 39, 52, '2024-02-02 07:59:37', '2024-02-02 08:42:17'),
(129, '2024-02-03', 100000, 'tess aja', '170694101583629652926413687e197594b72d6c7eff7.jpg', '1706941049532About us page (3).gif', 'selesai', 'selesai', 0, 39, 52, '2024-02-03 06:13:59', '2024-02-03 06:17:29');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `nama` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_telepon` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `is_Deleted` tinyint(1) NOT NULL,
  `is_Blocked` tinyint(1) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `password`, `role`, `email`, `no_telepon`, `is_Deleted`, `is_Blocked`, `createdAt`, `updatedAt`) VALUES
(39, 'Karyawan', 'Karyawan', '$2b$10$HSaMSb.mnvt56ReAdfSGvuKoqcieQCzYvQm3wJoz4rZAUaojrYpzS', 'Karyawan', 'Karyawan@gmail.com', '089519113444', 0, 0, '2024-01-09 14:33:50', '2024-02-03 14:29:12'),
(40, 'Admin', 'Admin', '$2b$10$StfCShqQuSyBnKe0wwg/yuf3lzNMCmAZVKjmUppUDYvhUytC1.TYG', 'Admin', 'Admin@gmail.com', '089519113444', 0, 0, '2024-01-09 14:34:04', '2024-02-03 14:18:39'),
(41, 'SuperAdmin', 'SuperAdmin', '$2b$10$O93dyg5IckE9yDH6aT2ALOIZ/8X5g2UYrp73GZGu8Yuw8wr8sq8RG', 'SuperAdmin', 'SuperAdmin@gmail.com', '089519113444', 0, 0, '2024-01-09 14:34:31', '2024-02-03 16:22:07'),
(42, 'Manajemen', 'Manajemen', '$2b$10$sKHXpgt0cZCjIDlzpzkq5ecy4mOUg5ipC2yRC5zVn37UUP0HGhV1K', 'Manajemen', 'Manajemen@gmail.com', '089519113444', 0, 0, '2024-01-09 14:34:39', '2024-01-29 13:45:49'),
(43, 'Budi Prayoga', 'Budiprayoga', '$2b$10$y.kjkpZl/m5yTjGclMf19.SN5Jgohtm67W638wjyZUmuQUsgVwAlq', 'SuperAdmin', 'Budiprayoga@gmail.com', '089519113444', 0, 0, '2024-01-11 02:41:07', '2024-02-04 02:15:11'),
(46, 'budiprayoga', 'budiprayoga', '$2b$10$P0IvPv4mH92qWIFP3ySuzOjREStlg1EWSeBfwdbSb0JUJBMe9yX82', 'SuperAdmin', 'budiprayoga5103@gmail.com', '089519113444', 1, 0, '2024-02-03 13:31:11', '2024-02-03 16:18:55'),
(47, 'wdwdwdw', 'budiprayoga', '$2b$10$4Q1BceoMGkipue1hGmo.e.irhIz7mWDBw0ws3gGd.2jC6zCb8TRJS', 'Karyawan', 'wdwdwdw@gmail.com', '89519113444', 1, 0, '2024-02-03 13:44:31', '2024-02-03 16:18:54'),
(48, 'aulia', 'aulia', '$2b$10$G6FBTawMxK7Sq6udeegCteUnzMbiw39UG83wML92TZjuxHQ9L78te', 'Karyawan', 'auliaauliaauliaaulia@gmail.com', '43335666', 1, 0, '2024-02-03 13:52:05', '2024-02-03 16:18:52');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `keuangan`
--
ALTER TABLE `keuangan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengajuan`
--
ALTER TABLE `pengajuan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_users` (`id_users`),
  ADD KEY `id_jenis_bantuan` (`id_kriteria`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `keuangan`
--
ALTER TABLE `keuangan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `pengajuan`
--
ALTER TABLE `pengajuan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pengajuan`
--
ALTER TABLE `pengajuan`
  ADD CONSTRAINT `pengajuan_ibfk_1` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pengajuan_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
