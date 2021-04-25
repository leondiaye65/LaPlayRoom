-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3307
-- Généré le : Dim 25 avr. 2021 à 23:19
-- Version du serveur :  10.5.4-MariaDB
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_laplayroom.fr`
--

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

DROP TABLE IF EXISTS `commentaire`;
CREATE TABLE IF NOT EXISTS `commentaire` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contenu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_67F068BCA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210215104949', '2021-02-15 10:50:10', 196),
('DoctrineMigrations\\Version20210215105302', '2021-02-15 10:53:13', 353),
('DoctrineMigrations\\Version20210215105507', '2021-02-15 10:55:14', 196),
('DoctrineMigrations\\Version20210218172949', '2021-02-18 17:30:15', 390);

-- --------------------------------------------------------

--
-- Structure de la table `piece_jointe`
--

DROP TABLE IF EXISTS `piece_jointe`;
CREATE TABLE IF NOT EXISTS `piece_jointe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `theme_id` int(11) DEFAULT NULL,
  `nom_photo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_AB5111D459027487` (`theme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `rubrique`
--

DROP TABLE IF EXISTS `rubrique`;
CREATE TABLE IF NOT EXISTS `rubrique` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rubrique`
--

INSERT INTO `rubrique` (`id`, `nom`, `description`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'News', '<div>Nouveautés<br><br></div>', NULL, '2021-02-10 11:41:26', NULL),
(3, 'Rooms', '<div>les coulisses</div>', 'rooms', '2021-02-10 19:47:30', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

DROP TABLE IF EXISTS `theme`;
CREATE TABLE IF NOT EXISTS `theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `top5` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nom_photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `rubrique_id` int(11) NOT NULL,
  `commentaire_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9775E7083BD38833` (`rubrique_id`),
  KEY `IDX_9775E708BA9CD190` (`commentaire_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `theme`
--

INSERT INTO `theme` (`id`, `nom`, `description`, `top5`, `nom_photo`, `slug`, `created_at`, `updated_at`, `rubrique_id`, `commentaire_id`) VALUES
(1, 'La French Room', '<div>Tous les lundi entre 12H et 14h, une sélection 100% frenchy</div>', NULL, 'la-french-room.png', 'la-french-room', '2021-02-15 10:24:14', '2021-04-25 21:00:00', 3, NULL),
(2, 'Le 14_18', '<div>&nbsp;LE 14-18 Tous les mardis après-midi, la playlist idéale de La Playroom vous propose la crème de sa sélection musicale.&nbsp;</div>', NULL, 'le14-18.png', 'le14-18', '2021-02-18 21:27:06', '2021-04-25 15:42:40', 3, NULL),
(3, 'L\'afro Room', '<div>&nbsp;L\'AFRO ROOM Tous les vendredis soirs de 21h à 23h, La Playroom vous propose une sélection musicale qui vous fera voyager aux quatre coins de la caraïbe, du continent africain.&nbsp;</div>', NULL, 'l\'afro-room.png', 'l\'afro-room', '2021-02-18 21:29:22', '2021-04-25 15:43:16', 3, NULL),
(4, 'Le Live Room', '<div>&nbsp;LE LIVE ROOM Tous les dimanches soirs de 23h à 00h dans La Playroom, nous vous jouons une playlist de titres 100% live et acoustique !&nbsp;</div>', NULL, NULL, 'le-live-room', '2021-02-18 21:32:25', NULL, 3, NULL),
(5, 'Music-news', '<div>La Play Room vous fait découvrir l\'actualité musicale et ses nouveautés!</div>', NULL, 'music news.png', 'music news', '2021-02-18 21:39:13', '2021-04-25 21:29:20', 1, NULL),
(6, 'News Events', '<div>Découvrez l\'actualité évènementielle dans sa grande diversité avec LA PLAY ROOM</div>', NULL, NULL, 'news events', '2021-02-18 21:42:05', '2021-04-01 07:06:13', 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `prenom` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `prenom`, `password`, `created_at`, `updated_at`) VALUES
(22, 'remy36@laposte.net', '[]', 'François', '$2y$13$6TYVwiMAn/zR71A/33BMaOEJOihAcKieiHzVxNbQyGhVjovXgsj4G', '2021-02-05 15:18:56', NULL),
(23, 'christelle17@free.fr', '[]', 'Pénélope', '$2y$13$QbPw670VzRczFajfeVOzTOoY51iFJYTd4eDRRtvxaJIX4e3/eAXQm', '2021-02-05 15:18:57', NULL),
(24, 'kayz@email.com', '[\"ROLE_ADMIN\"]', 'Kayz', '$2y$13$Bl9urM/n97EwhQ8UKd3s2eTx/Im7NlZWmvHzyJLbeNGJMpI/Q3Zo.', '2021-02-05 15:18:57', NULL),
(25, 'jc@gmail.com', '[]', 'Jc', '$2y$13$LZ3tEshzyUYWHZISFAwseeg/zGy9bh6Ojlimvptmk6tkfN919p.sa', '2021-04-12 13:55:07', NULL);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BCA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `piece_jointe`
--
ALTER TABLE `piece_jointe`
  ADD CONSTRAINT `FK_AB5111D459027487` FOREIGN KEY (`theme_id`) REFERENCES `theme` (`id`);

--
-- Contraintes pour la table `theme`
--
ALTER TABLE `theme`
  ADD CONSTRAINT `FK_9775E7083BD38833` FOREIGN KEY (`rubrique_id`) REFERENCES `rubrique` (`id`),
  ADD CONSTRAINT `FK_9775E708BA9CD190` FOREIGN KEY (`commentaire_id`) REFERENCES `commentaire` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
