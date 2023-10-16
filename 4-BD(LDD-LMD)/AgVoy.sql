-- phpMyAdmin SQL Dump

-- version 5.2.1

-- https://www.phpmyadmin.net/

--

-- Host: database

-- Generation Time: Oct 16, 2023 at 08:30 PM

-- Server version: 8.0.32

-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";

START TRANSACTION;

SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */

;

/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */

;

/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */

;

/*!40101 SET NAMES utf8mb4 */

;

--

-- Database: `test`

--

-- --------------------------------------------------------

--

-- Table structure for table `Excursion`

--

CREATE TABLE
    `Excursion` (
        `NumEx` int NOT NULL,
        `DateEx` date NOT NULL,
        `PrixEx` int NOT NULL,
        `NumSite` int NOT NULL,
        `NumGuide` int DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--

-- Dumping data for table `Excursion`

--

INSERT INTO
    `Excursion` (
        `NumEx`,
        `DateEx`,
        `PrixEx`,
        `NumSite`,
        `NumGuide`
    )
VALUES (1, '2023-10-09', 250, 1, 1), (2, '2023-10-18', 22, 2, 2);

-- --------------------------------------------------------

--

-- Table structure for table `Guide`

--

CREATE TABLE
    `Guide` (
        `NumGuide` int NOT NULL,
        `NomPrenom` varchar(50) NOT NULL,
        `Tel` int NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--

-- Dumping data for table `Guide`

--

INSERT INTO
    `Guide` (`NumGuide`, `NomPrenom`, `Tel`)
VALUES (1, 'Aline AJROUDI', 22767368), (2, 'Adam AJROUDI', 50767368);

-- --------------------------------------------------------

--

-- Table structure for table `Participant`

--

CREATE TABLE
    `Participant` (
        `IdParticipant` varchar(255) NOT NULL,
        `NomPrenom` varchar(255) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--

-- Dumping data for table `Participant`

--

INSERT INTO
    `Participant` (`IdParticipant`, `NomPrenom`)
VALUES (
        'participant1',
        'Akrem Ajroudi'
    ), (
        'participant2',
        'Youssef Jlassi'
    );

-- --------------------------------------------------------

--

-- Table structure for table `Participer`

--

CREATE TABLE
    `Participer` (
        `IdParticipant` int NOT NULL,
        `NumEx` int NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--

-- Dumping data for table `Participer`

--

INSERT INTO
    `Participer` (`IdParticipant`, `NumEx`)
VALUES (1, 2), (2, 1);

-- --------------------------------------------------------

--

-- Table structure for table `Site`

--

CREATE TABLE
    `Site` (
        `NumSite` int NOT NULL,
        `LibSite` varchar(255) NOT NULL,
        `NumVille` int DEFAULT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--

-- Dumping data for table `Site`

--

INSERT INTO
    `Site` (
        `NumSite`,
        `LibSite`,
        `NumVille`
    )
VALUES (1, 'Site 1', 1), (2, 'Site 2', 2);

-- --------------------------------------------------------

--

-- Table structure for table `Ville`

--

CREATE TABLE
    `Ville` (
        `NumVille` int NOT NULL,
        `libVille` varchar(255) NOT NULL
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

--

-- Dumping data for table `Ville`

--

INSERT INTO
    `Ville` (`NumVille`, `libVille`)
VALUES (1, 'Bardo'), (2, 'Paris');

--

-- Indexes for dumped tables

--

--

-- Indexes for table `Excursion`

--

ALTER TABLE `Excursion`
ADD PRIMARY KEY (`NumEx`),
ADD
    KEY `NumSite` (`NumSite`),
ADD
    KEY `FK_Numguide` (`NumGuide`);

--

-- Indexes for table `Guide`

--

ALTER TABLE `Guide` ADD PRIMARY KEY (`NumGuide`);

--

-- Indexes for table `Participant`

--

ALTER TABLE `Participant` ADD PRIMARY KEY (`IdParticipant`);

--

-- Indexes for table `Participer`

--

ALTER TABLE `Participer` ADD PRIMARY KEY (`IdParticipant`,`NumEx`);

--

-- Indexes for table `Site`

--

ALTER TABLE `Site`
ADD PRIMARY KEY (`NumSite`),
ADD
    KEY `FK_numville` (`NumVille`);

--

-- Indexes for table `Ville`

--

ALTER TABLE `Ville` ADD PRIMARY KEY (`NumVille`);

--

-- AUTO_INCREMENT for dumped tables

--

--

-- AUTO_INCREMENT for table `Excursion`

--

ALTER TABLE
    `Excursion` MODIFY `NumEx` int NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 3;

--

-- AUTO_INCREMENT for table `Guide`

--

ALTER TABLE
    `Guide` MODIFY `NumGuide` int NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 3;

--

-- AUTO_INCREMENT for table `Site`

--

ALTER TABLE
    `Site` MODIFY `NumSite` int NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 3;

--

-- AUTO_INCREMENT for table `Ville`

--

ALTER TABLE
    `Ville` MODIFY `NumVille` int NOT NULL AUTO_INCREMENT,
    AUTO_INCREMENT = 3;

--

-- Constraints for dumped tables

--

--

-- Constraints for table `Excursion`

--

ALTER TABLE `Excursion`
ADD
    CONSTRAINT `FK_Numguide` FOREIGN KEY (`NumGuide`) REFERENCES `Guide` (`NumGuide`);

--

-- Constraints for table `Site`

--

ALTER TABLE `Site`
ADD
    CONSTRAINT `FK_numville` FOREIGN KEY (`NumVille`) REFERENCES `Ville` (`NumVille`);

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */

;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */

;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */

;