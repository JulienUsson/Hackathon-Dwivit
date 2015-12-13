-- phpMyAdmin SQL Dump
-- version 3.4.11.1deb2+deb7u2
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Dim 13 Décembre 2015 à 10:52
-- Version du serveur: 5.5.46
-- Version de PHP: 5.4.45-0+deb7u2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `dwivit`
--

-- --------------------------------------------------------

--
-- Structure de la table `consommation_essence`
--

CREATE TABLE IF NOT EXISTS `consommation_essence` (
  `id_consommation_essence` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `prix` float NOT NULL,
  `litres` float NOT NULL,
  `compteur_km` int(11) NOT NULL,
  `id_voiture` int(11) NOT NULL,
  PRIMARY KEY (`id_consommation_essence`),
  KEY `id_vehicule` (`id_voiture`),
  KEY `id_voiture` (`id_voiture`),
  KEY `id_voiture_2` (`id_voiture`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Contenu de la table `consommation_essence`
--

INSERT INTO `consommation_essence` (`id_consommation_essence`, `date`, `prix`, `litres`, `compteur_km`, `id_voiture`) VALUES
(9, '2015-09-01', 57.43, 41.95, 21623, 1),
(10, '2015-10-14', 58.37, 42.3, 22274, 1),
(11, '2015-11-12', 48.5, 37.48, 22913, 1),
(12, '2015-12-03', 38.9, 31.37, 23396, 1);

-- --------------------------------------------------------

--
-- Structure de la table `contrat`
--

CREATE TABLE IF NOT EXISTS `contrat` (
  `id_contrat` int(11) NOT NULL AUTO_INCREMENT,
  `categorie` char(1) NOT NULL,
  `km` int(11) NOT NULL,
  `prix` int(11) NOT NULL,
  `diesel` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_contrat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `contrat`
--

INSERT INTO `contrat` (`id_contrat`, `categorie`, `km`, `prix`, `diesel`) VALUES
(1, 'A', 7500, 30, 0),
(2, 'A', 15000, 35, 0),
(3, 'B', 7500, 35, 0),
(4, 'B', 15000, 40, 0),
(5, 'B', 7500, 40, 1),
(6, 'B', 15000, 45, 1);

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE IF NOT EXISTS `marque` (
  `id_marque` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id_marque`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Contenu de la table `marque`
--

INSERT INTO `marque` (`id_marque`, `nom`) VALUES
(1, 'Peugeot'),
(2, 'Renault'),
(3, 'Opel'),
(4, 'Volkswagen'),
(5, 'Toyota'),
(6, 'Fiat'),
(7, 'Hyundai'),
(8, 'Alfa Romeo'),
(9, 'Audi'),
(10, 'BMW'),
(11, 'Citroen'),
(12, 'Dacia'),
(13, 'Chevrolet'),
(14, 'Ford'),
(15, 'Honda'),
(16, 'Kia'),
(17, 'Lada'),
(18, 'Lancia'),
(19, 'Mazda'),
(20, 'Mercedes-Benz'),
(21, 'Mini'),
(22, 'Mitsubishi'),
(23, 'Nissan'),
(24, 'Seat'),
(25, 'Skoda'),
(26, 'Smart'),
(27, 'Suzuki'),
(28, 'Subaru');

-- --------------------------------------------------------

--
-- Structure de la table `modele_voiture`
--

CREATE TABLE IF NOT EXISTS `modele_voiture` (
  `id_modele_voiture` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `id_marque` int(11) NOT NULL,
  PRIMARY KEY (`id_modele_voiture`),
  KEY `id_marque` (`id_marque`),
  KEY `id_marque_2` (`id_marque`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=89 ;

--
-- Contenu de la table `modele_voiture`
--

INSERT INTO `modele_voiture` (`id_modele_voiture`, `nom`, `id_marque`) VALUES
(1, 'Clio', 2),
(2, 'Twingo', 2),
(5, '107', 1),
(6, '108', 1),
(7, '206', 1),
(8, '206+', 1),
(11, '207', 1),
(12, '208', 1),
(13, '206sw', 1),
(14, '207sw', 1),
(17, '207 outdoor', 1),
(18, '2008', 1),
(19, '1007', 1),
(22, 'Agila', 3),
(23, 'Corsa', 3),
(24, 'Adam', 3),
(25, 'Fox', 4),
(26, 'Up!', 4),
(28, 'Polo', 4),
(29, 'Aygo', 5),
(30, 'Yaris', 5),
(31, 'Yaris Verso', 5),
(32, 'Verso S', 5),
(33, 'Panda', 6),
(34, '500', 6),
(37, 'Punto', 6),
(38, 'Idea', 6),
(39, 'Atos', 7),
(40, 'i10', 7),
(41, 'Getz', 7),
(42, 'i20', 7),
(43, 'ix20', 7),
(44, 'MiTo', 8),
(45, 'A1', 9),
(46, 'C1', 11),
(47, 'C2', 11),
(48, 'C3', 11),
(49, 'C3 Picasso', 11),
(50, 'C4 Cactus', 11),
(51, 'Logan', 12),
(52, 'Logan MCV', 12),
(53, 'Sandero', 12),
(54, 'Sandero Stepway', 12),
(55, 'Lodgy', 12),
(56, 'Dokker', 12),
(57, 'Duster', 12),
(58, 'Matiz', 13),
(59, 'Spark', 13),
(60, 'Kalos', 13),
(61, 'Aveo', 13),
(62, 'Ka', 14),
(63, 'Fiesta', 14),
(64, 'Fusion', 14),
(65, 'Jazz', 15),
(66, 'Picanto', 16),
(67, 'Rio', 16),
(68, 'Ypsilon', 18),
(69, 'Musa', 18),
(70, '2', 19),
(71, 'Mini', 21),
(72, 'Space Star', 22),
(73, 'Colt', 22),
(74, 'Pixo', 23),
(75, 'Micra', 23),
(76, 'Note', 23),
(77, 'Juke', 23),
(78, 'Citigo', 25),
(79, 'Fabia', 25),
(80, 'Rapid', 25),
(81, 'Rapid Spaceback', 25),
(82, 'Mii', 24),
(83, 'Ibiza', 24),
(84, 'Fortwo', 26),
(85, 'ForFour', 26),
(86, 'Swift', 27),
(87, 'Splash', 27),
(88, 'Trezia', 28);

-- --------------------------------------------------------

--
-- Structure de la table `reparation`
--

CREATE TABLE IF NOT EXISTS `reparation` (
  `id_reparation` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `commentaire` varchar(500) NOT NULL,
  `id_type_reparation` int(11) NOT NULL,
  `id_voiture` int(11) NOT NULL,
  PRIMARY KEY (`id_reparation`),
  KEY `id_type_reparation` (`id_type_reparation`),
  KEY `id_vehicule` (`id_voiture`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `reparation`
--

INSERT INTO `reparation` (`id_reparation`, `date`, `commentaire`, `id_type_reparation`, `id_voiture`) VALUES
(1, '2015-09-03', 'Rien à signaler.', 1, 1),
(2, '2015-11-04', 'Rien à signaler.', 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `type_reparation`
--

CREATE TABLE IF NOT EXISTS `type_reparation` (
  `id_type_reparation` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  PRIMARY KEY (`id_type_reparation`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `type_reparation`
--

INSERT INTO `type_reparation` (`id_type_reparation`, `nom`) VALUES
(1, 'Changement de pneu'),
(2, 'Changement plaquette avant'),
(3, 'Changement plaquette arrière'),
(4, 'Changement tambour arrière'),
(5, 'Changement des deux disques avant'),
(6, 'Changement des deux disques arrière'),
(7, 'Révision'),
(8, 'Changement distribution');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` char(32) NOT NULL,
  `adresse` varchar(200) NOT NULL,
  `code_postal` char(5) NOT NULL,
  `ville` varchar(100) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `nom`, `prenom`, `email`, `password`, `adresse`, `code_postal`, `ville`) VALUES
(1, 'Dupont', 'Martin', 'martin.dupont@dwivit.com', 'tropdesecurite', '42 rue de michelin', '63100', 'Clermont-Ferrand');

-- --------------------------------------------------------

--
-- Structure de la table `voiture`
--

CREATE TABLE IF NOT EXISTS `voiture` (
  `id_voiture` int(11) NOT NULL AUTO_INCREMENT,
  `immatriculation` varchar(8) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_modele_voiture` int(11) NOT NULL,
  `id_contrat` int(11) NOT NULL,
  PRIMARY KEY (`id_voiture`),
  KEY `id_modele_voiture` (`id_modele_voiture`),
  KEY `id_user` (`id_user`),
  KEY `id_contrat` (`id_contrat`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `voiture`
--

INSERT INTO `voiture` (`id_voiture`, `immatriculation`, `id_user`, `id_modele_voiture`, `id_contrat`) VALUES
(1, 'AB123CD', 1, 2, 1);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `consommation_essence`
--
ALTER TABLE `consommation_essence`
  ADD CONSTRAINT `consommation_essence_ibfk_1` FOREIGN KEY (`id_voiture`) REFERENCES `voiture` (`id_voiture`);

--
-- Contraintes pour la table `modele_voiture`
--
ALTER TABLE `modele_voiture`
  ADD CONSTRAINT `modele_voiture_ibfk_2` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id_marque`);

--
-- Contraintes pour la table `reparation`
--
ALTER TABLE `reparation`
  ADD CONSTRAINT `reparation_ibfk_2` FOREIGN KEY (`id_voiture`) REFERENCES `voiture` (`id_voiture`),
  ADD CONSTRAINT `reparation_ibfk_3` FOREIGN KEY (`id_type_reparation`) REFERENCES `type_reparation` (`id_type_reparation`);

--
-- Contraintes pour la table `voiture`
--
ALTER TABLE `voiture`
  ADD CONSTRAINT `voiture_ibfk_3` FOREIGN KEY (`id_contrat`) REFERENCES `contrat` (`id_contrat`),
  ADD CONSTRAINT `voiture_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`),
  ADD CONSTRAINT `voiture_ibfk_2` FOREIGN KEY (`id_modele_voiture`) REFERENCES `modele_voiture` (`id_modele_voiture`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
