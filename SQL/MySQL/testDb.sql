-- test db
-- only for mysql 5.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `reg_forum` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tag` bigint(20) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `threads` bigint(20) NOT NULL DEFAULT '0',
  `posts` bigint(20) NOT NULL DEFAULT '0',
  `latestpost` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `latestpostcreator` bigint(20) NOT NULL,
  `latestpostid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `reg_forum_content` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `forum` bigint(20) NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author` bigint(20) NOT NULL,
  `replies` bigint(20) NOT NULL DEFAULT '0',
  `latestpost` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `latestpostcreator` bigint(20) NOT NULL,
  `latestpostid` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `reg_forum_posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pinned` tinyint(4) NOT NULL DEFAULT '0',
  `thread` bigint(20) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `forum` bigint(20) NOT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `author` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `reg_forum_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `reg_groups` (
  `idGroup` bigint(20) UNSIGNED NOT NULL,
  `idSpecialGroup` longtext COLLATE utf8_unicode_ci NOT NULL,
  `idCreator` bigint(20) NOT NULL,
  `nameGroup` longtext COLLATE utf8_unicode_ci NOT NULL,
  `descriptionGroup` longtext COLLATE utf8_unicode_ci NOT NULL,
  `iconGroup` longtext COLLATE utf8_unicode_ci NOT NULL,
  `membersGroup` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


CREATE TABLE `reg_groups_members` (
  `specialId` bigint(20) NOT NULL,
  `idMember` bigint(20) NOT NULL,
  `rankMember` tinyint(4) NOT NULL,
  `idGroup` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `reg_login_attempt` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip` int(11) UNSIGNED NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `reg_promos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` bigint(20) NOT NULL,
  `used` bigint(20) NOT NULL,
  `prizeType` tinyint(4) NOT NULL,
  `prizeCount` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `reg_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `verifiedEmail` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `inviterToken` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dollars1Part` bigint(20) NOT NULL DEFAULT '0',
  `dollars2Part` bigint(20) NOT NULL DEFAULT '0',
  `avaliableToChat` longtext COLLATE utf8_unicode_ci NOT NULL,
  `avaliableToInviteInParty` longtext COLLATE utf8_unicode_ci NOT NULL,
  `avaliableToSendPrivateMessages` longtext COLLATE utf8_unicode_ci NOT NULL,
  `avaliableToFollow` longtext COLLATE utf8_unicode_ci NOT NULL,
  `avaliableToDisplayProfile` longtext COLLATE utf8_unicode_ci NOT NULL,
  `FREEBLOXERNAME` text COLLATE utf8_unicode_ci NOT NULL,
  `FREEBLOXERPRIMARYGROUP` bigint(20) NOT NULL,
  `BUILDER_CLUB` tinyint(4) NOT NULL DEFAULT '0',
  `USED_PLACE_SLOTS` bigint(20) NOT NULL,
  `FREEBLOXERIMG` longtext COLLATE utf8_unicode_ci NOT NULL,
  `FREEBLOXER_WAITINGIMG` longtext COLLATE utf8_unicode_ci NOT NULL,
  `FREEBLOXERDESC` longtext COLLATE utf8_unicode_ci NOT NULL,
  `FREEBLOXERSTATUS` longtext COLLATE utf8_unicode_ci NOT NULL,
  `FREEBLOXFRIENDS` bigint(20) NOT NULL DEFAULT '0',
  `FREEBLOXFORUMPOSTS` bigint(20) NOT NULL DEFAULT '0',
  `FREEBLOXPLACEVISITS` bigint(20) NOT NULL DEFAULT '0',
  `FREEBLOXKNOCKOUTS` bigint(20) NOT NULL DEFAULT '0',
  `Tix` bigint(20) NOT NULL DEFAULT '15',
  `Robux` bigint(20) NOT NULL DEFAULT '5',
  `rank` tinyint(2) NOT NULL DEFAULT '0',
  `registered` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_active` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `token_validity` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- indexs

ALTER TABLE `reg_forum`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `reg_forum_content`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `reg_forum_posts`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `reg_forum_tag`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `reg_groups`
  ADD PRIMARY KEY (`idGroup`);

ALTER TABLE `reg_groups_members`
  ADD PRIMARY KEY (`specialId`);

ALTER TABLE `reg_login_attempt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ip` (`ip`);

ALTER TABLE `reg_promos`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `reg_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `token` (`token`);

ALTER TABLE `reg_forum`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `reg_forum_content`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `reg_forum_posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `reg_forum_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `reg_groups`
  MODIFY `idGroup` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `reg_groups_members`
  MODIFY `specialId` bigint(20) NOT NULL AUTO_INCREMENT;

ALTER TABLE `reg_login_attempt`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `reg_promos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `reg_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;
