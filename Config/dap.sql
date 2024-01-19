-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 18 Jan 2024 pada 03.40
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
-- Database: `dap`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `no_telepon` bigint(20) NOT NULL,
  `is_Deleted` tinyint(1) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `updatedAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `username`, `password`, `role`, `email`, `no_telepon`, `is_Deleted`, `createdAt`, `updatedAt`) VALUES
(39, 'Karyawan', 'Karyawan', '$2b$10$HSaMSb.mnvt56ReAdfSGvuKoqcieQCzYvQm3wJoz4rZAUaojrYpzS', 'Karyawan', 'Karyawan@gmail.com', 89519113444, 0, '2024-01-09 14:33:50', '2024-01-10 15:02:09'),
(40, 'Admin', 'Admin', '$2b$10$StfCShqQuSyBnKe0wwg/yuf3lzNMCmAZVKjmUppUDYvhUytC1.TYG', 'Admin', 'Admin@gmail.com', 89519113444, 0, '2024-01-09 14:34:04', '2024-01-09 16:32:34'),
(41, 'SuperAdmin', 'SuperAdmin', '$2b$10$O93dyg5IckE9yDH6aT2ALOIZ/8X5g2UYrp73GZGu8Yuw8wr8sq8RG', 'SuperAdmin', 'SuperAdmin@gmail.com', 89519113444, 0, '2024-01-09 14:34:31', '2024-01-09 14:34:31'),
(42, 'Manajemen', 'Manajemen', '$2b$10$sKHXpgt0cZCjIDlzpzkq5ecy4mOUg5ipC2yRC5zVn37UUP0HGhV1K', 'Manajemen', 'Manajemen@gmail.com', 89519113444, 0, '2024-01-09 14:34:39', '2024-01-10 15:03:32'),
(43, 'tes', 'tes', '$2b$10$y.kjkpZl/m5yTjGclMf19.SN5Jgohtm67W638wjyZUmuQUsgVwAlq', 'tes', 'tes@gmail.com', 89519113444, 0, '2024-01-11 02:41:07', '2024-01-11 02:41:07');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
