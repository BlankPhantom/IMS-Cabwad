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

INSERT INTO auth_permission VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO auth_permission VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO auth_permission VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO auth_permission VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO auth_permission VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO auth_permission VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO auth_permission VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO auth_permission VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO auth_permission VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO auth_permission VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO auth_permission VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO auth_permission VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO auth_permission VALUES ('13', 'Can add user', '4', 'add_user');
INSERT INTO auth_permission VALUES ('14', 'Can change user', '4', 'change_user');
INSERT INTO auth_permission VALUES ('15', 'Can delete user', '4', 'delete_user');
INSERT INTO auth_permission VALUES ('16', 'Can view user', '4', 'view_user');
INSERT INTO auth_permission VALUES ('17', 'Can add content type', '5', 'add_contenttype');
INSERT INTO auth_permission VALUES ('18', 'Can change content type', '5', 'change_contenttype');
INSERT INTO auth_permission VALUES ('19', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO auth_permission VALUES ('20', 'Can view content type', '5', 'view_contenttype');
INSERT INTO auth_permission VALUES ('21', 'Can add session', '6', 'add_session');
INSERT INTO auth_permission VALUES ('22', 'Can change session', '6', 'change_session');
INSERT INTO auth_permission VALUES ('23', 'Can delete session', '6', 'delete_session');
INSERT INTO auth_permission VALUES ('24', 'Can view session', '6', 'view_session');
INSERT INTO auth_permission VALUES ('25', 'Can add Token', '7', 'add_token');
INSERT INTO auth_permission VALUES ('26', 'Can change Token', '7', 'change_token');
INSERT INTO auth_permission VALUES ('27', 'Can delete Token', '7', 'delete_token');
INSERT INTO auth_permission VALUES ('28', 'Can view Token', '7', 'view_token');
INSERT INTO auth_permission VALUES ('29', 'Can add Token', '8', 'add_tokenproxy');
INSERT INTO auth_permission VALUES ('30', 'Can change Token', '8', 'change_tokenproxy');
INSERT INTO auth_permission VALUES ('31', 'Can delete Token', '8', 'delete_tokenproxy');
INSERT INTO auth_permission VALUES ('32', 'Can view Token', '8', 'view_tokenproxy');
INSERT INTO auth_permission VALUES ('33', 'Can add area', '9', 'add_area');
INSERT INTO auth_permission VALUES ('34', 'Can change area', '9', 'change_area');
INSERT INTO auth_permission VALUES ('35', 'Can delete area', '9', 'delete_area');
INSERT INTO auth_permission VALUES ('36', 'Can view area', '9', 'view_area');
INSERT INTO auth_permission VALUES ('37', 'Can add classification', '10', 'add_classification');
INSERT INTO auth_permission VALUES ('38', 'Can change classification', '10', 'change_classification');
INSERT INTO auth_permission VALUES ('39', 'Can delete classification', '10', 'delete_classification');
INSERT INTO auth_permission VALUES ('40', 'Can view classification', '10', 'view_classification');
INSERT INTO auth_permission VALUES ('41', 'Can add measurement', '11', 'add_measurement');
INSERT INTO auth_permission VALUES ('42', 'Can change measurement', '11', 'change_measurement');
INSERT INTO auth_permission VALUES ('43', 'Can delete measurement', '11', 'delete_measurement');
INSERT INTO auth_permission VALUES ('44', 'Can view measurement', '11', 'view_measurement');
INSERT INTO auth_permission VALUES ('45', 'Can add monthly consumption total', '12', 'add_monthlyconsumptiontotal');
INSERT INTO auth_permission VALUES ('46', 'Can change monthly consumption total', '12', 'change_monthlyconsumptiontotal');
INSERT INTO auth_permission VALUES ('47', 'Can delete monthly consumption total', '12', 'delete_monthlyconsumptiontotal');
INSERT INTO auth_permission VALUES ('48', 'Can view monthly consumption total', '12', 'view_monthlyconsumptiontotal');
INSERT INTO auth_permission VALUES ('49', 'Can add purpose', '13', 'add_purpose');
INSERT INTO auth_permission VALUES ('50', 'Can change purpose', '13', 'change_purpose');
INSERT INTO auth_permission VALUES ('51', 'Can delete purpose', '13', 'delete_purpose');
INSERT INTO auth_permission VALUES ('52', 'Can view purpose', '13', 'view_purpose');
INSERT INTO auth_permission VALUES ('53', 'Can add section', '14', 'add_section');
INSERT INTO auth_permission VALUES ('54', 'Can change section', '14', 'change_section');
INSERT INTO auth_permission VALUES ('55', 'Can delete section', '14', 'delete_section');
INSERT INTO auth_permission VALUES ('56', 'Can view section', '14', 'view_section');
INSERT INTO auth_permission VALUES ('57', 'Can add item', '15', 'add_item');
INSERT INTO auth_permission VALUES ('58', 'Can change item', '15', 'change_item');
INSERT INTO auth_permission VALUES ('59', 'Can delete item', '15', 'delete_item');
INSERT INTO auth_permission VALUES ('60', 'Can view item', '15', 'view_item');
INSERT INTO auth_permission VALUES ('61', 'Can add beginning balance', '16', 'add_beginningbalance');
INSERT INTO auth_permission VALUES ('62', 'Can change beginning balance', '16', 'change_beginningbalance');
INSERT INTO auth_permission VALUES ('63', 'Can delete beginning balance', '16', 'delete_beginningbalance');
INSERT INTO auth_permission VALUES ('64', 'Can view beginning balance', '16', 'view_beginningbalance');
INSERT INTO auth_permission VALUES ('65', 'Can add running balance', '17', 'add_runningbalance');
INSERT INTO auth_permission VALUES ('66', 'Can change running balance', '17', 'change_runningbalance');
INSERT INTO auth_permission VALUES ('67', 'Can delete running balance', '17', 'delete_runningbalance');
INSERT INTO auth_permission VALUES ('68', 'Can view running balance', '17', 'view_runningbalance');
INSERT INTO auth_permission VALUES ('69', 'Can add transaction details', '18', 'add_transactiondetails');
INSERT INTO auth_permission VALUES ('70', 'Can change transaction details', '18', 'change_transactiondetails');
INSERT INTO auth_permission VALUES ('71', 'Can delete transaction details', '18', 'delete_transactiondetails');
INSERT INTO auth_permission VALUES ('72', 'Can view transaction details', '18', 'view_transactiondetails');
INSERT INTO auth_permission VALUES ('73', 'Can add transaction product', '19', 'add_transactionproduct');
INSERT INTO auth_permission VALUES ('74', 'Can change transaction product', '19', 'change_transactionproduct');
INSERT INTO auth_permission VALUES ('75', 'Can delete transaction product', '19', 'delete_transactionproduct');
INSERT INTO auth_permission VALUES ('76', 'Can view transaction product', '19', 'view_transactionproduct');
INSERT INTO auth_permission VALUES ('77', 'Can add monthly consumption', '20', 'add_monthlyconsumption');
INSERT INTO auth_permission VALUES ('78', 'Can change monthly consumption', '20', 'change_monthlyconsumption');
INSERT INTO auth_permission VALUES ('79', 'Can delete monthly consumption', '20', 'delete_monthlyconsumption');
INSERT INTO auth_permission VALUES ('80', 'Can view monthly consumption', '20', 'view_monthlyconsumption');

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

INSERT INTO auth_user VALUES ('1', 'pbkdf2_sha256$870000$Ybfzcnud6KZtN3NWEVf4BC$/yDP9tUlaivTNYmxuIjlZvmeqvUq6QFu1iSd8afXWXw=', NULL, '1', 'admin', '', '', 'admin@gmail.com', '1', '1', '2025-03-07 05:24:58.545586');

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

INSERT INTO authtoken_token VALUES ('6d96649b73fd62238d835c081db5c7fb8398609b', '2025-03-07 05:33:24.872606', '1');

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

INSERT INTO django_content_type VALUES ('1', 'admin', 'logentry');
INSERT INTO django_content_type VALUES ('3', 'auth', 'group');
INSERT INTO django_content_type VALUES ('2', 'auth', 'permission');
INSERT INTO django_content_type VALUES ('4', 'auth', 'user');
INSERT INTO django_content_type VALUES ('7', 'authtoken', 'token');
INSERT INTO django_content_type VALUES ('8', 'authtoken', 'tokenproxy');
INSERT INTO django_content_type VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO django_content_type VALUES ('9', 'ims', 'area');
INSERT INTO django_content_type VALUES ('16', 'ims', 'beginningbalance');
INSERT INTO django_content_type VALUES ('10', 'ims', 'classification');
INSERT INTO django_content_type VALUES ('15', 'ims', 'item');
INSERT INTO django_content_type VALUES ('11', 'ims', 'measurement');
INSERT INTO django_content_type VALUES ('20', 'ims', 'monthlyconsumption');
INSERT INTO django_content_type VALUES ('12', 'ims', 'monthlyconsumptiontotal');
INSERT INTO django_content_type VALUES ('13', 'ims', 'purpose');
INSERT INTO django_content_type VALUES ('17', 'ims', 'runningbalance');
INSERT INTO django_content_type VALUES ('14', 'ims', 'section');
INSERT INTO django_content_type VALUES ('18', 'ims', 'transactiondetails');
INSERT INTO django_content_type VALUES ('19', 'ims', 'transactionproduct');
INSERT INTO django_content_type VALUES ('6', 'sessions', 'session');

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO django_migrations VALUES ('1', 'contenttypes', '0001_initial', '2025-03-07 05:24:43.542191');
INSERT INTO django_migrations VALUES ('2', 'auth', '0001_initial', '2025-03-07 05:24:44.179361');
INSERT INTO django_migrations VALUES ('3', 'admin', '0001_initial', '2025-03-07 05:24:44.352103');
INSERT INTO django_migrations VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2025-03-07 05:24:44.364419');
INSERT INTO django_migrations VALUES ('5', 'admin', '0003_logentry_add_action_flag_choices', '2025-03-07 05:24:44.378801');
INSERT INTO django_migrations VALUES ('6', 'contenttypes', '0002_remove_content_type_name', '2025-03-07 05:24:44.513481');
INSERT INTO django_migrations VALUES ('7', 'auth', '0002_alter_permission_name_max_length', '2025-03-07 05:24:44.609796');
INSERT INTO django_migrations VALUES ('8', 'auth', '0003_alter_user_email_max_length', '2025-03-07 05:24:44.670289');
INSERT INTO django_migrations VALUES ('9', 'auth', '0004_alter_user_username_opts', '2025-03-07 05:24:44.686570');
INSERT INTO django_migrations VALUES ('10', 'auth', '0005_alter_user_last_login_null', '2025-03-07 05:24:44.776051');
INSERT INTO django_migrations VALUES ('11', 'auth', '0006_require_contenttypes_0002', '2025-03-07 05:24:44.780391');
INSERT INTO django_migrations VALUES ('12', 'auth', '0007_alter_validators_add_error_messages', '2025-03-07 05:24:44.794951');
INSERT INTO django_migrations VALUES ('13', 'auth', '0008_alter_user_username_max_length', '2025-03-07 05:24:44.891472');
INSERT INTO django_migrations VALUES ('14', 'auth', '0009_alter_user_last_name_max_length', '2025-03-07 05:24:44.988180');
INSERT INTO django_migrations VALUES ('15', 'auth', '0010_alter_group_name_max_length', '2025-03-07 05:24:45.020150');
INSERT INTO django_migrations VALUES ('16', 'auth', '0011_update_proxy_permissions', '2025-03-07 05:24:45.038193');
INSERT INTO django_migrations VALUES ('17', 'auth', '0012_alter_user_first_name_max_length', '2025-03-07 05:24:45.127908');
INSERT INTO django_migrations VALUES ('18', 'authtoken', '0001_initial', '2025-03-07 05:24:45.225433');
INSERT INTO django_migrations VALUES ('19', 'authtoken', '0002_auto_20160226_1747', '2025-03-07 05:24:45.271156');
INSERT INTO django_migrations VALUES ('20', 'authtoken', '0003_tokenproxy', '2025-03-07 05:24:45.277327');
INSERT INTO django_migrations VALUES ('21', 'authtoken', '0004_alter_tokenproxy_options', '2025-03-07 05:24:45.286412');
INSERT INTO django_migrations VALUES ('22', 'ims', '0001_initial', '2025-03-07 05:24:46.487246');
INSERT INTO django_migrations VALUES ('23', 'sessions', '0001_initial', '2025-03-07 05:24:46.535093');

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

INSERT INTO ims_area VALUES ('1', 'N/A');
INSERT INTO ims_area VALUES ('2', 'Casile');
INSERT INTO ims_area VALUES ('3', 'Diezmo');
INSERT INTO ims_area VALUES ('4', 'PS1');
INSERT INTO ims_area VALUES ('5', 'PS2');
INSERT INTO ims_area VALUES ('6', 'PS3');

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

INSERT INTO ims_beginningbalance VALUES ('1', '01-001', 'Chlorine Dioxide - Liquid', '0', '0.0', '0.0', '2025-03-07 05:25:14.575701', '22');
INSERT INTO ims_beginningbalance VALUES ('2', '01-002', 'Chlorine Dioxide - Powder', '0', '0.0', '0.0', '2025-03-07 05:25:14.593760', '9');
INSERT INTO ims_beginningbalance VALUES ('3', '01-003', 'Chlorine Granules', '0', '0.0', '0.0', '2025-03-07 05:25:14.612154', '9');
INSERT INTO ims_beginningbalance VALUES ('4', '02-001', 'Asphalt', '0', '0.0', '0.0', '2025-03-07 05:25:14.633202', '10');
INSERT INTO ims_beginningbalance VALUES ('5', '02-002', 'Cement- RIZAL', '0', '0.0', '0.0', '2025-03-07 05:25:14.651446', '4');
INSERT INTO ims_beginningbalance VALUES ('6', '02-003', 'Gravel', '0', '0.0', '0.0', '2025-03-07 05:25:14.669957', '19');
INSERT INTO ims_beginningbalance VALUES ('7', '02-004', 'White Sand', '0', '0.0', '0.0', '2025-03-07 05:25:14.688544', '19');
INSERT INTO ims_beginningbalance VALUES ('8', '02-005', 'Concrete Hollow Blocks', '0', '0.0', '0.0', '2025-03-07 05:25:14.706401', '1');
INSERT INTO ims_beginningbalance VALUES ('9', '02-006', 'Flexible Hose- Flexible Oppo', '0', '0.0', '0.0', '2025-03-07 05:25:14.724776', '15');
INSERT INTO ims_beginningbalance VALUES ('10', '02-007', 'C-Clamp PVC', '0', '0.0', '0.0', '2025-03-07 05:25:14.743060', '19');
INSERT INTO ims_beginningbalance VALUES ('11', '02-008', 'THHN 14" - BOSTON', '0', '0.0', '0.0', '2025-03-07 05:25:14.760368', '19');
INSERT INTO ims_beginningbalance VALUES ('12', '02-009', 'FI Hose 1/2 x 1/2 x 24', '0', '0.0', '0.0', '2025-03-07 05:25:14.776464', '19');
INSERT INTO ims_beginningbalance VALUES ('13', '02-010', 'Flexible Hose 1/2 X 50 - OMEGA', '0', '0.0', '0.0', '2025-03-07 05:25:14.794609', '20');
INSERT INTO ims_beginningbalance VALUES ('14', '02-011', 'Flexible Hose 3/8', '0', '0.0', '0.0', '2025-03-07 05:25:14.814526', '19');
INSERT INTO ims_beginningbalance VALUES ('15', '02-012', 'Skim Coat- ABC', '0', '0.0', '0.0', '2025-03-07 05:25:14.831815', '19');
INSERT INTO ims_beginningbalance VALUES ('16', '02-013', 'Angle Valve 1/2 x 3/8', '0', '0.0', '0.0', '2025-03-07 05:25:14.849364', '19');
INSERT INTO ims_beginningbalance VALUES ('17', '02-014', 'Angle Valve 1/2 x 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:14.868033', '19');
INSERT INTO ims_beginningbalance VALUES ('18', '02-015', 'Angle Valve 1/2 x 3/4', '0', '0.0', '0.0', '2025-03-07 05:25:14.887764', '19');
INSERT INTO ims_beginningbalance VALUES ('19', '02-016', 'C Purlins 2x3 GI 1.4', '0', '0.0', '0.0', '2025-03-07 05:25:14.906851', '19');
INSERT INTO ims_beginningbalance VALUES ('20', '02-017', 'Angel Bar 4.5mm x 2', '0', '0.0', '0.0', '2025-03-07 05:25:14.924888', '19');
INSERT INTO ims_beginningbalance VALUES ('21', '02-018', 'Goose Neck Faucet- SUNRISE', '0', '0.0', '0.0', '2025-03-07 05:25:14.941615', '19');
INSERT INTO ims_beginningbalance VALUES ('22', '02-019', 'Lavatory Valve', '0', '0.0', '0.0', '2025-03-07 05:25:14.959072', '19');
INSERT INTO ims_beginningbalance VALUES ('23', '02-020', 'Faucet Brass hose Bibb- HAWK', '0', '0.0', '0.0', '2025-03-07 05:25:14.977947', '19');
INSERT INTO ims_beginningbalance VALUES ('24', '02-021', 'Two-Way Faucet Valve', '0', '0.0', '0.0', '2025-03-07 05:25:14.996077', '19');
INSERT INTO ims_beginningbalance VALUES ('25', '02-022', 'Lavatory Faucet', '0', '0.0', '0.0', '2025-03-07 05:25:15.013307', '19');
INSERT INTO ims_beginningbalance VALUES ('26', '02-023', 'Diamond Cutting Disc', '0', '0.0', '0.0', '2025-03-07 05:25:15.032267', '19');
INSERT INTO ims_beginningbalance VALUES ('27', '02-024', 'Cable Tie 6 x 2mm - POWER HOUSE', '0', '0.0', '0.0', '2025-03-07 05:25:15.050167', '16');
INSERT INTO ims_beginningbalance VALUES ('28', '02-025', 'Padlock - Hardware', '0', '0.0', '0.0', '2025-03-07 05:25:15.067539', '19');
INSERT INTO ims_beginningbalance VALUES ('29', '02-026', 'Hardiflex 3/16 - JAMES HARDI', '0', '0.0', '0.0', '2025-03-07 05:25:15.085150', '19');
INSERT INTO ims_beginningbalance VALUES ('30', '02-027', 'Two Gang Outlet - ROYU', '0', '0.0', '0.0', '2025-03-07 05:25:15.103735', '19');
INSERT INTO ims_beginningbalance VALUES ('31', '02-028', 'Hook', '0', '0.0', '0.0', '2025-03-07 05:25:15.121972', '19');
INSERT INTO ims_beginningbalance VALUES ('32', '02-029', 'Aluminum Silver (PAINT)', '0', '0.0', '0.0', '2025-03-07 05:25:15.140346', '19');
INSERT INTO ims_beginningbalance VALUES ('33', '02-030', 'Welding Rod 6013 Special- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:15.157554', '11');
INSERT INTO ims_beginningbalance VALUES ('34', '02-031', 'Tie Wire', '0', '0.0', '0.0', '2025-03-07 05:25:15.176254', '11');
INSERT INTO ims_beginningbalance VALUES ('35', '02-032', 'Bosny Black- Pylox', '0', '0.0', '0.0', '2025-03-07 05:25:15.193719', '8');
INSERT INTO ims_beginningbalance VALUES ('36', '02-033', 'Electrical Tape- BIG Armak', '0', '0.0', '0.0', '2025-03-07 05:25:15.211424', '19');
INSERT INTO ims_beginningbalance VALUES ('37', '02-034', 'Masking Tape 3/4', '0', '0.0', '0.0', '2025-03-07 05:25:15.229334', '19');
INSERT INTO ims_beginningbalance VALUES ('38', '02-035', 'Regular Plug', '0', '0.0', '0.0', '2025-03-07 05:25:15.252726', '19');
INSERT INTO ims_beginningbalance VALUES ('39', '02-036', 'Three Gang Outlet', '0', '0.0', '0.0', '2025-03-07 05:25:15.275700', '19');
INSERT INTO ims_beginningbalance VALUES ('40', '02-037', 'Marine Ply Wood - 3/4', '0', '0.0', '0.0', '2025-03-07 05:25:15.299970', '19');
INSERT INTO ims_beginningbalance VALUES ('41', '02-038', 'Barateha', '0', '0.0', '0.0', '2025-03-07 05:25:15.323025', '19');
INSERT INTO ims_beginningbalance VALUES ('42', '02-039', 'Piano Hinges', '0', '0.0', '0.0', '2025-03-07 05:25:15.344171', '19');
INSERT INTO ims_beginningbalance VALUES ('43', '02-040', 'Concrete Nail 1 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:15.363090', '11');
INSERT INTO ims_beginningbalance VALUES ('44', '02-041', 'Stikwel - Wood Glue', '0', '0.0', '0.0', '2025-03-07 05:25:15.380308', '12');
INSERT INTO ims_beginningbalance VALUES ('45', '02-042', 'Cabinet Handle', '0', '0.0', '0.0', '2025-03-07 05:25:15.398458', '19');
INSERT INTO ims_beginningbalance VALUES ('46', '02-043', 'Thalo blue - Acrylic', '0', '0.0', '0.0', '2025-03-07 05:25:15.417900', '12');
INSERT INTO ims_beginningbalance VALUES ('47', '02-044', 'THHN 12" - BOSTON', '0', '0.0', '0.0', '2025-03-07 05:25:15.435659', '5');
INSERT INTO ims_beginningbalance VALUES ('48', '02-045', 'THNN 14 - BOSTON', '0', '0.0', '0.0', '2025-03-07 05:25:15.453401', '5');
INSERT INTO ims_beginningbalance VALUES ('49', '02-046', 'BLIND RIVITS 1/8 X 3/4', '0', '0.0', '0.0', '2025-03-07 05:25:15.471525', '5');
INSERT INTO ims_beginningbalance VALUES ('50', '02-047', 'Cement spoon', '0', '0.0', '0.0', '2025-03-07 05:25:15.488361', '19');
INSERT INTO ims_beginningbalance VALUES ('51', '02-048', 'Tubular 1 x 1 1.4', '0', '0.0', '0.0', '2025-03-07 05:25:15.505415', '19');
INSERT INTO ims_beginningbalance VALUES ('52', '02-049', 'Cylindrical Hinges 3/4', '0', '0.0', '0.0', '2025-03-07 05:25:15.522559', '19');
INSERT INTO ims_beginningbalance VALUES ('53', '02-050', 'Door Knob', '0', '0.0', '0.0', '2025-03-07 05:25:15.540460', '19');
INSERT INTO ims_beginningbalance VALUES ('54', '02-051', 'Deform Bar - 10mm', '0', '0.0', '0.0', '2025-03-07 05:25:15.558905', '19');
INSERT INTO ims_beginningbalance VALUES ('55', '02-052', 'PVC Door 60 x 210 w/ Hinges', '0', '0.0', '0.0', '2025-03-07 05:25:15.579204', '19');
INSERT INTO ims_beginningbalance VALUES ('56', '02-053', 'Blue Clamp 1/2 - Hardware', '0', '0.0', '0.0', '2025-03-07 05:25:15.597061', '19');
INSERT INTO ims_beginningbalance VALUES ('57', '02-054', 'Solignum- All aroud', '0', '0.0', '0.0', '2025-03-07 05:25:15.615413', '12');
INSERT INTO ims_beginningbalance VALUES ('58', '02-055', 'Liha - 1000 & 100', '0', '0.0', '0.0', '2025-03-07 05:25:15.633275', '19');
INSERT INTO ims_beginningbalance VALUES ('59', '02-056', 'Tansi', '0', '0.0', '0.0', '2025-03-07 05:25:15.650655', '20');
INSERT INTO ims_beginningbalance VALUES ('60', '02-057', 'Drill bit 5/16', '0', '0.0', '0.0', '2025-03-07 05:25:15.668689', '19');
INSERT INTO ims_beginningbalance VALUES ('61', '02-058', 'Chalk stone', '0', '0.0', '0.0', '2025-03-07 05:25:15.685848', '19');
INSERT INTO ims_beginningbalance VALUES ('62', '02-059', 'Epoxy primer', '0', '0.0', '0.0', '2025-03-07 05:25:15.704437', '12');
INSERT INTO ims_beginningbalance VALUES ('63', '02-060', 'Latex Gloss - Paint', '0', '0.0', '0.0', '2025-03-07 05:25:15.723367', '12');
INSERT INTO ims_beginningbalance VALUES ('64', '02-061', 'Sahara- ( water proofing )', '0', '0.0', '0.0', '2025-03-07 05:25:15.741199', '19');
INSERT INTO ims_beginningbalance VALUES ('65', '02-062', 'Singer Oil', '0', '0.0', '0.0', '2025-03-07 05:25:15.759156', '19');
INSERT INTO ims_beginningbalance VALUES ('66', '02-063', 'Varnish', '0', '0.0', '0.0', '2025-03-07 05:25:15.776871', '12');
INSERT INTO ims_beginningbalance VALUES ('67', '02-064', 'Rust Converter', '0', '0.0', '0.0', '2025-03-07 05:25:15.794079', '19');
INSERT INTO ims_beginningbalance VALUES ('68', '02-065', 'WD - 40', '0', '0.0', '0.0', '2025-03-07 05:25:15.812886', '19');
INSERT INTO ims_beginningbalance VALUES ('69', '02-066', 'Tape Measure', '0', '0.0', '0.0', '2025-03-07 05:25:15.831587', '19');
INSERT INTO ims_beginningbalance VALUES ('70', '02-067', 'C. Clamp 3/4', '0', '0.0', '0.0', '2025-03-07 05:25:15.849314', '19');
INSERT INTO ims_beginningbalance VALUES ('71', '02-068', 'C. Clamp 1"', '0', '0.0', '0.0', '2025-03-07 05:25:15.867842', '19');
INSERT INTO ims_beginningbalance VALUES ('72', '02-069', 'Single Switch', '0', '0.0', '0.0', '2025-03-07 05:25:15.885605', '19');
INSERT INTO ims_beginningbalance VALUES ('73', '02-070', 'Receptacle 4 x 4 - omni', '0', '0.0', '0.0', '2025-03-07 05:25:15.903562', '19');
INSERT INTO ims_beginningbalance VALUES ('74', '02-071', 'Junction Box 4 x 4 - pvc', '0', '0.0', '0.0', '2025-03-07 05:25:15.921726', '19');
INSERT INTO ims_beginningbalance VALUES ('75', '02-072', 'Utility Box 2 x 4 - pvc  - ROYU', '0', '0.0', '0.0', '2025-03-07 05:25:15.940697', '19');
INSERT INTO ims_beginningbalance VALUES ('76', '02-073', '1 Gang Switch- Panasonic', '0', '0.0', '0.0', '2025-03-07 05:25:15.959430', '21');
INSERT INTO ims_beginningbalance VALUES ('77', '02-074', '2 Gang Switch- Royu', '0', '0.0', '0.0', '2025-03-07 05:25:15.976974', '21');
INSERT INTO ims_beginningbalance VALUES ('78', '02-075', 'Flat Hose 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:15.995204', '20');
INSERT INTO ims_beginningbalance VALUES ('79', '02-076', '2 Gang Outlet- Panasonic', '0', '0.0', '0.0', '2025-03-07 05:25:16.014404', '21');
INSERT INTO ims_beginningbalance VALUES ('80', '02-077', 'Blind Rivits 5/32 x 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:16.034544', '5');
INSERT INTO ims_beginningbalance VALUES ('81', '02-078', 'Bathroom Bidet-  SUNRISE', '0', '0.0', '0.0', '2025-03-07 05:25:16.052305', '21');
INSERT INTO ims_beginningbalance VALUES ('82', '02-079', 'Concrete nail #2', '0', '0.0', '0.0', '2025-03-07 05:25:16.069385', '11');
INSERT INTO ims_beginningbalance VALUES ('83', '02-080', 'Concrete nail #3', '0', '0.0', '0.0', '2025-03-07 05:25:16.088360', '11');
INSERT INTO ims_beginningbalance VALUES ('84', '02-081', 'Tek screw 1 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:16.106433', '19');
INSERT INTO ims_beginningbalance VALUES ('85', '02-082', 'Hand Riveter', '0', '0.0', '0.0', '2025-03-07 05:25:16.125102', '19');
INSERT INTO ims_beginningbalance VALUES ('86', '02-083', 'Tank Lever Flush', '0', '0.0', '0.0', '2025-03-07 05:25:16.144254', '19');
INSERT INTO ims_beginningbalance VALUES ('87', '02-084', 'Tank Fittings', '0', '0.0', '0.0', '2025-03-07 05:25:16.163463', '21');
INSERT INTO ims_beginningbalance VALUES ('88', '02-085', 'Electrical PVC Pipe 1/2 - (Orange)', '0', '0.0', '0.0', '2025-03-07 05:25:16.182610', '19');
INSERT INTO ims_beginningbalance VALUES ('89', '02-086', 'PVC Pipe 4" ( Orange )', '0', '0.0', '0.0', '2025-03-07 05:25:16.201534', '19');
INSERT INTO ims_beginningbalance VALUES ('90', '02-087', 'Elbow  4" ( Orange )', '0', '0.0', '0.0', '2025-03-07 05:25:16.220520', '19');
INSERT INTO ims_beginningbalance VALUES ('91', '02-088', 'Clean Out Cover 4" pvc', '0', '0.0', '0.0', '2025-03-07 05:25:16.240224', '19');
INSERT INTO ims_beginningbalance VALUES ('92', '02-089', 'Pollituff', '0', '0.0', '0.0', '2025-03-07 05:25:16.258153', '12');
INSERT INTO ims_beginningbalance VALUES ('93', '02-090', 'Hardener Cream', '0', '0.0', '0.0', '2025-03-07 05:25:16.275069', '19');
INSERT INTO ims_beginningbalance VALUES ('94', '02-091', 'Submeter', '0', '0.0', '0.0', '2025-03-07 05:25:16.293248', '19');
INSERT INTO ims_beginningbalance VALUES ('95', '02-092', 'Expansion Bolt 3/5 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:16.311517', '19');
INSERT INTO ims_beginningbalance VALUES ('96', '02-093', 'Hinges 3 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:16.330062', '19');
INSERT INTO ims_beginningbalance VALUES ('97', '02-094', 'Plug Adapter', '0', '0.0', '0.0', '2025-03-07 05:25:16.352235', '19');
INSERT INTO ims_beginningbalance VALUES ('98', '02-095', 'Grinding Disc- For Finishing', '0', '0.0', '0.0', '2025-03-07 05:25:16.372355', '19');
INSERT INTO ims_beginningbalance VALUES ('99', '02-096', 'Spatula', '0', '0.0', '0.0', '2025-03-07 05:25:16.391498', '19');
INSERT INTO ims_beginningbalance VALUES ('100', '02-097', 'Wall Scrapper - (Paleta)', '0', '0.0', '0.0', '2025-03-07 05:25:16.412500', '19');
INSERT INTO ims_beginningbalance VALUES ('101', '02-098', 'Blind Rivits  1/8 x 1/2 - LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:16.429980', '5');
INSERT INTO ims_beginningbalance VALUES ('102', '02-099', 'Gunting ng Yero', '0', '0.0', '0.0', '2025-03-07 05:25:16.447146', '19');
INSERT INTO ims_beginningbalance VALUES ('103', '02-100', 'Paint Remover', '0', '0.0', '0.0', '2025-03-07 05:25:16.464329', '19');
INSERT INTO ims_beginningbalance VALUES ('104', '02-101', 'Rugby', '0', '0.0', '0.0', '2025-03-07 05:25:16.482281', '6');
INSERT INTO ims_beginningbalance VALUES ('105', '02-102', 'Rodela - Bakal', '0', '0.0', '0.0', '2025-03-07 05:25:16.500564', '19');
INSERT INTO ims_beginningbalance VALUES ('106', '02-103', 'Rodela - Kahoy', '0', '0.0', '0.0', '2025-03-07 05:25:16.518884', '19');
INSERT INTO ims_beginningbalance VALUES ('107', '02-104', 'Elasto Seal - water proofing sealant', '0', '0.0', '0.0', '2025-03-07 05:25:16.536334', '19');
INSERT INTO ims_beginningbalance VALUES ('108', '02-105', 'Rope', '0', '0.0', '0.0', '2025-03-07 05:25:16.552393', '14');
INSERT INTO ims_beginningbalance VALUES ('109', '02-106', 'Circuit Breaker - 60A PLUG IN- GE', '0', '0.0', '0.0', '2025-03-07 05:25:16.570605', '19');
INSERT INTO ims_beginningbalance VALUES ('110', '02-107', 'Toks screw', '0', '0.0', '0.0', '2025-03-07 05:25:16.587939', '19');
INSERT INTO ims_beginningbalance VALUES ('111', '02-108', 'Elbow 2" Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.605814', '19');
INSERT INTO ims_beginningbalance VALUES ('112', '02-109', 'PVC 2" Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.623797', '19');
INSERT INTO ims_beginningbalance VALUES ('113', '02-110', 'Square Bar 10mm', '0', '0.0', '0.0', '2025-03-07 05:25:16.641548', '19');
INSERT INTO ims_beginningbalance VALUES ('114', '02-111', 'Sealant', '0', '0.0', '0.0', '2025-03-07 05:25:16.658677', '19');
INSERT INTO ims_beginningbalance VALUES ('115', '02-112', 'Faucet - 6"', '0', '0.0', '0.0', '2025-03-07 05:25:16.676608', '19');
INSERT INTO ims_beginningbalance VALUES ('116', '02-113', 'C. Clamp 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:16.693768', '19');
INSERT INTO ims_beginningbalance VALUES ('117', '02-114', 'Cocolumber 2 x 3 x 12', '0', '0.0', '0.0', '2025-03-07 05:25:16.710503', '19');
INSERT INTO ims_beginningbalance VALUES ('118', '02-115', 'Flat Cord #14', '0', '0.0', '0.0', '2025-03-07 05:25:16.728544', '14');
INSERT INTO ims_beginningbalance VALUES ('119', '02-116', 'Common Nail #3- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:16.746229', '11');
INSERT INTO ims_beginningbalance VALUES ('120', '02-117', 'Common Nail #2- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:16.762874', '11');
INSERT INTO ims_beginningbalance VALUES ('121', '02-118', 'Umbrella Nail', '0', '0.0', '0.0', '2025-03-07 05:25:16.780649', '11');
INSERT INTO ims_beginningbalance VALUES ('122', '02-119', 'PVC Elbow 3/4 - Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.798206', '19');
INSERT INTO ims_beginningbalance VALUES ('123', '02-120', 'PVC Pipe 3/4- Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.815068', '19');
INSERT INTO ims_beginningbalance VALUES ('124', '02-121', 'PVC Pipe 2" Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.832364', '19');
INSERT INTO ims_beginningbalance VALUES ('125', '02-122', 'PVC Pipe 3" Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.849301', '19');
INSERT INTO ims_beginningbalance VALUES ('126', '02-123', 'P- Trap 2" Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.867601', '19');
INSERT INTO ims_beginningbalance VALUES ('127', '02-124', 'Tee 2" Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.885049', '19');
INSERT INTO ims_beginningbalance VALUES ('128', '02-125', 'Elbow 3" Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.900912', '19');
INSERT INTO ims_beginningbalance VALUES ('129', '02-126', 'PVC- Y 3 x 2 -Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.920722', '19');
INSERT INTO ims_beginningbalance VALUES ('130', '02-127', 'Clean Out Cover 3" pvc', '0', '0.0', '0.0', '2025-03-07 05:25:16.937952', '19');
INSERT INTO ims_beginningbalance VALUES ('131', '02-128', 'Kiln Dry Wood- 1 1/2 x 2 x 12', '0', '0.0', '0.0', '2025-03-07 05:25:16.955794', '19');
INSERT INTO ims_beginningbalance VALUES ('132', '02-129', 'Kiln Dry Wood- 1/2 x 2 x 12', '0', '0.0', '0.0', '2025-03-07 05:25:16.973494', '19');
INSERT INTO ims_beginningbalance VALUES ('133', '02-130', 'Flat Disc', '0', '0.0', '0.0', '2025-03-07 05:25:16.991010', '19');
INSERT INTO ims_beginningbalance VALUES ('134', '02-131', 'Flat Nail 1"', '0', '0.0', '0.0', '2025-03-07 05:25:17.009206', '11');
INSERT INTO ims_beginningbalance VALUES ('135', '02-132', 'Flat Nail 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:17.027068', '11');
INSERT INTO ims_beginningbalance VALUES ('136', '02-133', 'Tile Trim', '0', '0.0', '0.0', '2025-03-07 05:25:17.045285', '19');
INSERT INTO ims_beginningbalance VALUES ('137', '02-134', 'Kitchen Sink', '0', '0.0', '0.0', '2025-03-07 05:25:17.063649', '19');
INSERT INTO ims_beginningbalance VALUES ('138', '02-135', 'PMR Strainer', '0', '0.0', '0.0', '2025-03-07 05:25:17.081290', '19');
INSERT INTO ims_beginningbalance VALUES ('139', '02-136', 'Flex Hose - 1/2 x 16', '0', '0.0', '0.0', '2025-03-07 05:25:17.099359', '19');
INSERT INTO ims_beginningbalance VALUES ('140', '02-137', 'Vulca Seal - BOSTIK', '0', '0.0', '0.0', '2025-03-07 05:25:17.117348', '12');
INSERT INTO ims_beginningbalance VALUES ('141', '02-138', 'Metal Furring 0.5', '0', '0.0', '0.0', '2025-03-07 05:25:17.136765', '19');
INSERT INTO ims_beginningbalance VALUES ('142', '02-139', 'QDE Enamel white', '0', '0.0', '0.0', '2025-03-07 05:25:17.155880', '2');
INSERT INTO ims_beginningbalance VALUES ('143', '02-140', 'Hamba 80 x 210', '0', '0.0', '0.0', '2025-03-07 05:25:17.173421', '19');
INSERT INTO ims_beginningbalance VALUES ('144', '02-141', 'Garden Hose 5/8- EXCEL', '0', '0.0', '0.0', '2025-03-07 05:25:17.191278', '14');
INSERT INTO ims_beginningbalance VALUES ('145', '02-142', 'Hose- connector', '0', '0.0', '0.0', '2025-03-07 05:25:17.208962', '18');
INSERT INTO ims_beginningbalance VALUES ('146', '02-143', 'PVC Pipe 1" -Orange', '0', '0.0', '0.0', '2025-03-07 05:25:17.227212', '18');
INSERT INTO ims_beginningbalance VALUES ('147', '02-144', 'PVC  Elbow 1" -Orange', '0', '0.0', '0.0', '2025-03-07 05:25:17.245776', '18');
INSERT INTO ims_beginningbalance VALUES ('148', '02-145', 'PVC  Male Adaptor 1" -Orange', '0', '0.0', '0.0', '2025-03-07 05:25:17.264224', '18');
INSERT INTO ims_beginningbalance VALUES ('149', '02-146', 'LED Light 15W - OMNI', '0', '0.0', '0.0', '2025-03-07 05:25:17.282273', '18');
INSERT INTO ims_beginningbalance VALUES ('150', '02-147', 'Baby Roller 4"- JUPITER', '0', '0.0', '0.0', '2025-03-07 05:25:17.300647', '18');
INSERT INTO ims_beginningbalance VALUES ('151', '02-148', 'Screw Bit', '0', '0.0', '0.0', '2025-03-07 05:25:17.317120', '18');
INSERT INTO ims_beginningbalance VALUES ('152', '02-149', 'End cap 1/2 PVC', '0', '0.0', '0.0', '2025-03-07 05:25:17.335449', '18');
INSERT INTO ims_beginningbalance VALUES ('153', '02-150', 'Toilet Bowl', '0', '0.0', '0.0', '2025-03-07 05:25:17.353055', '18');
INSERT INTO ims_beginningbalance VALUES ('154', '02-151', 'Cylindrical Hinges 1"', '0', '0.0', '0.0', '2025-03-07 05:25:17.370446', '18');
INSERT INTO ims_beginningbalance VALUES ('155', '02-152', 'Cylindrical Hinges 1/2"', '0', '0.0', '0.0', '2025-03-07 05:25:17.389319', '18');
INSERT INTO ims_beginningbalance VALUES ('156', '02-153', 'Blind Rivet 3/16 x 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:17.407614', '5');
INSERT INTO ims_beginningbalance VALUES ('157', '02-154', 'Universal Padlock -ACE', '0', '0.0', '0.0', '2025-03-07 05:25:17.425371', '19');
INSERT INTO ims_beginningbalance VALUES ('158', '02-155', 'Sand Paper', '0', '0.0', '0.0', '2025-03-07 05:25:17.442233', '7');
INSERT INTO ims_beginningbalance VALUES ('159', '02-156', 'Squala', '0', '0.0', '0.0', '2025-03-07 05:25:17.459580', '19');
INSERT INTO ims_beginningbalance VALUES ('160', '02-157', 'Hose Bibb Faucet', '0', '0.0', '0.0', '2025-03-07 05:25:17.479187', '19');
INSERT INTO ims_beginningbalance VALUES ('161', '02-158', 'Flexi Bond', '0', '0.0', '0.0', '2025-03-07 05:25:17.497633', '2');
INSERT INTO ims_beginningbalance VALUES ('162', '02-159', 'Paint Thinner- PUREE', '0', '0.0', '0.0', '2025-03-07 05:25:17.515737', '12');
INSERT INTO ims_beginningbalance VALUES ('163', '02-160', 'Rubber Tape', '0', '0.0', '0.0', '2025-03-07 05:25:17.533041', '19');
INSERT INTO ims_beginningbalance VALUES ('164', '02-161', 'Paint brush #2- HIPO', '0', '0.0', '0.0', '2025-03-07 05:25:17.551497', '19');
INSERT INTO ims_beginningbalance VALUES ('165', '02-162', 'Drill bit 1/8 - DOORMER', '0', '0.0', '0.0', '2025-03-07 05:25:17.568741', '19');
INSERT INTO ims_beginningbalance VALUES ('166', '02-163', 'Pipe 3/4 x 20 GI schd.40', '0', '0.0', '0.0', '2025-03-07 05:25:17.586336', '19');
INSERT INTO ims_beginningbalance VALUES ('167', '02-164', 'Circuit Breaker - 30 A PLUG IN- GE', '0', '0.0', '0.0', '2025-03-07 05:25:17.604435', '19');
INSERT INTO ims_beginningbalance VALUES ('168', '02-165', 'AC - Outlet', '0', '0.0', '0.0', '2025-03-07 05:25:17.621942', '19');
INSERT INTO ims_beginningbalance VALUES ('169', '02-166', 'Black Screw', '0', '0.0', '0.0', '2025-03-07 05:25:17.639375', '19');
INSERT INTO ims_beginningbalance VALUES ('170', '02-167', 'Insulation Foam', '0', '0.0', '0.0', '2025-03-07 05:25:17.658070', '14');
INSERT INTO ims_beginningbalance VALUES ('171', '02-168', 'Metal Furring 0.6', '0', '0.0', '0.0', '2025-03-07 05:25:17.675326', '19');
INSERT INTO ims_beginningbalance VALUES ('172', '02-169', '3 Gang Switch - Royu', '0', '0.0', '0.0', '2025-03-07 05:25:17.692434', '19');
INSERT INTO ims_beginningbalance VALUES ('173', '02-170', 'Universal Outlet - Royu', '0', '0.0', '0.0', '2025-03-07 05:25:17.709979', '19');
INSERT INTO ims_beginningbalance VALUES ('174', '02-171', '2 Gang- Royu', '0', '0.0', '0.0', '2025-03-07 05:25:17.729129', '19');
INSERT INTO ims_beginningbalance VALUES ('175', '02-172', '3 Gang- Royu', '0', '0.0', '0.0', '2025-03-07 05:25:17.747822', '21');
INSERT INTO ims_beginningbalance VALUES ('176', '02-173', 'National Universal Outlet', '0', '0.0', '0.0', '2025-03-07 05:25:17.765802', '19');
INSERT INTO ims_beginningbalance VALUES ('177', '02-174', 'National Outlet Classic', '0', '0.0', '0.0', '2025-03-07 05:25:17.782463', '19');
INSERT INTO ims_beginningbalance VALUES ('178', '02-175', 'Phenolic Board 3/4', '0', '0.0', '0.0', '2025-03-07 05:25:17.800373', '19');
INSERT INTO ims_beginningbalance VALUES ('179', '02-176', 'Lag Screw 3/1 x 13', '0', '0.0', '0.0', '2025-03-07 05:25:17.817453', '19');
INSERT INTO ims_beginningbalance VALUES ('180', '02-177', 'Sanding Sealer Lacquer', '0', '0.0', '0.0', '2025-03-07 05:25:17.835854', '2');
INSERT INTO ims_beginningbalance VALUES ('181', '02-178', 'Paint Brush #1- HIPO', '0', '0.0', '0.0', '2025-03-07 05:25:17.854348', '19');
INSERT INTO ims_beginningbalance VALUES ('182', '02-179', 'Metal Screw', '0', '0.0', '0.0', '2025-03-07 05:25:17.872395', '19');
INSERT INTO ims_beginningbalance VALUES ('183', '02-180', 'Mini Roller - Refill', '0', '0.0', '0.0', '2025-03-07 05:25:17.890066', '19');
INSERT INTO ims_beginningbalance VALUES ('184', '02-181', 'Electrode Holder- 300amps', '0', '0.0', '0.0', '2025-03-07 05:25:17.908907', '19');
INSERT INTO ims_beginningbalance VALUES ('185', '02-182', 'Sand Paper - #120', '0', '0.0', '0.0', '2025-03-07 05:25:17.938438', '19');
INSERT INTO ims_beginningbalance VALUES ('186', '02-183', 'Steel Brush', '0', '0.0', '0.0', '2025-03-07 05:25:17.961661', '19');
INSERT INTO ims_beginningbalance VALUES ('187', '02-184', 'Concrete Nail #4', '0', '0.0', '0.0', '2025-03-07 05:25:17.985018', '11');
INSERT INTO ims_beginningbalance VALUES ('188', '02-185', 'QDE black- Paint', '0', '0.0', '0.0', '2025-03-07 05:25:18.008250', '13');
INSERT INTO ims_beginningbalance VALUES ('189', '02-186', 'Panel Box - 4 hole 2x2', '0', '0.0', '0.0', '2025-03-07 05:25:18.027711', '18');
INSERT INTO ims_beginningbalance VALUES ('190', '02-187', 'Circuit Breaker - 20 A PLUG IN- GE', '0', '0.0', '0.0', '2025-03-07 05:25:18.047376', '18');
INSERT INTO ims_beginningbalance VALUES ('191', '02-188', 'Drill Bit 5/32', '0', '0.0', '0.0', '2025-03-07 05:25:18.065921', '18');
INSERT INTO ims_beginningbalance VALUES ('192', '02-189', 'Concrete Nail - # 1', '0', '0.0', '0.0', '2025-03-07 05:25:18.086247', '11');
INSERT INTO ims_beginningbalance VALUES ('193', '02-190', 'Mesh Tape / Gasa', '0', '0.0', '0.0', '2025-03-07 05:25:18.104023', '20');
INSERT INTO ims_beginningbalance VALUES ('194', '02-191', 'Adhesive - Cement - ABC', '0', '0.0', '0.0', '2025-03-07 05:25:18.121441', '3');
INSERT INTO ims_beginningbalance VALUES ('195', '02-192', 'QDE - Maple', '0', '0.0', '0.0', '2025-03-07 05:25:18.139134', '13');
INSERT INTO ims_beginningbalance VALUES ('196', '02-193', 'Angle Valve - 1/2 ( 3 way )', '0', '0.0', '0.0', '2025-03-07 05:25:18.156402', '19');
INSERT INTO ims_beginningbalance VALUES ('197', '02-194', 'Bolt and Nut - 10mm x 2 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:18.175437', '19');
INSERT INTO ims_beginningbalance VALUES ('198', '02-195', 'Drill Bit- 1/4 (concrete)', '0', '0.0', '0.0', '2025-03-07 05:25:18.193049', '19');
INSERT INTO ims_beginningbalance VALUES ('199', '02-196', 'Drill Bit- 3/16 (concrete)', '0', '0.0', '0.0', '2025-03-07 05:25:18.211142', '19');
INSERT INTO ims_beginningbalance VALUES ('200', '02-197', 'Screw w/ Tox - 3/16', '0', '0.0', '0.0', '2025-03-07 05:25:18.228665', '19');
INSERT INTO ims_beginningbalance VALUES ('201', '02-198', 'Flexible Hose - 1/2 x 1/2 x 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:18.246238', '19');
INSERT INTO ims_beginningbalance VALUES ('202', '02-199', 'Spring Door', '0', '0.0', '0.0', '2025-03-07 05:25:18.263860', '19');
INSERT INTO ims_beginningbalance VALUES ('203', '02-200', 'Flexible Hose - 1/2 x 1/2 x 1/8', '0', '0.0', '0.0', '2025-03-07 05:25:18.282626', '19');
INSERT INTO ims_beginningbalance VALUES ('204', '02-201', 'Lavatory Bracket', '0', '0.0', '0.0', '2025-03-07 05:25:18.300576', '19');
INSERT INTO ims_beginningbalance VALUES ('205', '02-202', 'Lavatory Fittings', '0', '0.0', '0.0', '2025-03-07 05:25:18.317533', '21');
INSERT INTO ims_beginningbalance VALUES ('206', '02-203', 'Dyna Bolt 5/16', '0', '0.0', '0.0', '2025-03-07 05:25:18.335313', '19');
INSERT INTO ims_beginningbalance VALUES ('207', '02-204', 'Terminal Battery', '0', '0.0', '0.0', '2025-03-07 05:25:18.352585', '19');
INSERT INTO ims_beginningbalance VALUES ('208', '02-205', 'Moulding Strips-  3/4- ATLANTA', '0', '0.0', '0.0', '2025-03-07 05:25:18.370732', '19');
INSERT INTO ims_beginningbalance VALUES ('209', '02-206', 'Atlanta PVC type - 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:18.388467', '19');
INSERT INTO ims_beginningbalance VALUES ('210', '02-207', 'Screw - #1', '0', '0.0', '0.0', '2025-03-07 05:25:18.405250', '19');
INSERT INTO ims_beginningbalance VALUES ('211', '02-208', 'Amco Box Outlet', '0', '0.0', '0.0', '2025-03-07 05:25:18.422927', '19');
INSERT INTO ims_beginningbalance VALUES ('212', '02-209', 'Plug In - 30 Amp', '0', '0.0', '0.0', '2025-03-07 05:25:18.440483', '19');
INSERT INTO ims_beginningbalance VALUES ('213', '02-210', 'Duct Tape', '0', '0.0', '0.0', '2025-03-07 05:25:18.457396', '19');
INSERT INTO ims_beginningbalance VALUES ('214', '02-211', 'Cutter Blade - hardware', '0', '0.0', '0.0', '2025-03-07 05:25:18.474430', '21');
INSERT INTO ims_beginningbalance VALUES ('215', '02-212', 'Paint Tray', '0', '0.0', '0.0', '2025-03-07 05:25:18.492189', '19');
INSERT INTO ims_beginningbalance VALUES ('216', '02-213', 'Half moon Wood', '0', '0.0', '0.0', '2025-03-07 05:25:18.510143', '19');
INSERT INTO ims_beginningbalance VALUES ('217', '02-214', 'Junction Box 4 x 2 - pvc - OMNI', '0', '0.0', '0.0', '2025-03-07 05:25:18.528958', '19');
INSERT INTO ims_beginningbalance VALUES ('218', '02-215', 'Pinlight Fixture Alum- AKARI', '0', '0.0', '0.0', '2025-03-07 05:25:18.547090', '19');
INSERT INTO ims_beginningbalance VALUES ('219', '02-216', 'LED Light- 9w -FIREFLY', '0', '0.0', '0.0', '2025-03-07 05:25:18.565253', '19');
INSERT INTO ims_beginningbalance VALUES ('220', '02-217', 'LED Ceiling Lamp Surface Type- 18w - OMNI', '0', '0.0', '0.0', '2025-03-07 05:25:18.584403', '19');
INSERT INTO ims_beginningbalance VALUES ('221', '02-218', '2 Gang Switch- PANASONIC', '0', '0.0', '0.0', '2025-03-07 05:25:18.601659', '19');
INSERT INTO ims_beginningbalance VALUES ('222', '02-219', '1 Gang 3 way Switch- PANASONIC', '0', '0.0', '0.0', '2025-03-07 05:25:18.619597', '19');
INSERT INTO ims_beginningbalance VALUES ('223', '02-220', '3 Gang Switch- PANASONIC', '0', '0.0', '0.0', '2025-03-07 05:25:18.638805', '19');
INSERT INTO ims_beginningbalance VALUES ('224', '02-221', 'Faucet Stainless - WATERGATE', '0', '0.0', '0.0', '2025-03-07 05:25:18.656949', '19');
INSERT INTO ims_beginningbalance VALUES ('225', '02-222', 'Faucet Brass - Gold -  WATERGATE', '0', '0.0', '0.0', '2025-03-07 05:25:18.676632', '19');
INSERT INTO ims_beginningbalance VALUES ('226', '02-223', 'Junction Box Cover - OMNI', '0', '0.0', '0.0', '2025-03-07 05:25:18.693461', '19');
INSERT INTO ims_beginningbalance VALUES ('227', '02-224', 'Hinges 35 x 35 x 2- GATEMAN', '0', '0.0', '0.0', '2025-03-07 05:25:18.711585', '19');
INSERT INTO ims_beginningbalance VALUES ('228', '02-225', 'Circuit breaker 60A bolt-On - GE', '0', '0.0', '0.0', '2025-03-07 05:25:18.728766', '19');
INSERT INTO ims_beginningbalance VALUES ('229', '02-226', 'Faucet hose bib white PVC - DOWEL', '0', '0.0', '0.0', '2025-03-07 05:25:18.746235', '19');
INSERT INTO ims_beginningbalance VALUES ('230', '02-227', 'Hose Clamp 5/8 -', '0', '0.0', '0.0', '2025-03-07 05:25:18.763824', '19');
INSERT INTO ims_beginningbalance VALUES ('231', '02-228', 'Angle Bar 5.0mm x 1 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:18.781535', '19');
INSERT INTO ims_beginningbalance VALUES ('232', '02-229', 'TILE 60 X 60 AK 6882', '0', '0.0', '0.0', '2025-03-07 05:25:18.799210', '19');
INSERT INTO ims_beginningbalance VALUES ('233', '02-230', 'TILE 60 X 60 AK 6889', '0', '0.0', '0.0', '2025-03-07 05:25:18.816502', '19');
INSERT INTO ims_beginningbalance VALUES ('234', '02-231', 'ALUM. Door Brown', '0', '0.0', '0.0', '2025-03-07 05:25:18.833914', '19');
INSERT INTO ims_beginningbalance VALUES ('235', '02-232', 'MJ Water Closet', '0', '0.0', '0.0', '2025-03-07 05:25:18.850718', '19');
INSERT INTO ims_beginningbalance VALUES ('236', '02-233', 'Grout White', '0', '0.0', '0.0', '2025-03-07 05:25:18.867967', '3');
INSERT INTO ims_beginningbalance VALUES ('237', '02-234', 'TILE 60 x 60 FC 6013', '0', '0.0', '0.0', '2025-03-07 05:25:18.885148', '19');
INSERT INTO ims_beginningbalance VALUES ('238', '02-235', 'Rib type 05.mm x 3.66m', '0', '0.0', '0.0', '2025-03-07 05:25:18.902250', '19');
INSERT INTO ims_beginningbalance VALUES ('239', '02-236', 'Rib type 05.mm x 3.05m', '0', '0.0', '0.0', '2025-03-07 05:25:18.921321', '19');
INSERT INTO ims_beginningbalance VALUES ('240', '02-237', 'Rib type 05.mm x 6.10m', '0', '0.0', '0.0', '2025-03-07 05:25:18.940574', '19');
INSERT INTO ims_beginningbalance VALUES ('241', '02-238', 'Tek screw 12 x 55 steel', '0', '0.0', '0.0', '2025-03-07 05:25:18.958462', '19');
INSERT INTO ims_beginningbalance VALUES ('242', '02-239', 'Panel Door 80 x 200  jamb 2 x 5 kd w/ holes', '0', '0.0', '0.0', '2025-03-07 05:25:18.976006', '21');
INSERT INTO ims_beginningbalance VALUES ('243', '02-240', 'Ply Wood  ORDINARY 1/2- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:18.994648', '19');
INSERT INTO ims_beginningbalance VALUES ('244', '02-241', 'Cocolumber 2 x 2 x 10FT- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:19.013162', '19');
INSERT INTO ims_beginningbalance VALUES ('245', '02-242', 'G.I. Wire #16', '0', '0.0', '0.0', '2025-03-07 05:25:19.031239', '11');
INSERT INTO ims_beginningbalance VALUES ('246', '02-243', 'Flat latex White - BOYSEN 30f - 100m', '0', '0.0', '0.0', '2025-03-07 05:25:19.049567', '17');
INSERT INTO ims_beginningbalance VALUES ('247', '02-244', 'Flat latex White -MENNISOTA 30f - 100m', '0', '0.0', '0.0', '2025-03-07 05:25:19.067138', '17');
INSERT INTO ims_beginningbalance VALUES ('248', '02-245', 'Flat latex White - COAT SAVER (solo88)', '0', '0.0', '0.0', '2025-03-07 05:25:19.084959', '17');
INSERT INTO ims_beginningbalance VALUES ('249', '02-246', 'Latex Gloss White- COAT SAVER (solo99)', '0', '0.0', '0.0', '2025-03-07 05:25:19.101708', '17');
INSERT INTO ims_beginningbalance VALUES ('250', '02-247', 'Roofing Paint Blue- RAIN OR SHINE', '0', '0.0', '0.0', '2025-03-07 05:25:19.119209', '17');
INSERT INTO ims_beginningbalance VALUES ('251', '02-248', 'Acry Color Raw Sienna -DESTINY', '0', '0.0', '0.0', '2025-03-07 05:25:19.137407', '8');
INSERT INTO ims_beginningbalance VALUES ('252', '02-249', 'Ting Ting Color Thalo Blue #16- DESTINY', '0', '0.0', '0.0', '2025-03-07 05:25:19.155210', '8');
INSERT INTO ims_beginningbalance VALUES ('253', '02-250', 'Ting Ting Color Thalo Blue - BOYSEN (B2306)', '0', '0.0', '0.0', '2025-03-07 05:25:19.172750', '8');
INSERT INTO ims_beginningbalance VALUES ('254', '02-251', 'Pylox Spray Paint Sky Blue', '0', '0.0', '0.0', '2025-03-07 05:25:19.191290', '8');
INSERT INTO ims_beginningbalance VALUES ('255', '02-252', 'Pylox Spray Paint Silver', '0', '0.0', '0.0', '2025-03-07 05:25:19.209467', '8');
INSERT INTO ims_beginningbalance VALUES ('256', '02-253', 'Spray Paint Pearl White- SAMURAI', '0', '0.0', '0.0', '2025-03-07 05:25:19.227851', '8');
INSERT INTO ims_beginningbalance VALUES ('257', '02-254', 'Spray Paint Gloss Black- BOSNY', '0', '0.0', '0.0', '2025-03-07 05:25:19.246009', '2');
INSERT INTO ims_beginningbalance VALUES ('258', '02-255', 'Spray Paint Light Sky Blue- NIPPON', '0', '0.0', '0.0', '2025-03-07 05:25:19.263865', '2');
INSERT INTO ims_beginningbalance VALUES ('259', '02-256', 'Laquer Thinner- PUREE 3Ltr', '0', '0.0', '0.0', '2025-03-07 05:25:19.282273', '2');
INSERT INTO ims_beginningbalance VALUES ('260', '02-257', 'Paint Thinner- LESCO 3Ltr', '0', '0.0', '0.0', '2025-03-07 05:25:19.303397', '2');
INSERT INTO ims_beginningbalance VALUES ('261', '02-258', 'QDE - Yellow - SALAMAT BRO', '0', '0.0', '0.0', '2025-03-07 05:25:19.322200', '2');
INSERT INTO ims_beginningbalance VALUES ('262', '02-259', 'QDE - Yellow - TKO', '0', '0.0', '0.0', '2025-03-07 05:25:19.339731', '2');
INSERT INTO ims_beginningbalance VALUES ('263', '02-260', 'Prolux Glazing Putty White- DAVIES', '0', '0.0', '0.0', '2025-03-07 05:25:19.357792', '2');
INSERT INTO ims_beginningbalance VALUES ('264', '02-261', 'Butterfly Paint Brush - 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:19.375161', '19');
INSERT INTO ims_beginningbalance VALUES ('265', '02-262', 'Fan Club Paint Brush - 1"', '0', '0.0', '0.0', '2025-03-07 05:25:19.393240', '19');
INSERT INTO ims_beginningbalance VALUES ('266', '02-263', 'Fan Club Paint Brush - 2"', '0', '0.0', '0.0', '2025-03-07 05:25:19.411321', '19');
INSERT INTO ims_beginningbalance VALUES ('267', '02-264', 'Butterfly Paint Brush - 3"', '0', '0.0', '0.0', '2025-03-07 05:25:19.429862', '19');
INSERT INTO ims_beginningbalance VALUES ('268', '02-265', 'Butterfly Paint Brush - 4"', '0', '0.0', '0.0', '2025-03-07 05:25:19.451276', '19');
INSERT INTO ims_beginningbalance VALUES ('269', '02-266', 'Acrylon Paint Roller - 7"', '0', '0.0', '0.0', '2025-03-07 05:25:19.469914', '19');
INSERT INTO ims_beginningbalance VALUES ('270', '02-267', 'QDE- Black -DOMINO', '0', '0.0', '0.0', '2025-03-07 05:25:19.488752', '2');
INSERT INTO ims_beginningbalance VALUES ('271', '02-268', 'GreenField Floodlight LED 50w', '0', '0.0', '0.0', '2025-03-07 05:25:19.507498', '19');
INSERT INTO ims_beginningbalance VALUES ('272', '02-269', 'Flat White 16Ltrs. SINCLAIR', '0', '0.0', '0.0', '2025-03-07 05:25:19.525461', '17');
INSERT INTO ims_beginningbalance VALUES ('273', '02-270', 'Pylox Spray Paint Heat Black', '0', '0.0', '0.0', '2025-03-07 05:25:19.543751', '8');
INSERT INTO ims_beginningbalance VALUES ('274', '02-271', 'Build Rite Metal Primer Red Oxide -3ltr', '0', '0.0', '0.0', '2025-03-07 05:25:19.561661', '2');
INSERT INTO ims_beginningbalance VALUES ('275', '02-272', 'Epoxy Reducer- PUREE', '0', '0.0', '0.0', '2025-03-07 05:25:19.578927', '2');
INSERT INTO ims_beginningbalance VALUES ('276', '02-273', 'Laquer Flow- PUREE', '0', '0.0', '0.0', '2025-03-07 05:25:19.597903', '2');
INSERT INTO ims_beginningbalance VALUES ('277', '02-274', 'Permacoat Gloss White B710- BOYSEN', '0', '0.0', '0.0', '2025-03-07 05:25:19.615784', '17');
INSERT INTO ims_beginningbalance VALUES ('278', '02-275', 'Fast Dry Enamel White NS950- NATION', '0', '0.0', '0.0', '2025-03-07 05:25:19.634197', '2');
INSERT INTO ims_beginningbalance VALUES ('279', '02-276', 'Exhaust Fan- OMNI', '0', '0.0', '0.0', '2025-03-07 05:25:19.653547', '19');
INSERT INTO ims_beginningbalance VALUES ('280', '02-277', 'Yellow -RAIN OR SHINE', '0', '0.0', '0.0', '2025-03-07 05:25:19.672173', '2');
INSERT INTO ims_beginningbalance VALUES ('281', '02-278', 'Royal Blue- RAIN OR SHINE', '0', '0.0', '0.0', '2025-03-07 05:25:19.690356', '2');
INSERT INTO ims_beginningbalance VALUES ('282', '02-279', 'Door Closer- Lotus Tubular', '0', '0.0', '0.0', '2025-03-07 05:25:19.710193', '19');
INSERT INTO ims_beginningbalance VALUES ('283', '02-280', 'QDE- White -BOYSEN', '0', '0.0', '0.0', '2025-03-07 05:25:19.729257', '2');
INSERT INTO ims_beginningbalance VALUES ('284', '02-281', 'PANEL BOARD 6 HOLES PLUG IN- AMERICA', '0', '0.0', '0.0', '2025-03-07 05:25:19.747170', '18');
INSERT INTO ims_beginningbalance VALUES ('285', '02-282', 'Flat Gloss- BOYSEN', '0', '0.0', '0.0', '2025-03-07 05:25:19.765981', '17');
INSERT INTO ims_beginningbalance VALUES ('286', '02-283', 'QDE WHITE- BOYSEN (pail)', '0', '0.0', '0.0', '2025-03-07 05:25:19.783844', '17');
INSERT INTO ims_beginningbalance VALUES ('287', '02-284', 'Ting ting Color Thalo Blue- BOYSEN', '0', '0.0', '0.0', '2025-03-07 05:25:19.802144', '12');
INSERT INTO ims_beginningbalance VALUES ('288', '02-285', 'Guilder Epoxy primer Gray- BOYSEN', '0', '0.0', '0.0', '2025-03-07 05:25:19.820075', '2');
INSERT INTO ims_beginningbalance VALUES ('289', '02-286', 'Acry Color Raw Sienna -BOYSEN', '0', '0.0', '0.0', '2025-03-07 05:25:19.838242', '8');
INSERT INTO ims_beginningbalance VALUES ('290', '02-287', 'Acry Color Thalo Blue- BOYSEN', '0', '0.0', '0.0', '2025-03-07 05:25:19.857052', '8');
INSERT INTO ims_beginningbalance VALUES ('291', '02-288', 'Roller Brush w/h 2b -ACRYLON', '0', '0.0', '0.0', '2025-03-07 05:25:19.875113', '19');
INSERT INTO ims_beginningbalance VALUES ('292', '02-289', 'Baby Roller w/o- OMEGA', '0', '0.0', '0.0', '2025-03-07 05:25:19.893209', '19');
INSERT INTO ims_beginningbalance VALUES ('293', '02-290', 'Zimcoat Skimcoat', '0', '0.0', '0.0', '2025-03-07 05:25:19.910953', '3');
INSERT INTO ims_beginningbalance VALUES ('294', '02-291', 'DIB Cable Tie 100pcs 7 in BLACK', '0', '0.0', '0.0', '2025-03-07 05:25:19.929080', '16');
INSERT INTO ims_beginningbalance VALUES ('295', '02-292', 'Deform Bar - 16mm', '0', '0.0', '0.0', '2025-03-07 05:25:19.948109', '19');
INSERT INTO ims_beginningbalance VALUES ('296', '02-293', '1/4 Thick Plastic Acrylic 4 x 8', '0', '0.0', '0.0', '2025-03-07 05:25:19.967328', '19');
INSERT INTO ims_beginningbalance VALUES ('297', '02-294', 'Anzahl Anti Corrosion', '0', '0.0', '0.0', '2025-03-07 05:25:19.985453', '12');
INSERT INTO ims_beginningbalance VALUES ('298', '02-295', 'Anzahl Surfacer Primer', '0', '0.0', '0.0', '2025-03-07 05:25:20.002936', '12');
INSERT INTO ims_beginningbalance VALUES ('299', '02-296', 'Anzahl White w/ Catalest', '0', '0.0', '0.0', '2025-03-07 05:25:20.022252', '2');
INSERT INTO ims_beginningbalance VALUES ('300', '02-297', 'Urethane Thinner', '0', '0.0', '0.0', '2025-03-07 05:25:20.040843', '2');
INSERT INTO ims_beginningbalance VALUES ('301', '02-298', 'Body Filler W/ Hardener', '0', '0.0', '0.0', '2025-03-07 05:25:20.059260', '2');
INSERT INTO ims_beginningbalance VALUES ('302', '02-299', 'Sand Paper #100', '0', '0.0', '0.0', '2025-03-07 05:25:20.077359', '19');
INSERT INTO ims_beginningbalance VALUES ('303', '02-300', 'Sand Paper 120" 400" 1200', '0', '0.0', '0.0', '2025-03-07 05:25:20.094919', '19');
INSERT INTO ims_beginningbalance VALUES ('304', '02-301', 'Tiles 60 x 60 fc 6013', '0', '0.0', '0.0', '2025-03-07 05:25:20.112470', '19');
INSERT INTO ims_beginningbalance VALUES ('305', '02-302', 'Tiles 60 x 60 fc 6889', '0', '0.0', '0.0', '2025-03-07 05:25:20.130557', '19');
INSERT INTO ims_beginningbalance VALUES ('306', '02-303', 'Tiles 60 x 60 ak 6882', '0', '0.0', '0.0', '2025-03-07 05:25:20.149167', '19');
INSERT INTO ims_beginningbalance VALUES ('307', '02-304', 'Tiles 60 x 60 ak 6888', '0', '0.0', '0.0', '2025-03-07 05:25:20.167599', '19');
INSERT INTO ims_beginningbalance VALUES ('308', '02-305', 'MJ Water Closet bowl', '0', '0.0', '0.0', '2025-03-07 05:25:20.185689', '19');
INSERT INTO ims_beginningbalance VALUES ('309', '02-306', 'Cable Tie 6x300', '0', '0.0', '0.0', '2025-03-07 05:25:20.204107', '16');
INSERT INTO ims_beginningbalance VALUES ('310', '02-307', 'QDE WHITE- TKO', '0', '0.0', '0.0', '2025-03-07 05:25:20.222523', '2');
INSERT INTO ims_beginningbalance VALUES ('311', '02-308', 'Junction Box- SHUTA', '0', '0.0', '0.0', '2025-03-07 05:25:20.241111', '19');
INSERT INTO ims_beginningbalance VALUES ('312', '02-309', '1 Gang Switch- ROYU', '0', '0.0', '0.0', '2025-03-07 05:25:20.259858', '19');
INSERT INTO ims_beginningbalance VALUES ('313', '02-310', '2 Gang Outlet Universal- FOCUS', '0', '0.0', '0.0', '2025-03-07 05:25:20.277905', '19');
INSERT INTO ims_beginningbalance VALUES ('314', '02-311', 'PVC Pipe Orange 1/2- BIO', '0', '0.0', '0.0', '2025-03-07 05:25:20.295888', '19');
INSERT INTO ims_beginningbalance VALUES ('315', '02-312', 'THHN WIRE 12"- MAX', '0', '0.0', '0.0', '2025-03-07 05:25:20.319718', '19');
INSERT INTO ims_beginningbalance VALUES ('316', '02-313', 'Angle Valve 1/2" 2 way - HAWK', '0', '0.0', '0.0', '2025-03-07 05:25:20.347805', '19');
INSERT INTO ims_beginningbalance VALUES ('317', '02-314', 'Faucet 2 way -HAWK', '0', '0.0', '0.0', '2025-03-07 05:25:20.370828', '19');
INSERT INTO ims_beginningbalance VALUES ('318', '02-315', 'Supply Hose 1/2 x 1/2 - ITALY', '0', '0.0', '0.0', '2025-03-07 05:25:20.394161', '19');
INSERT INTO ims_beginningbalance VALUES ('319', '02-316', 'Floor Drain 4 x 4- CHICAGO', '0', '0.0', '0.0', '2025-03-07 05:25:20.414732', '19');
INSERT INTO ims_beginningbalance VALUES ('320', '02-317', 'Faucet s/s - HAWK', '0', '0.0', '0.0', '2025-03-07 05:25:20.433179', '19');
INSERT INTO ims_beginningbalance VALUES ('321', '02-318', 'Cyclone Wire', '0', '0.0', '0.0', '2025-03-07 05:25:20.451016', '19');
INSERT INTO ims_beginningbalance VALUES ('322', '02-319', 'Long Span Rib type 0.50m x 1220m Blue', '0', '0.0', '0.0', '2025-03-07 05:25:20.469680', '19');
INSERT INTO ims_beginningbalance VALUES ('323', '02-320', 'C- Purlins 2 x 3 1.0', '0', '0.0', '0.0', '2025-03-07 05:25:20.490093', '19');
INSERT INTO ims_beginningbalance VALUES ('324', '02-321', 'Deform Bar 12mm', '0', '0.0', '0.0', '2025-03-07 05:25:20.508480', '19');
INSERT INTO ims_beginningbalance VALUES ('325', '02-322', 'Steel Matting 4 x 8 #8', '0', '0.0', '0.0', '2025-03-07 05:25:20.527810', '19');
INSERT INTO ims_beginningbalance VALUES ('326', '02-323', 'Tubular 2 x 3 1.4', '0', '0.0', '0.0', '2025-03-07 05:25:20.545835', '19');
INSERT INTO ims_beginningbalance VALUES ('327', '03-001', 'Air Release Valve 1" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:20.563269', '19');
INSERT INTO ims_beginningbalance VALUES ('328', '03-002', 'Air Release Valve 1" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:20.582420', '19');
INSERT INTO ims_beginningbalance VALUES ('329', '03-003', 'Adaptor 2" CI', '0', '0.0', '0.0', '2025-03-07 05:25:20.600579', '19');
INSERT INTO ims_beginningbalance VALUES ('330', '03-004', 'Adaptor 3" CI', '0', '0.0', '0.0', '2025-03-07 05:25:20.618889', '19');
INSERT INTO ims_beginningbalance VALUES ('331', '03-005', 'Adaptor 4" CI', '0', '0.0', '0.0', '2025-03-07 05:25:20.637771', '19');
INSERT INTO ims_beginningbalance VALUES ('332', '03-006', 'Adaptor 6" CI', '0', '0.0', '0.0', '2025-03-07 05:25:20.656253', '19');
INSERT INTO ims_beginningbalance VALUES ('333', '03-007', 'Ball Valve 1"', '0', '0.0', '0.0', '2025-03-07 05:25:20.673593', '19');
INSERT INTO ims_beginningbalance VALUES ('334', '03-008', 'Ball Valve 1/2 Lockwing - WIN', '0', '0.0', '0.0', '2025-03-07 05:25:20.693479', '19');
INSERT INTO ims_beginningbalance VALUES ('335', '03-009', 'Ball Valve 1/2 Magnetic', '0', '0.0', '0.0', '2025-03-07 05:25:20.712033', '19');
INSERT INTO ims_beginningbalance VALUES ('336', '03-010', 'Ball Valve 2"', '0', '0.0', '0.0', '2025-03-07 05:25:20.731891', '19');
INSERT INTO ims_beginningbalance VALUES ('337', '03-011', 'Ball Valve 3/4" Lockwing', '0', '0.0', '0.0', '2025-03-07 05:25:20.750209', '19');
INSERT INTO ims_beginningbalance VALUES ('338', '03-012', 'Bell Reducer 3 x 2 B.I', '0', '0.0', '0.0', '2025-03-07 05:25:20.769935', '19');
INSERT INTO ims_beginningbalance VALUES ('339', '03-013', 'Bell Reducer 1 1/4 x 1" GI', '0', '0.0', '0.0', '2025-03-07 05:25:20.788325', '19');
INSERT INTO ims_beginningbalance VALUES ('340', '03-014', 'Bell Reducer 1" x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:20.806677', '19');
INSERT INTO ims_beginningbalance VALUES ('341', '03-015', 'Bell Reducer 1/2 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:20.824551', '19');
INSERT INTO ims_beginningbalance VALUES ('342', '03-016', 'Bell Reducer 2 x 1 GI', '0', '0.0', '0.0', '2025-03-07 05:25:20.841945', '19');
INSERT INTO ims_beginningbalance VALUES ('343', '03-017', 'Bell Reducer 3 x 2 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:20.859662', '19');
INSERT INTO ims_beginningbalance VALUES ('344', '03-018', 'Bell Reducer 4 x 3 BI', '0', '0.0', '0.0', '2025-03-07 05:25:20.878299', '19');
INSERT INTO ims_beginningbalance VALUES ('345', '03-019', 'Bell Reducer 6 x 4 BI', '0', '0.0', '0.0', '2025-03-07 05:25:20.896215', '19');
INSERT INTO ims_beginningbalance VALUES ('346', '03-020', 'Bell Reducer 6 x 4 GI - Mechanical', '0', '0.0', '0.0', '2025-03-07 05:25:20.913615', '19');
INSERT INTO ims_beginningbalance VALUES ('347', '03-021', 'Bushing 3/4 x 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:20.932194', '19');
INSERT INTO ims_beginningbalance VALUES ('348', '03-022', 'Bushing 1 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:20.950168', '19');
INSERT INTO ims_beginningbalance VALUES ('349', '03-023', 'Bushing 2 x 1 GI', '0', '0.0', '0.0', '2025-03-07 05:25:20.967916', '19');
INSERT INTO ims_beginningbalance VALUES ('350', '03-024', 'Bushing 2 x 2 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:20.989360', '19');
INSERT INTO ims_beginningbalance VALUES ('351', '03-025', 'Bushing 4 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.007648', '19');
INSERT INTO ims_beginningbalance VALUES ('352', '03-026', 'Butterfly Valve 4"', '0', '0.0', '0.0', '2025-03-07 05:25:21.026418', '19');
INSERT INTO ims_beginningbalance VALUES ('353', '03-027', 'Butterfly Valve 6"', '0', '0.0', '0.0', '2025-03-07 05:25:21.044442', '19');
INSERT INTO ims_beginningbalance VALUES ('354', '03-028', 'Checkvalve 1" - Brass', '0', '0.0', '0.0', '2025-03-07 05:25:21.062586', '19');
INSERT INTO ims_beginningbalance VALUES ('355', '03-029', 'Checkvalve 1/2" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:21.080544', '19');
INSERT INTO ims_beginningbalance VALUES ('356', '03-030', 'Checkvalve 1 1/2" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:21.099976', '19');
INSERT INTO ims_beginningbalance VALUES ('357', '03-031', 'Checkvalve 2" - Brass', '0', '0.0', '0.0', '2025-03-07 05:25:21.118767', '19');
INSERT INTO ims_beginningbalance VALUES ('358', '03-032', 'Checkvalve 3" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:21.136866', '19');
INSERT INTO ims_beginningbalance VALUES ('359', '03-033', 'Checkvalve 4"', '0', '0.0', '0.0', '2025-03-07 05:25:21.155093', '19');
INSERT INTO ims_beginningbalance VALUES ('360', '03-034', 'Checkvalve 6"', '0', '0.0', '0.0', '2025-03-07 05:25:21.174255', '19');
INSERT INTO ims_beginningbalance VALUES ('361', '03-035', 'Checkvalve 6" CI', '0', '0.0', '0.0', '2025-03-07 05:25:21.193531', '19');
INSERT INTO ims_beginningbalance VALUES ('362', '03-036', 'Coupling 1" GI (S40)', '0', '0.0', '0.0', '2025-03-07 05:25:21.211768', '19');
INSERT INTO ims_beginningbalance VALUES ('363', '03-037', 'Coupling 1" GI (S80)', '0', '0.0', '0.0', '2025-03-07 05:25:21.230651', '19');
INSERT INTO ims_beginningbalance VALUES ('364', '03-038', 'Coupling 1" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:21.250097', '19');
INSERT INTO ims_beginningbalance VALUES ('365', '03-039', 'Coupling 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.269293', '19');
INSERT INTO ims_beginningbalance VALUES ('366', '03-040', 'Coupling 1/2 PVC', '0', '0.0', '0.0', '2025-03-07 05:25:21.288217', '19');
INSERT INTO ims_beginningbalance VALUES ('367', '03-041', 'Coupling 1/2 PVC w/ Thread', '0', '0.0', '0.0', '2025-03-07 05:25:21.306638', '19');
INSERT INTO ims_beginningbalance VALUES ('368', '03-042', 'Coupling 1/2 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:21.325665', '19');
INSERT INTO ims_beginningbalance VALUES ('369', '03-043', 'Coupling 2" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.344317', '19');
INSERT INTO ims_beginningbalance VALUES ('370', '03-044', 'Coupling 2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:21.362754', '19');
INSERT INTO ims_beginningbalance VALUES ('371', '03-045', 'Coupling 3" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.382863', '19');
INSERT INTO ims_beginningbalance VALUES ('372', '03-046', 'Coupling 3" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:21.402317', '19');
INSERT INTO ims_beginningbalance VALUES ('373', '03-047', 'Coupling 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.421407', '19');
INSERT INTO ims_beginningbalance VALUES ('374', '03-048', 'Coupling 3/4 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:21.440196', '19');
INSERT INTO ims_beginningbalance VALUES ('375', '03-049', 'Coupling 4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.460115', '19');
INSERT INTO ims_beginningbalance VALUES ('376', '03-050', 'Coupling 4" HDPE- FISH', '0', '0.0', '0.0', '2025-03-07 05:25:21.478911', '19');
INSERT INTO ims_beginningbalance VALUES ('377', '03-051', 'Coupling 4X3 GI (SCHED 80)', '0', '0.0', '0.0', '2025-03-07 05:25:21.499971', '19');
INSERT INTO ims_beginningbalance VALUES ('378', '03-052', 'Coupling 6" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.519421', '19');
INSERT INTO ims_beginningbalance VALUES ('379', '03-053', 'Coupling 6" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:21.537938', '19');
INSERT INTO ims_beginningbalance VALUES ('380', '03-054', 'Coupling 3/4"  PVC', '0', '0.0', '0.0', '2025-03-07 05:25:21.554400', '19');
INSERT INTO ims_beginningbalance VALUES ('381', '03-055', 'Coupling Reducer 3 x 2 - Mechanical', '0', '0.0', '0.0', '2025-03-07 05:25:21.572554', '19');
INSERT INTO ims_beginningbalance VALUES ('382', '03-056', 'Coupling Reducer 3 x 2 NLC - FISH', '0', '0.0', '0.0', '2025-03-07 05:25:21.591082', '19');
INSERT INTO ims_beginningbalance VALUES ('383', '03-057', 'Coupling Reducer 4 x 2 - Mechanical', '0', '0.0', '0.0', '2025-03-07 05:25:21.608841', '19');
INSERT INTO ims_beginningbalance VALUES ('384', '03-058', 'Cross Tee 1" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.627753', '19');
INSERT INTO ims_beginningbalance VALUES ('385', '03-059', 'Cross Tee 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.647592', '19');
INSERT INTO ims_beginningbalance VALUES ('386', '03-060', 'Cross Tee 2" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.667119', '19');
INSERT INTO ims_beginningbalance VALUES ('387', '03-061', 'Cross Tee 3 x 2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.685481', '19');
INSERT INTO ims_beginningbalance VALUES ('388', '03-062', 'Cross Tee 3" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.705232', '19');
INSERT INTO ims_beginningbalance VALUES ('389', '03-063', 'Cross Tee 4 x 2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.723887', '19');
INSERT INTO ims_beginningbalance VALUES ('390', '03-064', 'Cross Tee 4 x 3 GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.743035', '19');
INSERT INTO ims_beginningbalance VALUES ('391', '03-065', 'Cross Tee 4" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.762890', '19');
INSERT INTO ims_beginningbalance VALUES ('392', '03-066', 'Cross Tee 6 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:21.782272', '19');
INSERT INTO ims_beginningbalance VALUES ('393', '03-067', 'Elbow 45deg - Flange Type 6" CI', '0', '0.0', '0.0', '2025-03-07 05:25:21.800490', '19');
INSERT INTO ims_beginningbalance VALUES ('394', '03-068', 'Elbow 90 deg - 4" BI', '0', '0.0', '0.0', '2025-03-07 05:25:21.818727', '19');
INSERT INTO ims_beginningbalance VALUES ('395', '03-069', 'Elbow 90deg - Flange Type 6" CI', '0', '0.0', '0.0', '2025-03-07 05:25:21.836588', '19');
INSERT INTO ims_beginningbalance VALUES ('396', '03-070', 'Elbow 1" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.855341', '19');
INSERT INTO ims_beginningbalance VALUES ('397', '03-071', 'Elbow 1" GI 45 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:21.874911', '19');
INSERT INTO ims_beginningbalance VALUES ('398', '03-072', 'Elbow 1" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:21.893863', '19');
INSERT INTO ims_beginningbalance VALUES ('399', '03-073', 'Elbow 1" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:21.913966', '19');
INSERT INTO ims_beginningbalance VALUES ('400', '03-074', 'Elbow 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.932689', '19');
INSERT INTO ims_beginningbalance VALUES ('401', '03-075', 'Elbow 1/2 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:21.951564', '19');
INSERT INTO ims_beginningbalance VALUES ('402', '03-076', 'Elbow 1/2 (plain)  PVC', '0', '0.0', '0.0', '2025-03-07 05:25:21.970613', '19');
INSERT INTO ims_beginningbalance VALUES ('403', '03-077', 'Elbow 2" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.989653', '19');
INSERT INTO ims_beginningbalance VALUES ('404', '03-078', 'Elbow 2" HDPE- FISH', '0', '0.0', '0.0', '2025-03-07 05:25:22.009173', '19');
INSERT INTO ims_beginningbalance VALUES ('405', '03-079', 'Elbow 3" BI 45 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:22.030278', '19');
INSERT INTO ims_beginningbalance VALUES ('406', '03-080', 'Elbow 3" GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.049662', '19');
INSERT INTO ims_beginningbalance VALUES ('407', '03-081', 'Elbow 3" GI 45 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:22.068305', '1');
INSERT INTO ims_beginningbalance VALUES ('408', '03-082', 'Elbow 3" HDPE- FISH', '0', '0.0', '0.0', '2025-03-07 05:25:22.086219', '19');
INSERT INTO ims_beginningbalance VALUES ('409', '03-083', 'Elbow 3/4 GI- JB', '0', '0.0', '0.0', '2025-03-07 05:25:22.104361', '19');
INSERT INTO ims_beginningbalance VALUES ('410', '03-084', 'Elbow 3/4 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:22.123195', '19');
INSERT INTO ims_beginningbalance VALUES ('411', '03-085', 'Elbow 4" 45deg (80) BI', '0', '0.0', '0.0', '2025-03-07 05:25:22.141694', '19');
INSERT INTO ims_beginningbalance VALUES ('412', '03-086', 'Elbow 4" 45deg GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.160531', '19');
INSERT INTO ims_beginningbalance VALUES ('413', '03-087', 'Elbow 4" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:22.178626', '19');
INSERT INTO ims_beginningbalance VALUES ('414', '03-088', 'Elbow 6" BI  45 DEG', '0', '0.0', '0.0', '2025-03-07 05:25:22.197088', '19');
INSERT INTO ims_beginningbalance VALUES ('415', '03-089', 'Elbow 6" BI  90 DEG', '0', '0.0', '0.0', '2025-03-07 05:25:22.216008', '19');
INSERT INTO ims_beginningbalance VALUES ('416', '03-090', 'Elbow Reducer 1" x 1 1/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.236385', '19');
INSERT INTO ims_beginningbalance VALUES ('417', '03-091', 'Elbow Reducer 1" x 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.256093', '19');
INSERT INTO ims_beginningbalance VALUES ('418', '03-092', 'Elbow Reducer 1" x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.275336', '19');
INSERT INTO ims_beginningbalance VALUES ('419', '03-093', 'Elbow Reducer 3/4 x 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.294951', '19');
INSERT INTO ims_beginningbalance VALUES ('420', '03-094', 'Elbow Straight 1/2"', '0', '0.0', '0.0', '2025-03-07 05:25:22.313864', '19');
INSERT INTO ims_beginningbalance VALUES ('421', '03-095', 'Elbow Straight 1"', '0', '0.0', '0.0', '2025-03-07 05:25:22.332823', '19');
INSERT INTO ims_beginningbalance VALUES ('422', '03-096', 'Elbow Straight 3/4"', '0', '0.0', '0.0', '2025-03-07 05:25:22.351079', '19');
INSERT INTO ims_beginningbalance VALUES ('423', '03-097', 'Elbow Threaded 1/2 PVC', '0', '0.0', '0.0', '2025-03-07 05:25:22.368780', '19');
INSERT INTO ims_beginningbalance VALUES ('424', '03-098', 'End Cap 1" GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.387287', '19');
INSERT INTO ims_beginningbalance VALUES ('425', '03-099', 'End Cap 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.406400', '19');
INSERT INTO ims_beginningbalance VALUES ('426', '03-100', 'End Cap 2"  GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.426093', '19');
INSERT INTO ims_beginningbalance VALUES ('427', '03-101', 'End Cap 2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:22.444835', '19');
INSERT INTO ims_beginningbalance VALUES ('428', '03-102', 'End Cap 3" GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.463730', '19');
INSERT INTO ims_beginningbalance VALUES ('429', '03-103', 'End Cap 3" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:22.483405', '19');
INSERT INTO ims_beginningbalance VALUES ('430', '03-104', 'End Cap 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.502070', '19');
INSERT INTO ims_beginningbalance VALUES ('431', '03-105', 'End Cap 4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.521139', '19');
INSERT INTO ims_beginningbalance VALUES ('432', '03-106', 'End Cap 6"', '0', '0.0', '0.0', '2025-03-07 05:25:22.539645', '19');
INSERT INTO ims_beginningbalance VALUES ('433', '03-107', 'End Cap 8"', '0', '0.0', '0.0', '2025-03-07 05:25:22.558318', '19');
INSERT INTO ims_beginningbalance VALUES ('434', '03-108', 'End Plug 1" GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.577279', '19');
INSERT INTO ims_beginningbalance VALUES ('435', '03-109', 'End Plug 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.595892', '19');
INSERT INTO ims_beginningbalance VALUES ('436', '03-110', 'End Plug 2" GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.616036', '19');
INSERT INTO ims_beginningbalance VALUES ('437', '03-111', 'End Plug 3 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.634662', '19');
INSERT INTO ims_beginningbalance VALUES ('438', '03-112', 'End Plug 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.654201', '19');
INSERT INTO ims_beginningbalance VALUES ('439', '03-113', 'End Plug 4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.673624', '19');
INSERT INTO ims_beginningbalance VALUES ('440', '03-114', 'Sleeve-Type Coupling 8"', '0', '0.0', '0.0', '2025-03-07 05:25:22.692876', '19');
INSERT INTO ims_beginningbalance VALUES ('441', '03-115', 'Fabricated Elbow 3"', '0', '0.0', '0.0', '2025-03-07 05:25:22.711967', '19');
INSERT INTO ims_beginningbalance VALUES ('442', '03-116', 'Fabricated Elbow 4"', '0', '0.0', '0.0', '2025-03-07 05:25:22.731614', '19');
INSERT INTO ims_beginningbalance VALUES ('443', '03-117', 'Fabricated Elbow 6', '0', '0.0', '0.0', '2025-03-07 05:25:22.750615', '19');
INSERT INTO ims_beginningbalance VALUES ('444', '03-118', 'Fabricated Reducer 3 x 2', '0', '0.0', '0.0', '2025-03-07 05:25:22.770093', '19');
INSERT INTO ims_beginningbalance VALUES ('445', '03-119', 'Fabricated Tee 3 x 2', '0', '0.0', '0.0', '2025-03-07 05:25:22.789228', '19');
INSERT INTO ims_beginningbalance VALUES ('446', '03-120', 'Fabricated Tee 3', '0', '0.0', '0.0', '2025-03-07 05:25:22.808551', '19');
INSERT INTO ims_beginningbalance VALUES ('447', '03-121', 'Fabricated Tee 4 x 2', '0', '0.0', '0.0', '2025-03-07 05:25:22.828820', '19');
INSERT INTO ims_beginningbalance VALUES ('448', '03-122', 'Fabricated Tee 4 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:22.847280', '19');
INSERT INTO ims_beginningbalance VALUES ('449', '03-123', 'Fabricated Tee 4', '0', '0.0', '0.0', '2025-03-07 05:25:22.865912', '19');
INSERT INTO ims_beginningbalance VALUES ('450', '03-124', 'Fabricated Tee 6 x 2', '0', '0.0', '0.0', '2025-03-07 05:25:22.884554', '19');
INSERT INTO ims_beginningbalance VALUES ('451', '03-125', 'Fabricated Tee 6 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:22.902460', '19');
INSERT INTO ims_beginningbalance VALUES ('452', '03-126', 'Fabricated Tee 6 x 4', '0', '0.0', '0.0', '2025-03-07 05:25:22.921814', '19');
INSERT INTO ims_beginningbalance VALUES ('453', '03-127', 'Fabricated Tee 6', '0', '0.0', '0.0', '2025-03-07 05:25:22.941377', '19');
INSERT INTO ims_beginningbalance VALUES ('454', '03-128', 'Fabricated Tee 8 x 2', '0', '0.0', '0.0', '2025-03-07 05:25:22.959738', '19');
INSERT INTO ims_beginningbalance VALUES ('455', '03-129', 'Fabricated Tee 8 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:22.977173', '19');
INSERT INTO ims_beginningbalance VALUES ('456', '03-130', 'Fabricated Tee 8', '0', '0.0', '0.0', '2025-03-07 05:25:22.995807', '19');
INSERT INTO ims_beginningbalance VALUES ('457', '03-131', 'Female Adaptor 1/2" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:23.015158', '19');
INSERT INTO ims_beginningbalance VALUES ('458', '03-132', 'Female Elbow 1" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:23.040182', '19');
INSERT INTO ims_beginningbalance VALUES ('459', '03-133', 'Female Elbow 1/2 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:23.066167', '19');
INSERT INTO ims_beginningbalance VALUES ('460', '03-134', 'Female Elbow 2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:23.090307', '19');
INSERT INTO ims_beginningbalance VALUES ('461', '03-135', 'Female Elbow 3 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:23.114353', '19');
INSERT INTO ims_beginningbalance VALUES ('462', '03-136', 'Female Elbow 3/4 HDPE - NLC- PBP', '0', '0.0', '0.0', '2025-03-07 05:25:23.134243', '19');
INSERT INTO ims_beginningbalance VALUES ('463', '03-137', 'Flange 2"', '0', '0.0', '0.0', '2025-03-07 05:25:23.152327', '19');
INSERT INTO ims_beginningbalance VALUES ('464', '03-138', 'Flange 3" ( 8 hole )', '0', '0.0', '0.0', '2025-03-07 05:25:23.172065', '19');
INSERT INTO ims_beginningbalance VALUES ('465', '03-139', 'Flange 6"', '0', '0.0', '0.0', '2025-03-07 05:25:23.190678', '19');
INSERT INTO ims_beginningbalance VALUES ('466', '03-140', 'Flange 8"', '0', '0.0', '0.0', '2025-03-07 05:25:23.209099', '19');
INSERT INTO ims_beginningbalance VALUES ('467', '03-141', 'Gasket 1/2"', '0', '0.0', '0.0', '2025-03-07 05:25:23.227725', '19');
INSERT INTO ims_beginningbalance VALUES ('468', '03-142', 'Gasket 3" - LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:23.246746', '19');
INSERT INTO ims_beginningbalance VALUES ('469', '03-143', 'Gasket 3/4 "', '0', '0.0', '0.0', '2025-03-07 05:25:23.266464', '19');
INSERT INTO ims_beginningbalance VALUES ('470', '03-144', 'Gasket 8"', '0', '0.0', '0.0', '2025-03-07 05:25:23.284636', '19');
INSERT INTO ims_beginningbalance VALUES ('471', '03-145', 'Gate Valve 1" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:23.302505', '19');
INSERT INTO ims_beginningbalance VALUES ('472', '03-146', 'Gate Valve 1/2" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:23.322728', '19');
INSERT INTO ims_beginningbalance VALUES ('473', '03-147', 'Gate Valve 2" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:23.340087', '19');
INSERT INTO ims_beginningbalance VALUES ('474', '03-148', 'Gate Valve 2" Flange', '0', '0.0', '0.0', '2025-03-07 05:25:23.359122', '19');
INSERT INTO ims_beginningbalance VALUES ('475', '03-149', 'Gate Valve 2" Mechanical', '0', '0.0', '0.0', '2025-03-07 05:25:23.377477', '19');
INSERT INTO ims_beginningbalance VALUES ('476', '03-150', 'Gate Valve 3" Mechanical', '0', '0.0', '0.0', '2025-03-07 05:25:23.395921', '19');
INSERT INTO ims_beginningbalance VALUES ('477', '03-151', 'Gate Valve 3" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:23.413678', '19');
INSERT INTO ims_beginningbalance VALUES ('478', '03-152', 'Gate Valve 3" Flange- DI (BOHAI)', '0', '0.0', '0.0', '2025-03-07 05:25:23.432131', '19');
INSERT INTO ims_beginningbalance VALUES ('479', '03-153', 'Gate Valve 3/4" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:23.449776', '19');
INSERT INTO ims_beginningbalance VALUES ('480', '03-154', 'Gate Valve 4" Flange', '0', '0.0', '0.0', '2025-03-07 05:25:23.468557', '19');
INSERT INTO ims_beginningbalance VALUES ('481', '03-155', 'Gate Valve 4" Mechanical', '0', '0.0', '0.0', '2025-03-07 05:25:23.486616', '19');
INSERT INTO ims_beginningbalance VALUES ('482', '03-156', 'Gate Valve 6" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:23.505065', '19');
INSERT INTO ims_beginningbalance VALUES ('483', '03-157', 'Gate Valve 6" Flange', '0', '0.0', '0.0', '2025-03-07 05:25:23.523997', '19');
INSERT INTO ims_beginningbalance VALUES ('484', '03-158', 'Gate Valve 6" Mechanical', '0', '0.0', '0.0', '2025-03-07 05:25:23.542116', '19');
INSERT INTO ims_beginningbalance VALUES ('485', '03-159', 'Gate Valve 8" Mechanical', '0', '0.0', '0.0', '2025-03-07 05:25:23.559793', '19');
INSERT INTO ims_beginningbalance VALUES ('486', '03-160', 'GiBault 2"', '0', '0.0', '0.0', '2025-03-07 05:25:23.578785', '19');
INSERT INTO ims_beginningbalance VALUES ('487', '03-161', 'GiBault 3"', '0', '0.0', '0.0', '2025-03-07 05:25:23.597206', '19');
INSERT INTO ims_beginningbalance VALUES ('488', '03-162', 'GiBault 4"', '0', '0.0', '0.0', '2025-03-07 05:25:23.615147', '19');
INSERT INTO ims_beginningbalance VALUES ('489', '03-163', 'GiBault 6"', '0', '0.0', '0.0', '2025-03-07 05:25:23.632691', '19');
INSERT INTO ims_beginningbalance VALUES ('490', '03-164', 'GiBault 8"', '0', '0.0', '0.0', '2025-03-07 05:25:23.650660', '19');
INSERT INTO ims_beginningbalance VALUES ('491', '03-165', 'Gate Valve 2" Flange Type CI', '0', '0.0', '0.0', '2025-03-07 05:25:23.667838', '19');
INSERT INTO ims_beginningbalance VALUES ('492', '03-166', 'Gate Valve 3" Flange Type CI', '0', '0.0', '0.0', '2025-03-07 05:25:23.687836', '19');
INSERT INTO ims_beginningbalance VALUES ('493', '03-167', 'Gate Valve 4" Flange Type CI', '0', '0.0', '0.0', '2025-03-07 05:25:23.707797', '19');
INSERT INTO ims_beginningbalance VALUES ('494', '03-168', 'Mechanical Flange 3" - LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:23.725657', '19');
INSERT INTO ims_beginningbalance VALUES ('495', '03-169', 'Mechanical Flange 4"- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:23.744225', '19');
INSERT INTO ims_beginningbalance VALUES ('496', '03-170', 'Male Adaptor 1" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:23.762058', '19');
INSERT INTO ims_beginningbalance VALUES ('497', '03-171', 'Male Adaptor 1" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:23.779604', '19');
INSERT INTO ims_beginningbalance VALUES ('498', '03-172', 'Male Adaptor 1/2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:23.797515', '1');
INSERT INTO ims_beginningbalance VALUES ('499', '03-173', 'Male Adaptor 1/2" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:23.816143', '1');
INSERT INTO ims_beginningbalance VALUES ('500', '03-174', 'Male Adaptor 2" HDPE- FISH', '0', '0.0', '0.0', '2025-03-07 05:25:23.836699', '19');
INSERT INTO ims_beginningbalance VALUES ('501', '03-175', 'Male Adaptor 2" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:23.856520', '19');
INSERT INTO ims_beginningbalance VALUES ('502', '03-176', 'Male Adaptor 3"', '0', '0.0', '0.0', '2025-03-07 05:25:23.874456', '19');
INSERT INTO ims_beginningbalance VALUES ('503', '03-177', 'Male Adaptor 3/4 HDPE - FISH', '0', '0.0', '0.0', '2025-03-07 05:25:23.893334', '19');
INSERT INTO ims_beginningbalance VALUES ('504', '03-178', 'Male Adaptor 3/4" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:23.911265', '19');
INSERT INTO ims_beginningbalance VALUES ('505', '03-179', 'Mechanical Elbow 2" 90 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:23.929474', '19');
INSERT INTO ims_beginningbalance VALUES ('506', '03-180', 'Mechanical Elbow 3" 45 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:23.947579', '19');
INSERT INTO ims_beginningbalance VALUES ('507', '03-181', 'Mechanical Elbow 3" 90 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:23.966566', '19');
INSERT INTO ims_beginningbalance VALUES ('508', '03-182', 'Mechanical Elbow 4" 90 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:23.984362', '19');
INSERT INTO ims_beginningbalance VALUES ('509', '03-183', 'Mechanical Elbow 6" 45 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:24.003124', '19');
INSERT INTO ims_beginningbalance VALUES ('510', '03-184', 'Mechanical Elbow 6" 90 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:24.022003', '19');
INSERT INTO ims_beginningbalance VALUES ('511', '03-185', 'Mechanical End Cap 2"', '0', '0.0', '0.0', '2025-03-07 05:25:24.040292', '19');
INSERT INTO ims_beginningbalance VALUES ('512', '03-186', 'Mechanical End Cap 4"', '0', '0.0', '0.0', '2025-03-07 05:25:24.058138', '19');
INSERT INTO ims_beginningbalance VALUES ('513', '03-187', 'Mechanical Tee 2"', '0', '0.0', '0.0', '2025-03-07 05:25:24.076172', '19');
INSERT INTO ims_beginningbalance VALUES ('514', '03-188', 'Mechanical Tee 3 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:24.094139', '19');
INSERT INTO ims_beginningbalance VALUES ('515', '03-189', 'Mechanical Tee 4 x 2 CI', '0', '0.0', '0.0', '2025-03-07 05:25:24.112716', '19');
INSERT INTO ims_beginningbalance VALUES ('516', '03-190', 'Mechanical Tee 4 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:24.130656', '19');
INSERT INTO ims_beginningbalance VALUES ('517', '03-191', 'Mechanical Tee 4 x 4', '0', '0.0', '0.0', '2025-03-07 05:25:24.148652', '19');
INSERT INTO ims_beginningbalance VALUES ('518', '03-192', 'Mechanical Tee 6 x 2', '0', '0.0', '0.0', '2025-03-07 05:25:24.167195', '19');
INSERT INTO ims_beginningbalance VALUES ('519', '03-193', 'Mechanical Tee 6 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:24.185670', '19');
INSERT INTO ims_beginningbalance VALUES ('520', '03-194', 'Mechanical Tee 6 x 4', '0', '0.0', '0.0', '2025-03-07 05:25:24.204674', '19');
INSERT INTO ims_beginningbalance VALUES ('521', '03-195', 'Mechanical Tee 6"', '0', '0.0', '0.0', '2025-03-07 05:25:24.223762', '19');
INSERT INTO ims_beginningbalance VALUES ('522', '03-196', 'Nipple 1 x 12 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.242544', '19');
INSERT INTO ims_beginningbalance VALUES ('523', '03-197', 'Nipple 1 x 5 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.260838', '19');
INSERT INTO ims_beginningbalance VALUES ('524', '03-198', 'Nipple 1 x 8 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.279099', '19');
INSERT INTO ims_beginningbalance VALUES ('525', '03-199', 'Nipple 1" x 2" GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.300798', '19');
INSERT INTO ims_beginningbalance VALUES ('526', '03-200', 'Nipple 1" x 6" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:24.322405', '19');
INSERT INTO ims_beginningbalance VALUES ('527', '03-201', 'Nipple 1" x 8" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:24.343788', '19');
INSERT INTO ims_beginningbalance VALUES ('528', '03-202', 'Nipple 1/2 x 1 GI - FS', '0', '0.0', '0.0', '2025-03-07 05:25:24.363707', '19');
INSERT INTO ims_beginningbalance VALUES ('529', '03-203', 'Nipple 1/2 x 12 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.382783', '19');
INSERT INTO ims_beginningbalance VALUES ('530', '03-204', 'Nipple 1/2 x 16 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.400072', '19');
INSERT INTO ims_beginningbalance VALUES ('531', '03-205', 'Nipple 1/2 x 2 GI - JB', '0', '0.0', '0.0', '2025-03-07 05:25:24.417957', '19');
INSERT INTO ims_beginningbalance VALUES ('532', '03-206', 'Nipple 1/2 x 2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:24.437214', '19');
INSERT INTO ims_beginningbalance VALUES ('533', '03-207', 'Nipple 1/2 x 3 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.456320', '19');
INSERT INTO ims_beginningbalance VALUES ('534', '03-208', 'Nipple 1/2 x 4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.475590', '19');
INSERT INTO ims_beginningbalance VALUES ('535', '03-209', 'Nipple 1/2 x 6 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.494387', '19');
INSERT INTO ims_beginningbalance VALUES ('536', '03-210', 'Nipple 1/2 x 8 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.515360', '19');
INSERT INTO ims_beginningbalance VALUES ('537', '03-211', 'Nipple 2 1/2 x 5 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.533587', '19');
INSERT INTO ims_beginningbalance VALUES ('538', '03-212', 'Nipple 2 x 5 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.552332', '19');
INSERT INTO ims_beginningbalance VALUES ('539', '03-213', 'Nipple 3 x 5 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.569775', '19');
INSERT INTO ims_beginningbalance VALUES ('540', '03-214', 'Nipple 3/4 x 10 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.587617', '19');
INSERT INTO ims_beginningbalance VALUES ('541', '03-215', 'Nipple 3/4 x 4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.607378', '19');
INSERT INTO ims_beginningbalance VALUES ('542', '03-216', 'Nipple 3/4 x 5 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.625613', '19');
INSERT INTO ims_beginningbalance VALUES ('543', '03-217', 'Nipple 3/4 x 6 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.644483', '19');
INSERT INTO ims_beginningbalance VALUES ('544', '03-218', 'Nipple 3/4 x 6 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:24.663072', '19');
INSERT INTO ims_beginningbalance VALUES ('545', '03-219', 'Nipple 3/4 x 8 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.682048', '19');
INSERT INTO ims_beginningbalance VALUES ('546', '03-220', 'Nipple 3/4 x 8 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:24.700091', '19');
INSERT INTO ims_beginningbalance VALUES ('547', '03-221', 'Nipple 4 x 12 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.720102', '19');
INSERT INTO ims_beginningbalance VALUES ('548', '03-222', 'Nipple 5 x 10 BI', '0', '0.0', '0.0', '2025-03-07 05:25:24.739721', '19');
INSERT INTO ims_beginningbalance VALUES ('549', '03-223', 'Repair Clamp 2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:24.759432', '19');
INSERT INTO ims_beginningbalance VALUES ('550', '03-224', 'Repair Clamp 3" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:24.778090', '19');
INSERT INTO ims_beginningbalance VALUES ('551', '03-225', 'Repair Clamp 4" HDPE - MIE', '0', '0.0', '0.0', '2025-03-07 05:25:24.798678', '19');
INSERT INTO ims_beginningbalance VALUES ('552', '03-226', 'Repair Clamp 6" HDPE - MIE', '0', '0.0', '0.0', '2025-03-07 05:25:24.817471', '19');
INSERT INTO ims_beginningbalance VALUES ('553', '03-227', 'Repair Clamp 8" HDPE - MIE', '0', '0.0', '0.0', '2025-03-07 05:25:24.837417', '19');
INSERT INTO ims_beginningbalance VALUES ('554', '03-228', 'Saddle Clamp 2 x 1 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.855909', '19');
INSERT INTO ims_beginningbalance VALUES ('555', '03-229', 'Saddle Clamp 2 x 1 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:24.877080', '19');
INSERT INTO ims_beginningbalance VALUES ('556', '03-230', 'Saddle Clamp 2 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.896109', '19');
INSERT INTO ims_beginningbalance VALUES ('557', '03-231', 'Saddle Clamp 3 x 1 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.914281', '19');
INSERT INTO ims_beginningbalance VALUES ('558', '03-232', 'Saddle Clamp 3 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.933265', '19');
INSERT INTO ims_beginningbalance VALUES ('559', '03-233', 'Saddle Clamp 4 x 1 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.952819', '19');
INSERT INTO ims_beginningbalance VALUES ('560', '03-234', 'Saddle Clamp 4 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.972873', '19');
INSERT INTO ims_beginningbalance VALUES ('561', '03-235', 'Saddle Clamp 4x2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.991384', '19');
INSERT INTO ims_beginningbalance VALUES ('562', '03-236', 'Saddle Clamp 6 x 1 GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.009139', '19');
INSERT INTO ims_beginningbalance VALUES ('563', '03-237', 'Saddle Clamp 6 x 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.028410', '19');
INSERT INTO ims_beginningbalance VALUES ('564', '03-238', 'Saddle Clamp 6 x 2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.047418', '19');
INSERT INTO ims_beginningbalance VALUES ('565', '03-239', 'Saddle Clamp 6 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.066720', '19');
INSERT INTO ims_beginningbalance VALUES ('566', '03-240', 'Saddle Clamp 6" x 1" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.086201', '19');
INSERT INTO ims_beginningbalance VALUES ('567', '03-241', 'Saddle Clamp 8" x 1" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.105215', '19');
INSERT INTO ims_beginningbalance VALUES ('568', '03-242', 'Saddle Clamp 8" x 1" GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.125469', '19');
INSERT INTO ims_beginningbalance VALUES ('569', '03-243', 'Saddle Clamp 8" x 2" - HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.143570', '19');
INSERT INTO ims_beginningbalance VALUES ('570', '03-244', 'Saddle Clamp 8" x 2" GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.162811', '19');
INSERT INTO ims_beginningbalance VALUES ('571', '03-245', 'Side Bolts 3/4 x 8', '0', '0.0', '0.0', '2025-03-07 05:25:25.181570', '19');
INSERT INTO ims_beginningbalance VALUES ('572', '03-246', 'Sleeve-Type Coupling 2"', '0', '0.0', '0.0', '2025-03-07 05:25:25.199826', '19');
INSERT INTO ims_beginningbalance VALUES ('573', '03-247', 'Sleeve-Type Coupling 3" DI pvc to pvc- PVMC', '0', '0.0', '0.0', '2025-03-07 05:25:25.220096', '19');
INSERT INTO ims_beginningbalance VALUES ('574', '03-248', 'Sleeve-Type Coupling 4 x 2', '0', '0.0', '0.0', '2025-03-07 05:25:25.239353', '19');
INSERT INTO ims_beginningbalance VALUES ('575', '03-249', 'Sleeve-Type Coupling 4" DI pvc to pvc- PVMC', '0', '0.0', '0.0', '2025-03-07 05:25:25.258155', '19');
INSERT INTO ims_beginningbalance VALUES ('576', '03-250', 'STC (GI-PVC) 6" (GI to GI)', '0', '0.0', '0.0', '2025-03-07 05:25:25.277141', '19');
INSERT INTO ims_beginningbalance VALUES ('577', '03-251', 'Sleeve-Type Coupling 6" DI (PVC to PVC)- PVMC', '0', '0.0', '0.0', '2025-03-07 05:25:25.295711', '19');
INSERT INTO ims_beginningbalance VALUES ('578', '03-252', 'Stub End 2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.316570', '19');
INSERT INTO ims_beginningbalance VALUES ('579', '03-253', 'Stub End 3" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.337429', '19');
INSERT INTO ims_beginningbalance VALUES ('580', '03-254', 'Stub End 4" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.362886', '19');
INSERT INTO ims_beginningbalance VALUES ('581', '03-255', 'Stub End 6" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.384925', '19');
INSERT INTO ims_beginningbalance VALUES ('582', '03-256', 'Stub End 8" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.406506', '19');
INSERT INTO ims_beginningbalance VALUES ('583', '03-257', 'Tee 1" GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.425151', '19');
INSERT INTO ims_beginningbalance VALUES ('584', '03-258', 'Tee 1" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.443504', '19');
INSERT INTO ims_beginningbalance VALUES ('585', '03-259', 'Tee 1/2" GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.462810', '1');
INSERT INTO ims_beginningbalance VALUES ('586', '03-260', 'Tee 1/2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.481722', '1');
INSERT INTO ims_beginningbalance VALUES ('587', '03-261', 'Tee 1/2" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:25.500631', '1');
INSERT INTO ims_beginningbalance VALUES ('588', '03-262', 'Tee 2" Flange', '0', '0.0', '0.0', '2025-03-07 05:25:25.519198', '19');
INSERT INTO ims_beginningbalance VALUES ('589', '03-263', 'Tee 2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.539044', '19');
INSERT INTO ims_beginningbalance VALUES ('590', '03-264', 'Tee 3" Flange', '0', '0.0', '0.0', '2025-03-07 05:25:25.557308', '19');
INSERT INTO ims_beginningbalance VALUES ('591', '03-265', 'Tee 3" GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.575742', '19');
INSERT INTO ims_beginningbalance VALUES ('592', '03-266', 'Tee 3" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.595118', '19');
INSERT INTO ims_beginningbalance VALUES ('593', '03-267', 'Tee 3/4" GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.613374', '1');
INSERT INTO ims_beginningbalance VALUES ('594', '03-268', 'Tee 3/4"HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.633799', '1');
INSERT INTO ims_beginningbalance VALUES ('595', '03-269', 'Tee 4" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.652764', '19');
INSERT INTO ims_beginningbalance VALUES ('596', '03-270', 'Tee Reducer 1 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.672629', '19');
INSERT INTO ims_beginningbalance VALUES ('597', '03-271', 'Tee Reducer 1" x 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.692790', '19');
INSERT INTO ims_beginningbalance VALUES ('598', '03-272', 'Tee Reducer 1/2 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.720396', '19');
INSERT INTO ims_beginningbalance VALUES ('599', '03-273', 'Tee Reducer 3 x 2 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.746033', '19');
INSERT INTO ims_beginningbalance VALUES ('600', '03-274', 'Tee Reducer 4 x 2 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.769687', '19');
INSERT INTO ims_beginningbalance VALUES ('601', '03-275', 'Tee Reducer 4 x 3 HDPE- FISH', '0', '0.0', '0.0', '2025-03-07 05:25:25.792794', '19');
INSERT INTO ims_beginningbalance VALUES ('602', '03-276', 'Tee 6" Flange', '0', '0.0', '0.0', '2025-03-07 05:25:25.811460', '19');
INSERT INTO ims_beginningbalance VALUES ('603', '03-277', 'Tee 6 x 4  Mechanical CI', '0', '0.0', '0.0', '2025-03-07 05:25:25.830073', '19');
INSERT INTO ims_beginningbalance VALUES ('604', '03-278', 'Valve Cover - 4" GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.848763', '19');
INSERT INTO ims_beginningbalance VALUES ('605', '03-279', 'Valve Cover - 6" G.I.', '0', '0.0', '0.0', '2025-03-07 05:25:25.867685', '19');
INSERT INTO ims_beginningbalance VALUES ('606', '03-280', 'Y-connector with ferrul 3/4"', '0', '0.0', '0.0', '2025-03-07 05:25:25.885389', '19');
INSERT INTO ims_beginningbalance VALUES ('607', '03-281', 'Y-Strainer 2"', '0', '0.0', '0.0', '2025-03-07 05:25:25.904514', '19');
INSERT INTO ims_beginningbalance VALUES ('608', '03-282', 'Y-Strainer 3"', '0', '0.0', '0.0', '2025-03-07 05:25:25.923400', '19');
INSERT INTO ims_beginningbalance VALUES ('609', '03-283', 'Y-Strainer 4"', '0', '0.0', '0.0', '2025-03-07 05:25:25.941891', '19');
INSERT INTO ims_beginningbalance VALUES ('610', '03-284', 'Y-Strainer 6" Flange', '0', '0.0', '0.0', '2025-03-07 05:25:25.960810', '19');
INSERT INTO ims_beginningbalance VALUES ('611', '03-285', 'Elbow 6 x 45 deg (sched 80) GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.979016', '19');
INSERT INTO ims_beginningbalance VALUES ('612', '03-286', 'Elbow 6 x 90 deg (sched 80) GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.997279', '19');
INSERT INTO ims_beginningbalance VALUES ('613', '03-287', 'STC (GI-HDPE) 6" - BLACK', '0', '0.0', '0.0', '2025-03-07 05:25:26.015670', '19');
INSERT INTO ims_beginningbalance VALUES ('614', '03-288', 'STC (GI-PVC) 2"', '0', '0.0', '0.0', '2025-03-07 05:25:26.039234', '19');
INSERT INTO ims_beginningbalance VALUES ('615', '03-289', 'STC (GI-PVC) 4"', '0', '0.0', '0.0', '2025-03-07 05:25:26.057907', '19');
INSERT INTO ims_beginningbalance VALUES ('616', '03-290', 'Checkvalve 3" GI', '0', '0.0', '0.0', '2025-03-07 05:25:26.076866', '19');
INSERT INTO ims_beginningbalance VALUES ('617', '03-291', 'Cross Tee Fabricated HDPE 4"', '0', '0.0', '0.0', '2025-03-07 05:25:26.095488', '19');
INSERT INTO ims_beginningbalance VALUES ('618', '03-292', 'Cross Tee HDPE 3"', '0', '0.0', '0.0', '2025-03-07 05:25:26.113417', '19');
INSERT INTO ims_beginningbalance VALUES ('619', '03-293', 'Cross Tee HDPE 4x3', '0', '0.0', '0.0', '2025-03-07 05:25:26.131657', '19');
INSERT INTO ims_beginningbalance VALUES ('620', '03-294', 'Cross Tee HDPE 6x3', '0', '0.0', '0.0', '2025-03-07 05:25:26.151429', '19');
INSERT INTO ims_beginningbalance VALUES ('621', '03-295', 'Cross Tee HDPE 6x4', '0', '0.0', '0.0', '2025-03-07 05:25:26.170021', '19');
INSERT INTO ims_beginningbalance VALUES ('622', '03-296', 'Nipple 1"x24" GI (sched 80)', '0', '0.0', '0.0', '2025-03-07 05:25:26.188304', '19');
INSERT INTO ims_beginningbalance VALUES ('623', '03-297', 'Coupling Reducer 1" x 3/4" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:26.206698', '19');
INSERT INTO ims_beginningbalance VALUES ('624', '03-298', 'Tee w/ Thread 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:26.225709', '19');
INSERT INTO ims_beginningbalance VALUES ('625', '03-299', 'Elbow 4 x 90 sched80', '0', '0.0', '0.0', '2025-03-07 05:25:26.246767', '19');
INSERT INTO ims_beginningbalance VALUES ('626', '03-300', 'STC 4" ( GI to HDPE) DI - BLUE', '0', '0.0', '0.0', '2025-03-07 05:25:26.266350', '19');
INSERT INTO ims_beginningbalance VALUES ('627', '03-301', 'Cross Tee HDPE 3 x 2 - fabricated', '0', '0.0', '0.0', '2025-03-07 05:25:26.284363', '19');
INSERT INTO ims_beginningbalance VALUES ('628', '03-302', 'STC 3" (GI to HDPE)', '0', '0.0', '0.0', '2025-03-07 05:25:26.303124', '19');
INSERT INTO ims_beginningbalance VALUES ('629', '03-303', 'Elbow 3" GI 90deg (sched 80)', '0', '0.0', '0.0', '2025-03-07 05:25:26.322243', '19');
INSERT INTO ims_beginningbalance VALUES ('630', '03-304', 'STC 8"', '0', '0.0', '0.0', '2025-03-07 05:25:26.340966', '19');
INSERT INTO ims_beginningbalance VALUES ('631', '03-305', 'Elbow 3" 45 deg. (schd.80)', '0', '0.0', '0.0', '2025-03-07 05:25:26.359207', '19');
INSERT INTO ims_beginningbalance VALUES ('632', '03-306', 'Gate Valve Flange type 8" w/ bang', '0', '0.0', '0.0', '2025-03-07 05:25:26.377460', '19');
INSERT INTO ims_beginningbalance VALUES ('633', '03-307', 'Nipple 1/2 x 5', '0', '0.0', '0.0', '2025-03-07 05:25:26.396737', '19');
INSERT INTO ims_beginningbalance VALUES ('634', '03-308', 'Elbow 8 x 90 deg. - HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:26.417100', '19');
INSERT INTO ims_beginningbalance VALUES ('635', '03-309', 'Coupling Reducer 8 x 6 - HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:26.437108', '19');
INSERT INTO ims_beginningbalance VALUES ('636', '03-310', 'Fabricated Coupling 6 x 8', '0', '0.0', '0.0', '2025-03-07 05:25:26.457368', '19');
INSERT INTO ims_beginningbalance VALUES ('637', '03-311', 'Check Valve 3/4- Brass', '0', '0.0', '0.0', '2025-03-07 05:25:26.476922', '19');
INSERT INTO ims_beginningbalance VALUES ('638', '03-312', 'Valve Cover 6" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:26.497063', '19');
INSERT INTO ims_beginningbalance VALUES ('639', '03-313', 'Fabricated Elbow 4 x 90 deg. HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:26.517576', '19');
INSERT INTO ims_beginningbalance VALUES ('640', '03-314', 'Fabricated Elbow 6 x 90 deg. HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:26.538182', '19');
INSERT INTO ims_beginningbalance VALUES ('641', '03-315', 'Fabricated Elbow 8 x 45 deg. HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:26.558556', '19');
INSERT INTO ims_beginningbalance VALUES ('642', '03-316', 'Coupling Reducer 8 x 4 - HDPE ( Fabricated)', '0', '0.0', '0.0', '2025-03-07 05:25:26.577113', '19');
INSERT INTO ims_beginningbalance VALUES ('643', '03-317', 'Coupling Reducer 8 x 6 - HDPE ( Fabricated)', '0', '0.0', '0.0', '2025-03-07 05:25:26.595836', '19');
INSERT INTO ims_beginningbalance VALUES ('644', '03-318', 'Gasket- 6"', '0', '0.0', '0.0', '2025-03-07 05:25:26.614681', '19');
INSERT INTO ims_beginningbalance VALUES ('645', '03-319', 'DI Gate Valve Flange Type 8"', '0', '0.0', '0.0', '2025-03-07 05:25:26.632513', '19');
INSERT INTO ims_beginningbalance VALUES ('646', '03-320', 'Bolt and nut 5/8 x 8- Full Thread', '0', '0.0', '0.0', '2025-03-07 05:25:26.653036', '19');
INSERT INTO ims_beginningbalance VALUES ('647', '03-321', 'Full thread 3/4 x 10 ft.', '0', '0.0', '0.0', '2025-03-07 05:25:26.675170', '19');
INSERT INTO ims_beginningbalance VALUES ('648', '03-322', 'Bell Reducer 5 x 4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:26.692690', '19');
INSERT INTO ims_beginningbalance VALUES ('649', '03-323', 'Tee 4" Flange type CI', '0', '0.0', '0.0', '2025-03-07 05:25:26.711758', '19');
INSERT INTO ims_beginningbalance VALUES ('650', '03-324', 'Nut GI - 5/8"- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:26.730389', '19');
INSERT INTO ims_beginningbalance VALUES ('651', '03-325', 'Bell Reducer GI 1/2 x 3/4 - JB', '0', '0.0', '0.0', '2025-03-07 05:25:26.749843', '19');
INSERT INTO ims_beginningbalance VALUES ('652', '03-326', 'End Cap 3/4 GI - MECH', '0', '0.0', '0.0', '2025-03-07 05:25:26.769011', '19');
INSERT INTO ims_beginningbalance VALUES ('653', '03-327', 'End Plug 3/4 GI - JB', '0', '0.0', '0.0', '2025-03-07 05:25:26.787544', '19');
INSERT INTO ims_beginningbalance VALUES ('654', '03-328', 'End Plug 1"GI - JB', '0', '0.0', '0.0', '2025-03-07 05:25:26.806767', '19');
INSERT INTO ims_beginningbalance VALUES ('655', '03-329', 'Nipple 3/4 x 5 GI - JB', '0', '0.0', '0.0', '2025-03-07 05:25:26.825922', '19');
INSERT INTO ims_beginningbalance VALUES ('656', '03-330', 'Nipple 3/4 x 8 GI - FS', '0', '0.0', '0.0', '2025-03-07 05:25:26.844798', '19');
INSERT INTO ims_beginningbalance VALUES ('657', '03-331', 'Nipple 1 x 5 GI - AKUA', '0', '0.0', '0.0', '2025-03-07 05:25:26.863931', '19');
INSERT INTO ims_beginningbalance VALUES ('658', '03-332', 'Nipple 1 x 8 GI - AKUA', '0', '0.0', '0.0', '2025-03-07 05:25:26.883710', '19');
INSERT INTO ims_beginningbalance VALUES ('659', '03-333', 'Saddle Clamp 3 x 3/4 DI - PV', '0', '0.0', '0.0', '2025-03-07 05:25:26.903226', '19');
INSERT INTO ims_beginningbalance VALUES ('660', '03-334', 'Saddle Clamp 6 x 1 DI - PV', '0', '0.0', '0.0', '2025-03-07 05:25:26.922936', '19');
INSERT INTO ims_beginningbalance VALUES ('661', '03-335', 'Sleeve-Type Coupling 3" DI pvc to pvc- BOHAI', '0', '0.0', '0.0', '2025-03-07 05:25:26.941453', '19');
INSERT INTO ims_beginningbalance VALUES ('662', '03-336', 'Sleeve-Type Coupling 4" DI pvc to pvc- BOHAI', '0', '0.0', '0.0', '2025-03-07 05:25:26.960885', '19');
INSERT INTO ims_beginningbalance VALUES ('663', '03-337', 'Sleeve-Type Coupling 6" DI (PVC to PVC)- BOHAI', '0', '0.0', '0.0', '2025-03-07 05:25:26.981048', '19');
INSERT INTO ims_beginningbalance VALUES ('664', '03-338', 'Male Adaptor 3/4 nlc- PBP', '0', '0.0', '0.0', '2025-03-07 05:25:26.999844', '19');
INSERT INTO ims_beginningbalance VALUES ('665', '03-339', 'Male Adaptor 1 nlc- PBP', '0', '0.0', '0.0', '2025-03-07 05:25:27.018809', '19');
INSERT INTO ims_beginningbalance VALUES ('666', '03-340', 'PVC Pipe 1/2 w/ hub- NELTEX', '0', '0.0', '0.0', '2025-03-07 05:25:27.038679', '19');
INSERT INTO ims_beginningbalance VALUES ('667', '03-341', 'Male Adaptor 1/2 PVC- TIAN BLUE', '0', '0.0', '0.0', '2025-03-07 05:25:27.057834', '19');
INSERT INTO ims_beginningbalance VALUES ('668', '03-342', 'Coupling 1/2 PVC- TIAN BLUE', '0', '0.0', '0.0', '2025-03-07 05:25:27.076971', '19');
INSERT INTO ims_beginningbalance VALUES ('669', '03-343', 'Elbow Plain 1/2 PVC- TIAN BLUE', '0', '0.0', '0.0', '2025-03-07 05:25:27.096040', '19');
INSERT INTO ims_beginningbalance VALUES ('670', '03-344', 'Repair Clamp 2" HDPE -MIE', '0', '0.0', '0.0', '2025-03-07 05:25:27.116008', '19');
INSERT INTO ims_beginningbalance VALUES ('671', '03-345', 'Repair Clamp 3" HDPE -MIE', '0', '0.0', '0.0', '2025-03-07 05:25:27.137238', '19');
INSERT INTO ims_beginningbalance VALUES ('672', '03-346', 'Tee Reducer 1 x 3/4 GI - JB', '0', '0.0', '0.0', '2025-03-07 05:25:27.156032', '19');
INSERT INTO ims_beginningbalance VALUES ('673', '03-347', 'Tee 3/4 GI - JB', '0', '0.0', '0.0', '2025-03-07 05:25:27.176491', '19');
INSERT INTO ims_beginningbalance VALUES ('674', '03-348', 'Nipple 1/2 x 1 GI - MICRO', '0', '0.0', '0.0', '2025-03-07 05:25:27.197371', '19');
INSERT INTO ims_beginningbalance VALUES ('675', '03-349', 'Nipple 1/2 x 2 GI - MICRO', '0', '0.0', '0.0', '2025-03-07 05:25:27.217636', '19');
INSERT INTO ims_beginningbalance VALUES ('676', '03-350', 'Coupling 1" HDPE - FISH', '0', '0.0', '0.0', '2025-03-07 05:25:27.237547', '19');
INSERT INTO ims_beginningbalance VALUES ('677', '03-351', 'Female Elbow 1/2 HDPE- PBP', '0', '0.0', '0.0', '2025-03-07 05:25:27.257522', '19');
INSERT INTO ims_beginningbalance VALUES ('678', '03-352', 'DI Sleeve type coupling pvc-pvc 4"- HIWA', '0', '0.0', '0.0', '2025-03-07 05:25:27.278214', '19');
INSERT INTO ims_beginningbalance VALUES ('679', '03-353', 'DI Sleeve type coupling pvc-pvc 6"-HIWA', '0', '0.0', '0.0', '2025-03-07 05:25:27.296947', '19');
INSERT INTO ims_beginningbalance VALUES ('680', '03-354', 'CI Sleeve Type coupling pvc- GI 6"- CMI', '0', '0.0', '0.0', '2025-03-07 05:25:27.316207', '19');
INSERT INTO ims_beginningbalance VALUES ('681', '03-355', 'Flow meter 4" Paddle Wheel Type- ZENNER', '0', '0.0', '0.0', '2025-03-07 05:25:27.336112', '19');
INSERT INTO ims_beginningbalance VALUES ('682', '03-356', 'Flow meter 6" Paddle Wheel Type- ZENNER', '0', '0.0', '0.0', '2025-03-07 05:25:27.355175', '19');
INSERT INTO ims_beginningbalance VALUES ('683', '03-357', 'GASKET 4- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:27.373360', '19');
INSERT INTO ims_beginningbalance VALUES ('684', '03-358', 'STC 4" ( GI to GI)- CMI', '0', '0.0', '0.0', '2025-03-07 05:25:27.391725', '19');
INSERT INTO ims_beginningbalance VALUES ('685', '03-359', 'Check Valve 1/2 Brass- ACE', '0', '0.0', '0.0', '2025-03-07 05:25:27.410529', '19');
INSERT INTO ims_beginningbalance VALUES ('686', '03-360', 'Ball Valve 1/2 Lockwing -ACE', '0', '0.0', '0.0', '2025-03-07 05:25:27.430800', '19');
INSERT INTO ims_beginningbalance VALUES ('687', '03-361', 'Nipple 1/2 x 12 GI - JB', '0', '0.0', '0.0', '2025-03-07 05:25:27.451091', '19');
INSERT INTO ims_beginningbalance VALUES ('688', '03-362', 'Male Adaptor 1/2 HDPE- PBP', '0', '0.0', '0.0', '2025-03-07 05:25:27.470145', '19');
INSERT INTO ims_beginningbalance VALUES ('689', '04-001', 'Pipe 1" HDPE- MIG', '0', '0.0', '0.0', '2025-03-07 05:25:27.489691', '19');
INSERT INTO ims_beginningbalance VALUES ('690', '04-002', 'Pipe 1" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:27.508731', '14');
INSERT INTO ims_beginningbalance VALUES ('691', '04-003', 'Pipe 1/2 HDPE - MIG', '0', '0.0', '0.0', '2025-03-07 05:25:27.527441', '14');
INSERT INTO ims_beginningbalance VALUES ('692', '04-004', 'Pipe 1/2 PVC', '0', '0.0', '0.0', '2025-03-07 05:25:27.545818', '14');
INSERT INTO ims_beginningbalance VALUES ('693', '04-005', 'Pipe 2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:27.564454', '14');
INSERT INTO ims_beginningbalance VALUES ('694', '04-006', 'Pipe 3" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:27.583591', '14');
INSERT INTO ims_beginningbalance VALUES ('695', '04-007', 'Pipe 3" RISER PIPE', '0', '0.0', '0.0', '2025-03-07 05:25:27.601825', '14');
INSERT INTO ims_beginningbalance VALUES ('696', '04-008', 'Pipe 3/4 HDPE - MIG', '0', '0.0', '0.0', '2025-03-07 05:25:27.620743', '19');
INSERT INTO ims_beginningbalance VALUES ('697', '04-009', 'Pipe 4" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:27.641010', '14');
INSERT INTO ims_beginningbalance VALUES ('698', '04-010', 'Pipe 4" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:27.659787', '14');
INSERT INTO ims_beginningbalance VALUES ('699', '04-011', 'Pipe 4" RISER HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:27.678074', '19');
INSERT INTO ims_beginningbalance VALUES ('700', '04-012', 'Pipe 4" GI', '0', '0.0', '0.0', '2025-03-07 05:25:27.698233', '19');
INSERT INTO ims_beginningbalance VALUES ('701', '04-013', 'Pipe 6" GI (sched 80)', '0', '0.0', '0.0', '2025-03-07 05:25:27.719475', '19');
INSERT INTO ims_beginningbalance VALUES ('702', '04-014', 'Pipe 6" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:27.739943', '19');
INSERT INTO ims_beginningbalance VALUES ('703', '04-015', 'Pipe 8" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:27.761894', '19');
INSERT INTO ims_beginningbalance VALUES ('704', '04-016', 'Pipe 10" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:27.781828', '19');
INSERT INTO ims_beginningbalance VALUES ('705', '04-017', 'Pipe RISER 4" GI', '0', '0.0', '0.0', '2025-03-07 05:25:27.802723', '19');
INSERT INTO ims_beginningbalance VALUES ('706', '04-018', 'Pipe 3" GI (sched 80)', '0', '0.0', '0.0', '2025-03-07 05:25:27.824176', '19');
INSERT INTO ims_beginningbalance VALUES ('707', '04-019', 'Pipe 8" - HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:27.842528', '19');
INSERT INTO ims_beginningbalance VALUES ('708', '04-020', 'Pipe 1 1/2 GI LSII', '0', '0.0', '0.0', '2025-03-07 05:25:27.861393', '19');
INSERT INTO ims_beginningbalance VALUES ('709', '04-021', 'Pipe 1 1 /2 GI s20', '0', '0.0', '0.0', '2025-03-07 05:25:27.880282', '19');
INSERT INTO ims_beginningbalance VALUES ('710', '05-001', 'Flow Meter 2"', '0', '0.0', '0.0', '2025-03-07 05:25:27.900747', '19');
INSERT INTO ims_beginningbalance VALUES ('711', '05-002', 'Flow Meter 3"- ZENNER', '0', '0.0', '0.0', '2025-03-07 05:25:27.920088', '19');
INSERT INTO ims_beginningbalance VALUES ('712', '05-003', 'Flow Meter 4"', '0', '0.0', '0.0', '2025-03-07 05:25:27.938199', '19');
INSERT INTO ims_beginningbalance VALUES ('713', '05-004', 'Flow Meter 6"', '0', '0.0', '0.0', '2025-03-07 05:25:27.957460', '19');
INSERT INTO ims_beginningbalance VALUES ('714', '05-005', 'Water Meter - Brass 1/2" - HYJET', '0', '0.0', '0.0', '2025-03-07 05:25:27.977908', '19');
INSERT INTO ims_beginningbalance VALUES ('715', '05-006', 'Water Meter - Plastic 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:27.997372', '19');
INSERT INTO ims_beginningbalance VALUES ('716', '05-007', 'Water Meter 3/4 - Brass - ACE', '0', '0.0', '0.0', '2025-03-07 05:25:28.016678', '19');
INSERT INTO ims_beginningbalance VALUES ('717', '05-008', 'Water Meter - Brass 1" - ACE', '0', '0.0', '0.0', '2025-03-07 05:25:28.037015', '19');
INSERT INTO ims_beginningbalance VALUES ('718', '05-009', 'Water Meter - Brass 2"', '0', '0.0', '0.0', '2025-03-07 05:25:28.057414', '19');
INSERT INTO ims_beginningbalance VALUES ('719', '06-001', 'Chemical Solution Tank 100L', '0', '0.0', '0.0', '2025-03-07 05:25:28.077050', '9');
INSERT INTO ims_beginningbalance VALUES ('720', '06-002', 'Caution Tape', '0', '0.0', '0.0', '2025-03-07 05:25:28.097381', '19');
INSERT INTO ims_beginningbalance VALUES ('721', '06-003', 'Fire Hydrant Head 2 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:28.116351', '19');
INSERT INTO ims_beginningbalance VALUES ('722', '06-004', 'Fire Hydrant Head 3 X 2 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:28.135589', '19');
INSERT INTO ims_beginningbalance VALUES ('723', '06-005', 'Pressure Gauge 0-60 PSI', '0', '0.0', '0.0', '2025-03-07 05:25:28.154796', '19');
INSERT INTO ims_beginningbalance VALUES ('724', '06-006', 'Pressure Reducer Valve 3"', '0', '0.0', '0.0', '2025-03-07 05:25:28.173677', '19');
INSERT INTO ims_beginningbalance VALUES ('725', '06-007', 'Pressure Reducer Valve 4"', '0', '0.0', '0.0', '2025-03-07 05:25:28.193168', '19');
INSERT INTO ims_beginningbalance VALUES ('726', '06-008', 'Pressure Reducer Valve 6"', '0', '0.0', '0.0', '2025-03-07 05:25:28.211891', '19');
INSERT INTO ims_beginningbalance VALUES ('727', '06-009', 'PVC Pipe Cement- ATLANTA', '0', '0.0', '0.0', '2025-03-07 05:25:28.230143', '19');
INSERT INTO ims_beginningbalance VALUES ('728', '06-010', 'Padlock', '0', '0.0', '0.0', '2025-03-07 05:25:28.250034', '19');
INSERT INTO ims_beginningbalance VALUES ('729', '06-011', 'Hacksaw Blade 12" Sandflex', '0', '0.0', '0.0', '2025-03-07 05:25:28.269468', '19');
INSERT INTO ims_beginningbalance VALUES ('730', '06-012', 'Teflon Tape - ROYAL', '0', '0.0', '0.0', '2025-03-07 05:25:28.289616', '19');
INSERT INTO ims_beginningbalance VALUES ('731', '06-013', 'Pressure Gauge 100 PSI', '0', '0.0', '0.0', '2025-03-07 05:25:28.309557', '19');
INSERT INTO ims_beginningbalance VALUES ('732', '06-014', 'Concrete Cutter Blade 14"', '0', '0.0', '0.0', '2025-03-07 05:25:28.328346', '19');
INSERT INTO ims_beginningbalance VALUES ('733', '06-015', 'Chemical Solution Tank 200L', '0', '0.0', '0.0', '2025-03-07 05:25:28.347363', '9');
INSERT INTO ims_beginningbalance VALUES ('734', '06-016', 'Pressure Gauge 300 PSI', '0', '0.0', '0.0', '2025-03-07 05:25:28.366750', '19');
INSERT INTO ims_beginningbalance VALUES ('735', '06-017', 'GI Bolts & Nuts 5/8 5" (Fullthread)- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:28.385616', '19');
INSERT INTO ims_beginningbalance VALUES ('736', '06-018', 'Rubber O-ring 4" PVC sure lock riser pipe', '0', '0.0', '0.0', '2025-03-07 05:25:28.405611', '19');
INSERT INTO ims_beginningbalance VALUES ('737', '06-019', 'Bolt & Nut  w/ washer', '0', '0.0', '0.0', '2025-03-07 05:25:28.426202', '19');
INSERT INTO ims_beginningbalance VALUES ('738', '06-020', 'Bolt & Nut m-6 x 20 w/ washer', '0', '0.0', '0.0', '2025-03-07 05:25:28.448745', '19');
INSERT INTO ims_beginningbalance VALUES ('739', '06-021', 'Lock Washer', '0', '0.0', '0.0', '2025-03-07 05:25:28.468176', '19');
INSERT INTO ims_beginningbalance VALUES ('740', '06-022', 'PE Hose 4 x 6 - white', '0', '0.0', '0.0', '2025-03-07 05:25:28.487378', '20');
INSERT INTO ims_beginningbalance VALUES ('741', '06-023', 'Bolt and Nut 3/4 x 4 -full thread', '0', '0.0', '0.0', '2025-03-07 05:25:28.516806', '19');
INSERT INTO ims_beginningbalance VALUES ('742', '06-024', 'Cutting Disc 4"- BLUE SHARK', '0', '0.0', '0.0', '2025-03-07 05:25:28.542304', '19');
INSERT INTO ims_beginningbalance VALUES ('743', '06-025', 'Cut Off 14"', '0', '0.0', '0.0', '2025-03-07 05:25:28.568349', '19');
INSERT INTO ims_beginningbalance VALUES ('744', '06-026', 'Saddle Clamp w/ Ferrule - 8 x 1 - HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:28.592341', '19');
INSERT INTO ims_beginningbalance VALUES ('745', '06-027', 'New Other Materials', '0', '0.0', '0.0', '2025-03-07 05:25:28.612657', '1');

CREATE TABLE `ims_classification` (
  `classificationID` int NOT NULL AUTO_INCREMENT,
  `classification` varchar(500) NOT NULL,
  PRIMARY KEY (`classificationID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO ims_classification VALUES ('1', 'Chemicals');
INSERT INTO ims_classification VALUES ('2', 'Construction');
INSERT INTO ims_classification VALUES ('3', 'Fittings');
INSERT INTO ims_classification VALUES ('4', 'Pipes');
INSERT INTO ims_classification VALUES ('5', 'Water Meters');
INSERT INTO ims_classification VALUES ('6', 'Other Materials');

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

INSERT INTO ims_item VALUES ('01-001', 'Chlorine Dioxide - Liquid', '480', '255.0', '127500.0', '2025-03-07 05:25:14.536865', '2025-03-07 05:25:14.536874', '1', '22');
INSERT INTO ims_item VALUES ('01-002', 'Chlorine Dioxide - Powder', '0', '0.0', '0.0', '2025-03-07 05:25:14.584954', '2025-03-07 05:25:14.584961', '1', '9');
INSERT INTO ims_item VALUES ('01-003', 'Chlorine Granules', '0', '0.0', '0.0', '2025-03-07 05:25:14.603225', '2025-03-07 05:25:14.603232', '1', '9');
INSERT INTO ims_item VALUES ('02-001', 'Asphalt', '0', '0.0', '0.0', '2025-03-07 05:25:14.622014', '2025-03-07 05:25:14.622024', '2', '10');
INSERT INTO ims_item VALUES ('02-002', 'Cement- RIZAL', '0', '0.0', '0.0', '2025-03-07 05:25:14.642157', '2025-03-07 05:25:14.642164', '2', '4');
INSERT INTO ims_item VALUES ('02-003', 'Gravel', '0', '0.0', '0.0', '2025-03-07 05:25:14.660634', '2025-03-07 05:25:14.660644', '2', '19');
INSERT INTO ims_item VALUES ('02-004', 'White Sand', '0', '0.0', '0.0', '2025-03-07 05:25:14.679547', '2025-03-07 05:25:14.679557', '2', '19');
INSERT INTO ims_item VALUES ('02-005', 'Concrete Hollow Blocks', '0', '0.0', '0.0', '2025-03-07 05:25:14.697479', '2025-03-07 05:25:14.697487', '2', '1');
INSERT INTO ims_item VALUES ('02-006', 'Flexible Hose- Flexible Oppo', '0', '0.0', '0.0', '2025-03-07 05:25:14.716654', '2025-03-07 05:25:14.716661', '2', '15');
INSERT INTO ims_item VALUES ('02-007', 'C-Clamp PVC', '0', '0.0', '0.0', '2025-03-07 05:25:14.733683', '2025-03-07 05:25:14.733690', '2', '19');
INSERT INTO ims_item VALUES ('02-008', 'THHN 14" - BOSTON', '0', '0.0', '0.0', '2025-03-07 05:25:14.751897', '2025-03-07 05:25:14.751905', '2', '19');
INSERT INTO ims_item VALUES ('02-009', 'FI Hose 1/2 x 1/2 x 24', '0', '0.0', '0.0', '2025-03-07 05:25:14.768602', '2025-03-07 05:25:14.768610', '2', '19');
INSERT INTO ims_item VALUES ('02-010', 'Flexible Hose 1/2 X 50 - OMEGA', '0', '0.0', '0.0', '2025-03-07 05:25:14.785644', '2025-03-07 05:25:14.785651', '2', '20');
INSERT INTO ims_item VALUES ('02-011', 'Flexible Hose 3/8', '0', '0.0', '0.0', '2025-03-07 05:25:14.804996', '2025-03-07 05:25:14.805008', '2', '19');
INSERT INTO ims_item VALUES ('02-012', 'Skim Coat- ABC', '0', '0.0', '0.0', '2025-03-07 05:25:14.823452', '2025-03-07 05:25:14.823460', '2', '19');
INSERT INTO ims_item VALUES ('02-013', 'Angle Valve 1/2 x 3/8', '0', '0.0', '0.0', '2025-03-07 05:25:14.841238', '2025-03-07 05:25:14.841245', '2', '19');
INSERT INTO ims_item VALUES ('02-014', 'Angle Valve 1/2 x 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:14.858653', '2025-03-07 05:25:14.858660', '2', '19');
INSERT INTO ims_item VALUES ('02-015', 'Angle Valve 1/2 x 3/4', '0', '0.0', '0.0', '2025-03-07 05:25:14.878124', '2025-03-07 05:25:14.878131', '2', '19');
INSERT INTO ims_item VALUES ('02-016', 'C Purlins 2x3 GI 1.4', '0', '0.0', '0.0', '2025-03-07 05:25:14.897884', '2025-03-07 05:25:14.897891', '2', '19');
INSERT INTO ims_item VALUES ('02-017', 'Angel Bar 4.5mm x 2', '0', '0.0', '0.0', '2025-03-07 05:25:14.915993', '2025-03-07 05:25:14.916000', '2', '19');
INSERT INTO ims_item VALUES ('02-018', 'Goose Neck Faucet- SUNRISE', '0', '0.0', '0.0', '2025-03-07 05:25:14.933693', '2025-03-07 05:25:14.933700', '2', '19');
INSERT INTO ims_item VALUES ('02-019', 'Lavatory Valve', '0', '0.0', '0.0', '2025-03-07 05:25:14.950528', '2025-03-07 05:25:14.950536', '2', '19');
INSERT INTO ims_item VALUES ('02-020', 'Faucet Brass hose Bibb- HAWK', '0', '0.0', '0.0', '2025-03-07 05:25:14.968583', '2025-03-07 05:25:14.968591', '2', '19');
INSERT INTO ims_item VALUES ('02-021', 'Two-Way Faucet Valve', '0', '0.0', '0.0', '2025-03-07 05:25:14.987212', '2025-03-07 05:25:14.987221', '2', '19');
INSERT INTO ims_item VALUES ('02-022', 'Lavatory Faucet', '0', '0.0', '0.0', '2025-03-07 05:25:15.004759', '2025-03-07 05:25:15.004766', '2', '19');
INSERT INTO ims_item VALUES ('02-023', 'Diamond Cutting Disc', '0', '0.0', '0.0', '2025-03-07 05:25:15.022717', '2025-03-07 05:25:15.022728', '2', '19');
INSERT INTO ims_item VALUES ('02-024', 'Cable Tie 6 x 2mm - POWER HOUSE', '0', '0.0', '0.0', '2025-03-07 05:25:15.041237', '2025-03-07 05:25:15.041245', '2', '16');
INSERT INTO ims_item VALUES ('02-025', 'Padlock - Hardware', '0', '0.0', '0.0', '2025-03-07 05:25:15.059461', '2025-03-07 05:25:15.059468', '2', '19');
INSERT INTO ims_item VALUES ('02-026', 'Hardiflex 3/16 - JAMES HARDI', '0', '0.0', '0.0', '2025-03-07 05:25:15.075746', '2025-03-07 05:25:15.075756', '2', '19');
INSERT INTO ims_item VALUES ('02-027', 'Two Gang Outlet - ROYU', '0', '0.0', '0.0', '2025-03-07 05:25:15.094748', '2025-03-07 05:25:15.094755', '2', '19');
INSERT INTO ims_item VALUES ('02-028', 'Hook', '0', '0.0', '0.0', '2025-03-07 05:25:15.112834', '2025-03-07 05:25:15.112841', '2', '19');
INSERT INTO ims_item VALUES ('02-029', 'Aluminum Silver (PAINT)', '0', '0.0', '0.0', '2025-03-07 05:25:15.130401', '2025-03-07 05:25:15.130412', '2', '19');
INSERT INTO ims_item VALUES ('02-030', 'Welding Rod 6013 Special- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:15.148769', '2025-03-07 05:25:15.148776', '2', '11');
INSERT INTO ims_item VALUES ('02-031', 'Tie Wire', '0', '0.0', '0.0', '2025-03-07 05:25:15.167218', '2025-03-07 05:25:15.167226', '2', '11');
INSERT INTO ims_item VALUES ('02-032', 'Bosny Black- Pylox', '0', '0.0', '0.0', '2025-03-07 05:25:15.184997', '2025-03-07 05:25:15.185005', '2', '8');
INSERT INTO ims_item VALUES ('02-033', 'Electrical Tape- BIG Armak', '0', '0.0', '0.0', '2025-03-07 05:25:15.202954', '2025-03-07 05:25:15.202962', '2', '19');
INSERT INTO ims_item VALUES ('02-034', 'Masking Tape 3/4', '0', '0.0', '0.0', '2025-03-07 05:25:15.220350', '2025-03-07 05:25:15.220356', '2', '19');
INSERT INTO ims_item VALUES ('02-035', 'Regular Plug', '0', '0.0', '0.0', '2025-03-07 05:25:15.239022', '2025-03-07 05:25:15.239030', '2', '19');
INSERT INTO ims_item VALUES ('02-036', 'Three Gang Outlet', '0', '0.0', '0.0', '2025-03-07 05:25:15.264239', '2025-03-07 05:25:15.264250', '2', '19');
INSERT INTO ims_item VALUES ('02-037', 'Marine Ply Wood - 3/4', '0', '0.0', '0.0', '2025-03-07 05:25:15.287989', '2025-03-07 05:25:15.288001', '2', '19');
INSERT INTO ims_item VALUES ('02-038', 'Barateha', '0', '0.0', '0.0', '2025-03-07 05:25:15.311884', '2025-03-07 05:25:15.311895', '2', '19');
INSERT INTO ims_item VALUES ('02-039', 'Piano Hinges', '0', '0.0', '0.0', '2025-03-07 05:25:15.331797', '2025-03-07 05:25:15.331804', '2', '19');
INSERT INTO ims_item VALUES ('02-040', 'Concrete Nail 1 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:15.354348', '2025-03-07 05:25:15.354362', '2', '11');
INSERT INTO ims_item VALUES ('02-041', 'Stikwel - Wood Glue', '0', '0.0', '0.0', '2025-03-07 05:25:15.372351', '2025-03-07 05:25:15.372358', '2', '12');
INSERT INTO ims_item VALUES ('02-042', 'Cabinet Handle', '0', '0.0', '0.0', '2025-03-07 05:25:15.389577', '2025-03-07 05:25:15.389585', '2', '19');
INSERT INTO ims_item VALUES ('02-043', 'Thalo blue - Acrylic', '0', '0.0', '0.0', '2025-03-07 05:25:15.407705', '2025-03-07 05:25:15.407715', '2', '12');
INSERT INTO ims_item VALUES ('02-044', 'THHN 12" - BOSTON', '0', '0.0', '0.0', '2025-03-07 05:25:15.427232', '2025-03-07 05:25:15.427239', '2', '5');
INSERT INTO ims_item VALUES ('02-045', 'THNN 14 - BOSTON', '0', '0.0', '0.0', '2025-03-07 05:25:15.444250', '2025-03-07 05:25:15.444260', '2', '5');
INSERT INTO ims_item VALUES ('02-046', 'BLIND RIVITS 1/8 X 3/4', '0', '0.0', '0.0', '2025-03-07 05:25:15.462231', '2025-03-07 05:25:15.462239', '2', '5');
INSERT INTO ims_item VALUES ('02-047', 'Cement spoon', '0', '0.0', '0.0', '2025-03-07 05:25:15.480449', '2025-03-07 05:25:15.480456', '2', '19');
INSERT INTO ims_item VALUES ('02-048', 'Tubular 1 x 1 1.4', '0', '0.0', '0.0', '2025-03-07 05:25:15.496786', '2025-03-07 05:25:15.496793', '2', '19');
INSERT INTO ims_item VALUES ('02-049', 'Cylindrical Hinges 3/4', '0', '0.0', '0.0', '2025-03-07 05:25:15.514510', '2025-03-07 05:25:15.514517', '2', '19');
INSERT INTO ims_item VALUES ('02-050', 'Door Knob', '0', '0.0', '0.0', '2025-03-07 05:25:15.531687', '2025-03-07 05:25:15.531695', '2', '19');
INSERT INTO ims_item VALUES ('02-051', 'Deform Bar - 10mm', '0', '0.0', '0.0', '2025-03-07 05:25:15.550042', '2025-03-07 05:25:15.550050', '2', '19');
INSERT INTO ims_item VALUES ('02-052', 'PVC Door 60 x 210 w/ Hinges', '0', '0.0', '0.0', '2025-03-07 05:25:15.570422', '2025-03-07 05:25:15.570429', '2', '19');
INSERT INTO ims_item VALUES ('02-053', 'Blue Clamp 1/2 - Hardware', '0', '0.0', '0.0', '2025-03-07 05:25:15.588072', '2025-03-07 05:25:15.588079', '2', '19');
INSERT INTO ims_item VALUES ('02-054', 'Solignum- All aroud', '0', '0.0', '0.0', '2025-03-07 05:25:15.605769', '2025-03-07 05:25:15.605779', '2', '12');
INSERT INTO ims_item VALUES ('02-055', 'Liha - 1000 & 100', '0', '0.0', '0.0', '2025-03-07 05:25:15.624497', '2025-03-07 05:25:15.624505', '2', '19');
INSERT INTO ims_item VALUES ('02-056', 'Tansi', '0', '0.0', '0.0', '2025-03-07 05:25:15.642032', '2025-03-07 05:25:15.642039', '2', '20');
INSERT INTO ims_item VALUES ('02-057', 'Drill bit 5/16', '0', '0.0', '0.0', '2025-03-07 05:25:15.659806', '2025-03-07 05:25:15.659815', '2', '19');
INSERT INTO ims_item VALUES ('02-058', 'Chalk stone', '0', '0.0', '0.0', '2025-03-07 05:25:15.677510', '2025-03-07 05:25:15.677517', '2', '19');
INSERT INTO ims_item VALUES ('02-059', 'Epoxy primer', '0', '0.0', '0.0', '2025-03-07 05:25:15.695744', '2025-03-07 05:25:15.695751', '2', '12');
INSERT INTO ims_item VALUES ('02-060', 'Latex Gloss - Paint', '0', '0.0', '0.0', '2025-03-07 05:25:15.713871', '2025-03-07 05:25:15.713881', '2', '12');
INSERT INTO ims_item VALUES ('02-061', 'Sahara- ( water proofing )', '0', '0.0', '0.0', '2025-03-07 05:25:15.732629', '2025-03-07 05:25:15.732637', '2', '19');
INSERT INTO ims_item VALUES ('02-062', 'Singer Oil', '0', '0.0', '0.0', '2025-03-07 05:25:15.750491', '2025-03-07 05:25:15.750502', '2', '19');
INSERT INTO ims_item VALUES ('02-063', 'Varnish', '0', '0.0', '0.0', '2025-03-07 05:25:15.768197', '2025-03-07 05:25:15.768205', '2', '12');
INSERT INTO ims_item VALUES ('02-064', 'Rust Converter', '0', '0.0', '0.0', '2025-03-07 05:25:15.786131', '2025-03-07 05:25:15.786138', '2', '19');
INSERT INTO ims_item VALUES ('02-065', 'WD - 40', '0', '0.0', '0.0', '2025-03-07 05:25:15.802983', '2025-03-07 05:25:15.802990', '2', '19');
INSERT INTO ims_item VALUES ('02-066', 'Tape Measure', '0', '0.0', '0.0', '2025-03-07 05:25:15.822772', '2025-03-07 05:25:15.822779', '2', '19');
INSERT INTO ims_item VALUES ('02-067', 'C. Clamp 3/4', '0', '0.0', '0.0', '2025-03-07 05:25:15.840333', '2025-03-07 05:25:15.840341', '2', '19');
INSERT INTO ims_item VALUES ('02-068', 'C. Clamp 1"', '0', '0.0', '0.0', '2025-03-07 05:25:15.858425', '2025-03-07 05:25:15.858433', '2', '19');
INSERT INTO ims_item VALUES ('02-069', 'Single Switch', '0', '0.0', '0.0', '2025-03-07 05:25:15.876968', '2025-03-07 05:25:15.876975', '2', '19');
INSERT INTO ims_item VALUES ('02-070', 'Receptacle 4 x 4 - omni', '0', '0.0', '0.0', '2025-03-07 05:25:15.895039', '2025-03-07 05:25:15.895048', '2', '19');
INSERT INTO ims_item VALUES ('02-071', 'Junction Box 4 x 4 - pvc', '0', '0.0', '0.0', '2025-03-07 05:25:15.912949', '2025-03-07 05:25:15.912956', '2', '19');
INSERT INTO ims_item VALUES ('02-072', 'Utility Box 2 x 4 - pvc  - ROYU', '0', '0.0', '0.0', '2025-03-07 05:25:15.930619', '2025-03-07 05:25:15.930626', '2', '19');
INSERT INTO ims_item VALUES ('02-073', '1 Gang Switch- Panasonic', '0', '0.0', '0.0', '2025-03-07 05:25:15.950454', '2025-03-07 05:25:15.950466', '2', '21');
INSERT INTO ims_item VALUES ('02-074', '2 Gang Switch- Royu', '0', '0.0', '0.0', '2025-03-07 05:25:15.968195', '2025-03-07 05:25:15.968203', '2', '21');
INSERT INTO ims_item VALUES ('02-075', 'Flat Hose 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:15.986094', '2025-03-07 05:25:15.986102', '2', '20');
INSERT INTO ims_item VALUES ('02-076', '2 Gang Outlet- Panasonic', '0', '0.0', '0.0', '2025-03-07 05:25:16.004445', '2025-03-07 05:25:16.004453', '2', '21');
INSERT INTO ims_item VALUES ('02-077', 'Blind Rivits 5/32 x 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:16.024637', '2025-03-07 05:25:16.024645', '2', '5');
INSERT INTO ims_item VALUES ('02-078', 'Bathroom Bidet-  SUNRISE', '0', '0.0', '0.0', '2025-03-07 05:25:16.043631', '2025-03-07 05:25:16.043640', '2', '21');
INSERT INTO ims_item VALUES ('02-079', 'Concrete nail #2', '0', '0.0', '0.0', '2025-03-07 05:25:16.060878', '2025-03-07 05:25:16.060885', '2', '11');
INSERT INTO ims_item VALUES ('02-080', 'Concrete nail #3', '0', '0.0', '0.0', '2025-03-07 05:25:16.078799', '2025-03-07 05:25:16.078810', '2', '11');
INSERT INTO ims_item VALUES ('02-081', 'Tek screw 1 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:16.097288', '2025-03-07 05:25:16.097296', '2', '19');
INSERT INTO ims_item VALUES ('02-082', 'Hand Riveter', '0', '0.0', '0.0', '2025-03-07 05:25:16.115794', '2025-03-07 05:25:16.115801', '2', '19');
INSERT INTO ims_item VALUES ('02-083', 'Tank Lever Flush', '0', '0.0', '0.0', '2025-03-07 05:25:16.134547', '2025-03-07 05:25:16.134554', '2', '19');
INSERT INTO ims_item VALUES ('02-084', 'Tank Fittings', '0', '0.0', '0.0', '2025-03-07 05:25:16.154543', '2025-03-07 05:25:16.154551', '2', '21');
INSERT INTO ims_item VALUES ('02-085', 'Electrical PVC Pipe 1/2 - (Orange)', '0', '0.0', '0.0', '2025-03-07 05:25:16.173188', '2025-03-07 05:25:16.173196', '2', '19');
INSERT INTO ims_item VALUES ('02-086', 'PVC Pipe 4" ( Orange )', '0', '0.0', '0.0', '2025-03-07 05:25:16.192345', '2025-03-07 05:25:16.192352', '2', '19');
INSERT INTO ims_item VALUES ('02-087', 'Elbow  4" ( Orange )', '0', '0.0', '0.0', '2025-03-07 05:25:16.210960', '2025-03-07 05:25:16.210968', '2', '19');
INSERT INTO ims_item VALUES ('02-088', 'Clean Out Cover 4" pvc', '0', '0.0', '0.0', '2025-03-07 05:25:16.230544', '2025-03-07 05:25:16.230551', '2', '19');
INSERT INTO ims_item VALUES ('02-089', 'Pollituff', '0', '0.0', '0.0', '2025-03-07 05:25:16.249343', '2025-03-07 05:25:16.249351', '2', '12');
INSERT INTO ims_item VALUES ('02-090', 'Hardener Cream', '0', '0.0', '0.0', '2025-03-07 05:25:16.267132', '2025-03-07 05:25:16.267139', '2', '19');
INSERT INTO ims_item VALUES ('02-091', 'Submeter', '0', '0.0', '0.0', '2025-03-07 05:25:16.284592', '2025-03-07 05:25:16.284599', '2', '19');
INSERT INTO ims_item VALUES ('02-092', 'Expansion Bolt 3/5 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:16.302397', '2025-03-07 05:25:16.302404', '2', '19');
INSERT INTO ims_item VALUES ('02-093', 'Hinges 3 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:16.321012', '2025-03-07 05:25:16.321020', '2', '19');
INSERT INTO ims_item VALUES ('02-094', 'Plug Adapter', '0', '0.0', '0.0', '2025-03-07 05:25:16.340311', '2025-03-07 05:25:16.340320', '2', '19');
INSERT INTO ims_item VALUES ('02-095', 'Grinding Disc- For Finishing', '0', '0.0', '0.0', '2025-03-07 05:25:16.362022', '2025-03-07 05:25:16.362030', '2', '19');
INSERT INTO ims_item VALUES ('02-096', 'Spatula', '0', '0.0', '0.0', '2025-03-07 05:25:16.381494', '2025-03-07 05:25:16.381502', '2', '19');
INSERT INTO ims_item VALUES ('02-097', 'Wall Scrapper - (Paleta)', '0', '0.0', '0.0', '2025-03-07 05:25:16.402458', '2025-03-07 05:25:16.402471', '2', '19');
INSERT INTO ims_item VALUES ('02-098', 'Blind Rivits  1/8 x 1/2 - LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:16.421014', '2025-03-07 05:25:16.421021', '2', '5');
INSERT INTO ims_item VALUES ('02-099', 'Gunting ng Yero', '0', '0.0', '0.0', '2025-03-07 05:25:16.438953', '2025-03-07 05:25:16.438960', '2', '19');
INSERT INTO ims_item VALUES ('02-100', 'Paint Remover', '0', '0.0', '0.0', '2025-03-07 05:25:16.455866', '2025-03-07 05:25:16.455873', '2', '19');
INSERT INTO ims_item VALUES ('02-101', 'Rugby', '0', '0.0', '0.0', '2025-03-07 05:25:16.473278', '2025-03-07 05:25:16.473286', '2', '6');
INSERT INTO ims_item VALUES ('02-102', 'Rodela - Bakal', '0', '0.0', '0.0', '2025-03-07 05:25:16.490429', '2025-03-07 05:25:16.490436', '2', '19');
INSERT INTO ims_item VALUES ('02-103', 'Rodela - Kahoy', '0', '0.0', '0.0', '2025-03-07 05:25:16.510054', '2025-03-07 05:25:16.510061', '2', '19');
INSERT INTO ims_item VALUES ('02-104', 'Elasto Seal - water proofing sealant', '0', '0.0', '0.0', '2025-03-07 05:25:16.528031', '2025-03-07 05:25:16.528041', '2', '19');
INSERT INTO ims_item VALUES ('02-105', 'Rope', '0', '0.0', '0.0', '2025-03-07 05:25:16.544262', '2025-03-07 05:25:16.544269', '2', '14');
INSERT INTO ims_item VALUES ('02-106', 'Circuit Breaker - 60A PLUG IN- GE', '0', '0.0', '0.0', '2025-03-07 05:25:16.561014', '2025-03-07 05:25:16.561021', '2', '19');
INSERT INTO ims_item VALUES ('02-107', 'Toks screw', '0', '0.0', '0.0', '2025-03-07 05:25:16.579263', '2025-03-07 05:25:16.579270', '2', '19');
INSERT INTO ims_item VALUES ('02-108', 'Elbow 2" Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.596478', '2025-03-07 05:25:16.596485', '2', '19');
INSERT INTO ims_item VALUES ('02-109', 'PVC 2" Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.614793', '2025-03-07 05:25:16.614801', '2', '19');
INSERT INTO ims_item VALUES ('02-110', 'Square Bar 10mm', '0', '0.0', '0.0', '2025-03-07 05:25:16.632220', '2025-03-07 05:25:16.632230', '2', '19');
INSERT INTO ims_item VALUES ('02-111', 'Sealant', '0', '0.0', '0.0', '2025-03-07 05:25:16.650331', '2025-03-07 05:25:16.650337', '2', '19');
INSERT INTO ims_item VALUES ('02-112', 'Faucet - 6"', '0', '0.0', '0.0', '2025-03-07 05:25:16.667599', '2025-03-07 05:25:16.667606', '2', '19');
INSERT INTO ims_item VALUES ('02-113', 'C. Clamp 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:16.685446', '2025-03-07 05:25:16.685452', '2', '19');
INSERT INTO ims_item VALUES ('02-114', 'Cocolumber 2 x 3 x 12', '0', '0.0', '0.0', '2025-03-07 05:25:16.702120', '2025-03-07 05:25:16.702127', '2', '19');
INSERT INTO ims_item VALUES ('02-115', 'Flat Cord #14', '0', '0.0', '0.0', '2025-03-07 05:25:16.719703', '2025-03-07 05:25:16.719710', '2', '14');
INSERT INTO ims_item VALUES ('02-116', 'Common Nail #3- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:16.737474', '2025-03-07 05:25:16.737482', '2', '11');
INSERT INTO ims_item VALUES ('02-117', 'Common Nail #2- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:16.754263', '2025-03-07 05:25:16.754271', '2', '11');
INSERT INTO ims_item VALUES ('02-118', 'Umbrella Nail', '0', '0.0', '0.0', '2025-03-07 05:25:16.772268', '2025-03-07 05:25:16.772280', '2', '11');
INSERT INTO ims_item VALUES ('02-119', 'PVC Elbow 3/4 - Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.789342', '2025-03-07 05:25:16.789349', '2', '19');
INSERT INTO ims_item VALUES ('02-120', 'PVC Pipe 3/4- Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.807012', '2025-03-07 05:25:16.807019', '2', '19');
INSERT INTO ims_item VALUES ('02-121', 'PVC Pipe 2" Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.823998', '2025-03-07 05:25:16.824006', '2', '19');
INSERT INTO ims_item VALUES ('02-122', 'PVC Pipe 3" Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.841518', '2025-03-07 05:25:16.841525', '2', '19');
INSERT INTO ims_item VALUES ('02-123', 'P- Trap 2" Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.858597', '2025-03-07 05:25:16.858603', '2', '19');
INSERT INTO ims_item VALUES ('02-124', 'Tee 2" Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.876624', '2025-03-07 05:25:16.876631', '2', '19');
INSERT INTO ims_item VALUES ('02-125', 'Elbow 3" Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.892705', '2025-03-07 05:25:16.892712', '2', '19');
INSERT INTO ims_item VALUES ('02-126', 'PVC- Y 3 x 2 -Orange', '0', '0.0', '0.0', '2025-03-07 05:25:16.911032', '2025-03-07 05:25:16.911040', '2', '19');
INSERT INTO ims_item VALUES ('02-127', 'Clean Out Cover 3" pvc', '0', '0.0', '0.0', '2025-03-07 05:25:16.929145', '2025-03-07 05:25:16.929155', '2', '19');
INSERT INTO ims_item VALUES ('02-128', 'Kiln Dry Wood- 1 1/2 x 2 x 12', '0', '0.0', '0.0', '2025-03-07 05:25:16.946824', '2025-03-07 05:25:16.946831', '2', '19');
INSERT INTO ims_item VALUES ('02-129', 'Kiln Dry Wood- 1/2 x 2 x 12', '0', '0.0', '0.0', '2025-03-07 05:25:16.964432', '2025-03-07 05:25:16.964440', '2', '19');
INSERT INTO ims_item VALUES ('02-130', 'Flat Disc', '0', '0.0', '0.0', '2025-03-07 05:25:16.982252', '2025-03-07 05:25:16.982259', '2', '19');
INSERT INTO ims_item VALUES ('02-131', 'Flat Nail 1"', '0', '0.0', '0.0', '2025-03-07 05:25:17.000369', '2025-03-07 05:25:17.000378', '2', '11');
INSERT INTO ims_item VALUES ('02-132', 'Flat Nail 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:17.018167', '2025-03-07 05:25:17.018174', '2', '11');
INSERT INTO ims_item VALUES ('02-133', 'Tile Trim', '0', '0.0', '0.0', '2025-03-07 05:25:17.036731', '2025-03-07 05:25:17.036738', '2', '19');
INSERT INTO ims_item VALUES ('02-134', 'Kitchen Sink', '0', '0.0', '0.0', '2025-03-07 05:25:17.054177', '2025-03-07 05:25:17.054188', '2', '19');
INSERT INTO ims_item VALUES ('02-135', 'PMR Strainer', '0', '0.0', '0.0', '2025-03-07 05:25:17.072133', '2025-03-07 05:25:17.072140', '2', '19');
INSERT INTO ims_item VALUES ('02-136', 'Flex Hose - 1/2 x 16', '0', '0.0', '0.0', '2025-03-07 05:25:17.090809', '2025-03-07 05:25:17.090817', '2', '19');
INSERT INTO ims_item VALUES ('02-137', 'Vulca Seal - BOSTIK', '0', '0.0', '0.0', '2025-03-07 05:25:17.108249', '2025-03-07 05:25:17.108257', '2', '12');
INSERT INTO ims_item VALUES ('02-138', 'Metal Furring 0.5', '0', '0.0', '0.0', '2025-03-07 05:25:17.127993', '2025-03-07 05:25:17.128003', '2', '19');
INSERT INTO ims_item VALUES ('02-139', 'QDE Enamel white', '0', '0.0', '0.0', '2025-03-07 05:25:17.145956', '2025-03-07 05:25:17.145963', '2', '2');
INSERT INTO ims_item VALUES ('02-140', 'Hamba 80 x 210', '0', '0.0', '0.0', '2025-03-07 05:25:17.164834', '2025-03-07 05:25:17.164841', '2', '19');
INSERT INTO ims_item VALUES ('02-141', 'Garden Hose 5/8- EXCEL', '0', '0.0', '0.0', '2025-03-07 05:25:17.182481', '2025-03-07 05:25:17.182489', '2', '14');
INSERT INTO ims_item VALUES ('02-142', 'Hose- connector', '0', '0.0', '0.0', '2025-03-07 05:25:17.199993', '2025-03-07 05:25:17.200001', '2', '18');
INSERT INTO ims_item VALUES ('02-143', 'PVC Pipe 1" -Orange', '0', '0.0', '0.0', '2025-03-07 05:25:17.218376', '2025-03-07 05:25:17.218383', '2', '18');
INSERT INTO ims_item VALUES ('02-144', 'PVC  Elbow 1" -Orange', '0', '0.0', '0.0', '2025-03-07 05:25:17.237255', '2025-03-07 05:25:17.237261', '2', '18');
INSERT INTO ims_item VALUES ('02-145', 'PVC  Male Adaptor 1" -Orange', '0', '0.0', '0.0', '2025-03-07 05:25:17.255134', '2025-03-07 05:25:17.255141', '2', '18');
INSERT INTO ims_item VALUES ('02-146', 'LED Light 15W - OMNI', '0', '0.0', '0.0', '2025-03-07 05:25:17.273268', '2025-03-07 05:25:17.273275', '2', '18');
INSERT INTO ims_item VALUES ('02-147', 'Baby Roller 4"- JUPITER', '0', '0.0', '0.0', '2025-03-07 05:25:17.291683', '2025-03-07 05:25:17.291693', '2', '18');
INSERT INTO ims_item VALUES ('02-148', 'Screw Bit', '0', '0.0', '0.0', '2025-03-07 05:25:17.308887', '2025-03-07 05:25:17.308893', '2', '18');
INSERT INTO ims_item VALUES ('02-149', 'End cap 1/2 PVC', '0', '0.0', '0.0', '2025-03-07 05:25:17.326632', '2025-03-07 05:25:17.326639', '2', '18');
INSERT INTO ims_item VALUES ('02-150', 'Toilet Bowl', '0', '0.0', '0.0', '2025-03-07 05:25:17.344596', '2025-03-07 05:25:17.344602', '2', '18');
INSERT INTO ims_item VALUES ('02-151', 'Cylindrical Hinges 1"', '0', '0.0', '0.0', '2025-03-07 05:25:17.361948', '2025-03-07 05:25:17.361954', '2', '18');
INSERT INTO ims_item VALUES ('02-152', 'Cylindrical Hinges 1/2"', '0', '0.0', '0.0', '2025-03-07 05:25:17.379507', '2025-03-07 05:25:17.379514', '2', '18');
INSERT INTO ims_item VALUES ('02-153', 'Blind Rivet 3/16 x 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:17.398702', '2025-03-07 05:25:17.398709', '2', '5');
INSERT INTO ims_item VALUES ('02-154', 'Universal Padlock -ACE', '0', '0.0', '0.0', '2025-03-07 05:25:17.416454', '2025-03-07 05:25:17.416461', '2', '19');
INSERT INTO ims_item VALUES ('02-155', 'Sand Paper', '0', '0.0', '0.0', '2025-03-07 05:25:17.433871', '2025-03-07 05:25:17.433878', '2', '7');
INSERT INTO ims_item VALUES ('02-156', 'Squala', '0', '0.0', '0.0', '2025-03-07 05:25:17.450996', '2025-03-07 05:25:17.451003', '2', '19');
INSERT INTO ims_item VALUES ('02-157', 'Hose Bibb Faucet', '0', '0.0', '0.0', '2025-03-07 05:25:17.469313', '2025-03-07 05:25:17.469321', '2', '19');
INSERT INTO ims_item VALUES ('02-158', 'Flexi Bond', '0', '0.0', '0.0', '2025-03-07 05:25:17.488976', '2025-03-07 05:25:17.488984', '2', '2');
INSERT INTO ims_item VALUES ('02-159', 'Paint Thinner- PUREE', '0', '0.0', '0.0', '2025-03-07 05:25:17.505702', '2025-03-07 05:25:17.505709', '2', '12');
INSERT INTO ims_item VALUES ('02-160', 'Rubber Tape', '0', '0.0', '0.0', '2025-03-07 05:25:17.524550', '2025-03-07 05:25:17.524556', '2', '19');
INSERT INTO ims_item VALUES ('02-161', 'Paint brush #2- HIPO', '0', '0.0', '0.0', '2025-03-07 05:25:17.542644', '2025-03-07 05:25:17.542652', '2', '19');
INSERT INTO ims_item VALUES ('02-162', 'Drill bit 1/8 - DOORMER', '0', '0.0', '0.0', '2025-03-07 05:25:17.560397', '2025-03-07 05:25:17.560405', '2', '19');
INSERT INTO ims_item VALUES ('02-163', 'Pipe 3/4 x 20 GI schd.40', '0', '0.0', '0.0', '2025-03-07 05:25:17.578253', '2025-03-07 05:25:17.578260', '2', '19');
INSERT INTO ims_item VALUES ('02-164', 'Circuit Breaker - 30 A PLUG IN- GE', '0', '0.0', '0.0', '2025-03-07 05:25:17.595244', '2025-03-07 05:25:17.595250', '2', '19');
INSERT INTO ims_item VALUES ('02-165', 'AC - Outlet', '0', '0.0', '0.0', '2025-03-07 05:25:17.613026', '2025-03-07 05:25:17.613033', '2', '19');
INSERT INTO ims_item VALUES ('02-166', 'Black Screw', '0', '0.0', '0.0', '2025-03-07 05:25:17.630465', '2025-03-07 05:25:17.630472', '2', '19');
INSERT INTO ims_item VALUES ('02-167', 'Insulation Foam', '0', '0.0', '0.0', '2025-03-07 05:25:17.648669', '2025-03-07 05:25:17.648680', '2', '14');
INSERT INTO ims_item VALUES ('02-168', 'Metal Furring 0.6', '0', '0.0', '0.0', '2025-03-07 05:25:17.667318', '2025-03-07 05:25:17.667325', '2', '19');
INSERT INTO ims_item VALUES ('02-169', '3 Gang Switch - Royu', '0', '0.0', '0.0', '2025-03-07 05:25:17.684012', '2025-03-07 05:25:17.684019', '2', '19');
INSERT INTO ims_item VALUES ('02-170', 'Universal Outlet - Royu', '0', '0.0', '0.0', '2025-03-07 05:25:17.701640', '2025-03-07 05:25:17.701648', '2', '19');
INSERT INTO ims_item VALUES ('02-171', '2 Gang- Royu', '0', '0.0', '0.0', '2025-03-07 05:25:17.718884', '2025-03-07 05:25:17.718892', '2', '19');
INSERT INTO ims_item VALUES ('02-172', '3 Gang- Royu', '0', '0.0', '0.0', '2025-03-07 05:25:17.738617', '2025-03-07 05:25:17.738625', '2', '21');
INSERT INTO ims_item VALUES ('02-173', 'National Universal Outlet', '0', '0.0', '0.0', '2025-03-07 05:25:17.756701', '2025-03-07 05:25:17.756709', '2', '19');
INSERT INTO ims_item VALUES ('02-174', 'National Outlet Classic', '0', '0.0', '0.0', '2025-03-07 05:25:17.774421', '2025-03-07 05:25:17.774428', '2', '19');
INSERT INTO ims_item VALUES ('02-175', 'Phenolic Board 3/4', '0', '0.0', '0.0', '2025-03-07 05:25:17.791780', '2025-03-07 05:25:17.791787', '2', '19');
INSERT INTO ims_item VALUES ('02-176', 'Lag Screw 3/1 x 13', '0', '0.0', '0.0', '2025-03-07 05:25:17.809262', '2025-03-07 05:25:17.809269', '2', '19');
INSERT INTO ims_item VALUES ('02-177', 'Sanding Sealer Lacquer', '0', '0.0', '0.0', '2025-03-07 05:25:17.827183', '2025-03-07 05:25:17.827190', '2', '2');
INSERT INTO ims_item VALUES ('02-178', 'Paint Brush #1- HIPO', '0', '0.0', '0.0', '2025-03-07 05:25:17.845248', '2025-03-07 05:25:17.845257', '2', '19');
INSERT INTO ims_item VALUES ('02-179', 'Metal Screw', '0', '0.0', '0.0', '2025-03-07 05:25:17.863096', '2025-03-07 05:25:17.863103', '2', '19');
INSERT INTO ims_item VALUES ('02-180', 'Mini Roller - Refill', '0', '0.0', '0.0', '2025-03-07 05:25:17.881340', '2025-03-07 05:25:17.881347', '2', '19');
INSERT INTO ims_item VALUES ('02-181', 'Electrode Holder- 300amps', '0', '0.0', '0.0', '2025-03-07 05:25:17.898498', '2025-03-07 05:25:17.898505', '2', '19');
INSERT INTO ims_item VALUES ('02-182', 'Sand Paper - #120', '0', '0.0', '0.0', '2025-03-07 05:25:17.925688', '2025-03-07 05:25:17.925698', '2', '19');
INSERT INTO ims_item VALUES ('02-183', 'Steel Brush', '0', '0.0', '0.0', '2025-03-07 05:25:17.949767', '2025-03-07 05:25:17.949777', '2', '19');
INSERT INTO ims_item VALUES ('02-184', 'Concrete Nail #4', '0', '0.0', '0.0', '2025-03-07 05:25:17.973611', '2025-03-07 05:25:17.973620', '2', '11');
INSERT INTO ims_item VALUES ('02-185', 'QDE black- Paint', '0', '0.0', '0.0', '2025-03-07 05:25:17.996095', '2025-03-07 05:25:17.996107', '2', '13');
INSERT INTO ims_item VALUES ('02-186', 'Panel Box - 4 hole 2x2', '0', '0.0', '0.0', '2025-03-07 05:25:18.017148', '2025-03-07 05:25:18.017155', '2', '18');
INSERT INTO ims_item VALUES ('02-187', 'Circuit Breaker - 20 A PLUG IN- GE', '0', '0.0', '0.0', '2025-03-07 05:25:18.037822', '2025-03-07 05:25:18.037830', '2', '18');
INSERT INTO ims_item VALUES ('02-188', 'Drill Bit 5/32', '0', '0.0', '0.0', '2025-03-07 05:25:18.057584', '2025-03-07 05:25:18.057591', '2', '18');
INSERT INTO ims_item VALUES ('02-189', 'Concrete Nail - # 1', '0', '0.0', '0.0', '2025-03-07 05:25:18.077135', '2025-03-07 05:25:18.077142', '2', '11');
INSERT INTO ims_item VALUES ('02-190', 'Mesh Tape / Gasa', '0', '0.0', '0.0', '2025-03-07 05:25:18.095124', '2025-03-07 05:25:18.095131', '2', '20');
INSERT INTO ims_item VALUES ('02-191', 'Adhesive - Cement - ABC', '0', '0.0', '0.0', '2025-03-07 05:25:18.112874', '2025-03-07 05:25:18.112881', '2', '3');
INSERT INTO ims_item VALUES ('02-192', 'QDE - Maple', '0', '0.0', '0.0', '2025-03-07 05:25:18.130346', '2025-03-07 05:25:18.130353', '2', '13');
INSERT INTO ims_item VALUES ('02-193', 'Angle Valve - 1/2 ( 3 way )', '0', '0.0', '0.0', '2025-03-07 05:25:18.148597', '2025-03-07 05:25:18.148605', '2', '19');
INSERT INTO ims_item VALUES ('02-194', 'Bolt and Nut - 10mm x 2 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:18.166837', '2025-03-07 05:25:18.166845', '2', '19');
INSERT INTO ims_item VALUES ('02-195', 'Drill Bit- 1/4 (concrete)', '0', '0.0', '0.0', '2025-03-07 05:25:18.184277', '2025-03-07 05:25:18.184284', '2', '19');
INSERT INTO ims_item VALUES ('02-196', 'Drill Bit- 3/16 (concrete)', '0', '0.0', '0.0', '2025-03-07 05:25:18.201730', '2025-03-07 05:25:18.201738', '2', '19');
INSERT INTO ims_item VALUES ('02-197', 'Screw w/ Tox - 3/16', '0', '0.0', '0.0', '2025-03-07 05:25:18.220121', '2025-03-07 05:25:18.220128', '2', '19');
INSERT INTO ims_item VALUES ('02-198', 'Flexible Hose - 1/2 x 1/2 x 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:18.237777', '2025-03-07 05:25:18.237785', '2', '19');
INSERT INTO ims_item VALUES ('02-199', 'Spring Door', '0', '0.0', '0.0', '2025-03-07 05:25:18.255021', '2025-03-07 05:25:18.255028', '2', '19');
INSERT INTO ims_item VALUES ('02-200', 'Flexible Hose - 1/2 x 1/2 x 1/8', '0', '0.0', '0.0', '2025-03-07 05:25:18.273400', '2025-03-07 05:25:18.273407', '2', '19');
INSERT INTO ims_item VALUES ('02-201', 'Lavatory Bracket', '0', '0.0', '0.0', '2025-03-07 05:25:18.291750', '2025-03-07 05:25:18.291758', '2', '19');
INSERT INTO ims_item VALUES ('02-202', 'Lavatory Fittings', '0', '0.0', '0.0', '2025-03-07 05:25:18.309210', '2025-03-07 05:25:18.309222', '2', '21');
INSERT INTO ims_item VALUES ('02-203', 'Dyna Bolt 5/16', '0', '0.0', '0.0', '2025-03-07 05:25:18.326583', '2025-03-07 05:25:18.326591', '2', '19');
INSERT INTO ims_item VALUES ('02-204', 'Terminal Battery', '0', '0.0', '0.0', '2025-03-07 05:25:18.344109', '2025-03-07 05:25:18.344115', '2', '19');
INSERT INTO ims_item VALUES ('02-205', 'Moulding Strips-  3/4- ATLANTA', '0', '0.0', '0.0', '2025-03-07 05:25:18.361893', '2025-03-07 05:25:18.361900', '2', '19');
INSERT INTO ims_item VALUES ('02-206', 'Atlanta PVC type - 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:18.379504', '2025-03-07 05:25:18.379512', '2', '19');
INSERT INTO ims_item VALUES ('02-207', 'Screw - #1', '0', '0.0', '0.0', '2025-03-07 05:25:18.397155', '2025-03-07 05:25:18.397162', '2', '19');
INSERT INTO ims_item VALUES ('02-208', 'Amco Box Outlet', '0', '0.0', '0.0', '2025-03-07 05:25:18.414034', '2025-03-07 05:25:18.414041', '2', '19');
INSERT INTO ims_item VALUES ('02-209', 'Plug In - 30 Amp', '0', '0.0', '0.0', '2025-03-07 05:25:18.431588', '2025-03-07 05:25:18.431596', '2', '19');
INSERT INTO ims_item VALUES ('02-210', 'Duct Tape', '0', '0.0', '0.0', '2025-03-07 05:25:18.448912', '2025-03-07 05:25:18.448919', '2', '19');
INSERT INTO ims_item VALUES ('02-211', 'Cutter Blade - hardware', '0', '0.0', '0.0', '2025-03-07 05:25:18.466269', '2025-03-07 05:25:18.466276', '2', '21');
INSERT INTO ims_item VALUES ('02-212', 'Paint Tray', '0', '0.0', '0.0', '2025-03-07 05:25:18.483264', '2025-03-07 05:25:18.483271', '2', '19');
INSERT INTO ims_item VALUES ('02-213', 'Half moon Wood', '0', '0.0', '0.0', '2025-03-07 05:25:18.501593', '2025-03-07 05:25:18.501601', '2', '19');
INSERT INTO ims_item VALUES ('02-214', 'Junction Box 4 x 2 - pvc - OMNI', '0', '0.0', '0.0', '2025-03-07 05:25:18.519466', '2025-03-07 05:25:18.519476', '2', '19');
INSERT INTO ims_item VALUES ('02-215', 'Pinlight Fixture Alum- AKARI', '0', '0.0', '0.0', '2025-03-07 05:25:18.538303', '2025-03-07 05:25:18.538310', '2', '19');
INSERT INTO ims_item VALUES ('02-216', 'LED Light- 9w -FIREFLY', '0', '0.0', '0.0', '2025-03-07 05:25:18.556550', '2025-03-07 05:25:18.556557', '2', '19');
INSERT INTO ims_item VALUES ('02-217', 'LED Ceiling Lamp Surface Type- 18w - OMNI', '0', '0.0', '0.0', '2025-03-07 05:25:18.574109', '2025-03-07 05:25:18.574149', '2', '19');
INSERT INTO ims_item VALUES ('02-218', '2 Gang Switch- PANASONIC', '0', '0.0', '0.0', '2025-03-07 05:25:18.593035', '2025-03-07 05:25:18.593042', '2', '19');
INSERT INTO ims_item VALUES ('02-219', '1 Gang 3 way Switch- PANASONIC', '0', '0.0', '0.0', '2025-03-07 05:25:18.610919', '2025-03-07 05:25:18.610926', '2', '19');
INSERT INTO ims_item VALUES ('02-220', '3 Gang Switch- PANASONIC', '0', '0.0', '0.0', '2025-03-07 05:25:18.628245', '2025-03-07 05:25:18.628252', '2', '19');
INSERT INTO ims_item VALUES ('02-221', 'Faucet Stainless - WATERGATE', '0', '0.0', '0.0', '2025-03-07 05:25:18.647660', '2025-03-07 05:25:18.647667', '2', '19');
INSERT INTO ims_item VALUES ('02-222', 'Faucet Brass - Gold -  WATERGATE', '0', '0.0', '0.0', '2025-03-07 05:25:18.665811', '2025-03-07 05:25:18.665819', '2', '19');
INSERT INTO ims_item VALUES ('02-223', 'Junction Box Cover - OMNI', '0', '0.0', '0.0', '2025-03-07 05:25:18.685190', '2025-03-07 05:25:18.685197', '2', '19');
INSERT INTO ims_item VALUES ('02-224', 'Hinges 35 x 35 x 2- GATEMAN', '0', '0.0', '0.0', '2025-03-07 05:25:18.702663', '2025-03-07 05:25:18.702671', '2', '19');
INSERT INTO ims_item VALUES ('02-225', 'Circuit breaker 60A bolt-On - GE', '0', '0.0', '0.0', '2025-03-07 05:25:18.719893', '2025-03-07 05:25:18.719900', '2', '19');
INSERT INTO ims_item VALUES ('02-226', 'Faucet hose bib white PVC - DOWEL', '0', '0.0', '0.0', '2025-03-07 05:25:18.737850', '2025-03-07 05:25:18.737858', '2', '19');
INSERT INTO ims_item VALUES ('02-227', 'Hose Clamp 5/8 -', '0', '0.0', '0.0', '2025-03-07 05:25:18.755500', '2025-03-07 05:25:18.755507', '2', '19');
INSERT INTO ims_item VALUES ('02-228', 'Angle Bar 5.0mm x 1 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:18.772812', '2025-03-07 05:25:18.772821', '2', '19');
INSERT INTO ims_item VALUES ('02-229', 'TILE 60 X 60 AK 6882', '0', '0.0', '0.0', '2025-03-07 05:25:18.790428', '2025-03-07 05:25:18.790436', '2', '19');
INSERT INTO ims_item VALUES ('02-230', 'TILE 60 X 60 AK 6889', '0', '0.0', '0.0', '2025-03-07 05:25:18.807668', '2025-03-07 05:25:18.807675', '2', '19');
INSERT INTO ims_item VALUES ('02-231', 'ALUM. Door Brown', '0', '0.0', '0.0', '2025-03-07 05:25:18.824929', '2025-03-07 05:25:18.824939', '2', '19');
INSERT INTO ims_item VALUES ('02-232', 'MJ Water Closet', '0', '0.0', '0.0', '2025-03-07 05:25:18.842375', '2025-03-07 05:25:18.842383', '2', '19');
INSERT INTO ims_item VALUES ('02-233', 'Grout White', '0', '0.0', '0.0', '2025-03-07 05:25:18.859605', '2025-03-07 05:25:18.859612', '2', '3');
INSERT INTO ims_item VALUES ('02-234', 'TILE 60 x 60 FC 6013', '0', '0.0', '0.0', '2025-03-07 05:25:18.876946', '2025-03-07 05:25:18.876954', '2', '19');
INSERT INTO ims_item VALUES ('02-235', 'Rib type 05.mm x 3.66m', '0', '0.0', '0.0', '2025-03-07 05:25:18.893907', '2025-03-07 05:25:18.893914', '2', '19');
INSERT INTO ims_item VALUES ('02-236', 'Rib type 05.mm x 3.05m', '0', '0.0', '0.0', '2025-03-07 05:25:18.912009', '2025-03-07 05:25:18.912016', '2', '19');
INSERT INTO ims_item VALUES ('02-237', 'Rib type 05.mm x 6.10m', '0', '0.0', '0.0', '2025-03-07 05:25:18.931074', '2025-03-07 05:25:18.931080', '2', '19');
INSERT INTO ims_item VALUES ('02-238', 'Tek screw 12 x 55 steel', '0', '0.0', '0.0', '2025-03-07 05:25:18.949667', '2025-03-07 05:25:18.949678', '2', '19');
INSERT INTO ims_item VALUES ('02-239', 'Panel Door 80 x 200  jamb 2 x 5 kd w/ holes', '0', '0.0', '0.0', '2025-03-07 05:25:18.967485', '2025-03-07 05:25:18.967492', '2', '21');
INSERT INTO ims_item VALUES ('02-240', 'Ply Wood  ORDINARY 1/2- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:18.985234', '2025-03-07 05:25:18.985244', '2', '19');
INSERT INTO ims_item VALUES ('02-241', 'Cocolumber 2 x 2 x 10FT- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:19.004025', '2025-03-07 05:25:19.004032', '2', '19');
INSERT INTO ims_item VALUES ('02-242', 'G.I. Wire #16', '0', '0.0', '0.0', '2025-03-07 05:25:19.021822', '2025-03-07 05:25:19.021829', '2', '11');
INSERT INTO ims_item VALUES ('02-243', 'Flat latex White - BOYSEN 30f - 100m', '0', '0.0', '0.0', '2025-03-07 05:25:19.040789', '2025-03-07 05:25:19.040799', '2', '17');
INSERT INTO ims_item VALUES ('02-244', 'Flat latex White -MENNISOTA 30f - 100m', '0', '0.0', '0.0', '2025-03-07 05:25:19.058737', '2025-03-07 05:25:19.058743', '2', '17');
INSERT INTO ims_item VALUES ('02-245', 'Flat latex White - COAT SAVER (solo88)', '0', '0.0', '0.0', '2025-03-07 05:25:19.076361', '2025-03-07 05:25:19.076371', '2', '17');
INSERT INTO ims_item VALUES ('02-246', 'Latex Gloss White- COAT SAVER (solo99)', '0', '0.0', '0.0', '2025-03-07 05:25:19.093277', '2025-03-07 05:25:19.093284', '2', '17');
INSERT INTO ims_item VALUES ('02-247', 'Roofing Paint Blue- RAIN OR SHINE', '0', '0.0', '0.0', '2025-03-07 05:25:19.110206', '2025-03-07 05:25:19.110214', '2', '17');
INSERT INTO ims_item VALUES ('02-248', 'Acry Color Raw Sienna -DESTINY', '0', '0.0', '0.0', '2025-03-07 05:25:19.128127', '2025-03-07 05:25:19.128134', '2', '8');
INSERT INTO ims_item VALUES ('02-249', 'Ting Ting Color Thalo Blue #16- DESTINY', '0', '0.0', '0.0', '2025-03-07 05:25:19.146518', '2025-03-07 05:25:19.146526', '2', '8');
INSERT INTO ims_item VALUES ('02-250', 'Ting Ting Color Thalo Blue - BOYSEN (B2306)', '0', '0.0', '0.0', '2025-03-07 05:25:19.163758', '2025-03-07 05:25:19.163765', '2', '8');
INSERT INTO ims_item VALUES ('02-251', 'Pylox Spray Paint Sky Blue', '0', '0.0', '0.0', '2025-03-07 05:25:19.181889', '2025-03-07 05:25:19.181896', '2', '8');
INSERT INTO ims_item VALUES ('02-252', 'Pylox Spray Paint Silver', '0', '0.0', '0.0', '2025-03-07 05:25:19.200106', '2025-03-07 05:25:19.200114', '2', '8');
INSERT INTO ims_item VALUES ('02-253', 'Spray Paint Pearl White- SAMURAI', '0', '0.0', '0.0', '2025-03-07 05:25:19.218738', '2025-03-07 05:25:19.218745', '2', '8');
INSERT INTO ims_item VALUES ('02-254', 'Spray Paint Gloss Black- BOSNY', '0', '0.0', '0.0', '2025-03-07 05:25:19.237387', '2025-03-07 05:25:19.237393', '2', '2');
INSERT INTO ims_item VALUES ('02-255', 'Spray Paint Light Sky Blue- NIPPON', '0', '0.0', '0.0', '2025-03-07 05:25:19.254668', '2025-03-07 05:25:19.254674', '2', '2');
INSERT INTO ims_item VALUES ('02-256', 'Laquer Thinner- PUREE 3Ltr', '0', '0.0', '0.0', '2025-03-07 05:25:19.272600', '2025-03-07 05:25:19.272607', '2', '2');
INSERT INTO ims_item VALUES ('02-257', 'Paint Thinner- LESCO 3Ltr', '0', '0.0', '0.0', '2025-03-07 05:25:19.292838', '2025-03-07 05:25:19.292848', '2', '2');
INSERT INTO ims_item VALUES ('02-258', 'QDE - Yellow - SALAMAT BRO', '0', '0.0', '0.0', '2025-03-07 05:25:19.313284', '2025-03-07 05:25:19.313292', '2', '2');
INSERT INTO ims_item VALUES ('02-259', 'QDE - Yellow - TKO', '0', '0.0', '0.0', '2025-03-07 05:25:19.330671', '2025-03-07 05:25:19.330677', '2', '2');
INSERT INTO ims_item VALUES ('02-260', 'Prolux Glazing Putty White- DAVIES', '0', '0.0', '0.0', '2025-03-07 05:25:19.348541', '2025-03-07 05:25:19.348548', '2', '2');
INSERT INTO ims_item VALUES ('02-261', 'Butterfly Paint Brush - 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:19.366081', '2025-03-07 05:25:19.366088', '2', '19');
INSERT INTO ims_item VALUES ('02-262', 'Fan Club Paint Brush - 1"', '0', '0.0', '0.0', '2025-03-07 05:25:19.383946', '2025-03-07 05:25:19.383957', '2', '19');
INSERT INTO ims_item VALUES ('02-263', 'Fan Club Paint Brush - 2"', '0', '0.0', '0.0', '2025-03-07 05:25:19.402813', '2025-03-07 05:25:19.402821', '2', '19');
INSERT INTO ims_item VALUES ('02-264', 'Butterfly Paint Brush - 3"', '0', '0.0', '0.0', '2025-03-07 05:25:19.420827', '2025-03-07 05:25:19.420834', '2', '19');
INSERT INTO ims_item VALUES ('02-265', 'Butterfly Paint Brush - 4"', '0', '0.0', '0.0', '2025-03-07 05:25:19.440949', '2025-03-07 05:25:19.440957', '2', '19');
INSERT INTO ims_item VALUES ('02-266', 'Acrylon Paint Roller - 7"', '0', '0.0', '0.0', '2025-03-07 05:25:19.460157', '2025-03-07 05:25:19.460164', '2', '19');
INSERT INTO ims_item VALUES ('02-267', 'QDE- Black -DOMINO', '0', '0.0', '0.0', '2025-03-07 05:25:19.479757', '2025-03-07 05:25:19.479764', '2', '2');
INSERT INTO ims_item VALUES ('02-268', 'GreenField Floodlight LED 50w', '0', '0.0', '0.0', '2025-03-07 05:25:19.497821', '2025-03-07 05:25:19.497828', '2', '19');
INSERT INTO ims_item VALUES ('02-269', 'Flat White 16Ltrs. SINCLAIR', '0', '0.0', '0.0', '2025-03-07 05:25:19.516689', '2025-03-07 05:25:19.516697', '2', '17');
INSERT INTO ims_item VALUES ('02-270', 'Pylox Spray Paint Heat Black', '0', '0.0', '0.0', '2025-03-07 05:25:19.534774', '2025-03-07 05:25:19.534782', '2', '8');
INSERT INTO ims_item VALUES ('02-271', 'Build Rite Metal Primer Red Oxide -3ltr', '0', '0.0', '0.0', '2025-03-07 05:25:19.552791', '2025-03-07 05:25:19.552798', '2', '2');
INSERT INTO ims_item VALUES ('02-272', 'Epoxy Reducer- PUREE', '0', '0.0', '0.0', '2025-03-07 05:25:19.570664', '2025-03-07 05:25:19.570672', '2', '2');
INSERT INTO ims_item VALUES ('02-273', 'Laquer Flow- PUREE', '0', '0.0', '0.0', '2025-03-07 05:25:19.588453', '2025-03-07 05:25:19.588461', '2', '2');
INSERT INTO ims_item VALUES ('02-274', 'Permacoat Gloss White B710- BOYSEN', '0', '0.0', '0.0', '2025-03-07 05:25:19.607209', '2025-03-07 05:25:19.607216', '2', '17');
INSERT INTO ims_item VALUES ('02-275', 'Fast Dry Enamel White NS950- NATION', '0', '0.0', '0.0', '2025-03-07 05:25:19.624682', '2025-03-07 05:25:19.624690', '2', '2');
INSERT INTO ims_item VALUES ('02-276', 'Exhaust Fan- OMNI', '0', '0.0', '0.0', '2025-03-07 05:25:19.644219', '2025-03-07 05:25:19.644225', '2', '19');
INSERT INTO ims_item VALUES ('02-277', 'Yellow -RAIN OR SHINE', '0', '0.0', '0.0', '2025-03-07 05:25:19.662692', '2025-03-07 05:25:19.662699', '2', '2');
INSERT INTO ims_item VALUES ('02-278', 'Royal Blue- RAIN OR SHINE', '0', '0.0', '0.0', '2025-03-07 05:25:19.681814', '2025-03-07 05:25:19.681822', '2', '2');
INSERT INTO ims_item VALUES ('02-279', 'Door Closer- Lotus Tubular', '0', '0.0', '0.0', '2025-03-07 05:25:19.700537', '2025-03-07 05:25:19.700546', '2', '19');
INSERT INTO ims_item VALUES ('02-280', 'QDE- White -BOYSEN', '0', '0.0', '0.0', '2025-03-07 05:25:19.719969', '2025-03-07 05:25:19.719979', '2', '2');
INSERT INTO ims_item VALUES ('02-281', 'PANEL BOARD 6 HOLES PLUG IN- AMERICA', '0', '0.0', '0.0', '2025-03-07 05:25:19.737962', '2025-03-07 05:25:19.737969', '2', '18');
INSERT INTO ims_item VALUES ('02-282', 'Flat Gloss- BOYSEN', '0', '0.0', '0.0', '2025-03-07 05:25:19.756778', '2025-03-07 05:25:19.756786', '2', '17');
INSERT INTO ims_item VALUES ('02-283', 'QDE WHITE- BOYSEN (pail)', '0', '0.0', '0.0', '2025-03-07 05:25:19.775251', '2025-03-07 05:25:19.775258', '2', '17');
INSERT INTO ims_item VALUES ('02-284', 'Ting ting Color Thalo Blue- BOYSEN', '0', '0.0', '0.0', '2025-03-07 05:25:19.793736', '2025-03-07 05:25:19.793743', '2', '12');
INSERT INTO ims_item VALUES ('02-285', 'Guilder Epoxy primer Gray- BOYSEN', '0', '0.0', '0.0', '2025-03-07 05:25:19.811196', '2025-03-07 05:25:19.811204', '2', '2');
INSERT INTO ims_item VALUES ('02-286', 'Acry Color Raw Sienna -BOYSEN', '0', '0.0', '0.0', '2025-03-07 05:25:19.829644', '2025-03-07 05:25:19.829651', '2', '8');
INSERT INTO ims_item VALUES ('02-287', 'Acry Color Thalo Blue- BOYSEN', '0', '0.0', '0.0', '2025-03-07 05:25:19.847330', '2025-03-07 05:25:19.847338', '2', '8');
INSERT INTO ims_item VALUES ('02-288', 'Roller Brush w/h 2b -ACRYLON', '0', '0.0', '0.0', '2025-03-07 05:25:19.865958', '2025-03-07 05:25:19.865965', '2', '19');
INSERT INTO ims_item VALUES ('02-289', 'Baby Roller w/o- OMEGA', '0', '0.0', '0.0', '2025-03-07 05:25:19.884591', '2025-03-07 05:25:19.884599', '2', '19');
INSERT INTO ims_item VALUES ('02-290', 'Zimcoat Skimcoat', '0', '0.0', '0.0', '2025-03-07 05:25:19.902207', '2025-03-07 05:25:19.902214', '2', '3');
INSERT INTO ims_item VALUES ('02-291', 'DIB Cable Tie 100pcs 7 in BLACK', '0', '0.0', '0.0', '2025-03-07 05:25:19.920306', '2025-03-07 05:25:19.920313', '2', '16');
INSERT INTO ims_item VALUES ('02-292', 'Deform Bar - 16mm', '0', '0.0', '0.0', '2025-03-07 05:25:19.939342', '2025-03-07 05:25:19.939373', '2', '19');
INSERT INTO ims_item VALUES ('02-293', '1/4 Thick Plastic Acrylic 4 x 8', '0', '0.0', '0.0', '2025-03-07 05:25:19.957130', '2025-03-07 05:25:19.957141', '2', '19');
INSERT INTO ims_item VALUES ('02-294', 'Anzahl Anti Corrosion', '0', '0.0', '0.0', '2025-03-07 05:25:19.976817', '2025-03-07 05:25:19.976824', '2', '12');
INSERT INTO ims_item VALUES ('02-295', 'Anzahl Surfacer Primer', '0', '0.0', '0.0', '2025-03-07 05:25:19.994766', '2025-03-07 05:25:19.994774', '2', '12');
INSERT INTO ims_item VALUES ('02-296', 'Anzahl White w/ Catalest', '0', '0.0', '0.0', '2025-03-07 05:25:20.012672', '2025-03-07 05:25:20.012680', '2', '2');
INSERT INTO ims_item VALUES ('02-297', 'Urethane Thinner', '0', '0.0', '0.0', '2025-03-07 05:25:20.031358', '2025-03-07 05:25:20.031365', '2', '2');
INSERT INTO ims_item VALUES ('02-298', 'Body Filler W/ Hardener', '0', '0.0', '0.0', '2025-03-07 05:25:20.050060', '2025-03-07 05:25:20.050066', '2', '2');
INSERT INTO ims_item VALUES ('02-299', 'Sand Paper #100', '0', '0.0', '0.0', '2025-03-07 05:25:20.068386', '2025-03-07 05:25:20.068394', '2', '19');
INSERT INTO ims_item VALUES ('02-300', 'Sand Paper 120" 400" 1200', '0', '0.0', '0.0', '2025-03-07 05:25:20.085857', '2025-03-07 05:25:20.085864', '2', '19');
INSERT INTO ims_item VALUES ('02-301', 'Tiles 60 x 60 fc 6013', '0', '0.0', '0.0', '2025-03-07 05:25:20.103554', '2025-03-07 05:25:20.103561', '2', '19');
INSERT INTO ims_item VALUES ('02-302', 'Tiles 60 x 60 fc 6889', '0', '0.0', '0.0', '2025-03-07 05:25:20.121727', '2025-03-07 05:25:20.121734', '2', '19');
INSERT INTO ims_item VALUES ('02-303', 'Tiles 60 x 60 ak 6882', '0', '0.0', '0.0', '2025-03-07 05:25:20.140153', '2025-03-07 05:25:20.140160', '2', '19');
INSERT INTO ims_item VALUES ('02-304', 'Tiles 60 x 60 ak 6888', '0', '0.0', '0.0', '2025-03-07 05:25:20.157846', '2025-03-07 05:25:20.157856', '2', '19');
INSERT INTO ims_item VALUES ('02-305', 'MJ Water Closet bowl', '0', '0.0', '0.0', '2025-03-07 05:25:20.176524', '2025-03-07 05:25:20.176531', '2', '19');
INSERT INTO ims_item VALUES ('02-306', 'Cable Tie 6x300', '0', '0.0', '0.0', '2025-03-07 05:25:20.194885', '2025-03-07 05:25:20.194892', '2', '16');
INSERT INTO ims_item VALUES ('02-307', 'QDE WHITE- TKO', '0', '0.0', '0.0', '2025-03-07 05:25:20.213088', '2025-03-07 05:25:20.213094', '2', '2');
INSERT INTO ims_item VALUES ('02-308', 'Junction Box- SHUTA', '0', '0.0', '0.0', '2025-03-07 05:25:20.232475', '2025-03-07 05:25:20.232482', '2', '19');
INSERT INTO ims_item VALUES ('02-309', '1 Gang Switch- ROYU', '0', '0.0', '0.0', '2025-03-07 05:25:20.250476', '2025-03-07 05:25:20.250487', '2', '19');
INSERT INTO ims_item VALUES ('02-310', '2 Gang Outlet Universal- FOCUS', '0', '0.0', '0.0', '2025-03-07 05:25:20.268906', '2025-03-07 05:25:20.268913', '2', '19');
INSERT INTO ims_item VALUES ('02-311', 'PVC Pipe Orange 1/2- BIO', '0', '0.0', '0.0', '2025-03-07 05:25:20.287226', '2025-03-07 05:25:20.287233', '2', '19');
INSERT INTO ims_item VALUES ('02-312', 'THHN WIRE 12"- MAX', '0', '0.0', '0.0', '2025-03-07 05:25:20.307276', '2025-03-07 05:25:20.307286', '2', '19');
INSERT INTO ims_item VALUES ('02-313', 'Angle Valve 1/2" 2 way - HAWK', '0', '0.0', '0.0', '2025-03-07 05:25:20.333620', '2025-03-07 05:25:20.333630', '2', '19');
INSERT INTO ims_item VALUES ('02-314', 'Faucet 2 way -HAWK', '0', '0.0', '0.0', '2025-03-07 05:25:20.359782', '2025-03-07 05:25:20.359791', '2', '19');
INSERT INTO ims_item VALUES ('02-315', 'Supply Hose 1/2 x 1/2 - ITALY', '0', '0.0', '0.0', '2025-03-07 05:25:20.382549', '2025-03-07 05:25:20.382556', '2', '19');
INSERT INTO ims_item VALUES ('02-316', 'Floor Drain 4 x 4- CHICAGO', '0', '0.0', '0.0', '2025-03-07 05:25:20.406099', '2025-03-07 05:25:20.406106', '2', '19');
INSERT INTO ims_item VALUES ('02-317', 'Faucet s/s - HAWK', '0', '0.0', '0.0', '2025-03-07 05:25:20.424739', '2025-03-07 05:25:20.424746', '2', '19');
INSERT INTO ims_item VALUES ('02-318', 'Cyclone Wire', '0', '0.0', '0.0', '2025-03-07 05:25:20.442543', '2025-03-07 05:25:20.442550', '2', '19');
INSERT INTO ims_item VALUES ('02-319', 'Long Span Rib type 0.50m x 1220m Blue', '0', '0.0', '0.0', '2025-03-07 05:25:20.460845', '2025-03-07 05:25:20.460853', '2', '19');
INSERT INTO ims_item VALUES ('02-320', 'C- Purlins 2 x 3 1.0', '0', '0.0', '0.0', '2025-03-07 05:25:20.480476', '2025-03-07 05:25:20.480483', '2', '19');
INSERT INTO ims_item VALUES ('02-321', 'Deform Bar 12mm', '0', '0.0', '0.0', '2025-03-07 05:25:20.498905', '2025-03-07 05:25:20.498913', '2', '19');
INSERT INTO ims_item VALUES ('02-322', 'Steel Matting 4 x 8 #8', '0', '0.0', '0.0', '2025-03-07 05:25:20.517960', '2025-03-07 05:25:20.517968', '2', '19');
INSERT INTO ims_item VALUES ('02-323', 'Tubular 2 x 3 1.4', '0', '0.0', '0.0', '2025-03-07 05:25:20.537451', '2025-03-07 05:25:20.537459', '2', '19');
INSERT INTO ims_item VALUES ('03-001', 'Air Release Valve 1" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:20.555212', '2025-03-07 05:25:20.555222', '3', '19');
INSERT INTO ims_item VALUES ('03-002', 'Air Release Valve 1" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:20.573376', '2025-03-07 05:25:20.573383', '3', '19');
INSERT INTO ims_item VALUES ('03-003', 'Adaptor 2" CI', '0', '0.0', '0.0', '2025-03-07 05:25:20.591934', '2025-03-07 05:25:20.591941', '3', '19');
INSERT INTO ims_item VALUES ('03-004', 'Adaptor 3" CI', '0', '0.0', '0.0', '2025-03-07 05:25:20.608874', '2025-03-07 05:25:20.608881', '3', '19');
INSERT INTO ims_item VALUES ('03-005', 'Adaptor 4" CI', '0', '0.0', '0.0', '2025-03-07 05:25:20.628902', '2025-03-07 05:25:20.628909', '3', '19');
INSERT INTO ims_item VALUES ('03-006', 'Adaptor 6" CI', '0', '0.0', '0.0', '2025-03-07 05:25:20.647091', '2025-03-07 05:25:20.647104', '3', '19');
INSERT INTO ims_item VALUES ('03-007', 'Ball Valve 1"', '0', '0.0', '0.0', '2025-03-07 05:25:20.664507', '2025-03-07 05:25:20.664514', '3', '19');
INSERT INTO ims_item VALUES ('03-008', 'Ball Valve 1/2 Lockwing - WIN', '0', '0.0', '0.0', '2025-03-07 05:25:20.684136', '2025-03-07 05:25:20.684149', '3', '19');
INSERT INTO ims_item VALUES ('03-009', 'Ball Valve 1/2 Magnetic', '0', '0.0', '0.0', '2025-03-07 05:25:20.703032', '2025-03-07 05:25:20.703039', '3', '19');
INSERT INTO ims_item VALUES ('03-010', 'Ball Valve 2"', '0', '0.0', '0.0', '2025-03-07 05:25:20.720876', '2025-03-07 05:25:20.720883', '3', '19');
INSERT INTO ims_item VALUES ('03-011', 'Ball Valve 3/4" Lockwing', '0', '0.0', '0.0', '2025-03-07 05:25:20.741452', '2025-03-07 05:25:20.741459', '3', '19');
INSERT INTO ims_item VALUES ('03-012', 'Bell Reducer 3 x 2 B.I', '0', '0.0', '0.0', '2025-03-07 05:25:20.760604', '2025-03-07 05:25:20.760611', '3', '19');
INSERT INTO ims_item VALUES ('03-013', 'Bell Reducer 1 1/4 x 1" GI', '0', '0.0', '0.0', '2025-03-07 05:25:20.779662', '2025-03-07 05:25:20.779669', '3', '19');
INSERT INTO ims_item VALUES ('03-014', 'Bell Reducer 1" x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:20.797192', '2025-03-07 05:25:20.797200', '3', '19');
INSERT INTO ims_item VALUES ('03-015', 'Bell Reducer 1/2 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:20.815894', '2025-03-07 05:25:20.815902', '3', '19');
INSERT INTO ims_item VALUES ('03-016', 'Bell Reducer 2 x 1 GI', '0', '0.0', '0.0', '2025-03-07 05:25:20.833961', '2025-03-07 05:25:20.833967', '3', '19');
INSERT INTO ims_item VALUES ('03-017', 'Bell Reducer 3 x 2 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:20.850811', '2025-03-07 05:25:20.850818', '3', '19');
INSERT INTO ims_item VALUES ('03-018', 'Bell Reducer 4 x 3 BI', '0', '0.0', '0.0', '2025-03-07 05:25:20.868690', '2025-03-07 05:25:20.868696', '3', '19');
INSERT INTO ims_item VALUES ('03-019', 'Bell Reducer 6 x 4 BI', '0', '0.0', '0.0', '2025-03-07 05:25:20.886839', '2025-03-07 05:25:20.886847', '3', '19');
INSERT INTO ims_item VALUES ('03-020', 'Bell Reducer 6 x 4 GI - Mechanical', '0', '0.0', '0.0', '2025-03-07 05:25:20.905358', '2025-03-07 05:25:20.905365', '3', '19');
INSERT INTO ims_item VALUES ('03-021', 'Bushing 3/4 x 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:20.923044', '2025-03-07 05:25:20.923054', '3', '19');
INSERT INTO ims_item VALUES ('03-022', 'Bushing 1 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:20.941437', '2025-03-07 05:25:20.941446', '3', '19');
INSERT INTO ims_item VALUES ('03-023', 'Bushing 2 x 1 GI', '0', '0.0', '0.0', '2025-03-07 05:25:20.959293', '2025-03-07 05:25:20.959300', '3', '19');
INSERT INTO ims_item VALUES ('03-024', 'Bushing 2 x 2 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:20.978124', '2025-03-07 05:25:20.978131', '3', '19');
INSERT INTO ims_item VALUES ('03-025', 'Bushing 4 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:20.998712', '2025-03-07 05:25:20.998719', '3', '19');
INSERT INTO ims_item VALUES ('03-026', 'Butterfly Valve 4"', '0', '0.0', '0.0', '2025-03-07 05:25:21.016779', '2025-03-07 05:25:21.016786', '3', '19');
INSERT INTO ims_item VALUES ('03-027', 'Butterfly Valve 6"', '0', '0.0', '0.0', '2025-03-07 05:25:21.036447', '2025-03-07 05:25:21.036454', '3', '19');
INSERT INTO ims_item VALUES ('03-028', 'Checkvalve 1" - Brass', '0', '0.0', '0.0', '2025-03-07 05:25:21.053294', '2025-03-07 05:25:21.053301', '3', '19');
INSERT INTO ims_item VALUES ('03-029', 'Checkvalve 1/2" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:21.071929', '2025-03-07 05:25:21.071937', '3', '19');
INSERT INTO ims_item VALUES ('03-030', 'Checkvalve 1 1/2" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:21.090173', '2025-03-07 05:25:21.090180', '3', '19');
INSERT INTO ims_item VALUES ('03-031', 'Checkvalve 2" - Brass', '0', '0.0', '0.0', '2025-03-07 05:25:21.109604', '2025-03-07 05:25:21.109612', '3', '19');
INSERT INTO ims_item VALUES ('03-032', 'Checkvalve 3" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:21.127817', '2025-03-07 05:25:21.127824', '3', '19');
INSERT INTO ims_item VALUES ('03-033', 'Checkvalve 4"', '0', '0.0', '0.0', '2025-03-07 05:25:21.145975', '2025-03-07 05:25:21.145982', '3', '19');
INSERT INTO ims_item VALUES ('03-034', 'Checkvalve 6"', '0', '0.0', '0.0', '2025-03-07 05:25:21.164712', '2025-03-07 05:25:21.164719', '3', '19');
INSERT INTO ims_item VALUES ('03-035', 'Checkvalve 6" CI', '0', '0.0', '0.0', '2025-03-07 05:25:21.184100', '2025-03-07 05:25:21.184109', '3', '19');
INSERT INTO ims_item VALUES ('03-036', 'Coupling 1" GI (S40)', '0', '0.0', '0.0', '2025-03-07 05:25:21.203111', '2025-03-07 05:25:21.203119', '3', '19');
INSERT INTO ims_item VALUES ('03-037', 'Coupling 1" GI (S80)', '0', '0.0', '0.0', '2025-03-07 05:25:21.221528', '2025-03-07 05:25:21.221536', '3', '19');
INSERT INTO ims_item VALUES ('03-038', 'Coupling 1" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:21.240315', '2025-03-07 05:25:21.240322', '3', '19');
INSERT INTO ims_item VALUES ('03-039', 'Coupling 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.260063', '2025-03-07 05:25:21.260070', '3', '19');
INSERT INTO ims_item VALUES ('03-040', 'Coupling 1/2 PVC', '0', '0.0', '0.0', '2025-03-07 05:25:21.279237', '2025-03-07 05:25:21.279245', '3', '19');
INSERT INTO ims_item VALUES ('03-041', 'Coupling 1/2 PVC w/ Thread', '0', '0.0', '0.0', '2025-03-07 05:25:21.297376', '2025-03-07 05:25:21.297383', '3', '19');
INSERT INTO ims_item VALUES ('03-042', 'Coupling 1/2 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:21.316312', '2025-03-07 05:25:21.316319', '3', '19');
INSERT INTO ims_item VALUES ('03-043', 'Coupling 2" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.335706', '2025-03-07 05:25:21.335713', '3', '19');
INSERT INTO ims_item VALUES ('03-044', 'Coupling 2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:21.353779', '2025-03-07 05:25:21.353788', '3', '19');
INSERT INTO ims_item VALUES ('03-045', 'Coupling 3" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.372426', '2025-03-07 05:25:21.372436', '3', '19');
INSERT INTO ims_item VALUES ('03-046', 'Coupling 3" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:21.392620', '2025-03-07 05:25:21.392626', '3', '19');
INSERT INTO ims_item VALUES ('03-047', 'Coupling 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.411948', '2025-03-07 05:25:21.411955', '3', '19');
INSERT INTO ims_item VALUES ('03-048', 'Coupling 3/4 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:21.430847', '2025-03-07 05:25:21.430856', '3', '19');
INSERT INTO ims_item VALUES ('03-049', 'Coupling 4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.450344', '2025-03-07 05:25:21.450351', '3', '19');
INSERT INTO ims_item VALUES ('03-050', 'Coupling 4" HDPE- FISH', '0', '0.0', '0.0', '2025-03-07 05:25:21.470073', '2025-03-07 05:25:21.470080', '3', '19');
INSERT INTO ims_item VALUES ('03-051', 'Coupling 4X3 GI (SCHED 80)', '0', '0.0', '0.0', '2025-03-07 05:25:21.489819', '2025-03-07 05:25:21.489826', '3', '19');
INSERT INTO ims_item VALUES ('03-052', 'Coupling 6" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.510241', '2025-03-07 05:25:21.510248', '3', '19');
INSERT INTO ims_item VALUES ('03-053', 'Coupling 6" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:21.528916', '2025-03-07 05:25:21.528924', '3', '19');
INSERT INTO ims_item VALUES ('03-054', 'Coupling 3/4"  PVC', '0', '0.0', '0.0', '2025-03-07 05:25:21.546352', '2025-03-07 05:25:21.546359', '3', '19');
INSERT INTO ims_item VALUES ('03-055', 'Coupling Reducer 3 x 2 - Mechanical', '0', '0.0', '0.0', '2025-03-07 05:25:21.563976', '2025-03-07 05:25:21.563983', '3', '19');
INSERT INTO ims_item VALUES ('03-056', 'Coupling Reducer 3 x 2 NLC - FISH', '0', '0.0', '0.0', '2025-03-07 05:25:21.581879', '2025-03-07 05:25:21.581885', '3', '19');
INSERT INTO ims_item VALUES ('03-057', 'Coupling Reducer 4 x 2 - Mechanical', '0', '0.0', '0.0', '2025-03-07 05:25:21.600408', '2025-03-07 05:25:21.600416', '3', '19');
INSERT INTO ims_item VALUES ('03-058', 'Cross Tee 1" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.618695', '2025-03-07 05:25:21.618703', '3', '19');
INSERT INTO ims_item VALUES ('03-059', 'Cross Tee 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.638373', '2025-03-07 05:25:21.638382', '3', '19');
INSERT INTO ims_item VALUES ('03-060', 'Cross Tee 2" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.657557', '2025-03-07 05:25:21.657564', '3', '19');
INSERT INTO ims_item VALUES ('03-061', 'Cross Tee 3 x 2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.676458', '2025-03-07 05:25:21.676465', '3', '19');
INSERT INTO ims_item VALUES ('03-062', 'Cross Tee 3" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.695865', '2025-03-07 05:25:21.695872', '3', '19');
INSERT INTO ims_item VALUES ('03-063', 'Cross Tee 4 x 2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.714360', '2025-03-07 05:25:21.714369', '3', '19');
INSERT INTO ims_item VALUES ('03-064', 'Cross Tee 4 x 3 GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.733991', '2025-03-07 05:25:21.733998', '3', '19');
INSERT INTO ims_item VALUES ('03-065', 'Cross Tee 4" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.753168', '2025-03-07 05:25:21.753176', '3', '19');
INSERT INTO ims_item VALUES ('03-066', 'Cross Tee 6 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:21.773056', '2025-03-07 05:25:21.773063', '3', '19');
INSERT INTO ims_item VALUES ('03-067', 'Elbow 45deg - Flange Type 6" CI', '0', '0.0', '0.0', '2025-03-07 05:25:21.791786', '2025-03-07 05:25:21.791793', '3', '19');
INSERT INTO ims_item VALUES ('03-068', 'Elbow 90 deg - 4" BI', '0', '0.0', '0.0', '2025-03-07 05:25:21.809464', '2025-03-07 05:25:21.809471', '3', '19');
INSERT INTO ims_item VALUES ('03-069', 'Elbow 90deg - Flange Type 6" CI', '0', '0.0', '0.0', '2025-03-07 05:25:21.827848', '2025-03-07 05:25:21.827856', '3', '19');
INSERT INTO ims_item VALUES ('03-070', 'Elbow 1" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.845970', '2025-03-07 05:25:21.845980', '3', '19');
INSERT INTO ims_item VALUES ('03-071', 'Elbow 1" GI 45 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:21.865376', '2025-03-07 05:25:21.865383', '3', '19');
INSERT INTO ims_item VALUES ('03-072', 'Elbow 1" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:21.884244', '2025-03-07 05:25:21.884251', '3', '19');
INSERT INTO ims_item VALUES ('03-073', 'Elbow 1" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:21.904557', '2025-03-07 05:25:21.904569', '3', '19');
INSERT INTO ims_item VALUES ('03-074', 'Elbow 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.923692', '2025-03-07 05:25:21.923699', '3', '19');
INSERT INTO ims_item VALUES ('03-075', 'Elbow 1/2 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:21.942403', '2025-03-07 05:25:21.942410', '3', '19');
INSERT INTO ims_item VALUES ('03-076', 'Elbow 1/2 (plain)  PVC', '0', '0.0', '0.0', '2025-03-07 05:25:21.961381', '2025-03-07 05:25:21.961388', '3', '19');
INSERT INTO ims_item VALUES ('03-077', 'Elbow 2" GI', '0', '0.0', '0.0', '2025-03-07 05:25:21.980395', '2025-03-07 05:25:21.980402', '3', '19');
INSERT INTO ims_item VALUES ('03-078', 'Elbow 2" HDPE- FISH', '0', '0.0', '0.0', '2025-03-07 05:25:21.999964', '2025-03-07 05:25:21.999974', '3', '19');
INSERT INTO ims_item VALUES ('03-079', 'Elbow 3" BI 45 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:22.020421', '2025-03-07 05:25:22.020433', '3', '19');
INSERT INTO ims_item VALUES ('03-080', 'Elbow 3" GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.040083', '2025-03-07 05:25:22.040090', '3', '19');
INSERT INTO ims_item VALUES ('03-081', 'Elbow 3" GI 45 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:22.059097', '2025-03-07 05:25:22.059104', '3', '1');
INSERT INTO ims_item VALUES ('03-082', 'Elbow 3" HDPE- FISH', '0', '0.0', '0.0', '2025-03-07 05:25:22.077914', '2025-03-07 05:25:22.077921', '3', '19');
INSERT INTO ims_item VALUES ('03-083', 'Elbow 3/4 GI- JB', '0', '0.0', '0.0', '2025-03-07 05:25:22.095237', '2025-03-07 05:25:22.095244', '3', '19');
INSERT INTO ims_item VALUES ('03-084', 'Elbow 3/4 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:22.114278', '2025-03-07 05:25:22.114308', '3', '19');
INSERT INTO ims_item VALUES ('03-085', 'Elbow 4" 45deg (80) BI', '0', '0.0', '0.0', '2025-03-07 05:25:22.132899', '2025-03-07 05:25:22.132908', '3', '19');
INSERT INTO ims_item VALUES ('03-086', 'Elbow 4" 45deg GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.151133', '2025-03-07 05:25:22.151141', '3', '19');
INSERT INTO ims_item VALUES ('03-087', 'Elbow 4" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:22.169955', '2025-03-07 05:25:22.169962', '3', '19');
INSERT INTO ims_item VALUES ('03-088', 'Elbow 6" BI  45 DEG', '0', '0.0', '0.0', '2025-03-07 05:25:22.188290', '2025-03-07 05:25:22.188297', '3', '19');
INSERT INTO ims_item VALUES ('03-089', 'Elbow 6" BI  90 DEG', '0', '0.0', '0.0', '2025-03-07 05:25:22.206463', '2025-03-07 05:25:22.206473', '3', '19');
INSERT INTO ims_item VALUES ('03-090', 'Elbow Reducer 1" x 1 1/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.226247', '2025-03-07 05:25:22.226254', '3', '19');
INSERT INTO ims_item VALUES ('03-091', 'Elbow Reducer 1" x 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.246714', '2025-03-07 05:25:22.246722', '3', '19');
INSERT INTO ims_item VALUES ('03-092', 'Elbow Reducer 1" x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.265905', '2025-03-07 05:25:22.265915', '3', '19');
INSERT INTO ims_item VALUES ('03-093', 'Elbow Reducer 3/4 x 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.286235', '2025-03-07 05:25:22.286242', '3', '19');
INSERT INTO ims_item VALUES ('03-094', 'Elbow Straight 1/2"', '0', '0.0', '0.0', '2025-03-07 05:25:22.304350', '2025-03-07 05:25:22.304358', '3', '19');
INSERT INTO ims_item VALUES ('03-095', 'Elbow Straight 1"', '0', '0.0', '0.0', '2025-03-07 05:25:22.323888', '2025-03-07 05:25:22.323896', '3', '19');
INSERT INTO ims_item VALUES ('03-096', 'Elbow Straight 3/4"', '0', '0.0', '0.0', '2025-03-07 05:25:22.342523', '2025-03-07 05:25:22.342530', '3', '19');
INSERT INTO ims_item VALUES ('03-097', 'Elbow Threaded 1/2 PVC', '0', '0.0', '0.0', '2025-03-07 05:25:22.360338', '2025-03-07 05:25:22.360349', '3', '19');
INSERT INTO ims_item VALUES ('03-098', 'End Cap 1" GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.378496', '2025-03-07 05:25:22.378504', '3', '19');
INSERT INTO ims_item VALUES ('03-099', 'End Cap 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.396782', '2025-03-07 05:25:22.396789', '3', '19');
INSERT INTO ims_item VALUES ('03-100', 'End Cap 2"  GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.416065', '2025-03-07 05:25:22.416073', '3', '19');
INSERT INTO ims_item VALUES ('03-101', 'End Cap 2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:22.435572', '2025-03-07 05:25:22.435581', '3', '19');
INSERT INTO ims_item VALUES ('03-102', 'End Cap 3" GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.454893', '2025-03-07 05:25:22.454901', '3', '19');
INSERT INTO ims_item VALUES ('03-103', 'End Cap 3" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:22.473954', '2025-03-07 05:25:22.473961', '3', '19');
INSERT INTO ims_item VALUES ('03-104', 'End Cap 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.492799', '2025-03-07 05:25:22.492807', '3', '19');
INSERT INTO ims_item VALUES ('03-105', 'End Cap 4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.511555', '2025-03-07 05:25:22.511562', '3', '19');
INSERT INTO ims_item VALUES ('03-106', 'End Cap 6"', '0', '0.0', '0.0', '2025-03-07 05:25:22.531201', '2025-03-07 05:25:22.531209', '3', '19');
INSERT INTO ims_item VALUES ('03-107', 'End Cap 8"', '0', '0.0', '0.0', '2025-03-07 05:25:22.549615', '2025-03-07 05:25:22.549626', '3', '19');
INSERT INTO ims_item VALUES ('03-108', 'End Plug 1" GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.568093', '2025-03-07 05:25:22.568100', '3', '19');
INSERT INTO ims_item VALUES ('03-109', 'End Plug 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.586965', '2025-03-07 05:25:22.586972', '3', '19');
INSERT INTO ims_item VALUES ('03-110', 'End Plug 2" GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.605772', '2025-03-07 05:25:22.605781', '3', '19');
INSERT INTO ims_item VALUES ('03-111', 'End Plug 3 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.625708', '2025-03-07 05:25:22.625716', '3', '19');
INSERT INTO ims_item VALUES ('03-112', 'End Plug 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.644192', '2025-03-07 05:25:22.644199', '3', '19');
INSERT INTO ims_item VALUES ('03-113', 'End Plug 4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:22.664051', '2025-03-07 05:25:22.664058', '3', '19');
INSERT INTO ims_item VALUES ('03-114', 'Sleeve-Type Coupling 8"', '0', '0.0', '0.0', '2025-03-07 05:25:22.683791', '2025-03-07 05:25:22.683800', '3', '19');
INSERT INTO ims_item VALUES ('03-115', 'Fabricated Elbow 3"', '0', '0.0', '0.0', '2025-03-07 05:25:22.703155', '2025-03-07 05:25:22.703163', '3', '19');
INSERT INTO ims_item VALUES ('03-116', 'Fabricated Elbow 4"', '0', '0.0', '0.0', '2025-03-07 05:25:22.722201', '2025-03-07 05:25:22.722209', '3', '19');
INSERT INTO ims_item VALUES ('03-117', 'Fabricated Elbow 6', '0', '0.0', '0.0', '2025-03-07 05:25:22.741156', '2025-03-07 05:25:22.741162', '3', '19');
INSERT INTO ims_item VALUES ('03-118', 'Fabricated Reducer 3 x 2', '0', '0.0', '0.0', '2025-03-07 05:25:22.760505', '2025-03-07 05:25:22.760513', '3', '19');
INSERT INTO ims_item VALUES ('03-119', 'Fabricated Tee 3 x 2', '0', '0.0', '0.0', '2025-03-07 05:25:22.780330', '2025-03-07 05:25:22.780337', '3', '19');
INSERT INTO ims_item VALUES ('03-120', 'Fabricated Tee 3', '0', '0.0', '0.0', '2025-03-07 05:25:22.799435', '2025-03-07 05:25:22.799445', '3', '19');
INSERT INTO ims_item VALUES ('03-121', 'Fabricated Tee 4 x 2', '0', '0.0', '0.0', '2025-03-07 05:25:22.819316', '2025-03-07 05:25:22.819323', '3', '19');
INSERT INTO ims_item VALUES ('03-122', 'Fabricated Tee 4 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:22.838139', '2025-03-07 05:25:22.838146', '3', '19');
INSERT INTO ims_item VALUES ('03-123', 'Fabricated Tee 4', '0', '0.0', '0.0', '2025-03-07 05:25:22.856878', '2025-03-07 05:25:22.856886', '3', '19');
INSERT INTO ims_item VALUES ('03-124', 'Fabricated Tee 6 x 2', '0', '0.0', '0.0', '2025-03-07 05:25:22.875432', '2025-03-07 05:25:22.875441', '3', '19');
INSERT INTO ims_item VALUES ('03-125', 'Fabricated Tee 6 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:22.893875', '2025-03-07 05:25:22.893881', '3', '19');
INSERT INTO ims_item VALUES ('03-126', 'Fabricated Tee 6 x 4', '0', '0.0', '0.0', '2025-03-07 05:25:22.912668', '2025-03-07 05:25:22.912677', '3', '19');
INSERT INTO ims_item VALUES ('03-127', 'Fabricated Tee 6', '0', '0.0', '0.0', '2025-03-07 05:25:22.931548', '2025-03-07 05:25:22.931555', '3', '19');
INSERT INTO ims_item VALUES ('03-128', 'Fabricated Tee 8 x 2', '0', '0.0', '0.0', '2025-03-07 05:25:22.950557', '2025-03-07 05:25:22.950568', '3', '19');
INSERT INTO ims_item VALUES ('03-129', 'Fabricated Tee 8 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:22.968529', '2025-03-07 05:25:22.968536', '3', '19');
INSERT INTO ims_item VALUES ('03-130', 'Fabricated Tee 8', '0', '0.0', '0.0', '2025-03-07 05:25:22.986789', '2025-03-07 05:25:22.986799', '3', '19');
INSERT INTO ims_item VALUES ('03-131', 'Female Adaptor 1/2" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:23.005272', '2025-03-07 05:25:23.005280', '3', '19');
INSERT INTO ims_item VALUES ('03-132', 'Female Elbow 1" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:23.028181', '2025-03-07 05:25:23.028192', '3', '19');
INSERT INTO ims_item VALUES ('03-133', 'Female Elbow 1/2 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:23.052891', '2025-03-07 05:25:23.052903', '3', '19');
INSERT INTO ims_item VALUES ('03-134', 'Female Elbow 2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:23.078756', '2025-03-07 05:25:23.078768', '3', '19');
INSERT INTO ims_item VALUES ('03-135', 'Female Elbow 3 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:23.101853', '2025-03-07 05:25:23.101860', '3', '19');
INSERT INTO ims_item VALUES ('03-136', 'Female Elbow 3/4 HDPE - NLC- PBP', '0', '0.0', '0.0', '2025-03-07 05:25:23.125751', '2025-03-07 05:25:23.125758', '3', '19');
INSERT INTO ims_item VALUES ('03-137', 'Flange 2"', '0', '0.0', '0.0', '2025-03-07 05:25:23.143164', '2025-03-07 05:25:23.143171', '3', '19');
INSERT INTO ims_item VALUES ('03-138', 'Flange 3" ( 8 hole )', '0', '0.0', '0.0', '2025-03-07 05:25:23.162928', '2025-03-07 05:25:23.162936', '3', '19');
INSERT INTO ims_item VALUES ('03-139', 'Flange 6"', '0', '0.0', '0.0', '2025-03-07 05:25:23.181937', '2025-03-07 05:25:23.181945', '3', '19');
INSERT INTO ims_item VALUES ('03-140', 'Flange 8"', '0', '0.0', '0.0', '2025-03-07 05:25:23.199553', '2025-03-07 05:25:23.199561', '3', '19');
INSERT INTO ims_item VALUES ('03-141', 'Gasket 1/2"', '0', '0.0', '0.0', '2025-03-07 05:25:23.218819', '2025-03-07 05:25:23.218827', '3', '19');
INSERT INTO ims_item VALUES ('03-142', 'Gasket 3" - LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:23.237537', '2025-03-07 05:25:23.237544', '3', '19');
INSERT INTO ims_item VALUES ('03-143', 'Gasket 3/4 "', '0', '0.0', '0.0', '2025-03-07 05:25:23.256828', '2025-03-07 05:25:23.256835', '3', '19');
INSERT INTO ims_item VALUES ('03-144', 'Gasket 8"', '0', '0.0', '0.0', '2025-03-07 05:25:23.275457', '2025-03-07 05:25:23.275463', '3', '19');
INSERT INTO ims_item VALUES ('03-145', 'Gate Valve 1" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:23.293893', '2025-03-07 05:25:23.293900', '3', '19');
INSERT INTO ims_item VALUES ('03-146', 'Gate Valve 1/2" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:23.313181', '2025-03-07 05:25:23.313191', '3', '19');
INSERT INTO ims_item VALUES ('03-147', 'Gate Valve 2" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:23.331665', '2025-03-07 05:25:23.331672', '3', '19');
INSERT INTO ims_item VALUES ('03-148', 'Gate Valve 2" Flange', '0', '0.0', '0.0', '2025-03-07 05:25:23.349943', '2025-03-07 05:25:23.349950', '3', '19');
INSERT INTO ims_item VALUES ('03-149', 'Gate Valve 2" Mechanical', '0', '0.0', '0.0', '2025-03-07 05:25:23.368504', '2025-03-07 05:25:23.368511', '3', '19');
INSERT INTO ims_item VALUES ('03-150', 'Gate Valve 3" Mechanical', '0', '0.0', '0.0', '2025-03-07 05:25:23.386483', '2025-03-07 05:25:23.386490', '3', '19');
INSERT INTO ims_item VALUES ('03-151', 'Gate Valve 3" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:23.405263', '2025-03-07 05:25:23.405271', '3', '19');
INSERT INTO ims_item VALUES ('03-152', 'Gate Valve 3" Flange- DI (BOHAI)', '0', '0.0', '0.0', '2025-03-07 05:25:23.423187', '2025-03-07 05:25:23.423197', '3', '19');
INSERT INTO ims_item VALUES ('03-153', 'Gate Valve 3/4" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:23.440617', '2025-03-07 05:25:23.440624', '3', '19');
INSERT INTO ims_item VALUES ('03-154', 'Gate Valve 4" Flange', '0', '0.0', '0.0', '2025-03-07 05:25:23.458912', '2025-03-07 05:25:23.458918', '3', '19');
INSERT INTO ims_item VALUES ('03-155', 'Gate Valve 4" Mechanical', '0', '0.0', '0.0', '2025-03-07 05:25:23.477732', '2025-03-07 05:25:23.477739', '3', '19');
INSERT INTO ims_item VALUES ('03-156', 'Gate Valve 6" Brass', '0', '0.0', '0.0', '2025-03-07 05:25:23.495820', '2025-03-07 05:25:23.495827', '3', '19');
INSERT INTO ims_item VALUES ('03-157', 'Gate Valve 6" Flange', '0', '0.0', '0.0', '2025-03-07 05:25:23.515152', '2025-03-07 05:25:23.515166', '3', '19');
INSERT INTO ims_item VALUES ('03-158', 'Gate Valve 6" Mechanical', '0', '0.0', '0.0', '2025-03-07 05:25:23.533217', '2025-03-07 05:25:23.533224', '3', '19');
INSERT INTO ims_item VALUES ('03-159', 'Gate Valve 8" Mechanical', '0', '0.0', '0.0', '2025-03-07 05:25:23.551162', '2025-03-07 05:25:23.551169', '3', '19');
INSERT INTO ims_item VALUES ('03-160', 'GiBault 2"', '0', '0.0', '0.0', '2025-03-07 05:25:23.569668', '2025-03-07 05:25:23.569675', '3', '19');
INSERT INTO ims_item VALUES ('03-161', 'GiBault 3"', '0', '0.0', '0.0', '2025-03-07 05:25:23.588271', '2025-03-07 05:25:23.588277', '3', '19');
INSERT INTO ims_item VALUES ('03-162', 'GiBault 4"', '0', '0.0', '0.0', '2025-03-07 05:25:23.606098', '2025-03-07 05:25:23.606105', '3', '19');
INSERT INTO ims_item VALUES ('03-163', 'GiBault 6"', '0', '0.0', '0.0', '2025-03-07 05:25:23.623945', '2025-03-07 05:25:23.623952', '3', '19');
INSERT INTO ims_item VALUES ('03-164', 'GiBault 8"', '0', '0.0', '0.0', '2025-03-07 05:25:23.642032', '2025-03-07 05:25:23.642039', '3', '19');
INSERT INTO ims_item VALUES ('03-165', 'Gate Valve 2" Flange Type CI', '0', '0.0', '0.0', '2025-03-07 05:25:23.659307', '2025-03-07 05:25:23.659314', '3', '19');
INSERT INTO ims_item VALUES ('03-166', 'Gate Valve 3" Flange Type CI', '0', '0.0', '0.0', '2025-03-07 05:25:23.678113', '2025-03-07 05:25:23.678120', '3', '19');
INSERT INTO ims_item VALUES ('03-167', 'Gate Valve 4" Flange Type CI', '0', '0.0', '0.0', '2025-03-07 05:25:23.698634', '2025-03-07 05:25:23.698642', '3', '19');
INSERT INTO ims_item VALUES ('03-168', 'Mechanical Flange 3" - LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:23.717042', '2025-03-07 05:25:23.717050', '3', '19');
INSERT INTO ims_item VALUES ('03-169', 'Mechanical Flange 4"- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:23.734984', '2025-03-07 05:25:23.734995', '3', '19');
INSERT INTO ims_item VALUES ('03-170', 'Male Adaptor 1" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:23.753581', '2025-03-07 05:25:23.753588', '3', '19');
INSERT INTO ims_item VALUES ('03-171', 'Male Adaptor 1" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:23.770963', '2025-03-07 05:25:23.770970', '3', '19');
INSERT INTO ims_item VALUES ('03-172', 'Male Adaptor 1/2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:23.788845', '2025-03-07 05:25:23.788852', '3', '1');
INSERT INTO ims_item VALUES ('03-173', 'Male Adaptor 1/2" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:23.807189', '2025-03-07 05:25:23.807195', '3', '1');
INSERT INTO ims_item VALUES ('03-174', 'Male Adaptor 2" HDPE- FISH', '0', '0.0', '0.0', '2025-03-07 05:25:23.826451', '2025-03-07 05:25:23.826462', '3', '19');
INSERT INTO ims_item VALUES ('03-175', 'Male Adaptor 2" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:23.846564', '2025-03-07 05:25:23.846572', '3', '19');
INSERT INTO ims_item VALUES ('03-176', 'Male Adaptor 3"', '0', '0.0', '0.0', '2025-03-07 05:25:23.865526', '2025-03-07 05:25:23.865533', '3', '19');
INSERT INTO ims_item VALUES ('03-177', 'Male Adaptor 3/4 HDPE - FISH', '0', '0.0', '0.0', '2025-03-07 05:25:23.884030', '2025-03-07 05:25:23.884037', '3', '19');
INSERT INTO ims_item VALUES ('03-178', 'Male Adaptor 3/4" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:23.902732', '2025-03-07 05:25:23.902741', '3', '19');
INSERT INTO ims_item VALUES ('03-179', 'Mechanical Elbow 2" 90 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:23.921006', '2025-03-07 05:25:23.921013', '3', '19');
INSERT INTO ims_item VALUES ('03-180', 'Mechanical Elbow 3" 45 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:23.938899', '2025-03-07 05:25:23.938906', '3', '19');
INSERT INTO ims_item VALUES ('03-181', 'Mechanical Elbow 3" 90 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:23.957772', '2025-03-07 05:25:23.957781', '3', '19');
INSERT INTO ims_item VALUES ('03-182', 'Mechanical Elbow 4" 90 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:23.975856', '2025-03-07 05:25:23.975863', '3', '19');
INSERT INTO ims_item VALUES ('03-183', 'Mechanical Elbow 6" 45 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:23.993957', '2025-03-07 05:25:23.993965', '3', '19');
INSERT INTO ims_item VALUES ('03-184', 'Mechanical Elbow 6" 90 deg.', '0', '0.0', '0.0', '2025-03-07 05:25:24.012558', '2025-03-07 05:25:24.012565', '3', '19');
INSERT INTO ims_item VALUES ('03-185', 'Mechanical End Cap 2"', '0', '0.0', '0.0', '2025-03-07 05:25:24.031360', '2025-03-07 05:25:24.031367', '3', '19');
INSERT INTO ims_item VALUES ('03-186', 'Mechanical End Cap 4"', '0', '0.0', '0.0', '2025-03-07 05:25:24.049514', '2025-03-07 05:25:24.049521', '3', '19');
INSERT INTO ims_item VALUES ('03-187', 'Mechanical Tee 2"', '0', '0.0', '0.0', '2025-03-07 05:25:24.067469', '2025-03-07 05:25:24.067477', '3', '19');
INSERT INTO ims_item VALUES ('03-188', 'Mechanical Tee 3 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:24.085343', '2025-03-07 05:25:24.085350', '3', '19');
INSERT INTO ims_item VALUES ('03-189', 'Mechanical Tee 4 x 2 CI', '0', '0.0', '0.0', '2025-03-07 05:25:24.103969', '2025-03-07 05:25:24.103976', '3', '19');
INSERT INTO ims_item VALUES ('03-190', 'Mechanical Tee 4 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:24.121834', '2025-03-07 05:25:24.121842', '3', '19');
INSERT INTO ims_item VALUES ('03-191', 'Mechanical Tee 4 x 4', '0', '0.0', '0.0', '2025-03-07 05:25:24.139970', '2025-03-07 05:25:24.139982', '3', '19');
INSERT INTO ims_item VALUES ('03-192', 'Mechanical Tee 6 x 2', '0', '0.0', '0.0', '2025-03-07 05:25:24.158049', '2025-03-07 05:25:24.158056', '3', '19');
INSERT INTO ims_item VALUES ('03-193', 'Mechanical Tee 6 x 3', '0', '0.0', '0.0', '2025-03-07 05:25:24.176535', '2025-03-07 05:25:24.176542', '3', '19');
INSERT INTO ims_item VALUES ('03-194', 'Mechanical Tee 6 x 4', '0', '0.0', '0.0', '2025-03-07 05:25:24.195765', '2025-03-07 05:25:24.195773', '3', '19');
INSERT INTO ims_item VALUES ('03-195', 'Mechanical Tee 6"', '0', '0.0', '0.0', '2025-03-07 05:25:24.214385', '2025-03-07 05:25:24.214393', '3', '19');
INSERT INTO ims_item VALUES ('03-196', 'Nipple 1 x 12 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.233489', '2025-03-07 05:25:24.233497', '3', '19');
INSERT INTO ims_item VALUES ('03-197', 'Nipple 1 x 5 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.252110', '2025-03-07 05:25:24.252117', '3', '19');
INSERT INTO ims_item VALUES ('03-198', 'Nipple 1 x 8 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.270403', '2025-03-07 05:25:24.270413', '3', '19');
INSERT INTO ims_item VALUES ('03-199', 'Nipple 1" x 2" GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.289875', '2025-03-07 05:25:24.289882', '3', '19');
INSERT INTO ims_item VALUES ('03-200', 'Nipple 1" x 6" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:24.312917', '2025-03-07 05:25:24.312925', '3', '19');
INSERT INTO ims_item VALUES ('03-201', 'Nipple 1" x 8" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:24.332873', '2025-03-07 05:25:24.332881', '3', '19');
INSERT INTO ims_item VALUES ('03-202', 'Nipple 1/2 x 1 GI - FS', '0', '0.0', '0.0', '2025-03-07 05:25:24.354361', '2025-03-07 05:25:24.354369', '3', '19');
INSERT INTO ims_item VALUES ('03-203', 'Nipple 1/2 x 12 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.373131', '2025-03-07 05:25:24.373141', '3', '19');
INSERT INTO ims_item VALUES ('03-204', 'Nipple 1/2 x 16 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.391948', '2025-03-07 05:25:24.391955', '3', '19');
INSERT INTO ims_item VALUES ('03-205', 'Nipple 1/2 x 2 GI - JB', '0', '0.0', '0.0', '2025-03-07 05:25:24.409643', '2025-03-07 05:25:24.409650', '3', '19');
INSERT INTO ims_item VALUES ('03-206', 'Nipple 1/2 x 2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:24.428002', '2025-03-07 05:25:24.428011', '3', '19');
INSERT INTO ims_item VALUES ('03-207', 'Nipple 1/2 x 3 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.447222', '2025-03-07 05:25:24.447229', '3', '19');
INSERT INTO ims_item VALUES ('03-208', 'Nipple 1/2 x 4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.466270', '2025-03-07 05:25:24.466280', '3', '19');
INSERT INTO ims_item VALUES ('03-209', 'Nipple 1/2 x 6 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.484532', '2025-03-07 05:25:24.484539', '3', '19');
INSERT INTO ims_item VALUES ('03-210', 'Nipple 1/2 x 8 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.505269', '2025-03-07 05:25:24.505276', '3', '19');
INSERT INTO ims_item VALUES ('03-211', 'Nipple 2 1/2 x 5 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.524178', '2025-03-07 05:25:24.524186', '3', '19');
INSERT INTO ims_item VALUES ('03-212', 'Nipple 2 x 5 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.542767', '2025-03-07 05:25:24.542774', '3', '19');
INSERT INTO ims_item VALUES ('03-213', 'Nipple 3 x 5 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.561115', '2025-03-07 05:25:24.561123', '3', '19');
INSERT INTO ims_item VALUES ('03-214', 'Nipple 3/4 x 10 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.578866', '2025-03-07 05:25:24.578873', '3', '19');
INSERT INTO ims_item VALUES ('03-215', 'Nipple 3/4 x 4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.598718', '2025-03-07 05:25:24.598726', '3', '19');
INSERT INTO ims_item VALUES ('03-216', 'Nipple 3/4 x 5 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.616853', '2025-03-07 05:25:24.616860', '3', '19');
INSERT INTO ims_item VALUES ('03-217', 'Nipple 3/4 x 6 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.635364', '2025-03-07 05:25:24.635371', '3', '19');
INSERT INTO ims_item VALUES ('03-218', 'Nipple 3/4 x 6 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:24.653883', '2025-03-07 05:25:24.653891', '3', '19');
INSERT INTO ims_item VALUES ('03-219', 'Nipple 3/4 x 8 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.673372', '2025-03-07 05:25:24.673382', '3', '19');
INSERT INTO ims_item VALUES ('03-220', 'Nipple 3/4 x 8 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:24.691446', '2025-03-07 05:25:24.691454', '3', '19');
INSERT INTO ims_item VALUES ('03-221', 'Nipple 4 x 12 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.710822', '2025-03-07 05:25:24.710830', '3', '19');
INSERT INTO ims_item VALUES ('03-222', 'Nipple 5 x 10 BI', '0', '0.0', '0.0', '2025-03-07 05:25:24.729764', '2025-03-07 05:25:24.729771', '3', '19');
INSERT INTO ims_item VALUES ('03-223', 'Repair Clamp 2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:24.749949', '2025-03-07 05:25:24.749960', '3', '19');
INSERT INTO ims_item VALUES ('03-224', 'Repair Clamp 3" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:24.768688', '2025-03-07 05:25:24.768695', '3', '19');
INSERT INTO ims_item VALUES ('03-225', 'Repair Clamp 4" HDPE - MIE', '0', '0.0', '0.0', '2025-03-07 05:25:24.789891', '2025-03-07 05:25:24.789898', '3', '19');
INSERT INTO ims_item VALUES ('03-226', 'Repair Clamp 6" HDPE - MIE', '0', '0.0', '0.0', '2025-03-07 05:25:24.808042', '2025-03-07 05:25:24.808049', '3', '19');
INSERT INTO ims_item VALUES ('03-227', 'Repair Clamp 8" HDPE - MIE', '0', '0.0', '0.0', '2025-03-07 05:25:24.827849', '2025-03-07 05:25:24.827857', '3', '19');
INSERT INTO ims_item VALUES ('03-228', 'Saddle Clamp 2 x 1 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.847005', '2025-03-07 05:25:24.847014', '3', '19');
INSERT INTO ims_item VALUES ('03-229', 'Saddle Clamp 2 x 1 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:24.867301', '2025-03-07 05:25:24.867308', '3', '19');
INSERT INTO ims_item VALUES ('03-230', 'Saddle Clamp 2 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.886977', '2025-03-07 05:25:24.886984', '3', '19');
INSERT INTO ims_item VALUES ('03-231', 'Saddle Clamp 3 x 1 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.905399', '2025-03-07 05:25:24.905406', '3', '19');
INSERT INTO ims_item VALUES ('03-232', 'Saddle Clamp 3 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.924138', '2025-03-07 05:25:24.924148', '3', '19');
INSERT INTO ims_item VALUES ('03-233', 'Saddle Clamp 4 x 1 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.943077', '2025-03-07 05:25:24.943084', '3', '19');
INSERT INTO ims_item VALUES ('03-234', 'Saddle Clamp 4 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.963039', '2025-03-07 05:25:24.963050', '3', '19');
INSERT INTO ims_item VALUES ('03-235', 'Saddle Clamp 4x2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:24.982545', '2025-03-07 05:25:24.982553', '3', '19');
INSERT INTO ims_item VALUES ('03-236', 'Saddle Clamp 6 x 1 GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.000476', '2025-03-07 05:25:25.000483', '3', '19');
INSERT INTO ims_item VALUES ('03-237', 'Saddle Clamp 6 x 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.019262', '2025-03-07 05:25:25.019269', '3', '19');
INSERT INTO ims_item VALUES ('03-238', 'Saddle Clamp 6 x 2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.038526', '2025-03-07 05:25:25.038533', '3', '19');
INSERT INTO ims_item VALUES ('03-239', 'Saddle Clamp 6 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.057335', '2025-03-07 05:25:25.057342', '3', '19');
INSERT INTO ims_item VALUES ('03-240', 'Saddle Clamp 6" x 1" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.076702', '2025-03-07 05:25:25.076714', '3', '19');
INSERT INTO ims_item VALUES ('03-241', 'Saddle Clamp 8" x 1" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.095549', '2025-03-07 05:25:25.095556', '3', '19');
INSERT INTO ims_item VALUES ('03-242', 'Saddle Clamp 8" x 1" GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.116088', '2025-03-07 05:25:25.116095', '3', '19');
INSERT INTO ims_item VALUES ('03-243', 'Saddle Clamp 8" x 2" - HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.134358', '2025-03-07 05:25:25.134366', '3', '19');
INSERT INTO ims_item VALUES ('03-244', 'Saddle Clamp 8" x 2" GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.153429', '2025-03-07 05:25:25.153446', '3', '19');
INSERT INTO ims_item VALUES ('03-245', 'Side Bolts 3/4 x 8', '0', '0.0', '0.0', '2025-03-07 05:25:25.172867', '2025-03-07 05:25:25.172875', '3', '19');
INSERT INTO ims_item VALUES ('03-246', 'Sleeve-Type Coupling 2"', '0', '0.0', '0.0', '2025-03-07 05:25:25.190759', '2025-03-07 05:25:25.190770', '3', '19');
INSERT INTO ims_item VALUES ('03-247', 'Sleeve-Type Coupling 3" DI pvc to pvc- PVMC', '0', '0.0', '0.0', '2025-03-07 05:25:25.210376', '2025-03-07 05:25:25.210386', '3', '19');
INSERT INTO ims_item VALUES ('03-248', 'Sleeve-Type Coupling 4 x 2', '0', '0.0', '0.0', '2025-03-07 05:25:25.230013', '2025-03-07 05:25:25.230023', '3', '19');
INSERT INTO ims_item VALUES ('03-249', 'Sleeve-Type Coupling 4" DI pvc to pvc- PVMC', '0', '0.0', '0.0', '2025-03-07 05:25:25.248967', '2025-03-07 05:25:25.248978', '3', '19');
INSERT INTO ims_item VALUES ('03-250', 'STC (GI-PVC) 6" (GI to GI)', '0', '0.0', '0.0', '2025-03-07 05:25:25.267735', '2025-03-07 05:25:25.267742', '3', '19');
INSERT INTO ims_item VALUES ('03-251', 'Sleeve-Type Coupling 6" DI (PVC to PVC)- PVMC', '0', '0.0', '0.0', '2025-03-07 05:25:25.286666', '2025-03-07 05:25:25.286674', '3', '19');
INSERT INTO ims_item VALUES ('03-252', 'Stub End 2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.306357', '2025-03-07 05:25:25.306364', '3', '19');
INSERT INTO ims_item VALUES ('03-253', 'Stub End 3" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.326441', '2025-03-07 05:25:25.326450', '3', '19');
INSERT INTO ims_item VALUES ('03-254', 'Stub End 4" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.350023', '2025-03-07 05:25:25.350031', '3', '19');
INSERT INTO ims_item VALUES ('03-255', 'Stub End 6" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.375800', '2025-03-07 05:25:25.375807', '3', '19');
INSERT INTO ims_item VALUES ('03-256', 'Stub End 8" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.395887', '2025-03-07 05:25:25.395898', '3', '19');
INSERT INTO ims_item VALUES ('03-257', 'Tee 1" GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.416557', '2025-03-07 05:25:25.416564', '3', '19');
INSERT INTO ims_item VALUES ('03-258', 'Tee 1" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.434426', '2025-03-07 05:25:25.434435', '3', '19');
INSERT INTO ims_item VALUES ('03-259', 'Tee 1/2" GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.453725', '2025-03-07 05:25:25.453733', '3', '1');
INSERT INTO ims_item VALUES ('03-260', 'Tee 1/2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.472376', '2025-03-07 05:25:25.472383', '3', '1');
INSERT INTO ims_item VALUES ('03-261', 'Tee 1/2" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:25.491507', '2025-03-07 05:25:25.491515', '3', '1');
INSERT INTO ims_item VALUES ('03-262', 'Tee 2" Flange', '0', '0.0', '0.0', '2025-03-07 05:25:25.510280', '2025-03-07 05:25:25.510288', '3', '19');
INSERT INTO ims_item VALUES ('03-263', 'Tee 2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.528998', '2025-03-07 05:25:25.529005', '3', '19');
INSERT INTO ims_item VALUES ('03-264', 'Tee 3" Flange', '0', '0.0', '0.0', '2025-03-07 05:25:25.548378', '2025-03-07 05:25:25.548385', '3', '19');
INSERT INTO ims_item VALUES ('03-265', 'Tee 3" GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.566430', '2025-03-07 05:25:25.566439', '3', '19');
INSERT INTO ims_item VALUES ('03-266', 'Tee 3" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.586248', '2025-03-07 05:25:25.586257', '3', '19');
INSERT INTO ims_item VALUES ('03-267', 'Tee 3/4" GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.604674', '2025-03-07 05:25:25.604681', '3', '1');
INSERT INTO ims_item VALUES ('03-268', 'Tee 3/4"HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.623554', '2025-03-07 05:25:25.623561', '3', '1');
INSERT INTO ims_item VALUES ('03-269', 'Tee 4" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.643553', '2025-03-07 05:25:25.643560', '3', '19');
INSERT INTO ims_item VALUES ('03-270', 'Tee Reducer 1 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.662985', '2025-03-07 05:25:25.662993', '3', '19');
INSERT INTO ims_item VALUES ('03-271', 'Tee Reducer 1" x 1/2 GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.683162', '2025-03-07 05:25:25.683169', '3', '19');
INSERT INTO ims_item VALUES ('03-272', 'Tee Reducer 1/2 x 3/4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.708920', '2025-03-07 05:25:25.708931', '3', '19');
INSERT INTO ims_item VALUES ('03-273', 'Tee Reducer 3 x 2 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.732717', '2025-03-07 05:25:25.732727', '3', '19');
INSERT INTO ims_item VALUES ('03-274', 'Tee Reducer 4 x 2 HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:25.758235', '2025-03-07 05:25:25.758243', '3', '19');
INSERT INTO ims_item VALUES ('03-275', 'Tee Reducer 4 x 3 HDPE- FISH', '0', '0.0', '0.0', '2025-03-07 05:25:25.779888', '2025-03-07 05:25:25.779896', '3', '19');
INSERT INTO ims_item VALUES ('03-276', 'Tee 6" Flange', '0', '0.0', '0.0', '2025-03-07 05:25:25.802835', '2025-03-07 05:25:25.802843', '3', '19');
INSERT INTO ims_item VALUES ('03-277', 'Tee 6 x 4  Mechanical CI', '0', '0.0', '0.0', '2025-03-07 05:25:25.821082', '2025-03-07 05:25:25.821089', '3', '19');
INSERT INTO ims_item VALUES ('03-278', 'Valve Cover - 4" GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.839488', '2025-03-07 05:25:25.839495', '3', '19');
INSERT INTO ims_item VALUES ('03-279', 'Valve Cover - 6" G.I.', '0', '0.0', '0.0', '2025-03-07 05:25:25.858358', '2025-03-07 05:25:25.858365', '3', '19');
INSERT INTO ims_item VALUES ('03-280', 'Y-connector with ferrul 3/4"', '0', '0.0', '0.0', '2025-03-07 05:25:25.876915', '2025-03-07 05:25:25.876923', '3', '19');
INSERT INTO ims_item VALUES ('03-281', 'Y-Strainer 2"', '0', '0.0', '0.0', '2025-03-07 05:25:25.895460', '2025-03-07 05:25:25.895472', '3', '19');
INSERT INTO ims_item VALUES ('03-282', 'Y-Strainer 3"', '0', '0.0', '0.0', '2025-03-07 05:25:25.914163', '2025-03-07 05:25:25.914170', '3', '19');
INSERT INTO ims_item VALUES ('03-283', 'Y-Strainer 4"', '0', '0.0', '0.0', '2025-03-07 05:25:25.932829', '2025-03-07 05:25:25.932836', '3', '19');
INSERT INTO ims_item VALUES ('03-284', 'Y-Strainer 6" Flange', '0', '0.0', '0.0', '2025-03-07 05:25:25.951279', '2025-03-07 05:25:25.951288', '3', '19');
INSERT INTO ims_item VALUES ('03-285', 'Elbow 6 x 45 deg (sched 80) GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.969871', '2025-03-07 05:25:25.969879', '3', '19');
INSERT INTO ims_item VALUES ('03-286', 'Elbow 6 x 90 deg (sched 80) GI', '0', '0.0', '0.0', '2025-03-07 05:25:25.988599', '2025-03-07 05:25:25.988606', '3', '19');
INSERT INTO ims_item VALUES ('03-287', 'STC (GI-HDPE) 6" - BLACK', '0', '0.0', '0.0', '2025-03-07 05:25:26.006771', '2025-03-07 05:25:26.006779', '3', '19');
INSERT INTO ims_item VALUES ('03-288', 'STC (GI-PVC) 2"', '0', '0.0', '0.0', '2025-03-07 05:25:26.029516', '2025-03-07 05:25:26.029523', '3', '19');
INSERT INTO ims_item VALUES ('03-289', 'STC (GI-PVC) 4"', '0', '0.0', '0.0', '2025-03-07 05:25:26.048875', '2025-03-07 05:25:26.048882', '3', '19');
INSERT INTO ims_item VALUES ('03-290', 'Checkvalve 3" GI', '0', '0.0', '0.0', '2025-03-07 05:25:26.067361', '2025-03-07 05:25:26.067369', '3', '19');
INSERT INTO ims_item VALUES ('03-291', 'Cross Tee Fabricated HDPE 4"', '0', '0.0', '0.0', '2025-03-07 05:25:26.086656', '2025-03-07 05:25:26.086664', '3', '19');
INSERT INTO ims_item VALUES ('03-292', 'Cross Tee HDPE 3"', '0', '0.0', '0.0', '2025-03-07 05:25:26.104869', '2025-03-07 05:25:26.104876', '3', '19');
INSERT INTO ims_item VALUES ('03-293', 'Cross Tee HDPE 4x3', '0', '0.0', '0.0', '2025-03-07 05:25:26.122565', '2025-03-07 05:25:26.122572', '3', '19');
INSERT INTO ims_item VALUES ('03-294', 'Cross Tee HDPE 6x3', '0', '0.0', '0.0', '2025-03-07 05:25:26.141227', '2025-03-07 05:25:26.141234', '3', '19');
INSERT INTO ims_item VALUES ('03-295', 'Cross Tee HDPE 6x4', '0', '0.0', '0.0', '2025-03-07 05:25:26.161635', '2025-03-07 05:25:26.161642', '3', '19');
INSERT INTO ims_item VALUES ('03-296', 'Nipple 1"x24" GI (sched 80)', '0', '0.0', '0.0', '2025-03-07 05:25:26.179483', '2025-03-07 05:25:26.179491', '3', '19');
INSERT INTO ims_item VALUES ('03-297', 'Coupling Reducer 1" x 3/4" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:26.197884', '2025-03-07 05:25:26.197897', '3', '19');
INSERT INTO ims_item VALUES ('03-298', 'Tee w/ Thread 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:26.216637', '2025-03-07 05:25:26.216645', '3', '19');
INSERT INTO ims_item VALUES ('03-299', 'Elbow 4 x 90 sched80', '0', '0.0', '0.0', '2025-03-07 05:25:26.237290', '2025-03-07 05:25:26.237299', '3', '19');
INSERT INTO ims_item VALUES ('03-300', 'STC 4" ( GI to HDPE) DI - BLUE', '0', '0.0', '0.0', '2025-03-07 05:25:26.256727', '2025-03-07 05:25:26.256735', '3', '19');
INSERT INTO ims_item VALUES ('03-301', 'Cross Tee HDPE 3 x 2 - fabricated', '0', '0.0', '0.0', '2025-03-07 05:25:26.275433', '2025-03-07 05:25:26.275441', '3', '19');
INSERT INTO ims_item VALUES ('03-302', 'STC 3" (GI to HDPE)', '0', '0.0', '0.0', '2025-03-07 05:25:26.293778', '2025-03-07 05:25:26.293785', '3', '19');
INSERT INTO ims_item VALUES ('03-303', 'Elbow 3" GI 90deg (sched 80)', '0', '0.0', '0.0', '2025-03-07 05:25:26.312865', '2025-03-07 05:25:26.312873', '3', '19');
INSERT INTO ims_item VALUES ('03-304', 'STC 8"', '0', '0.0', '0.0', '2025-03-07 05:25:26.331504', '2025-03-07 05:25:26.331512', '3', '19');
INSERT INTO ims_item VALUES ('03-305', 'Elbow 3" 45 deg. (schd.80)', '0', '0.0', '0.0', '2025-03-07 05:25:26.350427', '2025-03-07 05:25:26.350435', '3', '19');
INSERT INTO ims_item VALUES ('03-306', 'Gate Valve Flange type 8" w/ bang', '0', '0.0', '0.0', '2025-03-07 05:25:26.368282', '2025-03-07 05:25:26.368289', '3', '19');
INSERT INTO ims_item VALUES ('03-307', 'Nipple 1/2 x 5', '0', '0.0', '0.0', '2025-03-07 05:25:26.387244', '2025-03-07 05:25:26.387253', '3', '19');
INSERT INTO ims_item VALUES ('03-308', 'Elbow 8 x 90 deg. - HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:26.407334', '2025-03-07 05:25:26.407341', '3', '19');
INSERT INTO ims_item VALUES ('03-309', 'Coupling Reducer 8 x 6 - HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:26.426695', '2025-03-07 05:25:26.426705', '3', '19');
INSERT INTO ims_item VALUES ('03-310', 'Fabricated Coupling 6 x 8', '0', '0.0', '0.0', '2025-03-07 05:25:26.447517', '2025-03-07 05:25:26.447524', '3', '19');
INSERT INTO ims_item VALUES ('03-311', 'Check Valve 3/4- Brass', '0', '0.0', '0.0', '2025-03-07 05:25:26.468042', '2025-03-07 05:25:26.468049', '3', '19');
INSERT INTO ims_item VALUES ('03-312', 'Valve Cover 6" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:26.486250', '2025-03-07 05:25:26.486257', '3', '19');
INSERT INTO ims_item VALUES ('03-313', 'Fabricated Elbow 4 x 90 deg. HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:26.506819', '2025-03-07 05:25:26.506829', '3', '19');
INSERT INTO ims_item VALUES ('03-314', 'Fabricated Elbow 6 x 90 deg. HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:26.528481', '2025-03-07 05:25:26.528489', '3', '19');
INSERT INTO ims_item VALUES ('03-315', 'Fabricated Elbow 8 x 45 deg. HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:26.549035', '2025-03-07 05:25:26.549043', '3', '19');
INSERT INTO ims_item VALUES ('03-316', 'Coupling Reducer 8 x 4 - HDPE ( Fabricated)', '0', '0.0', '0.0', '2025-03-07 05:25:26.567543', '2025-03-07 05:25:26.567550', '3', '19');
INSERT INTO ims_item VALUES ('03-317', 'Coupling Reducer 8 x 6 - HDPE ( Fabricated)', '0', '0.0', '0.0', '2025-03-07 05:25:26.586628', '2025-03-07 05:25:26.586635', '3', '19');
INSERT INTO ims_item VALUES ('03-318', 'Gasket- 6"', '0', '0.0', '0.0', '2025-03-07 05:25:26.605986', '2025-03-07 05:25:26.605993', '3', '19');
INSERT INTO ims_item VALUES ('03-319', 'DI Gate Valve Flange Type 8"', '0', '0.0', '0.0', '2025-03-07 05:25:26.623611', '2025-03-07 05:25:26.623619', '3', '19');
INSERT INTO ims_item VALUES ('03-320', 'Bolt and nut 5/8 x 8- Full Thread', '0', '0.0', '0.0', '2025-03-07 05:25:26.642646', '2025-03-07 05:25:26.642654', '3', '19');
INSERT INTO ims_item VALUES ('03-321', 'Full thread 3/4 x 10 ft.', '0', '0.0', '0.0', '2025-03-07 05:25:26.665132', '2025-03-07 05:25:26.665139', '3', '19');
INSERT INTO ims_item VALUES ('03-322', 'Bell Reducer 5 x 4 GI', '0', '0.0', '0.0', '2025-03-07 05:25:26.684431', '2025-03-07 05:25:26.684440', '3', '19');
INSERT INTO ims_item VALUES ('03-323', 'Tee 4" Flange type CI', '0', '0.0', '0.0', '2025-03-07 05:25:26.702765', '2025-03-07 05:25:26.702773', '3', '19');
INSERT INTO ims_item VALUES ('03-324', 'Nut GI - 5/8"- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:26.721194', '2025-03-07 05:25:26.721203', '3', '19');
INSERT INTO ims_item VALUES ('03-325', 'Bell Reducer GI 1/2 x 3/4 - JB', '0', '0.0', '0.0', '2025-03-07 05:25:26.740536', '2025-03-07 05:25:26.740550', '3', '19');
INSERT INTO ims_item VALUES ('03-326', 'End Cap 3/4 GI - MECH', '0', '0.0', '0.0', '2025-03-07 05:25:26.759953', '2025-03-07 05:25:26.759961', '3', '19');
INSERT INTO ims_item VALUES ('03-327', 'End Plug 3/4 GI - JB', '0', '0.0', '0.0', '2025-03-07 05:25:26.778226', '2025-03-07 05:25:26.778233', '3', '19');
INSERT INTO ims_item VALUES ('03-328', 'End Plug 1"GI - JB', '0', '0.0', '0.0', '2025-03-07 05:25:26.797150', '2025-03-07 05:25:26.797156', '3', '19');
INSERT INTO ims_item VALUES ('03-329', 'Nipple 3/4 x 5 GI - JB', '0', '0.0', '0.0', '2025-03-07 05:25:26.816768', '2025-03-07 05:25:26.816776', '3', '19');
INSERT INTO ims_item VALUES ('03-330', 'Nipple 3/4 x 8 GI - FS', '0', '0.0', '0.0', '2025-03-07 05:25:26.835692', '2025-03-07 05:25:26.835699', '3', '19');
INSERT INTO ims_item VALUES ('03-331', 'Nipple 1 x 5 GI - AKUA', '0', '0.0', '0.0', '2025-03-07 05:25:26.854848', '2025-03-07 05:25:26.854858', '3', '19');
INSERT INTO ims_item VALUES ('03-332', 'Nipple 1 x 8 GI - AKUA', '0', '0.0', '0.0', '2025-03-07 05:25:26.874316', '2025-03-07 05:25:26.874324', '3', '19');
INSERT INTO ims_item VALUES ('03-333', 'Saddle Clamp 3 x 3/4 DI - PV', '0', '0.0', '0.0', '2025-03-07 05:25:26.893597', '2025-03-07 05:25:26.893603', '3', '19');
INSERT INTO ims_item VALUES ('03-334', 'Saddle Clamp 6 x 1 DI - PV', '0', '0.0', '0.0', '2025-03-07 05:25:26.913166', '2025-03-07 05:25:26.913174', '3', '19');
INSERT INTO ims_item VALUES ('03-335', 'Sleeve-Type Coupling 3" DI pvc to pvc- BOHAI', '0', '0.0', '0.0', '2025-03-07 05:25:26.932766', '2025-03-07 05:25:26.932773', '3', '19');
INSERT INTO ims_item VALUES ('03-336', 'Sleeve-Type Coupling 4" DI pvc to pvc- BOHAI', '0', '0.0', '0.0', '2025-03-07 05:25:26.951621', '2025-03-07 05:25:26.951628', '3', '19');
INSERT INTO ims_item VALUES ('03-337', 'Sleeve-Type Coupling 6" DI (PVC to PVC)- BOHAI', '0', '0.0', '0.0', '2025-03-07 05:25:26.971222', '2025-03-07 05:25:26.971232', '3', '19');
INSERT INTO ims_item VALUES ('03-338', 'Male Adaptor 3/4 nlc- PBP', '0', '0.0', '0.0', '2025-03-07 05:25:26.990775', '2025-03-07 05:25:26.990784', '3', '19');
INSERT INTO ims_item VALUES ('03-339', 'Male Adaptor 1 nlc- PBP', '0', '0.0', '0.0', '2025-03-07 05:25:27.009854', '2025-03-07 05:25:27.009861', '3', '19');
INSERT INTO ims_item VALUES ('03-340', 'PVC Pipe 1/2 w/ hub- NELTEX', '0', '0.0', '0.0', '2025-03-07 05:25:27.029578', '2025-03-07 05:25:27.029586', '3', '19');
INSERT INTO ims_item VALUES ('03-341', 'Male Adaptor 1/2 PVC- TIAN BLUE', '0', '0.0', '0.0', '2025-03-07 05:25:27.047930', '2025-03-07 05:25:27.047937', '3', '19');
INSERT INTO ims_item VALUES ('03-342', 'Coupling 1/2 PVC- TIAN BLUE', '0', '0.0', '0.0', '2025-03-07 05:25:27.067354', '2025-03-07 05:25:27.067361', '3', '19');
INSERT INTO ims_item VALUES ('03-343', 'Elbow Plain 1/2 PVC- TIAN BLUE', '0', '0.0', '0.0', '2025-03-07 05:25:27.086841', '2025-03-07 05:25:27.086848', '3', '19');
INSERT INTO ims_item VALUES ('03-344', 'Repair Clamp 2" HDPE -MIE', '0', '0.0', '0.0', '2025-03-07 05:25:27.106970', '2025-03-07 05:25:27.106978', '3', '19');
INSERT INTO ims_item VALUES ('03-345', 'Repair Clamp 3" HDPE -MIE', '0', '0.0', '0.0', '2025-03-07 05:25:27.126958', '2025-03-07 05:25:27.126966', '3', '19');
INSERT INTO ims_item VALUES ('03-346', 'Tee Reducer 1 x 3/4 GI - JB', '0', '0.0', '0.0', '2025-03-07 05:25:27.146625', '2025-03-07 05:25:27.146633', '3', '19');
INSERT INTO ims_item VALUES ('03-347', 'Tee 3/4 GI - JB', '0', '0.0', '0.0', '2025-03-07 05:25:27.166432', '2025-03-07 05:25:27.166442', '3', '19');
INSERT INTO ims_item VALUES ('03-348', 'Nipple 1/2 x 1 GI - MICRO', '0', '0.0', '0.0', '2025-03-07 05:25:27.187072', '2025-03-07 05:25:27.187082', '3', '19');
INSERT INTO ims_item VALUES ('03-349', 'Nipple 1/2 x 2 GI - MICRO', '0', '0.0', '0.0', '2025-03-07 05:25:27.207797', '2025-03-07 05:25:27.207806', '3', '19');
INSERT INTO ims_item VALUES ('03-350', 'Coupling 1" HDPE - FISH', '0', '0.0', '0.0', '2025-03-07 05:25:27.227333', '2025-03-07 05:25:27.227340', '3', '19');
INSERT INTO ims_item VALUES ('03-351', 'Female Elbow 1/2 HDPE- PBP', '0', '0.0', '0.0', '2025-03-07 05:25:27.247995', '2025-03-07 05:25:27.248002', '3', '19');
INSERT INTO ims_item VALUES ('03-352', 'DI Sleeve type coupling pvc-pvc 4"- HIWA', '0', '0.0', '0.0', '2025-03-07 05:25:27.267376', '2025-03-07 05:25:27.267389', '3', '19');
INSERT INTO ims_item VALUES ('03-353', 'DI Sleeve type coupling pvc-pvc 6"-HIWA', '0', '0.0', '0.0', '2025-03-07 05:25:27.288207', '2025-03-07 05:25:27.288215', '3', '19');
INSERT INTO ims_item VALUES ('03-354', 'CI Sleeve Type coupling pvc- GI 6"- CMI', '0', '0.0', '0.0', '2025-03-07 05:25:27.306455', '2025-03-07 05:25:27.306463', '3', '19');
INSERT INTO ims_item VALUES ('03-355', 'Flow meter 4" Paddle Wheel Type- ZENNER', '0', '0.0', '0.0', '2025-03-07 05:25:27.326218', '2025-03-07 05:25:27.326226', '3', '19');
INSERT INTO ims_item VALUES ('03-356', 'Flow meter 6" Paddle Wheel Type- ZENNER', '0', '0.0', '0.0', '2025-03-07 05:25:27.345692', '2025-03-07 05:25:27.345699', '3', '19');
INSERT INTO ims_item VALUES ('03-357', 'GASKET 4- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:27.364513', '2025-03-07 05:25:27.364521', '3', '19');
INSERT INTO ims_item VALUES ('03-358', 'STC 4" ( GI to GI)- CMI', '0', '0.0', '0.0', '2025-03-07 05:25:27.382996', '2025-03-07 05:25:27.383003', '3', '19');
INSERT INTO ims_item VALUES ('03-359', 'Check Valve 1/2 Brass- ACE', '0', '0.0', '0.0', '2025-03-07 05:25:27.401394', '2025-03-07 05:25:27.401401', '3', '19');
INSERT INTO ims_item VALUES ('03-360', 'Ball Valve 1/2 Lockwing -ACE', '0', '0.0', '0.0', '2025-03-07 05:25:27.420877', '2025-03-07 05:25:27.420884', '3', '19');
INSERT INTO ims_item VALUES ('03-361', 'Nipple 1/2 x 12 GI - JB', '0', '0.0', '0.0', '2025-03-07 05:25:27.440646', '2025-03-07 05:25:27.440660', '3', '19');
INSERT INTO ims_item VALUES ('03-362', 'Male Adaptor 1/2 HDPE- PBP', '0', '0.0', '0.0', '2025-03-07 05:25:27.461200', '2025-03-07 05:25:27.461207', '3', '19');
INSERT INTO ims_item VALUES ('04-001', 'Pipe 1" HDPE- MIG', '0', '0.0', '0.0', '2025-03-07 05:25:27.480336', '2025-03-07 05:25:27.480343', '4', '19');
INSERT INTO ims_item VALUES ('04-002', 'Pipe 1" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:27.499858', '2025-03-07 05:25:27.499865', '4', '14');
INSERT INTO ims_item VALUES ('04-003', 'Pipe 1/2 HDPE - MIG', '0', '0.0', '0.0', '2025-03-07 05:25:27.517852', '2025-03-07 05:25:27.517861', '4', '14');
INSERT INTO ims_item VALUES ('04-004', 'Pipe 1/2 PVC', '0', '0.0', '0.0', '2025-03-07 05:25:27.537239', '2025-03-07 05:25:27.537246', '4', '14');
INSERT INTO ims_item VALUES ('04-005', 'Pipe 2" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:27.555338', '2025-03-07 05:25:27.555348', '4', '14');
INSERT INTO ims_item VALUES ('04-006', 'Pipe 3" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:27.573645', '2025-03-07 05:25:27.573652', '4', '14');
INSERT INTO ims_item VALUES ('04-007', 'Pipe 3" RISER PIPE', '0', '0.0', '0.0', '2025-03-07 05:25:27.592995', '2025-03-07 05:25:27.593002', '4', '14');
INSERT INTO ims_item VALUES ('04-008', 'Pipe 3/4 HDPE - MIG', '0', '0.0', '0.0', '2025-03-07 05:25:27.611253', '2025-03-07 05:25:27.611265', '4', '19');
INSERT INTO ims_item VALUES ('04-009', 'Pipe 4" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:27.631125', '2025-03-07 05:25:27.631138', '4', '14');
INSERT INTO ims_item VALUES ('04-010', 'Pipe 4" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:27.650871', '2025-03-07 05:25:27.650878', '4', '14');
INSERT INTO ims_item VALUES ('04-011', 'Pipe 4" RISER HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:27.669405', '2025-03-07 05:25:27.669413', '4', '19');
INSERT INTO ims_item VALUES ('04-012', 'Pipe 4" GI', '0', '0.0', '0.0', '2025-03-07 05:25:27.688348', '2025-03-07 05:25:27.688357', '4', '19');
INSERT INTO ims_item VALUES ('04-013', 'Pipe 6" GI (sched 80)', '0', '0.0', '0.0', '2025-03-07 05:25:27.709449', '2025-03-07 05:25:27.709460', '4', '19');
INSERT INTO ims_item VALUES ('04-014', 'Pipe 6" HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:27.729903', '2025-03-07 05:25:27.729911', '4', '19');
INSERT INTO ims_item VALUES ('04-015', 'Pipe 8" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:27.750738', '2025-03-07 05:25:27.750748', '4', '19');
INSERT INTO ims_item VALUES ('04-016', 'Pipe 10" PVC', '0', '0.0', '0.0', '2025-03-07 05:25:27.772435', '2025-03-07 05:25:27.772442', '4', '19');
INSERT INTO ims_item VALUES ('04-017', 'Pipe RISER 4" GI', '0', '0.0', '0.0', '2025-03-07 05:25:27.792488', '2025-03-07 05:25:27.792499', '4', '19');
INSERT INTO ims_item VALUES ('04-018', 'Pipe 3" GI (sched 80)', '0', '0.0', '0.0', '2025-03-07 05:25:27.813666', '2025-03-07 05:25:27.813677', '4', '19');
INSERT INTO ims_item VALUES ('04-019', 'Pipe 8" - HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:27.834017', '2025-03-07 05:25:27.834024', '4', '19');
INSERT INTO ims_item VALUES ('04-020', 'Pipe 1 1/2 GI LSII', '0', '0.0', '0.0', '2025-03-07 05:25:27.851739', '2025-03-07 05:25:27.851746', '4', '19');
INSERT INTO ims_item VALUES ('04-021', 'Pipe 1 1 /2 GI s20', '0', '0.0', '0.0', '2025-03-07 05:25:27.871527', '2025-03-07 05:25:27.871536', '4', '19');
INSERT INTO ims_item VALUES ('05-001', 'Flow Meter 2"', '0', '0.0', '0.0', '2025-03-07 05:25:27.890831', '2025-03-07 05:25:27.890838', '5', '19');
INSERT INTO ims_item VALUES ('05-002', 'Flow Meter 3"- ZENNER', '0', '0.0', '0.0', '2025-03-07 05:25:27.910935', '2025-03-07 05:25:27.910943', '5', '19');
INSERT INTO ims_item VALUES ('05-003', 'Flow Meter 4"', '0', '0.0', '0.0', '2025-03-07 05:25:27.928876', '2025-03-07 05:25:27.928884', '5', '19');
INSERT INTO ims_item VALUES ('05-004', 'Flow Meter 6"', '0', '0.0', '0.0', '2025-03-07 05:25:27.947783', '2025-03-07 05:25:27.947791', '5', '19');
INSERT INTO ims_item VALUES ('05-005', 'Water Meter - Brass 1/2" - HYJET', '0', '0.0', '0.0', '2025-03-07 05:25:27.967414', '2025-03-07 05:25:27.967422', '5', '19');
INSERT INTO ims_item VALUES ('05-006', 'Water Meter - Plastic 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:27.987938', '2025-03-07 05:25:27.987945', '5', '19');
INSERT INTO ims_item VALUES ('05-007', 'Water Meter 3/4 - Brass - ACE', '0', '0.0', '0.0', '2025-03-07 05:25:28.007514', '2025-03-07 05:25:28.007522', '5', '19');
INSERT INTO ims_item VALUES ('05-008', 'Water Meter - Brass 1" - ACE', '0', '0.0', '0.0', '2025-03-07 05:25:28.027070', '2025-03-07 05:25:28.027079', '5', '19');
INSERT INTO ims_item VALUES ('05-009', 'Water Meter - Brass 2"', '0', '0.0', '0.0', '2025-03-07 05:25:28.047866', '2025-03-07 05:25:28.047876', '5', '19');
INSERT INTO ims_item VALUES ('06-001', 'Chemical Solution Tank 100L', '0', '0.0', '0.0', '2025-03-07 05:25:28.067373', '2025-03-07 05:25:28.067380', '6', '9');
INSERT INTO ims_item VALUES ('06-002', 'Caution Tape', '0', '0.0', '0.0', '2025-03-07 05:25:28.088130', '2025-03-07 05:25:28.088137', '6', '19');
INSERT INTO ims_item VALUES ('06-003', 'Fire Hydrant Head 2 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:28.107281', '2025-03-07 05:25:28.107288', '6', '19');
INSERT INTO ims_item VALUES ('06-004', 'Fire Hydrant Head 3 X 2 1/2', '0', '0.0', '0.0', '2025-03-07 05:25:28.125668', '2025-03-07 05:25:28.125676', '6', '19');
INSERT INTO ims_item VALUES ('06-005', 'Pressure Gauge 0-60 PSI', '0', '0.0', '0.0', '2025-03-07 05:25:28.145803', '2025-03-07 05:25:28.145811', '6', '19');
INSERT INTO ims_item VALUES ('06-006', 'Pressure Reducer Valve 3"', '0', '0.0', '0.0', '2025-03-07 05:25:28.164832', '2025-03-07 05:25:28.164839', '6', '19');
INSERT INTO ims_item VALUES ('06-007', 'Pressure Reducer Valve 4"', '0', '0.0', '0.0', '2025-03-07 05:25:28.183963', '2025-03-07 05:25:28.183970', '6', '19');
INSERT INTO ims_item VALUES ('06-008', 'Pressure Reducer Valve 6"', '0', '0.0', '0.0', '2025-03-07 05:25:28.203250', '2025-03-07 05:25:28.203257', '6', '19');
INSERT INTO ims_item VALUES ('06-009', 'PVC Pipe Cement- ATLANTA', '0', '0.0', '0.0', '2025-03-07 05:25:28.221190', '2025-03-07 05:25:28.221199', '6', '19');
INSERT INTO ims_item VALUES ('06-010', 'Padlock', '0', '0.0', '0.0', '2025-03-07 05:25:28.241266', '2025-03-07 05:25:28.241273', '6', '19');
INSERT INTO ims_item VALUES ('06-011', 'Hacksaw Blade 12" Sandflex', '0', '0.0', '0.0', '2025-03-07 05:25:28.260190', '2025-03-07 05:25:28.260197', '6', '19');
INSERT INTO ims_item VALUES ('06-012', 'Teflon Tape - ROYAL', '0', '0.0', '0.0', '2025-03-07 05:25:28.279795', '2025-03-07 05:25:28.279802', '6', '19');
INSERT INTO ims_item VALUES ('06-013', 'Pressure Gauge 100 PSI', '0', '0.0', '0.0', '2025-03-07 05:25:28.300650', '2025-03-07 05:25:28.300658', '6', '19');
INSERT INTO ims_item VALUES ('06-014', 'Concrete Cutter Blade 14"', '0', '0.0', '0.0', '2025-03-07 05:25:28.319427', '2025-03-07 05:25:28.319435', '6', '19');
INSERT INTO ims_item VALUES ('06-015', 'Chemical Solution Tank 200L', '0', '0.0', '0.0', '2025-03-07 05:25:28.337757', '2025-03-07 05:25:28.337765', '6', '9');
INSERT INTO ims_item VALUES ('06-016', 'Pressure Gauge 300 PSI', '0', '0.0', '0.0', '2025-03-07 05:25:28.357769', '2025-03-07 05:25:28.357780', '6', '19');
INSERT INTO ims_item VALUES ('06-017', 'GI Bolts & Nuts 5/8 5" (Fullthread)- LOCAL', '0', '0.0', '0.0', '2025-03-07 05:25:28.377075', '2025-03-07 05:25:28.377083', '6', '19');
INSERT INTO ims_item VALUES ('06-018', 'Rubber O-ring 4" PVC sure lock riser pipe', '0', '0.0', '0.0', '2025-03-07 05:25:28.395626', '2025-03-07 05:25:28.395634', '6', '19');
INSERT INTO ims_item VALUES ('06-019', 'Bolt & Nut  w/ washer', '0', '0.0', '0.0', '2025-03-07 05:25:28.415948', '2025-03-07 05:25:28.415959', '6', '19');
INSERT INTO ims_item VALUES ('06-020', 'Bolt & Nut m-6 x 20 w/ washer', '0', '0.0', '0.0', '2025-03-07 05:25:28.437718', '2025-03-07 05:25:28.437726', '6', '19');
INSERT INTO ims_item VALUES ('06-021', 'Lock Washer', '0', '0.0', '0.0', '2025-03-07 05:25:28.459176', '2025-03-07 05:25:28.459184', '6', '19');
INSERT INTO ims_item VALUES ('06-022', 'PE Hose 4 x 6 - white', '0', '0.0', '0.0', '2025-03-07 05:25:28.477765', '2025-03-07 05:25:28.477772', '6', '20');
INSERT INTO ims_item VALUES ('06-023', 'Bolt and Nut 3/4 x 4 -full thread', '0', '0.0', '0.0', '2025-03-07 05:25:28.502332', '2025-03-07 05:25:28.502341', '6', '19');
INSERT INTO ims_item VALUES ('06-024', 'Cutting Disc 4"- BLUE SHARK', '0', '0.0', '0.0', '2025-03-07 05:25:28.530231', '2025-03-07 05:25:28.530241', '6', '19');
INSERT INTO ims_item VALUES ('06-025', 'Cut Off 14"', '0', '0.0', '0.0', '2025-03-07 05:25:28.554988', '2025-03-07 05:25:28.554998', '6', '19');
INSERT INTO ims_item VALUES ('06-026', 'Saddle Clamp w/ Ferrule - 8 x 1 - HDPE', '0', '0.0', '0.0', '2025-03-07 05:25:28.579282', '2025-03-07 05:25:28.579292', '6', '19');
INSERT INTO ims_item VALUES ('06-027', 'New Other Materials', '0', '0.0', '0.0', '2025-03-07 05:25:28.602958', '2025-03-07 05:25:28.602967', '6', '1');

CREATE TABLE `ims_measurement` (
  `measurementID` int NOT NULL AUTO_INCREMENT,
  `measureName` varchar(500) NOT NULL,
  PRIMARY KEY (`measurementID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO ims_measurement VALUES ('1', 'N/A');
INSERT INTO ims_measurement VALUES ('2', 'gal');
INSERT INTO ims_measurement VALUES ('3', 'bag');
INSERT INTO ims_measurement VALUES ('4', 'bags');
INSERT INTO ims_measurement VALUES ('5', 'box');
INSERT INTO ims_measurement VALUES ('6', 'bot');
INSERT INTO ims_measurement VALUES ('7', 'bundle');
INSERT INTO ims_measurement VALUES ('8', 'Can');
INSERT INTO ims_measurement VALUES ('9', 'drum');
INSERT INTO ims_measurement VALUES ('10', 'drums');
INSERT INTO ims_measurement VALUES ('11', 'Kgs');
INSERT INTO ims_measurement VALUES ('12', 'Lt');
INSERT INTO ims_measurement VALUES ('13', 'ltr');
INSERT INTO ims_measurement VALUES ('14', 'mtr');
INSERT INTO ims_measurement VALUES ('15', 'mtrs');
INSERT INTO ims_measurement VALUES ('16', 'pack');
INSERT INTO ims_measurement VALUES ('17', 'Pail');
INSERT INTO ims_measurement VALUES ('18', 'pc');
INSERT INTO ims_measurement VALUES ('19', 'pcs');
INSERT INTO ims_measurement VALUES ('20', 'roll');
INSERT INTO ims_measurement VALUES ('21', 'set');
INSERT INTO ims_measurement VALUES ('22', 'sets');

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

INSERT INTO ims_monthlyconsumptiontotal VALUES ('1', '0', '-5100', '0', '0', '0', '0', '0', '0', '-5100', '0', '-5100', '0', '0', '0', '0', '0', '0', '-5100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '2025-03-07 05:34:10.450424', '2025-03-07 05:43:43.009137');

CREATE TABLE `ims_purpose` (
  `purposeID` int NOT NULL AUTO_INCREMENT,
  `purposeName` varchar(500) NOT NULL,
  PRIMARY KEY (`purposeID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO ims_purpose VALUES ('1', 'N/A');
INSERT INTO ims_purpose VALUES ('2', 'Construction');
INSERT INTO ims_purpose VALUES ('3', 'Disconnection');
INSERT INTO ims_purpose VALUES ('4', 'New Service Connection');
INSERT INTO ims_purpose VALUES ('5', 'Project');
INSERT INTO ims_purpose VALUES ('6', 'Repairs and Maintenance');
INSERT INTO ims_purpose VALUES ('7', 'Transfer,Defective');
INSERT INTO ims_purpose VALUES ('8', 'Re-connect');
INSERT INTO ims_purpose VALUES ('9', 'Physical Count Adjustment');
INSERT INTO ims_purpose VALUES ('10', 'Sales');
INSERT INTO ims_purpose VALUES ('11', 'Repair of Service Vehicle');

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

INSERT INTO ims_runningbalance VALUES ('2', 'Chlorine Dioxide - Liquid', '500', '0', '500', '0', '0', '0', '0', '0', '0', '255.0', '127500.00', 'Slow Moving', '2025-03-07 05:35:38.288378', '2025-03-07 05:35:38.288515', '01-001', '22');
INSERT INTO ims_runningbalance VALUES ('4', 'Chlorine Dioxide - Powder', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.341393', '2025-03-07 05:35:38.341525', '01-002', '9');
INSERT INTO ims_runningbalance VALUES ('6', 'Chlorine Granules', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.383657', '2025-03-07 05:35:38.383774', '01-003', '9');
INSERT INTO ims_runningbalance VALUES ('8', 'Asphalt', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.419852', '2025-03-07 05:35:38.419961', '02-001', '10');
INSERT INTO ims_runningbalance VALUES ('10', 'Cement- RIZAL', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.458618', '2025-03-07 05:35:38.458752', '02-002', '4');
INSERT INTO ims_runningbalance VALUES ('12', 'Gravel', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.496004', '2025-03-07 05:35:38.496149', '02-003', '19');
INSERT INTO ims_runningbalance VALUES ('14', 'White Sand', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.536615', '2025-03-07 05:35:38.536711', '02-004', '19');
INSERT INTO ims_runningbalance VALUES ('16', 'Concrete Hollow Blocks', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.572769', '2025-03-07 05:35:38.572867', '02-005', '1');
INSERT INTO ims_runningbalance VALUES ('18', 'Flexible Hose- Flexible Oppo', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.607556', '2025-03-07 05:35:38.607691', '02-006', '15');
INSERT INTO ims_runningbalance VALUES ('20', 'C-Clamp PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.651382', '2025-03-07 05:35:38.651514', '02-007', '19');
INSERT INTO ims_runningbalance VALUES ('22', 'THHN 14" - BOSTON', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.687450', '2025-03-07 05:35:38.687598', '02-008', '19');
INSERT INTO ims_runningbalance VALUES ('24', 'FI Hose 1/2 x 1/2 x 24', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.724434', '2025-03-07 05:35:38.724571', '02-009', '19');
INSERT INTO ims_runningbalance VALUES ('26', 'Flexible Hose 1/2 X 50 - OMEGA', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.762372', '2025-03-07 05:35:38.762546', '02-010', '20');
INSERT INTO ims_runningbalance VALUES ('28', 'Flexible Hose 3/8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.795963', '2025-03-07 05:35:38.796111', '02-011', '19');
INSERT INTO ims_runningbalance VALUES ('30', 'Skim Coat- ABC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.831820', '2025-03-07 05:35:38.831956', '02-012', '19');
INSERT INTO ims_runningbalance VALUES ('32', 'Angle Valve 1/2 x 3/8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.870684', '2025-03-07 05:35:38.870813', '02-013', '19');
INSERT INTO ims_runningbalance VALUES ('34', 'Angle Valve 1/2 x 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.909867', '2025-03-07 05:35:38.910017', '02-014', '19');
INSERT INTO ims_runningbalance VALUES ('36', 'Angle Valve 1/2 x 3/4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.944653', '2025-03-07 05:35:38.944799', '02-015', '19');
INSERT INTO ims_runningbalance VALUES ('38', 'C Purlins 2x3 GI 1.4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:38.986301', '2025-03-07 05:35:38.986433', '02-016', '19');
INSERT INTO ims_runningbalance VALUES ('39', 'Angel Bar 4.5mm x 2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.002581', '2025-03-07 05:35:39.002722', '02-017', '19');
INSERT INTO ims_runningbalance VALUES ('40', 'Goose Neck Faucet- SUNRISE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.046120', '2025-03-07 05:35:39.046266', '02-018', '19');
INSERT INTO ims_runningbalance VALUES ('41', 'Lavatory Valve', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.090650', '2025-03-07 05:35:39.090759', '02-019', '19');
INSERT INTO ims_runningbalance VALUES ('42', 'Faucet Brass hose Bibb- HAWK', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.124073', '2025-03-07 05:35:39.124183', '02-020', '19');
INSERT INTO ims_runningbalance VALUES ('43', 'Two-Way Faucet Valve', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.167781', '2025-03-07 05:35:39.167938', '02-021', '19');
INSERT INTO ims_runningbalance VALUES ('44', 'Lavatory Faucet', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.199442', '2025-03-07 05:35:39.199587', '02-022', '19');
INSERT INTO ims_runningbalance VALUES ('45', 'Diamond Cutting Disc', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.227523', '2025-03-07 05:35:39.227641', '02-023', '19');
INSERT INTO ims_runningbalance VALUES ('46', 'Cable Tie 6 x 2mm - POWER HOUSE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.259508', '2025-03-07 05:35:39.259630', '02-024', '16');
INSERT INTO ims_runningbalance VALUES ('47', 'Padlock - Hardware', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.296118', '2025-03-07 05:35:39.296274', '02-025', '19');
INSERT INTO ims_runningbalance VALUES ('48', 'Hardiflex 3/16 - JAMES HARDI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.323240', '2025-03-07 05:35:39.323343', '02-026', '19');
INSERT INTO ims_runningbalance VALUES ('49', 'Two Gang Outlet - ROYU', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.350377', '2025-03-07 05:35:39.350495', '02-027', '19');
INSERT INTO ims_runningbalance VALUES ('50', 'Hook', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.374578', '2025-03-07 05:35:39.374689', '02-028', '19');
INSERT INTO ims_runningbalance VALUES ('51', 'Aluminum Silver (PAINT)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.400188', '2025-03-07 05:35:39.400303', '02-029', '19');
INSERT INTO ims_runningbalance VALUES ('52', 'Welding Rod 6013 Special- LOCAL', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.427791', '2025-03-07 05:35:39.427929', '02-030', '11');
INSERT INTO ims_runningbalance VALUES ('53', 'Tie Wire', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.458055', '2025-03-07 05:35:39.458153', '02-031', '11');
INSERT INTO ims_runningbalance VALUES ('54', 'Bosny Black- Pylox', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.487273', '2025-03-07 05:35:39.487388', '02-032', '8');
INSERT INTO ims_runningbalance VALUES ('55', 'Electrical Tape- BIG Armak', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.512429', '2025-03-07 05:35:39.512615', '02-033', '19');
INSERT INTO ims_runningbalance VALUES ('56', 'Masking Tape 3/4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.544497', '2025-03-07 05:35:39.544619', '02-034', '19');
INSERT INTO ims_runningbalance VALUES ('57', 'Regular Plug', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.570670', '2025-03-07 05:35:39.570775', '02-035', '19');
INSERT INTO ims_runningbalance VALUES ('58', 'Three Gang Outlet', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.596236', '2025-03-07 05:35:39.596361', '02-036', '19');
INSERT INTO ims_runningbalance VALUES ('59', 'Marine Ply Wood - 3/4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.622457', '2025-03-07 05:35:39.622599', '02-037', '19');
INSERT INTO ims_runningbalance VALUES ('60', 'Barateha', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.648667', '2025-03-07 05:35:39.648792', '02-038', '19');
INSERT INTO ims_runningbalance VALUES ('61', 'Piano Hinges', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.674441', '2025-03-07 05:35:39.674544', '02-039', '19');
INSERT INTO ims_runningbalance VALUES ('62', 'Concrete Nail 1 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.698212', '2025-03-07 05:35:39.698353', '02-040', '11');
INSERT INTO ims_runningbalance VALUES ('63', 'Stikwel - Wood Glue', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.722117', '2025-03-07 05:35:39.722258', '02-041', '12');
INSERT INTO ims_runningbalance VALUES ('64', 'Cabinet Handle', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.747967', '2025-03-07 05:35:39.748090', '02-042', '19');
INSERT INTO ims_runningbalance VALUES ('65', 'Thalo blue - Acrylic', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.774134', '2025-03-07 05:35:39.774282', '02-043', '12');
INSERT INTO ims_runningbalance VALUES ('66', 'THHN 12" - BOSTON', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.797407', '2025-03-07 05:35:39.797542', '02-044', '5');
INSERT INTO ims_runningbalance VALUES ('67', 'THNN 14 - BOSTON', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.823360', '2025-03-07 05:35:39.823461', '02-045', '5');
INSERT INTO ims_runningbalance VALUES ('68', 'BLIND RIVITS 1/8 X 3/4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.849021', '2025-03-07 05:35:39.849160', '02-046', '5');
INSERT INTO ims_runningbalance VALUES ('69', 'Cement spoon', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.875288', '2025-03-07 05:35:39.875441', '02-047', '19');
INSERT INTO ims_runningbalance VALUES ('70', 'Tubular 1 x 1 1.4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.905202', '2025-03-07 05:35:39.905320', '02-048', '19');
INSERT INTO ims_runningbalance VALUES ('71', 'Cylindrical Hinges 3/4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.933294', '2025-03-07 05:35:39.933402', '02-049', '19');
INSERT INTO ims_runningbalance VALUES ('72', 'Door Knob', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.962143', '2025-03-07 05:35:39.962271', '02-050', '19');
INSERT INTO ims_runningbalance VALUES ('73', 'Deform Bar - 10mm', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:39.991610', '2025-03-07 05:35:39.991765', '02-051', '19');
INSERT INTO ims_runningbalance VALUES ('74', 'PVC Door 60 x 210 w/ Hinges', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.021140', '2025-03-07 05:35:40.021242', '02-052', '19');
INSERT INTO ims_runningbalance VALUES ('75', 'Blue Clamp 1/2 - Hardware', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.047983', '2025-03-07 05:35:40.048186', '02-053', '19');
INSERT INTO ims_runningbalance VALUES ('76', 'Solignum- All aroud', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.077320', '2025-03-07 05:35:40.077463', '02-054', '12');
INSERT INTO ims_runningbalance VALUES ('77', 'Liha - 1000 & 100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.106136', '2025-03-07 05:35:40.106242', '02-055', '19');
INSERT INTO ims_runningbalance VALUES ('78', 'Tansi', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.133414', '2025-03-07 05:35:40.133554', '02-056', '20');
INSERT INTO ims_runningbalance VALUES ('79', 'Drill bit 5/16', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.162266', '2025-03-07 05:35:40.162366', '02-057', '19');
INSERT INTO ims_runningbalance VALUES ('80', 'Chalk stone', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.190285', '2025-03-07 05:35:40.190422', '02-058', '19');
INSERT INTO ims_runningbalance VALUES ('81', 'Epoxy primer', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.225581', '2025-03-07 05:35:40.225686', '02-059', '12');
INSERT INTO ims_runningbalance VALUES ('82', 'Latex Gloss - Paint', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.253256', '2025-03-07 05:35:40.253372', '02-060', '12');
INSERT INTO ims_runningbalance VALUES ('83', 'Sahara- ( water proofing )', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.283143', '2025-03-07 05:35:40.283259', '02-061', '19');
INSERT INTO ims_runningbalance VALUES ('84', 'Singer Oil', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.313201', '2025-03-07 05:35:40.313316', '02-062', '19');
INSERT INTO ims_runningbalance VALUES ('85', 'Varnish', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.341419', '2025-03-07 05:35:40.341536', '02-063', '12');
INSERT INTO ims_runningbalance VALUES ('86', 'Rust Converter', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.367870', '2025-03-07 05:35:40.367977', '02-064', '19');
INSERT INTO ims_runningbalance VALUES ('87', 'WD - 40', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.392720', '2025-03-07 05:35:40.392827', '02-065', '19');
INSERT INTO ims_runningbalance VALUES ('88', 'Tape Measure', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.420276', '2025-03-07 05:35:40.420412', '02-066', '19');
INSERT INTO ims_runningbalance VALUES ('89', 'C. Clamp 3/4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.452076', '2025-03-07 05:35:40.452177', '02-067', '19');
INSERT INTO ims_runningbalance VALUES ('90', 'C. Clamp 1"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.475872', '2025-03-07 05:35:40.476015', '02-068', '19');
INSERT INTO ims_runningbalance VALUES ('91', 'Single Switch', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.504771', '2025-03-07 05:35:40.504901', '02-069', '19');
INSERT INTO ims_runningbalance VALUES ('92', 'Receptacle 4 x 4 - omni', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.536464', '2025-03-07 05:35:40.536608', '02-070', '19');
INSERT INTO ims_runningbalance VALUES ('93', 'Junction Box 4 x 4 - pvc', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.569716', '2025-03-07 05:35:40.569870', '02-071', '19');
INSERT INTO ims_runningbalance VALUES ('94', 'Utility Box 2 x 4 - pvc  - ROYU', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.596799', '2025-03-07 05:35:40.596908', '02-072', '19');
INSERT INTO ims_runningbalance VALUES ('95', '1 Gang Switch- Panasonic', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.625888', '2025-03-07 05:35:40.626036', '02-073', '21');
INSERT INTO ims_runningbalance VALUES ('96', '2 Gang Switch- Royu', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.655316', '2025-03-07 05:35:40.655457', '02-074', '21');
INSERT INTO ims_runningbalance VALUES ('97', 'Flat Hose 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.683473', '2025-03-07 05:35:40.683645', '02-075', '20');
INSERT INTO ims_runningbalance VALUES ('98', '2 Gang Outlet- Panasonic', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.710944', '2025-03-07 05:35:40.711091', '02-076', '21');
INSERT INTO ims_runningbalance VALUES ('99', 'Blind Rivits 5/32 x 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.738268', '2025-03-07 05:35:40.738389', '02-077', '5');
INSERT INTO ims_runningbalance VALUES ('100', 'Bathroom Bidet-  SUNRISE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.766534', '2025-03-07 05:35:40.766680', '02-078', '21');
INSERT INTO ims_runningbalance VALUES ('101', 'Concrete nail #2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.796498', '2025-03-07 05:35:40.796606', '02-079', '11');
INSERT INTO ims_runningbalance VALUES ('102', 'Concrete nail #3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.822418', '2025-03-07 05:35:40.822524', '02-080', '11');
INSERT INTO ims_runningbalance VALUES ('103', 'Tek screw 1 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.851972', '2025-03-07 05:35:40.852078', '02-081', '19');
INSERT INTO ims_runningbalance VALUES ('104', 'Hand Riveter', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.878308', '2025-03-07 05:35:40.878435', '02-082', '19');
INSERT INTO ims_runningbalance VALUES ('105', 'Tank Lever Flush', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.908332', '2025-03-07 05:35:40.908513', '02-083', '19');
INSERT INTO ims_runningbalance VALUES ('106', 'Tank Fittings', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.936238', '2025-03-07 05:35:40.936358', '02-084', '21');
INSERT INTO ims_runningbalance VALUES ('107', 'Electrical PVC Pipe 1/2 - (Orange)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.963011', '2025-03-07 05:35:40.963162', '02-085', '19');
INSERT INTO ims_runningbalance VALUES ('108', 'PVC Pipe 4" ( Orange )', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:40.991805', '2025-03-07 05:35:40.991969', '02-086', '19');
INSERT INTO ims_runningbalance VALUES ('109', 'Elbow  4" ( Orange )', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.019143', '2025-03-07 05:35:41.019253', '02-087', '19');
INSERT INTO ims_runningbalance VALUES ('110', 'Clean Out Cover 4" pvc', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.048292', '2025-03-07 05:35:41.048397', '02-088', '19');
INSERT INTO ims_runningbalance VALUES ('111', 'Pollituff', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.075499', '2025-03-07 05:35:41.075644', '02-089', '12');
INSERT INTO ims_runningbalance VALUES ('112', 'Hardener Cream', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.102659', '2025-03-07 05:35:41.102768', '02-090', '19');
INSERT INTO ims_runningbalance VALUES ('113', 'Submeter', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.127924', '2025-03-07 05:35:41.128072', '02-091', '19');
INSERT INTO ims_runningbalance VALUES ('114', 'Expansion Bolt 3/5 x 3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.159916', '2025-03-07 05:35:41.160052', '02-092', '19');
INSERT INTO ims_runningbalance VALUES ('115', 'Hinges 3 x 3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.188611', '2025-03-07 05:35:41.188714', '02-093', '19');
INSERT INTO ims_runningbalance VALUES ('116', 'Plug Adapter', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.216373', '2025-03-07 05:35:41.216538', '02-094', '19');
INSERT INTO ims_runningbalance VALUES ('117', 'Grinding Disc- For Finishing', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.244628', '2025-03-07 05:35:41.244733', '02-095', '19');
INSERT INTO ims_runningbalance VALUES ('118', 'Spatula', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.272873', '2025-03-07 05:35:41.272975', '02-096', '19');
INSERT INTO ims_runningbalance VALUES ('119', 'Wall Scrapper - (Paleta)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.301752', '2025-03-07 05:35:41.301900', '02-097', '19');
INSERT INTO ims_runningbalance VALUES ('120', 'Blind Rivits  1/8 x 1/2 - LOCAL', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.332852', '2025-03-07 05:35:41.332972', '02-098', '5');
INSERT INTO ims_runningbalance VALUES ('121', 'Gunting ng Yero', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.361347', '2025-03-07 05:35:41.361453', '02-099', '19');
INSERT INTO ims_runningbalance VALUES ('122', 'Paint Remover', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.389511', '2025-03-07 05:35:41.389634', '02-100', '19');
INSERT INTO ims_runningbalance VALUES ('123', 'Rugby', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.417006', '2025-03-07 05:35:41.417144', '02-101', '6');
INSERT INTO ims_runningbalance VALUES ('124', 'Rodela - Bakal', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.445957', '2025-03-07 05:35:41.446077', '02-102', '19');
INSERT INTO ims_runningbalance VALUES ('125', 'Rodela - Kahoy', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.479378', '2025-03-07 05:35:41.479508', '02-103', '19');
INSERT INTO ims_runningbalance VALUES ('126', 'Elasto Seal - water proofing sealant', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.507048', '2025-03-07 05:35:41.507205', '02-104', '19');
INSERT INTO ims_runningbalance VALUES ('127', 'Rope', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.537293', '2025-03-07 05:35:41.537423', '02-105', '14');
INSERT INTO ims_runningbalance VALUES ('128', 'Circuit Breaker - 60A PLUG IN- GE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.566696', '2025-03-07 05:35:41.566801', '02-106', '19');
INSERT INTO ims_runningbalance VALUES ('129', 'Toks screw', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.599566', '2025-03-07 05:35:41.599694', '02-107', '19');
INSERT INTO ims_runningbalance VALUES ('130', 'Elbow 2" Orange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.628568', '2025-03-07 05:35:41.628691', '02-108', '19');
INSERT INTO ims_runningbalance VALUES ('131', 'PVC 2" Orange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.657037', '2025-03-07 05:35:41.657154', '02-109', '19');
INSERT INTO ims_runningbalance VALUES ('132', 'Square Bar 10mm', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.681658', '2025-03-07 05:35:41.681818', '02-110', '19');
INSERT INTO ims_runningbalance VALUES ('133', 'Sealant', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.713755', '2025-03-07 05:35:41.713903', '02-111', '19');
INSERT INTO ims_runningbalance VALUES ('134', 'Faucet - 6"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.738326', '2025-03-07 05:35:41.738430', '02-112', '19');
INSERT INTO ims_runningbalance VALUES ('135', 'C. Clamp 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.771677', '2025-03-07 05:35:41.771805', '02-113', '19');
INSERT INTO ims_runningbalance VALUES ('136', 'Cocolumber 2 x 3 x 12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.799080', '2025-03-07 05:35:41.799194', '02-114', '19');
INSERT INTO ims_runningbalance VALUES ('137', 'Flat Cord #14', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.835228', '2025-03-07 05:35:41.835339', '02-115', '14');
INSERT INTO ims_runningbalance VALUES ('138', 'Common Nail #3- LOCAL', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.859364', '2025-03-07 05:35:41.859512', '02-116', '11');
INSERT INTO ims_runningbalance VALUES ('139', 'Common Nail #2- LOCAL', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.891419', '2025-03-07 05:35:41.891565', '02-117', '11');
INSERT INTO ims_runningbalance VALUES ('140', 'Umbrella Nail', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.922532', '2025-03-07 05:35:41.922649', '02-118', '11');
INSERT INTO ims_runningbalance VALUES ('141', 'PVC Elbow 3/4 - Orange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.952937', '2025-03-07 05:35:41.953080', '02-119', '19');
INSERT INTO ims_runningbalance VALUES ('142', 'PVC Pipe 3/4- Orange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:41.983416', '2025-03-07 05:35:41.983548', '02-120', '19');
INSERT INTO ims_runningbalance VALUES ('143', 'PVC Pipe 2" Orange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.012095', '2025-03-07 05:35:42.012215', '02-121', '19');
INSERT INTO ims_runningbalance VALUES ('144', 'PVC Pipe 3" Orange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.041194', '2025-03-07 05:35:42.041337', '02-122', '19');
INSERT INTO ims_runningbalance VALUES ('145', 'P- Trap 2" Orange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.071704', '2025-03-07 05:35:42.071850', '02-123', '19');
INSERT INTO ims_runningbalance VALUES ('146', 'Tee 2" Orange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.101502', '2025-03-07 05:35:42.101640', '02-124', '19');
INSERT INTO ims_runningbalance VALUES ('147', 'Elbow 3" Orange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.135440', '2025-03-07 05:35:42.135557', '02-125', '19');
INSERT INTO ims_runningbalance VALUES ('148', 'PVC- Y 3 x 2 -Orange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.161910', '2025-03-07 05:35:42.162016', '02-126', '19');
INSERT INTO ims_runningbalance VALUES ('149', 'Clean Out Cover 3" pvc', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.189744', '2025-03-07 05:35:42.189876', '02-127', '19');
INSERT INTO ims_runningbalance VALUES ('150', 'Kiln Dry Wood- 1 1/2 x 2 x 12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.218170', '2025-03-07 05:35:42.218307', '02-128', '19');
INSERT INTO ims_runningbalance VALUES ('151', 'Kiln Dry Wood- 1/2 x 2 x 12', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.246267', '2025-03-07 05:35:42.246371', '02-129', '19');
INSERT INTO ims_runningbalance VALUES ('152', 'Flat Disc', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.276693', '2025-03-07 05:35:42.276801', '02-130', '19');
INSERT INTO ims_runningbalance VALUES ('153', 'Flat Nail 1"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.304517', '2025-03-07 05:35:42.304701', '02-131', '11');
INSERT INTO ims_runningbalance VALUES ('154', 'Flat Nail 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.342280', '2025-03-07 05:35:42.342406', '02-132', '11');
INSERT INTO ims_runningbalance VALUES ('155', 'Tile Trim', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.372972', '2025-03-07 05:35:42.373088', '02-133', '19');
INSERT INTO ims_runningbalance VALUES ('156', 'Kitchen Sink', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.407105', '2025-03-07 05:35:42.407223', '02-134', '19');
INSERT INTO ims_runningbalance VALUES ('157', 'PMR Strainer', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.433485', '2025-03-07 05:35:42.433604', '02-135', '19');
INSERT INTO ims_runningbalance VALUES ('158', 'Flex Hose - 1/2 x 16', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.460294', '2025-03-07 05:35:42.460434', '02-136', '19');
INSERT INTO ims_runningbalance VALUES ('159', 'Vulca Seal - BOSTIK', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.487710', '2025-03-07 05:35:42.487848', '02-137', '12');
INSERT INTO ims_runningbalance VALUES ('160', 'Metal Furring 0.5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.516883', '2025-03-07 05:35:42.516999', '02-138', '19');
INSERT INTO ims_runningbalance VALUES ('161', 'QDE Enamel white', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.546013', '2025-03-07 05:35:42.546118', '02-139', '2');
INSERT INTO ims_runningbalance VALUES ('162', 'Hamba 80 x 210', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.576695', '2025-03-07 05:35:42.576811', '02-140', '19');
INSERT INTO ims_runningbalance VALUES ('163', 'Garden Hose 5/8- EXCEL', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.605157', '2025-03-07 05:35:42.605260', '02-141', '14');
INSERT INTO ims_runningbalance VALUES ('164', 'Hose- connector', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.639995', '2025-03-07 05:35:42.640129', '02-142', '18');
INSERT INTO ims_runningbalance VALUES ('165', 'PVC Pipe 1" -Orange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.669319', '2025-03-07 05:35:42.669458', '02-143', '18');
INSERT INTO ims_runningbalance VALUES ('166', 'PVC  Elbow 1" -Orange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.698748', '2025-03-07 05:35:42.698856', '02-144', '18');
INSERT INTO ims_runningbalance VALUES ('167', 'PVC  Male Adaptor 1" -Orange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.729310', '2025-03-07 05:35:42.729411', '02-145', '18');
INSERT INTO ims_runningbalance VALUES ('168', 'LED Light 15W - OMNI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.758697', '2025-03-07 05:35:42.758800', '02-146', '18');
INSERT INTO ims_runningbalance VALUES ('169', 'Baby Roller 4"- JUPITER', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.790708', '2025-03-07 05:35:42.790850', '02-147', '18');
INSERT INTO ims_runningbalance VALUES ('170', 'Screw Bit', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.816370', '2025-03-07 05:35:42.816486', '02-148', '18');
INSERT INTO ims_runningbalance VALUES ('171', 'End cap 1/2 PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.843309', '2025-03-07 05:35:42.843425', '02-149', '18');
INSERT INTO ims_runningbalance VALUES ('172', 'Toilet Bowl', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.882150', '2025-03-07 05:35:42.882313', '02-150', '18');
INSERT INTO ims_runningbalance VALUES ('173', 'Cylindrical Hinges 1"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.915481', '2025-03-07 05:35:42.915619', '02-151', '18');
INSERT INTO ims_runningbalance VALUES ('174', 'Cylindrical Hinges 1/2"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.947325', '2025-03-07 05:35:42.947495', '02-152', '18');
INSERT INTO ims_runningbalance VALUES ('175', 'Blind Rivet 3/16 x 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:42.979537', '2025-03-07 05:35:42.979699', '02-153', '5');
INSERT INTO ims_runningbalance VALUES ('176', 'Universal Padlock -ACE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.013829', '2025-03-07 05:35:43.013998', '02-154', '19');
INSERT INTO ims_runningbalance VALUES ('177', 'Sand Paper', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.044970', '2025-03-07 05:35:43.045096', '02-155', '7');
INSERT INTO ims_runningbalance VALUES ('178', 'Squala', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.070685', '2025-03-07 05:35:43.070819', '02-156', '19');
INSERT INTO ims_runningbalance VALUES ('179', 'Hose Bibb Faucet', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.103212', '2025-03-07 05:35:43.103368', '02-157', '19');
INSERT INTO ims_runningbalance VALUES ('180', 'Flexi Bond', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.130210', '2025-03-07 05:35:43.130375', '02-158', '2');
INSERT INTO ims_runningbalance VALUES ('181', 'Paint Thinner- PUREE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.164807', '2025-03-07 05:35:43.164980', '02-159', '12');
INSERT INTO ims_runningbalance VALUES ('182', 'Rubber Tape', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.197245', '2025-03-07 05:35:43.197395', '02-160', '19');
INSERT INTO ims_runningbalance VALUES ('183', 'Paint brush #2- HIPO', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.228896', '2025-03-07 05:35:43.229029', '02-161', '19');
INSERT INTO ims_runningbalance VALUES ('184', 'Drill bit 1/8 - DOORMER', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.260965', '2025-03-07 05:35:43.261088', '02-162', '19');
INSERT INTO ims_runningbalance VALUES ('185', 'Pipe 3/4 x 20 GI schd.40', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.285943', '2025-03-07 05:35:43.286103', '02-163', '19');
INSERT INTO ims_runningbalance VALUES ('186', 'Circuit Breaker - 30 A PLUG IN- GE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.312370', '2025-03-07 05:35:43.312544', '02-164', '19');
INSERT INTO ims_runningbalance VALUES ('187', 'AC - Outlet', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.342273', '2025-03-07 05:35:43.342435', '02-165', '19');
INSERT INTO ims_runningbalance VALUES ('188', 'Black Screw', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.368195', '2025-03-07 05:35:43.368341', '02-166', '19');
INSERT INTO ims_runningbalance VALUES ('189', 'Insulation Foam', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.398643', '2025-03-07 05:35:43.398765', '02-167', '14');
INSERT INTO ims_runningbalance VALUES ('190', 'Metal Furring 0.6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.436252', '2025-03-07 05:35:43.436435', '02-168', '19');
INSERT INTO ims_runningbalance VALUES ('191', '3 Gang Switch - Royu', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.461488', '2025-03-07 05:35:43.461607', '02-169', '19');
INSERT INTO ims_runningbalance VALUES ('192', 'Universal Outlet - Royu', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.486500', '2025-03-07 05:35:43.486631', '02-170', '19');
INSERT INTO ims_runningbalance VALUES ('193', '2 Gang- Royu', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.512804', '2025-03-07 05:35:43.512929', '02-171', '19');
INSERT INTO ims_runningbalance VALUES ('194', '3 Gang- Royu', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.541916', '2025-03-07 05:35:43.542084', '02-172', '21');
INSERT INTO ims_runningbalance VALUES ('195', 'National Universal Outlet', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.570756', '2025-03-07 05:35:43.570874', '02-173', '19');
INSERT INTO ims_runningbalance VALUES ('196', 'National Outlet Classic', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.598906', '2025-03-07 05:35:43.599033', '02-174', '19');
INSERT INTO ims_runningbalance VALUES ('197', 'Phenolic Board 3/4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.624389', '2025-03-07 05:35:43.624507', '02-175', '19');
INSERT INTO ims_runningbalance VALUES ('198', 'Lag Screw 3/1 x 13', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.652316', '2025-03-07 05:35:43.652432', '02-176', '19');
INSERT INTO ims_runningbalance VALUES ('199', 'Sanding Sealer Lacquer', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.681045', '2025-03-07 05:35:43.681164', '02-177', '2');
INSERT INTO ims_runningbalance VALUES ('200', 'Paint Brush #1- HIPO', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.711567', '2025-03-07 05:35:43.711721', '02-178', '19');
INSERT INTO ims_runningbalance VALUES ('201', 'Metal Screw', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.735376', '2025-03-07 05:35:43.735492', '02-179', '19');
INSERT INTO ims_runningbalance VALUES ('202', 'Mini Roller - Refill', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.761051', '2025-03-07 05:35:43.761164', '02-180', '19');
INSERT INTO ims_runningbalance VALUES ('203', 'Electrode Holder- 300amps', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.787058', '2025-03-07 05:35:43.787182', '02-181', '19');
INSERT INTO ims_runningbalance VALUES ('204', 'Sand Paper - #120', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.813876', '2025-03-07 05:35:43.814020', '02-182', '19');
INSERT INTO ims_runningbalance VALUES ('205', 'Steel Brush', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.842474', '2025-03-07 05:35:43.842588', '02-183', '19');
INSERT INTO ims_runningbalance VALUES ('206', 'Concrete Nail #4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.867196', '2025-03-07 05:35:43.867311', '02-184', '11');
INSERT INTO ims_runningbalance VALUES ('207', 'QDE black- Paint', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.894179', '2025-03-07 05:35:43.894298', '02-185', '13');
INSERT INTO ims_runningbalance VALUES ('208', 'Panel Box - 4 hole 2x2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.923427', '2025-03-07 05:35:43.923572', '02-186', '18');
INSERT INTO ims_runningbalance VALUES ('209', 'Circuit Breaker - 20 A PLUG IN- GE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.953230', '2025-03-07 05:35:43.953395', '02-187', '18');
INSERT INTO ims_runningbalance VALUES ('210', 'Drill Bit 5/32', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:43.980634', '2025-03-07 05:35:43.980746', '02-188', '18');
INSERT INTO ims_runningbalance VALUES ('211', 'Concrete Nail - # 1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.004597', '2025-03-07 05:35:44.004715', '02-189', '11');
INSERT INTO ims_runningbalance VALUES ('212', 'Mesh Tape / Gasa', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.031823', '2025-03-07 05:35:44.031938', '02-190', '20');
INSERT INTO ims_runningbalance VALUES ('213', 'Adhesive - Cement - ABC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.058608', '2025-03-07 05:35:44.058775', '02-191', '3');
INSERT INTO ims_runningbalance VALUES ('214', 'QDE - Maple', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.084213', '2025-03-07 05:35:44.084329', '02-192', '13');
INSERT INTO ims_runningbalance VALUES ('215', 'Angle Valve - 1/2 ( 3 way )', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.114443', '2025-03-07 05:35:44.114562', '02-193', '19');
INSERT INTO ims_runningbalance VALUES ('216', 'Bolt and Nut - 10mm x 2 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.145393', '2025-03-07 05:35:44.145509', '02-194', '19');
INSERT INTO ims_runningbalance VALUES ('217', 'Drill Bit- 1/4 (concrete)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.175516', '2025-03-07 05:35:44.175673', '02-195', '19');
INSERT INTO ims_runningbalance VALUES ('218', 'Drill Bit- 3/16 (concrete)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.205299', '2025-03-07 05:35:44.205459', '02-196', '19');
INSERT INTO ims_runningbalance VALUES ('219', 'Screw w/ Tox - 3/16', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.231862', '2025-03-07 05:35:44.231976', '02-197', '19');
INSERT INTO ims_runningbalance VALUES ('220', 'Flexible Hose - 1/2 x 1/2 x 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.260318', '2025-03-07 05:35:44.260495', '02-198', '19');
INSERT INTO ims_runningbalance VALUES ('221', 'Spring Door', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.289526', '2025-03-07 05:35:44.289701', '02-199', '19');
INSERT INTO ims_runningbalance VALUES ('222', 'Flexible Hose - 1/2 x 1/2 x 1/8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.318823', '2025-03-07 05:35:44.318940', '02-200', '19');
INSERT INTO ims_runningbalance VALUES ('223', 'Lavatory Bracket', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.347297', '2025-03-07 05:35:44.347413', '02-201', '19');
INSERT INTO ims_runningbalance VALUES ('224', 'Lavatory Fittings', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.376088', '2025-03-07 05:35:44.376208', '02-202', '21');
INSERT INTO ims_runningbalance VALUES ('225', 'Dyna Bolt 5/16', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.405239', '2025-03-07 05:35:44.405377', '02-203', '19');
INSERT INTO ims_runningbalance VALUES ('226', 'Terminal Battery', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.437814', '2025-03-07 05:35:44.437964', '02-204', '19');
INSERT INTO ims_runningbalance VALUES ('227', 'Moulding Strips-  3/4- ATLANTA', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.468842', '2025-03-07 05:35:44.468977', '02-205', '19');
INSERT INTO ims_runningbalance VALUES ('228', 'Atlanta PVC type - 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.503238', '2025-03-07 05:35:44.503401', '02-206', '19');
INSERT INTO ims_runningbalance VALUES ('229', 'Screw - #1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.534143', '2025-03-07 05:35:44.534302', '02-207', '19');
INSERT INTO ims_runningbalance VALUES ('230', 'Amco Box Outlet', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.566954', '2025-03-07 05:35:44.567108', '02-208', '19');
INSERT INTO ims_runningbalance VALUES ('231', 'Plug In - 30 Amp', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.597235', '2025-03-07 05:35:44.597362', '02-209', '19');
INSERT INTO ims_runningbalance VALUES ('232', 'Duct Tape', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.625814', '2025-03-07 05:35:44.625951', '02-210', '19');
INSERT INTO ims_runningbalance VALUES ('233', 'Cutter Blade - hardware', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.655786', '2025-03-07 05:35:44.655909', '02-211', '21');
INSERT INTO ims_runningbalance VALUES ('234', 'Paint Tray', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.683651', '2025-03-07 05:35:44.683778', '02-212', '19');
INSERT INTO ims_runningbalance VALUES ('235', 'Half moon Wood', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.713060', '2025-03-07 05:35:44.713205', '02-213', '19');
INSERT INTO ims_runningbalance VALUES ('236', 'Junction Box 4 x 2 - pvc - OMNI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.741250', '2025-03-07 05:35:44.741394', '02-214', '19');
INSERT INTO ims_runningbalance VALUES ('237', 'Pinlight Fixture Alum- AKARI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.766125', '2025-03-07 05:35:44.766277', '02-215', '19');
INSERT INTO ims_runningbalance VALUES ('238', 'LED Light- 9w -FIREFLY', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.794738', '2025-03-07 05:35:44.794928', '02-216', '19');
INSERT INTO ims_runningbalance VALUES ('239', 'LED Ceiling Lamp Surface Type- 18w - OMNI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.823761', '2025-03-07 05:35:44.823915', '02-217', '19');
INSERT INTO ims_runningbalance VALUES ('240', '2 Gang Switch- PANASONIC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.852367', '2025-03-07 05:35:44.852569', '02-218', '19');
INSERT INTO ims_runningbalance VALUES ('241', '1 Gang 3 way Switch- PANASONIC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.881956', '2025-03-07 05:35:44.882102', '02-219', '19');
INSERT INTO ims_runningbalance VALUES ('242', '3 Gang Switch- PANASONIC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.912902', '2025-03-07 05:35:44.913020', '02-220', '19');
INSERT INTO ims_runningbalance VALUES ('243', 'Faucet Stainless - WATERGATE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.943712', '2025-03-07 05:35:44.943828', '02-221', '19');
INSERT INTO ims_runningbalance VALUES ('244', 'Faucet Brass - Gold -  WATERGATE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:44.980389', '2025-03-07 05:35:44.980549', '02-222', '19');
INSERT INTO ims_runningbalance VALUES ('245', 'Junction Box Cover - OMNI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.006578', '2025-03-07 05:35:45.006734', '02-223', '19');
INSERT INTO ims_runningbalance VALUES ('246', 'Hinges 35 x 35 x 2- GATEMAN', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.036254', '2025-03-07 05:35:45.036395', '02-224', '19');
INSERT INTO ims_runningbalance VALUES ('247', 'Circuit breaker 60A bolt-On - GE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.069506', '2025-03-07 05:35:45.069684', '02-225', '19');
INSERT INTO ims_runningbalance VALUES ('248', 'Faucet hose bib white PVC - DOWEL', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.097419', '2025-03-07 05:35:45.097578', '02-226', '19');
INSERT INTO ims_runningbalance VALUES ('249', 'Hose Clamp 5/8 -', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.126480', '2025-03-07 05:35:45.126623', '02-227', '19');
INSERT INTO ims_runningbalance VALUES ('250', 'Angle Bar 5.0mm x 1 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.154149', '2025-03-07 05:35:45.154309', '02-228', '19');
INSERT INTO ims_runningbalance VALUES ('251', 'TILE 60 X 60 AK 6882', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.183217', '2025-03-07 05:35:45.183327', '02-229', '19');
INSERT INTO ims_runningbalance VALUES ('252', 'TILE 60 X 60 AK 6889', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.210980', '2025-03-07 05:35:45.211094', '02-230', '19');
INSERT INTO ims_runningbalance VALUES ('253', 'ALUM. Door Brown', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.238120', '2025-03-07 05:35:45.238235', '02-231', '19');
INSERT INTO ims_runningbalance VALUES ('254', 'MJ Water Closet', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.265979', '2025-03-07 05:35:45.266142', '02-232', '19');
INSERT INTO ims_runningbalance VALUES ('255', 'Grout White', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.296170', '2025-03-07 05:35:45.296282', '02-233', '3');
INSERT INTO ims_runningbalance VALUES ('256', 'TILE 60 x 60 FC 6013', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.325232', '2025-03-07 05:35:45.325399', '02-234', '19');
INSERT INTO ims_runningbalance VALUES ('257', 'Rib type 05.mm x 3.66m', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.355320', '2025-03-07 05:35:45.355483', '02-235', '19');
INSERT INTO ims_runningbalance VALUES ('258', 'Rib type 05.mm x 3.05m', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.386881', '2025-03-07 05:35:45.387056', '02-236', '19');
INSERT INTO ims_runningbalance VALUES ('259', 'Rib type 05.mm x 6.10m', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.418084', '2025-03-07 05:35:45.418258', '02-237', '19');
INSERT INTO ims_runningbalance VALUES ('260', 'Tek screw 12 x 55 steel', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.450697', '2025-03-07 05:35:45.450849', '02-238', '19');
INSERT INTO ims_runningbalance VALUES ('261', 'Panel Door 80 x 200  jamb 2 x 5 kd w/ holes', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.482411', '2025-03-07 05:35:45.482529', '02-239', '21');
INSERT INTO ims_runningbalance VALUES ('262', 'Ply Wood  ORDINARY 1/2- LOCAL', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.510378', '2025-03-07 05:35:45.510510', '02-240', '19');
INSERT INTO ims_runningbalance VALUES ('263', 'Cocolumber 2 x 2 x 10FT- LOCAL', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.543911', '2025-03-07 05:35:45.544075', '02-241', '19');
INSERT INTO ims_runningbalance VALUES ('264', 'G.I. Wire #16', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.575577', '2025-03-07 05:35:45.575740', '02-242', '11');
INSERT INTO ims_runningbalance VALUES ('265', 'Flat latex White - BOYSEN 30f - 100m', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.606635', '2025-03-07 05:35:45.606752', '02-243', '17');
INSERT INTO ims_runningbalance VALUES ('266', 'Flat latex White -MENNISOTA 30f - 100m', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.636039', '2025-03-07 05:35:45.636173', '02-244', '17');
INSERT INTO ims_runningbalance VALUES ('267', 'Flat latex White - COAT SAVER (solo88)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.668396', '2025-03-07 05:35:45.668522', '02-245', '17');
INSERT INTO ims_runningbalance VALUES ('268', 'Latex Gloss White- COAT SAVER (solo99)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.699612', '2025-03-07 05:35:45.699799', '02-246', '17');
INSERT INTO ims_runningbalance VALUES ('269', 'Roofing Paint Blue- RAIN OR SHINE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.738183', '2025-03-07 05:35:45.738299', '02-247', '17');
INSERT INTO ims_runningbalance VALUES ('270', 'Acry Color Raw Sienna -DESTINY', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.766271', '2025-03-07 05:35:45.766381', '02-248', '8');
INSERT INTO ims_runningbalance VALUES ('271', 'Ting Ting Color Thalo Blue #16- DESTINY', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.795843', '2025-03-07 05:35:45.795981', '02-249', '8');
INSERT INTO ims_runningbalance VALUES ('272', 'Ting Ting Color Thalo Blue - BOYSEN (B2306)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.826210', '2025-03-07 05:35:45.826327', '02-250', '8');
INSERT INTO ims_runningbalance VALUES ('273', 'Pylox Spray Paint Sky Blue', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.855180', '2025-03-07 05:35:45.855333', '02-251', '8');
INSERT INTO ims_runningbalance VALUES ('274', 'Pylox Spray Paint Silver', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.887238', '2025-03-07 05:35:45.887412', '02-252', '8');
INSERT INTO ims_runningbalance VALUES ('275', 'Spray Paint Pearl White- SAMURAI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.919578', '2025-03-07 05:35:45.919724', '02-253', '8');
INSERT INTO ims_runningbalance VALUES ('276', 'Spray Paint Gloss Black- BOSNY', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.949202', '2025-03-07 05:35:45.949335', '02-254', '2');
INSERT INTO ims_runningbalance VALUES ('277', 'Spray Paint Light Sky Blue- NIPPON', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:45.977979', '2025-03-07 05:35:45.978134', '02-255', '2');
INSERT INTO ims_runningbalance VALUES ('278', 'Laquer Thinner- PUREE 3Ltr', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.010356', '2025-03-07 05:35:46.010474', '02-256', '2');
INSERT INTO ims_runningbalance VALUES ('279', 'Paint Thinner- LESCO 3Ltr', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.040050', '2025-03-07 05:35:46.040206', '02-257', '2');
INSERT INTO ims_runningbalance VALUES ('280', 'QDE - Yellow - SALAMAT BRO', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.071382', '2025-03-07 05:35:46.071558', '02-258', '2');
INSERT INTO ims_runningbalance VALUES ('281', 'QDE - Yellow - TKO', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.100914', '2025-03-07 05:35:46.101052', '02-259', '2');
INSERT INTO ims_runningbalance VALUES ('282', 'Prolux Glazing Putty White- DAVIES', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.130961', '2025-03-07 05:35:46.131116', '02-260', '2');
INSERT INTO ims_runningbalance VALUES ('283', 'Butterfly Paint Brush - 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.160007', '2025-03-07 05:35:46.160171', '02-261', '19');
INSERT INTO ims_runningbalance VALUES ('284', 'Fan Club Paint Brush - 1"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.188425', '2025-03-07 05:35:46.188543', '02-262', '19');
INSERT INTO ims_runningbalance VALUES ('285', 'Fan Club Paint Brush - 2"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.219977', '2025-03-07 05:35:46.220095', '02-263', '19');
INSERT INTO ims_runningbalance VALUES ('286', 'Butterfly Paint Brush - 3"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.248939', '2025-03-07 05:35:46.249109', '02-264', '19');
INSERT INTO ims_runningbalance VALUES ('287', 'Butterfly Paint Brush - 4"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.279831', '2025-03-07 05:35:46.279985', '02-265', '19');
INSERT INTO ims_runningbalance VALUES ('288', 'Acrylon Paint Roller - 7"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.306589', '2025-03-07 05:35:46.306723', '02-266', '19');
INSERT INTO ims_runningbalance VALUES ('289', 'QDE- Black -DOMINO', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.337546', '2025-03-07 05:35:46.337680', '02-267', '2');
INSERT INTO ims_runningbalance VALUES ('290', 'GreenField Floodlight LED 50w', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.367807', '2025-03-07 05:35:46.367933', '02-268', '19');
INSERT INTO ims_runningbalance VALUES ('291', 'Flat White 16Ltrs. SINCLAIR', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.396708', '2025-03-07 05:35:46.396824', '02-269', '17');
INSERT INTO ims_runningbalance VALUES ('292', 'Pylox Spray Paint Heat Black', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.426014', '2025-03-07 05:35:46.426163', '02-270', '8');
INSERT INTO ims_runningbalance VALUES ('293', 'Build Rite Metal Primer Red Oxide -3ltr', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.456360', '2025-03-07 05:35:46.456483', '02-271', '2');
INSERT INTO ims_runningbalance VALUES ('294', 'Epoxy Reducer- PUREE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.480940', '2025-03-07 05:35:46.481054', '02-272', '2');
INSERT INTO ims_runningbalance VALUES ('295', 'Laquer Flow- PUREE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.508434', '2025-03-07 05:35:46.508624', '02-273', '2');
INSERT INTO ims_runningbalance VALUES ('296', 'Permacoat Gloss White B710- BOYSEN', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.536408', '2025-03-07 05:35:46.536573', '02-274', '17');
INSERT INTO ims_runningbalance VALUES ('297', 'Fast Dry Enamel White NS950- NATION', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.566899', '2025-03-07 05:35:46.567042', '02-275', '2');
INSERT INTO ims_runningbalance VALUES ('298', 'Exhaust Fan- OMNI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.597877', '2025-03-07 05:35:46.598000', '02-276', '19');
INSERT INTO ims_runningbalance VALUES ('299', 'Yellow -RAIN OR SHINE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.624781', '2025-03-07 05:35:46.624936', '02-277', '2');
INSERT INTO ims_runningbalance VALUES ('300', 'Royal Blue- RAIN OR SHINE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.658545', '2025-03-07 05:35:46.658700', '02-278', '2');
INSERT INTO ims_runningbalance VALUES ('301', 'Door Closer- Lotus Tubular', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.683556', '2025-03-07 05:35:46.683667', '02-279', '19');
INSERT INTO ims_runningbalance VALUES ('302', 'QDE- White -BOYSEN', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.717160', '2025-03-07 05:35:46.717299', '02-280', '2');
INSERT INTO ims_runningbalance VALUES ('303', 'PANEL BOARD 6 HOLES PLUG IN- AMERICA', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.740750', '2025-03-07 05:35:46.740910', '02-281', '18');
INSERT INTO ims_runningbalance VALUES ('304', 'Flat Gloss- BOYSEN', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.771683', '2025-03-07 05:35:46.771801', '02-282', '17');
INSERT INTO ims_runningbalance VALUES ('305', 'QDE WHITE- BOYSEN (pail)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.800876', '2025-03-07 05:35:46.801051', '02-283', '17');
INSERT INTO ims_runningbalance VALUES ('306', 'Ting ting Color Thalo Blue- BOYSEN', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.829288', '2025-03-07 05:35:46.829402', '02-284', '12');
INSERT INTO ims_runningbalance VALUES ('307', 'Guilder Epoxy primer Gray- BOYSEN', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.858033', '2025-03-07 05:35:46.858154', '02-285', '2');
INSERT INTO ims_runningbalance VALUES ('308', 'Acry Color Raw Sienna -BOYSEN', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.884063', '2025-03-07 05:35:46.884216', '02-286', '8');
INSERT INTO ims_runningbalance VALUES ('309', 'Acry Color Thalo Blue- BOYSEN', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.913887', '2025-03-07 05:35:46.914043', '02-287', '8');
INSERT INTO ims_runningbalance VALUES ('310', 'Roller Brush w/h 2b -ACRYLON', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.942696', '2025-03-07 05:35:46.942867', '02-288', '19');
INSERT INTO ims_runningbalance VALUES ('311', 'Baby Roller w/o- OMEGA', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:46.979392', '2025-03-07 05:35:46.979556', '02-289', '19');
INSERT INTO ims_runningbalance VALUES ('312', 'Zimcoat Skimcoat', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.012025', '2025-03-07 05:35:47.012197', '02-290', '3');
INSERT INTO ims_runningbalance VALUES ('313', 'DIB Cable Tie 100pcs 7 in BLACK', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.041644', '2025-03-07 05:35:47.041825', '02-291', '16');
INSERT INTO ims_runningbalance VALUES ('314', 'Deform Bar - 16mm', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.070215', '2025-03-07 05:35:47.070333', '02-292', '19');
INSERT INTO ims_runningbalance VALUES ('315', '1/4 Thick Plastic Acrylic 4 x 8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.097472', '2025-03-07 05:35:47.097588', '02-293', '19');
INSERT INTO ims_runningbalance VALUES ('316', 'Anzahl Anti Corrosion', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.130154', '2025-03-07 05:35:47.130334', '02-294', '12');
INSERT INTO ims_runningbalance VALUES ('317', 'Anzahl Surfacer Primer', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.157725', '2025-03-07 05:35:47.157881', '02-295', '12');
INSERT INTO ims_runningbalance VALUES ('318', 'Anzahl White w/ Catalest', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.191093', '2025-03-07 05:35:47.191289', '02-296', '2');
INSERT INTO ims_runningbalance VALUES ('319', 'Urethane Thinner', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.217114', '2025-03-07 05:35:47.217256', '02-297', '2');
INSERT INTO ims_runningbalance VALUES ('320', 'Body Filler W/ Hardener', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.244431', '2025-03-07 05:35:47.244562', '02-298', '2');
INSERT INTO ims_runningbalance VALUES ('321', 'Sand Paper #100', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.273140', '2025-03-07 05:35:47.273319', '02-299', '19');
INSERT INTO ims_runningbalance VALUES ('322', 'Sand Paper 120" 400" 1200', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.300590', '2025-03-07 05:35:47.300784', '02-300', '19');
INSERT INTO ims_runningbalance VALUES ('323', 'Tiles 60 x 60 fc 6013', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.332781', '2025-03-07 05:35:47.332943', '02-301', '19');
INSERT INTO ims_runningbalance VALUES ('324', 'Tiles 60 x 60 fc 6889', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.365326', '2025-03-07 05:35:47.365475', '02-302', '19');
INSERT INTO ims_runningbalance VALUES ('325', 'Tiles 60 x 60 ak 6882', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.395411', '2025-03-07 05:35:47.395573', '02-303', '19');
INSERT INTO ims_runningbalance VALUES ('326', 'Tiles 60 x 60 ak 6888', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.424145', '2025-03-07 05:35:47.424314', '02-304', '19');
INSERT INTO ims_runningbalance VALUES ('327', 'MJ Water Closet bowl', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.455224', '2025-03-07 05:35:47.455337', '02-305', '19');
INSERT INTO ims_runningbalance VALUES ('328', 'Cable Tie 6x300', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.481822', '2025-03-07 05:35:47.481949', '02-306', '16');
INSERT INTO ims_runningbalance VALUES ('329', 'QDE WHITE- TKO', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.510811', '2025-03-07 05:35:47.510962', '02-307', '2');
INSERT INTO ims_runningbalance VALUES ('330', 'Junction Box- SHUTA', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.541805', '2025-03-07 05:35:47.541975', '02-308', '19');
INSERT INTO ims_runningbalance VALUES ('331', '1 Gang Switch- ROYU', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.573301', '2025-03-07 05:35:47.573410', '02-309', '19');
INSERT INTO ims_runningbalance VALUES ('332', '2 Gang Outlet Universal- FOCUS', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.601389', '2025-03-07 05:35:47.601504', '02-310', '19');
INSERT INTO ims_runningbalance VALUES ('333', 'PVC Pipe Orange 1/2- BIO', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.630847', '2025-03-07 05:35:47.630995', '02-311', '19');
INSERT INTO ims_runningbalance VALUES ('334', 'THHN WIRE 12"- MAX', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.659745', '2025-03-07 05:35:47.659909', '02-312', '19');
INSERT INTO ims_runningbalance VALUES ('335', 'Angle Valve 1/2" 2 way - HAWK', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.686376', '2025-03-07 05:35:47.686496', '02-313', '19');
INSERT INTO ims_runningbalance VALUES ('336', 'Faucet 2 way -HAWK', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.712275', '2025-03-07 05:35:47.712431', '02-314', '19');
INSERT INTO ims_runningbalance VALUES ('337', 'Supply Hose 1/2 x 1/2 - ITALY', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.735781', '2025-03-07 05:35:47.735910', '02-315', '19');
INSERT INTO ims_runningbalance VALUES ('338', 'Floor Drain 4 x 4- CHICAGO', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.761122', '2025-03-07 05:35:47.761275', '02-316', '19');
INSERT INTO ims_runningbalance VALUES ('339', 'Faucet s/s - HAWK', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.789532', '2025-03-07 05:35:47.789697', '02-317', '19');
INSERT INTO ims_runningbalance VALUES ('340', 'Cyclone Wire', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.815771', '2025-03-07 05:35:47.815882', '02-318', '19');
INSERT INTO ims_runningbalance VALUES ('341', 'Long Span Rib type 0.50m x 1220m Blue', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.845539', '2025-03-07 05:35:47.845694', '02-319', '19');
INSERT INTO ims_runningbalance VALUES ('342', 'C- Purlins 2 x 3 1.0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.873162', '2025-03-07 05:35:47.873317', '02-320', '19');
INSERT INTO ims_runningbalance VALUES ('343', 'Deform Bar 12mm', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.902311', '2025-03-07 05:35:47.902428', '02-321', '19');
INSERT INTO ims_runningbalance VALUES ('344', 'Steel Matting 4 x 8 #8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.927830', '2025-03-07 05:35:47.927951', '02-322', '19');
INSERT INTO ims_runningbalance VALUES ('345', 'Tubular 2 x 3 1.4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.953346', '2025-03-07 05:35:47.953557', '02-323', '19');
INSERT INTO ims_runningbalance VALUES ('346', 'Air Release Valve 1" Brass', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:47.983198', '2025-03-07 05:35:47.983309', '03-001', '19');
INSERT INTO ims_runningbalance VALUES ('347', 'Air Release Valve 1" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.009525', '2025-03-07 05:35:48.009684', '03-002', '19');
INSERT INTO ims_runningbalance VALUES ('348', 'Adaptor 2" CI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.035467', '2025-03-07 05:35:48.035622', '03-003', '19');
INSERT INTO ims_runningbalance VALUES ('349', 'Adaptor 3" CI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.061839', '2025-03-07 05:35:48.061996', '03-004', '19');
INSERT INTO ims_runningbalance VALUES ('350', 'Adaptor 4" CI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.088950', '2025-03-07 05:35:48.089103', '03-005', '19');
INSERT INTO ims_runningbalance VALUES ('351', 'Adaptor 6" CI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.116146', '2025-03-07 05:35:48.116311', '03-006', '19');
INSERT INTO ims_runningbalance VALUES ('352', 'Ball Valve 1"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.143213', '2025-03-07 05:35:48.143346', '03-007', '19');
INSERT INTO ims_runningbalance VALUES ('353', 'Ball Valve 1/2 Lockwing - WIN', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.174435', '2025-03-07 05:35:48.174606', '03-008', '19');
INSERT INTO ims_runningbalance VALUES ('354', 'Ball Valve 1/2 Magnetic', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.202777', '2025-03-07 05:35:48.202918', '03-009', '19');
INSERT INTO ims_runningbalance VALUES ('355', 'Ball Valve 2"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.231393', '2025-03-07 05:35:48.231499', '03-010', '19');
INSERT INTO ims_runningbalance VALUES ('356', 'Ball Valve 3/4" Lockwing', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.258521', '2025-03-07 05:35:48.258646', '03-011', '19');
INSERT INTO ims_runningbalance VALUES ('357', 'Bell Reducer 3 x 2 B.I', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.286243', '2025-03-07 05:35:48.286360', '03-012', '19');
INSERT INTO ims_runningbalance VALUES ('358', 'Bell Reducer 1 1/4 x 1" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.314224', '2025-03-07 05:35:48.314340', '03-013', '19');
INSERT INTO ims_runningbalance VALUES ('359', 'Bell Reducer 1" x 3/4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.342156', '2025-03-07 05:35:48.342311', '03-014', '19');
INSERT INTO ims_runningbalance VALUES ('360', 'Bell Reducer 1/2 x 3/4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.375253', '2025-03-07 05:35:48.375414', '03-015', '19');
INSERT INTO ims_runningbalance VALUES ('361', 'Bell Reducer 2 x 1 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.403720', '2025-03-07 05:35:48.403834', '03-016', '19');
INSERT INTO ims_runningbalance VALUES ('362', 'Bell Reducer 3 x 2 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.434035', '2025-03-07 05:35:48.434188', '03-017', '19');
INSERT INTO ims_runningbalance VALUES ('363', 'Bell Reducer 4 x 3 BI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.464103', '2025-03-07 05:35:48.464266', '03-018', '19');
INSERT INTO ims_runningbalance VALUES ('364', 'Bell Reducer 6 x 4 BI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.496761', '2025-03-07 05:35:48.496893', '03-019', '19');
INSERT INTO ims_runningbalance VALUES ('365', 'Bell Reducer 6 x 4 GI - Mechanical', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.527402', '2025-03-07 05:35:48.527579', '03-020', '19');
INSERT INTO ims_runningbalance VALUES ('366', 'Bushing 3/4 x 1/2 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.560217', '2025-03-07 05:35:48.560340', '03-021', '19');
INSERT INTO ims_runningbalance VALUES ('367', 'Bushing 1 x 3/4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.589568', '2025-03-07 05:35:48.589724', '03-022', '19');
INSERT INTO ims_runningbalance VALUES ('368', 'Bushing 2 x 1 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.622110', '2025-03-07 05:35:48.622279', '03-023', '19');
INSERT INTO ims_runningbalance VALUES ('369', 'Bushing 2 x 2 1/2 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.662812', '2025-03-07 05:35:48.662973', '03-024', '19');
INSERT INTO ims_runningbalance VALUES ('370', 'Bushing 4 x 3/4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.692282', '2025-03-07 05:35:48.692406', '03-025', '19');
INSERT INTO ims_runningbalance VALUES ('371', 'Butterfly Valve 4"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.726851', '2025-03-07 05:35:48.727006', '03-026', '19');
INSERT INTO ims_runningbalance VALUES ('372', 'Butterfly Valve 6"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.758617', '2025-03-07 05:35:48.758727', '03-027', '19');
INSERT INTO ims_runningbalance VALUES ('373', 'Checkvalve 1" - Brass', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.792373', '2025-03-07 05:35:48.792563', '03-028', '19');
INSERT INTO ims_runningbalance VALUES ('374', 'Checkvalve 1/2" Brass', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.823702', '2025-03-07 05:35:48.823830', '03-029', '19');
INSERT INTO ims_runningbalance VALUES ('375', 'Checkvalve 1 1/2" Brass', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.850685', '2025-03-07 05:35:48.850820', '03-030', '19');
INSERT INTO ims_runningbalance VALUES ('376', 'Checkvalve 2" - Brass', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.883639', '2025-03-07 05:35:48.883820', '03-031', '19');
INSERT INTO ims_runningbalance VALUES ('377', 'Checkvalve 3" Brass', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.918564', '2025-03-07 05:35:48.918694', '03-032', '19');
INSERT INTO ims_runningbalance VALUES ('378', 'Checkvalve 4"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.944720', '2025-03-07 05:35:48.944846', '03-033', '19');
INSERT INTO ims_runningbalance VALUES ('379', 'Checkvalve 6"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:48.975211', '2025-03-07 05:35:48.975344', '03-034', '19');
INSERT INTO ims_runningbalance VALUES ('380', 'Checkvalve 6" CI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.005927', '2025-03-07 05:35:49.006082', '03-035', '19');
INSERT INTO ims_runningbalance VALUES ('381', 'Coupling 1" GI (S40)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.035411', '2025-03-07 05:35:49.035566', '03-036', '19');
INSERT INTO ims_runningbalance VALUES ('382', 'Coupling 1" GI (S80)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.062536', '2025-03-07 05:35:49.062665', '03-037', '19');
INSERT INTO ims_runningbalance VALUES ('383', 'Coupling 1" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.095294', '2025-03-07 05:35:49.095448', '03-038', '19');
INSERT INTO ims_runningbalance VALUES ('384', 'Coupling 1/2 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.120930', '2025-03-07 05:35:49.121089', '03-039', '19');
INSERT INTO ims_runningbalance VALUES ('385', 'Coupling 1/2 PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.151228', '2025-03-07 05:35:49.151371', '03-040', '19');
INSERT INTO ims_runningbalance VALUES ('386', 'Coupling 1/2 PVC w/ Thread', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.179030', '2025-03-07 05:35:49.179188', '03-041', '19');
INSERT INTO ims_runningbalance VALUES ('387', 'Coupling 1/2 HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.211139', '2025-03-07 05:35:49.211264', '03-042', '19');
INSERT INTO ims_runningbalance VALUES ('388', 'Coupling 2" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.241348', '2025-03-07 05:35:49.241510', '03-043', '19');
INSERT INTO ims_runningbalance VALUES ('389', 'Coupling 2" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.273952', '2025-03-07 05:35:49.274108', '03-044', '19');
INSERT INTO ims_runningbalance VALUES ('390', 'Coupling 3" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.304336', '2025-03-07 05:35:49.304483', '03-045', '19');
INSERT INTO ims_runningbalance VALUES ('391', 'Coupling 3" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.333671', '2025-03-07 05:35:49.333790', '03-046', '19');
INSERT INTO ims_runningbalance VALUES ('392', 'Coupling 3/4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.363939', '2025-03-07 05:35:49.364055', '03-047', '19');
INSERT INTO ims_runningbalance VALUES ('393', 'Coupling 3/4 HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.391150', '2025-03-07 05:35:49.391286', '03-048', '19');
INSERT INTO ims_runningbalance VALUES ('394', 'Coupling 4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.420107', '2025-03-07 05:35:49.420272', '03-049', '19');
INSERT INTO ims_runningbalance VALUES ('395', 'Coupling 4" HDPE- FISH', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.452500', '2025-03-07 05:35:49.452614', '03-050', '19');
INSERT INTO ims_runningbalance VALUES ('396', 'Coupling 4X3 GI (SCHED 80)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.477181', '2025-03-07 05:35:49.477340', '03-051', '19');
INSERT INTO ims_runningbalance VALUES ('397', 'Coupling 6" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.511293', '2025-03-07 05:35:49.511449', '03-052', '19');
INSERT INTO ims_runningbalance VALUES ('398', 'Coupling 6" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.545292', '2025-03-07 05:35:49.545470', '03-053', '19');
INSERT INTO ims_runningbalance VALUES ('399', 'Coupling 3/4"  PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.575292', '2025-03-07 05:35:49.575465', '03-054', '19');
INSERT INTO ims_runningbalance VALUES ('400', 'Coupling Reducer 3 x 2 - Mechanical', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.613332', '2025-03-07 05:35:49.613454', '03-055', '19');
INSERT INTO ims_runningbalance VALUES ('401', 'Coupling Reducer 3 x 2 NLC - FISH', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.644823', '2025-03-07 05:35:49.644946', '03-056', '19');
INSERT INTO ims_runningbalance VALUES ('402', 'Coupling Reducer 4 x 2 - Mechanical', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.676531', '2025-03-07 05:35:49.676645', '03-057', '19');
INSERT INTO ims_runningbalance VALUES ('403', 'Cross Tee 1" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.710239', '2025-03-07 05:35:49.710398', '03-058', '19');
INSERT INTO ims_runningbalance VALUES ('404', 'Cross Tee 1/2 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.742116', '2025-03-07 05:35:49.742265', '03-059', '19');
INSERT INTO ims_runningbalance VALUES ('405', 'Cross Tee 2" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.769358', '2025-03-07 05:35:49.769482', '03-060', '19');
INSERT INTO ims_runningbalance VALUES ('406', 'Cross Tee 3 x 2 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.803059', '2025-03-07 05:35:49.803218', '03-061', '19');
INSERT INTO ims_runningbalance VALUES ('407', 'Cross Tee 3" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.828899', '2025-03-07 05:35:49.829050', '03-062', '19');
INSERT INTO ims_runningbalance VALUES ('408', 'Cross Tee 4 x 2 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.861341', '2025-03-07 05:35:49.861513', '03-063', '19');
INSERT INTO ims_runningbalance VALUES ('409', 'Cross Tee 4 x 3 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.890924', '2025-03-07 05:35:49.891079', '03-064', '19');
INSERT INTO ims_runningbalance VALUES ('410', 'Cross Tee 4" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.921092', '2025-03-07 05:35:49.921248', '03-065', '19');
INSERT INTO ims_runningbalance VALUES ('411', 'Cross Tee 6 x 3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.953208', '2025-03-07 05:35:49.953361', '03-066', '19');
INSERT INTO ims_runningbalance VALUES ('412', 'Elbow 45deg - Flange Type 6" CI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:49.982958', '2025-03-07 05:35:49.983077', '03-067', '19');
INSERT INTO ims_runningbalance VALUES ('413', 'Elbow 90 deg - 4" BI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.015759', '2025-03-07 05:35:50.015919', '03-068', '19');
INSERT INTO ims_runningbalance VALUES ('414', 'Elbow 90deg - Flange Type 6" CI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.045544', '2025-03-07 05:35:50.045660', '03-069', '19');
INSERT INTO ims_runningbalance VALUES ('415', 'Elbow 1" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.076207', '2025-03-07 05:35:50.076364', '03-070', '19');
INSERT INTO ims_runningbalance VALUES ('416', 'Elbow 1" GI 45 deg.', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.106329', '2025-03-07 05:35:50.106468', '03-071', '19');
INSERT INTO ims_runningbalance VALUES ('417', 'Elbow 1" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.139464', '2025-03-07 05:35:50.139599', '03-072', '19');
INSERT INTO ims_runningbalance VALUES ('418', 'Elbow 1" PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.171922', '2025-03-07 05:35:50.172069', '03-073', '19');
INSERT INTO ims_runningbalance VALUES ('419', 'Elbow 1/2 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.210074', '2025-03-07 05:35:50.210201', '03-074', '19');
INSERT INTO ims_runningbalance VALUES ('420', 'Elbow 1/2 HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.246260', '2025-03-07 05:35:50.246423', '03-075', '19');
INSERT INTO ims_runningbalance VALUES ('421', 'Elbow 1/2 (plain)  PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.275961', '2025-03-07 05:35:50.276078', '03-076', '19');
INSERT INTO ims_runningbalance VALUES ('422', 'Elbow 2" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.310603', '2025-03-07 05:35:50.310725', '03-077', '19');
INSERT INTO ims_runningbalance VALUES ('423', 'Elbow 2" HDPE- FISH', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.342745', '2025-03-07 05:35:50.342907', '03-078', '19');
INSERT INTO ims_runningbalance VALUES ('424', 'Elbow 3" BI 45 deg.', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.370658', '2025-03-07 05:35:50.370808', '03-079', '19');
INSERT INTO ims_runningbalance VALUES ('425', 'Elbow 3" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.403274', '2025-03-07 05:35:50.403394', '03-080', '19');
INSERT INTO ims_runningbalance VALUES ('426', 'Elbow 3" GI 45 deg.', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.436757', '2025-03-07 05:35:50.436878', '03-081', '1');
INSERT INTO ims_runningbalance VALUES ('427', 'Elbow 3" HDPE- FISH', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.471109', '2025-03-07 05:35:50.471234', '03-082', '19');
INSERT INTO ims_runningbalance VALUES ('428', 'Elbow 3/4 GI- JB', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.504180', '2025-03-07 05:35:50.504320', '03-083', '19');
INSERT INTO ims_runningbalance VALUES ('429', 'Elbow 3/4 HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.536409', '2025-03-07 05:35:50.536534', '03-084', '19');
INSERT INTO ims_runningbalance VALUES ('430', 'Elbow 4" 45deg (80) BI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.574558', '2025-03-07 05:35:50.574726', '03-085', '19');
INSERT INTO ims_runningbalance VALUES ('431', 'Elbow 4" 45deg GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.608153', '2025-03-07 05:35:50.608299', '03-086', '19');
INSERT INTO ims_runningbalance VALUES ('432', 'Elbow 4" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.640762', '2025-03-07 05:35:50.640894', '03-087', '19');
INSERT INTO ims_runningbalance VALUES ('433', 'Elbow 6" BI  45 DEG', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.677740', '2025-03-07 05:35:50.677861', '03-088', '19');
INSERT INTO ims_runningbalance VALUES ('434', 'Elbow 6" BI  90 DEG', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.710224', '2025-03-07 05:35:50.710370', '03-089', '19');
INSERT INTO ims_runningbalance VALUES ('435', 'Elbow Reducer 1" x 1 1/4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.744759', '2025-03-07 05:35:50.744935', '03-090', '19');
INSERT INTO ims_runningbalance VALUES ('436', 'Elbow Reducer 1" x 1/2 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.777136', '2025-03-07 05:35:50.777298', '03-091', '19');
INSERT INTO ims_runningbalance VALUES ('437', 'Elbow Reducer 1" x 3/4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.813048', '2025-03-07 05:35:50.813209', '03-092', '19');
INSERT INTO ims_runningbalance VALUES ('438', 'Elbow Reducer 3/4 x 1/2 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.864966', '2025-03-07 05:35:50.865140', '03-093', '19');
INSERT INTO ims_runningbalance VALUES ('439', 'Elbow Straight 1/2"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.901041', '2025-03-07 05:35:50.901225', '03-094', '19');
INSERT INTO ims_runningbalance VALUES ('440', 'Elbow Straight 1"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.933914', '2025-03-07 05:35:50.934035', '03-095', '19');
INSERT INTO ims_runningbalance VALUES ('441', 'Elbow Straight 3/4"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:50.970292', '2025-03-07 05:35:50.970419', '03-096', '19');
INSERT INTO ims_runningbalance VALUES ('442', 'Elbow Threaded 1/2 PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.003051', '2025-03-07 05:35:51.003175', '03-097', '19');
INSERT INTO ims_runningbalance VALUES ('443', 'End Cap 1" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.040060', '2025-03-07 05:35:51.040264', '03-098', '19');
INSERT INTO ims_runningbalance VALUES ('444', 'End Cap 1/2 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.076638', '2025-03-07 05:35:51.076796', '03-099', '19');
INSERT INTO ims_runningbalance VALUES ('445', 'End Cap 2"  GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.110928', '2025-03-07 05:35:51.111097', '03-100', '19');
INSERT INTO ims_runningbalance VALUES ('446', 'End Cap 2" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.146207', '2025-03-07 05:35:51.146329', '03-101', '19');
INSERT INTO ims_runningbalance VALUES ('447', 'End Cap 3" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.187772', '2025-03-07 05:35:51.187955', '03-102', '19');
INSERT INTO ims_runningbalance VALUES ('448', 'End Cap 3" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.224891', '2025-03-07 05:35:51.225058', '03-103', '19');
INSERT INTO ims_runningbalance VALUES ('449', 'End Cap 3/4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.253328', '2025-03-07 05:35:51.253461', '03-104', '19');
INSERT INTO ims_runningbalance VALUES ('450', 'End Cap 4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.286679', '2025-03-07 05:35:51.286835', '03-105', '19');
INSERT INTO ims_runningbalance VALUES ('451', 'End Cap 6"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.320283', '2025-03-07 05:35:51.320453', '03-106', '19');
INSERT INTO ims_runningbalance VALUES ('452', 'End Cap 8"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.358950', '2025-03-07 05:35:51.359125', '03-107', '19');
INSERT INTO ims_runningbalance VALUES ('453', 'End Plug 1" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.390984', '2025-03-07 05:35:51.391115', '03-108', '19');
INSERT INTO ims_runningbalance VALUES ('454', 'End Plug 1/2 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.421231', '2025-03-07 05:35:51.421344', '03-109', '19');
INSERT INTO ims_runningbalance VALUES ('455', 'End Plug 2" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.454116', '2025-03-07 05:35:51.454246', '03-110', '19');
INSERT INTO ims_runningbalance VALUES ('456', 'End Plug 3 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.484165', '2025-03-07 05:35:51.484325', '03-111', '19');
INSERT INTO ims_runningbalance VALUES ('457', 'End Plug 3/4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.515543', '2025-03-07 05:35:51.515662', '03-112', '19');
INSERT INTO ims_runningbalance VALUES ('458', 'End Plug 4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.546884', '2025-03-07 05:35:51.547052', '03-113', '19');
INSERT INTO ims_runningbalance VALUES ('459', 'Sleeve-Type Coupling 8"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.573497', '2025-03-07 05:35:51.573656', '03-114', '19');
INSERT INTO ims_runningbalance VALUES ('460', 'Fabricated Elbow 3"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.600206', '2025-03-07 05:35:51.600341', '03-115', '19');
INSERT INTO ims_runningbalance VALUES ('461', 'Fabricated Elbow 4"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.626353', '2025-03-07 05:35:51.626488', '03-116', '19');
INSERT INTO ims_runningbalance VALUES ('462', 'Fabricated Elbow 6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.650376', '2025-03-07 05:35:51.650505', '03-117', '19');
INSERT INTO ims_runningbalance VALUES ('463', 'Fabricated Reducer 3 x 2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.676866', '2025-03-07 05:35:51.677056', '03-118', '19');
INSERT INTO ims_runningbalance VALUES ('464', 'Fabricated Tee 3 x 2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.703436', '2025-03-07 05:35:51.703565', '03-119', '19');
INSERT INTO ims_runningbalance VALUES ('465', 'Fabricated Tee 3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.729556', '2025-03-07 05:35:51.729657', '03-120', '19');
INSERT INTO ims_runningbalance VALUES ('466', 'Fabricated Tee 4 x 2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.755380', '2025-03-07 05:35:51.755497', '03-121', '19');
INSERT INTO ims_runningbalance VALUES ('467', 'Fabricated Tee 4 x 3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.777868', '2025-03-07 05:35:51.777981', '03-122', '19');
INSERT INTO ims_runningbalance VALUES ('468', 'Fabricated Tee 4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.802187', '2025-03-07 05:35:51.802290', '03-123', '19');
INSERT INTO ims_runningbalance VALUES ('469', 'Fabricated Tee 6 x 2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.835034', '2025-03-07 05:35:51.835146', '03-124', '19');
INSERT INTO ims_runningbalance VALUES ('470', 'Fabricated Tee 6 x 3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.865107', '2025-03-07 05:35:51.865244', '03-125', '19');
INSERT INTO ims_runningbalance VALUES ('471', 'Fabricated Tee 6 x 4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.893105', '2025-03-07 05:35:51.893220', '03-126', '19');
INSERT INTO ims_runningbalance VALUES ('472', 'Fabricated Tee 6', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.915687', '2025-03-07 05:35:51.915821', '03-127', '19');
INSERT INTO ims_runningbalance VALUES ('473', 'Fabricated Tee 8 x 2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.942740', '2025-03-07 05:35:51.942848', '03-128', '19');
INSERT INTO ims_runningbalance VALUES ('474', 'Fabricated Tee 8 x 3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:51.976288', '2025-03-07 05:35:51.976451', '03-129', '19');
INSERT INTO ims_runningbalance VALUES ('475', 'Fabricated Tee 8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.007666', '2025-03-07 05:35:52.007804', '03-130', '19');
INSERT INTO ims_runningbalance VALUES ('476', 'Female Adaptor 1/2" PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.036231', '2025-03-07 05:35:52.036337', '03-131', '19');
INSERT INTO ims_runningbalance VALUES ('477', 'Female Elbow 1" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.065090', '2025-03-07 05:35:52.065206', '03-132', '19');
INSERT INTO ims_runningbalance VALUES ('478', 'Female Elbow 1/2 HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.094463', '2025-03-07 05:35:52.094563', '03-133', '19');
INSERT INTO ims_runningbalance VALUES ('479', 'Female Elbow 2" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.121544', '2025-03-07 05:35:52.121653', '03-134', '19');
INSERT INTO ims_runningbalance VALUES ('480', 'Female Elbow 3 HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.147618', '2025-03-07 05:35:52.147731', '03-135', '19');
INSERT INTO ims_runningbalance VALUES ('481', 'Female Elbow 3/4 HDPE - NLC- PBP', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.175222', '2025-03-07 05:35:52.175388', '03-136', '19');
INSERT INTO ims_runningbalance VALUES ('482', 'Flange 2"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.198421', '2025-03-07 05:35:52.198545', '03-137', '19');
INSERT INTO ims_runningbalance VALUES ('483', 'Flange 3" ( 8 hole )', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.230333', '2025-03-07 05:35:52.230477', '03-138', '19');
INSERT INTO ims_runningbalance VALUES ('484', 'Flange 6"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.260381', '2025-03-07 05:35:52.260499', '03-139', '19');
INSERT INTO ims_runningbalance VALUES ('485', 'Flange 8"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.295559', '2025-03-07 05:35:52.295721', '03-140', '19');
INSERT INTO ims_runningbalance VALUES ('486', 'Gasket 1/2"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.325424', '2025-03-07 05:35:52.325582', '03-141', '19');
INSERT INTO ims_runningbalance VALUES ('487', 'Gasket 3" - LOCAL', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.354495', '2025-03-07 05:35:52.354637', '03-142', '19');
INSERT INTO ims_runningbalance VALUES ('488', 'Gasket 3/4 "', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.384721', '2025-03-07 05:35:52.384920', '03-143', '19');
INSERT INTO ims_runningbalance VALUES ('489', 'Gasket 8"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.412358', '2025-03-07 05:35:52.412510', '03-144', '19');
INSERT INTO ims_runningbalance VALUES ('490', 'Gate Valve 1" Brass', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.437885', '2025-03-07 05:35:52.438020', '03-145', '19');
INSERT INTO ims_runningbalance VALUES ('491', 'Gate Valve 1/2" Brass', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.466720', '2025-03-07 05:35:52.466867', '03-146', '19');
INSERT INTO ims_runningbalance VALUES ('492', 'Gate Valve 2" Brass', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.496328', '2025-03-07 05:35:52.496488', '03-147', '19');
INSERT INTO ims_runningbalance VALUES ('493', 'Gate Valve 2" Flange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.532828', '2025-03-07 05:35:52.533003', '03-148', '19');
INSERT INTO ims_runningbalance VALUES ('494', 'Gate Valve 2" Mechanical', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.568465', '2025-03-07 05:35:52.568660', '03-149', '19');
INSERT INTO ims_runningbalance VALUES ('495', 'Gate Valve 3" Mechanical', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.595203', '2025-03-07 05:35:52.595330', '03-150', '19');
INSERT INTO ims_runningbalance VALUES ('496', 'Gate Valve 3" Brass', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.623055', '2025-03-07 05:35:52.623203', '03-151', '19');
INSERT INTO ims_runningbalance VALUES ('497', 'Gate Valve 3" Flange- DI (BOHAI)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.652489', '2025-03-07 05:35:52.652606', '03-152', '19');
INSERT INTO ims_runningbalance VALUES ('498', 'Gate Valve 3/4" Brass', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.679472', '2025-03-07 05:35:52.679608', '03-153', '19');
INSERT INTO ims_runningbalance VALUES ('499', 'Gate Valve 4" Flange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.709437', '2025-03-07 05:35:52.709561', '03-154', '19');
INSERT INTO ims_runningbalance VALUES ('500', 'Gate Valve 4" Mechanical', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.737929', '2025-03-07 05:35:52.738045', '03-155', '19');
INSERT INTO ims_runningbalance VALUES ('501', 'Gate Valve 6" Brass', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.766599', '2025-03-07 05:35:52.766763', '03-156', '19');
INSERT INTO ims_runningbalance VALUES ('502', 'Gate Valve 6" Flange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.796151', '2025-03-07 05:35:52.796319', '03-157', '19');
INSERT INTO ims_runningbalance VALUES ('503', 'Gate Valve 6" Mechanical', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.824897', '2025-03-07 05:35:52.825037', '03-158', '19');
INSERT INTO ims_runningbalance VALUES ('504', 'Gate Valve 8" Mechanical', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.853819', '2025-03-07 05:35:52.853935', '03-159', '19');
INSERT INTO ims_runningbalance VALUES ('505', 'GiBault 2"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.882399', '2025-03-07 05:35:52.882570', '03-160', '19');
INSERT INTO ims_runningbalance VALUES ('506', 'GiBault 3"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.912202', '2025-03-07 05:35:52.912342', '03-161', '19');
INSERT INTO ims_runningbalance VALUES ('507', 'GiBault 4"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.944945', '2025-03-07 05:35:52.945088', '03-162', '19');
INSERT INTO ims_runningbalance VALUES ('508', 'GiBault 6"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:52.974499', '2025-03-07 05:35:52.974617', '03-163', '19');
INSERT INTO ims_runningbalance VALUES ('509', 'GiBault 8"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.004078', '2025-03-07 05:35:53.004195', '03-164', '19');
INSERT INTO ims_runningbalance VALUES ('510', 'Gate Valve 2" Flange Type CI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.035412', '2025-03-07 05:35:53.035554', '03-165', '19');
INSERT INTO ims_runningbalance VALUES ('511', 'Gate Valve 3" Flange Type CI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.067983', '2025-03-07 05:35:53.068150', '03-166', '19');
INSERT INTO ims_runningbalance VALUES ('512', 'Gate Valve 4" Flange Type CI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.099247', '2025-03-07 05:35:53.099415', '03-167', '19');
INSERT INTO ims_runningbalance VALUES ('513', 'Mechanical Flange 3" - LOCAL', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.126321', '2025-03-07 05:35:53.126458', '03-168', '19');
INSERT INTO ims_runningbalance VALUES ('514', 'Mechanical Flange 4"- LOCAL', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.153238', '2025-03-07 05:35:53.153396', '03-169', '19');
INSERT INTO ims_runningbalance VALUES ('515', 'Male Adaptor 1" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.185143', '2025-03-07 05:35:53.185305', '03-170', '19');
INSERT INTO ims_runningbalance VALUES ('516', 'Male Adaptor 1" PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.214829', '2025-03-07 05:35:53.214947', '03-171', '19');
INSERT INTO ims_runningbalance VALUES ('517', 'Male Adaptor 1/2" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.245538', '2025-03-07 05:35:53.245697', '03-172', '1');
INSERT INTO ims_runningbalance VALUES ('518', 'Male Adaptor 1/2" PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.278729', '2025-03-07 05:35:53.278849', '03-173', '1');
INSERT INTO ims_runningbalance VALUES ('519', 'Male Adaptor 2" HDPE- FISH', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.305990', '2025-03-07 05:35:53.306107', '03-174', '19');
INSERT INTO ims_runningbalance VALUES ('520', 'Male Adaptor 2" PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.333322', '2025-03-07 05:35:53.333473', '03-175', '19');
INSERT INTO ims_runningbalance VALUES ('521', 'Male Adaptor 3"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.363264', '2025-03-07 05:35:53.363392', '03-176', '19');
INSERT INTO ims_runningbalance VALUES ('522', 'Male Adaptor 3/4 HDPE - FISH', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.392304', '2025-03-07 05:35:53.392447', '03-177', '19');
INSERT INTO ims_runningbalance VALUES ('523', 'Male Adaptor 3/4" PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.422624', '2025-03-07 05:35:53.422808', '03-178', '19');
INSERT INTO ims_runningbalance VALUES ('524', 'Mechanical Elbow 2" 90 deg.', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.454121', '2025-03-07 05:35:53.454257', '03-179', '19');
INSERT INTO ims_runningbalance VALUES ('525', 'Mechanical Elbow 3" 45 deg.', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.485098', '2025-03-07 05:35:53.485253', '03-180', '19');
INSERT INTO ims_runningbalance VALUES ('526', 'Mechanical Elbow 3" 90 deg.', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.511783', '2025-03-07 05:35:53.511956', '03-181', '19');
INSERT INTO ims_runningbalance VALUES ('527', 'Mechanical Elbow 4" 90 deg.', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.540649', '2025-03-07 05:35:53.540791', '03-182', '19');
INSERT INTO ims_runningbalance VALUES ('528', 'Mechanical Elbow 6" 45 deg.', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.571994', '2025-03-07 05:35:53.572101', '03-183', '19');
INSERT INTO ims_runningbalance VALUES ('529', 'Mechanical Elbow 6" 90 deg.', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.598410', '2025-03-07 05:35:53.598518', '03-184', '19');
INSERT INTO ims_runningbalance VALUES ('530', 'Mechanical End Cap 2"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.626563', '2025-03-07 05:35:53.626713', '03-185', '19');
INSERT INTO ims_runningbalance VALUES ('531', 'Mechanical End Cap 4"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.656203', '2025-03-07 05:35:53.656323', '03-186', '19');
INSERT INTO ims_runningbalance VALUES ('532', 'Mechanical Tee 2"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.682194', '2025-03-07 05:35:53.682314', '03-187', '19');
INSERT INTO ims_runningbalance VALUES ('533', 'Mechanical Tee 3 x 3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.710987', '2025-03-07 05:35:53.711146', '03-188', '19');
INSERT INTO ims_runningbalance VALUES ('534', 'Mechanical Tee 4 x 2 CI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.740365', '2025-03-07 05:35:53.740518', '03-189', '19');
INSERT INTO ims_runningbalance VALUES ('535', 'Mechanical Tee 4 x 3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.773519', '2025-03-07 05:35:53.773630', '03-190', '19');
INSERT INTO ims_runningbalance VALUES ('536', 'Mechanical Tee 4 x 4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.800481', '2025-03-07 05:35:53.800600', '03-191', '19');
INSERT INTO ims_runningbalance VALUES ('537', 'Mechanical Tee 6 x 2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.828326', '2025-03-07 05:35:53.828471', '03-192', '19');
INSERT INTO ims_runningbalance VALUES ('538', 'Mechanical Tee 6 x 3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.856771', '2025-03-07 05:35:53.856913', '03-193', '19');
INSERT INTO ims_runningbalance VALUES ('539', 'Mechanical Tee 6 x 4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.885015', '2025-03-07 05:35:53.885156', '03-194', '19');
INSERT INTO ims_runningbalance VALUES ('540', 'Mechanical Tee 6"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.912426', '2025-03-07 05:35:53.912560', '03-195', '19');
INSERT INTO ims_runningbalance VALUES ('541', 'Nipple 1 x 12 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.940814', '2025-03-07 05:35:53.940935', '03-196', '19');
INSERT INTO ims_runningbalance VALUES ('542', 'Nipple 1 x 5 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.969157', '2025-03-07 05:35:53.969274', '03-197', '19');
INSERT INTO ims_runningbalance VALUES ('543', 'Nipple 1 x 8 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:53.999250', '2025-03-07 05:35:53.999384', '03-198', '19');
INSERT INTO ims_runningbalance VALUES ('544', 'Nipple 1" x 2" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.032134', '2025-03-07 05:35:54.032285', '03-199', '19');
INSERT INTO ims_runningbalance VALUES ('545', 'Nipple 1" x 6" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.061088', '2025-03-07 05:35:54.061246', '03-200', '19');
INSERT INTO ims_runningbalance VALUES ('546', 'Nipple 1" x 8" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.089631', '2025-03-07 05:35:54.089745', '03-201', '19');
INSERT INTO ims_runningbalance VALUES ('547', 'Nipple 1/2 x 1 GI - FS', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.118173', '2025-03-07 05:35:54.118303', '03-202', '19');
INSERT INTO ims_runningbalance VALUES ('548', 'Nipple 1/2 x 12 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.145627', '2025-03-07 05:35:54.145801', '03-203', '19');
INSERT INTO ims_runningbalance VALUES ('549', 'Nipple 1/2 x 16 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.172837', '2025-03-07 05:35:54.172961', '03-204', '19');
INSERT INTO ims_runningbalance VALUES ('550', 'Nipple 1/2 x 2 GI - JB', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.199342', '2025-03-07 05:35:54.199509', '03-205', '19');
INSERT INTO ims_runningbalance VALUES ('551', 'Nipple 1/2 x 2" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.230611', '2025-03-07 05:35:54.230748', '03-206', '19');
INSERT INTO ims_runningbalance VALUES ('552', 'Nipple 1/2 x 3 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.261861', '2025-03-07 05:35:54.261979', '03-207', '19');
INSERT INTO ims_runningbalance VALUES ('553', 'Nipple 1/2 x 4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.292254', '2025-03-07 05:35:54.292375', '03-208', '19');
INSERT INTO ims_runningbalance VALUES ('554', 'Nipple 1/2 x 6 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.321552', '2025-03-07 05:35:54.321674', '03-209', '19');
INSERT INTO ims_runningbalance VALUES ('555', 'Nipple 1/2 x 8 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.351655', '2025-03-07 05:35:54.351786', '03-210', '19');
INSERT INTO ims_runningbalance VALUES ('556', 'Nipple 2 1/2 x 5 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.384336', '2025-03-07 05:35:54.384471', '03-211', '19');
INSERT INTO ims_runningbalance VALUES ('557', 'Nipple 2 x 5 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.418803', '2025-03-07 05:35:54.418950', '03-212', '19');
INSERT INTO ims_runningbalance VALUES ('558', 'Nipple 3 x 5 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.446249', '2025-03-07 05:35:54.446405', '03-213', '19');
INSERT INTO ims_runningbalance VALUES ('559', 'Nipple 3/4 x 10 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.473695', '2025-03-07 05:35:54.473863', '03-214', '19');
INSERT INTO ims_runningbalance VALUES ('560', 'Nipple 3/4 x 4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.502866', '2025-03-07 05:35:54.503028', '03-215', '19');
INSERT INTO ims_runningbalance VALUES ('561', 'Nipple 3/4 x 5 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.531304', '2025-03-07 05:35:54.531457', '03-216', '19');
INSERT INTO ims_runningbalance VALUES ('562', 'Nipple 3/4 x 6 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.561167', '2025-03-07 05:35:54.561329', '03-217', '19');
INSERT INTO ims_runningbalance VALUES ('563', 'Nipple 3/4 x 6 HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.588720', '2025-03-07 05:35:54.588882', '03-218', '19');
INSERT INTO ims_runningbalance VALUES ('564', 'Nipple 3/4 x 8 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.616348', '2025-03-07 05:35:54.616491', '03-219', '19');
INSERT INTO ims_runningbalance VALUES ('565', 'Nipple 3/4 x 8 HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.645945', '2025-03-07 05:35:54.646098', '03-220', '19');
INSERT INTO ims_runningbalance VALUES ('566', 'Nipple 4 x 12 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.674140', '2025-03-07 05:35:54.674257', '03-221', '19');
INSERT INTO ims_runningbalance VALUES ('567', 'Nipple 5 x 10 BI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.700642', '2025-03-07 05:35:54.700760', '03-222', '19');
INSERT INTO ims_runningbalance VALUES ('568', 'Repair Clamp 2" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.729165', '2025-03-07 05:35:54.729361', '03-223', '19');
INSERT INTO ims_runningbalance VALUES ('569', 'Repair Clamp 3" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.759814', '2025-03-07 05:35:54.760003', '03-224', '19');
INSERT INTO ims_runningbalance VALUES ('570', 'Repair Clamp 4" HDPE - MIE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.788663', '2025-03-07 05:35:54.788779', '03-225', '19');
INSERT INTO ims_runningbalance VALUES ('571', 'Repair Clamp 6" HDPE - MIE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.816973', '2025-03-07 05:35:54.817106', '03-226', '19');
INSERT INTO ims_runningbalance VALUES ('572', 'Repair Clamp 8" HDPE - MIE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.847182', '2025-03-07 05:35:54.847296', '03-227', '19');
INSERT INTO ims_runningbalance VALUES ('573', 'Saddle Clamp 2 x 1 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.877341', '2025-03-07 05:35:54.877485', '03-228', '19');
INSERT INTO ims_runningbalance VALUES ('574', 'Saddle Clamp 2 x 1 HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.910652', '2025-03-07 05:35:54.910817', '03-229', '19');
INSERT INTO ims_runningbalance VALUES ('575', 'Saddle Clamp 2 x 3/4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.942650', '2025-03-07 05:35:54.942766', '03-230', '19');
INSERT INTO ims_runningbalance VALUES ('576', 'Saddle Clamp 3 x 1 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:54.972417', '2025-03-07 05:35:54.972533', '03-231', '19');
INSERT INTO ims_runningbalance VALUES ('577', 'Saddle Clamp 3 x 3/4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.003309', '2025-03-07 05:35:55.003468', '03-232', '19');
INSERT INTO ims_runningbalance VALUES ('578', 'Saddle Clamp 4 x 1 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.034097', '2025-03-07 05:35:55.034235', '03-233', '19');
INSERT INTO ims_runningbalance VALUES ('579', 'Saddle Clamp 4 x 3/4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.066938', '2025-03-07 05:35:55.067065', '03-234', '19');
INSERT INTO ims_runningbalance VALUES ('580', 'Saddle Clamp 4x2 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.099356', '2025-03-07 05:35:55.099520', '03-235', '19');
INSERT INTO ims_runningbalance VALUES ('581', 'Saddle Clamp 6 x 1 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.135866', '2025-03-07 05:35:55.135985', '03-236', '19');
INSERT INTO ims_runningbalance VALUES ('582', 'Saddle Clamp 6 x 1/2 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.168102', '2025-03-07 05:35:55.168240', '03-237', '19');
INSERT INTO ims_runningbalance VALUES ('583', 'Saddle Clamp 6 x 2 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.195919', '2025-03-07 05:35:55.196038', '03-238', '19');
INSERT INTO ims_runningbalance VALUES ('584', 'Saddle Clamp 6 x 3/4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.229082', '2025-03-07 05:35:55.229248', '03-239', '19');
INSERT INTO ims_runningbalance VALUES ('585', 'Saddle Clamp 6" x 1" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.260255', '2025-03-07 05:35:55.260381', '03-240', '19');
INSERT INTO ims_runningbalance VALUES ('586', 'Saddle Clamp 8" x 1" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.286107', '2025-03-07 05:35:55.286228', '03-241', '19');
INSERT INTO ims_runningbalance VALUES ('587', 'Saddle Clamp 8" x 1" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.317402', '2025-03-07 05:35:55.317519', '03-242', '19');
INSERT INTO ims_runningbalance VALUES ('588', 'Saddle Clamp 8" x 2" - HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.350742', '2025-03-07 05:35:55.350900', '03-243', '19');
INSERT INTO ims_runningbalance VALUES ('589', 'Saddle Clamp 8" x 2" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.382841', '2025-03-07 05:35:55.383003', '03-244', '19');
INSERT INTO ims_runningbalance VALUES ('590', 'Side Bolts 3/4 x 8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.416959', '2025-03-07 05:35:55.417138', '03-245', '19');
INSERT INTO ims_runningbalance VALUES ('591', 'Sleeve-Type Coupling 2"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.448585', '2025-03-07 05:35:55.448744', '03-246', '19');
INSERT INTO ims_runningbalance VALUES ('592', 'Sleeve-Type Coupling 3" DI pvc to pvc- PVMC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.484106', '2025-03-07 05:35:55.484214', '03-247', '19');
INSERT INTO ims_runningbalance VALUES ('593', 'Sleeve-Type Coupling 4 x 2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.514560', '2025-03-07 05:35:55.514684', '03-248', '19');
INSERT INTO ims_runningbalance VALUES ('594', 'Sleeve-Type Coupling 4" DI pvc to pvc- PVMC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.544205', '2025-03-07 05:35:55.544354', '03-249', '19');
INSERT INTO ims_runningbalance VALUES ('595', 'STC (GI-PVC) 6" (GI to GI)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.572410', '2025-03-07 05:35:55.572565', '03-250', '19');
INSERT INTO ims_runningbalance VALUES ('596', 'Sleeve-Type Coupling 6" DI (PVC to PVC)- PVMC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.604620', '2025-03-07 05:35:55.604817', '03-251', '19');
INSERT INTO ims_runningbalance VALUES ('597', 'Stub End 2" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.634716', '2025-03-07 05:35:55.634829', '03-252', '19');
INSERT INTO ims_runningbalance VALUES ('598', 'Stub End 3" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.661736', '2025-03-07 05:35:55.661848', '03-253', '19');
INSERT INTO ims_runningbalance VALUES ('599', 'Stub End 4" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.690867', '2025-03-07 05:35:55.691069', '03-254', '19');
INSERT INTO ims_runningbalance VALUES ('600', 'Stub End 6" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.718866', '2025-03-07 05:35:55.718980', '03-255', '19');
INSERT INTO ims_runningbalance VALUES ('601', 'Stub End 8" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.745850', '2025-03-07 05:35:55.745957', '03-256', '19');
INSERT INTO ims_runningbalance VALUES ('602', 'Tee 1" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.772463', '2025-03-07 05:35:55.772599', '03-257', '19');
INSERT INTO ims_runningbalance VALUES ('603', 'Tee 1" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.798836', '2025-03-07 05:35:55.799005', '03-258', '19');
INSERT INTO ims_runningbalance VALUES ('604', 'Tee 1/2" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.827963', '2025-03-07 05:35:55.828073', '03-259', '1');
INSERT INTO ims_runningbalance VALUES ('605', 'Tee 1/2" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.855159', '2025-03-07 05:35:55.855275', '03-260', '1');
INSERT INTO ims_runningbalance VALUES ('606', 'Tee 1/2" PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.880717', '2025-03-07 05:35:55.880836', '03-261', '1');
INSERT INTO ims_runningbalance VALUES ('607', 'Tee 2" Flange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.904547', '2025-03-07 05:35:55.904659', '03-262', '19');
INSERT INTO ims_runningbalance VALUES ('608', 'Tee 2" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.931808', '2025-03-07 05:35:55.931909', '03-263', '19');
INSERT INTO ims_runningbalance VALUES ('609', 'Tee 3" Flange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.956210', '2025-03-07 05:35:55.956355', '03-264', '19');
INSERT INTO ims_runningbalance VALUES ('610', 'Tee 3" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:55.985333', '2025-03-07 05:35:55.985450', '03-265', '19');
INSERT INTO ims_runningbalance VALUES ('611', 'Tee 3" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.012063', '2025-03-07 05:35:56.012204', '03-266', '19');
INSERT INTO ims_runningbalance VALUES ('612', 'Tee 3/4" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.038455', '2025-03-07 05:35:56.038591', '03-267', '1');
INSERT INTO ims_runningbalance VALUES ('613', 'Tee 3/4"HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.066447', '2025-03-07 05:35:56.066559', '03-268', '1');
INSERT INTO ims_runningbalance VALUES ('614', 'Tee 4" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.095235', '2025-03-07 05:35:56.095388', '03-269', '19');
INSERT INTO ims_runningbalance VALUES ('615', 'Tee Reducer 1 x 3/4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.125696', '2025-03-07 05:35:56.125856', '03-270', '19');
INSERT INTO ims_runningbalance VALUES ('616', 'Tee Reducer 1" x 1/2 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.154879', '2025-03-07 05:35:56.154997', '03-271', '19');
INSERT INTO ims_runningbalance VALUES ('617', 'Tee Reducer 1/2 x 3/4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.183538', '2025-03-07 05:35:56.183652', '03-272', '19');
INSERT INTO ims_runningbalance VALUES ('618', 'Tee Reducer 3 x 2 HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.213262', '2025-03-07 05:35:56.213416', '03-273', '19');
INSERT INTO ims_runningbalance VALUES ('619', 'Tee Reducer 4 x 2 HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.237666', '2025-03-07 05:35:56.237788', '03-274', '19');
INSERT INTO ims_runningbalance VALUES ('620', 'Tee Reducer 4 x 3 HDPE- FISH', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.266788', '2025-03-07 05:35:56.266942', '03-275', '19');
INSERT INTO ims_runningbalance VALUES ('621', 'Tee 6" Flange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.294622', '2025-03-07 05:35:56.294787', '03-276', '19');
INSERT INTO ims_runningbalance VALUES ('622', 'Tee 6 x 4  Mechanical CI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.323423', '2025-03-07 05:35:56.323546', '03-277', '19');
INSERT INTO ims_runningbalance VALUES ('623', 'Valve Cover - 4" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.350040', '2025-03-07 05:35:56.350158', '03-278', '19');
INSERT INTO ims_runningbalance VALUES ('624', 'Valve Cover - 6" G.I.', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.378641', '2025-03-07 05:35:56.378784', '03-279', '19');
INSERT INTO ims_runningbalance VALUES ('625', 'Y-connector with ferrul 3/4"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.407555', '2025-03-07 05:35:56.407682', '03-280', '19');
INSERT INTO ims_runningbalance VALUES ('626', 'Y-Strainer 2"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.433617', '2025-03-07 05:35:56.433733', '03-281', '19');
INSERT INTO ims_runningbalance VALUES ('627', 'Y-Strainer 3"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.464675', '2025-03-07 05:35:56.464833', '03-282', '19');
INSERT INTO ims_runningbalance VALUES ('628', 'Y-Strainer 4"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.493832', '2025-03-07 05:35:56.493945', '03-283', '19');
INSERT INTO ims_runningbalance VALUES ('629', 'Y-Strainer 6" Flange', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.523824', '2025-03-07 05:35:56.523938', '03-284', '19');
INSERT INTO ims_runningbalance VALUES ('630', 'Elbow 6 x 45 deg (sched 80) GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.551283', '2025-03-07 05:35:56.551442', '03-285', '19');
INSERT INTO ims_runningbalance VALUES ('631', 'Elbow 6 x 90 deg (sched 80) GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.578836', '2025-03-07 05:35:56.578957', '03-286', '19');
INSERT INTO ims_runningbalance VALUES ('632', 'STC (GI-HDPE) 6" - BLACK', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.613666', '2025-03-07 05:35:56.613829', '03-287', '19');
INSERT INTO ims_runningbalance VALUES ('633', 'STC (GI-PVC) 2"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.642082', '2025-03-07 05:35:56.642220', '03-288', '19');
INSERT INTO ims_runningbalance VALUES ('634', 'STC (GI-PVC) 4"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.666310', '2025-03-07 05:35:56.666428', '03-289', '19');
INSERT INTO ims_runningbalance VALUES ('635', 'Checkvalve 3" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.695643', '2025-03-07 05:35:56.695807', '03-290', '19');
INSERT INTO ims_runningbalance VALUES ('636', 'Cross Tee Fabricated HDPE 4"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.726083', '2025-03-07 05:35:56.726197', '03-291', '19');
INSERT INTO ims_runningbalance VALUES ('637', 'Cross Tee HDPE 3"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.759433', '2025-03-07 05:35:56.759567', '03-292', '19');
INSERT INTO ims_runningbalance VALUES ('638', 'Cross Tee HDPE 4x3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.790630', '2025-03-07 05:35:56.790770', '03-293', '19');
INSERT INTO ims_runningbalance VALUES ('639', 'Cross Tee HDPE 6x3', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.821480', '2025-03-07 05:35:56.821612', '03-294', '19');
INSERT INTO ims_runningbalance VALUES ('640', 'Cross Tee HDPE 6x4', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.846179', '2025-03-07 05:35:56.846332', '03-295', '19');
INSERT INTO ims_runningbalance VALUES ('641', 'Nipple 1"x24" GI (sched 80)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.874296', '2025-03-07 05:35:56.874417', '03-296', '19');
INSERT INTO ims_runningbalance VALUES ('642', 'Coupling Reducer 1" x 3/4" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.902908', '2025-03-07 05:35:56.903072', '03-297', '19');
INSERT INTO ims_runningbalance VALUES ('643', 'Tee w/ Thread 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.935524', '2025-03-07 05:35:56.935697', '03-298', '19');
INSERT INTO ims_runningbalance VALUES ('644', 'Elbow 4 x 90 sched80', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.964871', '2025-03-07 05:35:56.964983', '03-299', '19');
INSERT INTO ims_runningbalance VALUES ('645', 'STC 4" ( GI to HDPE) DI - BLUE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:56.994434', '2025-03-07 05:35:56.994587', '03-300', '19');
INSERT INTO ims_runningbalance VALUES ('646', 'Cross Tee HDPE 3 x 2 - fabricated', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.023655', '2025-03-07 05:35:57.023769', '03-301', '19');
INSERT INTO ims_runningbalance VALUES ('647', 'STC 3" (GI to HDPE)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.047989', '2025-03-07 05:35:57.048105', '03-302', '19');
INSERT INTO ims_runningbalance VALUES ('648', 'Elbow 3" GI 90deg (sched 80)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.079077', '2025-03-07 05:35:57.079199', '03-303', '19');
INSERT INTO ims_runningbalance VALUES ('649', 'STC 8"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.108281', '2025-03-07 05:35:57.108408', '03-304', '19');
INSERT INTO ims_runningbalance VALUES ('650', 'Elbow 3" 45 deg. (schd.80)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.140260', '2025-03-07 05:35:57.140377', '03-305', '19');
INSERT INTO ims_runningbalance VALUES ('652', 'Gate Valve Flange type 8" w/ bang', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.181859', '2025-03-07 05:35:57.181975', '03-306', '19');
INSERT INTO ims_runningbalance VALUES ('654', 'Nipple 1/2 x 5', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.206748', '2025-03-07 05:35:57.206871', '03-307', '19');
INSERT INTO ims_runningbalance VALUES ('656', 'Elbow 8 x 90 deg. - HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.234206', '2025-03-07 05:35:57.234321', '03-308', '19');
INSERT INTO ims_runningbalance VALUES ('658', 'Coupling Reducer 8 x 6 - HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.263392', '2025-03-07 05:35:57.263560', '03-309', '19');
INSERT INTO ims_runningbalance VALUES ('660', 'Fabricated Coupling 6 x 8', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.292249', '2025-03-07 05:35:57.292377', '03-310', '19');
INSERT INTO ims_runningbalance VALUES ('661', 'Check Valve 3/4- Brass', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.312149', '2025-03-07 05:35:57.312279', '03-311', '19');
INSERT INTO ims_runningbalance VALUES ('663', 'Valve Cover 6" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.355449', '2025-03-07 05:35:57.355607', '03-312', '19');
INSERT INTO ims_runningbalance VALUES ('664', 'Fabricated Elbow 4 x 90 deg. HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.369723', '2025-03-07 05:35:57.369842', '03-313', '19');
INSERT INTO ims_runningbalance VALUES ('665', 'Fabricated Elbow 6 x 90 deg. HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.397153', '2025-03-07 05:35:57.397278', '03-314', '19');
INSERT INTO ims_runningbalance VALUES ('666', 'Fabricated Elbow 8 x 45 deg. HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.423541', '2025-03-07 05:35:57.423664', '03-315', '19');
INSERT INTO ims_runningbalance VALUES ('667', 'Coupling Reducer 8 x 4 - HDPE ( Fabricated)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.453661', '2025-03-07 05:35:57.453830', '03-316', '19');
INSERT INTO ims_runningbalance VALUES ('668', 'Coupling Reducer 8 x 6 - HDPE ( Fabricated)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.481690', '2025-03-07 05:35:57.481852', '03-317', '19');
INSERT INTO ims_runningbalance VALUES ('669', 'Gasket- 6"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.514266', '2025-03-07 05:35:57.514881', '03-318', '19');
INSERT INTO ims_runningbalance VALUES ('670', 'DI Gate Valve Flange Type 8"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.541493', '2025-03-07 05:35:57.541655', '03-319', '19');
INSERT INTO ims_runningbalance VALUES ('671', 'Bolt and nut 5/8 x 8- Full Thread', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.571761', '2025-03-07 05:35:57.571877', '03-320', '19');
INSERT INTO ims_runningbalance VALUES ('672', 'Full thread 3/4 x 10 ft.', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.600002', '2025-03-07 05:35:57.600157', '03-321', '19');
INSERT INTO ims_runningbalance VALUES ('673', 'Bell Reducer 5 x 4 GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.634260', '2025-03-07 05:35:57.634390', '03-322', '19');
INSERT INTO ims_runningbalance VALUES ('674', 'Tee 4" Flange type CI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.662510', '2025-03-07 05:35:57.662690', '03-323', '19');
INSERT INTO ims_runningbalance VALUES ('675', 'Nut GI - 5/8"- LOCAL', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.691660', '2025-03-07 05:35:57.691790', '03-324', '19');
INSERT INTO ims_runningbalance VALUES ('676', 'Bell Reducer GI 1/2 x 3/4 - JB', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.721753', '2025-03-07 05:35:57.721943', '03-325', '19');
INSERT INTO ims_runningbalance VALUES ('677', 'End Cap 3/4 GI - MECH', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.749699', '2025-03-07 05:35:57.749899', '03-326', '19');
INSERT INTO ims_runningbalance VALUES ('678', 'End Plug 3/4 GI - JB', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.780674', '2025-03-07 05:35:57.780835', '03-327', '19');
INSERT INTO ims_runningbalance VALUES ('679', 'End Plug 1"GI - JB', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.807819', '2025-03-07 05:35:57.808002', '03-328', '19');
INSERT INTO ims_runningbalance VALUES ('680', 'Nipple 3/4 x 5 GI - JB', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.835151', '2025-03-07 05:35:57.835279', '03-329', '19');
INSERT INTO ims_runningbalance VALUES ('681', 'Nipple 3/4 x 8 GI - FS', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.867221', '2025-03-07 05:35:57.867354', '03-330', '19');
INSERT INTO ims_runningbalance VALUES ('682', 'Nipple 1 x 5 GI - AKUA', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.896662', '2025-03-07 05:35:57.896798', '03-331', '19');
INSERT INTO ims_runningbalance VALUES ('683', 'Nipple 1 x 8 GI - AKUA', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.928809', '2025-03-07 05:35:57.928964', '03-332', '19');
INSERT INTO ims_runningbalance VALUES ('684', 'Saddle Clamp 3 x 3/4 DI - PV', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.954615', '2025-03-07 05:35:57.954773', '03-333', '19');
INSERT INTO ims_runningbalance VALUES ('685', 'Saddle Clamp 6 x 1 DI - PV', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:57.982408', '2025-03-07 05:35:57.982562', '03-334', '19');
INSERT INTO ims_runningbalance VALUES ('686', 'Sleeve-Type Coupling 3" DI pvc to pvc- BOHAI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.011310', '2025-03-07 05:35:58.011423', '03-335', '19');
INSERT INTO ims_runningbalance VALUES ('687', 'Sleeve-Type Coupling 4" DI pvc to pvc- BOHAI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.036603', '2025-03-07 05:35:58.036721', '03-336', '19');
INSERT INTO ims_runningbalance VALUES ('688', 'Sleeve-Type Coupling 6" DI (PVC to PVC)- BOHAI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.067079', '2025-03-07 05:35:58.067199', '03-337', '19');
INSERT INTO ims_runningbalance VALUES ('689', 'Male Adaptor 3/4 nlc- PBP', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.093583', '2025-03-07 05:35:58.093710', '03-338', '19');
INSERT INTO ims_runningbalance VALUES ('690', 'Male Adaptor 1 nlc- PBP', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.123354', '2025-03-07 05:35:58.123516', '03-339', '19');
INSERT INTO ims_runningbalance VALUES ('691', 'PVC Pipe 1/2 w/ hub- NELTEX', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.153093', '2025-03-07 05:35:58.153209', '03-340', '19');
INSERT INTO ims_runningbalance VALUES ('692', 'Male Adaptor 1/2 PVC- TIAN BLUE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.184546', '2025-03-07 05:35:58.184709', '03-341', '19');
INSERT INTO ims_runningbalance VALUES ('693', 'Coupling 1/2 PVC- TIAN BLUE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.211389', '2025-03-07 05:35:58.211547', '03-342', '19');
INSERT INTO ims_runningbalance VALUES ('694', 'Elbow Plain 1/2 PVC- TIAN BLUE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.237136', '2025-03-07 05:35:58.237297', '03-343', '19');
INSERT INTO ims_runningbalance VALUES ('695', 'Repair Clamp 2" HDPE -MIE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.266998', '2025-03-07 05:35:58.267158', '03-344', '19');
INSERT INTO ims_runningbalance VALUES ('696', 'Repair Clamp 3" HDPE -MIE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.295322', '2025-03-07 05:35:58.295444', '03-345', '19');
INSERT INTO ims_runningbalance VALUES ('697', 'Tee Reducer 1 x 3/4 GI - JB', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.324553', '2025-03-07 05:35:58.324696', '03-346', '19');
INSERT INTO ims_runningbalance VALUES ('698', 'Tee 3/4 GI - JB', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.353246', '2025-03-07 05:35:58.353448', '03-347', '19');
INSERT INTO ims_runningbalance VALUES ('699', 'Nipple 1/2 x 1 GI - MICRO', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.381614', '2025-03-07 05:35:58.381768', '03-348', '19');
INSERT INTO ims_runningbalance VALUES ('700', 'Nipple 1/2 x 2 GI - MICRO', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.408816', '2025-03-07 05:35:58.408968', '03-349', '19');
INSERT INTO ims_runningbalance VALUES ('701', 'Coupling 1" HDPE - FISH', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.435154', '2025-03-07 05:35:58.435268', '03-350', '19');
INSERT INTO ims_runningbalance VALUES ('702', 'Female Elbow 1/2 HDPE- PBP', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.463874', '2025-03-07 05:35:58.464003', '03-351', '19');
INSERT INTO ims_runningbalance VALUES ('703', 'DI Sleeve type coupling pvc-pvc 4"- HIWA', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.490606', '2025-03-07 05:35:58.490722', '03-352', '19');
INSERT INTO ims_runningbalance VALUES ('704', 'DI Sleeve type coupling pvc-pvc 6"-HIWA', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.521859', '2025-03-07 05:35:58.522016', '03-353', '19');
INSERT INTO ims_runningbalance VALUES ('705', 'CI Sleeve Type coupling pvc- GI 6"- CMI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.552834', '2025-03-07 05:35:58.552958', '03-354', '19');
INSERT INTO ims_runningbalance VALUES ('706', 'Flow meter 4" Paddle Wheel Type- ZENNER', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.585626', '2025-03-07 05:35:58.585743', '03-355', '19');
INSERT INTO ims_runningbalance VALUES ('707', 'Flow meter 6" Paddle Wheel Type- ZENNER', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.615597', '2025-03-07 05:35:58.615759', '03-356', '19');
INSERT INTO ims_runningbalance VALUES ('708', 'GASKET 4- LOCAL', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.648647', '2025-03-07 05:35:58.648820', '03-357', '19');
INSERT INTO ims_runningbalance VALUES ('709', 'STC 4" ( GI to GI)- CMI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.674128', '2025-03-07 05:35:58.674286', '03-358', '19');
INSERT INTO ims_runningbalance VALUES ('710', 'Check Valve 1/2 Brass- ACE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.703350', '2025-03-07 05:35:58.703514', '03-359', '19');
INSERT INTO ims_runningbalance VALUES ('711', 'Ball Valve 1/2 Lockwing -ACE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.732890', '2025-03-07 05:35:58.733049', '03-360', '19');
INSERT INTO ims_runningbalance VALUES ('712', 'Nipple 1/2 x 12 GI - JB', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.759910', '2025-03-07 05:35:58.760073', '03-361', '19');
INSERT INTO ims_runningbalance VALUES ('713', 'Male Adaptor 1/2 HDPE- PBP', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.786855', '2025-03-07 05:35:58.787012', '03-362', '19');
INSERT INTO ims_runningbalance VALUES ('714', 'Pipe 1" HDPE- MIG', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.814670', '2025-03-07 05:35:58.814823', '04-001', '19');
INSERT INTO ims_runningbalance VALUES ('715', 'Pipe 1" PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.843115', '2025-03-07 05:35:58.843229', '04-002', '14');
INSERT INTO ims_runningbalance VALUES ('716', 'Pipe 1/2 HDPE - MIG', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.870883', '2025-03-07 05:35:58.871002', '04-003', '14');
INSERT INTO ims_runningbalance VALUES ('717', 'Pipe 1/2 PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.901235', '2025-03-07 05:35:58.901637', '04-004', '14');
INSERT INTO ims_runningbalance VALUES ('718', 'Pipe 2" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.929748', '2025-03-07 05:35:58.929905', '04-005', '14');
INSERT INTO ims_runningbalance VALUES ('719', 'Pipe 3" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.955697', '2025-03-07 05:35:58.955854', '04-006', '14');
INSERT INTO ims_runningbalance VALUES ('720', 'Pipe 3" RISER PIPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:58.983147', '2025-03-07 05:35:58.983269', '04-007', '14');
INSERT INTO ims_runningbalance VALUES ('721', 'Pipe 3/4 HDPE - MIG', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.013095', '2025-03-07 05:35:59.013236', '04-008', '19');
INSERT INTO ims_runningbalance VALUES ('722', 'Pipe 4" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.043316', '2025-03-07 05:35:59.043440', '04-009', '14');
INSERT INTO ims_runningbalance VALUES ('723', 'Pipe 4" PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.071151', '2025-03-07 05:35:59.071314', '04-010', '14');
INSERT INTO ims_runningbalance VALUES ('724', 'Pipe 4" RISER HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.100716', '2025-03-07 05:35:59.100866', '04-011', '19');
INSERT INTO ims_runningbalance VALUES ('725', 'Pipe 4" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.128759', '2025-03-07 05:35:59.128869', '04-012', '19');
INSERT INTO ims_runningbalance VALUES ('726', 'Pipe 6" GI (sched 80)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.155925', '2025-03-07 05:35:59.156075', '04-013', '19');
INSERT INTO ims_runningbalance VALUES ('727', 'Pipe 6" HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.180372', '2025-03-07 05:35:59.180488', '04-014', '19');
INSERT INTO ims_runningbalance VALUES ('728', 'Pipe 8" PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.205443', '2025-03-07 05:35:59.205560', '04-015', '19');
INSERT INTO ims_runningbalance VALUES ('729', 'Pipe 10" PVC', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.232328', '2025-03-07 05:35:59.232446', '04-016', '19');
INSERT INTO ims_runningbalance VALUES ('730', 'Pipe RISER 4" GI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.255950', '2025-03-07 05:35:59.256067', '04-017', '19');
INSERT INTO ims_runningbalance VALUES ('731', 'Pipe 3" GI (sched 80)', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.287004', '2025-03-07 05:35:59.287119', '04-018', '19');
INSERT INTO ims_runningbalance VALUES ('732', 'Pipe 8" - HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.316624', '2025-03-07 05:35:59.316786', '04-019', '19');
INSERT INTO ims_runningbalance VALUES ('733', 'Pipe 1 1/2 GI LSII', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.344251', '2025-03-07 05:35:59.344411', '04-020', '19');
INSERT INTO ims_runningbalance VALUES ('734', 'Pipe 1 1 /2 GI s20', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.370993', '2025-03-07 05:35:59.371109', '04-021', '19');
INSERT INTO ims_runningbalance VALUES ('735', 'Flow Meter 2"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.399521', '2025-03-07 05:35:59.399655', '05-001', '19');
INSERT INTO ims_runningbalance VALUES ('736', 'Flow Meter 3"- ZENNER', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.426603', '2025-03-07 05:35:59.426721', '05-002', '19');
INSERT INTO ims_runningbalance VALUES ('737', 'Flow Meter 4"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.450239', '2025-03-07 05:35:59.450410', '05-003', '19');
INSERT INTO ims_runningbalance VALUES ('738', 'Flow Meter 6"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.477268', '2025-03-07 05:35:59.477381', '05-004', '19');
INSERT INTO ims_runningbalance VALUES ('739', 'Water Meter - Brass 1/2" - HYJET', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.504255', '2025-03-07 05:35:59.504369', '05-005', '19');
INSERT INTO ims_runningbalance VALUES ('740', 'Water Meter - Plastic 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.535496', '2025-03-07 05:35:59.535635', '05-006', '19');
INSERT INTO ims_runningbalance VALUES ('741', 'Water Meter 3/4 - Brass - ACE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.561205', '2025-03-07 05:35:59.561369', '05-007', '19');
INSERT INTO ims_runningbalance VALUES ('742', 'Water Meter - Brass 1" - ACE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.592130', '2025-03-07 05:35:59.592291', '05-008', '19');
INSERT INTO ims_runningbalance VALUES ('743', 'Water Meter - Brass 2"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.620468', '2025-03-07 05:35:59.620584', '05-009', '19');
INSERT INTO ims_runningbalance VALUES ('744', 'Chemical Solution Tank 100L', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.648023', '2025-03-07 05:35:59.648139', '06-001', '9');
INSERT INTO ims_runningbalance VALUES ('745', 'Caution Tape', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.670806', '2025-03-07 05:35:59.670923', '06-002', '19');
INSERT INTO ims_runningbalance VALUES ('746', 'Fire Hydrant Head 2 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.697862', '2025-03-07 05:35:59.698027', '06-003', '19');
INSERT INTO ims_runningbalance VALUES ('747', 'Fire Hydrant Head 3 X 2 1/2', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.722670', '2025-03-07 05:35:59.722776', '06-004', '19');
INSERT INTO ims_runningbalance VALUES ('748', 'Pressure Gauge 0-60 PSI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.748768', '2025-03-07 05:35:59.748890', '06-005', '19');
INSERT INTO ims_runningbalance VALUES ('749', 'Pressure Reducer Valve 3"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.774399', '2025-03-07 05:35:59.774499', '06-006', '19');
INSERT INTO ims_runningbalance VALUES ('750', 'Pressure Reducer Valve 4"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.800850', '2025-03-07 05:35:59.800962', '06-007', '19');
INSERT INTO ims_runningbalance VALUES ('751', 'Pressure Reducer Valve 6"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.828025', '2025-03-07 05:35:59.828189', '06-008', '19');
INSERT INTO ims_runningbalance VALUES ('752', 'PVC Pipe Cement- ATLANTA', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.852198', '2025-03-07 05:35:59.852383', '06-009', '19');
INSERT INTO ims_runningbalance VALUES ('753', 'Padlock', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.878716', '2025-03-07 05:35:59.878818', '06-010', '19');
INSERT INTO ims_runningbalance VALUES ('754', 'Hacksaw Blade 12" Sandflex', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.907764', '2025-03-07 05:35:59.907872', '06-011', '19');
INSERT INTO ims_runningbalance VALUES ('755', 'Teflon Tape - ROYAL', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.938649', '2025-03-07 05:35:59.938754', '06-012', '19');
INSERT INTO ims_runningbalance VALUES ('756', 'Pressure Gauge 100 PSI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.963533', '2025-03-07 05:35:59.963684', '06-013', '19');
INSERT INTO ims_runningbalance VALUES ('757', 'Concrete Cutter Blade 14"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:35:59.998358', '2025-03-07 05:35:59.998460', '06-014', '19');
INSERT INTO ims_runningbalance VALUES ('758', 'Chemical Solution Tank 200L', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:36:00.027715', '2025-03-07 05:36:00.027833', '06-015', '9');
INSERT INTO ims_runningbalance VALUES ('759', 'Pressure Gauge 300 PSI', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:36:00.054186', '2025-03-07 05:36:00.054351', '06-016', '19');
INSERT INTO ims_runningbalance VALUES ('760', 'GI Bolts & Nuts 5/8 5" (Fullthread)- LOCAL', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:36:00.082625', '2025-03-07 05:36:00.082790', '06-017', '19');
INSERT INTO ims_runningbalance VALUES ('761', 'Rubber O-ring 4" PVC sure lock riser pipe', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:36:00.109590', '2025-03-07 05:36:00.109705', '06-018', '19');
INSERT INTO ims_runningbalance VALUES ('762', 'Bolt & Nut  w/ washer', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:36:00.136720', '2025-03-07 05:36:00.136867', '06-019', '19');
INSERT INTO ims_runningbalance VALUES ('763', 'Bolt & Nut m-6 x 20 w/ washer', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:36:00.171789', '2025-03-07 05:36:00.171955', '06-020', '19');
INSERT INTO ims_runningbalance VALUES ('764', 'Lock Washer', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:36:00.206905', '2025-03-07 05:36:00.207073', '06-021', '19');
INSERT INTO ims_runningbalance VALUES ('765', 'PE Hose 4 x 6 - white', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:36:00.235560', '2025-03-07 05:36:00.235692', '06-022', '20');
INSERT INTO ims_runningbalance VALUES ('766', 'Bolt and Nut 3/4 x 4 -full thread', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:36:00.264706', '2025-03-07 05:36:00.264873', '06-023', '19');
INSERT INTO ims_runningbalance VALUES ('767', 'Cutting Disc 4"- BLUE SHARK', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:36:00.296139', '2025-03-07 05:36:00.296290', '06-024', '19');
INSERT INTO ims_runningbalance VALUES ('768', 'Cut Off 14"', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:36:00.321555', '2025-03-07 05:36:00.321671', '06-025', '19');
INSERT INTO ims_runningbalance VALUES ('769', 'Saddle Clamp w/ Ferrule - 8 x 1 - HDPE', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:36:00.349025', '2025-03-07 05:36:00.349183', '06-026', '19');
INSERT INTO ims_runningbalance VALUES ('770', 'New Other Materials', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.0', '0.00', 'Non-Moving', '2025-03-07 05:36:00.378531', '2025-03-07 05:36:00.378645', '06-027', '1');

CREATE TABLE `ims_section` (
  `sectionID` int NOT NULL AUTO_INCREMENT,
  `sectionName` varchar(500) NOT NULL,
  PRIMARY KEY (`sectionID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO ims_section VALUES ('1', 'N/A');
INSERT INTO ims_section VALUES ('2', 'NSC');
INSERT INTO ims_section VALUES ('3', 'Production');
INSERT INTO ims_section VALUES ('4', 'Meter Maintenance');
INSERT INTO ims_section VALUES ('5', 'Special Project');
INSERT INTO ims_section VALUES ('6', 'Construction');
INSERT INTO ims_section VALUES ('7', 'Commercial');
INSERT INTO ims_section VALUES ('8', 'Sales');
INSERT INTO ims_section VALUES ('9', 'Gen.Services');

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


