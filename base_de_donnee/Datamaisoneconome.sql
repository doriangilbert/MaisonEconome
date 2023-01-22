-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 18 jan. 2023 à 18:12
-- Version du serveur :  5.7.31
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `maisoneconome`
--

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`userId`, `userDate`, `userState`, `userIsAdmin`, `userFirstname`, `userSurname`, `userBirth`, `userGender`, `userEmail`, `userTag`, `userPhone`, `userPassword`) VALUES
(1, '2023-01-13', 1, 0, 'Jean', 'Dupond', '1971-06-30', 0, 'jean.dupond@reef.tv', 'jean.dupond', '6666666666', 'Dupond.Jean6'),
(2, '2023-01-14', 1, 0, 'Paul', 'Dupont', '1968-03-18', 0, 'paul.dupont@reef.tv', 'paul.dupont', '6666666666', 'Dupont.Paul6'),
(3, '2023-01-01', 1, 1, 'René', 'Dupont', '1970-04-05', 0, 'rene.dupont@reef.tv', 'rene.dupont', '6666666666', 'Dupont.Rene6'),
(4, '2023-01-16', 1, 0, 'Margarette', 'Dupond', '1980-10-14', 1, 'margarette.dupond@reef.tv', 'margarette.dupond', '6666666666', 'Dupond.Margarette6'),
(5, '2023-01-17', 1, 0, 'Yvette', 'Dupond', '1975-12-25', 1, 'yvette.dupond@reef.tv', 'yvette.dupond', '6666666666', 'Dupond.Yvette6');

--
-- Déchargement des données de la table `type_appartement`
--

INSERT INTO `type_appartement` (`appartementTypeId`, `appartementTypeLibelle`) VALUES
(1, 'Maison individuelle'),
(2, 'Studio'),
(3, 'T1'),
(4, 'T2'),
(5, 'T3'),
(6, 'T4'),
(7, 'Duplex'),
(8, 'Autre');

--
-- Déchargement des données de la table `type_equipement`
--

INSERT INTO `type_equipement` (`typeEquipementId`, `typeEquipementLibelle`, `equipementVideo`) VALUES
(1, 'Eclairage', 'https://youtu.be/dQw4w9WgXcQ'),
(2, 'Réfrigirateur', ''),
(3, 'Lave vaiselle', 'https://youtu.be/dQw4w9WgXcQ'),
(4, 'Machine à laver', 'https://youtu.be/dQw4w9WgXcQ'),
(5, 'Sèche linge', ''),
(6, 'Grille pain', 'https://youtu.be/dQw4w9WgXcQ'),
(7, 'Micro-onde', ''),
(8, 'Autre petit éléctroménager', 'https://youtu.be/dQw4w9WgXcQ'),
(9, 'Autre gros éléctroménager', ''),
(10, 'Radiateur', ''),
(11, 'Pompe à chaleur', 'https://youtu.be/dQw4w9WgXcQ'),
(12, 'Poêle à bois', ''),
(13, 'Gazinière', ''),
(14, 'Plaque vitrocéramique', 'https://youtu.be/dQw4w9WgXcQ'),
(15, 'Ordinateur', ''),
(16, 'Console de jeu', 'https://youtu.be/dQw4w9WgXcQ'),
(17, 'Autre', 'https://youtu.be/dQw4w9WgXcQ'),
(18, 'Four', '');

--
-- Déchargement des données de la table `type_piece`
--

INSERT INTO `type_piece` (`typePieceId`, `typePieceLibelle`) VALUES
(1, 'Cuisine'),
(2, 'Salon'),
(3, 'Salle à manger'),
(4, 'Chambre'),
(5, 'Buandrie'),
(6, 'Bureau'),
(7, 'Autre'),
(8, 'Salle de bain');

--
-- Déchargement des données de la table `ressource`
--

INSERT INTO `ressource` (`ressourceId`, `ressourceLibelle`, `ressourceDescription`, `ressourceValMin`, `ressourceValMax`, `ressourceValCritique`, `ressourceValIdeale`) VALUES
(1, 'électricité', 'C\'est la ressource électricité', '0.000', '100.000', '90.000', '32.000'),
(2, 'Gaz', 'C\'est la ressource Gaz', '0.000', '100.000', '94.000', '12.000'),
(3, 'Eau', 'C\'est la ressource Eau', '0.000', '100.000', '93.000', '18.000'),
(4, 'Bois', 'C\'est la ressource Bois', '0.000', '100.000', '95.000', '13.000');

--
-- Déchargement des données de la table `security_appartement`
--

INSERT INTO `security_appartement` (`appartementSecurityId`, `appartementSecurityLibelle`) VALUES
(1, 'faible'),
(2, 'moyen'),
(3, 'fort');

--
-- Déchargement des données de la table `substance`
--

INSERT INTO `substance` (`substanceId`, `substanceLibelle`, `substanceDescription`, `substanceValMin`, `substanceValMax`, `substanceValCritique`, `substanceValIdeale`) VALUES
(1, 'CO', 'Monoxyde de carbone', '0.000', '100.000', '91.000', '31.000'),
(2, 'CO2', 'Dioxyde de carbone', '0.000', '100.000', '90.000', '6.000');

--
-- Déchargement des données de la table `region`
--

INSERT INTO `region` (`regionId`, `regionLibelle`) VALUES
(1, 'Hauts-de-France'),
(2, 'Normandie'),
(3, 'Ile-de-France'),
(4, 'Grand-Est'),
(5, 'Bourgogne-Franche-Comté'),
(6, 'Auverge-Rhône-Alpes'),
(7, 'Provence-Alpes-Côte d\'Azur'),
(8, 'Corse'),
(9, 'Occitanie'),
(10, 'Nouvelle Aquitaine'),
(11, 'Pays de la Loire'),
(12, 'Bretagne'),
(13, 'Centre-Val de Loire'),
(14, 'Mayotte'),
(15, 'La Réunion'),
(16, 'Guyane'),
(17, 'Martinique'),
(18, 'Guadeloupe');

--
-- Déchargement des données de la table `departement`
--

INSERT INTO `departement` (`departementId`, `departementLibelle`, `departementCode`, `regionId`) VALUES
(1, 'Ain', '01', 6),
(2, 'Aisne', '02', 1),
(3, 'Allier', '03', 6),
(4, 'Alpes-de-Haute-Provence', '04', 7),
(5, 'Hautes-Alpes', '05', 7),
(6, 'Alpes-Maritimes', '06', 7),
(7, 'Ardèche', '07', 6),
(8, 'Ardennes', '08', 4),
(9, 'Ariège', '09', 9),
(10, 'Aube', '10', 4),
(11, 'Aude', '11', 9),
(12, 'Aveyron', '12', 9),
(13, 'Bouches-du-Rhône', '13', 7),
(14, 'Calvados', '14', 2),
(15, 'Cantal', '15', 6),
(16, 'Charente', '16', 10),
(17, 'Charente-Maritime', '17', 10),
(18, 'Cher', '18', 13),
(19, 'Corrèze', '19', 10),
(20, 'Côte-d\'Or', '21', 5),
(21, 'Côtes-d\'Armor', '22', 12),
(22, 'Creuse', '23', 10),
(23, 'Dordogne', '24', 10),
(24, 'Doubs', '25', 5),
(25, 'Drôme', '26', 6),
(26, 'Eure', '27', 2),
(27, 'Eure-et-Loir', '28', 13),
(28, 'Finistère', '29', 12),
(29, 'Corse-du-Sud', '2A', 8),
(30, 'Haute-Corse', '2B', 8),
(31, 'Gard', '30', 9),
(32, 'Haute-Garonne', '31', 9),
(33, 'Gers', '32', 9),
(34, 'Gironde', '33', 10),
(35, 'Hérault', '34', 9),
(36, 'Ille-et-Vilaine', '35', 12),
(37, 'Indre', '36', 13),
(38, 'Indre-et-Loire', '37', 13),
(39, 'Isère', '38', 6),
(40, 'Jura', '39', 5),
(41, 'Landes', '40', 10),
(42, 'Loir-et-Cher', '41', 13),
(43, 'Loire', '42', 6),
(44, 'Haute-Loire', '43', 6),
(45, 'Loire-Atlantique', '44', 11),
(46, 'Loiret', '45', 13),
(47, 'Lot', '46', 9),
(48, 'Lot-et-Garonne', '47', 10),
(49, 'Lozère', '48', 9),
(50, 'Maine-et-Loire', '49', 11),
(51, 'Manche', '50', 2),
(52, 'Marne', '51', 4),
(53, 'Haute-Marne', '52', 4),
(54, 'Mayenne', '53', 11),
(55, 'Meurthe-et-Moselle', '54', 4),
(56, 'Meuse', '55', 4),
(57, 'Morbihan', '56', 12),
(58, 'Moselle', '57', 4),
(59, 'Nièvre', '58', 5),
(60, 'Nord', '59', 1),
(61, 'Oise', '60', 1),
(62, 'Orne', '61', 2),
(63, 'Pas-de-Calais', '62', 1),
(64, 'Puy-de-Dôme', '63', 6),
(65, 'Pyrénées-Atlantiques', '64', 10),
(66, 'Hautes-Pyrénées', '65', 9),
(67, 'Pyrénées-Orientales', '66', 9),
(68, 'Bas-Rhin', '67', 4),
(69, 'Haut-Rhin', '68', 4),
(70, 'Rhône', '69', 6),
(71, 'Haute-Saône', '70', 5),
(72, 'Saône-et-Loire', '71', 5),
(73, 'Sarthe', '72', 11),
(74, 'Savoie', '73', 6),
(75, 'Haute-Savoie', '74', 6),
(76, 'Paris', '75', 3),
(77, 'Seine-Maritime', '76', 2),
(78, 'Seine-et-Marne', '77', 3),
(79, 'Yvelines', '78', 3),
(80, 'Deux-Sèvres', '79', 10),
(81, 'Somme', '80', 1),
(82, 'Tarn', '81', 9),
(83, 'Tarn-et-Garonne', '82', 9),
(84, 'Var', '83', 7),
(85, 'Vaucluse', '84', 7),
(86, 'Vendée', '85', 11),
(87, 'Vienne', '86', 10),
(88, 'Haute-Vienne', '87', 10),
(89, 'Vosges', '88', 4),
(90, 'Yonne', '89', 5),
(91, 'Territoire de Belfort', '90', 5),
(92, 'Essonne', '91', 3),
(93, 'Hauts-de-Seine', '92', 3),
(94, 'Seine-Saint-Denis', '93', 3),
(95, 'Val-de-Marne', '94', 3),
(96, 'Val-d\'Oise', '95', 3),
(97, 'Guadeloupe', '971', 18),
(98, 'Martinique', '972', 17),
(99, 'Guyane', '973', 16),
(100, 'La Réunion', '974', 15),
(101, 'Mayotte', '976', 14);

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`villeId`, `villeLibelle`, `departementId`) VALUES
(1, 'Tours', 38),
(2, 'Chambray-lès-Tours', 38),
(3, 'Joué-lès-Tours', 38),
(4, 'Saint-Cyr-sur-Loire', 38),
(5, 'Saint-Pierre-des-Corps', 38);

--
-- Déchargement des données de la table `immeuble`
--

INSERT INTO `immeuble` (`immeubleId`, `immeubleIsolation`, `immeubleEvalBase`, `immeubleNom`, `immeubleNumero`, `immeubleRue`, `immeubleCP`, `villeId`) VALUES
(1, 'isolation moyenne', 'Evaluation', 'immeuble joli', '8', 'Route Arc-en-Ciel (N64)', '37170', 1),
(2, 'isolation moyenne', 'Evaluation', 'immeuble pas mal', '7', 'Route Arc-en-Ciel (N64)', '37170', 2),
(3, 'isolation moyenne', 'Evaluation', 'immeuble magnifique', '10', 'Route Arc-en-Ciel (N64)', '37170', 3),
(4, 'isolation moyenne', 'Evaluation', 'immeuble moche', '54', 'Route Arc-en-Ciel (N64)', '37170', 4),
(5, 'isolation moyenne', 'Evaluation', 'immeuble moyen', '12', 'Route Arc-en-Ciel (N64)', '37170', 5);

--
-- Déchargement des données de la table `appartement`
--

INSERT INTO `appartement` (`appartementId`, `immeubleId`, `appartementSecurityId`, `appartementTypeId`) VALUES
(1, 1, 2, 5),
(2, 1, 3, 6),
(3, 2, 3, 5),
(4, 2, 1, 5),
(5, 3, 2, 6),
(6, 3, 1, 5),
(7, 4, 1, 7),
(8, 4, 3, 7),
(9, 5, 2, 7),
(10, 5, 3, 5);

--
-- Déchargement des données de la table `piece`
--

INSERT INTO `piece` (`pieceId`, `pieceLibelle`, `appartementId`, `typePieceId`) VALUES
(1, 'Cuisine', 1, 1),
(2, 'Cuisine', 2, 1),
(3, 'Cuisine', 3, 1),
(4, 'Cuisine', 4, 1),
(5, 'Cuisine', 5, 1),
(6, 'Cuisine', 6, 1),
(7, 'Cuisine', 7, 1),
(8, 'Cuisine', 8, 1),
(9, 'Cuisine', 9, 1),
(10, 'Cuisine', 10, 1),
(11, 'Chambre', 1, 4),
(12, 'Chambre', 2, 4),
(13, 'Chambre', 3, 4),
(14, 'Chambre', 4, 4),
(15, 'Chambre', 5, 4),
(16, 'Chambre', 6, 4),
(17, 'Chambre', 7, 4),
(18, 'Chambre', 8, 4),
(19, 'Chambre', 9, 4),
(20, 'Chambre', 10, 4),
(21, 'Salle de bain ', 1, 8),
(22, 'Salle de bain ', 2, 8),
(23, 'Salle de bain ', 3, 8),
(24, 'Salle de bain ', 4, 8),
(25, 'Salle de bain ', 5, 8),
(26, 'Salle de bain ', 6, 8),
(27, 'Salle de bain ', 7, 8),
(28, 'Salle de bain ', 8, 8),
(29, 'Salle de bain ', 9, 8),
(30, 'Salon', 8, 2),
(31, 'Salon', 1, 2),
(32, 'Salon', 4, 2),
(33, 'Salon', 1, 2),
(34, 'Salon', 7, 2),
(35, 'Bureau', 3, 6),
(36, 'Bureau', 9, 6),
(37, 'Bureau', 3, 6),
(38, 'Bureau', 9, 6),
(39, 'Bureau', 10, 6),
(40, 'Salle à manger', 5, 3),
(41, 'Salle à manger', 3, 3),
(42, 'Salle à manger', 8, 3),
(43, 'Salle à manger', 3, 3),
(44, 'Salle à manger', 6, 3),
(45, 'Buandrie', 10, 5),
(46, 'Buandrie', 9, 5),
(47, 'Buandrie', 4, 5),
(48, 'Salle de jeux', 6, 7),
(49, 'Dressing', 10, 7),
(50, 'Dressing', 3, 7);

--
-- Déchargement des données de la table `equipement`
--

INSERT INTO `equipement` (`equipementId`, `equipementLibelle`, `equipementDescription`, `descriptionLieu`, `pieceId`, `typeEquipementId`) VALUES
(1, 'lampe n°3', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 1, 1),
(2, 'lampe n°2', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 3, 1),
(3, 'lampe n°3', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 5, 1),
(4, 'lampe n°1', 'Description brève de l\'équipement', '', 7, 1),
(5, 'lampe n°1', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 9, 1),
(6, 'lampe n°3', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 2, 1),
(7, 'lampe n°1', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 4, 1),
(8, 'lampe n°3', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 6, 1),
(9, 'lampe n°2', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 8, 1),
(10, 'lampe n°2', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 10, 1),
(11, 'lampe n°3', 'Description brève de l\'équipement', '', 41, 1),
(12, 'lampe n°2', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 42, 1),
(13, 'lampe n°3', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 43, 1),
(14, 'lampe n°1', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 44, 1),
(15, 'lampe n°1', 'Description brève de l\'équipement', '', 45, 1),
(16, 'lampe n°1', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 46, 1),
(17, 'lampe n°2', 'Description brève de l\'équipement', '', 47, 1),
(18, 'lampe n°3', '', '', 48, 1),
(19, 'lampe n°3', '', '', 49, 1),
(20, 'lampe n°3', 'Despcription brève de l\'équipement', '', 50, 1),
(21, 'lampe de chevet', '', '', 11, 1),
(22, 'lampe de chevet', '', 'Cet équipement est dans un lieu bien prècis', 12, 1),
(23, 'lampe de chevet', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 13, 1),
(24, 'lampe de chevet', '', '', 14, 1),
(25, 'lampe de chevet', 'Description brève de l\'équipement', '', 15, 1),
(26, 'lampe de chevet', '', '', 16, 1),
(27, 'lampe de chevet', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 17, 1),
(28, 'lampe de chevet', '', '', 18, 1),
(29, 'lampe de chevet', 'Description brève de l\'équipement', '', 19, 1),
(30, 'lampe de chevet', 'Description brève de l\'équipement', '', 20, 1),
(31, 'lampe fantaisie', 'Description brève de l\'équipement', '', 41, 1),
(32, 'lampe fantaisie', 'Description brève de l\'équipement', '', 43, 1),
(33, 'lampe fantaisie', '', 'Cet équipement est dans un lieu bien précis', 45, 1),
(34, 'lampe fantaisie', '', 'Cet équipement est dans un lieu bien précis', 25, 1),
(35, 'lampe fantaisie', '', '', 28, 1),
(36, 'spot n°3', '', 'Cet équipement est dans un lieu bien précis', 40, 1),
(37, 'spot n°3', '', 'Cet équipement est dans un lieu bien précis', 41, 1),
(38, 'spot n°1', 'Description brève de l\'équipement', '', 42, 1),
(39, 'spot n°2', '', '', 43, 1),
(40, 'spot n°3', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 44, 1),
(41, 'grille pain', '', 'Cet équipement est dans un lieu bien précis', 40, 6),
(42, 'grille pain', '', 'Cet équipement est dans un lieu bien précis', 41, 6),
(43, 'grille pain', 'Description brève de l\'équipement', '', 42, 6),
(44, 'grille pain', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 43, 6),
(45, 'grille pain', 'Description brève de l\'équipement', '', 44, 6),
(46, 'micro-onde', 'Description brève de l\'équipement', '', 1, 7),
(47, 'micro-onde', 'Description brève de l\'équipement', '', 3, 7),
(48, 'micro-onde', '', '', 5, 7),
(49, 'micro-onde', '', 'Cet équipement est dans un lieu bien précis', 7, 7),
(50, 'micro-onde', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 9, 7),
(51, 'fer à repasser', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 45, 8),
(52, 'fer à repasser', '', '', 46, 8),
(53, 'fer à repasser', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 47, 8),
(54, 'fer à repasser', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 30, 8),
(55, 'fer à repasser', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 31, 8),
(56, 'réfrigirateur', '', '', 2, 2),
(57, 'réfrigirateur', '', '', 4, 2),
(58, 'réfrigirateur', '', 'Cet équipement est dans un lieu bien précis', 6, 2),
(59, 'réfrigirateur', '', '', 8, 2),
(60, 'réfrigirateur', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 10, 2),
(61, 'four', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 1, 18),
(62, 'four', '', 'Cet équipement est dans un lieu bien précis', 4, 18),
(63, 'four', 'Description brève de l\'équipement', '', 7, 18),
(64, 'four', '', 'Cet équipement est dans un lieu bien précis', 2, 18),
(65, 'four', '', 'Cet équipement est dans un lieu bien précis', 10, 18),
(66, 'gazinière', '', '', 1, 13),
(67, 'gazinière', '', '', 2, 13),
(68, 'gazinière', '', '', 3, 13),
(69, 'gazinière', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 4, 13),
(70, 'gazinière', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 5, 13),
(71, 'gazinière', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 6, 13),
(72, 'gazinière', 'Description brève de l\'équipement', '', 7, 13),
(73, 'gazinière', '', '', 8, 13),
(74, 'gazinière', '', 'Cet équipement est dans un lieu bien précis', 9, 13),
(75, 'gazinière', '', '', 10, 13),
(76, 'machine à laver', '', '', 21, 4),
(77, 'machine à laver', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 23, 4),
(78, 'machine à laver', 'Description brève de l\'équipement', '', 25, 4),
(79, 'machine à laver', '', '', 27, 4),
(80, 'machine à laver', '', '', 29, 4),
(81, 'télévision', '', 'Cet équipement est dans un lieu bien précis', 33, 17),
(82, 'ordinateur', '', 'Cet équipement est dans un lieu bien précis', 35, 15),
(83, 'ordinateur', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 38, 15),
(84, 'console de jeux', '', '', 48, 16),
(85, 'console de jeux', 'Description brève de l\'équipement', '', 48, 16),
(86, 'cheminée', '', '', 30, 17),
(87, 'cheminée', '', '', 31, 17),
(88, 'cheminée', 'Description brève de l\'équipement', '', 32, 17),
(89, 'cheminée', '', '', 34, 17),
(90, 'cheminée', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 15, 17),
(91, 'radiateur n°3', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 22, 10),
(92, 'radiateur n°1', '', 'Cet équipement est dans un lieu bien précis', 24, 10),
(93, 'radiateur n°2', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 26, 10),
(94, 'radiateur n°3', '', 'Cet équipement est dans un lieu bien précis', 28, 10),
(95, 'radiateur n°2', 'Description brève de l\'équipement', '', 36, 10),
(96, 'radiateur n°1', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 37, 10),
(97, 'radiateur n°1', '', '', 38, 10),
(98, 'radiateur n°1', 'Description brève de l\'équipement', 'Cet équipement est dans un lieu bien précis', 39, 10),
(99, 'radiateur n°2', '', '', 49, 10),
(100, 'radiateur n°2', 'Description brève de l\'équipement', '', 50, 10);

--
-- Déchargement des données de la table `consomme`
--

INSERT INTO `consomme` (`equipementId`, `ressourceId`, `consommationHoraire`) VALUES
(1, 1, '29.000'),
(2, 1, '48.000'),
(3, 1, '36.000'),
(4, 1, '1.000'),
(5, 1, '24.000'),
(6, 1, '38.000'),
(7, 1, '6.000'),
(8, 1, '41.000'),
(9, 1, '34.000'),
(10, 1, '47.000'),
(11, 1, '39.000'),
(12, 1, '25.000'),
(13, 1, '23.000'),
(14, 1, '38.000'),
(15, 1, '6.000'),
(16, 1, '16.000'),
(17, 1, '27.000'),
(18, 1, '47.000'),
(19, 1, '4.000'),
(20, 1, '16.000'),
(21, 1, '17.000'),
(22, 1, '36.000'),
(23, 1, '18.000'),
(24, 1, '35.000'),
(25, 1, '26.000'),
(26, 1, '23.000'),
(27, 1, '41.000'),
(28, 1, '4.000'),
(29, 1, '34.000'),
(30, 1, '27.000'),
(31, 1, '40.000'),
(32, 1, '22.000'),
(33, 1, '33.000'),
(34, 1, '28.000'),
(35, 1, '48.000'),
(36, 1, '37.000'),
(37, 1, '33.000'),
(38, 1, '12.000'),
(39, 1, '48.000'),
(40, 1, '13.000'),
(41, 1, '11.000'),
(42, 1, '3.000'),
(43, 1, '50.000'),
(44, 1, '42.000'),
(45, 1, '35.000'),
(46, 1, '8.000'),
(47, 1, '8.000'),
(48, 1, '30.000'),
(49, 1, '3.000'),
(50, 1, '36.000'),
(50, 3, '42.000'),
(51, 1, '15.000'),
(51, 3, '26.000'),
(52, 1, '31.000'),
(52, 3, '27.000'),
(53, 1, '37.000'),
(53, 3, '9.000'),
(54, 1, '38.000'),
(54, 3, '43.000'),
(55, 1, '3.000'),
(55, 3, '1.000'),
(56, 1, '46.000'),
(57, 1, '12.000'),
(58, 1, '15.000'),
(59, 1, '23.000'),
(60, 1, '26.000'),
(61, 1, '6.000'),
(62, 1, '15.000'),
(63, 1, '50.000'),
(64, 4, '42.000'),
(65, 4, '35.000'),
(66, 1, '2.000'),
(66, 2, '36.000'),
(67, 1, '2.000'),
(67, 2, '11.000'),
(68, 1, '2.000'),
(68, 2, '8.000'),
(69, 1, '4.000'),
(69, 2, '3.000'),
(70, 1, '2.000'),
(70, 2, '27.000'),
(71, 1, '2.000'),
(71, 2, '20.000'),
(72, 1, '4.000'),
(72, 2, '33.000'),
(73, 1, '5.000'),
(73, 2, '32.000'),
(74, 1, '5.000'),
(74, 2, '15.000'),
(75, 1, '4.000'),
(75, 2, '28.000'),
(76, 1, '4.000'),
(77, 1, '33.000'),
(78, 1, '7.000'),
(79, 1, '45.000'),
(80, 1, '40.000'),
(81, 1, '42.000'),
(82, 1, '24.000'),
(83, 1, '30.000'),
(84, 1, '41.000'),
(85, 1, '17.000'),
(86, 4, '29.000'),
(87, 4, '27.000'),
(88, 4, '22.000'),
(89, 4, '40.000'),
(90, 1, '42.000'),
(91, 1, '50.000'),
(92, 1, '6.000'),
(93, 1, '9.000'),
(94, 1, '34.000'),
(95, 1, '16.000'),
(96, 1, '35.000'),
(97, 1, '16.000'),
(98, 2, '42.000'),
(99, 2, '44.000'),
(100, 2, '25.000');

--
-- Déchargement des données de la table `emet`
--

INSERT INTO `emet` (`equipementId`, `substanceId`, `emissionHoraire`) VALUES
(66, 2, '9.000'),
(67, 2, '14.000'),
(68, 2, '14.000'),
(69, 2, '20.000'),
(70, 2, '11.000'),
(71, 2, '20.000'),
(72, 2, '34.000'),
(73, 2, '41.000'),
(74, 2, '46.000'),
(75, 2, '15.000'),
(86, 1, '8.000'),
(86, 2, '8.000'),
(87, 1, '20.000'),
(87, 2, '47.000'),
(88, 1, '22.000'),
(88, 2, '13.000'),
(89, 1, '17.000'),
(89, 2, '28.000'),
(90, 1, '37.000'),
(90, 2, '31.000'),
(91, 2, '25.000'),
(92, 2, '36.000'),
(93, 2, '10.000'),
(94, 2, '23.000'),
(95, 2, '9.000'),
(96, 2, '24.000'),
(97, 2, '23.000'),
(98, 2, '50.000'),
(99, 2, '47.000'),
(100, 2, '14.000');

--
-- Déchargement des données de la table `estlocataire`
--

INSERT INTO `estlocataire` (`appartementId`, `dateDebutLocation`, `dateFinLocation`, `appartementNbHabitant`, `userId`) VALUES
(1, '2002-05-02', '2023-02-08', 2, 3),
(1, '2020-09-06', '2024-08-30', 8, 3),
(2, '2008-09-19', '2024-11-09', 10, 2),
(2, '2021-05-27', '2023-06-15', 7, 2),
(3, '2006-07-12', '2028-09-21', 1, 1),
(3, '2014-06-30', '2026-09-21', 4, 2),
(4, '2012-11-25', '2025-09-24', 6, 1),
(4, '2018-11-18', '2027-07-13', 9, 4),
(5, '2004-06-03', '2024-04-17', 3, 2),
(5, '2006-07-30', '2025-02-21', 5, 1);

--
-- Déchargement des données de la table `estproprietaire`
--

INSERT INTO `estproprietaire` (`immeubleId`, `dateDebutPossession`, `dateFinPossession`, `userId`) VALUES
(1, '2002-08-19', '2035-07-15', 5),
(2, '2012-06-17', '2029-07-13', 3),
(3, '2001-11-06', '2034-12-25', 1),
(4, '2005-09-21', '2028-05-26', 2),
(5, '2021-09-12', '2038-09-17', 4);

--
-- Déchargement des données de la table `fonctionnementequipement`
--

INSERT INTO `fonctionnementequipement` (`equipementId`, `fonctionnementDebut`, `fonctionnementFin`) VALUES
(2, '2022-05-15 10:17:48', '2022-05-15 11:11:22'),
(3, '2022-01-19 19:20:14', '2022-01-19 22:28:30'),
(5, '2022-04-17 14:11:56', '2022-04-17 17:24:55'),
(5, '2022-09-21 20:44:23', '2022-09-21 23:26:38'),
(6, '2022-09-21 15:51:52', '2022-09-21 17:17:21'),
(8, '2022-09-22 18:34:39', '2022-09-22 21:50:20'),
(9, '2022-06-22 18:18:57', '2022-06-22 21:38:11'),
(11, '2022-01-16 11:48:52', '2022-01-16 13:32:14'),
(14, '2022-08-11 13:31:31', '2022-08-11 15:41:23'),
(16, '2022-04-11 18:52:43', '2022-04-11 21:31:40'),
(16, '2022-05-23 11:19:42', '2022-05-23 12:49:37'),
(17, '2022-03-12 20:59:20', '2022-03-12 21:24:24'),
(17, '2022-06-25 19:36:30', '2022-06-25 20:23:57'),
(18, '2022-04-13 12:18:40', '2022-04-13 13:23:45'),
(19, '2022-02-12 15:45:54', '2022-02-12 16:18:52'),
(20, '2022-04-16 18:31:36', '2022-04-16 21:45:20'),
(20, '2022-05-10 11:44:34', '2022-05-10 12:59:47'),
(20, '2022-05-28 11:58:53', '2022-05-28 13:22:49'),
(21, '2022-04-28 11:23:21', '2022-04-28 13:27:44'),
(21, '2022-06-28 15:30:33', '2022-06-28 18:50:30'),
(22, '2022-03-26 17:30:50', '2022-03-26 20:16:17'),
(22, '2022-07-24 10:43:31', '2022-07-24 11:13:13'),
(23, '2022-09-14 16:24:10', '2022-09-14 17:36:24'),
(24, '2022-04-22 14:45:56', '2022-04-22 15:25:32'),
(24, '2022-05-13 10:40:23', '2022-05-13 13:22:58'),
(24, '2022-05-16 11:26:32', '2022-05-16 14:55:34'),
(24, '2022-07-13 18:50:53', '2022-07-13 20:24:44'),
(26, '2022-06-16 13:31:57', '2022-06-16 15:14:59'),
(26, '2022-09-16 13:37:52', '2022-09-16 14:25:57'),
(31, '2022-01-13 18:51:59', '2022-01-13 19:56:30'),
(37, '2022-01-20 16:14:17', '2022-01-20 17:24:53'),
(37, '2022-05-15 12:34:27', '2022-05-15 13:36:43'),
(38, '2022-03-10 15:35:38', '2022-03-10 18:36:22'),
(38, '2022-04-26 18:32:58', '2022-04-26 21:29:43'),
(38, '2022-09-11 14:41:58', '2022-09-11 16:27:19'),
(40, '2022-08-18 14:31:31', '2022-08-18 17:33:28'),
(41, '2022-06-21 19:43:46', '2022-06-21 22:25:55'),
(42, '2022-05-19 18:17:25', '2022-05-19 19:32:51'),
(43, '2022-04-20 14:48:33', '2022-04-20 17:25:10'),
(44, '2022-09-14 14:29:53', '2022-09-14 17:52:11'),
(45, '2022-02-13 14:47:45', '2022-02-13 17:39:16'),
(45, '2022-02-20 20:27:12', '2022-02-20 21:36:29'),
(45, '2022-05-15 16:23:39', '2022-05-15 18:34:31'),
(45, '2022-09-24 13:26:24', '2022-09-24 16:27:58'),
(48, '2022-04-20 10:31:17', '2022-04-20 11:37:54'),
(50, '2022-05-16 15:42:59', '2022-05-16 18:52:41'),
(50, '2022-06-20 10:31:54', '2022-06-20 13:47:23'),
(51, '2022-03-24 11:31:49', '2022-03-24 14:47:16'),
(51, '2022-04-19 18:12:30', '2022-04-19 20:44:25'),
(51, '2022-06-26 19:36:24', '2022-06-26 20:55:10'),
(52, '2022-09-11 14:31:38', '2022-09-11 15:12:55'),
(54, '2022-03-16 14:19:57', '2022-03-16 16:37:30'),
(54, '2022-03-22 13:18:29', '2022-03-22 14:42:33'),
(57, '2022-09-16 16:30:57', '2022-09-16 18:13:10'),
(59, '2022-03-26 10:59:17', '2022-03-26 13:13:25'),
(61, '2022-03-11 10:42:18', '2022-03-11 11:12:12'),
(61, '2022-09-18 17:47:39', '2022-09-18 19:24:54'),
(62, '2022-03-24 11:36:38', '2022-03-24 13:19:13'),
(63, '2022-09-17 13:22:56', '2022-09-17 16:13:57'),
(64, '2022-04-25 20:32:59', '2022-04-25 21:26:55'),
(64, '2022-09-27 10:17:40', '2022-09-27 12:26:47'),
(65, '2022-03-28 10:33:13', '2022-03-28 11:14:27'),
(65, '2022-06-13 11:17:29', '2022-06-13 13:32:49'),
(65, '2022-09-17 11:57:49', '2022-09-17 13:16:55'),
(66, '2022-01-14 15:13:23', '2022-01-14 16:49:44'),
(67, '2022-03-12 20:20:39', '2022-03-12 22:53:53'),
(68, '2022-09-18 20:43:35', '2022-09-18 22:49:24'),
(69, '2022-06-21 11:22:44', '2022-06-21 13:14:58'),
(69, '2022-07-12 12:13:50', '2022-07-12 15:21:11'),
(70, '2022-07-10 19:43:53', '2022-07-10 22:21:48'),
(72, '2022-05-17 20:52:14', '2022-05-17 22:51:46'),
(72, '2022-07-26 19:15:44', '2022-07-26 22:56:56'),
(72, '2022-08-20 18:45:54', '2022-08-20 20:17:10'),
(74, '2022-01-11 12:13:59', '2022-01-11 13:30:39'),
(74, '2022-06-10 15:24:29', '2022-06-10 17:16:35'),
(75, '2022-02-19 15:14:42', '2022-02-19 17:34:47'),
(75, '2022-04-19 12:33:24', '2022-04-19 15:24:37'),
(75, '2022-07-12 12:16:18', '2022-07-12 13:26:49'),
(81, '2022-04-10 20:30:54', '2022-04-10 21:46:30'),
(84, '2022-01-19 14:19:25', '2022-01-19 15:21:13'),
(86, '2022-01-19 19:26:39', '2022-01-19 21:23:41'),
(86, '2022-03-20 13:13:46', '2022-03-20 14:35:27'),
(86, '2022-04-17 20:25:10', '2022-04-17 23:26:46'),
(88, '2022-05-10 17:57:16', '2022-05-10 19:54:46'),
(88, '2022-09-13 14:13:42', '2022-09-13 17:16:58'),
(90, '2022-02-27 10:33:16', '2022-02-27 12:53:44'),
(90, '2022-04-11 16:12:36', '2022-04-11 17:40:32'),
(91, '2022-02-22 15:23:38', '2022-02-22 18:30:45'),
(91, '2022-08-16 16:16:36', '2022-08-16 19:44:45'),
(93, '2022-05-28 16:15:44', '2022-05-28 18:16:43'),
(93, '2022-08-10 15:38:24', '2022-08-10 17:32:16'),
(93, '2022-08-22 20:43:52', '2022-08-22 22:10:42'),
(93, '2022-09-22 19:20:55', '2022-09-22 21:41:40'),
(94, '2022-08-24 14:13:37', '2022-08-24 15:30:39'),
(96, '2022-01-18 16:43:56', '2022-01-18 18:36:47'),
(97, '2022-01-14 12:55:26', '2022-01-14 14:48:31'),
(97, '2022-07-26 13:47:39', '2022-07-26 16:54:47'),
(98, '2022-08-24 13:56:27', '2022-08-24 15:46:47'),
(99, '2022-06-17 18:56:52', '2022-06-17 21:21:54'),
(100, '2022-04-22 17:38:42', '2022-04-22 18:52:56');

--
-- Déchargement des données de la table `typespiecesconventionnement`
--

INSERT INTO `typespiecesconventionnement` (`typePieceId`, `appartementTypeId`, `quantiteMin`) VALUES
(1, 1, 1),
(1, 3, 1),
(1, 4, 1),
(1, 5, 1),
(1, 6, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(4, 4, 1),
(4, 5, 2),
(4, 6, 3),
(8, 1, 1),
(8, 3, 1),
(8, 4, 1),
(8, 5, 1),
(8, 6, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
