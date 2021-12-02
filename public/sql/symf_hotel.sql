-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 02. Dez 2021 um 14:29
-- Server-Version: 10.4.21-MariaDB
-- PHP-Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `symf_hotel`
--
CREATE DATABASE IF NOT EXISTS `symf_hotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `symf_hotel`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Daten für Tabelle `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20211202091919', '2021-12-02 10:19:32', 93),
('DoctrineMigrations\\Version20211202093625', '2021-12-02 10:36:41', 107),
('DoctrineMigrations\\Version20211202093834', '2021-12-02 10:38:43', 70);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `bed_number` int(11) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `fk_status_id` int(11) DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'hotel-standard.jpg'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `rooms`
--

INSERT INTO `rooms` (`id`, `bed_number`, `description`, `price`, `fk_status_id`, `picture`) VALUES
(1, 2, 'This is the first description of a room.', 20, 1, 'hotel-standard.jgp'),
(2, 2, 'This is the second description.', 23, 1, 'hotel-standard.jgp'),
(3, 2, 'Lorem ipsum text for third room. update', 25, 2, 'hotel-standard.jgp'),
(4, 4, 'the fourth tex for a room.', 25, 1, 'hotel-standard.jgp'),
(5, 2, 'short description', 22, 1, 'hotel-standard.jpg');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `status`
--

CREATE TABLE `status` (
  `id` int(11) NOT NULL,
  `name` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `status`
--

INSERT INTO `status` (`id`, `name`) VALUES
(1, 'available'),
(2, 'not available');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b_dathe` date NOT NULL,
  `phone` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Daten für Tabelle `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `b_dathe`, `phone`) VALUES
(1, 'user@gmail.com', '[]', '$2y$13$scows.nvvYTTzD8LVtaPVuhDNqSqxHE69FUlCZzxS/p0JZeP48aYC', '2021-12-02', '000033444'),
(2, 'user2@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$Gl3uxu2.dZYoi6KZr6Abk.DT6GXRPeo5LD1jMCEYlGi6HANPXlTDO', '1990-04-07', '000033555'),
(3, 'user3@aon.at', '[]', '$2y$13$ixXuukzE3jvf9p9151zH7eoglYN7o79JiwytyJWfhzWWMHJ3G8s0S', '2016-01-01', '00033355');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indizes für die Tabelle `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CA11A96AAED72D` (`fk_status_id`);

--
-- Indizes für die Tabelle `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `status`
--
ALTER TABLE `status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `FK_7CA11A96AAED72D` FOREIGN KEY (`fk_status_id`) REFERENCES `status` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
