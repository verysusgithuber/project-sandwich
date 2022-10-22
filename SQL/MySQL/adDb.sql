-- ads db
-- need for works ads
-- only for mysql 5.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `AdsTable` (
  `AdID` bigint(20) NOT NULL DEFAULT '0',
  `AdCreatorID` bigint(20) NOT NULL DEFAULT '0',
  `AdName` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `AdImage` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `AdHref` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

-- indexs

ALTER TABLE `AdsTable`
  ADD PRIMARY KEY (`AdID`);
COMMIT;
