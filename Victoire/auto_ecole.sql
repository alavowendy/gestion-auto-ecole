-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le :  Dim 15 mai 2022 à 19:52
-- Version du serveur :  10.1.38-MariaDB
-- Version de PHP :  7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `auto_ecole`
--

-- --------------------------------------------------------

--
-- Structure de la table `cd_rom`
--

CREATE TABLE `cd_rom` (
  `num_cd` int(11) NOT NULL,
  `editeur` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `eleve`
--

CREATE TABLE `eleve` (
  `num_el` int(11) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `ville` varchar(255) NOT NULL,
  `quartier` varchar(255) NOT NULL,
  `rue` varchar(255) NOT NULL,
  `date_naiss` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `examen`
--

CREATE TABLE `examen` (
  `num_el` int(11) NOT NULL,
  `date_exam` datetime NOT NULL,
  `note` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `intitule` varchar(255) NOT NULL,
  `reponse` varchar(255) NOT NULL,
  `theme` varchar(255) NOT NULL,
  `niveau` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `question_cd_rom`
--

CREATE TABLE `question_cd_rom` (
  `num_cd` int(11) NOT NULL,
  `num_serie` int(11) NOT NULL,
  `intitule` varchar(255) NOT NULL,
  `num_ord` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `seance`
--

CREATE TABLE `seance` (
  `num_el` int(11) NOT NULL,
  `date_seance` date NOT NULL,
  `heure_seance` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `serie`
--

CREATE TABLE `serie` (
  `num_serie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `cd_rom`
--
ALTER TABLE `cd_rom`
  ADD PRIMARY KEY (`num_cd`);

--
-- Index pour la table `eleve`
--
ALTER TABLE `eleve`
  ADD PRIMARY KEY (`num_el`);

--
-- Index pour la table `examen`
--
ALTER TABLE `examen`
  ADD PRIMARY KEY (`date_exam`),
  ADD KEY `num_el` (`num_el`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`intitule`);

--
-- Index pour la table `question_cd_rom`
--
ALTER TABLE `question_cd_rom`
  ADD KEY `num_cd` (`num_cd`),
  ADD KEY `num_serie` (`num_serie`),
  ADD KEY `intitule` (`intitule`);

--
-- Index pour la table `seance`
--
ALTER TABLE `seance`
  ADD PRIMARY KEY (`date_seance`,`heure_seance`),
  ADD KEY `num_el` (`num_el`);

--
-- Index pour la table `serie`
--
ALTER TABLE `serie`
  ADD PRIMARY KEY (`num_serie`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `serie`
--
ALTER TABLE `serie`
  MODIFY `num_serie` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `cd_rom`
--
ALTER TABLE `cd_rom`
  ADD CONSTRAINT `cd_rom_ibfk_1` FOREIGN KEY (`num_cd`) REFERENCES `question_cd_rom` (`num_cd`);

--
-- Contraintes pour la table `examen`
--
ALTER TABLE `examen`
  ADD CONSTRAINT `examen_ibfk_1` FOREIGN KEY (`num_el`) REFERENCES `seance` (`num_el`);

--
-- Contraintes pour la table `question_cd_rom`
--
ALTER TABLE `question_cd_rom`
  ADD CONSTRAINT `question_cd_rom_ibfk_1` FOREIGN KEY (`intitule`) REFERENCES `question` (`intitule`);

--
-- Contraintes pour la table `seance`
--
ALTER TABLE `seance`
  ADD CONSTRAINT `seance_ibfk_1` FOREIGN KEY (`num_el`) REFERENCES `eleve` (`num_el`);

--
-- Contraintes pour la table `serie`
--
ALTER TABLE `serie`
  ADD CONSTRAINT `serie_ibfk_1` FOREIGN KEY (`num_serie`) REFERENCES `question_cd_rom` (`num_serie`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
