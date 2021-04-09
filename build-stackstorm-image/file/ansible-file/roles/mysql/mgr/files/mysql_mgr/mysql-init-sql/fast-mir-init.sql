-- fast_mir_application database defination
DROP DATABASE IF EXISTS  `fast_mir_application`;
CREATE SCHEMA `fast_mir_application` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- fast_mir_blueprint database defination
DROP DATABASE IF EXISTS  `fast_mir_blueprint`;
CREATE SCHEMA `fast_mir_blueprint` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- fast_mir_image database defination
DROP DATABASE IF EXISTS  `fast_mir_image`;
CREATE SCHEMA `fast_mir_image` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


-- fast_mir_image_builder database defination
DROP DATABASE IF EXISTS  `fast_mir_image_builder`;
CREATE SCHEMA `fast_mir_image_builder` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


-- fast_mir_k8s database defination
DROP DATABASE IF EXISTS  `fast_mir_k8s`;
CREATE SCHEMA `fast_mir_k8s` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

-- fast_mir_namespace database defination
DROP DATABASE IF EXISTS  `fast_mir_namespace`;
CREATE SCHEMA `fast_mir_namespace` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


-- fast_mir_storage database defination
DROP DATABASE IF EXISTS  `fast_mir_storage`;
CREATE SCHEMA `fast_mir_storage` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP DATABASE IF EXISTS  `mir_cicd_ci`;
CREATE SCHEMA `mir_cicd_ci` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP DATABASE IF EXISTS  `mir_cicd_api`;
CREATE SCHEMA `mir_cicd_api` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

GRANT ALL ON *.* to 'root'@'%' IDENTIFIED BY 'chinacloudroot';

FLUSH PRIVILEGES;