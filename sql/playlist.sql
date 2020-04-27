-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  lun. 02 mars 2020 à 16:10
-- Version du serveur :  5.7.26
-- Version de PHP :  7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `playlist`
--

-- --------------------------------------------------------

--
-- Structure de la table `albums`
--

DROP TABLE IF EXISTS `albums`;
CREATE TABLE IF NOT EXISTS `albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL,
  `year` varchar(225) NOT NULL,
  `artist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `albums`
--

INSERT INTO `albums` (`id`, `name`, `year`, `artist_id`) VALUES
(10, 'The Stooges', '1969', 3),
(5, 'Fire of love', '1981', 6),
(42, 'Brothers In Arms', '1985', 42),
(8, 'The Doors', '1967', 15),
(13, 'Funhouse', '1970', 3),
(69, 'Doolittle', '1989', 54),
(49, 'Dire Straits', '1978', 42),
(1, 'Lucky Jim', '1993', 6);

-- --------------------------------------------------------

--
-- Structure de la table `artists`
--

DROP TABLE IF EXISTS `artists`;
CREATE TABLE IF NOT EXISTS `artists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL,
  `biography` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `artists`
--

INSERT INTO `artists` (`id`, `name`, `biography`) VALUES
(3, 'The Stooges', 'Praesent aliquam, enim at fermentum mollis, ligula massa adipiscing nisl, ac euismod nibh nisl eu lectus.'),
(6, 'The Gun Club', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien.'),
(15, 'The Doors', 'Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.'),
(33, 'Pink Floyd', 'Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'),
(42, 'Dire Straits', 'Fusce vulputate sem at sapien. Vivamus leo. Aliquam libero eu enim. Nulla nec felis sed leo placerat imperdiet. Aenean suscipit nulla in justo.'),
(54, 'Pixies', 'Praesent blandit odio eu enim.');

-- --------------------------------------------------------

--
-- Structure de la table `songs`
--

DROP TABLE IF EXISTS `songs`;
CREATE TABLE IF NOT EXISTS `songs` (
  `id` int(11) NOT NULL,
  `title` varchar(225) NOT NULL,
  `artist_id` int(11) NOT NULL,
  `album_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `songs`
--

INSERT INTO `songs` (`id`, `title`, `artist_id`, `album_id`) VALUES
(25, 'No Fun', 3, 10),
(76, 'Light My Fire', 15, 8),
(1, 'I Wanna Be Your Dog', 3, 10),
(18, 'She\'s like Heroin to Me', 6, 5),
(63, 'Gouge Away', 54, 69),
(38, 'Money for Nothing', 42, 42),
(56, 'Break on Through (To the other side)', 15, 8),
(24, 'Hey', 54, 69),
(98, 'Sex Beat', 6, 5),
(122, 'Sultans of Swing', 42, 49);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
