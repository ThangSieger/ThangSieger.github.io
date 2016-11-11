-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 10, 2016 at 09:17 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thang`
--

-- --------------------------------------------------------

--
-- Table structure for table `giaovien`
--

CREATE TABLE `giaovien` (
  `id_gv` int(10) NOT NULL,
  `ho_ten` varchar(255) NOT NULL,
  `nam_sinh` varchar(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `gioi_tinh` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `giaovien`
--

INSERT INTO `giaovien` (`id_gv`, `ho_ten`, `nam_sinh`, `email`, `gioi_tinh`) VALUES
(1, 'Barack Obama', '1974', 'obama@yahoo.com', 'nam'),
(2, 'Donand Trump', '1976', 'trump@yahoo.com', 'nam'),
(3, 'Hilary Clinton', '1977', 'clinton@yahoo.com', 'nu'),
(4, 'Georg Bush', '1978', 'bush@gmail.com', 'nam'),
(5, 'Bill Clinton', '1973', 'bill@gmail.com', 'nam');

-- --------------------------------------------------------

--
-- Table structure for table `hocvien_khoahoc`
--

CREATE TABLE `hocvien_khoahoc` (
  `id_chung` int(10) NOT NULL,
  `id_sv` int(10) NOT NULL,
  `id_kh` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hocvien_khoahoc`
--

INSERT INTO `hocvien_khoahoc` (`id_chung`, `id_sv`, `id_kh`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 4),
(4, 4, 5),
(5, 5, 1),
(6, 1, 1),
(7, 2, 2),
(8, 3, 3),
(9, 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `khoahoc`
--

CREATE TABLE `khoahoc` (
  `id_kh` int(10) NOT NULL,
  `ten_khoa_hoc` varchar(255) NOT NULL,
  `gia_tien` int(10) NOT NULL,
  `mo_ta` text NOT NULL,
  `so_bai_hoc` varchar(255) NOT NULL,
  `id_gv` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `khoahoc`
--

INSERT INTO `khoahoc` (`id_kh`, `ten_khoa_hoc`, `gia_tien`, `mo_ta`, `so_bai_hoc`, `id_gv`) VALUES
(1, 'HTML/CSS', 600000, 'Học thiết kế giao diện web', '26', 2),
(2, 'C++', 700000, 'Lập trình C++', '30', 3),
(3, 'Java', 1000000, 'Học về Java', '25', 5),
(4, 'PHP', 1000000, 'Học về PHP', '32', 1),
(5, 'Node.js', 150000, 'Học về Node.js', '27', 4);

-- --------------------------------------------------------

--
-- Table structure for table `sinhvien`
--

CREATE TABLE `sinhvien` (
  `id_sv` int(10) NOT NULL,
  `ho_ten` varchar(255) NOT NULL,
  `nam_sinh` varchar(10) NOT NULL,
  `email` varchar(20) NOT NULL,
  `gioi_tinh` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sinhvien`
--

INSERT INTO `sinhvien` (`id_sv`, `ho_ten`, `nam_sinh`, `email`, `gioi_tinh`) VALUES
(1, 'Diego Maradona', '1985', 'diego@yahoo.com', 'nam'),
(2, 'David Beckham', '1991', 'david@yahoo.com', 'nam'),
(3, 'Lionel Messi', '1987', 'messi@gmail.com', 'nam'),
(4, 'Christiano Ronaldo', '1983', 'ronaldo@yahoo.com', 'nam'),
(5, 'Đặng Thị Tèo', '1989', 'teo@yahoo.com', 'nu');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `giaovien`
--
ALTER TABLE `giaovien`
  ADD PRIMARY KEY (`id_gv`);

--
-- Indexes for table `hocvien_khoahoc`
--
ALTER TABLE `hocvien_khoahoc`
  ADD PRIMARY KEY (`id_chung`),
  ADD KEY `id_sv` (`id_sv`),
  ADD KEY `id_kh` (`id_kh`);

--
-- Indexes for table `khoahoc`
--
ALTER TABLE `khoahoc`
  ADD PRIMARY KEY (`id_kh`),
  ADD KEY `id_gv` (`id_gv`);

--
-- Indexes for table `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`id_sv`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `giaovien`
--
ALTER TABLE `giaovien`
  MODIFY `id_gv` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `hocvien_khoahoc`
--
ALTER TABLE `hocvien_khoahoc`
  MODIFY `id_chung` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `khoahoc`
--
ALTER TABLE `khoahoc`
  MODIFY `id_kh` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `sinhvien`
--
ALTER TABLE `sinhvien`
  MODIFY `id_sv` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `hocvien_khoahoc`
--
ALTER TABLE `hocvien_khoahoc`
  ADD CONSTRAINT `quanhe_kh_sv` FOREIGN KEY (`id_kh`) REFERENCES `khoahoc` (`id_kh`),
  ADD CONSTRAINT `quanhe_sv_kh` FOREIGN KEY (`id_sv`) REFERENCES `sinhvien` (`id_sv`);

--
-- Constraints for table `khoahoc`
--
ALTER TABLE `khoahoc`
  ADD CONSTRAINT `giangvienkhoahoc` FOREIGN KEY (`id_gv`) REFERENCES `giaovien` (`id_gv`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
