-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2023 at 02:11 PM
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
-- Database: `library_rpl`
--
CREATE DATABASE IF NOT EXISTS `library_rpl` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `library_rpl`;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_id` int(11) NOT NULL,
  `book_code` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `publisher` varchar(255) NOT NULL,
  `publication_year` year(4) NOT NULL,
  `isbn` varchar(255) NOT NULL,
  `book_status` enum('Tersedia','Dipinjam') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `book_code`, `category_id`, `location_id`, `title`, `author`, `publisher`, `publication_year`, `isbn`, `book_status`) VALUES
(1, 'A003', 7, 18, 'Memasak Mudah dan Sehat', 'Ayu', 'Andi Publisher', '2043', '-7461', 'Tersedia'),
(2, 'A004', 8, 11, 'Panduan Hiking untuk Pemula', 'Joko', 'Bhuana Sastra', '2042', '-7365', 'Tersedia'),
(3, 'A005', 5, 21, 'Menguasai Public Speaking', 'Nina', 'Cakra Ilmu', '2041', '-7261', 'Tersedia'),
(4, 'A006', 3, 4, 'Desain Grafis dengan Photoshop', 'Rina', 'Gramedia Pustaka Utama', '2040', '-7164', 'Tersedia'),
(5, 'A007', 9, 9, 'Belajar Bahasa Inggris untuk Anak', 'David', 'Kawan Pustaka', '2039', '-7069', 'Tersedia'),
(6, 'A008', 6, 14, 'Memahami Filsafat untuk Generasi Muda', 'Budi', 'Erlangga', '2038', '-6960', 'Tersedia'),
(7, 'A009', 1, 24, 'Pengantar Ilmu Komputer', 'Diana', 'Salemba Empat', '2037', '-6867', 'Tersedia'),
(8, 'A010', 4, 16, 'Mengenal Hewan Langka Indonesia', 'Wulan', 'Puspa Swara', '2036', '-6761', 'Tersedia'),
(9, 'A011', 10, 25, 'Investasi untuk Generasi Milenial', 'Doni', 'Mizan Publishing', '2035', '-6667', 'Tersedia'),
(10, 'A012', 8, 13, 'Memperbaiki Komputer Sendiri', 'Bambang', 'Informatika Bandung', '2034', '-6560', 'Tersedia'),
(11, 'A013', 5, 23, 'Seni Berbicara di Depan Umum', 'Lisa', 'Elex Media Komputindo', '2033', '-6467', 'Tersedia'),
(12, 'A014', 3, 5, 'Kreativitas dan Desain Grafis', 'Rani', 'Andi Publisher', '2032', '-6364', 'Tersedia'),
(13, 'A015', 9, 10, 'Belajar Bahasa Mandarin untuk Pemula', 'Chen', 'Bhuana Sastra', '2031', '-6262', 'Tersedia'),
(14, 'A016', 2, 22, 'Strategi Belajar Efektif', 'Anton', 'Erlangga', '2030', '-6168', 'Tersedia'),
(15, 'A017', 1, 3, 'Pemrograman Web untuk Pemula', 'Raka', 'Gramedia Pustaka Utama', '2029', '-6065', 'Tersedia'),
(16, 'A018', 4, 15, 'Mengenal Tumbuhan Obat Indonesia', 'Siti', 'Kawan Pustaka', '2028', '-5963', 'Tersedia'),
(17, 'A019', 10, 20, 'Membangun Bisnis Online', 'Edo', 'Puspa Swara', '2027', '-5869', 'Tersedia'),
(18, 'A020', 6, 19, 'Psikologi Perkembangan Anak', 'Hana', 'Mizan Publishing', '2026', '-5766', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `borrowings`
--

CREATE TABLE `borrowings` (
  `borrowing_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `book_id` int(11) DEFAULT NULL,
  `borrow_name` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `limit_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowings`
--

INSERT INTO `borrowings` (`borrowing_id`, `user_id`, `book_id`, `borrow_name`, `phone_number`, `start_date`, `limit_date`) VALUES
(4, 2, 7, 'Agus', '08123456789', '2023-12-11', '2023-12-18');

--
-- Triggers `borrowings`
--
DELIMITER $$
CREATE TRIGGER `after_borrowing_insert_to_books` AFTER INSERT ON `borrowings` FOR EACH ROW BEGIN
    DECLARE book_status_value VARCHAR(255);
    -- Ambil nilai book_status dari buku yang dipinjam
    SELECT book_status INTO book_status_value
    FROM books
    WHERE book_id = NEW.book_id;

    -- Jika buku tersedia (tidak dipinjam), maka update book_status menjadi 'Dipinjam'
    IF book_status_value = 'Tersedia' THEN
        UPDATE books
        SET book_status = 'Dipinjam'
        WHERE book_id = NEW.book_id;
    END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_borrowings_insert` AFTER INSERT ON `borrowings` FOR EACH ROW BEGIN
    DECLARE new_detail_id INT;
    
    -- Insert into detail_borrowings
    INSERT INTO `detail_borrowings` (`detail_id`, `borrowing_id`, `fine_amount`, `borrow_status`)
    VALUES (NULL, NEW.borrowing_id, '0', 'Belum Dikembalikan');
    
    -- You can add additional actions here if needed
    
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category`) VALUES
(1, 'Fiksi'),
(2, 'Nonfiksi'),
(3, 'Ilmiah dan teknis'),
(4, 'Referensi dan ensiklopedia'),
(5, 'Anak-anak dan remaja'),
(6, 'Pendidikan dan pengembangan diri'),
(7, 'Agama dan spiritualitas'),
(8, 'Komik dan grafis'),
(9, 'Puisi'),
(10, 'Pariwisata dan petualangan');

-- --------------------------------------------------------

--
-- Table structure for table `detail_borrowings`
--

CREATE TABLE `detail_borrowings` (
  `detail_id` int(11) NOT NULL,
  `borrowing_id` int(11) DEFAULT NULL,
  `fine_amount` double NOT NULL,
  `borrow_status` enum('Belum Dikembalikan','Sudah Dikembalikan') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_borrowings`
--

INSERT INTO `detail_borrowings` (`detail_id`, `borrowing_id`, `fine_amount`, `borrow_status`) VALUES
(2, 4, 0, 'Sudah Dikembalikan');

--
-- Triggers `detail_borrowings`
--
DELIMITER $$
CREATE TRIGGER `after_detail_borrowing_update_to_books` AFTER UPDATE ON `detail_borrowings` FOR EACH ROW BEGIN
    DECLARE book_status_value VARCHAR(255);
    
    -- Ambil nilai borrow_status dari detail_borrowings yang diupdate
    IF NEW.borrow_status = 'Sudah Dikembalikan' THEN
        -- Ambil nilai book_id dari buku yang diupdate
        SELECT book_id INTO @book_id
        FROM borrowings
        WHERE borrowing_id = NEW.borrowing_id;

        -- Ambil nilai book_status dari buku yang diupdate
        SELECT book_status INTO book_status_value
        FROM books
        WHERE book_id = @book_id;

        -- Jika buku telah dikembalikan, maka update book_status menjadi 'Tersedia'
        IF book_status_value = 'Dipinjam' THEN
            UPDATE books
            SET book_status = 'Tersedia'
            WHERE book_id = @book_id;
        END IF;
    END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `location_id` int(11) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`location_id`, `location`) VALUES
(1, 'Rak A'),
(2, 'Rak B'),
(3, 'Rak C'),
(4, 'Rak D'),
(5, 'Rak E'),
(6, 'Rak F'),
(7, 'Rak G'),
(8, 'Rak H'),
(9, 'Rak I'),
(10, 'Rak J'),
(11, 'Rak K'),
(12, 'Rak L'),
(13, 'Rak M'),
(14, 'Rak N'),
(15, 'Rak O'),
(16, 'Rak P'),
(17, 'Rak Q'),
(18, 'Rak R'),
(19, 'Rak S'),
(20, 'Rak T'),
(21, 'Rak U'),
(22, 'Rak V'),
(23, 'Rak W'),
(24, 'Rak X'),
(25, 'Rak Y'),
(26, 'Rak Z');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `role` enum('Admin','Guest') NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `name`, `gender`, `role`, `phone`, `email`) VALUES
(1, 'AbdulAdimMubarok', 'adim123', 'Abdul Adim Mubarok', 'Male', 'Admin', '087877859001', 'abd.adim.mubarok@gmail.com'),
(2, 'syarifyahya', '123', 'Muhammad Syarif Yahya S.H', 'Male', 'Admin', '088855557777', 'admin@gmail.com');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `books_book_code_unique` (`book_code`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `borrowings`
--
ALTER TABLE `borrowings`
  ADD PRIMARY KEY (`borrowing_id`),
  ADD KEY `book_id` (`book_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `detail_borrowings`
--
ALTER TABLE `detail_borrowings`
  ADD PRIMARY KEY (`detail_id`),
  ADD KEY `borrowing_id` (`borrowing_id`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `borrowings`
--
ALTER TABLE `borrowings`
  MODIFY `borrowing_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `detail_borrowings`
--
ALTER TABLE `detail_borrowings`
  MODIFY `detail_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `books_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `locations` (`location_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `borrowings`
--
ALTER TABLE `borrowings`
  ADD CONSTRAINT `borrowings_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `borrowings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `detail_borrowings`
--
ALTER TABLE `detail_borrowings`
  ADD CONSTRAINT `detail_borrowings_ibfk_1` FOREIGN KEY (`borrowing_id`) REFERENCES `borrowings` (`borrowing_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
