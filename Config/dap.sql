-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 12 Bulan Mei 2024 pada 12.51
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
  `id_users` int NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data untuk tabel `keuangan`
--

INSERT INTO `keuangan` (`id`, `status`, `keterangan`, `tanggal`, `nominal`, `is_Deleted`, `id_users`, `createdAt`, `updatedAt`) VALUES
(55, 'pemasukan', 'bulan mei', '2024-05-04', 1000000000, 0, 41, '2024-05-04 02:19:47', '2024-05-04 02:19:47'),
(56, 'pengeluaran', 'bantuan menikah', '2024-05-04', 1000000, 0, 51, '2024-05-04 02:41:20', '2024-05-04 04:16:19'),
(57, 'pengeluaran', 'bantuan meninggal', '2024-05-04', 2000000, 0, 51, '2024-05-04 03:10:30', '2024-05-04 03:10:30');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id` int NOT NULL,
  `jenis_bantuan` varchar(30) NOT NULL,
  `nominal` bigint NOT NULL,
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
  `deskripsi` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `bukti` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
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

INSERT INTO `pengajuan` (`id`, `tanggal`, `deskripsi`, `bukti`, `bukti_transfer`, `status`, `deskripsi_status`, `is_Deleted`, `id_users`, `id_kriteria`, `createdAt`, `updatedAt`) VALUES
(169, '2024-04-03', 'suer untuk saya menikah', '1714792212989undangan pernikahan.jpg', '1714792230239bukti transfer 0,5.jpg', 'selesai', 'selesai', 0, 51, 71, '2024-05-04 02:50:21', '2024-05-04 04:04:17'),
(170, '2024-05-04', 'untuk saya menikah', '1714793701745undangan pernikahan.jpg', '', 'ditangguhkan', 'ss', 0, 51, 66, '2024-05-04 03:35:01', '2024-05-04 04:04:53'),
(171, '2024-05-04', 's', '17147938469501707713917605khitan.jpeg', '', '', '', 0, 51, 69, '2024-05-04 03:37:26', '2024-05-04 03:41:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `nama` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `no_telepon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_Deleted` tinyint(1) NOT NULL,
  `is_Blocked` tinyint(1) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `password`, `role`, `email`, `no_telepon`, `is_Deleted`, `is_Blocked`, `createdAt`, `updatedAt`) VALUES
(40, 'Admin', 'Admin', '$2b$10$bDrfw9RLk4Xb9mTPsf65Xu2Rdi3OoSgf1nM8UOvF8a11hqEIerTMq', 'Admin', 'budiprayoga408@gmail.com', '08783244333', 0, 0, '2024-01-09 14:34:04', '2024-05-10 08:35:49'),
(41, 'SuperAdmin', 'SuperAdmin', '$2b$10$2hJ5PKSFIUf6n4XR66AFiOPxkRiWdVCBxseRy9KuOXZbSfE0E3lPC', 'SuperAdmin', 'prayogabudi66@gmail.com', '089519113444', 0, 0, '2024-01-09 14:34:31', '2024-04-29 02:10:52'),
(50, 'Manajemen', 'Manajemen', '$2b$10$gGdoVTqUyu2tVsHYVK//.u/mDIntrDKP7j2/PLRRLdkCnDzxvrGIG', 'Manajemen', 'Manajemen@gmail.com', '08934253333', 0, 0, '2024-02-08 12:43:42', '2024-05-10 08:35:36'),
(51, 'Karyawan', 'Karyawan', '$2b$10$bqHd.F1T2X1h8vXpRWwNl.rcA/tetICjOWT7nxc.tC47SpfZ8rzPK', 'Karyawan', 'Karyawan@gmail.com', '089519113444', 0, 0, '2024-02-13 05:35:15', '2024-05-02 13:35:56'),
(546, 'ABULIJA MASKARAI', 'abulijamaskarai', '$2b$10$IiVWGxgo/I/fLhzbs8r/pO6M0FyesSITU8OODsV5Z.gyGiKjeJWn6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(547, 'ADI IRAWAN SETIYANTO', 'adiirawansetiyanto', '$2b$10$DkAnWkJun6k/h1H3nJh0aOWw3bZ4G42TP1F7Mva1TeXYqZYBrb5Eu', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(548, 'ADITYA GAUTAMA', 'adityagautama', '$2b$10$oFbjWS/47h5hIoswwWFoHeM7a07u72c8/FqVSOjB6wvkIeoaKkEDC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(549, 'AGUS SUPRIYADI', 'agussupriyadi', '$2b$10$Os9TSnrKXZNHppa1GbTj3uch2fdLpzmgzzNm/2F20PDGVpIGeaWEC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(550, 'AGUNG PURNOMO', 'agungpurnomo', '$2b$10$NKOT7QQlhqZNzEhUJf7AKeQjanKMO7Yysy0TaLeOYMWaiJFYvuo7y', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(551, 'AGUSTINUS HERWIEN GUNAWAN', 'agustinusherwiengunawan', '$2b$10$c.pxBDa.XondGvl/OG1K1uEwfS8feMLLpnQhyihc520Z18LHnGHfm', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(552, 'AHMAD SAROPI', 'ahmadsaropi', '$2b$10$By0mnohYpgiOAI.oLQ7AMedlVIB7/aQWxJYQcziB.eM23UO/8HzOC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(553, 'ALDINO SAPUTRA', 'aldinosaputra', '$2b$10$J.E2XQqaoNFjfAuasrDpZeAZY/m2lVEA88LMGZbQj6yEjm/g6/nyO', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(554, 'ALFIAN', 'alfian', '$2b$10$BPT2og5bGeUR2qUsPMaDjOlw4Bhe46QI8BWzrt1FnVCYxRsB8IS1K', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(555, 'ADE ANGGARA OKTA MURIA', 'adeanggaraoktamuria', '$2b$10$/sHLnSLztB7iie3R4iydduL0ooS.7xvnNDbE9o8pVX0t6OZN3Rvg6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(556, 'ALLIF MAULANA', 'allifmaulana', '$2b$10$DuOhswjT21vhXU.jSRDDQ.G9qWBgvHvQwcKc9uCb5SwIpG.0VRWeG', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(557, 'ALRIDO MARTHA DEVANO', 'alridomarthadevano', '$2b$10$IqRFa0GBTiIurgw/yERIsugw0oAAwCncnIUvUtdgv7V.W/KAv9vxG', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(558, 'AMRIZAL', 'amrizal', '$2b$10$peAfniXyWixWtLhPN3dG7.z0aiYBOjZn6urugQYaOz0oUdDc8tS1a', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(559, 'ANDI HARTANTO', 'andihartanto', '$2b$10$wR5sBamtCTtHUGKFxUAvPuL.qpKMkrsW6X.5yj4RHxFK58Fjl1fi6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(560, 'ANDRE AGUS SETIAWAN SITEPU', 'andreagussetiawansitepu', '$2b$10$g5Ygr/W70n3NcQs6SihWtuzt33ttEcfNfjY3BLiJVhhXv1gYqxEyG', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(561, 'ANDREW WILLIAM PATRIA MANTIK', 'andrewwilliampatriamantik', '$2b$10$uyExlgsGGy00vjUI.RiFKeV.H6C4KNVG1fWdctNIIXHKmRKxiFk6K', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(562, 'ANIS RAHMI', 'anisrahmi', '$2b$10$LEakFylhMDDBw09RGrWtx.7OH2BXLNrC5N3qwLUBjUO91YDm79Orq', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(563, 'ANNISYA FITRI KHAIRINA PARINDURI', 'annisyafitrikhairinaparinduri', '$2b$10$enFgyGeIwStH2IYYeS/RL.s9It9hsVarXSqz59omDD2rMH5wuZvw.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(564, 'ANUGERAH WIBISANA', 'anugerahwibisana', '$2b$10$iGOXhvlvohYUMAl.tOzb.O6RbRJSr9JWX8ctYjGyjNo/oGKvblnMe', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(565, 'ARDIAN BUDI KUSUMA ATMAJA', 'ardianbudikusumaatmaja', '$2b$10$2oCn8I7o4aSINlqrymQhau376fAIXUv4R7jacQ6POYS3pC6GdEMc2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(566, 'ARDIANTO', 'ardianto', '$2b$10$Pnr2qokTN4ptkVJZetIjS.SRY.utT3x67GtiRbh96NDDfQYQtD7vy', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(567, 'ARDIMAN FIRMANDA', 'ardimanfirmanda', '$2b$10$jeu3rRm94Ly9lygMYRbWWeRfGxGxHyQeFcl.yoqeb2tsKi.qQZ2H2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(568, 'ARIF MUSPITA', 'arifmuspita', '$2b$10$kjUCqV4zRrhKRDQPllrYhOARktQAW9wVcod67xk1vmpHPGAbBIzZK', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(569, 'ARIF WAHYU BUDIARTO', 'arifwahyubudiarto', '$2b$10$VJqI6SWo0MO419ZkoSVjPeF2eLZgSIQAi1ULYTrqMDPZ3ToOqj966', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(570, 'ARLIKA BELLE', 'arlikabelle', '$2b$10$PSTx.2iCaV.Yfw6m5zOjpuxhlzLhZwyBYQwdDc8f/tPLy5dhtXSPS', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(571, 'ARTA ULY SIAHAAN', 'artaulysiahaan', '$2b$10$pIPQxKeszVlgs/b7QdgDsOx8VsqbbZN3vFnYMjWcRg3dFl/bxXfni', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(572, 'ASRAFI', 'asrafi', '$2b$10$HzXugf3KzBh4JTYdqoPuZOsh/jW59/DueMKvs.Bs87MjJLZKrO7re', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(573, 'ATIQOTUN NISA', 'atiqotunnisa', '$2b$10$ErcUf/i2sVkCMKQ2GJX8Budj/X9Lx5g2fQw1xEKHGXihRif9xHRR2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(574, 'AWIK ARUMRASMY', 'awikarumrasmy', '$2b$10$UZ66XZzCHtl9DGXPRritw.voygNX5yG4hq5w1.Ol0dycrKyUwlifW', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(575, 'BANU FAILASUF', 'banufailasuf', '$2b$10$iUw5zwmiANtE3k/VUcbsHO55nlve/pOthVVbrG38V8Fqz.HKkW2uu', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(576, 'BAYU PRAYOGO SETIAWAN', 'bayuprayogosetiawan', '$2b$10$79RoFMN..kvAgec.nIKbQeF3U2WpWIr6EPGREmRKMvy8EalMLeTcq', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(577, 'BERNI YAMIN', 'berniyamin', '$2b$10$t0NIdPNP3u.K2lH6qj1XPOjnuOOPxJyWmgPg3K88iA9Z0hXOr8.nW', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(578, 'BILLI ALDIN SUMADIREJA', 'billialdinsumadireja', '$2b$10$E2Bs2Y.tLntERBsHEMaE6uEgIOlbVS.4bZzUl6R..TrKcnj5M7hH2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(579, 'CHAIROEL ADAM', 'chairoeladam', '$2b$10$BLnURnLy9x2jK24ECfSteebpeQmvpSYcMjJ/Bzz0jlVh5dDIprATK', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(580, 'DANAR IRIANTO', 'danaririanto', '$2b$10$RRw4VGwMRU2bpxvrsapQZe8xYegnrW6AdXAYCTUEXjAP2MwnBXfgm', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(581, 'DEDE NURDIANSYAH', 'dedenurdiansyah', '$2b$10$3Cj/BsW0ahyxglgS/zyW1.2fZl8jSVZ1srHHwknyYlnl00D1efdtS', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(582, 'DEDE RUSBANDI WIBOWO', 'dederusbandiwibowo', '$2b$10$OkCFOsFyb3xJDtyfQ45lIeqh4jXxUGe9Notf3bI2IfdgLipbt6ylW', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(583, 'DESI RESTUTI', 'desirestuti', '$2b$10$w1oExv5Zow/AWpIn6uOt.e.8Ho1KjOs0/miSW1IGGpF12vFFeeaM.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(584, 'DESSY RATNA SARI', 'dessyratnasari', '$2b$10$5/6y5GGzA9jF/HLRCHC76OpXwos9LrjF3jhcywRM9crG54f2f9zh2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(585, 'DIAH AMALIAH S', 'diahamaliahs', '$2b$10$1ASrhPbkuJrKpxAzxny2uugc.CcAnUFX0NUL44uHewh03yhpzwiv.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(586, 'DODI RADOT LUMBANTORUAN', 'dodiradotlumbantoruan', '$2b$10$VtClkZMMxX3rkhW198pRCuUTGg/Eo5UkBJHMXU./LQexYZ2RNu2gK', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(587, 'DWI ADI SETIAWAN', 'dwiadisetiawan', '$2b$10$2JExB9v8W3.Q3jCAorcR/uihhYksF/Vx4J4Eui2fFBHVeVuUZKJaS', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(588, 'EKO RUDIAWAN JAMZURI', 'ekorudiawanjamzuri', '$2b$10$ai0g/0MLuzw83HpD.U/tAu7a4e1fWc/efCerkucPFF4BBONsApdP2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(589, 'ELIN APRILIA', 'elinaprilia', '$2b$10$H9de42xMwwHNUJyZ4JS35uXAn.z9c/Jnzq2eUtScK0bxm/N/3ZJoq', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(590, 'FATIMA AKMAL PUTRA', 'fatimaakmalputra', '$2b$10$XRqg/plSKBe3C/Iie1KmQeWEp4WtFqE3DQtvyxe8wr14U6OyNLY.C', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(591, 'FIRMAL', 'firmal', '$2b$10$HvdGrYCAkU1jB9tEhVZzF.ZwBEafEE/mcXVYtmd3Xhuxrbjsfi5zy', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(592, 'FITRA HANDAYANI', 'fitrahandayani', '$2b$10$2RsXBixhsdk2BiyMFcO35u4A.ShakKY1VaOHsJy4/R4YD7tdVqCoS', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(593, 'FITRI REZKI ASMILA', 'fitrirezkiasmila', '$2b$10$LolVzHwTNd7FsLcF2ZxTsuBjGjVGi.YrC/7OHQcZ4IuE6G7h3xNqS', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(594, 'FUAD ARIF RAHMAN', 'fuadarifrahman', '$2b$10$ahqu0y9h4y2Sf.sNhJqLXeLOxkcKjgcYVnd3wIse8xE3BHSqxaBF2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(595, 'GATOT SUBIYONO', 'gatotsubiyono', '$2b$10$We86jE.9nvgPNPJp/yOXqO.Ew0mdKRMKLiDej8B6YdU7f5uo5hqc6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(596, 'GAWAN SAGORO', 'gawansagoro', '$2b$10$pndHJK6p8EcblXDAe1dXNuc/5wrzyO2sNn7dsV6VC0U2J4vI2qziK', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(597, 'GENDHY DWI HARLYAN', 'gendhydwiharlyan', '$2b$10$3NiHdclGjKU3NXuy81jyouOhosQdm2zp9Sc5huBvVSKEqasSwtVOW', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(598, 'GHUFRON RAMADHAN', 'ghufronramadhan', '$2b$10$ZW3HcW4S2HWhWwqTyQzLvu6w6g9JymLXRUXZ3F8XiEuBkLOlnsgSO', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(599, 'GILLI APRILYA SYAHFRUDIN', 'gilliaprilyasyahfrudin', '$2b$10$NxuCZDkfVBPxIOL0dpNjWe9zgftjYu/cx3G/vjWiv6MbauzJuLRbS', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(600, 'HAJAN HIDAYAT', 'hajanhidayat', '$2b$10$e3razjrSA0jeljbLe1e3XekpeA4hNnQi1K5tcQ6p.8Mw82ahfjs8a', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(601, 'HAJRUL KHAIRA', 'hajrulkhaira', '$2b$10$lBy77Wa74OS2UaGgUiI5VedcIziHTcmWtJxR5bOX23s9YU76Xd7Zm', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(602, 'HARIYANTI', 'hariyanti', '$2b$10$ApvJCMHa1go3xIFFVgdreOhWHNcYGcr65a3gDwFYZhlpuOnVer.nW', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(603, 'HERU SATRIA BUDI', 'herusatriabudi', '$2b$10$bvB.l51KFI3kSQ0w3Zpkg./SN2QmWlm029AGSoj19psTSOhCzp0ti', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(604, 'ILHAM KURNIA', 'ilhamkurnia', '$2b$10$FcQNqA8qrq50hbk2ZBKoPOGSYbx7o0SnZLeyHV3.NI10AQPg9SgeG', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(605, 'IMAM HIDAYAT', 'imamhidayat', '$2b$10$2BF4tbNfOBDbQWWgDOZUFe4GuD/N9Hbs1e3yYFCaJsUr6c0FAfuWi', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(606, 'INDRA DAULAY', 'indradaulay', '$2b$10$o4jmoOEFk30gNP1mmiyqe.ntHkaDO0p8Ym8ZyDBq81qG7lrdR.fZC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(607, 'INDRA HARDIAN MULYADI', 'indrahardianmulyadi', '$2b$10$3WQPjvfWqKRm5je9VUUm2OOvPEutEYlTCcKMVJMpHyI2.zhzhQKE6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(608, 'IRA ZAMZAMI', 'irazamzami', '$2b$10$D66YTPYsYce2GmYeobDymO3Oh3vz3.aDgeuxQMo7BSx8T3sQAbs9q', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(609, 'IRKHAM NUGROHO PUTRO', 'irkhamnugrohoputro', '$2b$10$wfVegKYN2AQrUcaJxQxOo./dEtNNDvTzmHSdbBMvsNnzXMjOiGPva', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(610, 'JOHAR WAHYUDIN', 'joharwahyudin', '$2b$10$Zs7gFVMtfCgtBF2CUBnwDudE2kyEWIKqe4R8NjMlZMfXl.70OUrq2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(611, 'JULIANSYAH YANGU', 'juliansyahyangu', '$2b$10$aNYuGIk60f4Odw2e3SP2D.8L385Y1fiUKMjwg1IHHu5xIeoCAkz4a', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(612, 'KARIMUDDIN HUTASUHUT', 'karimuddinhutasuhut', '$2b$10$KgCZzXy5dJq3it2Fan.yQ.lRZfyPo45jWUNskDrsjJ4u.eXMWrV2W', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(613, 'LALU KAISAR WISNU KITA', 'lalukaisarwisnukita', '$2b$10$2LCC3/Wed8GAD/uDzASfnOWEqc3twod32w9rvH9V0kdywPd0miXQO', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(614, 'LILIK SUHARYANTO', 'liliksuharyanto', '$2b$10$DEVq/0HAcncllb7U6C.a2O6ti1VlJ5n73rkzIgQXYTQvuIkSCI6GS', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(615, 'M SAFARI', 'msafari', '$2b$10$.JzOTjFa.ZULIKjabpIBOON2IwKRHh6i9qsGysdkE.j0L/e4pRsRm', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(616, 'MARDALENI', 'mardaleni', '$2b$10$SqRLem.y5JhinqpxDNxujuzlN43dF9aa9LUcP9rR6Mifq3hvTdo9.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(617, 'MATHEUS MARULI', 'matheusmaruli', '$2b$10$a0UEU19Ro0CRV/sqN4LuWePQv1U9H2DKBt98MonV8UhC1kkyFt0Ne', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(618, 'MENDRITFA FADLY', 'mendritfafadly', '$2b$10$kXa9ZPZ4KP1PpYdwI.S7jOr/m3Fn.aJgg84oK8RHTl2pBIp3RiHNC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(619, 'MOELJANTO', 'moeljanto', '$2b$10$N9w.kgjoaz0nFRYAqufIgeLkQ2.RdsXLwNXNiX87XInHHz0IjVWsC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(620, 'MUHAMMAD FADLI KUMANGKI', 'muhammadfadlikumangki', '$2b$10$nI.V1BbZYD7IuniEOBxnee5kYtfF5/05/z/UjZe69gbQWKDVy0K4u', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(621, 'MUHAMMAD GHAZALI', 'muhammadghazali', '$2b$10$0171zYgCqHz1JY47Tmeleuo1bjziQiAMRjbFH8CBs34GJeKcQVRxO', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(622, 'MUHAMMAD IDRIS', 'muhammadidris', '$2b$10$SgRLzCFY8oFKnqYXF76BzuNNYwB1BQL3TtrhJKRZEQ2rHrJdPrRDW', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(623, 'MUHAMMAD ISMET LAU', 'muhammadismetlau', '$2b$10$RI5UYdniYUAPknXtTG35VuAB8kpBWh8cm4DaSJ0VKtrxonj5waOa2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(624, 'MUHAMMAD MA RUF DWI NUGROHO', 'muhammadmarufdwinugroho', '$2b$10$DqAWu6.v0IOJE8VPqfxPVeq97.oabrjub/HuIKQeyoXOw0ELCU5e6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(625, 'MUHAMMAD NAUFAL AIRLANGGA DIPUTRA', 'muhammadnaufalairlanggadiputra', '$2b$10$287b3i7lgou8r9/qbcKTCOEox6E5/Zx8NPRSYaLpiEW.gzo1maD0q', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(626, 'MUHAMMAD PAIS BIN AMSAR ', 'muhammadpaisbinamsar', '$2b$10$G/psQgNgpcJkNdi2BBJusukHvSdJgjYC6kqbtfazbvEz2dXQAQ5Zi', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(627, 'MUHAMMAD ZAINUDDIN', 'muhammadzainuddin', '$2b$10$bezdw68UCXducmjjHPbP3.gRD5Upby7WNPNG4s4vBq3dD0kdNcmxK', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(628, 'MUTHIANA GUSNAM', 'muthianagusnam', '$2b$10$DdJxGq7NuCEIWjLVNRXSTOwAPTKaGWhgSkJqrKt99HpNtIwfZYZJ.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(629, 'MUTIARANI', 'mutiarani', '$2b$10$6KL2wBHwM3rtbhUg/F2QAeBk/yQgWeSV17v1a14B3PoSd0FR2WBuu', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(630, 'NIDIA YUNIARSIH', 'nidiayuniarsih', '$2b$10$9KBz.cnA2lwgfSGsj7KIcOJLllZbySrTMKSl0mgzbiE1nJl6w8IIe', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(631, 'NOFRIANTO', 'nofrianto', '$2b$10$PG72geEV9nAmYSnUC/Cv.u70SWxIpLWQSsUN1lDoRH53Prepo2D.2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(632, 'NOPER ARDI', 'noperardi', '$2b$10$EHNx0rCPboMJao94AuaAuel5p/gEot2ZfW6Uv2jiVXkRDBMr8mAT2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(633, 'NORA ANDRIYANTI', 'noraandriyanti', '$2b$10$8nkKby0PlAQGP75Svx6BkuvisCyJ2JKvi7qbLJvpZsgdqm7mNwr9y', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(634, 'NUR RAFIA DIJA', 'nurrafiadija', '$2b$10$LnODoHPYkE.HYgOer9R6F.T4SPCocDcqHasHqIccbtyCUxop/SNiG', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(635, 'OKTAFIAN FAJARINI', 'oktafianfajarini', '$2b$10$5nIAFsoNfPMVAobB2UAgVOdZqaXXxPJg05oLI.tiVXnxOI/IoidAi', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(636, 'PASRANI GUNAWAN HUTABARAT', 'pasranigunawanhutabarat', '$2b$10$2HuukDmvPULk5w5q/FqeQeGSV.5gUR94zW8OSX9b36cP4tx1NSKeC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(637, 'PRIKI ADIMARTA', 'prikiadimarta', '$2b$10$85iXmGfj74pR.RS5o/0zVO5/OOTUJe9eghWTQraLP4ZakXCoZGocu', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(638, 'RAHMAT AJLANI', 'rahmatajlani', '$2b$10$r6M0.l3.zH.QsCcJgIlSJeJOIzbfPiS34MU4mgQSyK..c7Ikw3KRG', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(639, 'RAMZUL HUSNI', 'ramzulhusni', '$2b$10$IaJoQHegYY/xkwt.6hM5jOO4fuJ8C0g52q4q6Pdg65VWYwtWfz7Eq', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(640, 'RANDY SAPUTRA', 'randysaputra', '$2b$10$E6yBTy4HsNQviU/M7K7d/efn4klUFoCd8T5R/bCFjKCvwCKbKC4Gy', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(641, 'RAZALI', 'razali', '$2b$10$qmN0kIv4TEEbpbJmLHlvBe5t6RPzVHew2q2JkZbuXQmDw9/QNjsy2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(642, 'RIA ANGGRAINI', 'riaanggraini', '$2b$10$7YHscMNbau19yPTjPT7tSOesf/IB3Vtgu/KDo4B52uyuF/j/Hwog2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(643, 'RIDHO TANSO RIKALMI', 'ridhotansorikalmi', '$2b$10$fSJ3dSMWhpt/Szh8C7kFSOlV3siF5OpoFV8MpQZO1kkv5wejWDmiO', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(644, 'RIFKY AFRIZA', 'rifkyafriza', '$2b$10$jg/IX4o4IC8c3L3P3AcUHOIB.atOAUS4v4529o.sIB8XMPU9cMqwG', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(645, 'RIKI', 'riki', '$2b$10$Im0ldxHGhQLNEVVP7LzzA.dFaM.NtGOGWd9YRBLKwLA13oAGsf.sS', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(646, 'RIKI RIA', 'rikiria', '$2b$10$.ro7IIwZwl6WDWJrSux5fOfgDtRWI6IrqliV5RmUs5oU9syjWCXqu', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(647, 'RIRI ZELMIYANTI', 'ririzelmiyanti', '$2b$10$t..SYydPh9ccBermqA.LUuU9Su4RN7VRQ4/t.vHi/cH.Fzfiwp9uq', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(648, 'RIYON ARIYANTO', 'riyonariyanto', '$2b$10$/T14OURTrgaWhHkewer0HuGy1ICEUHC62veVd1/L6OxiRERSXgQV6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(649, 'RIZA ASWANDY RITONGA', 'rizaaswandyritonga', '$2b$10$L2B80lw1wc3HZLKVCHWUAeV1X9wAivGIuPO.jXz9h4LxDjIU4PR7a', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(650, 'RIZKI WIDI PRATAMA', 'rizkiwidipratama', '$2b$10$Qm4zaroVTy1Or10dv3wbSOZmbCRuHjIsGB7uGP9c9paa.QD96mEkC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(651, 'RIZKY SAPRIADI', 'rizkysapriadi', '$2b$10$1pBtwVRn62VV4stp2dkzXOVJEn/pBqfPbLXfiaI7p3tz1IBTqIc62', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(652, 'RUSDA IRAWATI', 'rusdairawati', '$2b$10$tlQ2gH6Cw7TsbQFkLR4cJO62YKTqSYXkzM1anIjh7tU6edgqCYely', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(653, 'SARTIKHA', 'sartikha', '$2b$10$VviDhVXQ9V5.enumbFdUZ.DjOZdAM0BcyUF1CqtSHbokD11UHPl5q', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(654, 'SINGGIH PRAMONO', 'singgihpramono', '$2b$10$OjeIDVT4fzCGO4s2Ir/S0e54PFehhfbtsInzmnbPgNMNOEqdeFlQu', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(655, 'SUTARTO', 'sutarto', '$2b$10$oRrUZhRnPCoOetsC68bGIuzfnVRW2sucQdktHYEYANmKHZghT1oaK', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(656, 'TIARA', 'tiara', '$2b$10$cHxOerMLRB44t7SQUWC7vOHpWLHOU9bbe2hY8jYelN8B3zWDab6pK', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(657, 'TITIN SUMARNI', 'titinsumarni', '$2b$10$ByNTsj0qhk71K3Ep/zftI.5F./3DjCFKkPRJGvCtVXgZqllQ30soO', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(658, 'VERYAWAN NANDA PERKASA', 'veryawannandaperkasa', '$2b$10$qGApfHRXD3IxmXywXPs0s.xS4XTCxNFqSNSiyXB9C4murq4YgsroW', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(659, 'VIVI WAHYUNI', 'viviwahyuni', '$2b$10$ij4dZskSHKjJggYkNohraeRGsTbHS9fp4n9/WywA1s8b86GGzIj4u', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(660, 'WALUYOADI', 'waluyoadi', '$2b$10$rd8pOAtCkDRWpiQzwMXEeuD63ey1eB40m.oXKbG2jlac6MLJek7wC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(661, 'WIDODO', 'widodo', '$2b$10$5Qu2Kx0wbLWUDYJgb/Rcye5NkT52Mg.4rRzQ9MbznnlLWpP9dK/CS', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(662, 'WISSESA', 'wissesa', '$2b$10$sh4/sUzIqg5a4u4P2waMqeLi3Q2Izb6/lOmkGWF4CetyC7JrepLZu', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(663, 'YESI DEVIANA', 'yesideviana', '$2b$10$3dEAvSf8prMIcBGd26OMZ.bIcUMBcSGJP1XckLrOEcgch9ZlGBokS', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(664, 'YOGANTARA', 'yogantara', '$2b$10$rt5SZbChbNHBziDhWcxSPedLDa1TIa0Y.KjcGMml2BmNiIjL4qQz.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(665, 'YULFIANA HARINI', 'yulfianaharini', '$2b$10$VtIRhKjOCoRC6CR0CX6ABe.epGl4E1UVbP1vGYwaFfonJJG.fNlEe', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(666, 'YULINDA', 'yulinda', '$2b$10$OxedxK8Pu3NdYnH11NNSqexKRYjT/16rTQ4WNfVUeFaK7rCtYj3nu', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(667, 'YUSIRAN', 'yusiran', '$2b$10$fC9gR6UGKurc6RRJT/hCxOG1tzoYE4NIcbCzxQbuM69rGbv4z3pb6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(668, 'YUSRAN JAKARIA', 'yusranjakaria', '$2b$10$J6dOfq0HaXwYILPhhi7CPeZ9PfZsfI93jU1I2th0uDhYEZRpc9maq', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(669, 'YUSUF RIZKY NUR CAHYONO', 'yusufrizkynurcahyono', '$2b$10$0P6LNtXwRP8HEsEFhxrHJenomXeI.DV9eBfTHLIC2i6UBUUlxVUKS', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(670, 'A HAMIM THOHARI', 'ahamimthohari', '$2b$10$FxCYOrSkl81z5I9v62wZ0uNxvTvHxl9HzaHY.cBkF7542t.dZxtOy', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(671, 'ABDULLAH SANI', 'abdullahsani', '$2b$10$NAEJeiMW5jup0ITj97z2bO0SK9doYBTwOfvhBBj.BGYjLkPUTpDA2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(672, 'ADHE ARYSWAN', 'adhearyswan', '$2b$10$kMfuJR5KkRycdpOQAQpWhO9uvn7RzOoV8.9Z74LACZ6yINEvQGn..', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(673, 'ADHITOMO WIRAWAN', 'adhitomowirawan', '$2b$10$lW5ikp/8c6k.C0n3fnFSS.5FDW0X8fPPdyBMCl9yo4P3jcAYaZn9O', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(674, 'ADITYA WIRANGGA PRATAMA', 'adityawiranggapratama', '$2b$10$VrN.QPKEhSz53D3pnaLv7.8fIl4pRw4ID50YCiF4puwsrwpBT6csm', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(675, 'AFDHOL DZIKRI', 'afdholdzikri', '$2b$10$nQHXRShHKSoKZQjmeofqV.ixYcRvNSkKcdq4/TLts/6DMqHutgLB6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(676, 'AFRIYANTI HASANAH', 'afriyantihasanah', '$2b$10$QpYqtwf5G6MZkxH3c6HyLuENtatoqJwlj5Z4AuMicoucF0vY67h5m', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(677, 'AGUS FATULLOH', 'agusfatulloh', '$2b$10$obOHYFu4zPNPgBTk4giOv.IZQXLD.idOnrPEHqhwUhSSjbVWJzXmC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(678, 'AHMAD  RIYAD FIRDAUS', 'ahmadriyadfirdaus', '$2b$10$.4P9GN5HysQjDolPPAX4C.B0AHHrg/4DUB5kPmak.mDFTQstfY7gO', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(679, 'ALFONSA DIAN SUMARNA', 'alfonsadiansumarna', '$2b$10$o8WVybYq8TtKjDsfKzDANud7JzvjiIeTlDDYam8SBZh3CY75FLN8a', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(680, 'ANDI ERNA MULYANA', 'andiernamulyana', '$2b$10$MZS2hPH0Bqf8GOr6q6vqfuYNeBCrJhubyVh15vLt5UXyC5cGE.XHK', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(681, 'ANDY TRIWINARKO', 'andytriwinarko', '$2b$10$QRYHIRvGWmBkAXK.35l0EuPWc4AJD7DbWUViBo2UgILIQ0NvDCrH.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(682, 'ARI WIBOWO', 'ariwibowo', '$2b$10$1zpqsYuKl2qYCPQQf5Y8Xe8Vl.GOcgVEaqMLSi082mnXJg6r5UCQO', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(683, 'ARI WIBOWO', 'ariwibowo', '$2b$10$RNnqjHYHlYqOXuVLB7AIDuhKfiwOIne73oZOi6UUTVWGP9R6n34ym', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(684, 'ARIF DARMAWAN', 'arifdarmawan', '$2b$10$aa05pKSNwhd.serujedtXup6YN7zE9jGOY/yJuDb7OK.aAa.2KF.6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(685, 'ARIF FEBRIANSYAH JUWITO', 'ariffebriansyahjuwito', '$2b$10$fhV2E26BpiHP9utJCOBmO.T5WX05jfZ6gFomQWQDZtnOxUO2dPu8.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(686, 'ARIF ROZIQIN', 'arifroziqin', '$2b$10$HctjzNtgT5.8IllMDAocluXes2xjVnq39Oe3zwnSV9y5yGWt68DHW', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(687, 'ASRIZAL DERI FUTRA', 'asrizalderifutra', '$2b$10$p3cAeF/4/g1PjFe0lkpeqehCQvHd6M1mYfnO2hCSXM6a3eoKRNbxe', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(688, 'BAMBANG HENDRAWAN', 'bambanghendrawan', '$2b$10$YY3R7wxnK.WkrdC1T9kn7OqF7s3rRZl1hsy7AVLwmD7CHeYL8oesG', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(689, 'BENNY HADDLI IRAWAN', 'bennyhaddliirawan', '$2b$10$1UqbfNa1EaEzJn0/CjaiKuy18rowI.JtIQORMd09FVzQ7f3DCQPry', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(690, 'BUDI BAHARUDIN', 'budibaharudin', '$2b$10$WRnqaVqhfTnonviVpUQiguEcNWcj.qzR/1EfBoHFl8GDsU1U7PKf2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(691, 'BUDI SUGANDI', 'budisugandi', '$2b$10$jjGMzteG53zqTIYnmeWVnO2ciHaMo8nH6wdTA5H3DCtRm6Vz657yK', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(692, 'BUDIANA', 'budiana', '$2b$10$o5m1nInoQ.c6ydFI5Ir6se/RW3xVjBxgc4bafxpw7ASAVIbfizmpu', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(693, 'CAHYO BUDI NUGROHO', 'cahyobudinugroho', '$2b$10$3oIHxhipvTccMotS2LbSv.mvnLEqp2PA0ZNx8DDeG3vpDL2LLdBSy', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(694, 'CONDRA ANTONI', 'condraantoni', '$2b$10$dbsspOT.dMA22Fv.UNyJ1e53g7A0OE8x0o75/rrw1loTDrz2D.dC6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(695, 'DANIEL SUTOPO PAMUNGKAS', 'danielsutopopamungkas', '$2b$10$aPpkTNLA5JGaRyUcGnCsfujIlZDJsfIslB9FgE0PqOfXiKHYvKZbq', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(696, 'DEDI KURNIAWAN ', 'dedikurniawan', '$2b$10$T5QrUV77oQk5/Aqv2qsZeuzVbFqi7y24MWuKpZ4I1sGFSxN614Mfm', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(697, 'DIAN MULYANINGTYAS SUDARSO', 'dianmulyaningtyassudarso', '$2b$10$DTVGUpoC.UU1RqKOsReXveboB5Y24OTd5bEkZ02/okYLHK4rblWS2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(698, 'DIDI ISTARDI', 'didiistardi', '$2b$10$sQYX/b2CrEMKnYv6nKaYRusovWIcDLG4FSSqzfD2CHmx7EY5lj3P6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(699, 'DIONO', 'diono', '$2b$10$eqJIXfi6P6zuovxxxrxDb./QSdcg1kkPfuKBipDddRI4sQzSNrWfG', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(700, 'DOMI KAMSYAH', 'domikamsyah', '$2b$10$Em663q0fBpmdPk3MNbXlU.Unm4Q4vQ08hUbd7N85nrmLr6zUgcGRe', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(701, 'DWI AMALIA PURNAMASARI', 'dwiamaliapurnamasari', '$2b$10$YgSFGRCiuyh10C8khqtW9Ofhh31O.gSn8VNkb8/ClDHeosYWZ6.ly', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(702, 'DWI ELY KURNIAWAN', 'dwielykurniawan', '$2b$10$Q2LbiaKRNFJ4u1VXUmj/c.1NkieUwFigZ5vCJsssigrM.NgHelnZO', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(703, 'DWI KARTIKASARI', 'dwikartikasari', '$2b$10$0G/XZ7xAQYbL6UI4TUYCg.pX8XGt.IT.h0Gmel5RctIF24fKeoNgy', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(704, 'ELY KARTIKANINGDYAH', 'elykartikaningdyah', '$2b$10$5.f5UN6fhSwFiw26iKgOGOWprD2fACEM5dd.eaGE2TTznQd1phXrK', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(705, 'ERIKSON TOGATOROP', 'eriksontogatorop', '$2b$10$Rz5PCxPtNcSpbkfj12vEdeZ0cQQwYAO2rGvXpEGMJ0xgde1roT5D2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(706, 'HERU WIJANARKO', 'heruwijanarko', '$2b$10$vliyyXIcrFtv300AXEqmT.0jcAUiQbjcFzRuqq/BQ3vGD8b7WCSeu', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(707, 'EVALIATA BR SEMBIRING', 'evaliatabrsembiring', '$2b$10$ekxlKuuBYpv40V3vojgy8eLnUuCyR7cAHVyx2n2Q/zNleCSjt/Ciq', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(708, 'FAROUKI DINDA RASSARANDI', 'faroukidindarassarandi', '$2b$10$PdjvDx4zR5Lwho4O.8n/KuHurUJEdi0gWujIcMxMMM5L.kBe52eKy', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(709, 'FAUZUN ATABIQ', 'fauzunatabiq', '$2b$10$yNA6j9l5aRGZh75iSmebDuR3K4LgM3s8qrfnLjQ1WgyErytgk4FNq', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(710, 'FITRIYANTI NAKUL', 'fitriyantinakul', '$2b$10$xi4Sq87jgxrrsR9pWh1au.DFjufoahJhMBBZPuid7fX7xnYvtgpZe', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(711, 'HAMDANI ARIF', 'hamdaniarif', '$2b$10$U2J.9.SL12BoWZJwti2d0eAidgOXIyDMw2fdMnIbxX3qS2v0bVEDa', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(712, 'HANIFAH WIDIASTUTI', 'hanifahwidiastuti', '$2b$10$PPUyf/fqT2K7VmF5flVxDu6ILB0HoZqgzbBrbq0uX9CjDzxiXMTaa', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(713, 'HAPPY YUGO PRASETIYA', 'happyyugoprasetiya', '$2b$10$STRE9AxETNn1GCCNnWBdeuZJ6QFGzu5N9sdOk6ahlNHFiGo8JKqNC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(714, 'HENDAWAN SOEBHAKTI', 'hendawansoebhakti', '$2b$10$XSNluFjIeNPtFevsrTjZGuxVmeOWAY9GP6lE3qOR94zGBIqTcEIVi', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(715, 'HENDRA GUNAWAN', 'hendragunawan', '$2b$10$1.Y7R0K51ONDujPdALrCJewAuiLBTZmNa9B25uuSad85v6zlQr/6m', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(716, 'HENDRA SAPUTRA', 'hendrasaputra', '$2b$10$xpjT9NxCr4CEy8DeZlQGOulSu7aXfYkBZBAhESq4lRYsdyniTaD76', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(717, 'HILDA WIDYASTUTI', 'hildawidyastuti', '$2b$10$HL1drAG2b4J2kVuFMYZdbu9bngdu/vMXmKydW5vLskbmo07fNJkU2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(718, 'HIMAWAN MOCHTOHA', 'himawanmochtoha', '$2b$10$Nywtw2TNHSrRX9A.hIg7Yee4XNpy/sxL0yB2Y7Kr6Po8fsE9PPUAu', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(719, 'IHSAN SAPUTRA', 'ihsansaputra', '$2b$10$MLsZ5c06pXjmeHwExLKtGOKlPhg7WVKmy8jFzW8J4oDacKbEgDuIW', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(720, 'IKA KARLINA LAILA NUR S', 'ikakarlinalailanurs', '$2b$10$MWkNOeDxxG/hWLnmolpZNufD3TErMiKs5jCrUdsGsFXIRM75fl91y', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(721, 'IMAN FAHRUZI', 'imanfahruzi', '$2b$10$OAr8c2sYnnE954czuJc/6.te7l5R0QN9HPG0C5Kd4Ls131OzBlZS.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(722, 'IRSUTAMI', 'irsutami', '$2b$10$T70X7Jd8tVGpUmqYb9aCDOZxtDl2eUR6MJrcR9v/Aj0PtuXk1PvR2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(723, 'JAMES SIREGAR', 'jamessiregar', '$2b$10$xLJL7e66fQtmzZwX1UUXMu6dgPvJJ8jfcE6.JkVm08FX7BGugLYnS', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(724, 'JESSICA OLIFIA', 'jessicaolifia', '$2b$10$74xh7QnSFi/U25MzhLjpReTWTTrykB3PcF4hwdOthbldo/NVhh/7.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(725, 'KAMARUDIN', 'kamarudin', '$2b$10$Abhr5ejNrlgS65D.ourHT.ub5ys8eZlMx1BwOcs86PN5Tg8HOuLvy', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(726, 'LALU GIAT JUANGSA PUTRA', 'lalugiatjuangsaputra', '$2b$10$yBRX5YDClVgksfW95zraNuVm6u2CoHVmnmbLMnYTCoyMJHSeXL5HW', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(727, 'LUTHFIYA RATNA SARI', 'luthfiyaratnasari', '$2b$10$LsIzfIpVhRyaKSOXUXe7jurMBsHgHd67SfcWxLgr4.nRH8oyxxvnC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(728, 'MAIDEL FANI', 'maidelfani', '$2b$10$73ifJr/gGd2AfBcUWMBnOe5Pi2mvTrx9wGx6/XVY6fpAuztkuI9le', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(729, 'MEGA GEMALA', 'megagemala', '$2b$10$4tAz7ku0Ys/lKQuCneLzB.TRryW/rGd3Q0V6EqM2f/WbUg0842mte', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(730, 'MEGA MAYASARI', 'megamayasari', '$2b$10$H4QTO63xS8vZeGpuOUmghOK4THu3XvT5bnFgIgd6/grTJht6nKShe', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(731, 'MIA SYAFRINA', 'miasyafrina', '$2b$10$D1/P9W8NJU2YJRWLT1pIpu/350bagpVQmbICXA7d5xdsf0B5tRvDe', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(732, 'MIRA CHANDRA KIRANA', 'mirachandrakirana', '$2b$10$8ABynDTipANsyfMau0byr.DqymqSlJ4tg/9RQVN2L3FjS0FpjVZAa', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(733, 'MIR\'ATUL KHUSNA MUFIDA', 'mir\'atulkhusnamufida', '$2b$10$5dsxM3Kh.gosXE5.zayFeOzUpkKFwMjNtPrbW05tQzFTnrrLjwSy6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(734, 'MUCHAMMAD FAJRI AMIRUL NASRULLAH', 'muchammadfajriamirulnasrullah', '$2b$10$vOzX5C5B.dO7qW6zFwxwR.wBO7ALVN3KvK4ftOlATmMIqOb2G394S', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(735, 'MUFTI FATHONAH MUVARIZ', 'muftifathonahmuvariz', '$2b$10$EmeQGklEFfbj6kHxSHYLRuqanaHCcn4TK51caCHPpu6Z67LxGpYvq', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(736, 'MUHAMMAD ARIFIN', 'muhammadarifin', '$2b$10$BkLZKmJxK2ttmWjPaycio.ov1CIi2RRY3CXeyy4fhCyN9XxhACJL6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(737, 'MUHAMMAD HASAN ALBANA', 'muhammadhasanalbana', '$2b$10$tHIXnRCeRXCamY5Rj4Qj.OllEnYvlxVYmfwVNRq7PXjVmT7QYHy9a', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(738, 'MUHAMMAD RAMADHAN SLAMET', 'muhammadramadhanslamet', '$2b$10$yaBFdqgRbBmum8e3u6CV5e0rslLmt505vud6Sea5cTnS9w595//mK', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(739, 'MUHAMMAD SYAFEI GOZALI', 'muhammadsyafeigozali', '$2b$10$6Ynh26TlZTnzMl82ae4.gung2WLhpfpiPnDUNka83FAWAdmuX7Sbu', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(740, 'MUHAMMAD ZAENUDDIN', 'muhammadzaenuddin', '$2b$10$M3ins1wj6PRXnQLOuFhqBep1YA.ch6ihzdYkQIi8Uj6azimyXWLaS', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(741, 'MUHAMMAD ZAINUDDIN LUBIS', 'muhammadzainuddinlubis', '$2b$10$Knksw15FBo/7HpLd5nHWVe5n7dRCxNhM6ZqXzwF7WKq/i27YndBm.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(742, 'MUSLIM ANSORI', 'muslimansori', '$2b$10$ZEXbB60AkdMyyCQ/M7OCPOriw1QfsW7GsJ9dGO/oIb.9xtRsDJIR2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(743, 'NANIK LESTARI', 'naniklestari', '$2b$10$jaIMe4F3LJZEI8nQ30BQBeo27CvMfkNuRyzfK.iP8rJnFKur594Ka', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(744, 'NANTA FAKIH PREBIANTO', 'nantafakihprebianto', '$2b$10$jH7yTNccSguoI9Gw1WJv7.6vyV5NoEgaaNJqXQfUWwMRr9/GxsetG', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(745, 'NAUFAL ABDURRAHMAN PRASETYO', 'naufalabdurrahmanprasetyo', '$2b$10$hR1/vYX6Vrx.4JUKnWn4LeT8n3pDuUI5HrEHf/0D/VPsolO9Zthc.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(746, 'NELMIAWATI', 'nelmiawati', '$2b$10$HAQ.Q008dwn0C11zfXjVG.faX8A.PpB1cEncJnfeW6NIxc8LDKYei', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(747, 'NUGROHO PRATOMO ARIYANTO', 'nugrohopratomoariyanto', '$2b$10$8f.DZuE4QZ01n41ofAI6Y.eDgebDX/s0Hpsrqrf3zC2z2QVr6Ftcm', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(748, 'NUR CAHYONO KUSHARDIANTO', 'nurcahyonokushardianto', '$2b$10$mk2BJH8q/hTZL.IAYJAa1OIwzEk/Zw6elhfano94jOMN5J9ypvkC6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(749, 'NUR RAHMAH ANDAYANI', 'nurrahmahandayani', '$2b$10$b/8lsvuNNUfE.RU5f8Ijwut/PJP4CgoWCJEGB.fI63ROFrCXg2/ji', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(750, 'NUR SAKINAH ASAAD', 'nursakinahasaad', '$2b$10$jeFeo2PvmUVvFH4ikO7QX.FCnOB.g5JyhBwSdcUsb0oK3gMpx1N1a', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(751, 'NUR ZAHRATI JANAH', 'nurzahratijanah', '$2b$10$AD2rHZXjJksgGmuKLQXp7evG77vnsVdH04GsEGZtL85CmntklV4cy', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(752, 'NURMAN PAMUNGKAS', 'nurmanpamungkas', '$2b$10$Gu0ZIroEROEAN08ON0awQuqvvDMwZyHvLy/.NQL6HjGRcvEIripA2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(753, 'NURUL FADILAH', 'nurulfadilah', '$2b$10$fT0q7oXv./pv2Agm.uAuP.icZtLiopfJWQg2UWVTCUIWE0UIwfpd.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(754, 'NURUL ULFAH', 'nurululfah', '$2b$10$kq4/xPAtSNVOARU25iUVUO0/oEmlFMdDXcBdKKGmPVYTRuWP8Ms4i', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(755, 'OKTAVIANTO GUSTIN', 'oktaviantogustin', '$2b$10$iGZdx0jMdonjhq7h6Lkhcuk4YA9Rn7qrkpw6rC.O52Odw.zr9dbX6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(756, 'PRASAJA WIKANTA', 'prasajawikanta', '$2b$10$0CKv8k3hhuo9EEvTgFD1z.m4I8YxxtSKAeLftrE7hkWuEccQiuYBW', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(757, 'PRIYONO EKO SANYOTO', 'priyonoekosanyoto', '$2b$10$K9VyZsKh7b/22yhnr6QPWe19KQhKK0MzbYGB6GLCqVKcbshFE3TBS', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(758, 'QORIATUL FITRIYAH', 'qoriatulfitriyah', '$2b$10$UB2e0P7kp.Yk.nYDuJNYGu78LiwqciQeG6hehOHXJ/mQjG02Pr9BG', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(759, 'RAHMAN HAKIM', 'rahmanhakim', '$2b$10$b1.9lbnbqZKR0X/h7uaJHuEgmjmwhD3fUBGx2Uvjdwhf8d1j//XRO', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(760, 'RAHMAT HIDAYAT', 'rahmathidayat', '$2b$10$hxF9DfnmXqRAXs58j.XRQ.gjfiWMQr39kNur.tMtEUfHEDZOALh6i', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(761, 'RIWINOTO', 'riwinoto', '$2b$10$XiAQgjdH3ivP5odXLPD1me3gaaAcN/A0LEyGdkwdH3EAXb6l6/kTC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(762, 'RIZKA DESTIANA', 'rizkadestiana', '$2b$10$Y8hN33XhbTPypM3gIiufZeMZKxPnh3WN/BhNwvSH87iOUCG2ElqBK', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(763, 'RIZKY PRATAMA HUDHAJANTO', 'rizkypratamahudhajanto', '$2b$10$yEcAixLxuSJrl0mcgdylD.cmAiGVhIWYnUHjY3r2LRf/kV9o7Bbp.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(764, 'SANDI PRASETYANINGSIH', 'sandiprasetyaningsih', '$2b$10$Bhsgo9ack78QelMyUospjOJvUOKHU.QthocGMtreBgXNdNUprCVgG', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(765, 'SAPTO WIRATNO SATOTO', 'saptowiratnosatoto', '$2b$10$zJWldmik1Q38O1W/lX94d.ouK2sokPvZAyedD2grPDHiEcjkhcz7C', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(766, 'SELLY ARTATY ZEGA', 'sellyartatyzega', '$2b$10$zvWCyBIrrAHoLrSPyc3W3e3OOUyvAsxhsp9iSOeLGyBbAfuphAMcq', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(767, 'SENANJUNG PRAYOGA', 'senanjungprayoga', '$2b$10$oz9Pmua1/MaEvj36NMhB8.h0tuYqp48SDr0gEEw0JdPbJtullQ/3q', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(768, 'SETO SULAKSONO ADI WIBOWO', 'setosulaksonoadiwibowo', '$2b$10$3zs09dd7D6GY7dGAer3IS.e54EMhpUOTQYURU03T1af6YJGuPoyoy', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(769, 'SHINTA WAHYU HATI', 'shintawahyuhati', '$2b$10$JrQ9FfwMV3KeunhPnwIiguboFnLsDBvkdrYBErXidt9Cei4hcmfIe', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(770, 'SINARTI', 'sinarti', '$2b$10$e9.lxQjoTRItCakZxzX9FuegWDEFJmGxch7AqbqDfsauQ6FRtnUf6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(771, 'SITI AISYAH', 'sitiaisyah', '$2b$10$Syq/bVTTJ0E97I8QCW/PDuAYo5dSnNIXQn775Zf3RyCMhVz7RFRgi', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(772, 'SITI NOOR CHAYATI', 'sitinoorchayati', '$2b$10$rxTTGEnkKu4Glgyv.jMKc.CoIulJfmBBVqJJCrW/QTfEENjw/Mt.m', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(773, 'SLAMET SOEBAGIYO', 'slametsoebagiyo', '$2b$10$mZh9SP0vcwRaX/s883uswe8AGB/RI4UKbKyBEEHYPrX8aDs1ARqJe', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(774, 'SUDRA IRAWAN', 'sudrairawan', '$2b$10$tk.udLUuYHPI2XSyzTtfgu/IJ/CioXAUVCmK4f9imGCpZZrE3YHw2', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(775, 'SUMANTRI KURNIAWAN RISANDRIYA', 'sumantrikurniawanrisandriya', '$2b$10$Z.phapfMU1ed1l2MnLXD9e9hUCU1ovAKAjfB5lAOAgNVeuPUnCjze', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(776, 'SUPARDIANTO', 'supardianto', '$2b$10$IzMDv241OgT9BPllYywL5eH7vEou.xOL/yOq2t0cVmJoi3JrtsuJa', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(777, 'SUSANTO', 'susanto', '$2b$10$n2mYUNjREl/ytAvhDmJzQOI.pNrcOHdIGfMA9lSBEMASqVc9qQ5hK', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(778, 'UUF BRAJA WIDAGDA', 'uufbrajawidagda', '$2b$10$9RQ/tH1C/0jLMpXeIe7vvuOJlewQpOn.SGENEKKNEzJsScegACyk.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(779, 'WENANG ANUROGO', 'wenanganurogo', '$2b$10$X9GfJ8TXSJg9cMFLgwG4MOgc2LK.ER943nRcCxGXwdmip7D7XCnAC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(780, 'WIDYA RIKA PUSPITA', 'widyarikapuspita', '$2b$10$uGHlh7FDdXB0V/ll4YKzqOnO9Pd4cTkI7M26CZi2b6CyeQjMYCqJq', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(781, 'WIKA ARSANTI PUTRI', 'wikaarsantiputri', '$2b$10$QrWmVPomyzzh0KZFOlpgoOgxkH6uI/7NueXPt9iah9Rwp.6PxdH56', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(782, 'WINANDA WAHANA WARGA', 'winandawahanawarga', '$2b$10$ZL6C9QB1BcOgNBak4lXT7urSNwzPHhivHTK4ZNSyX.JfnULVf6PZG', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(783, 'WOWO ROSSBANDRIO', 'woworossbandrio', '$2b$10$b8tw0OG2NTNK9SpWwT5fCeYscnu3qu6PqCUyCHMsY5ZpRw.L3cAs.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(784, 'YENI ROKHAYATI', 'yenirokhayati', '$2b$10$qo6qG6/hH9pnUr4zt6bUIOLqLWeoBsDY6ZiZsQUUc1iO5kInRUInW', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(785, 'AFRIZAL', 'afrizal', '$2b$10$8.gXp0JG6Fb9POIVXLJrce0lrQ.qbEF/clzxp7Ywc0Kh1FdOu3q.O', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(786, 'ANDRI ALBERTHA PRATAMA', 'andrialberthapratama', '$2b$10$Xk5wlHehHAnpDbv82kom0uqqDTlfdrvS9g91ZXtLjrh9reZGDDPiO', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(787, 'ANJELINA', 'anjelina', '$2b$10$/U1ASXDes5veyJ95QYKWXOrWQ3GkYoR0s/rRsZRulXAL0miSGghtO', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(788, 'ARDI NOVA RANDI ARIF BUDIMAN', 'ardinovarandiarifbudiman', '$2b$10$ZMLZOtusBTYhEdrYyJaFieW/s6AlvdJ6sOGvtRo7noH2rzfUv4KIe', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(789, 'ARI SETIAWAN', 'arisetiawan', '$2b$10$dz8HHrmmCnROOI27YQXYbOkbMORXjAAovafYgGZ9YonMjHsDSHUdi', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(790, 'BASARIAH SITORUS', 'basariahsitorus', '$2b$10$uUwjeDNRFnW3oGnoU5bxpuTwd/M2YWejoJOlLQ7mDRKiIft3cocfG', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(791, 'CAHYA MIRANTO', 'cahyamiranto', '$2b$10$Ik0BfhSiuErYSCJoA9gXQOxXp3Qo7K83qUbqWgwC9qmiDLUgb1dge', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(792, 'CHAIRIL AZMI', 'chairilazmi', '$2b$10$NHI24D/k4d.mqAQ2DPfljOXg1/GFoRWYBEcHlSZS1F426msezG2Fi', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(793, 'CHANDRA DEFTA RUSDWINANTO', 'chandradeftarusdwinanto', '$2b$10$y9FikIkntNZzSZPnGQiH1eDyGs3Lc0Dq2NdizJqThip7ODOpXIuhu', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(794, 'CICI AKMALITA', 'ciciakmalita', '$2b$10$u6jPQIrSi2PV/atZyLAyeuSIjMNPTFOlpR2hh17ISJfx2TCgdwV6i', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(795, 'DESSY OKTANI', 'dessyoktani', '$2b$10$Lu5ahc/G.QkQ6W2WmkUnJuBprcqhhGFADMCdN1V6YscqPyVdHK/lK', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(796, 'DEWI APRILIANINGRUM', 'dewiaprilianingrum', '$2b$10$x2/9yvObN0zayb5v.6e6Hu.0QKiwZOOWJH/7z5lsbSc.4xCXLLw6m', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(797, 'DEWI RISTA UTAMI', 'dewiristautami', '$2b$10$RPjvMx40jwh5rKLCxfW1d.Fs0Ati/gI89VammhJrxlJMnAi2VDt.y', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(798, 'DIAN MAHYOJAWIRDA', 'dianmahyojawirda', '$2b$10$ibE.dsFA.b.k7LqYGMKgF.jTrNkiyoGgklIK6ovribuZbaEk2z5dq', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(799, 'DIAN OKTRIYANTI UMARS', 'dianoktriyantiumars', '$2b$10$JiNaHQOncNf3OKhf.OhvL.3dEuiPMp2lDRRTzD6koA4WDYVuMKLrm', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(800, 'DIDIK WINARKO', 'didikwinarko', '$2b$10$s6JaU8R2T7lSmM2ZrchJt.AQEIuLspzHnSQVJQMWkDFRKoHD3MCly', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(801, 'DWI RETNA NINGSIH', 'dwiretnaningsih', '$2b$10$q.Yn7lkDksgXLbtQ1b/zrOtD7x6IV5OHB4ZPyX0l8jgK8krVHwVoe', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(802, 'EKO KUSUMAWATI SUBAGYO', 'ekokusumawatisubagyo', '$2b$10$hWZjRJsWLB03NH0m3Q3e6eKDe5PyHQ.mVNbeJqo00tYaVPrwcyVyS', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(803, 'EKO SUDARSONO', 'ekosudarsono', '$2b$10$xoV3P.tdpd..KpAs.m5CoeXICpHwH3yjCsq1CyOt9pKJdcREU3Sja', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(804, 'ENDANG SUTRISNA', 'endangsutrisna', '$2b$10$Ns86wCuzllj6ZekMdpMO.uQjeTPpwyjKcvVmuVJuwTL20aFBOWLUi', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(805, 'ERICK SAPUTRA WISNUGRAHA', 'ericksaputrawisnugraha', '$2b$10$Isq.I26NxgqMF2KDm72m5uUYwkrelBD1xdwULwIRmP6TDtUxhjPim', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(806, 'FAHRIZAL DENY DEVGAN', 'fahrizaldenydevgan', '$2b$10$7SyZFz8X5LnJS8iP0Yw2seKYGIVbZh/5sP4s7kVzR7s82O88bB44i', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(807, 'FANDY RAHMAN HAKIM', 'fandyrahmanhakim', '$2b$10$9L4q/OGTQ9oDbIKA9U1jZ.X/6ohxwoO4XY9MhTIM.of4qE1/fjpYa', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(808, 'FANNY RISQIKA', 'fannyrisqika', '$2b$10$7bJOtZszh/T0dXD/JuIzA.EZX8C5O.MkE8dCuSBZSGIjvbrGGH.Ya', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(809, 'FATTAHILAH RANGKUTY', 'fattahilahrangkuty', '$2b$10$Nm/ezGqhgR6oH85276pvruE9Bkak2SDruV2xD3iBEXCxaJAJseZ.q', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(810, 'FERY KRISTIANTO WIBOWO', 'ferykristiantowibowo', '$2b$10$0hUfmr6iKhbAZvN2yaJEDe5k9clY8VaHQBvoSw60H3EPc/05YDfIe', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(811, 'FULIZA LUBIS', 'fulizalubis', '$2b$10$x3pz5Neom3MR79yBFKsQwO2vC5CBQmAID4nczxc6s53rJAiy0I7Iq', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(812, 'HASNIRA', 'hasnira', '$2b$10$5KFiP4PGUkZwurXT1xpPhO2UHMjhe7sJLd5xDCxK2waKLoXfbguhC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(813, 'HENDRI TOAR', 'hendritoar', '$2b$10$yTUk2HSdERcoUFFPCjUJFuZsXdWApea.Ruu1d7EFQ3h6ByxgwGkJy', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(814, 'HIDAYATUSSA\'DAH', 'hidayatussa\'dah', '$2b$10$PB7LU20.iC/Gzkejml6whOxyxoJ/vEbsze7mmncHl7gPbz7ubYJqy', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(815, 'INDAH TIVANI PURWANTO', 'indahtivanipurwanto', '$2b$10$hBvx.m4TL2YKbPbNynpjVul6XqHcwUjacB1rInbxxyB2Z77wshUn6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19');
INSERT INTO `users` (`id`, `nama`, `username`, `password`, `role`, `email`, `no_telepon`, `is_Deleted`, `is_Blocked`, `createdAt`, `updatedAt`) VALUES
(816, 'JULIA ADRIANA', 'juliaadriana', '$2b$10$5..5wPDmwwFO3/s.JGiKu.F/W7bZHXWHuKCrhlkxOWoBWC8GPwmCu', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(817, 'LIDYA MARISKA', 'lidyamariska', '$2b$10$OB9ZdmZkXzgL7448Km3qJeUbq9yo6ylIy7Rk5eYgoDOpjH5hG9vf6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(818, 'LINA DUWI WAHYUNI', 'linaduwiwahyuni', '$2b$10$XFBDSeptGehssUmg3v4o1O4HYJmH2nbgZY.pt90nyc5XGHM5r2cem', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(819, 'LIOWNA MAUBOY', 'liownamauboy', '$2b$10$iQ/stOEhnRU4K.xjXh7FV.7IcVn2dKinxkAaZO31q8J.LpdJpyNOG', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(820, 'LISBERTH BORU SILITONGA', 'lisberthborusilitonga', '$2b$10$WKjdhya4i8Bh1ejBQEBk6.WZxV1GEBcKMm1KDLxHyZf8fd2NFlWoq', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(821, 'LYA INDRIATY', 'lyaindriaty', '$2b$10$js6Db8BsROptu/g1Mr5tjeV7X60pC4tZyn4Ifa11M0yGK1YSlXRRi', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(822, 'MARIA', 'maria', '$2b$10$HHVIrDnKzIX0WgIsdf4jDeKN94A2l3zin1uVfvRr3szxi4h3yDJNW', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(823, 'MARYANI', 'maryani', '$2b$10$bH4Nmma1maGIChZ8l0ogPeyBpCEi5vnbLbwRGkh8QmwFdyshEiPFe', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(824, 'MARYANI SEPTIANA', 'maryaniseptiana', '$2b$10$wmwZcCzVPP9iqrAg7lsDsuSWfGXVpZKVUQQTYTExFV/RJYlB/e33S', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(825, 'MIRANTI GUSRIYANA', 'mirantigusriyana', '$2b$10$m/viQnaEeVXARP6G2P8JMevD8lyYtDtY6aramr16BT5Igdlb9zkgi', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(826, 'MUHAMMAD ISMAIL', 'muhammadismail', '$2b$10$Jrp7f3XLQlopjtmZcJD1C.zJYzwyXn4t59ijVN6gts36s6j8tfuai', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(827, 'NANA ISTIANTO', 'nanaistianto', '$2b$10$95bL1mENu5xMvpG99EJDvu95NaRyPl12L6G9wt1WoC6UnW1b6cp6O', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(828, 'NIKEN DWI SUGIANTI', 'nikendwisugianti', '$2b$10$Qbm6n87FC.kt1XFL8fWBt.WT44QznCspTiZMdMjsYzAWXQlUmvtnK', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(829, 'NOVI ANDRI YANI', 'noviandriyani', '$2b$10$5h/L8Z9Ikgv2oVwagUoe/u28kHOt6pvN15exe8BE8mAAl4OaOPtnO', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(830, 'NOVITA ANGELINA', 'novitaangelina', '$2b$10$vbEm0DB4vns.1R71FjKFVOOMI9GTd5fg73Q/UJUa1OV9qGPOvU9iS', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(831, 'NUR HIDAYAT', 'nurhidayat', '$2b$10$JFF4hI6OC18u5Gj7eudpr.y19G6.xWGylc8EyoKNU4mxNZr6dTCGa', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(832, 'NURHAYATI FITRI', 'nurhayatifitri', '$2b$10$r/0EEDcGodC3WN7WbCU3uu6y7WD9PT4YMO.oYpFtygkLSpfqhihZy', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(833, 'NURKHOLIFAH', 'nurkholifah', '$2b$10$1WWgFn9FACtjVcbqxt.q6edB8XtYLID0TSNODWhquq28NE33GmAzC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(834, 'OCTAVIANUS TURNIP', 'octavianusturnip', '$2b$10$dwSGtNSJ5EbSKMaob5n4ue7XzaYeJlLVOWiUXYHL1UlrVPLgUc6ua', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(835, 'OKZA DEWINA', 'okzadewina', '$2b$10$Ez6I2HPnopJ1Oq6K4JrLP.0kBeH8mwag5UZmtN1icR.ISeDqL8qt.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(836, 'PURI SURYANI', 'purisuryani', '$2b$10$Qe5MW/puZZAoG9kGEg59bu6jCvjQRzJY1HXTHMlvgWi8hrrhl8fqa', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(837, 'PUTRI NUR FADILLA', 'putrinurfadilla', '$2b$10$QJSenbwNNGlptLL7HMgVwO02jstkzz5.99nBYwewsz4F/wpidBeo.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(838, 'RAHMAD SOFIAN', 'rahmadsofian', '$2b$10$ZOblg.mDqtrH71eoVvQRQuYhQEQT1eYPk7QsOrfNK6KkjiKcR4Nci', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(839, 'RATNA JUWITA', 'ratnajuwita', '$2b$10$lggWmGqhn3IjtCvUrYHLV.0UBDko6izTR548uRel863FWg/w0FTBu', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(840, 'RESKA DANIRATY', 'reskadaniraty', '$2b$10$3iBHl4bi6CbpALU6qcyqRevqUuvvVx.izihvPGUsecJFu02ItI0VW', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(841, 'RIDWAN', 'ridwan', '$2b$10$aXIwziCqZOsDvJlYKp3aKOc6Bni6VhmlKrKgssPf9XCcze6Bg8vZ6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(842, 'RIDWAN PURWANTO', 'ridwanpurwanto', '$2b$10$jcHfEPsMrcHd8bFExa1/OO2Eu0r8ex89oWsGGrNbFAVTzpqh4aymS', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(843, 'RIFQI AMALYA FATEKHA', 'rifqiamalyafatekha', '$2b$10$khT608uTX0iKoPb8cJ689.X7C2ZxHWHf9gDCZIzVfDeZJ2AQSDlXK', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(844, 'RIKA PUTRI', 'rikaputri', '$2b$10$foSHy3Ph4o5VcoWOdGWeAupvp4ku3EZBW2m1gah0P5ZDDAEo547Ey', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(845, 'RISELLY', 'riselly', '$2b$10$HBJtPXS/kjmO/DzvpIDDdeQtI6UiGFQ9SE/4iqP1HTmS6.Vr.Sr7C', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(846, 'RIZA KHUSNIAH', 'rizakhusniah', '$2b$10$fWh2Qn0gn3fKDdKlaNrynO8z6cPPlSb6sjKRjsD.z1VqHFhY5kfhG', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(847, 'SAHRIAL', 'sahrial', '$2b$10$7/1DJqAEOY6kxKSfu.JvvOp/J/b/GfuHzTmNHu.Zfp0XkvuLXkdOi', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(848, 'SANTOSO HARYONO', 'santosoharyono', '$2b$10$W.2gfDFu6QhDkUk80lDMiOgNhjhEdzSsucLGmXwHkjWa9cCLo1pk6', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(849, 'SANTRISIA SIAGIAN', 'santrisiasiagian', '$2b$10$jED1PUb7qMRD7mrS/Pz.lOUhGyM8/q0ECuhC2h94vFpKgMCOJwxLC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(850, 'SHELLY PITRIANI', 'shellypitriani', '$2b$10$KzcWePTEGL29E0FASPclj.pmGO9QfZDiQRfnHWfkuqnxat4ojzPq.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(851, 'SIELVI APRIANTINA', 'sielviapriantina', '$2b$10$Xb33FzedP65//0Is8NRHVOwn/hBtau5IaWebnM.rm6T1oBaj3ABHa', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(852, 'SRI PUJI LESTARI', 'sripujilestari', '$2b$10$Is7Nffxp6ZaVlEErbsho4eIPHj.fKplD0KQ/ANUplc6iIX0jLXYPe', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(853, 'SRIYANTO', 'sriyanto', '$2b$10$dm6rDmiZaMo93DugoDJcRuCsQwbimd0m48w63JTbYSeiWTiZg9hcq', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(854, 'SUTARNO', 'sutarno', '$2b$10$rClwIJUbdgt.gwuySYkg6.BSp97z11H1Zkz78p3ZuCt2QkMFi1/o.', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(855, 'SUWARNO', 'suwarno', '$2b$10$//rI4W09LJjlvV/telfak.ZVfWKdj7h69nFIw4.8phl99g/2rnZIe', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(856, 'TIRA JULIANA', 'tirajuliana', '$2b$10$4DK5cODs7q9PwcWrYhLc/uGDMxT0ignJFPG1EHyFkJLLDCSrkEs0q', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(857, 'VENY INDRA RIYANTI', 'venyindrariyanti', '$2b$10$8FQ4m0aVOPQdHqKH/U10G.6RO7BR3dp9yk6HrZWNgLshkZXz7jKXC', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(858, 'VIVIN OCTOWINANDI', 'vivinoctowinandi', '$2b$10$GIKuNNmLwQRpgZxWgs7vJe.phMMLvspTRpSLmjfBXnglRr83dJ8Ia', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(859, 'YULI ASTUTI', 'yuliastuti', '$2b$10$0hz/28i.Gn1ZRIiHGdfWgOsH1FVO911ZI6Wy2PqJl9HMfT9nuQnsi', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19'),
(860, 'ZULKIPLI ARIF', 'zulkipliarif', '$2b$10$x8mUasqyX3FtxUnv36UbIeFYac9AwBwmJ/Mppsr3PzPqIwRLmltKG', 'Karyawan', '-', '-', 0, 0, '2024-05-07 11:11:19', '2024-05-07 11:11:19');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `keuangan`
--
ALTER TABLE `keuangan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_keuangan` (`id_users`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT untuk tabel `pengajuan`
--
ALTER TABLE `pengajuan`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=861;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `keuangan`
--
ALTER TABLE `keuangan`
  ADD CONSTRAINT `fk_users_keuangan` FOREIGN KEY (`id_users`) REFERENCES `users` (`id`);

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
