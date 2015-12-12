-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 12 Décembre 2015 à 12:41
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
-- Structure de la table `categorie_vehicule`
--

CREATE TABLE IF NOT EXISTS `categorie_vehicule` (
  `id_categorie_vehicule` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `prix` float NOT NULL,
  PRIMARY KEY (`id_categorie_vehicule`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `consommation_essence`
--

CREATE TABLE IF NOT EXISTS `consommation_essence` (
  `id_consommation_essence` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `prix` float NOT NULL,
  `litres` int(11) NOT NULL,
  `id_vehicule` int(11) NOT NULL,
  PRIMARY KEY (`id_consommation_essence`),
  KEY `id_vehicule` (`id_vehicule`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `marque`
--

CREATE TABLE IF NOT EXISTS `marque` (
  `id_marque` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  PRIMARY KEY (`id_marque`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `modele_voiture`
--

CREATE TABLE IF NOT EXISTS `modele_voiture` (
  `id_modele_vehicule` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) NOT NULL,
  `id_categorie_vehicule` int(11) NOT NULL,
  `id_marque` int(11) NOT NULL,
  PRIMARY KEY (`id_modele_vehicule`),
  KEY `id_marque` (`id_marque`),
  KEY `id_categorie_vehicule` (`id_categorie_vehicule`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `reparation`
--

CREATE TABLE IF NOT EXISTS `reparation` (
  `id_reparation` int(11) NOT NULL AUTO_INCREMENT,
  `commentaire` varchar(500) NOT NULL,
  `id_type_reparation` int(11) NOT NULL,
  `id_vehicule` int(11) NOT NULL,
  PRIMARY KEY (`id_reparation`),
  KEY `id_type_reparation` (`id_type_reparation`),
  KEY `id_vehicule` (`id_vehicule`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `type_reparation`
--

CREATE TABLE IF NOT EXISTS `type_reparation` (
  `id_type_reparation` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  PRIMARY KEY (`id_type_reparation`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `vehicule`
--

CREATE TABLE IF NOT EXISTS `vehicule` (
  `id_vehicule` int(11) NOT NULL AUTO_INCREMENT,
  `immatriculation` varchar(8) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_modele_voiture` int(11) NOT NULL,
  PRIMARY KEY (`id_vehicule`),
  KEY `id_user` (`id_user`),
  KEY `id_modele` (`id_modele_voiture`),
  KEY `id_user_2` (`id_user`),
  KEY `id_modele_2` (`id_modele_voiture`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `consommation_essence`
--
ALTER TABLE `consommation_essence`
  ADD CONSTRAINT `consommation_essence_ibfk_1` FOREIGN KEY (`id_vehicule`) REFERENCES `vehicule` (`id_vehicule`);

--
-- Contraintes pour la table `modele_voiture`
--
ALTER TABLE `modele_voiture`
  ADD CONSTRAINT `modele_voiture_ibfk_2` FOREIGN KEY (`id_marque`) REFERENCES `marque` (`id_marque`),
  ADD CONSTRAINT `modele_voiture_ibfk_1` FOREIGN KEY (`id_categorie_vehicule`) REFERENCES `categorie_vehicule` (`id_categorie_vehicule`);

--
-- Contraintes pour la table `reparation`
--
ALTER TABLE `reparation`
  ADD CONSTRAINT `reparation_ibfk_3` FOREIGN KEY (`id_type_reparation`) REFERENCES `type_reparation` (`id_type_reparation`),
  ADD CONSTRAINT `reparation_ibfk_2` FOREIGN KEY (`id_vehicule`) REFERENCES `vehicule` (`id_vehicule`);

--
-- Contraintes pour la table `vehicule`
--
ALTER TABLE `vehicule`
  ADD CONSTRAINT `vehicule_ibfk_2` FOREIGN KEY (`id_modele_voiture`) REFERENCES `modele_voiture` (`id_modele_vehicule`),
  ADD CONSTRAINT `vehicule_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
