-- gamesdb db
-- only for mysql 5.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `GamesDB` (
  `gameID` bigint(20) UNSIGNED NOT NULL,
  `gamePRIVATE` tinyint(1) NOT NULL,
  `gameBuilderCLUB` tinyint(4) NOT NULL DEFAULT '0',
  `gameACTIVE` tinyint(4) NOT NULL DEFAULT '1',
  `gameMustBeRADMIN` tinyint(4) NOT NULL DEFAULT '1',
  `gameRadminNAME` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gameRadminPASSWORD` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gameGENRE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gameURL` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gameServerID` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gameServerPORT` bigint(20) NOT NULL,
  `gameDESCRIPTION` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gameNAME` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gameBitViewVideoID` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `gameICON` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gameCreatorID` bigint(20) NOT NULL DEFAULT '0',
  `gameCREATED` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gameFAVORITES` bigint(20) NOT NULL,
  `gameDISLIKES` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `GamesFavoritesDB` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `userId` bigint(20) NOT NULL,
  `assetId` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- indexs

ALTER TABLE `GamesDB`
  ADD PRIMARY KEY (`gameID`);

ALTER TABLE `GamesFavoritesDB`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `GamesDB`
  MODIFY `gameID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `GamesFavoritesDB`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;
