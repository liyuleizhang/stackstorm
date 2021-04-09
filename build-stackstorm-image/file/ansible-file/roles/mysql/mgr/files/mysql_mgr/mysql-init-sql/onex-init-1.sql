-- one_logging database defination
DROP DATABASE IF EXISTS  `one_logging`;
CREATE SCHEMA `one_logging` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- one_task_scheduler database defination
DROP DATABASE IF EXISTS  `one_task_scheduler`;
CREATE SCHEMA `one_task_scheduler` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- one_infrastructure database defination
DROP DATABASE IF EXISTS  `one_infrastructure`;
CREATE SCHEMA `one_infrastructure` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

GRANT ALL ON *.* to onex@'%' IDENTIFIED BY '123456';

FLUSH PRIVILEGES;
