-- ------------------------------------------------
-- Dumping structure for table redemrp.characters
USE `redemrp`;

CREATE TABLE IF NOT EXISTS `character_score` (
  `identifier` varchar(50) COLLATE utf8mb4_bin DEFAULT NULL,
  `characterid` int(11) DEFAULT 0,
  `kill` int(11) DEFAULT 0,
  `death` int(11) DEFAULT 0,
  `score` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
