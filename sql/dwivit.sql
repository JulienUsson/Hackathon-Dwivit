-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 12 Décembre 2015 à 14:34
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `dwivit`
--

-- --------------------------------------------------------

--
-- Structure de la table `consommation_essence`
--

CREATE TABLE IF NOT EXISTS `consommation_essence` (
  `id_consommation_essence` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `prix` float NOT NULL,
  `litres` int(11) NOT NULL,
  `id_voiture` int(11) NOT NULL,
  PRIMARY KEY (`id_consommation_essence`),
  KEY `id_vehicule` (`id_voiture`),
  KEY `id_voiture` (`id_voiture`),
  KEY `id_voiture_2` (`id_voiture`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `consommation_essence`
--

INSERT INTO `consommation_essence` (`id_consommation_essence`, `date`, `prix`, `litres`, `id_voiture`) VALUES
(1, '2015-12-02', 38.4, 30, 1),
(2, '2015-11-04', 46.2, 35, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

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
(7, 'Hyundai');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `modele_voiture`
--

INSERT INTO `modele_voiture` (`id_modele_voiture`, `nom`, `id_marque`) VALUES
(1, 'Clio', 2),
(2, 'Twingo', 2);

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
