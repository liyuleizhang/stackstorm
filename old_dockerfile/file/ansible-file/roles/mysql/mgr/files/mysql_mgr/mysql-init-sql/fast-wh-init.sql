-- fast_whitehole database defination
DROP DATABASE IF EXISTS  `fast_wh`;
CREATE SCHEMA `fast_wh` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
GRANT ALL ON *.* to wh@'%' IDENTIFIED BY '123456';

-- fast_statistics database defination
DROP DATABASE IF EXISTS  `fast_statistics`;
CREATE SCHEMA `fast_statistics` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

FLUSH PRIVILEGES;
