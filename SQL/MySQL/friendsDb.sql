-- friends db
-- this need for works friends system
-- only for mysql 5.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE `FriendsTable` (
  `PrimaryValue` bigint(20) UNSIGNED NOT NULL,
  `FriendID1` bigint(20) NOT NULL,
  `FriendID2` bigint(20) NOT NULL,
  `RequestStatus` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `BEST_FRIEND1` tinyint(4) NOT NULL DEFAULT '0',
  `BEST_FRIEND2` tinyint(4) NOT NULL DEFAULT '0',
  `AVALIABLE_FOR_DISPLAY1` tinyint(4) NOT NULL DEFAULT '1',
  `AVALIABLE_FOR_DISPLAY2` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- indexs

ALTER TABLE `FriendsTable`
  ADD PRIMARY KEY (`PrimaryValue`);


ALTER TABLE `FriendsTable`
  MODIFY `PrimaryValue` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;
