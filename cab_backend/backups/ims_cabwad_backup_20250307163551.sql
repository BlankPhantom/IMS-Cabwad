-- Database backup created on 2025-03-07 16:35:51
-- Database: ims_cabwad

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO `auth_permission` VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO `auth_permission` VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO `auth_permission` VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO `auth_permission` VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO `auth_permission` VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO `auth_permission` VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO `auth_permission` VALUES (13, 'Can add user', 4, 'add_user');
INSERT INTO `auth_permission` VALUES (14, 'Can change user', 4, 'change_user');
INSERT INTO `auth_permission` VALUES (15, 'Can delete user', 4, 'delete_user');
INSERT INTO `auth_permission` VALUES (16, 'Can view user', 4, 'view_user');
INSERT INTO `auth_permission` VALUES (17, 'Can add content type', 5, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (18, 'Can change content type', 5, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (19, 'Can delete content type', 5, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (20, 'Can view content type', 5, 'view_contenttype');
INSERT INTO `auth_permission` VALUES (21, 'Can add session', 6, 'add_session');
INSERT INTO `auth_permission` VALUES (22, 'Can change session', 6, 'change_session');
INSERT INTO `auth_permission` VALUES (23, 'Can delete session', 6, 'delete_session');
INSERT INTO `auth_permission` VALUES (24, 'Can view session', 6, 'view_session');
INSERT INTO `auth_permission` VALUES (25, 'Can add Token', 7, 'add_token');
INSERT INTO `auth_permission` VALUES (26, 'Can change Token', 7, 'change_token');
INSERT INTO `auth_permission` VALUES (27, 'Can delete Token', 7, 'delete_token');
INSERT INTO `auth_permission` VALUES (28, 'Can view Token', 7, 'view_token');
INSERT INTO `auth_permission` VALUES (29, 'Can add Token', 8, 'add_tokenproxy');
INSERT INTO `auth_permission` VALUES (30, 'Can change Token', 8, 'change_tokenproxy');
INSERT INTO `auth_permission` VALUES (31, 'Can delete Token', 8, 'delete_tokenproxy');
INSERT INTO `auth_permission` VALUES (32, 'Can view Token', 8, 'view_tokenproxy');
INSERT INTO `auth_permission` VALUES (33, 'Can add area', 9, 'add_area');
INSERT INTO `auth_permission` VALUES (34, 'Can change area', 9, 'change_area');
INSERT INTO `auth_permission` VALUES (35, 'Can delete area', 9, 'delete_area');
INSERT INTO `auth_permission` VALUES (36, 'Can view area', 9, 'view_area');
INSERT INTO `auth_permission` VALUES (37, 'Can add classification', 10, 'add_classification');
INSERT INTO `auth_permission` VALUES (38, 'Can change classification', 10, 'change_classification');
INSERT INTO `auth_permission` VALUES (39, 'Can delete classification', 10, 'delete_classification');
INSERT INTO `auth_permission` VALUES (40, 'Can view classification', 10, 'view_classification');
INSERT INTO `auth_permission` VALUES (41, 'Can add measurement', 11, 'add_measurement');
INSERT INTO `auth_permission` VALUES (42, 'Can change measurement', 11, 'change_measurement');
INSERT INTO `auth_permission` VALUES (43, 'Can delete measurement', 11, 'delete_measurement');
INSERT INTO `auth_permission` VALUES (44, 'Can view measurement', 11, 'view_measurement');
INSERT INTO `auth_permission` VALUES (45, 'Can add monthly consumption total', 12, 'add_monthlyconsumptiontotal');
INSERT INTO `auth_permission` VALUES (46, 'Can change monthly consumption total', 12, 'change_monthlyconsumptiontotal');
INSERT INTO `auth_permission` VALUES (47, 'Can delete monthly consumption total', 12, 'delete_monthlyconsumptiontotal');
INSERT INTO `auth_permission` VALUES (48, 'Can view monthly consumption total', 12, 'view_monthlyconsumptiontotal');
INSERT INTO `auth_permission` VALUES (49, 'Can add purpose', 13, 'add_purpose');
INSERT INTO `auth_permission` VALUES (50, 'Can change purpose', 13, 'change_purpose');
INSERT INTO `auth_permission` VALUES (51, 'Can delete purpose', 13, 'delete_purpose');
INSERT INTO `auth_permission` VALUES (52, 'Can view purpose', 13, 'view_purpose');
INSERT INTO `auth_permission` VALUES (53, 'Can add section', 14, 'add_section');
INSERT INTO `auth_permission` VALUES (54, 'Can change section', 14, 'change_section');
INSERT INTO `auth_permission` VALUES (55, 'Can delete section', 14, 'delete_section');
INSERT INTO `auth_permission` VALUES (56, 'Can view section', 14, 'view_section');
INSERT INTO `auth_permission` VALUES (57, 'Can add item', 15, 'add_item');
INSERT INTO `auth_permission` VALUES (58, 'Can change item', 15, 'change_item');
INSERT INTO `auth_permission` VALUES (59, 'Can delete item', 15, 'delete_item');
INSERT INTO `auth_permission` VALUES (60, 'Can view item', 15, 'view_item');
INSERT INTO `auth_permission` VALUES (61, 'Can add beginning balance', 16, 'add_beginningbalance');
INSERT INTO `auth_permission` VALUES (62, 'Can change beginning balance', 16, 'change_beginningbalance');
INSERT INTO `auth_permission` VALUES (63, 'Can delete beginning balance', 16, 'delete_beginningbalance');
INSERT INTO `auth_permission` VALUES (64, 'Can view beginning balance', 16, 'view_beginningbalance');
INSERT INTO `auth_permission` VALUES (65, 'Can add running balance', 17, 'add_runningbalance');
INSERT INTO `auth_permission` VALUES (66, 'Can change running balance', 17, 'change_runningbalance');
INSERT INTO `auth_permission` VALUES (67, 'Can delete running balance', 17, 'delete_runningbalance');
INSERT INTO `auth_permission` VALUES (68, 'Can view running balance', 17, 'view_runningbalance');
INSERT INTO `auth_permission` VALUES (69, 'Can add transaction details', 18, 'add_transactiondetails');
INSERT INTO `auth_permission` VALUES (70, 'Can change transaction details', 18, 'change_transactiondetails');
INSERT INTO `auth_permission` VALUES (71, 'Can delete transaction details', 18, 'delete_transactiondetails');
INSERT INTO `auth_permission` VALUES (72, 'Can view transaction details', 18, 'view_transactiondetails');
INSERT INTO `auth_permission` VALUES (73, 'Can add transaction product', 19, 'add_transactionproduct');
INSERT INTO `auth_permission` VALUES (74, 'Can change transaction product', 19, 'change_transactionproduct');
INSERT INTO `auth_permission` VALUES (75, 'Can delete transaction product', 19, 'delete_transactionproduct');
INSERT INTO `auth_permission` VALUES (76, 'Can view transaction product', 19, 'view_transactionproduct');
INSERT INTO `auth_permission` VALUES (77, 'Can add monthly consumption', 20, 'add_monthlyconsumption');
INSERT INTO `auth_permission` VALUES (78, 'Can change monthly consumption', 20, 'change_monthlyconsumption');
INSERT INTO `auth_permission` VALUES (79, 'Can delete monthly consumption', 20, 'delete_monthlyconsumption');
INSERT INTO `auth_permission` VALUES (80, 'Can view monthly consumption', 20, 'view_monthlyconsumption');

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `auth_user` VALUES (1, 'pbkdf2_sha256$870000$Ybfzcnud6KZtN3NWEVf4BC$/yDP9tUlaivTNYmxuIjlZvmeqvUq6QFu1iSd8afXWXw=', NULL, 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2025-03-07 05:24:58');

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `authtoken_token` VALUES ('6d96649b73fd62238d835c081db5c7fb8398609b', '2025-03-07 05:33:24', 1);

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'auth', 'user');
INSERT INTO `django_content_type` VALUES (7, 'authtoken', 'token');
INSERT INTO `django_content_type` VALUES (8, 'authtoken', 'tokenproxy');
INSERT INTO `django_content_type` VALUES (5, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (9, 'ims', 'area');
INSERT INTO `django_content_type` VALUES (16, 'ims', 'beginningbalance');
INSERT INTO `django_content_type` VALUES (10, 'ims', 'classification');
INSERT INTO `django_content_type` VALUES (15, 'ims', 'item');
INSERT INTO `django_content_type` VALUES (11, 'ims', 'measurement');
INSERT INTO `django_content_type` VALUES (20, 'ims', 'monthlyconsumption');
INSERT INTO `django_content_type` VALUES (12, 'ims', 'monthlyconsumptiontotal');
INSERT INTO `django_content_type` VALUES (13, 'ims', 'purpose');
INSERT INTO `django_content_type` VALUES (17, 'ims', 'runningbalance');
INSERT INTO `django_content_type` VALUES (14, 'ims', 'section');
INSERT INTO `django_content_type` VALUES (18, 'ims', 'transactiondetails');
INSERT INTO `django_content_type` VALUES (19, 'ims', 'transactionproduct');
INSERT INTO `django_content_type` VALUES (6, 'sessions', 'session');

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2025-03-07 05:24:43');
INSERT INTO `django_migrations` VALUES (2, 'auth', '0001_initial', '2025-03-07 05:24:44');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2025-03-07 05:24:44');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2025-03-07 05:24:44');
INSERT INTO `django_migrations` VALUES (5, 'admin', '0003_logentry_add_action_flag_choices', '2025-03-07 05:24:44');
INSERT INTO `django_migrations` VALUES (6, 'contenttypes', '0002_remove_content_type_name', '2025-03-07 05:24:44');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2025-03-07 05:24:44');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2025-03-07 05:24:44');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2025-03-07 05:24:44');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2025-03-07 05:24:44');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2025-03-07 05:24:44');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2025-03-07 05:24:44');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2025-03-07 05:24:44');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2025-03-07 05:24:44');
INSERT INTO `django_migrations` VALUES (15, 'auth', '0010_alter_group_name_max_length', '2025-03-07 05:24:45');
INSERT INTO `django_migrations` VALUES (16, 'auth', '0011_update_proxy_permissions', '2025-03-07 05:24:45');
INSERT INTO `django_migrations` VALUES (17, 'auth', '0012_alter_user_first_name_max_length', '2025-03-07 05:24:45');
INSERT INTO `django_migrations` VALUES (18, 'authtoken', '0001_initial', '2025-03-07 05:24:45');
INSERT INTO `django_migrations` VALUES (19, 'authtoken', '0002_auto_20160226_1747', '2025-03-07 05:24:45');
INSERT INTO `django_migrations` VALUES (20, 'authtoken', '0003_tokenproxy', '2025-03-07 05:24:45');
INSERT INTO `django_migrations` VALUES (21, 'authtoken', '0004_alter_tokenproxy_options', '2025-03-07 05:24:45');
INSERT INTO `django_migrations` VALUES (22, 'ims', '0001_initial', '2025-03-07 05:24:46');
INSERT INTO `django_migrations` VALUES (23, 'sessions', '0001_initial', '2025-03-07 05:24:46');

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `ims_area` (
  `areaID` int NOT NULL AUTO_INCREMENT,
  `areaName` varchar(100) NOT NULL,
  PRIMARY KEY (`areaID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `ims_area` VALUES (1, 'N/A');
INSERT INTO `ims_area` VALUES (2, 'Casile');
INSERT INTO `ims_area` VALUES (3, 'Diezmo');
INSERT INTO `ims_area` VALUES (4, 'PS1');
INSERT INTO `ims_area` VALUES (5, 'PS2');
INSERT INTO `ims_area` VALUES (6, 'PS3');

CREATE TABLE `ims_beginningbalance` (
  `id` int NOT NULL AUTO_INCREMENT,
  `itemID` varchar(20) NOT NULL,
  `itemName` varchar(500) NOT NULL,
  `itemQuantity` int NOT NULL,
  `unitCost` double NOT NULL,
  `totalCost` double NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `measurementID_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ims_beginningbalance_measurementID_id_3f8f302a_fk_ims_measu` (`measurementID_id`),
  CONSTRAINT `ims_beginningbalance_measurementID_id_3f8f302a_fk_ims_measu` FOREIGN KEY (`measurementID_id`) REFERENCES `ims_measurement` (`measurementID`)
) ENGINE=InnoDB AUTO_INCREMENT=746 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `ims_beginningbalance` VALUES (1, '01-001', 'Chlorine Dioxide - Liquid', 0, 0.0, 0.0, '2025-03-07 05:25:14', 22);
INSERT INTO `ims_beginningbalance` VALUES (2, '01-002', 'Chlorine Dioxide - Powder', 0, 0.0, 0.0, '2025-03-07 05:25:14', 9);
INSERT INTO `ims_beginningbalance` VALUES (3, '01-003', 'Chlorine Granules', 0, 0.0, 0.0, '2025-03-07 05:25:14', 9);
INSERT INTO `ims_beginningbalance` VALUES (4, '02-001', 'Asphalt', 0, 0.0, 0.0, '2025-03-07 05:25:14', 10);
INSERT INTO `ims_beginningbalance` VALUES (5, '02-002', 'Cement- RIZAL', 0, 0.0, 0.0, '2025-03-07 05:25:14', 4);
INSERT INTO `ims_beginningbalance` VALUES (6, '02-003', 'Gravel', 0, 0.0, 0.0, '2025-03-07 05:25:14', 19);
INSERT INTO `ims_beginningbalance` VALUES (7, '02-004', 'White Sand', 0, 0.0, 0.0, '2025-03-07 05:25:14', 19);
INSERT INTO `ims_beginningbalance` VALUES (8, '02-005', 'Concrete Hollow Blocks', 0, 0.0, 0.0, '2025-03-07 05:25:14', 1);
INSERT INTO `ims_beginningbalance` VALUES (9, '02-006', 'Flexible Hose- Flexible Oppo', 0, 0.0, 0.0, '2025-03-07 05:25:14', 15);
INSERT INTO `ims_beginningbalance` VALUES (10, '02-007', 'C-Clamp PVC', 0, 0.0, 0.0, '2025-03-07 05:25:14', 19);
INSERT INTO `ims_beginningbalance` VALUES (11, '02-008', 'THHN 14" - BOSTON', 0, 0.0, 0.0, '2025-03-07 05:25:14', 19);
INSERT INTO `ims_beginningbalance` VALUES (12, '02-009', 'FI Hose 1/2 x 1/2 x 24', 0, 0.0, 0.0, '2025-03-07 05:25:14', 19);
INSERT INTO `ims_beginningbalance` VALUES (13, '02-010', 'Flexible Hose 1/2 X 50 - OMEGA', 0, 0.0, 0.0, '2025-03-07 05:25:14', 20);
INSERT INTO `ims_beginningbalance` VALUES (14, '02-011', 'Flexible Hose 3/8', 0, 0.0, 0.0, '2025-03-07 05:25:14', 19);
INSERT INTO `ims_beginningbalance` VALUES (15, '02-012', 'Skim Coat- ABC', 0, 0.0, 0.0, '2025-03-07 05:25:14', 19);
INSERT INTO `ims_beginningbalance` VALUES (16, '02-013', 'Angle Valve 1/2 x 3/8', 0, 0.0, 0.0, '2025-03-07 05:25:14', 19);
INSERT INTO `ims_beginningbalance` VALUES (17, '02-014', 'Angle Valve 1/2 x 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:14', 19);
INSERT INTO `ims_beginningbalance` VALUES (18, '02-015', 'Angle Valve 1/2 x 3/4', 0, 0.0, 0.0, '2025-03-07 05:25:14', 19);
INSERT INTO `ims_beginningbalance` VALUES (19, '02-016', 'C Purlins 2x3 GI 1.4', 0, 0.0, 0.0, '2025-03-07 05:25:14', 19);
INSERT INTO `ims_beginningbalance` VALUES (20, '02-017', 'Angel Bar 4.5mm x 2', 0, 0.0, 0.0, '2025-03-07 05:25:14', 19);
INSERT INTO `ims_beginningbalance` VALUES (21, '02-018', 'Goose Neck Faucet- SUNRISE', 0, 0.0, 0.0, '2025-03-07 05:25:14', 19);
INSERT INTO `ims_beginningbalance` VALUES (22, '02-019', 'Lavatory Valve', 0, 0.0, 0.0, '2025-03-07 05:25:14', 19);
INSERT INTO `ims_beginningbalance` VALUES (23, '02-020', 'Faucet Brass hose Bibb- HAWK', 0, 0.0, 0.0, '2025-03-07 05:25:14', 19);
INSERT INTO `ims_beginningbalance` VALUES (24, '02-021', 'Two-Way Faucet Valve', 0, 0.0, 0.0, '2025-03-07 05:25:14', 19);
INSERT INTO `ims_beginningbalance` VALUES (25, '02-022', 'Lavatory Faucet', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (26, '02-023', 'Diamond Cutting Disc', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (27, '02-024', 'Cable Tie 6 x 2mm - POWER HOUSE', 0, 0.0, 0.0, '2025-03-07 05:25:15', 16);
INSERT INTO `ims_beginningbalance` VALUES (28, '02-025', 'Padlock - Hardware', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (29, '02-026', 'Hardiflex 3/16 - JAMES HARDI', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (30, '02-027', 'Two Gang Outlet - ROYU', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (31, '02-028', 'Hook', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (32, '02-029', 'Aluminum Silver (PAINT)', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (33, '02-030', 'Welding Rod 6013 Special- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:15', 11);
INSERT INTO `ims_beginningbalance` VALUES (34, '02-031', 'Tie Wire', 0, 0.0, 0.0, '2025-03-07 05:25:15', 11);
INSERT INTO `ims_beginningbalance` VALUES (35, '02-032', 'Bosny Black- Pylox', 0, 0.0, 0.0, '2025-03-07 05:25:15', 8);
INSERT INTO `ims_beginningbalance` VALUES (36, '02-033', 'Electrical Tape- BIG Armak', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (37, '02-034', 'Masking Tape 3/4', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (38, '02-035', 'Regular Plug', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (39, '02-036', 'Three Gang Outlet', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (40, '02-037', 'Marine Ply Wood - 3/4', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (41, '02-038', 'Barateha', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (42, '02-039', 'Piano Hinges', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (43, '02-040', 'Concrete Nail 1 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:15', 11);
INSERT INTO `ims_beginningbalance` VALUES (44, '02-041', 'Stikwel - Wood Glue', 0, 0.0, 0.0, '2025-03-07 05:25:15', 12);
INSERT INTO `ims_beginningbalance` VALUES (45, '02-042', 'Cabinet Handle', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (46, '02-043', 'Thalo blue - Acrylic', 0, 0.0, 0.0, '2025-03-07 05:25:15', 12);
INSERT INTO `ims_beginningbalance` VALUES (47, '02-044', 'THHN 12" - BOSTON', 0, 0.0, 0.0, '2025-03-07 05:25:15', 5);
INSERT INTO `ims_beginningbalance` VALUES (48, '02-045', 'THNN 14 - BOSTON', 0, 0.0, 0.0, '2025-03-07 05:25:15', 5);
INSERT INTO `ims_beginningbalance` VALUES (49, '02-046', 'BLIND RIVITS 1/8 X 3/4', 0, 0.0, 0.0, '2025-03-07 05:25:15', 5);
INSERT INTO `ims_beginningbalance` VALUES (50, '02-047', 'Cement spoon', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (51, '02-048', 'Tubular 1 x 1 1.4', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (52, '02-049', 'Cylindrical Hinges 3/4', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (53, '02-050', 'Door Knob', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (54, '02-051', 'Deform Bar - 10mm', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (55, '02-052', 'PVC Door 60 x 210 w/ Hinges', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (56, '02-053', 'Blue Clamp 1/2 - Hardware', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (57, '02-054', 'Solignum- All aroud', 0, 0.0, 0.0, '2025-03-07 05:25:15', 12);
INSERT INTO `ims_beginningbalance` VALUES (58, '02-055', 'Liha - 1000 & 100', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (59, '02-056', 'Tansi', 0, 0.0, 0.0, '2025-03-07 05:25:15', 20);
INSERT INTO `ims_beginningbalance` VALUES (60, '02-057', 'Drill bit 5/16', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (61, '02-058', 'Chalk stone', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (62, '02-059', 'Epoxy primer', 0, 0.0, 0.0, '2025-03-07 05:25:15', 12);
INSERT INTO `ims_beginningbalance` VALUES (63, '02-060', 'Latex Gloss - Paint', 0, 0.0, 0.0, '2025-03-07 05:25:15', 12);
INSERT INTO `ims_beginningbalance` VALUES (64, '02-061', 'Sahara- ( water proofing )', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (65, '02-062', 'Singer Oil', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (66, '02-063', 'Varnish', 0, 0.0, 0.0, '2025-03-07 05:25:15', 12);
INSERT INTO `ims_beginningbalance` VALUES (67, '02-064', 'Rust Converter', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (68, '02-065', 'WD - 40', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (69, '02-066', 'Tape Measure', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (70, '02-067', 'C. Clamp 3/4', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (71, '02-068', 'C. Clamp 1"', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (72, '02-069', 'Single Switch', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (73, '02-070', 'Receptacle 4 x 4 - omni', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (74, '02-071', 'Junction Box 4 x 4 - pvc', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (75, '02-072', 'Utility Box 2 x 4 - pvc  - ROYU', 0, 0.0, 0.0, '2025-03-07 05:25:15', 19);
INSERT INTO `ims_beginningbalance` VALUES (76, '02-073', '1 Gang Switch- Panasonic', 0, 0.0, 0.0, '2025-03-07 05:25:15', 21);
INSERT INTO `ims_beginningbalance` VALUES (77, '02-074', '2 Gang Switch- Royu', 0, 0.0, 0.0, '2025-03-07 05:25:15', 21);
INSERT INTO `ims_beginningbalance` VALUES (78, '02-075', 'Flat Hose 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:15', 20);
INSERT INTO `ims_beginningbalance` VALUES (79, '02-076', '2 Gang Outlet- Panasonic', 0, 0.0, 0.0, '2025-03-07 05:25:16', 21);
INSERT INTO `ims_beginningbalance` VALUES (80, '02-077', 'Blind Rivits 5/32 x 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:16', 5);
INSERT INTO `ims_beginningbalance` VALUES (81, '02-078', 'Bathroom Bidet-  SUNRISE', 0, 0.0, 0.0, '2025-03-07 05:25:16', 21);
INSERT INTO `ims_beginningbalance` VALUES (82, '02-079', 'Concrete nail #2', 0, 0.0, 0.0, '2025-03-07 05:25:16', 11);
INSERT INTO `ims_beginningbalance` VALUES (83, '02-080', 'Concrete nail #3', 0, 0.0, 0.0, '2025-03-07 05:25:16', 11);
INSERT INTO `ims_beginningbalance` VALUES (84, '02-081', 'Tek screw 1 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (85, '02-082', 'Hand Riveter', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (86, '02-083', 'Tank Lever Flush', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (87, '02-084', 'Tank Fittings', 0, 0.0, 0.0, '2025-03-07 05:25:16', 21);
INSERT INTO `ims_beginningbalance` VALUES (88, '02-085', 'Electrical PVC Pipe 1/2 - (Orange)', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (89, '02-086', 'PVC Pipe 4" ( Orange )', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (90, '02-087', 'Elbow  4" ( Orange )', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (91, '02-088', 'Clean Out Cover 4" pvc', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (92, '02-089', 'Pollituff', 0, 0.0, 0.0, '2025-03-07 05:25:16', 12);
INSERT INTO `ims_beginningbalance` VALUES (93, '02-090', 'Hardener Cream', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (94, '02-091', 'Submeter', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (95, '02-092', 'Expansion Bolt 3/5 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (96, '02-093', 'Hinges 3 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (97, '02-094', 'Plug Adapter', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (98, '02-095', 'Grinding Disc- For Finishing', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (99, '02-096', 'Spatula', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (100, '02-097', 'Wall Scrapper - (Paleta)', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (101, '02-098', 'Blind Rivits  1/8 x 1/2 - LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:16', 5);
INSERT INTO `ims_beginningbalance` VALUES (102, '02-099', 'Gunting ng Yero', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (103, '02-100', 'Paint Remover', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (104, '02-101', 'Rugby', 0, 0.0, 0.0, '2025-03-07 05:25:16', 6);
INSERT INTO `ims_beginningbalance` VALUES (105, '02-102', 'Rodela - Bakal', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (106, '02-103', 'Rodela - Kahoy', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (107, '02-104', 'Elasto Seal - water proofing sealant', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (108, '02-105', 'Rope', 0, 0.0, 0.0, '2025-03-07 05:25:16', 14);
INSERT INTO `ims_beginningbalance` VALUES (109, '02-106', 'Circuit Breaker - 60A PLUG IN- GE', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (110, '02-107', 'Toks screw', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (111, '02-108', 'Elbow 2" Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (112, '02-109', 'PVC 2" Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (113, '02-110', 'Square Bar 10mm', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (114, '02-111', 'Sealant', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (115, '02-112', 'Faucet - 6"', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (116, '02-113', 'C. Clamp 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (117, '02-114', 'Cocolumber 2 x 3 x 12', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (118, '02-115', 'Flat Cord #14', 0, 0.0, 0.0, '2025-03-07 05:25:16', 14);
INSERT INTO `ims_beginningbalance` VALUES (119, '02-116', 'Common Nail #3- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:16', 11);
INSERT INTO `ims_beginningbalance` VALUES (120, '02-117', 'Common Nail #2- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:16', 11);
INSERT INTO `ims_beginningbalance` VALUES (121, '02-118', 'Umbrella Nail', 0, 0.0, 0.0, '2025-03-07 05:25:16', 11);
INSERT INTO `ims_beginningbalance` VALUES (122, '02-119', 'PVC Elbow 3/4 - Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (123, '02-120', 'PVC Pipe 3/4- Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (124, '02-121', 'PVC Pipe 2" Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (125, '02-122', 'PVC Pipe 3" Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (126, '02-123', 'P- Trap 2" Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (127, '02-124', 'Tee 2" Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (128, '02-125', 'Elbow 3" Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (129, '02-126', 'PVC- Y 3 x 2 -Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (130, '02-127', 'Clean Out Cover 3" pvc', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (131, '02-128', 'Kiln Dry Wood- 1 1/2 x 2 x 12', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (132, '02-129', 'Kiln Dry Wood- 1/2 x 2 x 12', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (133, '02-130', 'Flat Disc', 0, 0.0, 0.0, '2025-03-07 05:25:16', 19);
INSERT INTO `ims_beginningbalance` VALUES (134, '02-131', 'Flat Nail 1"', 0, 0.0, 0.0, '2025-03-07 05:25:17', 11);
INSERT INTO `ims_beginningbalance` VALUES (135, '02-132', 'Flat Nail 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:17', 11);
INSERT INTO `ims_beginningbalance` VALUES (136, '02-133', 'Tile Trim', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (137, '02-134', 'Kitchen Sink', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (138, '02-135', 'PMR Strainer', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (139, '02-136', 'Flex Hose - 1/2 x 16', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (140, '02-137', 'Vulca Seal - BOSTIK', 0, 0.0, 0.0, '2025-03-07 05:25:17', 12);
INSERT INTO `ims_beginningbalance` VALUES (141, '02-138', 'Metal Furring 0.5', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (142, '02-139', 'QDE Enamel white', 0, 0.0, 0.0, '2025-03-07 05:25:17', 2);
INSERT INTO `ims_beginningbalance` VALUES (143, '02-140', 'Hamba 80 x 210', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (144, '02-141', 'Garden Hose 5/8- EXCEL', 0, 0.0, 0.0, '2025-03-07 05:25:17', 14);
INSERT INTO `ims_beginningbalance` VALUES (145, '02-142', 'Hose- connector', 0, 0.0, 0.0, '2025-03-07 05:25:17', 18);
INSERT INTO `ims_beginningbalance` VALUES (146, '02-143', 'PVC Pipe 1" -Orange', 0, 0.0, 0.0, '2025-03-07 05:25:17', 18);
INSERT INTO `ims_beginningbalance` VALUES (147, '02-144', 'PVC  Elbow 1" -Orange', 0, 0.0, 0.0, '2025-03-07 05:25:17', 18);
INSERT INTO `ims_beginningbalance` VALUES (148, '02-145', 'PVC  Male Adaptor 1" -Orange', 0, 0.0, 0.0, '2025-03-07 05:25:17', 18);
INSERT INTO `ims_beginningbalance` VALUES (149, '02-146', 'LED Light 15W - OMNI', 0, 0.0, 0.0, '2025-03-07 05:25:17', 18);
INSERT INTO `ims_beginningbalance` VALUES (150, '02-147', 'Baby Roller 4"- JUPITER', 0, 0.0, 0.0, '2025-03-07 05:25:17', 18);
INSERT INTO `ims_beginningbalance` VALUES (151, '02-148', 'Screw Bit', 0, 0.0, 0.0, '2025-03-07 05:25:17', 18);
INSERT INTO `ims_beginningbalance` VALUES (152, '02-149', 'End cap 1/2 PVC', 0, 0.0, 0.0, '2025-03-07 05:25:17', 18);
INSERT INTO `ims_beginningbalance` VALUES (153, '02-150', 'Toilet Bowl', 0, 0.0, 0.0, '2025-03-07 05:25:17', 18);
INSERT INTO `ims_beginningbalance` VALUES (154, '02-151', 'Cylindrical Hinges 1"', 0, 0.0, 0.0, '2025-03-07 05:25:17', 18);
INSERT INTO `ims_beginningbalance` VALUES (155, '02-152', 'Cylindrical Hinges 1/2"', 0, 0.0, 0.0, '2025-03-07 05:25:17', 18);
INSERT INTO `ims_beginningbalance` VALUES (156, '02-153', 'Blind Rivet 3/16 x 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:17', 5);
INSERT INTO `ims_beginningbalance` VALUES (157, '02-154', 'Universal Padlock -ACE', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (158, '02-155', 'Sand Paper', 0, 0.0, 0.0, '2025-03-07 05:25:17', 7);
INSERT INTO `ims_beginningbalance` VALUES (159, '02-156', 'Squala', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (160, '02-157', 'Hose Bibb Faucet', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (161, '02-158', 'Flexi Bond', 0, 0.0, 0.0, '2025-03-07 05:25:17', 2);
INSERT INTO `ims_beginningbalance` VALUES (162, '02-159', 'Paint Thinner- PUREE', 0, 0.0, 0.0, '2025-03-07 05:25:17', 12);
INSERT INTO `ims_beginningbalance` VALUES (163, '02-160', 'Rubber Tape', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (164, '02-161', 'Paint brush #2- HIPO', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (165, '02-162', 'Drill bit 1/8 - DOORMER', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (166, '02-163', 'Pipe 3/4 x 20 GI schd.40', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (167, '02-164', 'Circuit Breaker - 30 A PLUG IN- GE', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (168, '02-165', 'AC - Outlet', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (169, '02-166', 'Black Screw', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (170, '02-167', 'Insulation Foam', 0, 0.0, 0.0, '2025-03-07 05:25:17', 14);
INSERT INTO `ims_beginningbalance` VALUES (171, '02-168', 'Metal Furring 0.6', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (172, '02-169', '3 Gang Switch - Royu', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (173, '02-170', 'Universal Outlet - Royu', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (174, '02-171', '2 Gang- Royu', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (175, '02-172', '3 Gang- Royu', 0, 0.0, 0.0, '2025-03-07 05:25:17', 21);
INSERT INTO `ims_beginningbalance` VALUES (176, '02-173', 'National Universal Outlet', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (177, '02-174', 'National Outlet Classic', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (178, '02-175', 'Phenolic Board 3/4', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (179, '02-176', 'Lag Screw 3/1 x 13', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (180, '02-177', 'Sanding Sealer Lacquer', 0, 0.0, 0.0, '2025-03-07 05:25:17', 2);
INSERT INTO `ims_beginningbalance` VALUES (181, '02-178', 'Paint Brush #1- HIPO', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (182, '02-179', 'Metal Screw', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (183, '02-180', 'Mini Roller - Refill', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (184, '02-181', 'Electrode Holder- 300amps', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (185, '02-182', 'Sand Paper - #120', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (186, '02-183', 'Steel Brush', 0, 0.0, 0.0, '2025-03-07 05:25:17', 19);
INSERT INTO `ims_beginningbalance` VALUES (187, '02-184', 'Concrete Nail #4', 0, 0.0, 0.0, '2025-03-07 05:25:17', 11);
INSERT INTO `ims_beginningbalance` VALUES (188, '02-185', 'QDE black- Paint', 0, 0.0, 0.0, '2025-03-07 05:25:18', 13);
INSERT INTO `ims_beginningbalance` VALUES (189, '02-186', 'Panel Box - 4 hole 2x2', 0, 0.0, 0.0, '2025-03-07 05:25:18', 18);
INSERT INTO `ims_beginningbalance` VALUES (190, '02-187', 'Circuit Breaker - 20 A PLUG IN- GE', 0, 0.0, 0.0, '2025-03-07 05:25:18', 18);
INSERT INTO `ims_beginningbalance` VALUES (191, '02-188', 'Drill Bit 5/32', 0, 0.0, 0.0, '2025-03-07 05:25:18', 18);
INSERT INTO `ims_beginningbalance` VALUES (192, '02-189', 'Concrete Nail - # 1', 0, 0.0, 0.0, '2025-03-07 05:25:18', 11);
INSERT INTO `ims_beginningbalance` VALUES (193, '02-190', 'Mesh Tape / Gasa', 0, 0.0, 0.0, '2025-03-07 05:25:18', 20);
INSERT INTO `ims_beginningbalance` VALUES (194, '02-191', 'Adhesive - Cement - ABC', 0, 0.0, 0.0, '2025-03-07 05:25:18', 3);
INSERT INTO `ims_beginningbalance` VALUES (195, '02-192', 'QDE - Maple', 0, 0.0, 0.0, '2025-03-07 05:25:18', 13);
INSERT INTO `ims_beginningbalance` VALUES (196, '02-193', 'Angle Valve - 1/2 ( 3 way )', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (197, '02-194', 'Bolt and Nut - 10mm x 2 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (198, '02-195', 'Drill Bit- 1/4 (concrete)', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (199, '02-196', 'Drill Bit- 3/16 (concrete)', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (200, '02-197', 'Screw w/ Tox - 3/16', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (201, '02-198', 'Flexible Hose - 1/2 x 1/2 x 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (202, '02-199', 'Spring Door', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (203, '02-200', 'Flexible Hose - 1/2 x 1/2 x 1/8', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (204, '02-201', 'Lavatory Bracket', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (205, '02-202', 'Lavatory Fittings', 0, 0.0, 0.0, '2025-03-07 05:25:18', 21);
INSERT INTO `ims_beginningbalance` VALUES (206, '02-203', 'Dyna Bolt 5/16', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (207, '02-204', 'Terminal Battery', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (208, '02-205', 'Moulding Strips-  3/4- ATLANTA', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (209, '02-206', 'Atlanta PVC type - 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (210, '02-207', 'Screw - #1', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (211, '02-208', 'Amco Box Outlet', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (212, '02-209', 'Plug In - 30 Amp', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (213, '02-210', 'Duct Tape', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (214, '02-211', 'Cutter Blade - hardware', 0, 0.0, 0.0, '2025-03-07 05:25:18', 21);
INSERT INTO `ims_beginningbalance` VALUES (215, '02-212', 'Paint Tray', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (216, '02-213', 'Half moon Wood', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (217, '02-214', 'Junction Box 4 x 2 - pvc - OMNI', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (218, '02-215', 'Pinlight Fixture Alum- AKARI', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (219, '02-216', 'LED Light- 9w -FIREFLY', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (220, '02-217', 'LED Ceiling Lamp Surface Type- 18w - OMNI', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (221, '02-218', '2 Gang Switch- PANASONIC', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (222, '02-219', '1 Gang 3 way Switch- PANASONIC', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (223, '02-220', '3 Gang Switch- PANASONIC', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (224, '02-221', 'Faucet Stainless - WATERGATE', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (225, '02-222', 'Faucet Brass - Gold -  WATERGATE', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (226, '02-223', 'Junction Box Cover - OMNI', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (227, '02-224', 'Hinges 35 x 35 x 2- GATEMAN', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (228, '02-225', 'Circuit breaker 60A bolt-On - GE', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (229, '02-226', 'Faucet hose bib white PVC - DOWEL', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (230, '02-227', 'Hose Clamp 5/8 -', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (231, '02-228', 'Angle Bar 5.0mm x 1 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (232, '02-229', 'TILE 60 X 60 AK 6882', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (233, '02-230', 'TILE 60 X 60 AK 6889', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (234, '02-231', 'ALUM. Door Brown', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (235, '02-232', 'MJ Water Closet', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (236, '02-233', 'Grout White', 0, 0.0, 0.0, '2025-03-07 05:25:18', 3);
INSERT INTO `ims_beginningbalance` VALUES (237, '02-234', 'TILE 60 x 60 FC 6013', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (238, '02-235', 'Rib type 05.mm x 3.66m', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (239, '02-236', 'Rib type 05.mm x 3.05m', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (240, '02-237', 'Rib type 05.mm x 6.10m', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (241, '02-238', 'Tek screw 12 x 55 steel', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (242, '02-239', 'Panel Door 80 x 200  jamb 2 x 5 kd w/ holes', 0, 0.0, 0.0, '2025-03-07 05:25:18', 21);
INSERT INTO `ims_beginningbalance` VALUES (243, '02-240', 'Ply Wood  ORDINARY 1/2- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:18', 19);
INSERT INTO `ims_beginningbalance` VALUES (244, '02-241', 'Cocolumber 2 x 2 x 10FT- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:19', 19);
INSERT INTO `ims_beginningbalance` VALUES (245, '02-242', 'G.I. Wire #16', 0, 0.0, 0.0, '2025-03-07 05:25:19', 11);
INSERT INTO `ims_beginningbalance` VALUES (246, '02-243', 'Flat latex White - BOYSEN 30f - 100m', 0, 0.0, 0.0, '2025-03-07 05:25:19', 17);
INSERT INTO `ims_beginningbalance` VALUES (247, '02-244', 'Flat latex White -MENNISOTA 30f - 100m', 0, 0.0, 0.0, '2025-03-07 05:25:19', 17);
INSERT INTO `ims_beginningbalance` VALUES (248, '02-245', 'Flat latex White - COAT SAVER (solo88)', 0, 0.0, 0.0, '2025-03-07 05:25:19', 17);
INSERT INTO `ims_beginningbalance` VALUES (249, '02-246', 'Latex Gloss White- COAT SAVER (solo99)', 0, 0.0, 0.0, '2025-03-07 05:25:19', 17);
INSERT INTO `ims_beginningbalance` VALUES (250, '02-247', 'Roofing Paint Blue- RAIN OR SHINE', 0, 0.0, 0.0, '2025-03-07 05:25:19', 17);
INSERT INTO `ims_beginningbalance` VALUES (251, '02-248', 'Acry Color Raw Sienna -DESTINY', 0, 0.0, 0.0, '2025-03-07 05:25:19', 8);
INSERT INTO `ims_beginningbalance` VALUES (252, '02-249', 'Ting Ting Color Thalo Blue #16- DESTINY', 0, 0.0, 0.0, '2025-03-07 05:25:19', 8);
INSERT INTO `ims_beginningbalance` VALUES (253, '02-250', 'Ting Ting Color Thalo Blue - BOYSEN (B2306)', 0, 0.0, 0.0, '2025-03-07 05:25:19', 8);
INSERT INTO `ims_beginningbalance` VALUES (254, '02-251', 'Pylox Spray Paint Sky Blue', 0, 0.0, 0.0, '2025-03-07 05:25:19', 8);
INSERT INTO `ims_beginningbalance` VALUES (255, '02-252', 'Pylox Spray Paint Silver', 0, 0.0, 0.0, '2025-03-07 05:25:19', 8);
INSERT INTO `ims_beginningbalance` VALUES (256, '02-253', 'Spray Paint Pearl White- SAMURAI', 0, 0.0, 0.0, '2025-03-07 05:25:19', 8);
INSERT INTO `ims_beginningbalance` VALUES (257, '02-254', 'Spray Paint Gloss Black- BOSNY', 0, 0.0, 0.0, '2025-03-07 05:25:19', 2);
INSERT INTO `ims_beginningbalance` VALUES (258, '02-255', 'Spray Paint Light Sky Blue- NIPPON', 0, 0.0, 0.0, '2025-03-07 05:25:19', 2);
INSERT INTO `ims_beginningbalance` VALUES (259, '02-256', 'Laquer Thinner- PUREE 3Ltr', 0, 0.0, 0.0, '2025-03-07 05:25:19', 2);
INSERT INTO `ims_beginningbalance` VALUES (260, '02-257', 'Paint Thinner- LESCO 3Ltr', 0, 0.0, 0.0, '2025-03-07 05:25:19', 2);
INSERT INTO `ims_beginningbalance` VALUES (261, '02-258', 'QDE - Yellow - SALAMAT BRO', 0, 0.0, 0.0, '2025-03-07 05:25:19', 2);
INSERT INTO `ims_beginningbalance` VALUES (262, '02-259', 'QDE - Yellow - TKO', 0, 0.0, 0.0, '2025-03-07 05:25:19', 2);
INSERT INTO `ims_beginningbalance` VALUES (263, '02-260', 'Prolux Glazing Putty White- DAVIES', 0, 0.0, 0.0, '2025-03-07 05:25:19', 2);
INSERT INTO `ims_beginningbalance` VALUES (264, '02-261', 'Butterfly Paint Brush - 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:19', 19);
INSERT INTO `ims_beginningbalance` VALUES (265, '02-262', 'Fan Club Paint Brush - 1"', 0, 0.0, 0.0, '2025-03-07 05:25:19', 19);
INSERT INTO `ims_beginningbalance` VALUES (266, '02-263', 'Fan Club Paint Brush - 2"', 0, 0.0, 0.0, '2025-03-07 05:25:19', 19);
INSERT INTO `ims_beginningbalance` VALUES (267, '02-264', 'Butterfly Paint Brush - 3"', 0, 0.0, 0.0, '2025-03-07 05:25:19', 19);
INSERT INTO `ims_beginningbalance` VALUES (268, '02-265', 'Butterfly Paint Brush - 4"', 0, 0.0, 0.0, '2025-03-07 05:25:19', 19);
INSERT INTO `ims_beginningbalance` VALUES (269, '02-266', 'Acrylon Paint Roller - 7"', 0, 0.0, 0.0, '2025-03-07 05:25:19', 19);
INSERT INTO `ims_beginningbalance` VALUES (270, '02-267', 'QDE- Black -DOMINO', 0, 0.0, 0.0, '2025-03-07 05:25:19', 2);
INSERT INTO `ims_beginningbalance` VALUES (271, '02-268', 'GreenField Floodlight LED 50w', 0, 0.0, 0.0, '2025-03-07 05:25:19', 19);
INSERT INTO `ims_beginningbalance` VALUES (272, '02-269', 'Flat White 16Ltrs. SINCLAIR', 0, 0.0, 0.0, '2025-03-07 05:25:19', 17);
INSERT INTO `ims_beginningbalance` VALUES (273, '02-270', 'Pylox Spray Paint Heat Black', 0, 0.0, 0.0, '2025-03-07 05:25:19', 8);
INSERT INTO `ims_beginningbalance` VALUES (274, '02-271', 'Build Rite Metal Primer Red Oxide -3ltr', 0, 0.0, 0.0, '2025-03-07 05:25:19', 2);
INSERT INTO `ims_beginningbalance` VALUES (275, '02-272', 'Epoxy Reducer- PUREE', 0, 0.0, 0.0, '2025-03-07 05:25:19', 2);
INSERT INTO `ims_beginningbalance` VALUES (276, '02-273', 'Laquer Flow- PUREE', 0, 0.0, 0.0, '2025-03-07 05:25:19', 2);
INSERT INTO `ims_beginningbalance` VALUES (277, '02-274', 'Permacoat Gloss White B710- BOYSEN', 0, 0.0, 0.0, '2025-03-07 05:25:19', 17);
INSERT INTO `ims_beginningbalance` VALUES (278, '02-275', 'Fast Dry Enamel White NS950- NATION', 0, 0.0, 0.0, '2025-03-07 05:25:19', 2);
INSERT INTO `ims_beginningbalance` VALUES (279, '02-276', 'Exhaust Fan- OMNI', 0, 0.0, 0.0, '2025-03-07 05:25:19', 19);
INSERT INTO `ims_beginningbalance` VALUES (280, '02-277', 'Yellow -RAIN OR SHINE', 0, 0.0, 0.0, '2025-03-07 05:25:19', 2);
INSERT INTO `ims_beginningbalance` VALUES (281, '02-278', 'Royal Blue- RAIN OR SHINE', 0, 0.0, 0.0, '2025-03-07 05:25:19', 2);
INSERT INTO `ims_beginningbalance` VALUES (282, '02-279', 'Door Closer- Lotus Tubular', 0, 0.0, 0.0, '2025-03-07 05:25:19', 19);
INSERT INTO `ims_beginningbalance` VALUES (283, '02-280', 'QDE- White -BOYSEN', 0, 0.0, 0.0, '2025-03-07 05:25:19', 2);
INSERT INTO `ims_beginningbalance` VALUES (284, '02-281', 'PANEL BOARD 6 HOLES PLUG IN- AMERICA', 0, 0.0, 0.0, '2025-03-07 05:25:19', 18);
INSERT INTO `ims_beginningbalance` VALUES (285, '02-282', 'Flat Gloss- BOYSEN', 0, 0.0, 0.0, '2025-03-07 05:25:19', 17);
INSERT INTO `ims_beginningbalance` VALUES (286, '02-283', 'QDE WHITE- BOYSEN (pail)', 0, 0.0, 0.0, '2025-03-07 05:25:19', 17);
INSERT INTO `ims_beginningbalance` VALUES (287, '02-284', 'Ting ting Color Thalo Blue- BOYSEN', 0, 0.0, 0.0, '2025-03-07 05:25:19', 12);
INSERT INTO `ims_beginningbalance` VALUES (288, '02-285', 'Guilder Epoxy primer Gray- BOYSEN', 0, 0.0, 0.0, '2025-03-07 05:25:19', 2);
INSERT INTO `ims_beginningbalance` VALUES (289, '02-286', 'Acry Color Raw Sienna -BOYSEN', 0, 0.0, 0.0, '2025-03-07 05:25:19', 8);
INSERT INTO `ims_beginningbalance` VALUES (290, '02-287', 'Acry Color Thalo Blue- BOYSEN', 0, 0.0, 0.0, '2025-03-07 05:25:19', 8);
INSERT INTO `ims_beginningbalance` VALUES (291, '02-288', 'Roller Brush w/h 2b -ACRYLON', 0, 0.0, 0.0, '2025-03-07 05:25:19', 19);
INSERT INTO `ims_beginningbalance` VALUES (292, '02-289', 'Baby Roller w/o- OMEGA', 0, 0.0, 0.0, '2025-03-07 05:25:19', 19);
INSERT INTO `ims_beginningbalance` VALUES (293, '02-290', 'Zimcoat Skimcoat', 0, 0.0, 0.0, '2025-03-07 05:25:19', 3);
INSERT INTO `ims_beginningbalance` VALUES (294, '02-291', 'DIB Cable Tie 100pcs 7 in BLACK', 0, 0.0, 0.0, '2025-03-07 05:25:19', 16);
INSERT INTO `ims_beginningbalance` VALUES (295, '02-292', 'Deform Bar - 16mm', 0, 0.0, 0.0, '2025-03-07 05:25:19', 19);
INSERT INTO `ims_beginningbalance` VALUES (296, '02-293', '1/4 Thick Plastic Acrylic 4 x 8', 0, 0.0, 0.0, '2025-03-07 05:25:19', 19);
INSERT INTO `ims_beginningbalance` VALUES (297, '02-294', 'Anzahl Anti Corrosion', 0, 0.0, 0.0, '2025-03-07 05:25:19', 12);
INSERT INTO `ims_beginningbalance` VALUES (298, '02-295', 'Anzahl Surfacer Primer', 0, 0.0, 0.0, '2025-03-07 05:25:20', 12);
INSERT INTO `ims_beginningbalance` VALUES (299, '02-296', 'Anzahl White w/ Catalest', 0, 0.0, 0.0, '2025-03-07 05:25:20', 2);
INSERT INTO `ims_beginningbalance` VALUES (300, '02-297', 'Urethane Thinner', 0, 0.0, 0.0, '2025-03-07 05:25:20', 2);
INSERT INTO `ims_beginningbalance` VALUES (301, '02-298', 'Body Filler W/ Hardener', 0, 0.0, 0.0, '2025-03-07 05:25:20', 2);
INSERT INTO `ims_beginningbalance` VALUES (302, '02-299', 'Sand Paper #100', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (303, '02-300', 'Sand Paper 120" 400" 1200', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (304, '02-301', 'Tiles 60 x 60 fc 6013', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (305, '02-302', 'Tiles 60 x 60 fc 6889', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (306, '02-303', 'Tiles 60 x 60 ak 6882', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (307, '02-304', 'Tiles 60 x 60 ak 6888', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (308, '02-305', 'MJ Water Closet bowl', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (309, '02-306', 'Cable Tie 6x300', 0, 0.0, 0.0, '2025-03-07 05:25:20', 16);
INSERT INTO `ims_beginningbalance` VALUES (310, '02-307', 'QDE WHITE- TKO', 0, 0.0, 0.0, '2025-03-07 05:25:20', 2);
INSERT INTO `ims_beginningbalance` VALUES (311, '02-308', 'Junction Box- SHUTA', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (312, '02-309', '1 Gang Switch- ROYU', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (313, '02-310', '2 Gang Outlet Universal- FOCUS', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (314, '02-311', 'PVC Pipe Orange 1/2- BIO', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (315, '02-312', 'THHN WIRE 12"- MAX', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (316, '02-313', 'Angle Valve 1/2" 2 way - HAWK', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (317, '02-314', 'Faucet 2 way -HAWK', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (318, '02-315', 'Supply Hose 1/2 x 1/2 - ITALY', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (319, '02-316', 'Floor Drain 4 x 4- CHICAGO', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (320, '02-317', 'Faucet s/s - HAWK', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (321, '02-318', 'Cyclone Wire', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (322, '02-319', 'Long Span Rib type 0.50m x 1220m Blue', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (323, '02-320', 'C- Purlins 2 x 3 1.0', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (324, '02-321', 'Deform Bar 12mm', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (325, '02-322', 'Steel Matting 4 x 8 #8', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (326, '02-323', 'Tubular 2 x 3 1.4', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (327, '03-001', 'Air Release Valve 1" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (328, '03-002', 'Air Release Valve 1" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (329, '03-003', 'Adaptor 2" CI', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (330, '03-004', 'Adaptor 3" CI', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (331, '03-005', 'Adaptor 4" CI', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (332, '03-006', 'Adaptor 6" CI', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (333, '03-007', 'Ball Valve 1"', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (334, '03-008', 'Ball Valve 1/2 Lockwing - WIN', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (335, '03-009', 'Ball Valve 1/2 Magnetic', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (336, '03-010', 'Ball Valve 2"', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (337, '03-011', 'Ball Valve 3/4" Lockwing', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (338, '03-012', 'Bell Reducer 3 x 2 B.I', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (339, '03-013', 'Bell Reducer 1 1/4 x 1" GI', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (340, '03-014', 'Bell Reducer 1" x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (341, '03-015', 'Bell Reducer 1/2 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (342, '03-016', 'Bell Reducer 2 x 1 GI', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (343, '03-017', 'Bell Reducer 3 x 2 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (344, '03-018', 'Bell Reducer 4 x 3 BI', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (345, '03-019', 'Bell Reducer 6 x 4 BI', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (346, '03-020', 'Bell Reducer 6 x 4 GI - Mechanical', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (347, '03-021', 'Bushing 3/4 x 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (348, '03-022', 'Bushing 1 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (349, '03-023', 'Bushing 2 x 1 GI', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (350, '03-024', 'Bushing 2 x 2 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:20', 19);
INSERT INTO `ims_beginningbalance` VALUES (351, '03-025', 'Bushing 4 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (352, '03-026', 'Butterfly Valve 4"', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (353, '03-027', 'Butterfly Valve 6"', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (354, '03-028', 'Checkvalve 1" - Brass', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (355, '03-029', 'Checkvalve 1/2" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (356, '03-030', 'Checkvalve 1 1/2" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (357, '03-031', 'Checkvalve 2" - Brass', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (358, '03-032', 'Checkvalve 3" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (359, '03-033', 'Checkvalve 4"', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (360, '03-034', 'Checkvalve 6"', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (361, '03-035', 'Checkvalve 6" CI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (362, '03-036', 'Coupling 1" GI (S40)', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (363, '03-037', 'Coupling 1" GI (S80)', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (364, '03-038', 'Coupling 1" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (365, '03-039', 'Coupling 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (366, '03-040', 'Coupling 1/2 PVC', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (367, '03-041', 'Coupling 1/2 PVC w/ Thread', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (368, '03-042', 'Coupling 1/2 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (369, '03-043', 'Coupling 2" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (370, '03-044', 'Coupling 2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (371, '03-045', 'Coupling 3" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (372, '03-046', 'Coupling 3" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (373, '03-047', 'Coupling 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (374, '03-048', 'Coupling 3/4 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (375, '03-049', 'Coupling 4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (376, '03-050', 'Coupling 4" HDPE- FISH', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (377, '03-051', 'Coupling 4X3 GI (SCHED 80)', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (378, '03-052', 'Coupling 6" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (379, '03-053', 'Coupling 6" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (380, '03-054', 'Coupling 3/4"  PVC', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (381, '03-055', 'Coupling Reducer 3 x 2 - Mechanical', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (382, '03-056', 'Coupling Reducer 3 x 2 NLC - FISH', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (383, '03-057', 'Coupling Reducer 4 x 2 - Mechanical', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (384, '03-058', 'Cross Tee 1" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (385, '03-059', 'Cross Tee 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (386, '03-060', 'Cross Tee 2" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (387, '03-061', 'Cross Tee 3 x 2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (388, '03-062', 'Cross Tee 3" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (389, '03-063', 'Cross Tee 4 x 2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (390, '03-064', 'Cross Tee 4 x 3 GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (391, '03-065', 'Cross Tee 4" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (392, '03-066', 'Cross Tee 6 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (393, '03-067', 'Elbow 45deg - Flange Type 6" CI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (394, '03-068', 'Elbow 90 deg - 4" BI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (395, '03-069', 'Elbow 90deg - Flange Type 6" CI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (396, '03-070', 'Elbow 1" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (397, '03-071', 'Elbow 1" GI 45 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (398, '03-072', 'Elbow 1" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (399, '03-073', 'Elbow 1" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (400, '03-074', 'Elbow 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (401, '03-075', 'Elbow 1/2 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (402, '03-076', 'Elbow 1/2 (plain)  PVC', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (403, '03-077', 'Elbow 2" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', 19);
INSERT INTO `ims_beginningbalance` VALUES (404, '03-078', 'Elbow 2" HDPE- FISH', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (405, '03-079', 'Elbow 3" BI 45 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (406, '03-080', 'Elbow 3" GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (407, '03-081', 'Elbow 3" GI 45 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:22', 1);
INSERT INTO `ims_beginningbalance` VALUES (408, '03-082', 'Elbow 3" HDPE- FISH', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (409, '03-083', 'Elbow 3/4 GI- JB', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (410, '03-084', 'Elbow 3/4 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (411, '03-085', 'Elbow 4" 45deg (80) BI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (412, '03-086', 'Elbow 4" 45deg GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (413, '03-087', 'Elbow 4" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (414, '03-088', 'Elbow 6" BI  45 DEG', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (415, '03-089', 'Elbow 6" BI  90 DEG', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (416, '03-090', 'Elbow Reducer 1" x 1 1/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (417, '03-091', 'Elbow Reducer 1" x 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (418, '03-092', 'Elbow Reducer 1" x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (419, '03-093', 'Elbow Reducer 3/4 x 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (420, '03-094', 'Elbow Straight 1/2"', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (421, '03-095', 'Elbow Straight 1"', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (422, '03-096', 'Elbow Straight 3/4"', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (423, '03-097', 'Elbow Threaded 1/2 PVC', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (424, '03-098', 'End Cap 1" GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (425, '03-099', 'End Cap 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (426, '03-100', 'End Cap 2"  GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (427, '03-101', 'End Cap 2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (428, '03-102', 'End Cap 3" GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (429, '03-103', 'End Cap 3" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (430, '03-104', 'End Cap 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (431, '03-105', 'End Cap 4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (432, '03-106', 'End Cap 6"', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (433, '03-107', 'End Cap 8"', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (434, '03-108', 'End Plug 1" GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (435, '03-109', 'End Plug 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (436, '03-110', 'End Plug 2" GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (437, '03-111', 'End Plug 3 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (438, '03-112', 'End Plug 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (439, '03-113', 'End Plug 4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (440, '03-114', 'Sleeve-Type Coupling 8"', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (441, '03-115', 'Fabricated Elbow 3"', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (442, '03-116', 'Fabricated Elbow 4"', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (443, '03-117', 'Fabricated Elbow 6', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (444, '03-118', 'Fabricated Reducer 3 x 2', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (445, '03-119', 'Fabricated Tee 3 x 2', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (446, '03-120', 'Fabricated Tee 3', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (447, '03-121', 'Fabricated Tee 4 x 2', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (448, '03-122', 'Fabricated Tee 4 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (449, '03-123', 'Fabricated Tee 4', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (450, '03-124', 'Fabricated Tee 6 x 2', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (451, '03-125', 'Fabricated Tee 6 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (452, '03-126', 'Fabricated Tee 6 x 4', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (453, '03-127', 'Fabricated Tee 6', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (454, '03-128', 'Fabricated Tee 8 x 2', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (455, '03-129', 'Fabricated Tee 8 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (456, '03-130', 'Fabricated Tee 8', 0, 0.0, 0.0, '2025-03-07 05:25:22', 19);
INSERT INTO `ims_beginningbalance` VALUES (457, '03-131', 'Female Adaptor 1/2" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (458, '03-132', 'Female Elbow 1" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (459, '03-133', 'Female Elbow 1/2 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (460, '03-134', 'Female Elbow 2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (461, '03-135', 'Female Elbow 3 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (462, '03-136', 'Female Elbow 3/4 HDPE - NLC- PBP', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (463, '03-137', 'Flange 2"', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (464, '03-138', 'Flange 3" ( 8 hole )', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (465, '03-139', 'Flange 6"', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (466, '03-140', 'Flange 8"', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (467, '03-141', 'Gasket 1/2"', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (468, '03-142', 'Gasket 3" - LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (469, '03-143', 'Gasket 3/4 "', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (470, '03-144', 'Gasket 8"', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (471, '03-145', 'Gate Valve 1" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (472, '03-146', 'Gate Valve 1/2" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (473, '03-147', 'Gate Valve 2" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (474, '03-148', 'Gate Valve 2" Flange', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (475, '03-149', 'Gate Valve 2" Mechanical', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (476, '03-150', 'Gate Valve 3" Mechanical', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (477, '03-151', 'Gate Valve 3" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (478, '03-152', 'Gate Valve 3" Flange- DI (BOHAI)', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (479, '03-153', 'Gate Valve 3/4" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (480, '03-154', 'Gate Valve 4" Flange', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (481, '03-155', 'Gate Valve 4" Mechanical', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (482, '03-156', 'Gate Valve 6" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (483, '03-157', 'Gate Valve 6" Flange', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (484, '03-158', 'Gate Valve 6" Mechanical', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (485, '03-159', 'Gate Valve 8" Mechanical', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (486, '03-160', 'GiBault 2"', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (487, '03-161', 'GiBault 3"', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (488, '03-162', 'GiBault 4"', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (489, '03-163', 'GiBault 6"', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (490, '03-164', 'GiBault 8"', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (491, '03-165', 'Gate Valve 2" Flange Type CI', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (492, '03-166', 'Gate Valve 3" Flange Type CI', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (493, '03-167', 'Gate Valve 4" Flange Type CI', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (494, '03-168', 'Mechanical Flange 3" - LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (495, '03-169', 'Mechanical Flange 4"- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (496, '03-170', 'Male Adaptor 1" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (497, '03-171', 'Male Adaptor 1" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (498, '03-172', 'Male Adaptor 1/2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:23', 1);
INSERT INTO `ims_beginningbalance` VALUES (499, '03-173', 'Male Adaptor 1/2" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:23', 1);
INSERT INTO `ims_beginningbalance` VALUES (500, '03-174', 'Male Adaptor 2" HDPE- FISH', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (501, '03-175', 'Male Adaptor 2" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (502, '03-176', 'Male Adaptor 3"', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (503, '03-177', 'Male Adaptor 3/4 HDPE - FISH', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (504, '03-178', 'Male Adaptor 3/4" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (505, '03-179', 'Mechanical Elbow 2" 90 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (506, '03-180', 'Mechanical Elbow 3" 45 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (507, '03-181', 'Mechanical Elbow 3" 90 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (508, '03-182', 'Mechanical Elbow 4" 90 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:23', 19);
INSERT INTO `ims_beginningbalance` VALUES (509, '03-183', 'Mechanical Elbow 6" 45 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (510, '03-184', 'Mechanical Elbow 6" 90 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (511, '03-185', 'Mechanical End Cap 2"', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (512, '03-186', 'Mechanical End Cap 4"', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (513, '03-187', 'Mechanical Tee 2"', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (514, '03-188', 'Mechanical Tee 3 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (515, '03-189', 'Mechanical Tee 4 x 2 CI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (516, '03-190', 'Mechanical Tee 4 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (517, '03-191', 'Mechanical Tee 4 x 4', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (518, '03-192', 'Mechanical Tee 6 x 2', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (519, '03-193', 'Mechanical Tee 6 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (520, '03-194', 'Mechanical Tee 6 x 4', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (521, '03-195', 'Mechanical Tee 6"', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (522, '03-196', 'Nipple 1 x 12 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (523, '03-197', 'Nipple 1 x 5 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (524, '03-198', 'Nipple 1 x 8 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (525, '03-199', 'Nipple 1" x 2" GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (526, '03-200', 'Nipple 1" x 6" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (527, '03-201', 'Nipple 1" x 8" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (528, '03-202', 'Nipple 1/2 x 1 GI - FS', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (529, '03-203', 'Nipple 1/2 x 12 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (530, '03-204', 'Nipple 1/2 x 16 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (531, '03-205', 'Nipple 1/2 x 2 GI - JB', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (532, '03-206', 'Nipple 1/2 x 2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (533, '03-207', 'Nipple 1/2 x 3 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (534, '03-208', 'Nipple 1/2 x 4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (535, '03-209', 'Nipple 1/2 x 6 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (536, '03-210', 'Nipple 1/2 x 8 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (537, '03-211', 'Nipple 2 1/2 x 5 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (538, '03-212', 'Nipple 2 x 5 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (539, '03-213', 'Nipple 3 x 5 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (540, '03-214', 'Nipple 3/4 x 10 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (541, '03-215', 'Nipple 3/4 x 4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (542, '03-216', 'Nipple 3/4 x 5 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (543, '03-217', 'Nipple 3/4 x 6 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (544, '03-218', 'Nipple 3/4 x 6 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (545, '03-219', 'Nipple 3/4 x 8 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (546, '03-220', 'Nipple 3/4 x 8 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (547, '03-221', 'Nipple 4 x 12 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (548, '03-222', 'Nipple 5 x 10 BI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (549, '03-223', 'Repair Clamp 2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (550, '03-224', 'Repair Clamp 3" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (551, '03-225', 'Repair Clamp 4" HDPE - MIE', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (552, '03-226', 'Repair Clamp 6" HDPE - MIE', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (553, '03-227', 'Repair Clamp 8" HDPE - MIE', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (554, '03-228', 'Saddle Clamp 2 x 1 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (555, '03-229', 'Saddle Clamp 2 x 1 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (556, '03-230', 'Saddle Clamp 2 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (557, '03-231', 'Saddle Clamp 3 x 1 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (558, '03-232', 'Saddle Clamp 3 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (559, '03-233', 'Saddle Clamp 4 x 1 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (560, '03-234', 'Saddle Clamp 4 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (561, '03-235', 'Saddle Clamp 4x2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', 19);
INSERT INTO `ims_beginningbalance` VALUES (562, '03-236', 'Saddle Clamp 6 x 1 GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (563, '03-237', 'Saddle Clamp 6 x 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (564, '03-238', 'Saddle Clamp 6 x 2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (565, '03-239', 'Saddle Clamp 6 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (566, '03-240', 'Saddle Clamp 6" x 1" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (567, '03-241', 'Saddle Clamp 8" x 1" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (568, '03-242', 'Saddle Clamp 8" x 1" GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (569, '03-243', 'Saddle Clamp 8" x 2" - HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (570, '03-244', 'Saddle Clamp 8" x 2" GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (571, '03-245', 'Side Bolts 3/4 x 8', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (572, '03-246', 'Sleeve-Type Coupling 2"', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (573, '03-247', 'Sleeve-Type Coupling 3" DI pvc to pvc- PVMC', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (574, '03-248', 'Sleeve-Type Coupling 4 x 2', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (575, '03-249', 'Sleeve-Type Coupling 4" DI pvc to pvc- PVMC', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (576, '03-250', 'STC (GI-PVC) 6" (GI to GI)', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (577, '03-251', 'Sleeve-Type Coupling 6" DI (PVC to PVC)- PVMC', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (578, '03-252', 'Stub End 2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (579, '03-253', 'Stub End 3" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (580, '03-254', 'Stub End 4" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (581, '03-255', 'Stub End 6" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (582, '03-256', 'Stub End 8" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (583, '03-257', 'Tee 1" GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (584, '03-258', 'Tee 1" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (585, '03-259', 'Tee 1/2" GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', 1);
INSERT INTO `ims_beginningbalance` VALUES (586, '03-260', 'Tee 1/2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', 1);
INSERT INTO `ims_beginningbalance` VALUES (587, '03-261', 'Tee 1/2" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:25', 1);
INSERT INTO `ims_beginningbalance` VALUES (588, '03-262', 'Tee 2" Flange', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (589, '03-263', 'Tee 2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (590, '03-264', 'Tee 3" Flange', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (591, '03-265', 'Tee 3" GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (592, '03-266', 'Tee 3" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (593, '03-267', 'Tee 3/4" GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', 1);
INSERT INTO `ims_beginningbalance` VALUES (594, '03-268', 'Tee 3/4"HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', 1);
INSERT INTO `ims_beginningbalance` VALUES (595, '03-269', 'Tee 4" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (596, '03-270', 'Tee Reducer 1 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (597, '03-271', 'Tee Reducer 1" x 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (598, '03-272', 'Tee Reducer 1/2 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (599, '03-273', 'Tee Reducer 3 x 2 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (600, '03-274', 'Tee Reducer 4 x 2 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (601, '03-275', 'Tee Reducer 4 x 3 HDPE- FISH', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (602, '03-276', 'Tee 6" Flange', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (603, '03-277', 'Tee 6 x 4  Mechanical CI', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (604, '03-278', 'Valve Cover - 4" GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (605, '03-279', 'Valve Cover - 6" G.I.', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (606, '03-280', 'Y-connector with ferrul 3/4"', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (607, '03-281', 'Y-Strainer 2"', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (608, '03-282', 'Y-Strainer 3"', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (609, '03-283', 'Y-Strainer 4"', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (610, '03-284', 'Y-Strainer 6" Flange', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (611, '03-285', 'Elbow 6 x 45 deg (sched 80) GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (612, '03-286', 'Elbow 6 x 90 deg (sched 80) GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', 19);
INSERT INTO `ims_beginningbalance` VALUES (613, '03-287', 'STC (GI-HDPE) 6" - BLACK', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (614, '03-288', 'STC (GI-PVC) 2"', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (615, '03-289', 'STC (GI-PVC) 4"', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (616, '03-290', 'Checkvalve 3" GI', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (617, '03-291', 'Cross Tee Fabricated HDPE 4"', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (618, '03-292', 'Cross Tee HDPE 3"', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (619, '03-293', 'Cross Tee HDPE 4x3', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (620, '03-294', 'Cross Tee HDPE 6x3', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (621, '03-295', 'Cross Tee HDPE 6x4', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (622, '03-296', 'Nipple 1"x24" GI (sched 80)', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (623, '03-297', 'Coupling Reducer 1" x 3/4" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (624, '03-298', 'Tee w/ Thread 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (625, '03-299', 'Elbow 4 x 90 sched80', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (626, '03-300', 'STC 4" ( GI to HDPE) DI - BLUE', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (627, '03-301', 'Cross Tee HDPE 3 x 2 - fabricated', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (628, '03-302', 'STC 3" (GI to HDPE)', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (629, '03-303', 'Elbow 3" GI 90deg (sched 80)', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (630, '03-304', 'STC 8"', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (631, '03-305', 'Elbow 3" 45 deg. (schd.80)', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (632, '03-306', 'Gate Valve Flange type 8" w/ bang', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (633, '03-307', 'Nipple 1/2 x 5', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (634, '03-308', 'Elbow 8 x 90 deg. - HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (635, '03-309', 'Coupling Reducer 8 x 6 - HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (636, '03-310', 'Fabricated Coupling 6 x 8', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (637, '03-311', 'Check Valve 3/4- Brass', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (638, '03-312', 'Valve Cover 6" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (639, '03-313', 'Fabricated Elbow 4 x 90 deg. HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (640, '03-314', 'Fabricated Elbow 6 x 90 deg. HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (641, '03-315', 'Fabricated Elbow 8 x 45 deg. HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (642, '03-316', 'Coupling Reducer 8 x 4 - HDPE ( Fabricated)', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (643, '03-317', 'Coupling Reducer 8 x 6 - HDPE ( Fabricated)', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (644, '03-318', 'Gasket- 6"', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (645, '03-319', 'DI Gate Valve Flange Type 8"', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (646, '03-320', 'Bolt and nut 5/8 x 8- Full Thread', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (647, '03-321', 'Full thread 3/4 x 10 ft.', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (648, '03-322', 'Bell Reducer 5 x 4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (649, '03-323', 'Tee 4" Flange type CI', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (650, '03-324', 'Nut GI - 5/8"- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (651, '03-325', 'Bell Reducer GI 1/2 x 3/4 - JB', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (652, '03-326', 'End Cap 3/4 GI - MECH', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (653, '03-327', 'End Plug 3/4 GI - JB', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (654, '03-328', 'End Plug 1"GI - JB', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (655, '03-329', 'Nipple 3/4 x 5 GI - JB', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (656, '03-330', 'Nipple 3/4 x 8 GI - FS', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (657, '03-331', 'Nipple 1 x 5 GI - AKUA', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (658, '03-332', 'Nipple 1 x 8 GI - AKUA', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (659, '03-333', 'Saddle Clamp 3 x 3/4 DI - PV', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (660, '03-334', 'Saddle Clamp 6 x 1 DI - PV', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (661, '03-335', 'Sleeve-Type Coupling 3" DI pvc to pvc- BOHAI', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (662, '03-336', 'Sleeve-Type Coupling 4" DI pvc to pvc- BOHAI', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (663, '03-337', 'Sleeve-Type Coupling 6" DI (PVC to PVC)- BOHAI', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (664, '03-338', 'Male Adaptor 3/4 nlc- PBP', 0, 0.0, 0.0, '2025-03-07 05:25:26', 19);
INSERT INTO `ims_beginningbalance` VALUES (665, '03-339', 'Male Adaptor 1 nlc- PBP', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (666, '03-340', 'PVC Pipe 1/2 w/ hub- NELTEX', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (667, '03-341', 'Male Adaptor 1/2 PVC- TIAN BLUE', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (668, '03-342', 'Coupling 1/2 PVC- TIAN BLUE', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (669, '03-343', 'Elbow Plain 1/2 PVC- TIAN BLUE', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (670, '03-344', 'Repair Clamp 2" HDPE -MIE', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (671, '03-345', 'Repair Clamp 3" HDPE -MIE', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (672, '03-346', 'Tee Reducer 1 x 3/4 GI - JB', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (673, '03-347', 'Tee 3/4 GI - JB', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (674, '03-348', 'Nipple 1/2 x 1 GI - MICRO', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (675, '03-349', 'Nipple 1/2 x 2 GI - MICRO', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (676, '03-350', 'Coupling 1" HDPE - FISH', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (677, '03-351', 'Female Elbow 1/2 HDPE- PBP', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (678, '03-352', 'DI Sleeve type coupling pvc-pvc 4"- HIWA', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (679, '03-353', 'DI Sleeve type coupling pvc-pvc 6"-HIWA', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (680, '03-354', 'CI Sleeve Type coupling pvc- GI 6"- CMI', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (681, '03-355', 'Flow meter 4" Paddle Wheel Type- ZENNER', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (682, '03-356', 'Flow meter 6" Paddle Wheel Type- ZENNER', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (683, '03-357', 'GASKET 4- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (684, '03-358', 'STC 4" ( GI to GI)- CMI', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (685, '03-359', 'Check Valve 1/2 Brass- ACE', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (686, '03-360', 'Ball Valve 1/2 Lockwing -ACE', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (687, '03-361', 'Nipple 1/2 x 12 GI - JB', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (688, '03-362', 'Male Adaptor 1/2 HDPE- PBP', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (689, '04-001', 'Pipe 1" HDPE- MIG', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (690, '04-002', 'Pipe 1" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:27', 14);
INSERT INTO `ims_beginningbalance` VALUES (691, '04-003', 'Pipe 1/2 HDPE - MIG', 0, 0.0, 0.0, '2025-03-07 05:25:27', 14);
INSERT INTO `ims_beginningbalance` VALUES (692, '04-004', 'Pipe 1/2 PVC', 0, 0.0, 0.0, '2025-03-07 05:25:27', 14);
INSERT INTO `ims_beginningbalance` VALUES (693, '04-005', 'Pipe 2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:27', 14);
INSERT INTO `ims_beginningbalance` VALUES (694, '04-006', 'Pipe 3" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:27', 14);
INSERT INTO `ims_beginningbalance` VALUES (695, '04-007', 'Pipe 3" RISER PIPE', 0, 0.0, 0.0, '2025-03-07 05:25:27', 14);
INSERT INTO `ims_beginningbalance` VALUES (696, '04-008', 'Pipe 3/4 HDPE - MIG', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (697, '04-009', 'Pipe 4" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:27', 14);
INSERT INTO `ims_beginningbalance` VALUES (698, '04-010', 'Pipe 4" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:27', 14);
INSERT INTO `ims_beginningbalance` VALUES (699, '04-011', 'Pipe 4" RISER HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (700, '04-012', 'Pipe 4" GI', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (701, '04-013', 'Pipe 6" GI (sched 80)', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (702, '04-014', 'Pipe 6" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (703, '04-015', 'Pipe 8" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (704, '04-016', 'Pipe 10" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (705, '04-017', 'Pipe RISER 4" GI', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (706, '04-018', 'Pipe 3" GI (sched 80)', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (707, '04-019', 'Pipe 8" - HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (708, '04-020', 'Pipe 1 1/2 GI LSII', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (709, '04-021', 'Pipe 1 1 /2 GI s20', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (710, '05-001', 'Flow Meter 2"', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (711, '05-002', 'Flow Meter 3"- ZENNER', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (712, '05-003', 'Flow Meter 4"', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (713, '05-004', 'Flow Meter 6"', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (714, '05-005', 'Water Meter - Brass 1/2" - HYJET', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (715, '05-006', 'Water Meter - Plastic 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:27', 19);
INSERT INTO `ims_beginningbalance` VALUES (716, '05-007', 'Water Meter 3/4 - Brass - ACE', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (717, '05-008', 'Water Meter - Brass 1" - ACE', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (718, '05-009', 'Water Meter - Brass 2"', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (719, '06-001', 'Chemical Solution Tank 100L', 0, 0.0, 0.0, '2025-03-07 05:25:28', 9);
INSERT INTO `ims_beginningbalance` VALUES (720, '06-002', 'Caution Tape', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (721, '06-003', 'Fire Hydrant Head 2 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (722, '06-004', 'Fire Hydrant Head 3 X 2 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (723, '06-005', 'Pressure Gauge 0-60 PSI', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (724, '06-006', 'Pressure Reducer Valve 3"', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (725, '06-007', 'Pressure Reducer Valve 4"', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (726, '06-008', 'Pressure Reducer Valve 6"', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (727, '06-009', 'PVC Pipe Cement- ATLANTA', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (728, '06-010', 'Padlock', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (729, '06-011', 'Hacksaw Blade 12" Sandflex', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (730, '06-012', 'Teflon Tape - ROYAL', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (731, '06-013', 'Pressure Gauge 100 PSI', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (732, '06-014', 'Concrete Cutter Blade 14"', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (733, '06-015', 'Chemical Solution Tank 200L', 0, 0.0, 0.0, '2025-03-07 05:25:28', 9);
INSERT INTO `ims_beginningbalance` VALUES (734, '06-016', 'Pressure Gauge 300 PSI', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (735, '06-017', 'GI Bolts & Nuts 5/8 5" (Fullthread)- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (736, '06-018', 'Rubber O-ring 4" PVC sure lock riser pipe', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (737, '06-019', 'Bolt & Nut  w/ washer', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (738, '06-020', 'Bolt & Nut m-6 x 20 w/ washer', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (739, '06-021', 'Lock Washer', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (740, '06-022', 'PE Hose 4 x 6 - white', 0, 0.0, 0.0, '2025-03-07 05:25:28', 20);
INSERT INTO `ims_beginningbalance` VALUES (741, '06-023', 'Bolt and Nut 3/4 x 4 -full thread', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (742, '06-024', 'Cutting Disc 4"- BLUE SHARK', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (743, '06-025', 'Cut Off 14"', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (744, '06-026', 'Saddle Clamp w/ Ferrule - 8 x 1 - HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:28', 19);
INSERT INTO `ims_beginningbalance` VALUES (745, '06-027', 'New Other Materials', 0, 0.0, 0.0, '2025-03-07 05:25:28', 1);

CREATE TABLE `ims_classification` (
  `classificationID` int NOT NULL AUTO_INCREMENT,
  `classification` varchar(500) NOT NULL,
  PRIMARY KEY (`classificationID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `ims_classification` VALUES (1, 'Chemicals');
INSERT INTO `ims_classification` VALUES (2, 'Construction');
INSERT INTO `ims_classification` VALUES (3, 'Fittings');
INSERT INTO `ims_classification` VALUES (4, 'Pipes');
INSERT INTO `ims_classification` VALUES (5, 'Water Meters');
INSERT INTO `ims_classification` VALUES (6, 'Other Materials');

CREATE TABLE `ims_item` (
  `itemID` varchar(20) NOT NULL,
  `itemName` varchar(500) NOT NULL,
  `itemQuantity` int NOT NULL,
  `unitCost` double NOT NULL,
  `totalCost` double NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `classificationID_id` int NOT NULL,
  `measurementID_id` int NOT NULL,
  PRIMARY KEY (`itemID`),
  KEY `ims_item_classificationID_id_ee4994c7_fk_ims_class` (`classificationID_id`),
  KEY `ims_item_measurementID_id_d7e55812_fk_ims_measu` (`measurementID_id`),
  CONSTRAINT `ims_item_classificationID_id_ee4994c7_fk_ims_class` FOREIGN KEY (`classificationID_id`) REFERENCES `ims_classification` (`classificationID`),
  CONSTRAINT `ims_item_measurementID_id_d7e55812_fk_ims_measu` FOREIGN KEY (`measurementID_id`) REFERENCES `ims_measurement` (`measurementID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `ims_item` VALUES ('01-001', 'Chlorine Dioxide - Liquid', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 1, 22);
INSERT INTO `ims_item` VALUES ('01-002', 'Chlorine Dioxide - Powder', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 1, 9);
INSERT INTO `ims_item` VALUES ('01-003', 'Chlorine Granules', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 1, 9);
INSERT INTO `ims_item` VALUES ('02-001', 'Asphalt', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 10);
INSERT INTO `ims_item` VALUES ('02-002', 'Cement- RIZAL', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 4);
INSERT INTO `ims_item` VALUES ('02-003', 'Gravel', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 19);
INSERT INTO `ims_item` VALUES ('02-004', 'White Sand', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 19);
INSERT INTO `ims_item` VALUES ('02-005', 'Concrete Hollow Blocks', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 1);
INSERT INTO `ims_item` VALUES ('02-006', 'Flexible Hose- Flexible Oppo', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 15);
INSERT INTO `ims_item` VALUES ('02-007', 'C-Clamp PVC', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 19);
INSERT INTO `ims_item` VALUES ('02-008', 'THHN 14" - BOSTON', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 19);
INSERT INTO `ims_item` VALUES ('02-009', 'FI Hose 1/2 x 1/2 x 24', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 19);
INSERT INTO `ims_item` VALUES ('02-010', 'Flexible Hose 1/2 X 50 - OMEGA', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 20);
INSERT INTO `ims_item` VALUES ('02-011', 'Flexible Hose 3/8', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 19);
INSERT INTO `ims_item` VALUES ('02-012', 'Skim Coat- ABC', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 19);
INSERT INTO `ims_item` VALUES ('02-013', 'Angle Valve 1/2 x 3/8', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 19);
INSERT INTO `ims_item` VALUES ('02-014', 'Angle Valve 1/2 x 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 19);
INSERT INTO `ims_item` VALUES ('02-015', 'Angle Valve 1/2 x 3/4', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 19);
INSERT INTO `ims_item` VALUES ('02-016', 'C Purlins 2x3 GI 1.4', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 19);
INSERT INTO `ims_item` VALUES ('02-017', 'Angel Bar 4.5mm x 2', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 19);
INSERT INTO `ims_item` VALUES ('02-018', 'Goose Neck Faucet- SUNRISE', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 19);
INSERT INTO `ims_item` VALUES ('02-019', 'Lavatory Valve', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 19);
INSERT INTO `ims_item` VALUES ('02-020', 'Faucet Brass hose Bibb- HAWK', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 19);
INSERT INTO `ims_item` VALUES ('02-021', 'Two-Way Faucet Valve', 0, 0.0, 0.0, '2025-03-07 05:25:14', '2025-03-07 05:25:14', 2, 19);
INSERT INTO `ims_item` VALUES ('02-022', 'Lavatory Faucet', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-023', 'Diamond Cutting Disc', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-024', 'Cable Tie 6 x 2mm - POWER HOUSE', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 16);
INSERT INTO `ims_item` VALUES ('02-025', 'Padlock - Hardware', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-026', 'Hardiflex 3/16 - JAMES HARDI', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-027', 'Two Gang Outlet - ROYU', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-028', 'Hook', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-029', 'Aluminum Silver (PAINT)', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-030', 'Welding Rod 6013 Special- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 11);
INSERT INTO `ims_item` VALUES ('02-031', 'Tie Wire', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 11);
INSERT INTO `ims_item` VALUES ('02-032', 'Bosny Black- Pylox', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 8);
INSERT INTO `ims_item` VALUES ('02-033', 'Electrical Tape- BIG Armak', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-034', 'Masking Tape 3/4', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-035', 'Regular Plug', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-036', 'Three Gang Outlet', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-037', 'Marine Ply Wood - 3/4', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-038', 'Barateha', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-039', 'Piano Hinges', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-040', 'Concrete Nail 1 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 11);
INSERT INTO `ims_item` VALUES ('02-041', 'Stikwel - Wood Glue', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 12);
INSERT INTO `ims_item` VALUES ('02-042', 'Cabinet Handle', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-043', 'Thalo blue - Acrylic', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 12);
INSERT INTO `ims_item` VALUES ('02-044', 'THHN 12" - BOSTON', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 5);
INSERT INTO `ims_item` VALUES ('02-045', 'THNN 14 - BOSTON', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 5);
INSERT INTO `ims_item` VALUES ('02-046', 'BLIND RIVITS 1/8 X 3/4', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 5);
INSERT INTO `ims_item` VALUES ('02-047', 'Cement spoon', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-048', 'Tubular 1 x 1 1.4', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-049', 'Cylindrical Hinges 3/4', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-050', 'Door Knob', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-051', 'Deform Bar - 10mm', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-052', 'PVC Door 60 x 210 w/ Hinges', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-053', 'Blue Clamp 1/2 - Hardware', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-054', 'Solignum- All aroud', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 12);
INSERT INTO `ims_item` VALUES ('02-055', 'Liha - 1000 & 100', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-056', 'Tansi', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 20);
INSERT INTO `ims_item` VALUES ('02-057', 'Drill bit 5/16', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-058', 'Chalk stone', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-059', 'Epoxy primer', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 12);
INSERT INTO `ims_item` VALUES ('02-060', 'Latex Gloss - Paint', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 12);
INSERT INTO `ims_item` VALUES ('02-061', 'Sahara- ( water proofing )', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-062', 'Singer Oil', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-063', 'Varnish', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 12);
INSERT INTO `ims_item` VALUES ('02-064', 'Rust Converter', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-065', 'WD - 40', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-066', 'Tape Measure', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-067', 'C. Clamp 3/4', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-068', 'C. Clamp 1"', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-069', 'Single Switch', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-070', 'Receptacle 4 x 4 - omni', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-071', 'Junction Box 4 x 4 - pvc', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-072', 'Utility Box 2 x 4 - pvc  - ROYU', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 19);
INSERT INTO `ims_item` VALUES ('02-073', '1 Gang Switch- Panasonic', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 21);
INSERT INTO `ims_item` VALUES ('02-074', '2 Gang Switch- Royu', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 21);
INSERT INTO `ims_item` VALUES ('02-075', 'Flat Hose 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:15', '2025-03-07 05:25:15', 2, 20);
INSERT INTO `ims_item` VALUES ('02-076', '2 Gang Outlet- Panasonic', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 21);
INSERT INTO `ims_item` VALUES ('02-077', 'Blind Rivits 5/32 x 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 5);
INSERT INTO `ims_item` VALUES ('02-078', 'Bathroom Bidet-  SUNRISE', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 21);
INSERT INTO `ims_item` VALUES ('02-079', 'Concrete nail #2', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 11);
INSERT INTO `ims_item` VALUES ('02-080', 'Concrete nail #3', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 11);
INSERT INTO `ims_item` VALUES ('02-081', 'Tek screw 1 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-082', 'Hand Riveter', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-083', 'Tank Lever Flush', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-084', 'Tank Fittings', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 21);
INSERT INTO `ims_item` VALUES ('02-085', 'Electrical PVC Pipe 1/2 - (Orange)', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-086', 'PVC Pipe 4" ( Orange )', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-087', 'Elbow  4" ( Orange )', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-088', 'Clean Out Cover 4" pvc', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-089', 'Pollituff', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 12);
INSERT INTO `ims_item` VALUES ('02-090', 'Hardener Cream', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-091', 'Submeter', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-092', 'Expansion Bolt 3/5 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-093', 'Hinges 3 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-094', 'Plug Adapter', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-095', 'Grinding Disc- For Finishing', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-096', 'Spatula', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-097', 'Wall Scrapper - (Paleta)', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-098', 'Blind Rivits  1/8 x 1/2 - LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 5);
INSERT INTO `ims_item` VALUES ('02-099', 'Gunting ng Yero', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-100', 'Paint Remover', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-101', 'Rugby', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 6);
INSERT INTO `ims_item` VALUES ('02-102', 'Rodela - Bakal', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-103', 'Rodela - Kahoy', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-104', 'Elasto Seal - water proofing sealant', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-105', 'Rope', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 14);
INSERT INTO `ims_item` VALUES ('02-106', 'Circuit Breaker - 60A PLUG IN- GE', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-107', 'Toks screw', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-108', 'Elbow 2" Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-109', 'PVC 2" Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-110', 'Square Bar 10mm', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-111', 'Sealant', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-112', 'Faucet - 6"', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-113', 'C. Clamp 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-114', 'Cocolumber 2 x 3 x 12', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-115', 'Flat Cord #14', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 14);
INSERT INTO `ims_item` VALUES ('02-116', 'Common Nail #3- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 11);
INSERT INTO `ims_item` VALUES ('02-117', 'Common Nail #2- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 11);
INSERT INTO `ims_item` VALUES ('02-118', 'Umbrella Nail', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 11);
INSERT INTO `ims_item` VALUES ('02-119', 'PVC Elbow 3/4 - Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-120', 'PVC Pipe 3/4- Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-121', 'PVC Pipe 2" Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-122', 'PVC Pipe 3" Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-123', 'P- Trap 2" Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-124', 'Tee 2" Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-125', 'Elbow 3" Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-126', 'PVC- Y 3 x 2 -Orange', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-127', 'Clean Out Cover 3" pvc', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-128', 'Kiln Dry Wood- 1 1/2 x 2 x 12', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-129', 'Kiln Dry Wood- 1/2 x 2 x 12', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-130', 'Flat Disc', 0, 0.0, 0.0, '2025-03-07 05:25:16', '2025-03-07 05:25:16', 2, 19);
INSERT INTO `ims_item` VALUES ('02-131', 'Flat Nail 1"', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 11);
INSERT INTO `ims_item` VALUES ('02-132', 'Flat Nail 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 11);
INSERT INTO `ims_item` VALUES ('02-133', 'Tile Trim', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-134', 'Kitchen Sink', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-135', 'PMR Strainer', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-136', 'Flex Hose - 1/2 x 16', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-137', 'Vulca Seal - BOSTIK', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 12);
INSERT INTO `ims_item` VALUES ('02-138', 'Metal Furring 0.5', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-139', 'QDE Enamel white', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 2);
INSERT INTO `ims_item` VALUES ('02-140', 'Hamba 80 x 210', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-141', 'Garden Hose 5/8- EXCEL', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 14);
INSERT INTO `ims_item` VALUES ('02-142', 'Hose- connector', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 18);
INSERT INTO `ims_item` VALUES ('02-143', 'PVC Pipe 1" -Orange', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 18);
INSERT INTO `ims_item` VALUES ('02-144', 'PVC  Elbow 1" -Orange', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 18);
INSERT INTO `ims_item` VALUES ('02-145', 'PVC  Male Adaptor 1" -Orange', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 18);
INSERT INTO `ims_item` VALUES ('02-146', 'LED Light 15W - OMNI', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 18);
INSERT INTO `ims_item` VALUES ('02-147', 'Baby Roller 4"- JUPITER', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 18);
INSERT INTO `ims_item` VALUES ('02-148', 'Screw Bit', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 18);
INSERT INTO `ims_item` VALUES ('02-149', 'End cap 1/2 PVC', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 18);
INSERT INTO `ims_item` VALUES ('02-150', 'Toilet Bowl', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 18);
INSERT INTO `ims_item` VALUES ('02-151', 'Cylindrical Hinges 1"', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 18);
INSERT INTO `ims_item` VALUES ('02-152', 'Cylindrical Hinges 1/2"', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 18);
INSERT INTO `ims_item` VALUES ('02-153', 'Blind Rivet 3/16 x 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 5);
INSERT INTO `ims_item` VALUES ('02-154', 'Universal Padlock -ACE', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-155', 'Sand Paper', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 7);
INSERT INTO `ims_item` VALUES ('02-156', 'Squala', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-157', 'Hose Bibb Faucet', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-158', 'Flexi Bond', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 2);
INSERT INTO `ims_item` VALUES ('02-159', 'Paint Thinner- PUREE', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 12);
INSERT INTO `ims_item` VALUES ('02-160', 'Rubber Tape', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-161', 'Paint brush #2- HIPO', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-162', 'Drill bit 1/8 - DOORMER', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-163', 'Pipe 3/4 x 20 GI schd.40', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-164', 'Circuit Breaker - 30 A PLUG IN- GE', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-165', 'AC - Outlet', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-166', 'Black Screw', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-167', 'Insulation Foam', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 14);
INSERT INTO `ims_item` VALUES ('02-168', 'Metal Furring 0.6', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-169', '3 Gang Switch - Royu', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-170', 'Universal Outlet - Royu', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-171', '2 Gang- Royu', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-172', '3 Gang- Royu', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 21);
INSERT INTO `ims_item` VALUES ('02-173', 'National Universal Outlet', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-174', 'National Outlet Classic', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-175', 'Phenolic Board 3/4', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-176', 'Lag Screw 3/1 x 13', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-177', 'Sanding Sealer Lacquer', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 2);
INSERT INTO `ims_item` VALUES ('02-178', 'Paint Brush #1- HIPO', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-179', 'Metal Screw', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-180', 'Mini Roller - Refill', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-181', 'Electrode Holder- 300amps', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-182', 'Sand Paper - #120', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-183', 'Steel Brush', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 19);
INSERT INTO `ims_item` VALUES ('02-184', 'Concrete Nail #4', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 11);
INSERT INTO `ims_item` VALUES ('02-185', 'QDE black- Paint', 0, 0.0, 0.0, '2025-03-07 05:25:17', '2025-03-07 05:25:17', 2, 13);
INSERT INTO `ims_item` VALUES ('02-186', 'Panel Box - 4 hole 2x2', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 18);
INSERT INTO `ims_item` VALUES ('02-187', 'Circuit Breaker - 20 A PLUG IN- GE', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 18);
INSERT INTO `ims_item` VALUES ('02-188', 'Drill Bit 5/32', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 18);
INSERT INTO `ims_item` VALUES ('02-189', 'Concrete Nail - # 1', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 11);
INSERT INTO `ims_item` VALUES ('02-190', 'Mesh Tape / Gasa', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 20);
INSERT INTO `ims_item` VALUES ('02-191', 'Adhesive - Cement - ABC', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 3);
INSERT INTO `ims_item` VALUES ('02-192', 'QDE - Maple', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 13);
INSERT INTO `ims_item` VALUES ('02-193', 'Angle Valve - 1/2 ( 3 way )', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-194', 'Bolt and Nut - 10mm x 2 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-195', 'Drill Bit- 1/4 (concrete)', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-196', 'Drill Bit- 3/16 (concrete)', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-197', 'Screw w/ Tox - 3/16', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-198', 'Flexible Hose - 1/2 x 1/2 x 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-199', 'Spring Door', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-200', 'Flexible Hose - 1/2 x 1/2 x 1/8', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-201', 'Lavatory Bracket', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-202', 'Lavatory Fittings', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 21);
INSERT INTO `ims_item` VALUES ('02-203', 'Dyna Bolt 5/16', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-204', 'Terminal Battery', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-205', 'Moulding Strips-  3/4- ATLANTA', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-206', 'Atlanta PVC type - 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-207', 'Screw - #1', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-208', 'Amco Box Outlet', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-209', 'Plug In - 30 Amp', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-210', 'Duct Tape', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-211', 'Cutter Blade - hardware', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 21);
INSERT INTO `ims_item` VALUES ('02-212', 'Paint Tray', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-213', 'Half moon Wood', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-214', 'Junction Box 4 x 2 - pvc - OMNI', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-215', 'Pinlight Fixture Alum- AKARI', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-216', 'LED Light- 9w -FIREFLY', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-217', 'LED Ceiling Lamp Surface Type- 18w - OMNI', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-218', '2 Gang Switch- PANASONIC', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-219', '1 Gang 3 way Switch- PANASONIC', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-220', '3 Gang Switch- PANASONIC', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-221', 'Faucet Stainless - WATERGATE', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-222', 'Faucet Brass - Gold -  WATERGATE', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-223', 'Junction Box Cover - OMNI', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-224', 'Hinges 35 x 35 x 2- GATEMAN', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-225', 'Circuit breaker 60A bolt-On - GE', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-226', 'Faucet hose bib white PVC - DOWEL', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-227', 'Hose Clamp 5/8 -', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-228', 'Angle Bar 5.0mm x 1 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-229', 'TILE 60 X 60 AK 6882', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-230', 'TILE 60 X 60 AK 6889', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-231', 'ALUM. Door Brown', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-232', 'MJ Water Closet', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-233', 'Grout White', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 3);
INSERT INTO `ims_item` VALUES ('02-234', 'TILE 60 x 60 FC 6013', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-235', 'Rib type 05.mm x 3.66m', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-236', 'Rib type 05.mm x 3.05m', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-237', 'Rib type 05.mm x 6.10m', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-238', 'Tek screw 12 x 55 steel', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-239', 'Panel Door 80 x 200  jamb 2 x 5 kd w/ holes', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 21);
INSERT INTO `ims_item` VALUES ('02-240', 'Ply Wood  ORDINARY 1/2- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:18', '2025-03-07 05:25:18', 2, 19);
INSERT INTO `ims_item` VALUES ('02-241', 'Cocolumber 2 x 2 x 10FT- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 19);
INSERT INTO `ims_item` VALUES ('02-242', 'G.I. Wire #16', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 11);
INSERT INTO `ims_item` VALUES ('02-243', 'Flat latex White - BOYSEN 30f - 100m', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 17);
INSERT INTO `ims_item` VALUES ('02-244', 'Flat latex White -MENNISOTA 30f - 100m', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 17);
INSERT INTO `ims_item` VALUES ('02-245', 'Flat latex White - COAT SAVER (solo88)', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 17);
INSERT INTO `ims_item` VALUES ('02-246', 'Latex Gloss White- COAT SAVER (solo99)', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 17);
INSERT INTO `ims_item` VALUES ('02-247', 'Roofing Paint Blue- RAIN OR SHINE', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 17);
INSERT INTO `ims_item` VALUES ('02-248', 'Acry Color Raw Sienna -DESTINY', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 8);
INSERT INTO `ims_item` VALUES ('02-249', 'Ting Ting Color Thalo Blue #16- DESTINY', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 8);
INSERT INTO `ims_item` VALUES ('02-250', 'Ting Ting Color Thalo Blue - BOYSEN (B2306)', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 8);
INSERT INTO `ims_item` VALUES ('02-251', 'Pylox Spray Paint Sky Blue', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 8);
INSERT INTO `ims_item` VALUES ('02-252', 'Pylox Spray Paint Silver', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 8);
INSERT INTO `ims_item` VALUES ('02-253', 'Spray Paint Pearl White- SAMURAI', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 8);
INSERT INTO `ims_item` VALUES ('02-254', 'Spray Paint Gloss Black- BOSNY', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 2);
INSERT INTO `ims_item` VALUES ('02-255', 'Spray Paint Light Sky Blue- NIPPON', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 2);
INSERT INTO `ims_item` VALUES ('02-256', 'Laquer Thinner- PUREE 3Ltr', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 2);
INSERT INTO `ims_item` VALUES ('02-257', 'Paint Thinner- LESCO 3Ltr', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 2);
INSERT INTO `ims_item` VALUES ('02-258', 'QDE - Yellow - SALAMAT BRO', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 2);
INSERT INTO `ims_item` VALUES ('02-259', 'QDE - Yellow - TKO', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 2);
INSERT INTO `ims_item` VALUES ('02-260', 'Prolux Glazing Putty White- DAVIES', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 2);
INSERT INTO `ims_item` VALUES ('02-261', 'Butterfly Paint Brush - 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 19);
INSERT INTO `ims_item` VALUES ('02-262', 'Fan Club Paint Brush - 1"', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 19);
INSERT INTO `ims_item` VALUES ('02-263', 'Fan Club Paint Brush - 2"', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 19);
INSERT INTO `ims_item` VALUES ('02-264', 'Butterfly Paint Brush - 3"', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 19);
INSERT INTO `ims_item` VALUES ('02-265', 'Butterfly Paint Brush - 4"', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 19);
INSERT INTO `ims_item` VALUES ('02-266', 'Acrylon Paint Roller - 7"', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 19);
INSERT INTO `ims_item` VALUES ('02-267', 'QDE- Black -DOMINO', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 2);
INSERT INTO `ims_item` VALUES ('02-268', 'GreenField Floodlight LED 50w', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 19);
INSERT INTO `ims_item` VALUES ('02-269', 'Flat White 16Ltrs. SINCLAIR', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 17);
INSERT INTO `ims_item` VALUES ('02-270', 'Pylox Spray Paint Heat Black', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 8);
INSERT INTO `ims_item` VALUES ('02-271', 'Build Rite Metal Primer Red Oxide -3ltr', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 2);
INSERT INTO `ims_item` VALUES ('02-272', 'Epoxy Reducer- PUREE', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 2);
INSERT INTO `ims_item` VALUES ('02-273', 'Laquer Flow- PUREE', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 2);
INSERT INTO `ims_item` VALUES ('02-274', 'Permacoat Gloss White B710- BOYSEN', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 17);
INSERT INTO `ims_item` VALUES ('02-275', 'Fast Dry Enamel White NS950- NATION', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 2);
INSERT INTO `ims_item` VALUES ('02-276', 'Exhaust Fan- OMNI', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 19);
INSERT INTO `ims_item` VALUES ('02-277', 'Yellow -RAIN OR SHINE', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 2);
INSERT INTO `ims_item` VALUES ('02-278', 'Royal Blue- RAIN OR SHINE', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 2);
INSERT INTO `ims_item` VALUES ('02-279', 'Door Closer- Lotus Tubular', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 19);
INSERT INTO `ims_item` VALUES ('02-280', 'QDE- White -BOYSEN', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 2);
INSERT INTO `ims_item` VALUES ('02-281', 'PANEL BOARD 6 HOLES PLUG IN- AMERICA', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 18);
INSERT INTO `ims_item` VALUES ('02-282', 'Flat Gloss- BOYSEN', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 17);
INSERT INTO `ims_item` VALUES ('02-283', 'QDE WHITE- BOYSEN (pail)', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 17);
INSERT INTO `ims_item` VALUES ('02-284', 'Ting ting Color Thalo Blue- BOYSEN', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 12);
INSERT INTO `ims_item` VALUES ('02-285', 'Guilder Epoxy primer Gray- BOYSEN', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 2);
INSERT INTO `ims_item` VALUES ('02-286', 'Acry Color Raw Sienna -BOYSEN', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 8);
INSERT INTO `ims_item` VALUES ('02-287', 'Acry Color Thalo Blue- BOYSEN', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 8);
INSERT INTO `ims_item` VALUES ('02-288', 'Roller Brush w/h 2b -ACRYLON', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 19);
INSERT INTO `ims_item` VALUES ('02-289', 'Baby Roller w/o- OMEGA', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 19);
INSERT INTO `ims_item` VALUES ('02-290', 'Zimcoat Skimcoat', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 3);
INSERT INTO `ims_item` VALUES ('02-291', 'DIB Cable Tie 100pcs 7 in BLACK', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 16);
INSERT INTO `ims_item` VALUES ('02-292', 'Deform Bar - 16mm', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 19);
INSERT INTO `ims_item` VALUES ('02-293', '1/4 Thick Plastic Acrylic 4 x 8', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 19);
INSERT INTO `ims_item` VALUES ('02-294', 'Anzahl Anti Corrosion', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 12);
INSERT INTO `ims_item` VALUES ('02-295', 'Anzahl Surfacer Primer', 0, 0.0, 0.0, '2025-03-07 05:25:19', '2025-03-07 05:25:19', 2, 12);
INSERT INTO `ims_item` VALUES ('02-296', 'Anzahl White w/ Catalest', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 2);
INSERT INTO `ims_item` VALUES ('02-297', 'Urethane Thinner', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 2);
INSERT INTO `ims_item` VALUES ('02-298', 'Body Filler W/ Hardener', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 2);
INSERT INTO `ims_item` VALUES ('02-299', 'Sand Paper #100', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-300', 'Sand Paper 120" 400" 1200', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-301', 'Tiles 60 x 60 fc 6013', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-302', 'Tiles 60 x 60 fc 6889', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-303', 'Tiles 60 x 60 ak 6882', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-304', 'Tiles 60 x 60 ak 6888', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-305', 'MJ Water Closet bowl', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-306', 'Cable Tie 6x300', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 16);
INSERT INTO `ims_item` VALUES ('02-307', 'QDE WHITE- TKO', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 2);
INSERT INTO `ims_item` VALUES ('02-308', 'Junction Box- SHUTA', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-309', '1 Gang Switch- ROYU', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-310', '2 Gang Outlet Universal- FOCUS', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-311', 'PVC Pipe Orange 1/2- BIO', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-312', 'THHN WIRE 12"- MAX', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-313', 'Angle Valve 1/2" 2 way - HAWK', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-314', 'Faucet 2 way -HAWK', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-315', 'Supply Hose 1/2 x 1/2 - ITALY', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-316', 'Floor Drain 4 x 4- CHICAGO', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-317', 'Faucet s/s - HAWK', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-318', 'Cyclone Wire', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-319', 'Long Span Rib type 0.50m x 1220m Blue', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-320', 'C- Purlins 2 x 3 1.0', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-321', 'Deform Bar 12mm', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-322', 'Steel Matting 4 x 8 #8', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('02-323', 'Tubular 2 x 3 1.4', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 2, 19);
INSERT INTO `ims_item` VALUES ('03-001', 'Air Release Valve 1" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-002', 'Air Release Valve 1" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-003', 'Adaptor 2" CI', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-004', 'Adaptor 3" CI', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-005', 'Adaptor 4" CI', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-006', 'Adaptor 6" CI', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-007', 'Ball Valve 1"', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-008', 'Ball Valve 1/2 Lockwing - WIN', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-009', 'Ball Valve 1/2 Magnetic', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-010', 'Ball Valve 2"', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-011', 'Ball Valve 3/4" Lockwing', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-012', 'Bell Reducer 3 x 2 B.I', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-013', 'Bell Reducer 1 1/4 x 1" GI', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-014', 'Bell Reducer 1" x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-015', 'Bell Reducer 1/2 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-016', 'Bell Reducer 2 x 1 GI', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-017', 'Bell Reducer 3 x 2 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-018', 'Bell Reducer 4 x 3 BI', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-019', 'Bell Reducer 6 x 4 BI', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-020', 'Bell Reducer 6 x 4 GI - Mechanical', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-021', 'Bushing 3/4 x 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-022', 'Bushing 1 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-023', 'Bushing 2 x 1 GI', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-024', 'Bushing 2 x 2 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-025', 'Bushing 4 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:20', '2025-03-07 05:25:20', 3, 19);
INSERT INTO `ims_item` VALUES ('03-026', 'Butterfly Valve 4"', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-027', 'Butterfly Valve 6"', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-028', 'Checkvalve 1" - Brass', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-029', 'Checkvalve 1/2" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-030', 'Checkvalve 1 1/2" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-031', 'Checkvalve 2" - Brass', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-032', 'Checkvalve 3" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-033', 'Checkvalve 4"', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-034', 'Checkvalve 6"', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-035', 'Checkvalve 6" CI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-036', 'Coupling 1" GI (S40)', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-037', 'Coupling 1" GI (S80)', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-038', 'Coupling 1" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-039', 'Coupling 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-040', 'Coupling 1/2 PVC', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-041', 'Coupling 1/2 PVC w/ Thread', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-042', 'Coupling 1/2 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-043', 'Coupling 2" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-044', 'Coupling 2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-045', 'Coupling 3" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-046', 'Coupling 3" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-047', 'Coupling 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-048', 'Coupling 3/4 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-049', 'Coupling 4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-050', 'Coupling 4" HDPE- FISH', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-051', 'Coupling 4X3 GI (SCHED 80)', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-052', 'Coupling 6" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-053', 'Coupling 6" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-054', 'Coupling 3/4"  PVC', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-055', 'Coupling Reducer 3 x 2 - Mechanical', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-056', 'Coupling Reducer 3 x 2 NLC - FISH', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-057', 'Coupling Reducer 4 x 2 - Mechanical', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-058', 'Cross Tee 1" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-059', 'Cross Tee 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-060', 'Cross Tee 2" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-061', 'Cross Tee 3 x 2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-062', 'Cross Tee 3" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-063', 'Cross Tee 4 x 2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-064', 'Cross Tee 4 x 3 GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-065', 'Cross Tee 4" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-066', 'Cross Tee 6 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-067', 'Elbow 45deg - Flange Type 6" CI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-068', 'Elbow 90 deg - 4" BI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-069', 'Elbow 90deg - Flange Type 6" CI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-070', 'Elbow 1" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-071', 'Elbow 1" GI 45 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-072', 'Elbow 1" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-073', 'Elbow 1" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-074', 'Elbow 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-075', 'Elbow 1/2 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-076', 'Elbow 1/2 (plain)  PVC', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-077', 'Elbow 2" GI', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-078', 'Elbow 2" HDPE- FISH', 0, 0.0, 0.0, '2025-03-07 05:25:21', '2025-03-07 05:25:21', 3, 19);
INSERT INTO `ims_item` VALUES ('03-079', 'Elbow 3" BI 45 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-080', 'Elbow 3" GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-081', 'Elbow 3" GI 45 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 1);
INSERT INTO `ims_item` VALUES ('03-082', 'Elbow 3" HDPE- FISH', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-083', 'Elbow 3/4 GI- JB', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-084', 'Elbow 3/4 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-085', 'Elbow 4" 45deg (80) BI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-086', 'Elbow 4" 45deg GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-087', 'Elbow 4" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-088', 'Elbow 6" BI  45 DEG', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-089', 'Elbow 6" BI  90 DEG', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-090', 'Elbow Reducer 1" x 1 1/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-091', 'Elbow Reducer 1" x 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-092', 'Elbow Reducer 1" x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-093', 'Elbow Reducer 3/4 x 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-094', 'Elbow Straight 1/2"', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-095', 'Elbow Straight 1"', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-096', 'Elbow Straight 3/4"', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-097', 'Elbow Threaded 1/2 PVC', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-098', 'End Cap 1" GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-099', 'End Cap 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-100', 'End Cap 2"  GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-101', 'End Cap 2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-102', 'End Cap 3" GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-103', 'End Cap 3" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-104', 'End Cap 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-105', 'End Cap 4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-106', 'End Cap 6"', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-107', 'End Cap 8"', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-108', 'End Plug 1" GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-109', 'End Plug 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-110', 'End Plug 2" GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-111', 'End Plug 3 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-112', 'End Plug 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-113', 'End Plug 4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-114', 'Sleeve-Type Coupling 8"', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-115', 'Fabricated Elbow 3"', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-116', 'Fabricated Elbow 4"', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-117', 'Fabricated Elbow 6', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-118', 'Fabricated Reducer 3 x 2', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-119', 'Fabricated Tee 3 x 2', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-120', 'Fabricated Tee 3', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-121', 'Fabricated Tee 4 x 2', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-122', 'Fabricated Tee 4 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-123', 'Fabricated Tee 4', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-124', 'Fabricated Tee 6 x 2', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-125', 'Fabricated Tee 6 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-126', 'Fabricated Tee 6 x 4', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-127', 'Fabricated Tee 6', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-128', 'Fabricated Tee 8 x 2', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-129', 'Fabricated Tee 8 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-130', 'Fabricated Tee 8', 0, 0.0, 0.0, '2025-03-07 05:25:22', '2025-03-07 05:25:22', 3, 19);
INSERT INTO `ims_item` VALUES ('03-131', 'Female Adaptor 1/2" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-132', 'Female Elbow 1" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-133', 'Female Elbow 1/2 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-134', 'Female Elbow 2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-135', 'Female Elbow 3 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-136', 'Female Elbow 3/4 HDPE - NLC- PBP', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-137', 'Flange 2"', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-138', 'Flange 3" ( 8 hole )', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-139', 'Flange 6"', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-140', 'Flange 8"', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-141', 'Gasket 1/2"', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-142', 'Gasket 3" - LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-143', 'Gasket 3/4 "', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-144', 'Gasket 8"', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-145', 'Gate Valve 1" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-146', 'Gate Valve 1/2" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-147', 'Gate Valve 2" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-148', 'Gate Valve 2" Flange', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-149', 'Gate Valve 2" Mechanical', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-150', 'Gate Valve 3" Mechanical', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-151', 'Gate Valve 3" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-152', 'Gate Valve 3" Flange- DI (BOHAI)', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-153', 'Gate Valve 3/4" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-154', 'Gate Valve 4" Flange', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-155', 'Gate Valve 4" Mechanical', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-156', 'Gate Valve 6" Brass', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-157', 'Gate Valve 6" Flange', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-158', 'Gate Valve 6" Mechanical', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-159', 'Gate Valve 8" Mechanical', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-160', 'GiBault 2"', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-161', 'GiBault 3"', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-162', 'GiBault 4"', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-163', 'GiBault 6"', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-164', 'GiBault 8"', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-165', 'Gate Valve 2" Flange Type CI', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-166', 'Gate Valve 3" Flange Type CI', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-167', 'Gate Valve 4" Flange Type CI', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-168', 'Mechanical Flange 3" - LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-169', 'Mechanical Flange 4"- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-170', 'Male Adaptor 1" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-171', 'Male Adaptor 1" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-172', 'Male Adaptor 1/2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 1);
INSERT INTO `ims_item` VALUES ('03-173', 'Male Adaptor 1/2" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 1);
INSERT INTO `ims_item` VALUES ('03-174', 'Male Adaptor 2" HDPE- FISH', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-175', 'Male Adaptor 2" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-176', 'Male Adaptor 3"', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-177', 'Male Adaptor 3/4 HDPE - FISH', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-178', 'Male Adaptor 3/4" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-179', 'Mechanical Elbow 2" 90 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-180', 'Mechanical Elbow 3" 45 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-181', 'Mechanical Elbow 3" 90 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-182', 'Mechanical Elbow 4" 90 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-183', 'Mechanical Elbow 6" 45 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:23', '2025-03-07 05:25:23', 3, 19);
INSERT INTO `ims_item` VALUES ('03-184', 'Mechanical Elbow 6" 90 deg.', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-185', 'Mechanical End Cap 2"', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-186', 'Mechanical End Cap 4"', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-187', 'Mechanical Tee 2"', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-188', 'Mechanical Tee 3 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-189', 'Mechanical Tee 4 x 2 CI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-190', 'Mechanical Tee 4 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-191', 'Mechanical Tee 4 x 4', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-192', 'Mechanical Tee 6 x 2', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-193', 'Mechanical Tee 6 x 3', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-194', 'Mechanical Tee 6 x 4', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-195', 'Mechanical Tee 6"', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-196', 'Nipple 1 x 12 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-197', 'Nipple 1 x 5 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-198', 'Nipple 1 x 8 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-199', 'Nipple 1" x 2" GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-200', 'Nipple 1" x 6" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-201', 'Nipple 1" x 8" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-202', 'Nipple 1/2 x 1 GI - FS', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-203', 'Nipple 1/2 x 12 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-204', 'Nipple 1/2 x 16 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-205', 'Nipple 1/2 x 2 GI - JB', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-206', 'Nipple 1/2 x 2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-207', 'Nipple 1/2 x 3 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-208', 'Nipple 1/2 x 4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-209', 'Nipple 1/2 x 6 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-210', 'Nipple 1/2 x 8 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-211', 'Nipple 2 1/2 x 5 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-212', 'Nipple 2 x 5 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-213', 'Nipple 3 x 5 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-214', 'Nipple 3/4 x 10 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-215', 'Nipple 3/4 x 4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-216', 'Nipple 3/4 x 5 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-217', 'Nipple 3/4 x 6 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-218', 'Nipple 3/4 x 6 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-219', 'Nipple 3/4 x 8 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-220', 'Nipple 3/4 x 8 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-221', 'Nipple 4 x 12 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-222', 'Nipple 5 x 10 BI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-223', 'Repair Clamp 2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-224', 'Repair Clamp 3" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-225', 'Repair Clamp 4" HDPE - MIE', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-226', 'Repair Clamp 6" HDPE - MIE', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-227', 'Repair Clamp 8" HDPE - MIE', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-228', 'Saddle Clamp 2 x 1 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-229', 'Saddle Clamp 2 x 1 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-230', 'Saddle Clamp 2 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-231', 'Saddle Clamp 3 x 1 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-232', 'Saddle Clamp 3 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-233', 'Saddle Clamp 4 x 1 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-234', 'Saddle Clamp 4 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-235', 'Saddle Clamp 4x2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:24', '2025-03-07 05:25:24', 3, 19);
INSERT INTO `ims_item` VALUES ('03-236', 'Saddle Clamp 6 x 1 GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-237', 'Saddle Clamp 6 x 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-238', 'Saddle Clamp 6 x 2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-239', 'Saddle Clamp 6 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-240', 'Saddle Clamp 6" x 1" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-241', 'Saddle Clamp 8" x 1" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-242', 'Saddle Clamp 8" x 1" GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-243', 'Saddle Clamp 8" x 2" - HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-244', 'Saddle Clamp 8" x 2" GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-245', 'Side Bolts 3/4 x 8', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-246', 'Sleeve-Type Coupling 2"', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-247', 'Sleeve-Type Coupling 3" DI pvc to pvc- PVMC', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-248', 'Sleeve-Type Coupling 4 x 2', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-249', 'Sleeve-Type Coupling 4" DI pvc to pvc- PVMC', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-250', 'STC (GI-PVC) 6" (GI to GI)', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-251', 'Sleeve-Type Coupling 6" DI (PVC to PVC)- PVMC', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-252', 'Stub End 2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-253', 'Stub End 3" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-254', 'Stub End 4" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-255', 'Stub End 6" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-256', 'Stub End 8" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-257', 'Tee 1" GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-258', 'Tee 1" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-259', 'Tee 1/2" GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 1);
INSERT INTO `ims_item` VALUES ('03-260', 'Tee 1/2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 1);
INSERT INTO `ims_item` VALUES ('03-261', 'Tee 1/2" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 1);
INSERT INTO `ims_item` VALUES ('03-262', 'Tee 2" Flange', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-263', 'Tee 2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-264', 'Tee 3" Flange', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-265', 'Tee 3" GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-266', 'Tee 3" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-267', 'Tee 3/4" GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 1);
INSERT INTO `ims_item` VALUES ('03-268', 'Tee 3/4"HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 1);
INSERT INTO `ims_item` VALUES ('03-269', 'Tee 4" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-270', 'Tee Reducer 1 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-271', 'Tee Reducer 1" x 1/2 GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-272', 'Tee Reducer 1/2 x 3/4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-273', 'Tee Reducer 3 x 2 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-274', 'Tee Reducer 4 x 2 HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-275', 'Tee Reducer 4 x 3 HDPE- FISH', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-276', 'Tee 6" Flange', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-277', 'Tee 6 x 4  Mechanical CI', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-278', 'Valve Cover - 4" GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-279', 'Valve Cover - 6" G.I.', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-280', 'Y-connector with ferrul 3/4"', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-281', 'Y-Strainer 2"', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-282', 'Y-Strainer 3"', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-283', 'Y-Strainer 4"', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-284', 'Y-Strainer 6" Flange', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-285', 'Elbow 6 x 45 deg (sched 80) GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-286', 'Elbow 6 x 90 deg (sched 80) GI', 0, 0.0, 0.0, '2025-03-07 05:25:25', '2025-03-07 05:25:25', 3, 19);
INSERT INTO `ims_item` VALUES ('03-287', 'STC (GI-HDPE) 6" - BLACK', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-288', 'STC (GI-PVC) 2"', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-289', 'STC (GI-PVC) 4"', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-290', 'Checkvalve 3" GI', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-291', 'Cross Tee Fabricated HDPE 4"', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-292', 'Cross Tee HDPE 3"', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-293', 'Cross Tee HDPE 4x3', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-294', 'Cross Tee HDPE 6x3', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-295', 'Cross Tee HDPE 6x4', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-296', 'Nipple 1"x24" GI (sched 80)', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-297', 'Coupling Reducer 1" x 3/4" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-298', 'Tee w/ Thread 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-299', 'Elbow 4 x 90 sched80', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-300', 'STC 4" ( GI to HDPE) DI - BLUE', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-301', 'Cross Tee HDPE 3 x 2 - fabricated', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-302', 'STC 3" (GI to HDPE)', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-303', 'Elbow 3" GI 90deg (sched 80)', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-304', 'STC 8"', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-305', 'Elbow 3" 45 deg. (schd.80)', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-306', 'Gate Valve Flange type 8" w/ bang', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-307', 'Nipple 1/2 x 5', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-308', 'Elbow 8 x 90 deg. - HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-309', 'Coupling Reducer 8 x 6 - HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-310', 'Fabricated Coupling 6 x 8', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-311', 'Check Valve 3/4- Brass', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-312', 'Valve Cover 6" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-313', 'Fabricated Elbow 4 x 90 deg. HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-314', 'Fabricated Elbow 6 x 90 deg. HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-315', 'Fabricated Elbow 8 x 45 deg. HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-316', 'Coupling Reducer 8 x 4 - HDPE ( Fabricated)', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-317', 'Coupling Reducer 8 x 6 - HDPE ( Fabricated)', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-318', 'Gasket- 6"', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-319', 'DI Gate Valve Flange Type 8"', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-320', 'Bolt and nut 5/8 x 8- Full Thread', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-321', 'Full thread 3/4 x 10 ft.', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-322', 'Bell Reducer 5 x 4 GI', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-323', 'Tee 4" Flange type CI', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-324', 'Nut GI - 5/8"- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-325', 'Bell Reducer GI 1/2 x 3/4 - JB', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-326', 'End Cap 3/4 GI - MECH', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-327', 'End Plug 3/4 GI - JB', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-328', 'End Plug 1"GI - JB', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-329', 'Nipple 3/4 x 5 GI - JB', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-330', 'Nipple 3/4 x 8 GI - FS', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-331', 'Nipple 1 x 5 GI - AKUA', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-332', 'Nipple 1 x 8 GI - AKUA', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-333', 'Saddle Clamp 3 x 3/4 DI - PV', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-334', 'Saddle Clamp 6 x 1 DI - PV', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-335', 'Sleeve-Type Coupling 3" DI pvc to pvc- BOHAI', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-336', 'Sleeve-Type Coupling 4" DI pvc to pvc- BOHAI', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-337', 'Sleeve-Type Coupling 6" DI (PVC to PVC)- BOHAI', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-338', 'Male Adaptor 3/4 nlc- PBP', 0, 0.0, 0.0, '2025-03-07 05:25:26', '2025-03-07 05:25:26', 3, 19);
INSERT INTO `ims_item` VALUES ('03-339', 'Male Adaptor 1 nlc- PBP', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-340', 'PVC Pipe 1/2 w/ hub- NELTEX', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-341', 'Male Adaptor 1/2 PVC- TIAN BLUE', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-342', 'Coupling 1/2 PVC- TIAN BLUE', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-343', 'Elbow Plain 1/2 PVC- TIAN BLUE', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-344', 'Repair Clamp 2" HDPE -MIE', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-345', 'Repair Clamp 3" HDPE -MIE', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-346', 'Tee Reducer 1 x 3/4 GI - JB', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-347', 'Tee 3/4 GI - JB', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-348', 'Nipple 1/2 x 1 GI - MICRO', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-349', 'Nipple 1/2 x 2 GI - MICRO', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-350', 'Coupling 1" HDPE - FISH', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-351', 'Female Elbow 1/2 HDPE- PBP', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-352', 'DI Sleeve type coupling pvc-pvc 4"- HIWA', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-353', 'DI Sleeve type coupling pvc-pvc 6"-HIWA', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-354', 'CI Sleeve Type coupling pvc- GI 6"- CMI', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-355', 'Flow meter 4" Paddle Wheel Type- ZENNER', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-356', 'Flow meter 6" Paddle Wheel Type- ZENNER', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-357', 'GASKET 4- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-358', 'STC 4" ( GI to GI)- CMI', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-359', 'Check Valve 1/2 Brass- ACE', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-360', 'Ball Valve 1/2 Lockwing -ACE', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-361', 'Nipple 1/2 x 12 GI - JB', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('03-362', 'Male Adaptor 1/2 HDPE- PBP', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 3, 19);
INSERT INTO `ims_item` VALUES ('04-001', 'Pipe 1" HDPE- MIG', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 19);
INSERT INTO `ims_item` VALUES ('04-002', 'Pipe 1" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 14);
INSERT INTO `ims_item` VALUES ('04-003', 'Pipe 1/2 HDPE - MIG', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 14);
INSERT INTO `ims_item` VALUES ('04-004', 'Pipe 1/2 PVC', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 14);
INSERT INTO `ims_item` VALUES ('04-005', 'Pipe 2" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 14);
INSERT INTO `ims_item` VALUES ('04-006', 'Pipe 3" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 14);
INSERT INTO `ims_item` VALUES ('04-007', 'Pipe 3" RISER PIPE', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 14);
INSERT INTO `ims_item` VALUES ('04-008', 'Pipe 3/4 HDPE - MIG', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 19);
INSERT INTO `ims_item` VALUES ('04-009', 'Pipe 4" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 14);
INSERT INTO `ims_item` VALUES ('04-010', 'Pipe 4" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 14);
INSERT INTO `ims_item` VALUES ('04-011', 'Pipe 4" RISER HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 19);
INSERT INTO `ims_item` VALUES ('04-012', 'Pipe 4" GI', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 19);
INSERT INTO `ims_item` VALUES ('04-013', 'Pipe 6" GI (sched 80)', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 19);
INSERT INTO `ims_item` VALUES ('04-014', 'Pipe 6" HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 19);
INSERT INTO `ims_item` VALUES ('04-015', 'Pipe 8" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 19);
INSERT INTO `ims_item` VALUES ('04-016', 'Pipe 10" PVC', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 19);
INSERT INTO `ims_item` VALUES ('04-017', 'Pipe RISER 4" GI', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 19);
INSERT INTO `ims_item` VALUES ('04-018', 'Pipe 3" GI (sched 80)', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 19);
INSERT INTO `ims_item` VALUES ('04-019', 'Pipe 8" - HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 19);
INSERT INTO `ims_item` VALUES ('04-020', 'Pipe 1 1/2 GI LSII', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 19);
INSERT INTO `ims_item` VALUES ('04-021', 'Pipe 1 1 /2 GI s20', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 4, 19);
INSERT INTO `ims_item` VALUES ('05-001', 'Flow Meter 2"', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 5, 19);
INSERT INTO `ims_item` VALUES ('05-002', 'Flow Meter 3"- ZENNER', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 5, 19);
INSERT INTO `ims_item` VALUES ('05-003', 'Flow Meter 4"', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 5, 19);
INSERT INTO `ims_item` VALUES ('05-004', 'Flow Meter 6"', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 5, 19);
INSERT INTO `ims_item` VALUES ('05-005', 'Water Meter - Brass 1/2" - HYJET', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 5, 19);
INSERT INTO `ims_item` VALUES ('05-006', 'Water Meter - Plastic 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:27', '2025-03-07 05:25:27', 5, 19);
INSERT INTO `ims_item` VALUES ('05-007', 'Water Meter 3/4 - Brass - ACE', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 5, 19);
INSERT INTO `ims_item` VALUES ('05-008', 'Water Meter - Brass 1" - ACE', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 5, 19);
INSERT INTO `ims_item` VALUES ('05-009', 'Water Meter - Brass 2"', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 5, 19);
INSERT INTO `ims_item` VALUES ('06-001', 'Chemical Solution Tank 100L', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 9);
INSERT INTO `ims_item` VALUES ('06-002', 'Caution Tape', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-003', 'Fire Hydrant Head 2 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-004', 'Fire Hydrant Head 3 X 2 1/2', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-005', 'Pressure Gauge 0-60 PSI', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-006', 'Pressure Reducer Valve 3"', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-007', 'Pressure Reducer Valve 4"', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-008', 'Pressure Reducer Valve 6"', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-009', 'PVC Pipe Cement- ATLANTA', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-010', 'Padlock', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-011', 'Hacksaw Blade 12" Sandflex', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-012', 'Teflon Tape - ROYAL', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-013', 'Pressure Gauge 100 PSI', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-014', 'Concrete Cutter Blade 14"', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-015', 'Chemical Solution Tank 200L', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 9);
INSERT INTO `ims_item` VALUES ('06-016', 'Pressure Gauge 300 PSI', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-017', 'GI Bolts & Nuts 5/8 5" (Fullthread)- LOCAL', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-018', 'Rubber O-ring 4" PVC sure lock riser pipe', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-019', 'Bolt & Nut  w/ washer', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-020', 'Bolt & Nut m-6 x 20 w/ washer', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-021', 'Lock Washer', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-022', 'PE Hose 4 x 6 - white', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 20);
INSERT INTO `ims_item` VALUES ('06-023', 'Bolt and Nut 3/4 x 4 -full thread', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-024', 'Cutting Disc 4"- BLUE SHARK', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-025', 'Cut Off 14"', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-026', 'Saddle Clamp w/ Ferrule - 8 x 1 - HDPE', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 19);
INSERT INTO `ims_item` VALUES ('06-027', 'New Other Materials', 0, 0.0, 0.0, '2025-03-07 05:25:28', '2025-03-07 05:25:28', 6, 1);

CREATE TABLE `ims_measurement` (
  `measurementID` int NOT NULL AUTO_INCREMENT,
  `measureName` varchar(500) NOT NULL,
  PRIMARY KEY (`measurementID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `ims_measurement` VALUES (1, 'N/A');
INSERT INTO `ims_measurement` VALUES (2, 'gal');
INSERT INTO `ims_measurement` VALUES (3, 'bag');
INSERT INTO `ims_measurement` VALUES (4, 'bags');
INSERT INTO `ims_measurement` VALUES (5, 'box');
INSERT INTO `ims_measurement` VALUES (6, 'bot');
INSERT INTO `ims_measurement` VALUES (7, 'bundle');
INSERT INTO `ims_measurement` VALUES (8, 'Can');
INSERT INTO `ims_measurement` VALUES (9, 'drum');
INSERT INTO `ims_measurement` VALUES (10, 'drums');
INSERT INTO `ims_measurement` VALUES (11, 'Kgs');
INSERT INTO `ims_measurement` VALUES (12, 'Lt');
INSERT INTO `ims_measurement` VALUES (13, 'ltr');
INSERT INTO `ims_measurement` VALUES (14, 'mtr');
INSERT INTO `ims_measurement` VALUES (15, 'mtrs');
INSERT INTO `ims_measurement` VALUES (16, 'pack');
INSERT INTO `ims_measurement` VALUES (17, 'Pail');
INSERT INTO `ims_measurement` VALUES (18, 'pc');
INSERT INTO `ims_measurement` VALUES (19, 'pcs');
INSERT INTO `ims_measurement` VALUES (20, 'roll');
INSERT INTO `ims_measurement` VALUES (21, 'set');
INSERT INTO `ims_measurement` VALUES (22, 'sets');

CREATE TABLE `ims_monthlyconsumption` (
  `monthlyConsumptionID` int NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `week` int NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `consumption` double NOT NULL,
  `cost` double NOT NULL,
  `total` double NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `itemID_id` varchar(20) NOT NULL,
  `sectionID_id` int DEFAULT NULL,
  `transactionProductID_id` int DEFAULT NULL,
  PRIMARY KEY (`monthlyConsumptionID`),
  KEY `ims_monthlyconsumption_itemID_id_b5cb9329_fk_ims_item_itemID` (`itemID_id`),
  KEY `ims_monthlyconsumpti_sectionID_id_ab564cf1_fk_ims_secti` (`sectionID_id`),
  KEY `ims_monthlyconsumpti_transactionProductID_fa5dc8c1_fk_ims_trans` (`transactionProductID_id`),
  CONSTRAINT `ims_monthlyconsumpti_sectionID_id_ab564cf1_fk_ims_secti` FOREIGN KEY (`sectionID_id`) REFERENCES `ims_section` (`sectionID`),
  CONSTRAINT `ims_monthlyconsumpti_transactionProductID_fa5dc8c1_fk_ims_trans` FOREIGN KEY (`transactionProductID_id`) REFERENCES `ims_transactionproduct` (`transactionProductID`),
  CONSTRAINT `ims_monthlyconsumption_itemID_id_b5cb9329_fk_ims_item_itemID` FOREIGN KEY (`itemID_id`) REFERENCES `ims_item` (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `ims_monthlyconsumptiontotal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `totalNSC` int NOT NULL,
  `totalProd` int NOT NULL,
  `totalMeterMaintenance` int NOT NULL,
  `totalSpecialProj` int NOT NULL,
  `totalConstruction` int NOT NULL,
  `totalCommercial` int NOT NULL,
  `totalSales` int NOT NULL,
  `totalGenService` int NOT NULL,
  `totalConsumption` int NOT NULL,
  `totalNSC1` int NOT NULL,
  `totalProd1` int NOT NULL,
  `totalMeterMaintenance1` int NOT NULL,
  `totalSpecialProj1` int NOT NULL,
  `totalConstruction1` int NOT NULL,
  `totalCommercial1` int NOT NULL,
  `totalSales1` int NOT NULL,
  `totalGenService1` int NOT NULL,
  `totalConsumption1` int NOT NULL,
  `totalNSC2` int NOT NULL,
  `totalProd2` int NOT NULL,
  `totalMeterMaintenance2` int NOT NULL,
  `totalSpecialProj2` int NOT NULL,
  `totalConstruction2` int NOT NULL,
  `totalCommercial2` int NOT NULL,
  `totalSales2` int NOT NULL,
  `totalGenService2` int NOT NULL,
  `totalConsumption2` int NOT NULL,
  `totalNSC3` int NOT NULL,
  `totalProd3` int NOT NULL,
  `totalMeterMaintenance3` int NOT NULL,
  `totalSpecialProj3` int NOT NULL,
  `totalConstruction3` int NOT NULL,
  `totalCommercial3` int NOT NULL,
  `totalSales3` int NOT NULL,
  `totalGenService3` int NOT NULL,
  `totalConsumption3` int NOT NULL,
  `totalNSC4` int NOT NULL,
  `totalProd4` int NOT NULL,
  `totalMeterMaintenance4` int NOT NULL,
  `totalSpecialProj4` int NOT NULL,
  `totalConstruction4` int NOT NULL,
  `totalCommercial4` int NOT NULL,
  `totalSales4` int NOT NULL,
  `totalGenService4` int NOT NULL,
  `totalConsumption4` int NOT NULL,
  `totalNSC5` int NOT NULL,
  `totalProd5` int NOT NULL,
  `totalMeterMaintenance5` int NOT NULL,
  `totalSpecialProj5` int NOT NULL,
  `totalConstruction5` int NOT NULL,
  `totalCommercial5` int NOT NULL,
  `totalSales5` int NOT NULL,
  `totalGenService5` int NOT NULL,
  `totalConsumption5` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `ims_monthlyconsumptiontotal` VALUES (1, 0, -5100, 0, 0, 0, 0, 0, 0, -5100, 0, -5100, 0, 0, 0, 0, 0, 0, -5100, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '2025-03-07 05:34:10', '2025-03-07 05:43:43');

CREATE TABLE `ims_purpose` (
  `purposeID` int NOT NULL AUTO_INCREMENT,
  `purposeName` varchar(500) NOT NULL,
  PRIMARY KEY (`purposeID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `ims_purpose` VALUES (1, 'N/A');
INSERT INTO `ims_purpose` VALUES (2, 'Construction');
INSERT INTO `ims_purpose` VALUES (3, 'Disconnection');
INSERT INTO `ims_purpose` VALUES (4, 'New Service Connection');
INSERT INTO `ims_purpose` VALUES (5, 'Project');
INSERT INTO `ims_purpose` VALUES (6, 'Repairs and Maintenance');
INSERT INTO `ims_purpose` VALUES (7, 'Transfer,Defective');
INSERT INTO `ims_purpose` VALUES (8, 'Re-connect');
INSERT INTO `ims_purpose` VALUES (9, 'Physical Count Adjustment');
INSERT INTO `ims_purpose` VALUES (10, 'Sales');
INSERT INTO `ims_purpose` VALUES (11, 'Repair of Service Vehicle');

CREATE TABLE `ims_runningbalance` (
  `runningBalID` int NOT NULL AUTO_INCREMENT,
  `itemName` varchar(500) NOT NULL,
  `itemQuantity` int NOT NULL,
  `beginningBalance` int NOT NULL,
  `purchasedFromSupp` int NOT NULL,
  `returnToSupplier` int NOT NULL,
  `transferFromWH` int NOT NULL,
  `transferToWH` int NOT NULL,
  `issuedQty` int NOT NULL,
  `returnedQty` int NOT NULL,
  `consumption` int NOT NULL,
  `unitCost` double NOT NULL,
  `totalCost` decimal(10,2) DEFAULT NULL,
  `remarks` varchar(100) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `itemID_id` varchar(20) NOT NULL,
  `measurementID_id` int NOT NULL,
  PRIMARY KEY (`runningBalID`),
  KEY `ims_runningbalance_itemID_id_3b702268_fk_ims_item_itemID` (`itemID_id`),
  KEY `ims_runningbalance_measurementID_id_b265a0b8_fk_ims_measu` (`measurementID_id`),
  CONSTRAINT `ims_runningbalance_itemID_id_3b702268_fk_ims_item_itemID` FOREIGN KEY (`itemID_id`) REFERENCES `ims_item` (`itemID`),
  CONSTRAINT `ims_runningbalance_measurementID_id_b265a0b8_fk_ims_measu` FOREIGN KEY (`measurementID_id`) REFERENCES `ims_measurement` (`measurementID`)
) ENGINE=InnoDB AUTO_INCREMENT=771 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `ims_runningbalance` VALUES (2, 'Chlorine Dioxide - Liquid', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '01-001', 22);
INSERT INTO `ims_runningbalance` VALUES (4, 'Chlorine Dioxide - Powder', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '01-002', 9);
INSERT INTO `ims_runningbalance` VALUES (6, 'Chlorine Granules', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '01-003', 9);
INSERT INTO `ims_runningbalance` VALUES (8, 'Asphalt', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '02-001', 10);
INSERT INTO `ims_runningbalance` VALUES (10, 'Cement- RIZAL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '02-002', 4);
INSERT INTO `ims_runningbalance` VALUES (12, 'Gravel', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '02-003', 19);
INSERT INTO `ims_runningbalance` VALUES (14, 'White Sand', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '02-004', 19);
INSERT INTO `ims_runningbalance` VALUES (16, 'Concrete Hollow Blocks', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '02-005', 1);
INSERT INTO `ims_runningbalance` VALUES (18, 'Flexible Hose- Flexible Oppo', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '02-006', 15);
INSERT INTO `ims_runningbalance` VALUES (20, 'C-Clamp PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '02-007', 19);
INSERT INTO `ims_runningbalance` VALUES (22, 'THHN 14" - BOSTON', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '02-008', 19);
INSERT INTO `ims_runningbalance` VALUES (24, 'FI Hose 1/2 x 1/2 x 24', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '02-009', 19);
INSERT INTO `ims_runningbalance` VALUES (26, 'Flexible Hose 1/2 X 50 - OMEGA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '02-010', 20);
INSERT INTO `ims_runningbalance` VALUES (28, 'Flexible Hose 3/8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '02-011', 19);
INSERT INTO `ims_runningbalance` VALUES (30, 'Skim Coat- ABC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '02-012', 19);
INSERT INTO `ims_runningbalance` VALUES (32, 'Angle Valve 1/2 x 3/8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '02-013', 19);
INSERT INTO `ims_runningbalance` VALUES (34, 'Angle Valve 1/2 x 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '02-014', 19);
INSERT INTO `ims_runningbalance` VALUES (36, 'Angle Valve 1/2 x 3/4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '02-015', 19);
INSERT INTO `ims_runningbalance` VALUES (38, 'C Purlins 2x3 GI 1.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:38', '2025-03-07 05:35:38', '02-016', 19);
INSERT INTO `ims_runningbalance` VALUES (39, 'Angel Bar 4.5mm x 2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-017', 19);
INSERT INTO `ims_runningbalance` VALUES (40, 'Goose Neck Faucet- SUNRISE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-018', 19);
INSERT INTO `ims_runningbalance` VALUES (41, 'Lavatory Valve', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-019', 19);
INSERT INTO `ims_runningbalance` VALUES (42, 'Faucet Brass hose Bibb- HAWK', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-020', 19);
INSERT INTO `ims_runningbalance` VALUES (43, 'Two-Way Faucet Valve', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-021', 19);
INSERT INTO `ims_runningbalance` VALUES (44, 'Lavatory Faucet', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-022', 19);
INSERT INTO `ims_runningbalance` VALUES (45, 'Diamond Cutting Disc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-023', 19);
INSERT INTO `ims_runningbalance` VALUES (46, 'Cable Tie 6 x 2mm - POWER HOUSE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-024', 16);
INSERT INTO `ims_runningbalance` VALUES (47, 'Padlock - Hardware', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-025', 19);
INSERT INTO `ims_runningbalance` VALUES (48, 'Hardiflex 3/16 - JAMES HARDI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-026', 19);
INSERT INTO `ims_runningbalance` VALUES (49, 'Two Gang Outlet - ROYU', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-027', 19);
INSERT INTO `ims_runningbalance` VALUES (50, 'Hook', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-028', 19);
INSERT INTO `ims_runningbalance` VALUES (51, 'Aluminum Silver (PAINT)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-029', 19);
INSERT INTO `ims_runningbalance` VALUES (52, 'Welding Rod 6013 Special- LOCAL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-030', 11);
INSERT INTO `ims_runningbalance` VALUES (53, 'Tie Wire', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-031', 11);
INSERT INTO `ims_runningbalance` VALUES (54, 'Bosny Black- Pylox', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-032', 8);
INSERT INTO `ims_runningbalance` VALUES (55, 'Electrical Tape- BIG Armak', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-033', 19);
INSERT INTO `ims_runningbalance` VALUES (56, 'Masking Tape 3/4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-034', 19);
INSERT INTO `ims_runningbalance` VALUES (57, 'Regular Plug', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-035', 19);
INSERT INTO `ims_runningbalance` VALUES (58, 'Three Gang Outlet', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-036', 19);
INSERT INTO `ims_runningbalance` VALUES (59, 'Marine Ply Wood - 3/4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-037', 19);
INSERT INTO `ims_runningbalance` VALUES (60, 'Barateha', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-038', 19);
INSERT INTO `ims_runningbalance` VALUES (61, 'Piano Hinges', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-039', 19);
INSERT INTO `ims_runningbalance` VALUES (62, 'Concrete Nail 1 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-040', 11);
INSERT INTO `ims_runningbalance` VALUES (63, 'Stikwel - Wood Glue', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-041', 12);
INSERT INTO `ims_runningbalance` VALUES (64, 'Cabinet Handle', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-042', 19);
INSERT INTO `ims_runningbalance` VALUES (65, 'Thalo blue - Acrylic', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-043', 12);
INSERT INTO `ims_runningbalance` VALUES (66, 'THHN 12" - BOSTON', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-044', 5);
INSERT INTO `ims_runningbalance` VALUES (67, 'THNN 14 - BOSTON', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-045', 5);
INSERT INTO `ims_runningbalance` VALUES (68, 'BLIND RIVITS 1/8 X 3/4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-046', 5);
INSERT INTO `ims_runningbalance` VALUES (69, 'Cement spoon', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-047', 19);
INSERT INTO `ims_runningbalance` VALUES (70, 'Tubular 1 x 1 1.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-048', 19);
INSERT INTO `ims_runningbalance` VALUES (71, 'Cylindrical Hinges 3/4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-049', 19);
INSERT INTO `ims_runningbalance` VALUES (72, 'Door Knob', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-050', 19);
INSERT INTO `ims_runningbalance` VALUES (73, 'Deform Bar - 10mm', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:39', '2025-03-07 05:35:39', '02-051', 19);
INSERT INTO `ims_runningbalance` VALUES (74, 'PVC Door 60 x 210 w/ Hinges', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-052', 19);
INSERT INTO `ims_runningbalance` VALUES (75, 'Blue Clamp 1/2 - Hardware', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-053', 19);
INSERT INTO `ims_runningbalance` VALUES (76, 'Solignum- All aroud', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-054', 12);
INSERT INTO `ims_runningbalance` VALUES (77, 'Liha - 1000 & 100', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-055', 19);
INSERT INTO `ims_runningbalance` VALUES (78, 'Tansi', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-056', 20);
INSERT INTO `ims_runningbalance` VALUES (79, 'Drill bit 5/16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-057', 19);
INSERT INTO `ims_runningbalance` VALUES (80, 'Chalk stone', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-058', 19);
INSERT INTO `ims_runningbalance` VALUES (81, 'Epoxy primer', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-059', 12);
INSERT INTO `ims_runningbalance` VALUES (82, 'Latex Gloss - Paint', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-060', 12);
INSERT INTO `ims_runningbalance` VALUES (83, 'Sahara- ( water proofing )', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-061', 19);
INSERT INTO `ims_runningbalance` VALUES (84, 'Singer Oil', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-062', 19);
INSERT INTO `ims_runningbalance` VALUES (85, 'Varnish', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-063', 12);
INSERT INTO `ims_runningbalance` VALUES (86, 'Rust Converter', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-064', 19);
INSERT INTO `ims_runningbalance` VALUES (87, 'WD - 40', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-065', 19);
INSERT INTO `ims_runningbalance` VALUES (88, 'Tape Measure', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-066', 19);
INSERT INTO `ims_runningbalance` VALUES (89, 'C. Clamp 3/4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-067', 19);
INSERT INTO `ims_runningbalance` VALUES (90, 'C. Clamp 1"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-068', 19);
INSERT INTO `ims_runningbalance` VALUES (91, 'Single Switch', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-069', 19);
INSERT INTO `ims_runningbalance` VALUES (92, 'Receptacle 4 x 4 - omni', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-070', 19);
INSERT INTO `ims_runningbalance` VALUES (93, 'Junction Box 4 x 4 - pvc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-071', 19);
INSERT INTO `ims_runningbalance` VALUES (94, 'Utility Box 2 x 4 - pvc  - ROYU', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-072', 19);
INSERT INTO `ims_runningbalance` VALUES (95, '1 Gang Switch- Panasonic', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-073', 21);
INSERT INTO `ims_runningbalance` VALUES (96, '2 Gang Switch- Royu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-074', 21);
INSERT INTO `ims_runningbalance` VALUES (97, 'Flat Hose 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-075', 20);
INSERT INTO `ims_runningbalance` VALUES (98, '2 Gang Outlet- Panasonic', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-076', 21);
INSERT INTO `ims_runningbalance` VALUES (99, 'Blind Rivits 5/32 x 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-077', 5);
INSERT INTO `ims_runningbalance` VALUES (100, 'Bathroom Bidet-  SUNRISE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-078', 21);
INSERT INTO `ims_runningbalance` VALUES (101, 'Concrete nail #2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-079', 11);
INSERT INTO `ims_runningbalance` VALUES (102, 'Concrete nail #3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-080', 11);
INSERT INTO `ims_runningbalance` VALUES (103, 'Tek screw 1 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-081', 19);
INSERT INTO `ims_runningbalance` VALUES (104, 'Hand Riveter', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-082', 19);
INSERT INTO `ims_runningbalance` VALUES (105, 'Tank Lever Flush', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-083', 19);
INSERT INTO `ims_runningbalance` VALUES (106, 'Tank Fittings', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-084', 21);
INSERT INTO `ims_runningbalance` VALUES (107, 'Electrical PVC Pipe 1/2 - (Orange)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-085', 19);
INSERT INTO `ims_runningbalance` VALUES (108, 'PVC Pipe 4" ( Orange )', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:40', '2025-03-07 05:35:40', '02-086', 19);
INSERT INTO `ims_runningbalance` VALUES (109, 'Elbow  4" ( Orange )', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-087', 19);
INSERT INTO `ims_runningbalance` VALUES (110, 'Clean Out Cover 4" pvc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-088', 19);
INSERT INTO `ims_runningbalance` VALUES (111, 'Pollituff', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-089', 12);
INSERT INTO `ims_runningbalance` VALUES (112, 'Hardener Cream', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-090', 19);
INSERT INTO `ims_runningbalance` VALUES (113, 'Submeter', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-091', 19);
INSERT INTO `ims_runningbalance` VALUES (114, 'Expansion Bolt 3/5 x 3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-092', 19);
INSERT INTO `ims_runningbalance` VALUES (115, 'Hinges 3 x 3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-093', 19);
INSERT INTO `ims_runningbalance` VALUES (116, 'Plug Adapter', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-094', 19);
INSERT INTO `ims_runningbalance` VALUES (117, 'Grinding Disc- For Finishing', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-095', 19);
INSERT INTO `ims_runningbalance` VALUES (118, 'Spatula', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-096', 19);
INSERT INTO `ims_runningbalance` VALUES (119, 'Wall Scrapper - (Paleta)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-097', 19);
INSERT INTO `ims_runningbalance` VALUES (120, 'Blind Rivits  1/8 x 1/2 - LOCAL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-098', 5);
INSERT INTO `ims_runningbalance` VALUES (121, 'Gunting ng Yero', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-099', 19);
INSERT INTO `ims_runningbalance` VALUES (122, 'Paint Remover', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-100', 19);
INSERT INTO `ims_runningbalance` VALUES (123, 'Rugby', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-101', 6);
INSERT INTO `ims_runningbalance` VALUES (124, 'Rodela - Bakal', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-102', 19);
INSERT INTO `ims_runningbalance` VALUES (125, 'Rodela - Kahoy', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-103', 19);
INSERT INTO `ims_runningbalance` VALUES (126, 'Elasto Seal - water proofing sealant', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-104', 19);
INSERT INTO `ims_runningbalance` VALUES (127, 'Rope', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-105', 14);
INSERT INTO `ims_runningbalance` VALUES (128, 'Circuit Breaker - 60A PLUG IN- GE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-106', 19);
INSERT INTO `ims_runningbalance` VALUES (129, 'Toks screw', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-107', 19);
INSERT INTO `ims_runningbalance` VALUES (130, 'Elbow 2" Orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-108', 19);
INSERT INTO `ims_runningbalance` VALUES (131, 'PVC 2" Orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-109', 19);
INSERT INTO `ims_runningbalance` VALUES (132, 'Square Bar 10mm', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-110', 19);
INSERT INTO `ims_runningbalance` VALUES (133, 'Sealant', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-111', 19);
INSERT INTO `ims_runningbalance` VALUES (134, 'Faucet - 6"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-112', 19);
INSERT INTO `ims_runningbalance` VALUES (135, 'C. Clamp 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-113', 19);
INSERT INTO `ims_runningbalance` VALUES (136, 'Cocolumber 2 x 3 x 12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-114', 19);
INSERT INTO `ims_runningbalance` VALUES (137, 'Flat Cord #14', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-115', 14);
INSERT INTO `ims_runningbalance` VALUES (138, 'Common Nail #3- LOCAL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-116', 11);
INSERT INTO `ims_runningbalance` VALUES (139, 'Common Nail #2- LOCAL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-117', 11);
INSERT INTO `ims_runningbalance` VALUES (140, 'Umbrella Nail', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-118', 11);
INSERT INTO `ims_runningbalance` VALUES (141, 'PVC Elbow 3/4 - Orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-119', 19);
INSERT INTO `ims_runningbalance` VALUES (142, 'PVC Pipe 3/4- Orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:41', '2025-03-07 05:35:41', '02-120', 19);
INSERT INTO `ims_runningbalance` VALUES (143, 'PVC Pipe 2" Orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-121', 19);
INSERT INTO `ims_runningbalance` VALUES (144, 'PVC Pipe 3" Orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-122', 19);
INSERT INTO `ims_runningbalance` VALUES (145, 'P- Trap 2" Orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-123', 19);
INSERT INTO `ims_runningbalance` VALUES (146, 'Tee 2" Orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-124', 19);
INSERT INTO `ims_runningbalance` VALUES (147, 'Elbow 3" Orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-125', 19);
INSERT INTO `ims_runningbalance` VALUES (148, 'PVC- Y 3 x 2 -Orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-126', 19);
INSERT INTO `ims_runningbalance` VALUES (149, 'Clean Out Cover 3" pvc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-127', 19);
INSERT INTO `ims_runningbalance` VALUES (150, 'Kiln Dry Wood- 1 1/2 x 2 x 12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-128', 19);
INSERT INTO `ims_runningbalance` VALUES (151, 'Kiln Dry Wood- 1/2 x 2 x 12', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-129', 19);
INSERT INTO `ims_runningbalance` VALUES (152, 'Flat Disc', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-130', 19);
INSERT INTO `ims_runningbalance` VALUES (153, 'Flat Nail 1"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-131', 11);
INSERT INTO `ims_runningbalance` VALUES (154, 'Flat Nail 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-132', 11);
INSERT INTO `ims_runningbalance` VALUES (155, 'Tile Trim', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-133', 19);
INSERT INTO `ims_runningbalance` VALUES (156, 'Kitchen Sink', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-134', 19);
INSERT INTO `ims_runningbalance` VALUES (157, 'PMR Strainer', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-135', 19);
INSERT INTO `ims_runningbalance` VALUES (158, 'Flex Hose - 1/2 x 16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-136', 19);
INSERT INTO `ims_runningbalance` VALUES (159, 'Vulca Seal - BOSTIK', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-137', 12);
INSERT INTO `ims_runningbalance` VALUES (160, 'Metal Furring 0.5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-138', 19);
INSERT INTO `ims_runningbalance` VALUES (161, 'QDE Enamel white', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-139', 2);
INSERT INTO `ims_runningbalance` VALUES (162, 'Hamba 80 x 210', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-140', 19);
INSERT INTO `ims_runningbalance` VALUES (163, 'Garden Hose 5/8- EXCEL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-141', 14);
INSERT INTO `ims_runningbalance` VALUES (164, 'Hose- connector', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-142', 18);
INSERT INTO `ims_runningbalance` VALUES (165, 'PVC Pipe 1" -Orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-143', 18);
INSERT INTO `ims_runningbalance` VALUES (166, 'PVC  Elbow 1" -Orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-144', 18);
INSERT INTO `ims_runningbalance` VALUES (167, 'PVC  Male Adaptor 1" -Orange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-145', 18);
INSERT INTO `ims_runningbalance` VALUES (168, 'LED Light 15W - OMNI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-146', 18);
INSERT INTO `ims_runningbalance` VALUES (169, 'Baby Roller 4"- JUPITER', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-147', 18);
INSERT INTO `ims_runningbalance` VALUES (170, 'Screw Bit', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-148', 18);
INSERT INTO `ims_runningbalance` VALUES (171, 'End cap 1/2 PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-149', 18);
INSERT INTO `ims_runningbalance` VALUES (172, 'Toilet Bowl', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-150', 18);
INSERT INTO `ims_runningbalance` VALUES (173, 'Cylindrical Hinges 1"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-151', 18);
INSERT INTO `ims_runningbalance` VALUES (174, 'Cylindrical Hinges 1/2"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-152', 18);
INSERT INTO `ims_runningbalance` VALUES (175, 'Blind Rivet 3/16 x 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:42', '2025-03-07 05:35:42', '02-153', 5);
INSERT INTO `ims_runningbalance` VALUES (176, 'Universal Padlock -ACE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-154', 19);
INSERT INTO `ims_runningbalance` VALUES (177, 'Sand Paper', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-155', 7);
INSERT INTO `ims_runningbalance` VALUES (178, 'Squala', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-156', 19);
INSERT INTO `ims_runningbalance` VALUES (179, 'Hose Bibb Faucet', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-157', 19);
INSERT INTO `ims_runningbalance` VALUES (180, 'Flexi Bond', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-158', 2);
INSERT INTO `ims_runningbalance` VALUES (181, 'Paint Thinner- PUREE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-159', 12);
INSERT INTO `ims_runningbalance` VALUES (182, 'Rubber Tape', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-160', 19);
INSERT INTO `ims_runningbalance` VALUES (183, 'Paint brush #2- HIPO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-161', 19);
INSERT INTO `ims_runningbalance` VALUES (184, 'Drill bit 1/8 - DOORMER', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-162', 19);
INSERT INTO `ims_runningbalance` VALUES (185, 'Pipe 3/4 x 20 GI schd.40', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-163', 19);
INSERT INTO `ims_runningbalance` VALUES (186, 'Circuit Breaker - 30 A PLUG IN- GE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-164', 19);
INSERT INTO `ims_runningbalance` VALUES (187, 'AC - Outlet', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-165', 19);
INSERT INTO `ims_runningbalance` VALUES (188, 'Black Screw', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-166', 19);
INSERT INTO `ims_runningbalance` VALUES (189, 'Insulation Foam', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-167', 14);
INSERT INTO `ims_runningbalance` VALUES (190, 'Metal Furring 0.6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-168', 19);
INSERT INTO `ims_runningbalance` VALUES (191, '3 Gang Switch - Royu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-169', 19);
INSERT INTO `ims_runningbalance` VALUES (192, 'Universal Outlet - Royu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-170', 19);
INSERT INTO `ims_runningbalance` VALUES (193, '2 Gang- Royu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-171', 19);
INSERT INTO `ims_runningbalance` VALUES (194, '3 Gang- Royu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-172', 21);
INSERT INTO `ims_runningbalance` VALUES (195, 'National Universal Outlet', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-173', 19);
INSERT INTO `ims_runningbalance` VALUES (196, 'National Outlet Classic', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-174', 19);
INSERT INTO `ims_runningbalance` VALUES (197, 'Phenolic Board 3/4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-175', 19);
INSERT INTO `ims_runningbalance` VALUES (198, 'Lag Screw 3/1 x 13', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-176', 19);
INSERT INTO `ims_runningbalance` VALUES (199, 'Sanding Sealer Lacquer', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-177', 2);
INSERT INTO `ims_runningbalance` VALUES (200, 'Paint Brush #1- HIPO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-178', 19);
INSERT INTO `ims_runningbalance` VALUES (201, 'Metal Screw', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-179', 19);
INSERT INTO `ims_runningbalance` VALUES (202, 'Mini Roller - Refill', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-180', 19);
INSERT INTO `ims_runningbalance` VALUES (203, 'Electrode Holder- 300amps', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-181', 19);
INSERT INTO `ims_runningbalance` VALUES (204, 'Sand Paper - #120', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-182', 19);
INSERT INTO `ims_runningbalance` VALUES (205, 'Steel Brush', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-183', 19);
INSERT INTO `ims_runningbalance` VALUES (206, 'Concrete Nail #4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-184', 11);
INSERT INTO `ims_runningbalance` VALUES (207, 'QDE black- Paint', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-185', 13);
INSERT INTO `ims_runningbalance` VALUES (208, 'Panel Box - 4 hole 2x2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-186', 18);
INSERT INTO `ims_runningbalance` VALUES (209, 'Circuit Breaker - 20 A PLUG IN- GE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-187', 18);
INSERT INTO `ims_runningbalance` VALUES (210, 'Drill Bit 5/32', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:43', '2025-03-07 05:35:43', '02-188', 18);
INSERT INTO `ims_runningbalance` VALUES (211, 'Concrete Nail - # 1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-189', 11);
INSERT INTO `ims_runningbalance` VALUES (212, 'Mesh Tape / Gasa', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-190', 20);
INSERT INTO `ims_runningbalance` VALUES (213, 'Adhesive - Cement - ABC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-191', 3);
INSERT INTO `ims_runningbalance` VALUES (214, 'QDE - Maple', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-192', 13);
INSERT INTO `ims_runningbalance` VALUES (215, 'Angle Valve - 1/2 ( 3 way )', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-193', 19);
INSERT INTO `ims_runningbalance` VALUES (216, 'Bolt and Nut - 10mm x 2 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-194', 19);
INSERT INTO `ims_runningbalance` VALUES (217, 'Drill Bit- 1/4 (concrete)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-195', 19);
INSERT INTO `ims_runningbalance` VALUES (218, 'Drill Bit- 3/16 (concrete)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-196', 19);
INSERT INTO `ims_runningbalance` VALUES (219, 'Screw w/ Tox - 3/16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-197', 19);
INSERT INTO `ims_runningbalance` VALUES (220, 'Flexible Hose - 1/2 x 1/2 x 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-198', 19);
INSERT INTO `ims_runningbalance` VALUES (221, 'Spring Door', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-199', 19);
INSERT INTO `ims_runningbalance` VALUES (222, 'Flexible Hose - 1/2 x 1/2 x 1/8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-200', 19);
INSERT INTO `ims_runningbalance` VALUES (223, 'Lavatory Bracket', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-201', 19);
INSERT INTO `ims_runningbalance` VALUES (224, 'Lavatory Fittings', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-202', 21);
INSERT INTO `ims_runningbalance` VALUES (225, 'Dyna Bolt 5/16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-203', 19);
INSERT INTO `ims_runningbalance` VALUES (226, 'Terminal Battery', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-204', 19);
INSERT INTO `ims_runningbalance` VALUES (227, 'Moulding Strips-  3/4- ATLANTA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-205', 19);
INSERT INTO `ims_runningbalance` VALUES (228, 'Atlanta PVC type - 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-206', 19);
INSERT INTO `ims_runningbalance` VALUES (229, 'Screw - #1', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-207', 19);
INSERT INTO `ims_runningbalance` VALUES (230, 'Amco Box Outlet', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-208', 19);
INSERT INTO `ims_runningbalance` VALUES (231, 'Plug In - 30 Amp', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-209', 19);
INSERT INTO `ims_runningbalance` VALUES (232, 'Duct Tape', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-210', 19);
INSERT INTO `ims_runningbalance` VALUES (233, 'Cutter Blade - hardware', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-211', 21);
INSERT INTO `ims_runningbalance` VALUES (234, 'Paint Tray', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-212', 19);
INSERT INTO `ims_runningbalance` VALUES (235, 'Half moon Wood', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-213', 19);
INSERT INTO `ims_runningbalance` VALUES (236, 'Junction Box 4 x 2 - pvc - OMNI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-214', 19);
INSERT INTO `ims_runningbalance` VALUES (237, 'Pinlight Fixture Alum- AKARI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-215', 19);
INSERT INTO `ims_runningbalance` VALUES (238, 'LED Light- 9w -FIREFLY', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-216', 19);
INSERT INTO `ims_runningbalance` VALUES (239, 'LED Ceiling Lamp Surface Type- 18w - OMNI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-217', 19);
INSERT INTO `ims_runningbalance` VALUES (240, '2 Gang Switch- PANASONIC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-218', 19);
INSERT INTO `ims_runningbalance` VALUES (241, '1 Gang 3 way Switch- PANASONIC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-219', 19);
INSERT INTO `ims_runningbalance` VALUES (242, '3 Gang Switch- PANASONIC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-220', 19);
INSERT INTO `ims_runningbalance` VALUES (243, 'Faucet Stainless - WATERGATE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-221', 19);
INSERT INTO `ims_runningbalance` VALUES (244, 'Faucet Brass - Gold -  WATERGATE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:44', '2025-03-07 05:35:44', '02-222', 19);
INSERT INTO `ims_runningbalance` VALUES (245, 'Junction Box Cover - OMNI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-223', 19);
INSERT INTO `ims_runningbalance` VALUES (246, 'Hinges 35 x 35 x 2- GATEMAN', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-224', 19);
INSERT INTO `ims_runningbalance` VALUES (247, 'Circuit breaker 60A bolt-On - GE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-225', 19);
INSERT INTO `ims_runningbalance` VALUES (248, 'Faucet hose bib white PVC - DOWEL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-226', 19);
INSERT INTO `ims_runningbalance` VALUES (249, 'Hose Clamp 5/8 -', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-227', 19);
INSERT INTO `ims_runningbalance` VALUES (250, 'Angle Bar 5.0mm x 1 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-228', 19);
INSERT INTO `ims_runningbalance` VALUES (251, 'TILE 60 X 60 AK 6882', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-229', 19);
INSERT INTO `ims_runningbalance` VALUES (252, 'TILE 60 X 60 AK 6889', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-230', 19);
INSERT INTO `ims_runningbalance` VALUES (253, 'ALUM. Door Brown', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-231', 19);
INSERT INTO `ims_runningbalance` VALUES (254, 'MJ Water Closet', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-232', 19);
INSERT INTO `ims_runningbalance` VALUES (255, 'Grout White', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-233', 3);
INSERT INTO `ims_runningbalance` VALUES (256, 'TILE 60 x 60 FC 6013', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-234', 19);
INSERT INTO `ims_runningbalance` VALUES (257, 'Rib type 05.mm x 3.66m', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-235', 19);
INSERT INTO `ims_runningbalance` VALUES (258, 'Rib type 05.mm x 3.05m', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-236', 19);
INSERT INTO `ims_runningbalance` VALUES (259, 'Rib type 05.mm x 6.10m', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-237', 19);
INSERT INTO `ims_runningbalance` VALUES (260, 'Tek screw 12 x 55 steel', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-238', 19);
INSERT INTO `ims_runningbalance` VALUES (261, 'Panel Door 80 x 200  jamb 2 x 5 kd w/ holes', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-239', 21);
INSERT INTO `ims_runningbalance` VALUES (262, 'Ply Wood  ORDINARY 1/2- LOCAL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-240', 19);
INSERT INTO `ims_runningbalance` VALUES (263, 'Cocolumber 2 x 2 x 10FT- LOCAL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-241', 19);
INSERT INTO `ims_runningbalance` VALUES (264, 'G.I. Wire #16', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-242', 11);
INSERT INTO `ims_runningbalance` VALUES (265, 'Flat latex White - BOYSEN 30f - 100m', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-243', 17);
INSERT INTO `ims_runningbalance` VALUES (266, 'Flat latex White -MENNISOTA 30f - 100m', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-244', 17);
INSERT INTO `ims_runningbalance` VALUES (267, 'Flat latex White - COAT SAVER (solo88)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-245', 17);
INSERT INTO `ims_runningbalance` VALUES (268, 'Latex Gloss White- COAT SAVER (solo99)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-246', 17);
INSERT INTO `ims_runningbalance` VALUES (269, 'Roofing Paint Blue- RAIN OR SHINE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-247', 17);
INSERT INTO `ims_runningbalance` VALUES (270, 'Acry Color Raw Sienna -DESTINY', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-248', 8);
INSERT INTO `ims_runningbalance` VALUES (271, 'Ting Ting Color Thalo Blue #16- DESTINY', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-249', 8);
INSERT INTO `ims_runningbalance` VALUES (272, 'Ting Ting Color Thalo Blue - BOYSEN (B2306)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-250', 8);
INSERT INTO `ims_runningbalance` VALUES (273, 'Pylox Spray Paint Sky Blue', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-251', 8);
INSERT INTO `ims_runningbalance` VALUES (274, 'Pylox Spray Paint Silver', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-252', 8);
INSERT INTO `ims_runningbalance` VALUES (275, 'Spray Paint Pearl White- SAMURAI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-253', 8);
INSERT INTO `ims_runningbalance` VALUES (276, 'Spray Paint Gloss Black- BOSNY', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-254', 2);
INSERT INTO `ims_runningbalance` VALUES (277, 'Spray Paint Light Sky Blue- NIPPON', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:45', '2025-03-07 05:35:45', '02-255', 2);
INSERT INTO `ims_runningbalance` VALUES (278, 'Laquer Thinner- PUREE 3Ltr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-256', 2);
INSERT INTO `ims_runningbalance` VALUES (279, 'Paint Thinner- LESCO 3Ltr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-257', 2);
INSERT INTO `ims_runningbalance` VALUES (280, 'QDE - Yellow - SALAMAT BRO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-258', 2);
INSERT INTO `ims_runningbalance` VALUES (281, 'QDE - Yellow - TKO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-259', 2);
INSERT INTO `ims_runningbalance` VALUES (282, 'Prolux Glazing Putty White- DAVIES', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-260', 2);
INSERT INTO `ims_runningbalance` VALUES (283, 'Butterfly Paint Brush - 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-261', 19);
INSERT INTO `ims_runningbalance` VALUES (284, 'Fan Club Paint Brush - 1"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-262', 19);
INSERT INTO `ims_runningbalance` VALUES (285, 'Fan Club Paint Brush - 2"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-263', 19);
INSERT INTO `ims_runningbalance` VALUES (286, 'Butterfly Paint Brush - 3"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-264', 19);
INSERT INTO `ims_runningbalance` VALUES (287, 'Butterfly Paint Brush - 4"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-265', 19);
INSERT INTO `ims_runningbalance` VALUES (288, 'Acrylon Paint Roller - 7"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-266', 19);
INSERT INTO `ims_runningbalance` VALUES (289, 'QDE- Black -DOMINO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-267', 2);
INSERT INTO `ims_runningbalance` VALUES (290, 'GreenField Floodlight LED 50w', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-268', 19);
INSERT INTO `ims_runningbalance` VALUES (291, 'Flat White 16Ltrs. SINCLAIR', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-269', 17);
INSERT INTO `ims_runningbalance` VALUES (292, 'Pylox Spray Paint Heat Black', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-270', 8);
INSERT INTO `ims_runningbalance` VALUES (293, 'Build Rite Metal Primer Red Oxide -3ltr', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-271', 2);
INSERT INTO `ims_runningbalance` VALUES (294, 'Epoxy Reducer- PUREE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-272', 2);
INSERT INTO `ims_runningbalance` VALUES (295, 'Laquer Flow- PUREE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-273', 2);
INSERT INTO `ims_runningbalance` VALUES (296, 'Permacoat Gloss White B710- BOYSEN', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-274', 17);
INSERT INTO `ims_runningbalance` VALUES (297, 'Fast Dry Enamel White NS950- NATION', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-275', 2);
INSERT INTO `ims_runningbalance` VALUES (298, 'Exhaust Fan- OMNI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-276', 19);
INSERT INTO `ims_runningbalance` VALUES (299, 'Yellow -RAIN OR SHINE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-277', 2);
INSERT INTO `ims_runningbalance` VALUES (300, 'Royal Blue- RAIN OR SHINE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-278', 2);
INSERT INTO `ims_runningbalance` VALUES (301, 'Door Closer- Lotus Tubular', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-279', 19);
INSERT INTO `ims_runningbalance` VALUES (302, 'QDE- White -BOYSEN', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-280', 2);
INSERT INTO `ims_runningbalance` VALUES (303, 'PANEL BOARD 6 HOLES PLUG IN- AMERICA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-281', 18);
INSERT INTO `ims_runningbalance` VALUES (304, 'Flat Gloss- BOYSEN', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-282', 17);
INSERT INTO `ims_runningbalance` VALUES (305, 'QDE WHITE- BOYSEN (pail)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-283', 17);
INSERT INTO `ims_runningbalance` VALUES (306, 'Ting ting Color Thalo Blue- BOYSEN', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-284', 12);
INSERT INTO `ims_runningbalance` VALUES (307, 'Guilder Epoxy primer Gray- BOYSEN', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-285', 2);
INSERT INTO `ims_runningbalance` VALUES (308, 'Acry Color Raw Sienna -BOYSEN', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-286', 8);
INSERT INTO `ims_runningbalance` VALUES (309, 'Acry Color Thalo Blue- BOYSEN', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-287', 8);
INSERT INTO `ims_runningbalance` VALUES (310, 'Roller Brush w/h 2b -ACRYLON', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-288', 19);
INSERT INTO `ims_runningbalance` VALUES (311, 'Baby Roller w/o- OMEGA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:46', '2025-03-07 05:35:46', '02-289', 19);
INSERT INTO `ims_runningbalance` VALUES (312, 'Zimcoat Skimcoat', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-290', 3);
INSERT INTO `ims_runningbalance` VALUES (313, 'DIB Cable Tie 100pcs 7 in BLACK', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-291', 16);
INSERT INTO `ims_runningbalance` VALUES (314, 'Deform Bar - 16mm', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-292', 19);
INSERT INTO `ims_runningbalance` VALUES (315, '1/4 Thick Plastic Acrylic 4 x 8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-293', 19);
INSERT INTO `ims_runningbalance` VALUES (316, 'Anzahl Anti Corrosion', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-294', 12);
INSERT INTO `ims_runningbalance` VALUES (317, 'Anzahl Surfacer Primer', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-295', 12);
INSERT INTO `ims_runningbalance` VALUES (318, 'Anzahl White w/ Catalest', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-296', 2);
INSERT INTO `ims_runningbalance` VALUES (319, 'Urethane Thinner', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-297', 2);
INSERT INTO `ims_runningbalance` VALUES (320, 'Body Filler W/ Hardener', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-298', 2);
INSERT INTO `ims_runningbalance` VALUES (321, 'Sand Paper #100', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-299', 19);
INSERT INTO `ims_runningbalance` VALUES (322, 'Sand Paper 120" 400" 1200', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-300', 19);
INSERT INTO `ims_runningbalance` VALUES (323, 'Tiles 60 x 60 fc 6013', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-301', 19);
INSERT INTO `ims_runningbalance` VALUES (324, 'Tiles 60 x 60 fc 6889', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-302', 19);
INSERT INTO `ims_runningbalance` VALUES (325, 'Tiles 60 x 60 ak 6882', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-303', 19);
INSERT INTO `ims_runningbalance` VALUES (326, 'Tiles 60 x 60 ak 6888', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-304', 19);
INSERT INTO `ims_runningbalance` VALUES (327, 'MJ Water Closet bowl', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-305', 19);
INSERT INTO `ims_runningbalance` VALUES (328, 'Cable Tie 6x300', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-306', 16);
INSERT INTO `ims_runningbalance` VALUES (329, 'QDE WHITE- TKO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-307', 2);
INSERT INTO `ims_runningbalance` VALUES (330, 'Junction Box- SHUTA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-308', 19);
INSERT INTO `ims_runningbalance` VALUES (331, '1 Gang Switch- ROYU', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-309', 19);
INSERT INTO `ims_runningbalance` VALUES (332, '2 Gang Outlet Universal- FOCUS', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-310', 19);
INSERT INTO `ims_runningbalance` VALUES (333, 'PVC Pipe Orange 1/2- BIO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-311', 19);
INSERT INTO `ims_runningbalance` VALUES (334, 'THHN WIRE 12"- MAX', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-312', 19);
INSERT INTO `ims_runningbalance` VALUES (335, 'Angle Valve 1/2" 2 way - HAWK', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-313', 19);
INSERT INTO `ims_runningbalance` VALUES (336, 'Faucet 2 way -HAWK', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-314', 19);
INSERT INTO `ims_runningbalance` VALUES (337, 'Supply Hose 1/2 x 1/2 - ITALY', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-315', 19);
INSERT INTO `ims_runningbalance` VALUES (338, 'Floor Drain 4 x 4- CHICAGO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-316', 19);
INSERT INTO `ims_runningbalance` VALUES (339, 'Faucet s/s - HAWK', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-317', 19);
INSERT INTO `ims_runningbalance` VALUES (340, 'Cyclone Wire', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-318', 19);
INSERT INTO `ims_runningbalance` VALUES (341, 'Long Span Rib type 0.50m x 1220m Blue', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-319', 19);
INSERT INTO `ims_runningbalance` VALUES (342, 'C- Purlins 2 x 3 1.0', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-320', 19);
INSERT INTO `ims_runningbalance` VALUES (343, 'Deform Bar 12mm', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-321', 19);
INSERT INTO `ims_runningbalance` VALUES (344, 'Steel Matting 4 x 8 #8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-322', 19);
INSERT INTO `ims_runningbalance` VALUES (345, 'Tubular 2 x 3 1.4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '02-323', 19);
INSERT INTO `ims_runningbalance` VALUES (346, 'Air Release Valve 1" Brass', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:47', '2025-03-07 05:35:47', '03-001', 19);
INSERT INTO `ims_runningbalance` VALUES (347, 'Air Release Valve 1" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-002', 19);
INSERT INTO `ims_runningbalance` VALUES (348, 'Adaptor 2" CI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-003', 19);
INSERT INTO `ims_runningbalance` VALUES (349, 'Adaptor 3" CI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-004', 19);
INSERT INTO `ims_runningbalance` VALUES (350, 'Adaptor 4" CI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-005', 19);
INSERT INTO `ims_runningbalance` VALUES (351, 'Adaptor 6" CI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-006', 19);
INSERT INTO `ims_runningbalance` VALUES (352, 'Ball Valve 1"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-007', 19);
INSERT INTO `ims_runningbalance` VALUES (353, 'Ball Valve 1/2 Lockwing - WIN', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-008', 19);
INSERT INTO `ims_runningbalance` VALUES (354, 'Ball Valve 1/2 Magnetic', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-009', 19);
INSERT INTO `ims_runningbalance` VALUES (355, 'Ball Valve 2"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-010', 19);
INSERT INTO `ims_runningbalance` VALUES (356, 'Ball Valve 3/4" Lockwing', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-011', 19);
INSERT INTO `ims_runningbalance` VALUES (357, 'Bell Reducer 3 x 2 B.I', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-012', 19);
INSERT INTO `ims_runningbalance` VALUES (358, 'Bell Reducer 1 1/4 x 1" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-013', 19);
INSERT INTO `ims_runningbalance` VALUES (359, 'Bell Reducer 1" x 3/4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-014', 19);
INSERT INTO `ims_runningbalance` VALUES (360, 'Bell Reducer 1/2 x 3/4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-015', 19);
INSERT INTO `ims_runningbalance` VALUES (361, 'Bell Reducer 2 x 1 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-016', 19);
INSERT INTO `ims_runningbalance` VALUES (362, 'Bell Reducer 3 x 2 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-017', 19);
INSERT INTO `ims_runningbalance` VALUES (363, 'Bell Reducer 4 x 3 BI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-018', 19);
INSERT INTO `ims_runningbalance` VALUES (364, 'Bell Reducer 6 x 4 BI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-019', 19);
INSERT INTO `ims_runningbalance` VALUES (365, 'Bell Reducer 6 x 4 GI - Mechanical', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-020', 19);
INSERT INTO `ims_runningbalance` VALUES (366, 'Bushing 3/4 x 1/2 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-021', 19);
INSERT INTO `ims_runningbalance` VALUES (367, 'Bushing 1 x 3/4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-022', 19);
INSERT INTO `ims_runningbalance` VALUES (368, 'Bushing 2 x 1 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-023', 19);
INSERT INTO `ims_runningbalance` VALUES (369, 'Bushing 2 x 2 1/2 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-024', 19);
INSERT INTO `ims_runningbalance` VALUES (370, 'Bushing 4 x 3/4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-025', 19);
INSERT INTO `ims_runningbalance` VALUES (371, 'Butterfly Valve 4"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-026', 19);
INSERT INTO `ims_runningbalance` VALUES (372, 'Butterfly Valve 6"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-027', 19);
INSERT INTO `ims_runningbalance` VALUES (373, 'Checkvalve 1" - Brass', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-028', 19);
INSERT INTO `ims_runningbalance` VALUES (374, 'Checkvalve 1/2" Brass', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-029', 19);
INSERT INTO `ims_runningbalance` VALUES (375, 'Checkvalve 1 1/2" Brass', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-030', 19);
INSERT INTO `ims_runningbalance` VALUES (376, 'Checkvalve 2" - Brass', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-031', 19);
INSERT INTO `ims_runningbalance` VALUES (377, 'Checkvalve 3" Brass', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-032', 19);
INSERT INTO `ims_runningbalance` VALUES (378, 'Checkvalve 4"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-033', 19);
INSERT INTO `ims_runningbalance` VALUES (379, 'Checkvalve 6"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:48', '2025-03-07 05:35:48', '03-034', 19);
INSERT INTO `ims_runningbalance` VALUES (380, 'Checkvalve 6" CI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-035', 19);
INSERT INTO `ims_runningbalance` VALUES (381, 'Coupling 1" GI (S40)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-036', 19);
INSERT INTO `ims_runningbalance` VALUES (382, 'Coupling 1" GI (S80)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-037', 19);
INSERT INTO `ims_runningbalance` VALUES (383, 'Coupling 1" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-038', 19);
INSERT INTO `ims_runningbalance` VALUES (384, 'Coupling 1/2 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-039', 19);
INSERT INTO `ims_runningbalance` VALUES (385, 'Coupling 1/2 PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-040', 19);
INSERT INTO `ims_runningbalance` VALUES (386, 'Coupling 1/2 PVC w/ Thread', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-041', 19);
INSERT INTO `ims_runningbalance` VALUES (387, 'Coupling 1/2 HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-042', 19);
INSERT INTO `ims_runningbalance` VALUES (388, 'Coupling 2" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-043', 19);
INSERT INTO `ims_runningbalance` VALUES (389, 'Coupling 2" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-044', 19);
INSERT INTO `ims_runningbalance` VALUES (390, 'Coupling 3" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-045', 19);
INSERT INTO `ims_runningbalance` VALUES (391, 'Coupling 3" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-046', 19);
INSERT INTO `ims_runningbalance` VALUES (392, 'Coupling 3/4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-047', 19);
INSERT INTO `ims_runningbalance` VALUES (393, 'Coupling 3/4 HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-048', 19);
INSERT INTO `ims_runningbalance` VALUES (394, 'Coupling 4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-049', 19);
INSERT INTO `ims_runningbalance` VALUES (395, 'Coupling 4" HDPE- FISH', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-050', 19);
INSERT INTO `ims_runningbalance` VALUES (396, 'Coupling 4X3 GI (SCHED 80)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-051', 19);
INSERT INTO `ims_runningbalance` VALUES (397, 'Coupling 6" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-052', 19);
INSERT INTO `ims_runningbalance` VALUES (398, 'Coupling 6" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-053', 19);
INSERT INTO `ims_runningbalance` VALUES (399, 'Coupling 3/4"  PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-054', 19);
INSERT INTO `ims_runningbalance` VALUES (400, 'Coupling Reducer 3 x 2 - Mechanical', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-055', 19);
INSERT INTO `ims_runningbalance` VALUES (401, 'Coupling Reducer 3 x 2 NLC - FISH', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-056', 19);
INSERT INTO `ims_runningbalance` VALUES (402, 'Coupling Reducer 4 x 2 - Mechanical', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-057', 19);
INSERT INTO `ims_runningbalance` VALUES (403, 'Cross Tee 1" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-058', 19);
INSERT INTO `ims_runningbalance` VALUES (404, 'Cross Tee 1/2 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-059', 19);
INSERT INTO `ims_runningbalance` VALUES (405, 'Cross Tee 2" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-060', 19);
INSERT INTO `ims_runningbalance` VALUES (406, 'Cross Tee 3 x 2 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-061', 19);
INSERT INTO `ims_runningbalance` VALUES (407, 'Cross Tee 3" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-062', 19);
INSERT INTO `ims_runningbalance` VALUES (408, 'Cross Tee 4 x 2 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-063', 19);
INSERT INTO `ims_runningbalance` VALUES (409, 'Cross Tee 4 x 3 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-064', 19);
INSERT INTO `ims_runningbalance` VALUES (410, 'Cross Tee 4" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-065', 19);
INSERT INTO `ims_runningbalance` VALUES (411, 'Cross Tee 6 x 3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-066', 19);
INSERT INTO `ims_runningbalance` VALUES (412, 'Elbow 45deg - Flange Type 6" CI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:49', '2025-03-07 05:35:49', '03-067', 19);
INSERT INTO `ims_runningbalance` VALUES (413, 'Elbow 90 deg - 4" BI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-068', 19);
INSERT INTO `ims_runningbalance` VALUES (414, 'Elbow 90deg - Flange Type 6" CI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-069', 19);
INSERT INTO `ims_runningbalance` VALUES (415, 'Elbow 1" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-070', 19);
INSERT INTO `ims_runningbalance` VALUES (416, 'Elbow 1" GI 45 deg.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-071', 19);
INSERT INTO `ims_runningbalance` VALUES (417, 'Elbow 1" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-072', 19);
INSERT INTO `ims_runningbalance` VALUES (418, 'Elbow 1" PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-073', 19);
INSERT INTO `ims_runningbalance` VALUES (419, 'Elbow 1/2 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-074', 19);
INSERT INTO `ims_runningbalance` VALUES (420, 'Elbow 1/2 HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-075', 19);
INSERT INTO `ims_runningbalance` VALUES (421, 'Elbow 1/2 (plain)  PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-076', 19);
INSERT INTO `ims_runningbalance` VALUES (422, 'Elbow 2" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-077', 19);
INSERT INTO `ims_runningbalance` VALUES (423, 'Elbow 2" HDPE- FISH', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-078', 19);
INSERT INTO `ims_runningbalance` VALUES (424, 'Elbow 3" BI 45 deg.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-079', 19);
INSERT INTO `ims_runningbalance` VALUES (425, 'Elbow 3" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-080', 19);
INSERT INTO `ims_runningbalance` VALUES (426, 'Elbow 3" GI 45 deg.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-081', 1);
INSERT INTO `ims_runningbalance` VALUES (427, 'Elbow 3" HDPE- FISH', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-082', 19);
INSERT INTO `ims_runningbalance` VALUES (428, 'Elbow 3/4 GI- JB', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-083', 19);
INSERT INTO `ims_runningbalance` VALUES (429, 'Elbow 3/4 HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-084', 19);
INSERT INTO `ims_runningbalance` VALUES (430, 'Elbow 4" 45deg (80) BI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-085', 19);
INSERT INTO `ims_runningbalance` VALUES (431, 'Elbow 4" 45deg GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-086', 19);
INSERT INTO `ims_runningbalance` VALUES (432, 'Elbow 4" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-087', 19);
INSERT INTO `ims_runningbalance` VALUES (433, 'Elbow 6" BI  45 DEG', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-088', 19);
INSERT INTO `ims_runningbalance` VALUES (434, 'Elbow 6" BI  90 DEG', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-089', 19);
INSERT INTO `ims_runningbalance` VALUES (435, 'Elbow Reducer 1" x 1 1/4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-090', 19);
INSERT INTO `ims_runningbalance` VALUES (436, 'Elbow Reducer 1" x 1/2 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-091', 19);
INSERT INTO `ims_runningbalance` VALUES (437, 'Elbow Reducer 1" x 3/4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-092', 19);
INSERT INTO `ims_runningbalance` VALUES (438, 'Elbow Reducer 3/4 x 1/2 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-093', 19);
INSERT INTO `ims_runningbalance` VALUES (439, 'Elbow Straight 1/2"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-094', 19);
INSERT INTO `ims_runningbalance` VALUES (440, 'Elbow Straight 1"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-095', 19);
INSERT INTO `ims_runningbalance` VALUES (441, 'Elbow Straight 3/4"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:50', '2025-03-07 05:35:50', '03-096', 19);
INSERT INTO `ims_runningbalance` VALUES (442, 'Elbow Threaded 1/2 PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-097', 19);
INSERT INTO `ims_runningbalance` VALUES (443, 'End Cap 1" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-098', 19);
INSERT INTO `ims_runningbalance` VALUES (444, 'End Cap 1/2 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-099', 19);
INSERT INTO `ims_runningbalance` VALUES (445, 'End Cap 2"  GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-100', 19);
INSERT INTO `ims_runningbalance` VALUES (446, 'End Cap 2" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-101', 19);
INSERT INTO `ims_runningbalance` VALUES (447, 'End Cap 3" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-102', 19);
INSERT INTO `ims_runningbalance` VALUES (448, 'End Cap 3" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-103', 19);
INSERT INTO `ims_runningbalance` VALUES (449, 'End Cap 3/4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-104', 19);
INSERT INTO `ims_runningbalance` VALUES (450, 'End Cap 4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-105', 19);
INSERT INTO `ims_runningbalance` VALUES (451, 'End Cap 6"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-106', 19);
INSERT INTO `ims_runningbalance` VALUES (452, 'End Cap 8"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-107', 19);
INSERT INTO `ims_runningbalance` VALUES (453, 'End Plug 1" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-108', 19);
INSERT INTO `ims_runningbalance` VALUES (454, 'End Plug 1/2 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-109', 19);
INSERT INTO `ims_runningbalance` VALUES (455, 'End Plug 2" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-110', 19);
INSERT INTO `ims_runningbalance` VALUES (456, 'End Plug 3 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-111', 19);
INSERT INTO `ims_runningbalance` VALUES (457, 'End Plug 3/4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-112', 19);
INSERT INTO `ims_runningbalance` VALUES (458, 'End Plug 4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-113', 19);
INSERT INTO `ims_runningbalance` VALUES (459, 'Sleeve-Type Coupling 8"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-114', 19);
INSERT INTO `ims_runningbalance` VALUES (460, 'Fabricated Elbow 3"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-115', 19);
INSERT INTO `ims_runningbalance` VALUES (461, 'Fabricated Elbow 4"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-116', 19);
INSERT INTO `ims_runningbalance` VALUES (462, 'Fabricated Elbow 6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-117', 19);
INSERT INTO `ims_runningbalance` VALUES (463, 'Fabricated Reducer 3 x 2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-118', 19);
INSERT INTO `ims_runningbalance` VALUES (464, 'Fabricated Tee 3 x 2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-119', 19);
INSERT INTO `ims_runningbalance` VALUES (465, 'Fabricated Tee 3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-120', 19);
INSERT INTO `ims_runningbalance` VALUES (466, 'Fabricated Tee 4 x 2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-121', 19);
INSERT INTO `ims_runningbalance` VALUES (467, 'Fabricated Tee 4 x 3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-122', 19);
INSERT INTO `ims_runningbalance` VALUES (468, 'Fabricated Tee 4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-123', 19);
INSERT INTO `ims_runningbalance` VALUES (469, 'Fabricated Tee 6 x 2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-124', 19);
INSERT INTO `ims_runningbalance` VALUES (470, 'Fabricated Tee 6 x 3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-125', 19);
INSERT INTO `ims_runningbalance` VALUES (471, 'Fabricated Tee 6 x 4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-126', 19);
INSERT INTO `ims_runningbalance` VALUES (472, 'Fabricated Tee 6', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-127', 19);
INSERT INTO `ims_runningbalance` VALUES (473, 'Fabricated Tee 8 x 2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-128', 19);
INSERT INTO `ims_runningbalance` VALUES (474, 'Fabricated Tee 8 x 3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:51', '2025-03-07 05:35:51', '03-129', 19);
INSERT INTO `ims_runningbalance` VALUES (475, 'Fabricated Tee 8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-130', 19);
INSERT INTO `ims_runningbalance` VALUES (476, 'Female Adaptor 1/2" PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-131', 19);
INSERT INTO `ims_runningbalance` VALUES (477, 'Female Elbow 1" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-132', 19);
INSERT INTO `ims_runningbalance` VALUES (478, 'Female Elbow 1/2 HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-133', 19);
INSERT INTO `ims_runningbalance` VALUES (479, 'Female Elbow 2" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-134', 19);
INSERT INTO `ims_runningbalance` VALUES (480, 'Female Elbow 3 HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-135', 19);
INSERT INTO `ims_runningbalance` VALUES (481, 'Female Elbow 3/4 HDPE - NLC- PBP', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-136', 19);
INSERT INTO `ims_runningbalance` VALUES (482, 'Flange 2"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-137', 19);
INSERT INTO `ims_runningbalance` VALUES (483, 'Flange 3" ( 8 hole )', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-138', 19);
INSERT INTO `ims_runningbalance` VALUES (484, 'Flange 6"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-139', 19);
INSERT INTO `ims_runningbalance` VALUES (485, 'Flange 8"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-140', 19);
INSERT INTO `ims_runningbalance` VALUES (486, 'Gasket 1/2"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-141', 19);
INSERT INTO `ims_runningbalance` VALUES (487, 'Gasket 3" - LOCAL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-142', 19);
INSERT INTO `ims_runningbalance` VALUES (488, 'Gasket 3/4 "', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-143', 19);
INSERT INTO `ims_runningbalance` VALUES (489, 'Gasket 8"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-144', 19);
INSERT INTO `ims_runningbalance` VALUES (490, 'Gate Valve 1" Brass', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-145', 19);
INSERT INTO `ims_runningbalance` VALUES (491, 'Gate Valve 1/2" Brass', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-146', 19);
INSERT INTO `ims_runningbalance` VALUES (492, 'Gate Valve 2" Brass', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-147', 19);
INSERT INTO `ims_runningbalance` VALUES (493, 'Gate Valve 2" Flange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-148', 19);
INSERT INTO `ims_runningbalance` VALUES (494, 'Gate Valve 2" Mechanical', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-149', 19);
INSERT INTO `ims_runningbalance` VALUES (495, 'Gate Valve 3" Mechanical', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-150', 19);
INSERT INTO `ims_runningbalance` VALUES (496, 'Gate Valve 3" Brass', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-151', 19);
INSERT INTO `ims_runningbalance` VALUES (497, 'Gate Valve 3" Flange- DI (BOHAI)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-152', 19);
INSERT INTO `ims_runningbalance` VALUES (498, 'Gate Valve 3/4" Brass', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-153', 19);
INSERT INTO `ims_runningbalance` VALUES (499, 'Gate Valve 4" Flange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-154', 19);
INSERT INTO `ims_runningbalance` VALUES (500, 'Gate Valve 4" Mechanical', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-155', 19);
INSERT INTO `ims_runningbalance` VALUES (501, 'Gate Valve 6" Brass', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-156', 19);
INSERT INTO `ims_runningbalance` VALUES (502, 'Gate Valve 6" Flange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-157', 19);
INSERT INTO `ims_runningbalance` VALUES (503, 'Gate Valve 6" Mechanical', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-158', 19);
INSERT INTO `ims_runningbalance` VALUES (504, 'Gate Valve 8" Mechanical', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-159', 19);
INSERT INTO `ims_runningbalance` VALUES (505, 'GiBault 2"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-160', 19);
INSERT INTO `ims_runningbalance` VALUES (506, 'GiBault 3"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-161', 19);
INSERT INTO `ims_runningbalance` VALUES (507, 'GiBault 4"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-162', 19);
INSERT INTO `ims_runningbalance` VALUES (508, 'GiBault 6"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:52', '2025-03-07 05:35:52', '03-163', 19);
INSERT INTO `ims_runningbalance` VALUES (509, 'GiBault 8"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-164', 19);
INSERT INTO `ims_runningbalance` VALUES (510, 'Gate Valve 2" Flange Type CI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-165', 19);
INSERT INTO `ims_runningbalance` VALUES (511, 'Gate Valve 3" Flange Type CI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-166', 19);
INSERT INTO `ims_runningbalance` VALUES (512, 'Gate Valve 4" Flange Type CI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-167', 19);
INSERT INTO `ims_runningbalance` VALUES (513, 'Mechanical Flange 3" - LOCAL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-168', 19);
INSERT INTO `ims_runningbalance` VALUES (514, 'Mechanical Flange 4"- LOCAL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-169', 19);
INSERT INTO `ims_runningbalance` VALUES (515, 'Male Adaptor 1" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-170', 19);
INSERT INTO `ims_runningbalance` VALUES (516, 'Male Adaptor 1" PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-171', 19);
INSERT INTO `ims_runningbalance` VALUES (517, 'Male Adaptor 1/2" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-172', 1);
INSERT INTO `ims_runningbalance` VALUES (518, 'Male Adaptor 1/2" PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-173', 1);
INSERT INTO `ims_runningbalance` VALUES (519, 'Male Adaptor 2" HDPE- FISH', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-174', 19);
INSERT INTO `ims_runningbalance` VALUES (520, 'Male Adaptor 2" PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-175', 19);
INSERT INTO `ims_runningbalance` VALUES (521, 'Male Adaptor 3"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-176', 19);
INSERT INTO `ims_runningbalance` VALUES (522, 'Male Adaptor 3/4 HDPE - FISH', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-177', 19);
INSERT INTO `ims_runningbalance` VALUES (523, 'Male Adaptor 3/4" PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-178', 19);
INSERT INTO `ims_runningbalance` VALUES (524, 'Mechanical Elbow 2" 90 deg.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-179', 19);
INSERT INTO `ims_runningbalance` VALUES (525, 'Mechanical Elbow 3" 45 deg.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-180', 19);
INSERT INTO `ims_runningbalance` VALUES (526, 'Mechanical Elbow 3" 90 deg.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-181', 19);
INSERT INTO `ims_runningbalance` VALUES (527, 'Mechanical Elbow 4" 90 deg.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-182', 19);
INSERT INTO `ims_runningbalance` VALUES (528, 'Mechanical Elbow 6" 45 deg.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-183', 19);
INSERT INTO `ims_runningbalance` VALUES (529, 'Mechanical Elbow 6" 90 deg.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-184', 19);
INSERT INTO `ims_runningbalance` VALUES (530, 'Mechanical End Cap 2"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-185', 19);
INSERT INTO `ims_runningbalance` VALUES (531, 'Mechanical End Cap 4"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-186', 19);
INSERT INTO `ims_runningbalance` VALUES (532, 'Mechanical Tee 2"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-187', 19);
INSERT INTO `ims_runningbalance` VALUES (533, 'Mechanical Tee 3 x 3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-188', 19);
INSERT INTO `ims_runningbalance` VALUES (534, 'Mechanical Tee 4 x 2 CI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-189', 19);
INSERT INTO `ims_runningbalance` VALUES (535, 'Mechanical Tee 4 x 3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-190', 19);
INSERT INTO `ims_runningbalance` VALUES (536, 'Mechanical Tee 4 x 4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-191', 19);
INSERT INTO `ims_runningbalance` VALUES (537, 'Mechanical Tee 6 x 2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-192', 19);
INSERT INTO `ims_runningbalance` VALUES (538, 'Mechanical Tee 6 x 3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-193', 19);
INSERT INTO `ims_runningbalance` VALUES (539, 'Mechanical Tee 6 x 4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-194', 19);
INSERT INTO `ims_runningbalance` VALUES (540, 'Mechanical Tee 6"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-195', 19);
INSERT INTO `ims_runningbalance` VALUES (541, 'Nipple 1 x 12 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-196', 19);
INSERT INTO `ims_runningbalance` VALUES (542, 'Nipple 1 x 5 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-197', 19);
INSERT INTO `ims_runningbalance` VALUES (543, 'Nipple 1 x 8 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:53', '2025-03-07 05:35:53', '03-198', 19);
INSERT INTO `ims_runningbalance` VALUES (544, 'Nipple 1" x 2" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-199', 19);
INSERT INTO `ims_runningbalance` VALUES (545, 'Nipple 1" x 6" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-200', 19);
INSERT INTO `ims_runningbalance` VALUES (546, 'Nipple 1" x 8" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-201', 19);
INSERT INTO `ims_runningbalance` VALUES (547, 'Nipple 1/2 x 1 GI - FS', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-202', 19);
INSERT INTO `ims_runningbalance` VALUES (548, 'Nipple 1/2 x 12 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-203', 19);
INSERT INTO `ims_runningbalance` VALUES (549, 'Nipple 1/2 x 16 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-204', 19);
INSERT INTO `ims_runningbalance` VALUES (550, 'Nipple 1/2 x 2 GI - JB', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-205', 19);
INSERT INTO `ims_runningbalance` VALUES (551, 'Nipple 1/2 x 2" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-206', 19);
INSERT INTO `ims_runningbalance` VALUES (552, 'Nipple 1/2 x 3 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-207', 19);
INSERT INTO `ims_runningbalance` VALUES (553, 'Nipple 1/2 x 4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-208', 19);
INSERT INTO `ims_runningbalance` VALUES (554, 'Nipple 1/2 x 6 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-209', 19);
INSERT INTO `ims_runningbalance` VALUES (555, 'Nipple 1/2 x 8 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-210', 19);
INSERT INTO `ims_runningbalance` VALUES (556, 'Nipple 2 1/2 x 5 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-211', 19);
INSERT INTO `ims_runningbalance` VALUES (557, 'Nipple 2 x 5 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-212', 19);
INSERT INTO `ims_runningbalance` VALUES (558, 'Nipple 3 x 5 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-213', 19);
INSERT INTO `ims_runningbalance` VALUES (559, 'Nipple 3/4 x 10 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-214', 19);
INSERT INTO `ims_runningbalance` VALUES (560, 'Nipple 3/4 x 4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-215', 19);
INSERT INTO `ims_runningbalance` VALUES (561, 'Nipple 3/4 x 5 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-216', 19);
INSERT INTO `ims_runningbalance` VALUES (562, 'Nipple 3/4 x 6 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-217', 19);
INSERT INTO `ims_runningbalance` VALUES (563, 'Nipple 3/4 x 6 HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-218', 19);
INSERT INTO `ims_runningbalance` VALUES (564, 'Nipple 3/4 x 8 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-219', 19);
INSERT INTO `ims_runningbalance` VALUES (565, 'Nipple 3/4 x 8 HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-220', 19);
INSERT INTO `ims_runningbalance` VALUES (566, 'Nipple 4 x 12 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-221', 19);
INSERT INTO `ims_runningbalance` VALUES (567, 'Nipple 5 x 10 BI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-222', 19);
INSERT INTO `ims_runningbalance` VALUES (568, 'Repair Clamp 2" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-223', 19);
INSERT INTO `ims_runningbalance` VALUES (569, 'Repair Clamp 3" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-224', 19);
INSERT INTO `ims_runningbalance` VALUES (570, 'Repair Clamp 4" HDPE - MIE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-225', 19);
INSERT INTO `ims_runningbalance` VALUES (571, 'Repair Clamp 6" HDPE - MIE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-226', 19);
INSERT INTO `ims_runningbalance` VALUES (572, 'Repair Clamp 8" HDPE - MIE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-227', 19);
INSERT INTO `ims_runningbalance` VALUES (573, 'Saddle Clamp 2 x 1 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-228', 19);
INSERT INTO `ims_runningbalance` VALUES (574, 'Saddle Clamp 2 x 1 HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-229', 19);
INSERT INTO `ims_runningbalance` VALUES (575, 'Saddle Clamp 2 x 3/4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-230', 19);
INSERT INTO `ims_runningbalance` VALUES (576, 'Saddle Clamp 3 x 1 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:54', '2025-03-07 05:35:54', '03-231', 19);
INSERT INTO `ims_runningbalance` VALUES (577, 'Saddle Clamp 3 x 3/4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-232', 19);
INSERT INTO `ims_runningbalance` VALUES (578, 'Saddle Clamp 4 x 1 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-233', 19);
INSERT INTO `ims_runningbalance` VALUES (579, 'Saddle Clamp 4 x 3/4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-234', 19);
INSERT INTO `ims_runningbalance` VALUES (580, 'Saddle Clamp 4x2 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-235', 19);
INSERT INTO `ims_runningbalance` VALUES (581, 'Saddle Clamp 6 x 1 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-236', 19);
INSERT INTO `ims_runningbalance` VALUES (582, 'Saddle Clamp 6 x 1/2 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-237', 19);
INSERT INTO `ims_runningbalance` VALUES (583, 'Saddle Clamp 6 x 2 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-238', 19);
INSERT INTO `ims_runningbalance` VALUES (584, 'Saddle Clamp 6 x 3/4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-239', 19);
INSERT INTO `ims_runningbalance` VALUES (585, 'Saddle Clamp 6" x 1" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-240', 19);
INSERT INTO `ims_runningbalance` VALUES (586, 'Saddle Clamp 8" x 1" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-241', 19);
INSERT INTO `ims_runningbalance` VALUES (587, 'Saddle Clamp 8" x 1" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-242', 19);
INSERT INTO `ims_runningbalance` VALUES (588, 'Saddle Clamp 8" x 2" - HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-243', 19);
INSERT INTO `ims_runningbalance` VALUES (589, 'Saddle Clamp 8" x 2" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-244', 19);
INSERT INTO `ims_runningbalance` VALUES (590, 'Side Bolts 3/4 x 8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-245', 19);
INSERT INTO `ims_runningbalance` VALUES (591, 'Sleeve-Type Coupling 2"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-246', 19);
INSERT INTO `ims_runningbalance` VALUES (592, 'Sleeve-Type Coupling 3" DI pvc to pvc- PVMC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-247', 19);
INSERT INTO `ims_runningbalance` VALUES (593, 'Sleeve-Type Coupling 4 x 2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-248', 19);
INSERT INTO `ims_runningbalance` VALUES (594, 'Sleeve-Type Coupling 4" DI pvc to pvc- PVMC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-249', 19);
INSERT INTO `ims_runningbalance` VALUES (595, 'STC (GI-PVC) 6" (GI to GI)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-250', 19);
INSERT INTO `ims_runningbalance` VALUES (596, 'Sleeve-Type Coupling 6" DI (PVC to PVC)- PVMC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-251', 19);
INSERT INTO `ims_runningbalance` VALUES (597, 'Stub End 2" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-252', 19);
INSERT INTO `ims_runningbalance` VALUES (598, 'Stub End 3" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-253', 19);
INSERT INTO `ims_runningbalance` VALUES (599, 'Stub End 4" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-254', 19);
INSERT INTO `ims_runningbalance` VALUES (600, 'Stub End 6" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-255', 19);
INSERT INTO `ims_runningbalance` VALUES (601, 'Stub End 8" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-256', 19);
INSERT INTO `ims_runningbalance` VALUES (602, 'Tee 1" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-257', 19);
INSERT INTO `ims_runningbalance` VALUES (603, 'Tee 1" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-258', 19);
INSERT INTO `ims_runningbalance` VALUES (604, 'Tee 1/2" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-259', 1);
INSERT INTO `ims_runningbalance` VALUES (605, 'Tee 1/2" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-260', 1);
INSERT INTO `ims_runningbalance` VALUES (606, 'Tee 1/2" PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-261', 1);
INSERT INTO `ims_runningbalance` VALUES (607, 'Tee 2" Flange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-262', 19);
INSERT INTO `ims_runningbalance` VALUES (608, 'Tee 2" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-263', 19);
INSERT INTO `ims_runningbalance` VALUES (609, 'Tee 3" Flange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-264', 19);
INSERT INTO `ims_runningbalance` VALUES (610, 'Tee 3" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:55', '2025-03-07 05:35:55', '03-265', 19);
INSERT INTO `ims_runningbalance` VALUES (611, 'Tee 3" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-266', 19);
INSERT INTO `ims_runningbalance` VALUES (612, 'Tee 3/4" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-267', 1);
INSERT INTO `ims_runningbalance` VALUES (613, 'Tee 3/4"HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-268', 1);
INSERT INTO `ims_runningbalance` VALUES (614, 'Tee 4" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-269', 19);
INSERT INTO `ims_runningbalance` VALUES (615, 'Tee Reducer 1 x 3/4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-270', 19);
INSERT INTO `ims_runningbalance` VALUES (616, 'Tee Reducer 1" x 1/2 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-271', 19);
INSERT INTO `ims_runningbalance` VALUES (617, 'Tee Reducer 1/2 x 3/4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-272', 19);
INSERT INTO `ims_runningbalance` VALUES (618, 'Tee Reducer 3 x 2 HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-273', 19);
INSERT INTO `ims_runningbalance` VALUES (619, 'Tee Reducer 4 x 2 HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-274', 19);
INSERT INTO `ims_runningbalance` VALUES (620, 'Tee Reducer 4 x 3 HDPE- FISH', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-275', 19);
INSERT INTO `ims_runningbalance` VALUES (621, 'Tee 6" Flange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-276', 19);
INSERT INTO `ims_runningbalance` VALUES (622, 'Tee 6 x 4  Mechanical CI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-277', 19);
INSERT INTO `ims_runningbalance` VALUES (623, 'Valve Cover - 4" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-278', 19);
INSERT INTO `ims_runningbalance` VALUES (624, 'Valve Cover - 6" G.I.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-279', 19);
INSERT INTO `ims_runningbalance` VALUES (625, 'Y-connector with ferrul 3/4"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-280', 19);
INSERT INTO `ims_runningbalance` VALUES (626, 'Y-Strainer 2"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-281', 19);
INSERT INTO `ims_runningbalance` VALUES (627, 'Y-Strainer 3"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-282', 19);
INSERT INTO `ims_runningbalance` VALUES (628, 'Y-Strainer 4"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-283', 19);
INSERT INTO `ims_runningbalance` VALUES (629, 'Y-Strainer 6" Flange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-284', 19);
INSERT INTO `ims_runningbalance` VALUES (630, 'Elbow 6 x 45 deg (sched 80) GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-285', 19);
INSERT INTO `ims_runningbalance` VALUES (631, 'Elbow 6 x 90 deg (sched 80) GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-286', 19);
INSERT INTO `ims_runningbalance` VALUES (632, 'STC (GI-HDPE) 6" - BLACK', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-287', 19);
INSERT INTO `ims_runningbalance` VALUES (633, 'STC (GI-PVC) 2"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-288', 19);
INSERT INTO `ims_runningbalance` VALUES (634, 'STC (GI-PVC) 4"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-289', 19);
INSERT INTO `ims_runningbalance` VALUES (635, 'Checkvalve 3" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-290', 19);
INSERT INTO `ims_runningbalance` VALUES (636, 'Cross Tee Fabricated HDPE 4"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-291', 19);
INSERT INTO `ims_runningbalance` VALUES (637, 'Cross Tee HDPE 3"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-292', 19);
INSERT INTO `ims_runningbalance` VALUES (638, 'Cross Tee HDPE 4x3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-293', 19);
INSERT INTO `ims_runningbalance` VALUES (639, 'Cross Tee HDPE 6x3', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-294', 19);
INSERT INTO `ims_runningbalance` VALUES (640, 'Cross Tee HDPE 6x4', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-295', 19);
INSERT INTO `ims_runningbalance` VALUES (641, 'Nipple 1"x24" GI (sched 80)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-296', 19);
INSERT INTO `ims_runningbalance` VALUES (642, 'Coupling Reducer 1" x 3/4" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-297', 19);
INSERT INTO `ims_runningbalance` VALUES (643, 'Tee w/ Thread 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-298', 19);
INSERT INTO `ims_runningbalance` VALUES (644, 'Elbow 4 x 90 sched80', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-299', 19);
INSERT INTO `ims_runningbalance` VALUES (645, 'STC 4" ( GI to HDPE) DI - BLUE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:56', '2025-03-07 05:35:56', '03-300', 19);
INSERT INTO `ims_runningbalance` VALUES (646, 'Cross Tee HDPE 3 x 2 - fabricated', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-301', 19);
INSERT INTO `ims_runningbalance` VALUES (647, 'STC 3" (GI to HDPE)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-302', 19);
INSERT INTO `ims_runningbalance` VALUES (648, 'Elbow 3" GI 90deg (sched 80)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-303', 19);
INSERT INTO `ims_runningbalance` VALUES (649, 'STC 8"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-304', 19);
INSERT INTO `ims_runningbalance` VALUES (650, 'Elbow 3" 45 deg. (schd.80)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-305', 19);
INSERT INTO `ims_runningbalance` VALUES (652, 'Gate Valve Flange type 8" w/ bang', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-306', 19);
INSERT INTO `ims_runningbalance` VALUES (654, 'Nipple 1/2 x 5', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-307', 19);
INSERT INTO `ims_runningbalance` VALUES (656, 'Elbow 8 x 90 deg. - HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-308', 19);
INSERT INTO `ims_runningbalance` VALUES (658, 'Coupling Reducer 8 x 6 - HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-309', 19);
INSERT INTO `ims_runningbalance` VALUES (660, 'Fabricated Coupling 6 x 8', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-310', 19);
INSERT INTO `ims_runningbalance` VALUES (661, 'Check Valve 3/4- Brass', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-311', 19);
INSERT INTO `ims_runningbalance` VALUES (663, 'Valve Cover 6" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-312', 19);
INSERT INTO `ims_runningbalance` VALUES (664, 'Fabricated Elbow 4 x 90 deg. HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-313', 19);
INSERT INTO `ims_runningbalance` VALUES (665, 'Fabricated Elbow 6 x 90 deg. HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-314', 19);
INSERT INTO `ims_runningbalance` VALUES (666, 'Fabricated Elbow 8 x 45 deg. HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-315', 19);
INSERT INTO `ims_runningbalance` VALUES (667, 'Coupling Reducer 8 x 4 - HDPE ( Fabricated)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-316', 19);
INSERT INTO `ims_runningbalance` VALUES (668, 'Coupling Reducer 8 x 6 - HDPE ( Fabricated)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-317', 19);
INSERT INTO `ims_runningbalance` VALUES (669, 'Gasket- 6"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-318', 19);
INSERT INTO `ims_runningbalance` VALUES (670, 'DI Gate Valve Flange Type 8"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-319', 19);
INSERT INTO `ims_runningbalance` VALUES (671, 'Bolt and nut 5/8 x 8- Full Thread', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-320', 19);
INSERT INTO `ims_runningbalance` VALUES (672, 'Full thread 3/4 x 10 ft.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-321', 19);
INSERT INTO `ims_runningbalance` VALUES (673, 'Bell Reducer 5 x 4 GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-322', 19);
INSERT INTO `ims_runningbalance` VALUES (674, 'Tee 4" Flange type CI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-323', 19);
INSERT INTO `ims_runningbalance` VALUES (675, 'Nut GI - 5/8"- LOCAL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-324', 19);
INSERT INTO `ims_runningbalance` VALUES (676, 'Bell Reducer GI 1/2 x 3/4 - JB', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-325', 19);
INSERT INTO `ims_runningbalance` VALUES (677, 'End Cap 3/4 GI - MECH', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-326', 19);
INSERT INTO `ims_runningbalance` VALUES (678, 'End Plug 3/4 GI - JB', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-327', 19);
INSERT INTO `ims_runningbalance` VALUES (679, 'End Plug 1"GI - JB', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-328', 19);
INSERT INTO `ims_runningbalance` VALUES (680, 'Nipple 3/4 x 5 GI - JB', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-329', 19);
INSERT INTO `ims_runningbalance` VALUES (681, 'Nipple 3/4 x 8 GI - FS', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-330', 19);
INSERT INTO `ims_runningbalance` VALUES (682, 'Nipple 1 x 5 GI - AKUA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-331', 19);
INSERT INTO `ims_runningbalance` VALUES (683, 'Nipple 1 x 8 GI - AKUA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-332', 19);
INSERT INTO `ims_runningbalance` VALUES (684, 'Saddle Clamp 3 x 3/4 DI - PV', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-333', 19);
INSERT INTO `ims_runningbalance` VALUES (685, 'Saddle Clamp 6 x 1 DI - PV', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:57', '2025-03-07 05:35:57', '03-334', 19);
INSERT INTO `ims_runningbalance` VALUES (686, 'Sleeve-Type Coupling 3" DI pvc to pvc- BOHAI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-335', 19);
INSERT INTO `ims_runningbalance` VALUES (687, 'Sleeve-Type Coupling 4" DI pvc to pvc- BOHAI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-336', 19);
INSERT INTO `ims_runningbalance` VALUES (688, 'Sleeve-Type Coupling 6" DI (PVC to PVC)- BOHAI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-337', 19);
INSERT INTO `ims_runningbalance` VALUES (689, 'Male Adaptor 3/4 nlc- PBP', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-338', 19);
INSERT INTO `ims_runningbalance` VALUES (690, 'Male Adaptor 1 nlc- PBP', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-339', 19);
INSERT INTO `ims_runningbalance` VALUES (691, 'PVC Pipe 1/2 w/ hub- NELTEX', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-340', 19);
INSERT INTO `ims_runningbalance` VALUES (692, 'Male Adaptor 1/2 PVC- TIAN BLUE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-341', 19);
INSERT INTO `ims_runningbalance` VALUES (693, 'Coupling 1/2 PVC- TIAN BLUE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-342', 19);
INSERT INTO `ims_runningbalance` VALUES (694, 'Elbow Plain 1/2 PVC- TIAN BLUE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-343', 19);
INSERT INTO `ims_runningbalance` VALUES (695, 'Repair Clamp 2" HDPE -MIE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-344', 19);
INSERT INTO `ims_runningbalance` VALUES (696, 'Repair Clamp 3" HDPE -MIE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-345', 19);
INSERT INTO `ims_runningbalance` VALUES (697, 'Tee Reducer 1 x 3/4 GI - JB', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-346', 19);
INSERT INTO `ims_runningbalance` VALUES (698, 'Tee 3/4 GI - JB', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-347', 19);
INSERT INTO `ims_runningbalance` VALUES (699, 'Nipple 1/2 x 1 GI - MICRO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-348', 19);
INSERT INTO `ims_runningbalance` VALUES (700, 'Nipple 1/2 x 2 GI - MICRO', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-349', 19);
INSERT INTO `ims_runningbalance` VALUES (701, 'Coupling 1" HDPE - FISH', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-350', 19);
INSERT INTO `ims_runningbalance` VALUES (702, 'Female Elbow 1/2 HDPE- PBP', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-351', 19);
INSERT INTO `ims_runningbalance` VALUES (703, 'DI Sleeve type coupling pvc-pvc 4"- HIWA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-352', 19);
INSERT INTO `ims_runningbalance` VALUES (704, 'DI Sleeve type coupling pvc-pvc 6"-HIWA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-353', 19);
INSERT INTO `ims_runningbalance` VALUES (705, 'CI Sleeve Type coupling pvc- GI 6"- CMI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-354', 19);
INSERT INTO `ims_runningbalance` VALUES (706, 'Flow meter 4" Paddle Wheel Type- ZENNER', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-355', 19);
INSERT INTO `ims_runningbalance` VALUES (707, 'Flow meter 6" Paddle Wheel Type- ZENNER', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-356', 19);
INSERT INTO `ims_runningbalance` VALUES (708, 'GASKET 4- LOCAL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-357', 19);
INSERT INTO `ims_runningbalance` VALUES (709, 'STC 4" ( GI to GI)- CMI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-358', 19);
INSERT INTO `ims_runningbalance` VALUES (710, 'Check Valve 1/2 Brass- ACE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-359', 19);
INSERT INTO `ims_runningbalance` VALUES (711, 'Ball Valve 1/2 Lockwing -ACE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-360', 19);
INSERT INTO `ims_runningbalance` VALUES (712, 'Nipple 1/2 x 12 GI - JB', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-361', 19);
INSERT INTO `ims_runningbalance` VALUES (713, 'Male Adaptor 1/2 HDPE- PBP', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '03-362', 19);
INSERT INTO `ims_runningbalance` VALUES (714, 'Pipe 1" HDPE- MIG', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '04-001', 19);
INSERT INTO `ims_runningbalance` VALUES (715, 'Pipe 1" PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '04-002', 14);
INSERT INTO `ims_runningbalance` VALUES (716, 'Pipe 1/2 HDPE - MIG', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '04-003', 14);
INSERT INTO `ims_runningbalance` VALUES (717, 'Pipe 1/2 PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '04-004', 14);
INSERT INTO `ims_runningbalance` VALUES (718, 'Pipe 2" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '04-005', 14);
INSERT INTO `ims_runningbalance` VALUES (719, 'Pipe 3" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '04-006', 14);
INSERT INTO `ims_runningbalance` VALUES (720, 'Pipe 3" RISER PIPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:58', '2025-03-07 05:35:58', '04-007', 14);
INSERT INTO `ims_runningbalance` VALUES (721, 'Pipe 3/4 HDPE - MIG', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '04-008', 19);
INSERT INTO `ims_runningbalance` VALUES (722, 'Pipe 4" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '04-009', 14);
INSERT INTO `ims_runningbalance` VALUES (723, 'Pipe 4" PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '04-010', 14);
INSERT INTO `ims_runningbalance` VALUES (724, 'Pipe 4" RISER HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '04-011', 19);
INSERT INTO `ims_runningbalance` VALUES (725, 'Pipe 4" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '04-012', 19);
INSERT INTO `ims_runningbalance` VALUES (726, 'Pipe 6" GI (sched 80)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '04-013', 19);
INSERT INTO `ims_runningbalance` VALUES (727, 'Pipe 6" HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '04-014', 19);
INSERT INTO `ims_runningbalance` VALUES (728, 'Pipe 8" PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '04-015', 19);
INSERT INTO `ims_runningbalance` VALUES (729, 'Pipe 10" PVC', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '04-016', 19);
INSERT INTO `ims_runningbalance` VALUES (730, 'Pipe RISER 4" GI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '04-017', 19);
INSERT INTO `ims_runningbalance` VALUES (731, 'Pipe 3" GI (sched 80)', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '04-018', 19);
INSERT INTO `ims_runningbalance` VALUES (732, 'Pipe 8" - HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '04-019', 19);
INSERT INTO `ims_runningbalance` VALUES (733, 'Pipe 1 1/2 GI LSII', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '04-020', 19);
INSERT INTO `ims_runningbalance` VALUES (734, 'Pipe 1 1 /2 GI s20', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '04-021', 19);
INSERT INTO `ims_runningbalance` VALUES (735, 'Flow Meter 2"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '05-001', 19);
INSERT INTO `ims_runningbalance` VALUES (736, 'Flow Meter 3"- ZENNER', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '05-002', 19);
INSERT INTO `ims_runningbalance` VALUES (737, 'Flow Meter 4"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '05-003', 19);
INSERT INTO `ims_runningbalance` VALUES (738, 'Flow Meter 6"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '05-004', 19);
INSERT INTO `ims_runningbalance` VALUES (739, 'Water Meter - Brass 1/2" - HYJET', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '05-005', 19);
INSERT INTO `ims_runningbalance` VALUES (740, 'Water Meter - Plastic 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '05-006', 19);
INSERT INTO `ims_runningbalance` VALUES (741, 'Water Meter 3/4 - Brass - ACE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '05-007', 19);
INSERT INTO `ims_runningbalance` VALUES (742, 'Water Meter - Brass 1" - ACE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '05-008', 19);
INSERT INTO `ims_runningbalance` VALUES (743, 'Water Meter - Brass 2"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '05-009', 19);
INSERT INTO `ims_runningbalance` VALUES (744, 'Chemical Solution Tank 100L', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '06-001', 9);
INSERT INTO `ims_runningbalance` VALUES (745, 'Caution Tape', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '06-002', 19);
INSERT INTO `ims_runningbalance` VALUES (746, 'Fire Hydrant Head 2 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '06-003', 19);
INSERT INTO `ims_runningbalance` VALUES (747, 'Fire Hydrant Head 3 X 2 1/2', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '06-004', 19);
INSERT INTO `ims_runningbalance` VALUES (748, 'Pressure Gauge 0-60 PSI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '06-005', 19);
INSERT INTO `ims_runningbalance` VALUES (749, 'Pressure Reducer Valve 3"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '06-006', 19);
INSERT INTO `ims_runningbalance` VALUES (750, 'Pressure Reducer Valve 4"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '06-007', 19);
INSERT INTO `ims_runningbalance` VALUES (751, 'Pressure Reducer Valve 6"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '06-008', 19);
INSERT INTO `ims_runningbalance` VALUES (752, 'PVC Pipe Cement- ATLANTA', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '06-009', 19);
INSERT INTO `ims_runningbalance` VALUES (753, 'Padlock', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '06-010', 19);
INSERT INTO `ims_runningbalance` VALUES (754, 'Hacksaw Blade 12" Sandflex', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '06-011', 19);
INSERT INTO `ims_runningbalance` VALUES (755, 'Teflon Tape - ROYAL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '06-012', 19);
INSERT INTO `ims_runningbalance` VALUES (756, 'Pressure Gauge 100 PSI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '06-013', 19);
INSERT INTO `ims_runningbalance` VALUES (757, 'Concrete Cutter Blade 14"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:35:59', '2025-03-07 05:35:59', '06-014', 19);
INSERT INTO `ims_runningbalance` VALUES (758, 'Chemical Solution Tank 200L', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:36:00', '2025-03-07 05:36:00', '06-015', 9);
INSERT INTO `ims_runningbalance` VALUES (759, 'Pressure Gauge 300 PSI', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:36:00', '2025-03-07 05:36:00', '06-016', 19);
INSERT INTO `ims_runningbalance` VALUES (760, 'GI Bolts & Nuts 5/8 5" (Fullthread)- LOCAL', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:36:00', '2025-03-07 05:36:00', '06-017', 19);
INSERT INTO `ims_runningbalance` VALUES (761, 'Rubber O-ring 4" PVC sure lock riser pipe', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:36:00', '2025-03-07 05:36:00', '06-018', 19);
INSERT INTO `ims_runningbalance` VALUES (762, 'Bolt & Nut  w/ washer', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:36:00', '2025-03-07 05:36:00', '06-019', 19);
INSERT INTO `ims_runningbalance` VALUES (763, 'Bolt & Nut m-6 x 20 w/ washer', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:36:00', '2025-03-07 05:36:00', '06-020', 19);
INSERT INTO `ims_runningbalance` VALUES (764, 'Lock Washer', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:36:00', '2025-03-07 05:36:00', '06-021', 19);
INSERT INTO `ims_runningbalance` VALUES (765, 'PE Hose 4 x 6 - white', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:36:00', '2025-03-07 05:36:00', '06-022', 20);
INSERT INTO `ims_runningbalance` VALUES (766, 'Bolt and Nut 3/4 x 4 -full thread', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:36:00', '2025-03-07 05:36:00', '06-023', 19);
INSERT INTO `ims_runningbalance` VALUES (767, 'Cutting Disc 4"- BLUE SHARK', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:36:00', '2025-03-07 05:36:00', '06-024', 19);
INSERT INTO `ims_runningbalance` VALUES (768, 'Cut Off 14"', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:36:00', '2025-03-07 05:36:00', '06-025', 19);
INSERT INTO `ims_runningbalance` VALUES (769, 'Saddle Clamp w/ Ferrule - 8 x 1 - HDPE', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:36:00', '2025-03-07 05:36:00', '06-026', 19);
INSERT INTO `ims_runningbalance` VALUES (770, 'New Other Materials', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0.0, '0.00', 'Non-Moving', '2025-03-07 05:36:00', '2025-03-07 05:36:00', '06-027', 1);

CREATE TABLE `ims_section` (
  `sectionID` int NOT NULL AUTO_INCREMENT,
  `sectionName` varchar(500) NOT NULL,
  PRIMARY KEY (`sectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `ims_section` VALUES (1, 'N/A');
INSERT INTO `ims_section` VALUES (2, 'NSC');
INSERT INTO `ims_section` VALUES (3, 'Production');
INSERT INTO `ims_section` VALUES (4, 'Meter Maintenance');
INSERT INTO `ims_section` VALUES (5, 'Special Project');
INSERT INTO `ims_section` VALUES (6, 'Construction');
INSERT INTO `ims_section` VALUES (7, 'Commercial');
INSERT INTO `ims_section` VALUES (8, 'Sales');
INSERT INTO `ims_section` VALUES (9, 'Gen.Services');

CREATE TABLE `ims_transactiondetails` (
  `transactionDetailsID` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `week` int NOT NULL,
  `mris` int NOT NULL,
  `supplier` varchar(500) NOT NULL,
  `requestedBy` varchar(500) NOT NULL,
  `purposeID_id` int DEFAULT NULL,
  `sectionID_id` int DEFAULT NULL,
  PRIMARY KEY (`transactionDetailsID`),
  KEY `ims_transactiondetai_purposeID_id_fcd900ba_fk_ims_purpo` (`purposeID_id`),
  KEY `ims_transactiondetai_sectionID_id_d3ef9269_fk_ims_secti` (`sectionID_id`),
  CONSTRAINT `ims_transactiondetai_purposeID_id_fcd900ba_fk_ims_purpo` FOREIGN KEY (`purposeID_id`) REFERENCES `ims_purpose` (`purposeID`),
  CONSTRAINT `ims_transactiondetai_sectionID_id_d3ef9269_fk_ims_secti` FOREIGN KEY (`sectionID_id`) REFERENCES `ims_section` (`sectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


CREATE TABLE `ims_transactionproduct` (
  `transactionProductID` int NOT NULL AUTO_INCREMENT,
  `purchasedFromSupp` int NOT NULL,
  `returnToSupplier` int NOT NULL,
  `transferFromWH` int NOT NULL,
  `transferToWH` int NOT NULL,
  `issuedQty` int NOT NULL,
  `returnedQty` int NOT NULL,
  `consumption` int NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `areaID_id` int DEFAULT NULL,
  `itemID_id` varchar(20) NOT NULL,
  `transactionDetailsID_id` int NOT NULL,
  PRIMARY KEY (`transactionProductID`),
  KEY `ims_transactionproduct_areaID_id_3a32c179_fk_ims_area_areaID` (`areaID_id`),
  KEY `ims_transactionproduct_itemID_id_2c381fc0_fk_ims_item_itemID` (`itemID_id`),
  KEY `ims_transactionprodu_transactionDetailsID_b60b23fc_fk_ims_trans` (`transactionDetailsID_id`),
  CONSTRAINT `ims_transactionprodu_transactionDetailsID_b60b23fc_fk_ims_trans` FOREIGN KEY (`transactionDetailsID_id`) REFERENCES `ims_transactiondetails` (`transactionDetailsID`),
  CONSTRAINT `ims_transactionproduct_areaID_id_3a32c179_fk_ims_area_areaID` FOREIGN KEY (`areaID_id`) REFERENCES `ims_area` (`areaID`),
  CONSTRAINT `ims_transactionproduct_itemID_id_2c381fc0_fk_ims_item_itemID` FOREIGN KEY (`itemID_id`) REFERENCES `ims_item` (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


