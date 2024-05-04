-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 04 Bulan Mei 2024 pada 02.01
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
(50, 'pemasukan', 'Pemasukan bulan Mei', '2024-04-29', 10000000, 0, '2024-04-29 02:15:41', '2024-04-29 02:15:41'),
(51, 'pengeluaran', 'khitan anak', '2024-04-29', 1000000, 0, '2024-04-29 02:20:04', '2024-04-29 02:20:04'),
(54, 'pengeluaran', 'bantuan menikah', '2024-05-03', 500000, 0, '2024-05-03 01:45:00', '2024-05-03 01:45:00');

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
(66, 'bantuan menikah', 1000000, 'plus papan bunga daerah yang bisa terjangkau dan tersedia informasi/kontrak pembelian online', 'pemberitahuan ke admin dan bagian kepegawaian', 9999, 0, '2024-03-07 10:56:31', '2024-03-07 10:56:31'),
(67, 'keguguran trisemester II', 1000000, 'santunan duka keguguran', 'pemberitahuan ke admin dan bagian kepegawaian', 365, 0, '2024-03-07 10:56:54', '2024-03-07 10:56:54'),
(68, 'karyawan meninggal', 8000000, '-', 'pemberitahuan ke admin dan bagian kepegawaian', 9999, 0, '2024-03-07 10:57:46', '2024-03-07 10:57:46'),
(69, 'khitan anak', 300000, 'bisa berupa paket buah tangan senilai jumlah tersebut', 'pemberitahuan ke admin dan bagian kepegawaian', 365, 0, '2024-03-07 10:58:08', '2024-03-07 10:58:08'),
(70, 'kecelakaan lalu lintas', 10000000, 'per tahun', 'surat keterangan hasil diagnosa dari dokter spesialis dan lab, beserta KK, pemberitahuan ke admin DAP dan bagian kepegawaian', 365, 0, '2024-03-07 10:58:33', '2024-03-07 10:58:33'),
(71, 'bantuan meninggal', 2000000, 'plus papan bunga daerah yang bisa terjangkau dan tersedia informasi/kontrak pembelian online	', 'pemberitahuan ke admin dan bagian kepegawaian', 9999, 0, '2024-03-07 10:58:58', '2024-03-07 10:58:58');

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
(163, '2024-04-29', 1000000, 'anak saya akan melakukan khitanan pada awal Mei', '17143570642641707713917605khitan.jpeg', '1714357204886bukti transfer 0,5.jpg', 'selesai', 'selesai', 0, 51, 69, '2024-04-29 02:17:44', '2024-04-29 02:20:04'),
(165, '2024-05-03', 500000, 'untuk saya menikah', '1714700635845undangan pernikahan.jpg', '1714700700340bukti transfer 0,5.jpg', 'selesai', 'selesai', 0, 51, 66, '2024-05-03 01:43:55', '2024-05-03 01:45:00'),
(166, '2024-05-03', 1000000, 'saya sakitt', '1714701503643karangan bunga.jpg', '', 'tolak', 'ditolak karena tidak sesuai\r\n', 0, 51, 70, '2024-05-03 01:58:23', '2024-05-03 02:00:46'),
(167, '2024-05-03', 1000000, 'saya keguguran ', '17147031664941707713917605khitan.jpeg', '', '', '', 0, 51, 67, '2024-05-03 02:26:06', '2024-05-03 02:26:06');

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
(40, 'Admin', 'Admin', '$2b$10$.PbxqOX4he3hAY8WDLJGleObbGp00R3hGnvPgL0bTsiKDxkuw6/Va', 'Admin', 'budiprayoga408@gmail.com', '08783244333', 0, 0, '2024-01-09 14:34:04', '2024-05-03 01:48:27'),
(41, 'SuperAdmin', 'SuperAdmin', '$2b$10$2hJ5PKSFIUf6n4XR66AFiOPxkRiWdVCBxseRy9KuOXZbSfE0E3lPC', 'SuperAdmin', 'prayogabudi66@gmail.com', '089519113444', 0, 0, '2024-01-09 14:34:31', '2024-04-29 02:10:52'),
(42, 'Manajemen', 'tes1', '$2b$10$E8neBEBydjEolaQRAZ5piO7gahpcHWLg0aUbUGJ0LgKLKN.ZDOvMW', 'Manajemen', 'tes1@gmail.com', '087872428', 1, 0, '2024-01-09 14:34:39', '2024-02-17 02:37:33'),
(43, 'Budi Prayoga', 'Budiprayoga', '$2b$10$y.kjkpZl/m5yTjGclMf19.SN5Jgohtm67W638wjyZUmuQUsgVwAlq', 'Karyawan', 'Budiprayoga@gmail.com', '089519113444', 1, 0, '2024-01-11 02:41:07', '2024-02-13 14:01:17'),
(46, 'budiprayoga', 'budiprayoga', '$2b$10$Z3DYQOUdTifWGulXAsM8COSET0v44fAnoJFm6umuwklzWIR7m8T8y', 'SuperAdmin', 'budiprayoga408@gmail.com', '089519113444', 1, 0, '2024-02-03 13:31:11', '2024-02-08 12:34:37'),
(47, 'wdwdwdw', 'budiprayoga', '$2b$10$4Q1BceoMGkipue1hGmo.e.irhIz7mWDBw0ws3gGd.2jC6zCb8TRJS', 'Karyawan', 'wdwdwdw@gmail.com', '89519113444', 1, 0, '2024-02-03 13:44:31', '2024-02-03 16:18:54'),
(48, 'aulia', 'aulia', '$2b$10$G6FBTawMxK7Sq6udeegCteUnzMbiw39UG83wML92TZjuxHQ9L78te', 'Karyawan', 'auliaauliaauliaaulia@gmail.com', '43335666', 1, 0, '2024-02-03 13:52:05', '2024-02-03 16:18:52'),
(49, 'Manajemen', 'Manajemen3', '$2b$10$kONlxXu5uIRFdg7tyyfxbe.ws1aAY8M.9k.nJRdMk6I6WaQAZPCBy', 'Manajemen', 'ManajemenManajemen@gmail.com', '32423424', 1, 0, '2024-02-08 12:37:10', '2024-02-08 12:44:16'),
(50, 'Manajemen', 'Manajemen', '$2b$10$LaPF6L3KIkpiADv7cG7jpOBWOAbqxCJGp4RnVkGJMsJEVPcY.IiXm', 'Manajemen', 'Manajemen@gmail.com', '08934253333', 0, 0, '2024-02-08 12:43:42', '2024-02-26 12:26:10'),
(51, 'Karyawan', 'Karyawan', '$2b$10$bqHd.F1T2X1h8vXpRWwNl.rcA/tetICjOWT7nxc.tC47SpfZ8rzPK', 'Karyawan', 'Karyawan@gmail.com', '089519113444', 0, 0, '2024-02-13 05:35:15', '2024-05-02 13:35:56'),
(52, 'budi', 'budi', '$2b$10$r7GnuhirAdmnLxHoji3A1upIBb0j/X1CUwCVBBM.V.voGylfEC6N.', 'Karyawan', 'budi@gmail.com', '089519113444', 1, 0, '2024-02-13 14:01:43', '2024-02-26 12:18:00'),
(54, 'Budi prayogaws', 'Budiprayogadw', '$2b$10$adfiGVNoCujGIuHe0uKE6.r7sgrpTq.2PrlzTkV7OD0RqCGLhnVdS', 'Karyawan', 'Budiprayodwa@gmail.com', '0895191134442', 1, 0, '2024-02-27 14:18:11', '2024-02-27 14:37:44');

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT untuk tabel `pengajuan`
--
ALTER TABLE `pengajuan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

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
