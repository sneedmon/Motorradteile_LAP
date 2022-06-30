-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 30. Jun 2022 um 23:00
-- Server-Version: 10.4.24-MariaDB
-- PHP-Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Datenbank: `db_lap_motorradteile`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_baureihen`
--

CREATE TABLE `tbl_baureihen` (
  `IDBaureihe` int(10) UNSIGNED NOT NULL,
  `FIDModell` int(10) UNSIGNED NOT NULL,
  `BaujahrVon` year(4) NOT NULL,
  `BaujahrBis` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_baureihen`
--

INSERT INTO `tbl_baureihen` (`IDBaureihe`, `FIDModell`, `BaujahrVon`, `BaujahrBis`) VALUES
(1, 2, 2012, 2014),
(2, 2, 2015, 2017),
(3, 3, 2012, 2014),
(4, 3, 2015, 2017),
(5, 4, 2015, 2017),
(6, 5, 2015, 2017),
(7, 6, 2015, 2017),
(8, 1, 2015, 2017),
(9, 8, 2010, 2017),
(10, 7, 2009, 2015),
(11, 7, 2016, 2017);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_kategorien`
--

CREATE TABLE `tbl_kategorien` (
  `IDKategorie` int(10) UNSIGNED NOT NULL,
  `FIDKategorie` int(10) UNSIGNED DEFAULT NULL,
  `Bezeichnung` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_kategorien`
--

INSERT INTO `tbl_kategorien` (`IDKategorie`, `FIDKategorie`, `Bezeichnung`) VALUES
(1, NULL, 'Schmierstoffe'),
(2, NULL, 'Motorschutz'),
(3, 1, 'Öl'),
(4, 1, 'Bremsflüssigkeit'),
(5, 3, '4-Takt'),
(6, 3, '2-Takt'),
(7, 2, 'Kupplung'),
(8, 2, 'Lichtmaschine');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_marken`
--

CREATE TABLE `tbl_marken` (
  `IDMarke` int(10) UNSIGNED NOT NULL,
  `Markenname` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_marken`
--

INSERT INTO `tbl_marken` (`IDMarke`, `Markenname`) VALUES
(1, 'Ducati'),
(2, 'Aprilia');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_modelle`
--

CREATE TABLE `tbl_modelle` (
  `IDModell` int(10) UNSIGNED NOT NULL,
  `FIDMarke` int(10) UNSIGNED NOT NULL,
  `Modell` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_modelle`
--

INSERT INTO `tbl_modelle` (`IDModell`, `FIDMarke`, `Modell`) VALUES
(1, 1, 'Panigale R'),
(2, 1, 'Panigale 1199'),
(3, 1, 'Panigale 1199S'),
(4, 1, 'Panigale 1299'),
(5, 1, 'Panigale 1299S'),
(6, 1, 'Panigale 1299R'),
(7, 2, 'RSV 1000 R'),
(8, 2, 'RSV 1000 Factory');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_teile`
--

CREATE TABLE `tbl_teile` (
  `IDTeil` int(10) UNSIGNED NOT NULL,
  `FIDKategorie` int(10) UNSIGNED NOT NULL,
  `Bezeichnung` varchar(64) NOT NULL,
  `Beschreibung` text DEFAULT NULL,
  `isUniversell` tinyint(1) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_teile`
--

INSERT INTO `tbl_teile` (`IDTeil`, `FIDKategorie`, `Bezeichnung`, `Beschreibung`, `isUniversell`) VALUES
(1, 5, 'Shell Helix Ultra 15W50', NULL, 0),
(2, 5, 'Shell Helix Ultra 5W40', NULL, 0),
(3, 4, 'Castrol React Response DOT 4', NULL, 1),
(4, 4, 'Liqui Moli DOT 5.1', NULL, 1),
(5, 7, 'GB Racing Kupplungsdeckel Duc 1199', NULL, 0),
(6, 7, 'GB Racing Kupplungsdeckel Duc 1199-2', NULL, 0),
(7, 7, 'GB Racing Kupplungsdeckel Aprilia', NULL, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_teile_baureihen`
--

CREATE TABLE `tbl_teile_baureihen` (
  `IDTeilBaureihe` int(10) UNSIGNED NOT NULL,
  `FIDTeil` int(10) UNSIGNED NOT NULL,
  `FIDBaureihe` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_teile_baureihen`
--

INSERT INTO `tbl_teile_baureihen` (`IDTeilBaureihe`, `FIDTeil`, `FIDBaureihe`) VALUES
(1, 5, 1),
(2, 5, 3),
(3, 6, 4),
(4, 6, 5),
(5, 6, 6),
(6, 6, 7),
(7, 6, 8),
(8, 7, 9),
(9, 7, 10),
(10, 7, 11),
(11, 1, 1),
(12, 1, 2),
(13, 1, 3),
(14, 1, 4),
(15, 1, 5),
(16, 1, 6),
(17, 1, 7),
(18, 1, 8),
(19, 1, 9),
(20, 1, 10),
(21, 1, 11);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tbl_baureihen`
--
ALTER TABLE `tbl_baureihen`
  ADD PRIMARY KEY (`IDBaureihe`),
  ADD KEY `FIDModell` (`FIDModell`);

--
-- Indizes für die Tabelle `tbl_kategorien`
--
ALTER TABLE `tbl_kategorien`
  ADD PRIMARY KEY (`IDKategorie`),
  ADD KEY `FIDKategorie` (`FIDKategorie`);

--
-- Indizes für die Tabelle `tbl_marken`
--
ALTER TABLE `tbl_marken`
  ADD PRIMARY KEY (`IDMarke`);

--
-- Indizes für die Tabelle `tbl_modelle`
--
ALTER TABLE `tbl_modelle`
  ADD PRIMARY KEY (`IDModell`),
  ADD KEY `FIDMarke` (`FIDMarke`);

--
-- Indizes für die Tabelle `tbl_teile`
--
ALTER TABLE `tbl_teile`
  ADD PRIMARY KEY (`IDTeil`),
  ADD KEY `FIDKategorie` (`FIDKategorie`);

--
-- Indizes für die Tabelle `tbl_teile_baureihen`
--
ALTER TABLE `tbl_teile_baureihen`
  ADD PRIMARY KEY (`IDTeilBaureihe`),
  ADD KEY `FIDTeil` (`FIDTeil`),
  ADD KEY `FIDBaureihe` (`FIDBaureihe`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `tbl_baureihen`
--
ALTER TABLE `tbl_baureihen`
  MODIFY `IDBaureihe` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `tbl_kategorien`
--
ALTER TABLE `tbl_kategorien`
  MODIFY `IDKategorie` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `tbl_marken`
--
ALTER TABLE `tbl_marken`
  MODIFY `IDMarke` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `tbl_modelle`
--
ALTER TABLE `tbl_modelle`
  MODIFY `IDModell` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `tbl_teile`
--
ALTER TABLE `tbl_teile`
  MODIFY `IDTeil` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `tbl_teile_baureihen`
--
ALTER TABLE `tbl_teile_baureihen`
  MODIFY `IDTeilBaureihe` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `tbl_baureihen`
--
ALTER TABLE `tbl_baureihen`
  ADD CONSTRAINT `tbl_baureihen_ibfk_1` FOREIGN KEY (`FIDModell`) REFERENCES `tbl_modelle` (`IDModell`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_kategorien`
--
ALTER TABLE `tbl_kategorien`
  ADD CONSTRAINT `tbl_kategorien_ibfk_1` FOREIGN KEY (`FIDKategorie`) REFERENCES `tbl_kategorien` (`IDKategorie`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_modelle`
--
ALTER TABLE `tbl_modelle`
  ADD CONSTRAINT `tbl_modelle_ibfk_1` FOREIGN KEY (`FIDMarke`) REFERENCES `tbl_marken` (`IDMarke`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_teile`
--
ALTER TABLE `tbl_teile`
  ADD CONSTRAINT `tbl_teile_ibfk_1` FOREIGN KEY (`FIDKategorie`) REFERENCES `tbl_kategorien` (`IDKategorie`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_teile_baureihen`
--
ALTER TABLE `tbl_teile_baureihen`
  ADD CONSTRAINT `tbl_teile_baureihen_ibfk_1` FOREIGN KEY (`FIDBaureihe`) REFERENCES `tbl_baureihen` (`IDBaureihe`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_teile_baureihen_ibfk_2` FOREIGN KEY (`FIDTeil`) REFERENCES `tbl_teile` (`IDTeil`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;
