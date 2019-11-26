-- phpMyAdmin SQL Dump
-- version 4.7.2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le :  lun. 25 nov. 2019 à 19:06
-- Version du serveur :  5.5.62-0+deb8u1-log
-- Version de PHP :  5.6.40-0+deb8u2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `adcog`
--

-- --------------------------------------------------------

--
-- Structure de la table `adcog_bookmark`
--

CREATE TABLE `adcog_bookmark` (
  `id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `title` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `href` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `validated` datetime DEFAULT NULL,
  `invalidated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_comment`
--

CREATE TABLE `adcog_comment` (
  `id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `validated` datetime DEFAULT NULL,
  `invalidated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_contract_type`
--

CREATE TABLE `adcog_contract_type` (
  `id` int(11) NOT NULL,
  `content` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_employer`
--

CREATE TABLE `adcog_employer` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` longtext COLLATE utf8_unicode_ci,
  `zip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `employerType_id` int(11) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `collaborators` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_employer_type`
--

CREATE TABLE `adcog_employer_type` (
  `id` int(11) NOT NULL,
  `content` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_event`
--

CREATE TABLE `adcog_event` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `program` longtext COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_event_participation`
--

CREATE TABLE `adcog_event_participation` (
  `id` int(11) NOT NULL,
  `event_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_experience`
--

CREATE TABLE `adcog_experience` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `employer_id` int(11) DEFAULT NULL,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `started` date NOT NULL,
  `ended` date DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `salary` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `experienceSource_id` int(11) DEFAULT NULL,
  `discr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `workPosition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `partTime` tinyint(1) DEFAULT NULL,
  `partTimeValue` int(11) DEFAULT NULL,
  `contractType_id` int(11) DEFAULT NULL,
  `thesisType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thesisDiscipline` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `thesisSubject` longtext COLLATE utf8_unicode_ci,
  `studyDiploma` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `internshipSubject` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tuteur` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_experience_source`
--

CREATE TABLE `adcog_experience_source` (
  `id` int(11) NOT NULL,
  `content` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_faq`
--

CREATE TABLE `adcog_faq` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_faq_category`
--

CREATE TABLE `adcog_faq_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_file`
--

CREATE TABLE `adcog_file` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `uniqid` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_office`
--

CREATE TABLE `adcog_office` (
  `id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_payment`
--

CREATE TABLE `adcog_payment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `duration` int(11) NOT NULL,
  `validated` datetime DEFAULT NULL,
  `invalidated` datetime DEFAULT NULL,
  `discr` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tokenId` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paymentId` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `payerId` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `token` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `payment` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:array)',
  `transferDate` datetime DEFAULT NULL,
  `checkNumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_post`
--

CREATE TABLE `adcog_post` (
  `id` int(11) NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `text` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `uniqid` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` int(11) NOT NULL,
  `validated` datetime DEFAULT NULL,
  `invalidated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_price`
--

CREATE TABLE `adcog_price` (
  `id` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amount` double NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_profile`
--

CREATE TABLE `adcog_profile` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_reminder`
--

CREATE TABLE `adcog_reminder` (
  `id` int(11) NOT NULL,
  `year` int(11) NOT NULL DEFAULT '0',
  `month` int(11) NOT NULL DEFAULT '0',
  `days` int(11) NOT NULL DEFAULT '0',
  `invert` tinyint(1) NOT NULL DEFAULT '0',
  `cycle` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_role`
--

CREATE TABLE `adcog_role` (
  `id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `desk` tinyint(1) NOT NULL,
  `role_order` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_school`
--

CREATE TABLE `adcog_school` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `wikipedia` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `graduation` longtext COLLATE utf8_unicode_ci,
  `graduates` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `uniqid` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_sector`
--

CREATE TABLE `adcog_sector` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_slider`
--

CREATE TABLE `adcog_slider` (
  `id` int(11) NOT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `href` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `uniqid` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_static_content`
--

CREATE TABLE `adcog_static_content` (
  `id` int(11) NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_tag`
--

CREATE TABLE `adcog_tag` (
  `id` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `adcog_user`
--

CREATE TABLE `adcog_user` (
  `id` int(11) NOT NULL,
  `school_id` int(11) DEFAULT NULL,
  `firstname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `termsAccepted` datetime DEFAULT NULL,
  `role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` longtext COLLATE utf8_unicode_ci,
  `zip` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nationality` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthDate` date NOT NULL,
  `acceptedContact` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `previousLoginDate` datetime DEFAULT NULL,
  `currentLoginDate` datetime DEFAULT NULL,
  `passwordUpdated` datetime DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL,
  `accountExpired` datetime DEFAULT NULL,
  `accountLocked` datetime DEFAULT NULL,
  `credentialsExpired` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `uniqid` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md5` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validated` datetime DEFAULT NULL,
  `invalidated` datetime DEFAULT NULL,
  `linkedIn` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `options` int(11) DEFAULT NULL,
  `abroad` tinyint(1) DEFAULT NULL,
  `user_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `bookmark_tag`
--

CREATE TABLE `bookmark_tag` (
  `bookmark_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `experience_sector`
--

CREATE TABLE `experience_sector` (
  `experience_id` int(11) NOT NULL,
  `sector_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `post_tag`
--

CREATE TABLE `post_tag` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adcog_bookmark`
--
ALTER TABLE `adcog_bookmark`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B353A78CF675F31B` (`author_id`);

--
-- Index pour la table `adcog_comment`
--
ALTER TABLE `adcog_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A3833DFFF675F31B` (`author_id`),
  ADD KEY `IDX_A3833DFF4B89032C` (`post_id`);

--
-- Index pour la table `adcog_contract_type`
--
ALTER TABLE `adcog_contract_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `adcog_employer`
--
ALTER TABLE `adcog_employer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B77DC5F7AC8DAE2B` (`employerType_id`);

--
-- Index pour la table `adcog_employer_type`
--
ALTER TABLE `adcog_employer_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `adcog_event`
--
ALTER TABLE `adcog_event`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `adcog_event_participation`
--
ALTER TABLE `adcog_event_participation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_EFA15A0A71F7E88B` (`event_id`),
  ADD KEY `IDX_EFA15A0AA76ED395` (`user_id`);

--
-- Index pour la table `adcog_experience`
--
ALTER TABLE `adcog_experience`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_3B79D74AA76ED395` (`user_id`),
  ADD KEY `IDX_3B79D74A41CD9E7A` (`employer_id`),
  ADD KEY `IDX_3B79D74A27490221` (`experienceSource_id`),
  ADD KEY `IDX_3B79D74ACF82B7C1` (`contractType_id`);

--
-- Index pour la table `adcog_experience_source`
--
ALTER TABLE `adcog_experience_source`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `adcog_faq`
--
ALTER TABLE `adcog_faq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_158EDC8812469DE2` (`category_id`);

--
-- Index pour la table `adcog_faq_category`
--
ALTER TABLE `adcog_faq_category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `adcog_file`
--
ALTER TABLE `adcog_file`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `adcog_office`
--
ALTER TABLE `adcog_office`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5B0508E9D60322AC` (`role_id`),
  ADD KEY `IDX_5B0508E9A76ED395` (`user_id`);

--
-- Index pour la table `adcog_payment`
--
ALTER TABLE `adcog_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5ADFEB9EA76ED395` (`user_id`);

--
-- Index pour la table `adcog_post`
--
ALTER TABLE `adcog_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_2BC698ADF675F31B` (`author_id`);

--
-- Index pour la table `adcog_price`
--
ALTER TABLE `adcog_price`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `adcog_profile`
--
ALTER TABLE `adcog_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_B6A0C59CA76ED395` (`user_id`);

--
-- Index pour la table `adcog_reminder`
--
ALTER TABLE `adcog_reminder`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `adcog_role`
--
ALTER TABLE `adcog_role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `adcog_school`
--
ALTER TABLE `adcog_school`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `adcog_sector`
--
ALTER TABLE `adcog_sector`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `adcog_slider`
--
ALTER TABLE `adcog_slider`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `adcog_static_content`
--
ALTER TABLE `adcog_static_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_D72DF9408CDE5729` (`type`);

--
-- Index pour la table `adcog_tag`
--
ALTER TABLE `adcog_tag`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `adcog_user`
--
ALTER TABLE `adcog_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_FCDF2269F85E0677` (`username`),
  ADD KEY `IDX_FCDF2269C32A47EE` (`school_id`);

--
-- Index pour la table `bookmark_tag`
--
ALTER TABLE `bookmark_tag`
  ADD PRIMARY KEY (`bookmark_id`,`tag_id`),
  ADD KEY `IDX_23CB7F4A92741D25` (`bookmark_id`),
  ADD KEY `IDX_23CB7F4ABAD26311` (`tag_id`);

--
-- Index pour la table `experience_sector`
--
ALTER TABLE `experience_sector`
  ADD PRIMARY KEY (`experience_id`,`sector_id`),
  ADD KEY `IDX_BF143EC546E90E27` (`experience_id`),
  ADD KEY `IDX_BF143EC5DE95C867` (`sector_id`);

--
-- Index pour la table `post_tag`
--
ALTER TABLE `post_tag`
  ADD PRIMARY KEY (`post_id`,`tag_id`),
  ADD KEY `IDX_5ACE3AF04B89032C` (`post_id`),
  ADD KEY `IDX_5ACE3AF0BAD26311` (`tag_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adcog_bookmark`
--
ALTER TABLE `adcog_bookmark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `adcog_comment`
--
ALTER TABLE `adcog_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `adcog_contract_type`
--
ALTER TABLE `adcog_contract_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `adcog_employer`
--
ALTER TABLE `adcog_employer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `adcog_employer_type`
--
ALTER TABLE `adcog_employer_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `adcog_event`
--
ALTER TABLE `adcog_event`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `adcog_event_participation`
--
ALTER TABLE `adcog_event_participation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `adcog_experience`
--
ALTER TABLE `adcog_experience`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `adcog_experience_source`
--
ALTER TABLE `adcog_experience_source`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT pour la table `adcog_faq`
--
ALTER TABLE `adcog_faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `adcog_faq_category`
--
ALTER TABLE `adcog_faq_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `adcog_file`
--
ALTER TABLE `adcog_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `adcog_office`
--
ALTER TABLE `adcog_office`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `adcog_payment`
--
ALTER TABLE `adcog_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `adcog_post`
--
ALTER TABLE `adcog_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT pour la table `adcog_price`
--
ALTER TABLE `adcog_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT pour la table `adcog_profile`
--
ALTER TABLE `adcog_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `adcog_reminder`
--
ALTER TABLE `adcog_reminder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `adcog_role`
--
ALTER TABLE `adcog_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `adcog_school`
--
ALTER TABLE `adcog_school`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT pour la table `adcog_sector`
--
ALTER TABLE `adcog_sector`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `adcog_slider`
--
ALTER TABLE `adcog_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `adcog_static_content`
--
ALTER TABLE `adcog_static_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `adcog_tag`
--
ALTER TABLE `adcog_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `adcog_user`
--
ALTER TABLE `adcog_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adcog_bookmark`
--
ALTER TABLE `adcog_bookmark`
  ADD CONSTRAINT `FK_B353A78CF675F31B` FOREIGN KEY (`author_id`) REFERENCES `adcog_user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `adcog_comment`
--
ALTER TABLE `adcog_comment`
  ADD CONSTRAINT `FK_A3833DFF4B89032C` FOREIGN KEY (`post_id`) REFERENCES `adcog_post` (`id`),
  ADD CONSTRAINT `FK_A3833DFFF675F31B` FOREIGN KEY (`author_id`) REFERENCES `adcog_user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `adcog_employer`
--
ALTER TABLE `adcog_employer`
  ADD CONSTRAINT `FK_B77DC5F7AC8DAE2B` FOREIGN KEY (`employerType_id`) REFERENCES `adcog_employer_type` (`id`);

--
-- Contraintes pour la table `adcog_event_participation`
--
ALTER TABLE `adcog_event_participation`
  ADD CONSTRAINT `FK_EFA15A0A71F7E88B` FOREIGN KEY (`event_id`) REFERENCES `adcog_event` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_EFA15A0AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `adcog_user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `adcog_experience`
--
ALTER TABLE `adcog_experience`
  ADD CONSTRAINT `FK_3B79D74A27490221` FOREIGN KEY (`experienceSource_id`) REFERENCES `adcog_experience_source` (`id`),
  ADD CONSTRAINT `FK_3B79D74A41CD9E7A` FOREIGN KEY (`employer_id`) REFERENCES `adcog_employer` (`id`),
  ADD CONSTRAINT `FK_3B79D74AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `adcog_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_3B79D74ACF82B7C1` FOREIGN KEY (`contractType_id`) REFERENCES `adcog_contract_type` (`id`);

--
-- Contraintes pour la table `adcog_faq`
--
ALTER TABLE `adcog_faq`
  ADD CONSTRAINT `FK_158EDC8812469DE2` FOREIGN KEY (`category_id`) REFERENCES `adcog_faq_category` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `adcog_office`
--
ALTER TABLE `adcog_office`
  ADD CONSTRAINT `FK_5B0508E9A76ED395` FOREIGN KEY (`user_id`) REFERENCES `adcog_user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_5B0508E9D60322AC` FOREIGN KEY (`role_id`) REFERENCES `adcog_role` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `adcog_payment`
--
ALTER TABLE `adcog_payment`
  ADD CONSTRAINT `FK_5ADFEB9EA76ED395` FOREIGN KEY (`user_id`) REFERENCES `adcog_user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `adcog_post`
--
ALTER TABLE `adcog_post`
  ADD CONSTRAINT `FK_2BC698ADF675F31B` FOREIGN KEY (`author_id`) REFERENCES `adcog_user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `adcog_profile`
--
ALTER TABLE `adcog_profile`
  ADD CONSTRAINT `FK_B6A0C59CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `adcog_user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `adcog_user`
--
ALTER TABLE `adcog_user`
  ADD CONSTRAINT `FK_FCDF2269C32A47EE` FOREIGN KEY (`school_id`) REFERENCES `adcog_school` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `bookmark_tag`
--
ALTER TABLE `bookmark_tag`
  ADD CONSTRAINT `FK_23CB7F4A92741D25` FOREIGN KEY (`bookmark_id`) REFERENCES `adcog_bookmark` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_23CB7F4ABAD26311` FOREIGN KEY (`tag_id`) REFERENCES `adcog_tag` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `experience_sector`
--
ALTER TABLE `experience_sector`
  ADD CONSTRAINT `FK_BF143EC546E90E27` FOREIGN KEY (`experience_id`) REFERENCES `adcog_experience` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_BF143EC5DE95C867` FOREIGN KEY (`sector_id`) REFERENCES `adcog_sector` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `post_tag`
--
ALTER TABLE `post_tag`
  ADD CONSTRAINT `FK_5ACE3AF04B89032C` FOREIGN KEY (`post_id`) REFERENCES `adcog_post` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_5ACE3AF0BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `adcog_tag` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
