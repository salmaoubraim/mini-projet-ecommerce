-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 09 jan. 2026 à 23:47
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `base_produits`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateurs`
--

CREATE TABLE `administrateurs` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `nom_complet` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp(),
  `dernier_connexion` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `administrateurs`
--

INSERT INTO `administrateurs` (`id`, `username`, `mot_de_passe`, `nom_complet`, `email`, `date_creation`, `dernier_connexion`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'Administrateur Principal', 'admin@ecommerce.ma', '2026-01-08 22:36:31', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `date_creation` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `nom`, `description`, `date_creation`) VALUES
(1, 'Électronique', 'Smartphones, tablettes, ordinateurs', '2026-01-08 22:36:30'),
(2, 'Mode', 'Vêtements, chaussures, accessoires', '2026-01-08 22:36:30'),
(3, 'Maison', 'Meubles, décoration, électroménager', '2026-01-08 22:36:30'),
(4, 'Sport', 'Équipements sportifs et fitness', '2026-01-08 22:36:30'),
(5, 'Beauté', 'Cosmétiques et soins personnels', '2026-01-08 22:36:30');

-- --------------------------------------------------------

--
-- Structure de la table `commandes`
--

CREATE TABLE `commandes` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `date_commande` timestamp NOT NULL DEFAULT current_timestamp(),
  `total` decimal(10,2) NOT NULL,
  `statut` enum('en_attente','confirmee','en_preparation','expediee','livree','annulee') DEFAULT 'en_attente',
  `adresse_livraison` text DEFAULT NULL,
  `ville_livraison` varchar(50) DEFAULT NULL,
  `telephone_livraison` varchar(20) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commandes`
--

INSERT INTO `commandes` (`id`, `utilisateur_id`, `date_commande`, `total`, `statut`, `adresse_livraison`, `ville_livraison`, `telephone_livraison`, `notes`) VALUES
(1, 1, '2026-01-08 22:36:31', 45.00, 'livree', '123 Rue Hassan II', 'Casablanca', '0612345678', NULL),
(2, 2, '2026-01-08 22:36:31', 72.00, 'en_preparation', '45 Avenue Mohammed V', 'Rabat', '0623456789', NULL),
(3, 3, '2026-01-08 22:36:31', 120.00, 'confirmee', '78 Boulevard Zerktouni', 'Marrakech', '0634567890', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `details_commande`
--

CREATE TABLE `details_commande` (
  `id` int(11) NOT NULL,
  `commande_id` int(11) NOT NULL,
  `produit_id` int(11) NOT NULL,
  `nom_produit` varchar(100) NOT NULL,
  `quantite` int(11) NOT NULL,
  `prix_unitaire` decimal(10,2) NOT NULL,
  `total_ligne` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `details_commande`
--

INSERT INTO `details_commande` (`id`, `commande_id`, `produit_id`, `nom_produit`, `quantite`, `prix_unitaire`, `total_ligne`) VALUES
(1, 1, 2, 'produit2', 2, 15.00, 30.00),
(2, 1, 4, 'produit4', 1, 6.00, 6.00),
(3, 2, 3, 'produit3', 3, 20.00, 60.00),
(4, 2, 5, 'produit5', 1, 12.00, 12.00),
(5, 3, 8, 'produit8', 2, 23.00, 46.00),
(6, 3, 9, 'produit9', 1, 28.00, 28.00),
(7, 3, 10, 'produit10', 1, 30.00, 30.00);

-- --------------------------------------------------------

--
-- Structure de la table `produits`
--

CREATE TABLE `produits` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `prix` decimal(10,2) NOT NULL,
  `quantite` int(11) NOT NULL DEFAULT 0,
  `fournisseur` varchar(100) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `date_ajout` timestamp NOT NULL DEFAULT current_timestamp(),
  `date_modification` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `categorie_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `produits`
--

INSERT INTO `produits` (`id`, `nom`, `description`, `prix`, `quantite`, `fournisseur`, `image`, `date_ajout`, `date_modification`, `categorie_id`) VALUES
(2, 'produit2', 'desc2', 15.00, 3, 'fournisseur2', NULL, '2026-01-08 22:36:31', '2026-01-08 22:36:31', 1),
(3, 'produit3', 'desc3', 20.00, 8, 'fournisseur3', NULL, '2026-01-08 22:36:31', '2026-01-08 22:36:31', 1),
(4, 'produit4', 'desc4', 6.00, 2, 'fournisseur4', NULL, '2026-01-08 22:36:31', '2026-01-08 22:36:31', 2),
(5, 'produit5', 'desc5', 12.00, 4, 'fournisseur5', NULL, '2026-01-08 22:36:31', '2026-01-08 22:36:31', 2),
(6, 'produit6', 'desc6', 15.00, 9, 'fournisseur6', NULL, '2026-01-08 22:36:31', '2026-01-08 22:36:31', 3),
(7, 'produit7', 'desc7', 18.00, 20, 'fournisseur7', NULL, '2026-01-08 22:36:31', '2026-01-08 22:36:31', 3),
(8, 'produit8', 'desc8', 23.00, 15, 'fournisseur8', NULL, '2026-01-08 22:36:31', '2026-01-08 22:36:31', 4),
(9, 'produit9', 'desc9', 28.00, 8, 'fournisseur9', NULL, '2026-01-08 22:36:31', '2026-01-08 22:36:31', 4),
(10, 'produit10', 'desc10', 30.00, 10, 'fournisseur10', NULL, '2026-01-08 22:36:31', '2026-01-08 22:36:31', 5),
(11, 'produit11', 'desc11', 24.00, 7, 'fournisseur11', NULL, '2026-01-08 22:36:31', '2026-01-08 22:36:31', 5);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

CREATE TABLE `utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `email` varchar(150) NOT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `mot_de_passe` varchar(255) NOT NULL,
  `adresse` text DEFAULT NULL,
  `ville` varchar(50) DEFAULT NULL,
  `code_postal` varchar(10) DEFAULT NULL,
  `date_inscription` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateurs`
--

INSERT INTO `utilisateurs` (`id`, `nom`, `prenom`, `email`, `telephone`, `mot_de_passe`, `adresse`, `ville`, `code_postal`, `date_inscription`) VALUES
(1, 'Alami', 'Mohammed', 'mohammed@test.com', '0612345678', '482c811da5d5b4bc6d497ffa98491e38', '123 Rue Hassan II', 'Casablanca', '20000', '2026-01-08 22:36:31'),
(2, 'Bennani', 'Fatima', 'fatima@test.com', '0623456789', '482c811da5d5b4bc6d497ffa98491e38', '45 Avenue Mohammed V', 'Rabat', '10000', '2026-01-08 22:36:31'),
(3, 'Tazi', 'Youssef', 'youssef@test.com', '0634567890', '482c811da5d5b4bc6d497ffa98491e38', '78 Boulevard Zerktouni', 'Marrakech', '40000', '2026-01-08 22:36:31');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrateurs`
--
ALTER TABLE `administrateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nom` (`nom`);

--
-- Index pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`),
  ADD KEY `idx_statut` (`statut`),
  ADD KEY `idx_date` (`date_commande`);

--
-- Index pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD PRIMARY KEY (`id`),
  ADD KEY `produit_id` (`produit_id`),
  ADD KEY `idx_commande` (`commande_id`);

--
-- Index pour la table `produits`
--
ALTER TABLE `produits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categorie_id` (`categorie_id`);

--
-- Index pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `idx_email` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `administrateurs`
--
ALTER TABLE `administrateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `commandes`
--
ALTER TABLE `commandes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `details_commande`
--
ALTER TABLE `details_commande`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `produits`
--
ALTER TABLE `produits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `utilisateurs`
--
ALTER TABLE `utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commandes`
--
ALTER TABLE `commandes`
  ADD CONSTRAINT `commandes_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateurs` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `details_commande`
--
ALTER TABLE `details_commande`
  ADD CONSTRAINT `details_commande_ibfk_1` FOREIGN KEY (`commande_id`) REFERENCES `commandes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `details_commande_ibfk_2` FOREIGN KEY (`produit_id`) REFERENCES `produits` (`id`);

--
-- Contraintes pour la table `produits`
--
ALTER TABLE `produits`
  ADD CONSTRAINT `produits_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
