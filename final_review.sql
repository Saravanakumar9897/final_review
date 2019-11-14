-- Adminer 4.6.2 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

CREATE DATABASE `ticket_system` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ticket_system`;

DROP TABLE IF EXISTS `t_booking_details`;
CREATE TABLE `t_booking_details` (
  `booking_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_movie_of_screen-id` int(11) NOT NULL,
  `r_payment_id` int(11) NOT NULL,
  `seat_details` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `seat_class` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `seat_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `total_seats` tinyint(4) NOT NULL,
  PRIMARY KEY (`booking_id`),
  KEY `r_movie_of_screen-id` (`r_movie_of_screen-id`),
  KEY `r_payment_id` (`r_payment_id`),
  CONSTRAINT `t_booking_details_ibfk_1` FOREIGN KEY (`r_movie_of_screen-id`) REFERENCES `t_movie_of_screens` (`movie_of_screen_id`),
  CONSTRAINT `t_booking_details_ibfk_2` FOREIGN KEY (`r_payment_id`) REFERENCES `t_payments` (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `t_class_types`;
CREATE TABLE `t_class_types` (
  `class_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_type_name` varchar(50) NOT NULL,
  PRIMARY KEY (`class_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `t_class_types` (`class_type_id`, `class_type_name`) VALUES
(1,	'I Classs'),
(2,	'II Class'),
(3,	'III Class'),
(4,	'IV Class'),
(5,	'V Class');

DROP TABLE IF EXISTS `t_movie_categories`;
CREATE TABLE `t_movie_categories` (
  `movie_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_category_name` varchar(191) NOT NULL,
  PRIMARY KEY (`movie_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `t_movie_categories` (`movie_category_id`, `movie_category_name`) VALUES
(1,	'Tamil Movie'),
(2,	'English Moive'),
(3,	'Hindi Movie');

DROP TABLE IF EXISTS `t_movie_of_screens`;
CREATE TABLE `t_movie_of_screens` (
  `movie_of_screen_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_theatre_id` int(11) NOT NULL,
  `r_screen_id` int(11) NOT NULL,
  `r_show_id` int(11) NOT NULL,
  `r_movie_id` int(10) NOT NULL,
  `date_time` datetime NOT NULL,
  `available_seats` int(11) NOT NULL,
  PRIMARY KEY (`movie_of_screen_id`),
  KEY `r_theatre_id` (`r_theatre_id`),
  KEY `r_screen_id` (`r_screen_id`),
  KEY `r_show_id` (`r_show_id`),
  KEY `r_movie_id` (`r_movie_id`),
  CONSTRAINT `t_movie_of_screens_ibfk_1` FOREIGN KEY (`r_theatre_id`) REFERENCES `t_theatres` (`theatre_id`),
  CONSTRAINT `t_movie_of_screens_ibfk_2` FOREIGN KEY (`r_screen_id`) REFERENCES `t_screens` (`screen_id`),
  CONSTRAINT `t_movie_of_screens_ibfk_3` FOREIGN KEY (`r_show_id`) REFERENCES `t_shows` (`show_id`),
  CONSTRAINT `t_movie_of_screens_ibfk_4` FOREIGN KEY (`r_movie_id`) REFERENCES `t_movies` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `t_movie_of_screens` (`movie_of_screen_id`, `r_theatre_id`, `r_screen_id`, `r_show_id`, `r_movie_id`, `date_time`, `available_seats`) VALUES
(1,	1,	1,	1,	1,	'2019-11-09 09:45:00',	250),
(2,	2,	3,	2,	14,	'2019-11-10 00:00:00',	120),
(3,	3,	3,	1,	3,	'2019-11-12 09:41:15',	120),
(4,	6,	6,	2,	1,	'2019-11-13 10:20:00',	120),
(5,	3,	7,	2,	4,	'2019-11-13 08:30:16',	120),
(8,	2,	6,	2,	14,	'2019-11-11 07:08:00',	120),
(9,	9,	15,	3,	14,	'2019-11-11 04:13:17',	120),
(12,	6,	3,	3,	2,	'2019-11-11 07:08:00',	120),
(13,	8,	3,	3,	5,	'2019-11-11 07:08:00',	120),
(14,	9,	1,	3,	6,	'2019-11-11 07:08:00',	120),
(15,	9,	14,	1,	7,	'2019-11-11 07:08:00',	120),
(16,	3,	15,	2,	8,	'2019-11-11 07:08:00',	120),
(17,	9,	9,	3,	9,	'2019-11-11 07:08:00',	120),
(18,	8,	3,	3,	10,	'2019-11-11 07:08:00',	120),
(19,	8,	12,	3,	11,	'2019-11-11 07:08:00',	120),
(20,	8,	6,	1,	12,	'2019-11-11 07:08:00',	120),
(21,	8,	8,	3,	13,	'2019-11-11 07:08:00',	120),
(22,	7,	15,	2,	15,	'2019-11-11 07:08:00',	120),
(23,	3,	9,	3,	16,	'2019-11-11 07:08:00',	120);

DROP TABLE IF EXISTS `t_movies`;
CREATE TABLE `t_movies` (
  `movie_id` int(10) NOT NULL AUTO_INCREMENT,
  `r_movie_category_id` int(10) NOT NULL,
  `name` varchar(191) NOT NULL,
  `release_date` date DEFAULT NULL,
  `actor` varchar(191) DEFAULT NULL,
  `actress` varchar(191) DEFAULT NULL,
  `producer` varchar(191) DEFAULT NULL,
  `director` varchar(191) DEFAULT NULL,
  `duration` time DEFAULT NULL,
  `description` text,
  `banner_image` text,
  `list_image` text,
  `rating` tinytext,
  PRIMARY KEY (`movie_id`),
  KEY `r_movie_category_id` (`r_movie_category_id`),
  CONSTRAINT `t_movies_ibfk_1` FOREIGN KEY (`r_movie_category_id`) REFERENCES `t_movie_categories` (`movie_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `t_movies` (`movie_id`, `r_movie_category_id`, `name`, `release_date`, `actor`, `actress`, `producer`, `director`, `duration`, `description`, `banner_image`, `list_image`, `rating`) VALUES
(1,	1,	'BIGIL',	'2019-10-25',	'VIJAY',	'NAYANTHARA',	' test movie producer',	'ATLEE',	'02:03:00',	'Bigil is a 2019 Indian Tamil-language sports action film written and directed by Atlee and produced by Kalpathi S. Aghoram under the banner AGS Entertainment. ... The film follows Michael, a rowdy and a former footballer who decides to coach a women\'s football team when their coach gets attacked.',	'http://localhost:8000/Assets/uploads/images/tamil/bigil_poster.jpg',	'http://localhost:8000/Assets/uploads/images/tamil/bigil_banner.jpg',	'6.5k'),
(2,	1,	'ARUVAM',	'2019-10-25',	'SIDHARTH',	'CATHERINE TRESA',	'SOUNDARYA.R',	'SAI SEKHAR',	'02:00:00',	'Aruvam. A food safety officer and a teacher who has no sense of smell come together to fight the practice of food adulteration and its devastating effect on people. This commercial horror flick features Siddharth Suryanarayan and Catherine Tresa in the lead roles',	'http://localhost:8000/Assets/uploads/images/tamil/aruvam_poster.jpg',	'http://localhost:8000/Assets/uploads/images/tamil/aruvam_banner.jpg',	'9.5k'),
(3,	1,	'ASURAN',	'2019-10-25',	'DHANUSH',	'MANJU WARRIER',	'KALAIPULI.S.THANU',	'VETRIMAARAN',	'02:15:00',	'Asuran ( transl. Demon) is a 2019 Indian Tamil-language action drama film written and directed by Vetrimaaran and produced by Kalaipuli S. Thanu under his production banner V Creations. ... The film stars Dhanush and Manju Warrier in lead roles, where the latter makes her Tamil debut.',	'http://localhost:8000/Assets/uploads/images/tamil/asuran_poster.jpg',	'http://localhost:8000/Assets/uploads/images/tamil/asuran_banner.jpg',	'8.5k'),
(4,	1,	'COMALI',	'2019-10-11',	'RAVI',	'KAJAL AGARWAL',	'VELS FILM INTERNATIONAL',	'PRADEEP RANGANADHAN',	'01:45:00',	'Comali is a 2019 Indian Tamil-language comedy film produced by Vels Film International. ... Comali follows Ravi, a coma patient who has missed 16 years of his life and struggles to adapt to the new improved world',	'http://localhost:8000/Assets/uploads/images/tamil/comali_poster.jpg',	'http://localhost:8000/Assets/uploads/images/tamil/comali_banner.jpg',	'5.0k'),
(5,	1,	'ENNAI_NOKKI_PAYUM_THOTTA',	'2019-11-19',	'DHANUSH',	'MEGHA AKASH',	'ONDRAGA ENTERTAINMENT',	'GAUTHAM MENON',	'01:45:00',	'Enai Noki Paayum Thota ( transl. The Bullet Fired At Me) is an upcoming Indian Tamil-language film romantic thriller film written, directed and produced by Gautham Menon. The film features Dhanush and Megha Akash in the lead roles. The film began production in March 2016 and was completed in September 2018',	'http://localhost:8000/Assets/uploads/images/tamil/enpt_poster.jpg',	'http://localhost:8000/Assets/uploads/images/tamil/enpt_banner.jpg',	''),
(6,	1,	'KAPPAN',	'2019-10-17',	'SURYA',	'SAAYESHA',	'LYCA PRODUCTIONS',	'ANAND.K.V',	'02:00:05',	'Kaappaan aka Kappan is a Tamil political action thriller movie directed by K. V. Anand and written by Pattukkottai Prabakar. The movie Kaappan has Suriya, Mohanlal and Sayyeshaa in the lead roles. ... The movie is produced by Subashkaran under his own production banner \'Lyca Productions',	'http://localhost:8000/Assets/uploads/images/tamil/kappan_poster.jpg',	'http://localhost:8000/Assets/uploads/images/tamil/kappan_banner.jpg',	'7.3k'),
(7,	2,	'AVERNGERS_INFINITY_WAR',	'2019-09-19',	'ROBERT DOWNEY',	'ELIZABETH',	'MARVEL STUDIOS',	'RUSSO',	'01:30:00',	'In the film, the Avengers and the Guardians of the Galaxy attempt to prevent Thanos from collecting the six all-powerful Infinity Stones as part of his quest to kill half of all life in the universe. ... In 2016, Marvel shortened the title to Avengers: Infinity War',	'http://localhost:8000/Assets/uploads/images/hollywood/aiw_poster.jpg',	'http://localhost:8000/Assets/uploads/images/hollywood/aiw_banner.jpg',	'8.2k'),
(8,	2,	'OVERCOMMER',	'2019-12-03',	'ALEX KENDRICK',	'PRISCILLA SHIRRER',	'AFFIRM FILMS',	'ALEX KENDRICK',	'03:00:00',	'Overcomer (2019) A high-school basketball coach volunteers to coach a troubled teen in long-distance running',	'http://localhost:8000/Assets/uploads/images/hollywood/overcommer_poster.jpg',	'http://localhost:8000/Assets/uploads/images/hollywood/overcommer_banner.jpg',	''),
(9,	1,	'VADACHENNAI',	'2019-10-11',	'DHANUSH',	'AISHWARYA RAJESH',	'WUNDERBAR FILMS...',	'VETRIMAARAN',	'01:00:25',	'The film follows a non-linear narrative. 1987: Guna (Samuthirakani), \"Jawa\" Pazhani (Sai Dheena), Velu (Pawan), and Senthil (Kishore) kill a \"high profile\" man at a hotel in North Madras. Senthil requests Guna and Velu to surrender for the murder while he bails them out.',	'http://localhost:8000/Assets/uploads/images/tamil/vadachennai_poster.jpg',	'http://localhost:8000/Assets/uploads/images/tamil/vadachennai_banner.jpg',	'9.0k'),
(10,	2,	'TERMINATOR_DARK_FATE',	'2019-10-25',	'ARNOLD SCHWARZENEGER',	'LINDA HAMILTON',	'PARAMOUNT PICTURES',	'TIM MILLER',	'03:00:00',	'The cast includes Mackenzie Davis, Natalia Reyes, and Gabriel Luna as new characters. Set 25 years after the events of Terminator 2, the film sees the machines sending an advanced Terminator (Luna), designated Rev-9, back in time to 2020 to eliminate Dani Ramos (Reyes), whose fate is connected to the future',	'http://localhost:8000/Assets/uploads/images/hollywood/tdf_poster.jpg',	'http://localhost:8000/Assets/uploads/images/hollywood/tdf_banner.jpg',	'1.0k'),
(11,	1,	'SIVAPPU_MANJAL_PACHAI',	'2019-10-18',	'SIDHARTH',	'ACTRESS',	'ABHISHEK FILMS',	'SASI',	'02:15:00',	'Sivappu Manjal Pachai is a 2019 Indian Tamil-language action thriller film written and directed by Sasi. The film stars Siddharth, G. V. Prakash Kumar, Lijomol Jose, and Kashmira Pardeshi, and marks the Tamil film debuts of both Jose and Pardeshi',	'http://localhost:8000/Assets/uploads/images/tamil/sivappumanjalpachai_poster.jpg',	'http://localhost:8000/Assets/uploads/images/tamil/sivappumanjalpachai_banner.jpg',	'8.0k'),
(12,	2,	'THE_LION_KING',	'2019-10-10',	'DONALD GLOVER',	'BEYONCE KNOWELS-CARTER',	'WALT DISNEY PICTURES',	'JON FAVREAU',	'02:17:38',	'This Disney animated feature follows the adventures of the young lion Simba, the heir of his father, Mufasa. Simba\'s wicked uncle, Scar, plots to usurp Mufasa\'s throne by luring father and son into a stampede of wildebeests. But Simba escapes, and only Mufasa is killed',	'http://localhost:8000/Assets/uploads/images/hollywood/tlk_poster.jpg',	'http://localhost:8000/Assets/uploads/images/hollywood/tlk_banner.jpg',	'7.5k'),
(13,	2,	'THE_HARD_WAY',	'2019-12-06',	'JAMES WOODS\n',	'ANABELLA SCIORRA',	'THE BADHAM GROUP',	'JOHN BADHAMM',	'02:47:19',	'The Hard Way (2019) After learning his brother died on a mission in Romania, a former soldier teams up with two allies to hunt down a mysterious enemy and exact revenge',	'http://localhost:8000/Assets/uploads/images/hollywood/thw_poster.jpg',	'http://localhost:8000/Assets/uploads/images/hollywood/thw_banner.jpg',	''),
(14,	2,	'THE_ADDAMS_FAMILY',	'2019-12-12',	'JAMES WOODS',	'ANABELLA SCIORRA',	'THE BADHAM GROUP',	'JOHN BADA',	'05:21:33',	'The film focuses on a bizarre, macabre, aristocratic family who reconnect with who they believe to be a long-lost relative, Gomez\'s brother Fester Addams, who is actually the adopted son of a loan shark intending to swindle the Addams clan out of their vast wealth and fortune',	'http://localhost:8000/Assets/uploads/images/hollywood/taf_poster.jpg',	'http://localhost:8000/Assets/uploads/images/hollywood/taf_banner.jpg',	''),
(15,	1,	'PUPPY',	'2019-10-24',	'VARUN',	'SAMYUKTHA HEGDE',	'VELS FILM INTERNATIONAL',	'NATTU DEV',	'03:15:00',	'Puppy is a 2019 Indian Tamil-language comedy drama film written and directed by Nattu Dev (credited as Morattu Single) in his directorial debut. The film starring Varun in his debut as a lead actor, Samyuktha Hegde and Yogi Babu is produced by Ishari K. Ganesh under his production banner Vels Film International',	'http://localhost:8000/Assets/uploads/images/tamil/puppy_poster.jpg',	'http://localhost:8000/Assets/uploads/images/tamil/puppy_banner.jpg',	'6.4k'),
(16,	2,	'MALEFIECIENT',	'2019-11-01',	'SAM  RILEY',	'ANGELINA JOLIE',	'WALT DISNEY PICTURE.',	'ROBERT STORMBERG',	'05:32:23',	'Maleficent is a powerful fairy living in the Moors, a magical forest realm bordering a human kingdom. As a young girl, Maleficent meets and falls in love with a Scottish human peasant boy named Stefan',	'http://localhost:8000/Assets/uploads/images/hollywood/malefiecient_poster.jpg',	'http://localhost:8000/Assets/uploads/images/hollywood/malefiecient_banner.jpg',	'7.0k');

DROP TABLE IF EXISTS `t_payments`;
CREATE TABLE `t_payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_user_id` int(11) NOT NULL,
  `total_amount` float NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `r_user_id` (`r_user_id`),
  CONSTRAINT `t_payments_ibfk_1` FOREIGN KEY (`r_user_id`) REFERENCES `t_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `t_payments` (`payment_id`, `r_user_id`, `total_amount`) VALUES
(1,	3,	360);

DROP TABLE IF EXISTS `t_roles`;
CREATE TABLE `t_roles` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `t_roles` (`role_id`, `role_name`) VALUES
(1,	'SuperAdmin'),
(2,	'Admin'),
(3,	'Customer');

DROP TABLE IF EXISTS `t_screens`;
CREATE TABLE `t_screens` (
  `screen_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_theatre_id` int(11) NOT NULL,
  `classes_seats` json NOT NULL,
  `screen_name` varchar(191) NOT NULL,
  `total_seats` int(11) NOT NULL,
  PRIMARY KEY (`screen_id`),
  KEY `theatre_id` (`r_theatre_id`),
  CONSTRAINT `t_screens_ibfk_1` FOREIGN KEY (`r_theatre_id`) REFERENCES `t_theatres` (`theatre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `t_screens` (`screen_id`, `r_theatre_id`, `classes_seats`, `screen_name`, `total_seats`) VALUES
(1,	1,	'[{\"I_Classs\": \"50\"}, {\"II_Class\": \"50\"}, {\"III_Class\": \"50\"}, {\"IV_Class\": \"50\"}, {\"V_Class\": \"50\"}]',	'First Floor Screen',	250),
(2,	1,	'[{\"I_Classs\": \"60\"}, {\"II_Class\": \"40\"}, {\"III_Class\": \"50\"}, {\"IV_Class\": \"40\"}, {\"V_Class\": \"10\"}]',	'Second Floor Screen',	200),
(3,	2,	'[{\"I_Classs\": \"60\"}, {\"II_Class\": \"40\"}, {\"III_Class\": \"50\"}, {\"IV_Class\": \"40\"}, {\"V_Class\": \"10\"}]',	'Screen-1',	120),
(4,	2,	'[{\"I_Classs\": \"60\"}, {\"II_Class\": \"40\"}, {\"III_Class\": \"50\"}, {\"IV_Class\": \"40\"}, {\"V_Class\": \"10\"}]',	'SCREEN-2',	120),
(5,	2,	'[{\"I_Classs\": \"60\"}, {\"II_Class\": \"40\"}, {\"III_Class\": \"50\"}, {\"IV_Class\": \"40\"}, {\"V_Class\": \"10\"}]',	'SCREEN-3',	120),
(6,	3,	'[{\"I_Classs\": \"60\"}, {\"II_Class\": \"40\"}, {\"III_Class\": \"50\"}, {\"IV_Class\": \"40\"}, {\"V_Class\": \"10\"}]',	'SCREEN-1',	120),
(7,	2,	'[{\"I_Classs\": \"60\"}, {\"II_Class\": \"40\"}, {\"III_Class\": \"50\"}, {\"IV_Class\": \"40\"}, {\"V_Class\": \"10\"}]',	'SCREEN-4',	120),
(8,	6,	'[{\"I_Classs\": \"60\"}, {\"II_Class\": \"40\"}, {\"III_Class\": \"50\"}, {\"IV_Class\": \"40\"}, {\"V_Class\": \"10\"}]',	'SCREEN-1',	100),
(9,	6,	'[{\"I_Classs\": \"60\"}, {\"II_Class\": \"40\"}, {\"III_Class\": \"50\"}, {\"IV_Class\": \"40\"}, {\"V_Class\": \"10\"}]',	'SCREEN-2',	100),
(10,	7,	'[{\"I_Classs\": \"60\"}, {\"II_Class\": \"40\"}, {\"III_Class\": \"50\"}, {\"IV_Class\": \"40\"}, {\"V_Class\": \"10\"}]',	'SCREEN-1',	120),
(11,	7,	'[{\"I_Classs\": \"60\"}, {\"II_Class\": \"40\"}, {\"III_Class\": \"50\"}, {\"IV_Class\": \"40\"}, {\"V_Class\": \"10\"}]',	'SCREEN-2',	120),
(12,	8,	'[{\"I_Classs\": \"60\"}, {\"II_Class\": \"40\"}, {\"III_Class\": \"50\"}, {\"IV_Class\": \"40\"}, {\"V_Class\": \"10\"}]',	'SCREEN-1',	120),
(13,	8,	'[{\"I_Classs\": \"60\"}, {\"II_Class\": \"40\"}, {\"III_Class\": \"50\"}, {\"IV_Class\": \"40\"}, {\"V_Class\": \"10\"}]',	'SCREEN-2',	120),
(14,	9,	'[{\"I_Classs\": \"60\"}, {\"II_Class\": \"40\"}, {\"III_Class\": \"50\"}, {\"IV_Class\": \"40\"}, {\"V_Class\": \"10\"}]',	'SCREEN-1',	120),
(15,	9,	'[{\"I_Classs\": \"60\"}, {\"II_Class\": \"40\"}, {\"III_Class\": \"50\"}, {\"IV_Class\": \"40\"}, {\"V_Class\": \"10\"}]',	'SCREEN-2',	120);

DROP TABLE IF EXISTS `t_shows`;
CREATE TABLE `t_shows` (
  `show_id` int(11) NOT NULL AUTO_INCREMENT,
  `show_name` varchar(50) NOT NULL,
  PRIMARY KEY (`show_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `t_shows` (`show_id`, `show_name`) VALUES
(1,	'Morning Show'),
(2,	'Evening Show'),
(3,	'Night Show');

DROP TABLE IF EXISTS `t_theatres`;
CREATE TABLE `t_theatres` (
  `theatre_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_user_id` int(11) NOT NULL,
  `theatre_name` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `contact` bigint(20) NOT NULL,
  PRIMARY KEY (`theatre_id`),
  KEY `r_user_id` (`r_user_id`),
  CONSTRAINT `t_theatres_ibfk_1` FOREIGN KEY (`r_user_id`) REFERENCES `t_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `t_theatres` (`theatre_id`, `r_user_id`, `theatre_name`, `address`, `contact`) VALUES
(1,	2,	'WOODLANDS CINEMAS',	'CHENNAI',	9876543213),
(2,	2,	'AGS CINEMAS',	'CHENNAI',	123456789),
(3,	2,	'ESCAPE-CINEMAS',	'CHENNAI',	2345678),
(6,	2,	'PVR-CINEMAS',	'VELLORE',	4567890),
(7,	2,	'LAKSHMI CINEMAS',	'VELLORE',	567890),
(8,	2,	'BABU CINEMAS',	'KANCHEEPURAM',	34567890),
(9,	2,	'ARUNA CINEMAS',	'KANCHEEPURAM',	987654);

DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `r_role_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `email_verified_at` datetime DEFAULT NULL,
  `mobile` bigint(20) NOT NULL,
  `password` varchar(191) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_verified_at` (`email_verified_at`),
  KEY `r_role_id` (`r_role_id`),
  CONSTRAINT `t_users_ibfk_1` FOREIGN KEY (`r_role_id`) REFERENCES `t_roles` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `t_users` (`user_id`, `r_role_id`, `name`, `email`, `email_verified_at`, `mobile`, `password`, `status`) VALUES
(1,	1,	'Banu',	'superadmin@ticket.com',	'2019-11-08 10:00:00',	9876543210,	'87654321',	1),
(2,	2,	'Priya',	'admin@ticket.com',	'2019-11-08 03:00:00',	9876543211,	'87654321',	1),
(3,	3,	'BanuPriya',	'customer@ticket.com',	'2019-11-08 05:00:00',	9876543212,	'87654321',	1);

-- 2019-11-14 22:10:44
