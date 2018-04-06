

CREATE DATABASE `CinemaSecond`;
USE `CinemaSecond`;


CREATE TABLE IF NOT EXISTS `cinema` (
  `id` int(11) NOT NULL ,
  `name` varchar(100) NOT NULL,
  `hallCinema` varchar(100) NOT NULL,
  `soundType` varchar(100) NOT NULL,
  `screenType` varchar(100) NOT NULL
)  AUTO_INCREMENT=6;


INSERT INTO `cinema` (`id`, `name`, `hallCinema`, `soundType`, `screenType`) VALUES
(1, 'Ала-Тоо', 'Большой зал', 'Dolby Digital', 'IMAX'),
(2, 'Ала-Тоо', 'Средний зал', 'Стерео звуки', '3D MAX'),
(3, 'Манас', 'Большой зал', 'Dolby Digital', 'IMAX'),
(4, 'Манас', 'Средний зал', 'Стерео звуки', '3D MAX'),
(5, 'Октябрь', 'Большой зал', 'Dolby Digital', 'IMAX');


CREATE TABLE IF NOT EXISTS `film` (
  `id` int(11) NOT NULL ,
  `name` varchar(100) NOT NULL
) AUTO_INCREMENT=8;



INSERT INTO `film` (`id`, `name`) VALUES
(1, 'Декомпозиция 4'),
(2, 'Арман / Когда ангелы спят'),
(3, 'Бажарики 2'),
(4, 'Джуманджи: Зов джунглей'),
(5, 'Звёздные войны: Последние джедаи'),
(6, 'Виктория и Абдул'),
(7, 'Эспен в королевстве троллей');


CREATE TABLE IF NOT EXISTS `session` (
  `cinemaID` int(11) NOT NULL,
  `filmID` int(11) NOT NULL
);



INSERT INTO `session` (`cinemaID`, `filmID`) VALUES
(1, 1),
(3, 1),
(5, 1),
(2, 2),
(4, 2),
(1, 3),
(3, 3),
(5, 3),
(2, 4),
(4, 4),
(1, 5),
(3, 5),
(5, 5),
(2, 6),
(4, 6),
(1, 7),
(2, 7),
(3, 7),
(4, 7),
(5, 7);



CREATE TABLE IF NOT EXISTS `ticket` (
  `id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `count` int(11) NOT NULL,
  `date` varchar(100) NOT NULL
)  AUTO_INCREMENT=21;


INSERT INTO `ticket` (`id`, `session_id`, `price`, `count`, `date`) VALUES
(1, 1, '120.0000', 25, '1.12.2017'),
(2, 2, '100.0000', 14, '1.12.2017'),
(3, 3, '130.0000', 34, '1.12.2017'),
(4, 4, '150.0000', 20, '5.12.2017'),
(5, 5, '200.0000', 45, '5.12.2017'),
(6, 1, '130.0000', 10, '7.12.2017'),
(7, 2, '120.0000', 20, '7.12.2017'),
(8, 3, '110.0000', 15, '10.12.2017'),
(9, 4, '150.0000', 25, '10.12.2017'),
(10, 5, '250.0000', 25, '13.12.2017'),
(11, 1, '140.0000', 23, '13.12.2017'),
(12, 2, '180.0000', 45, '13.12.2017'),
(13, 3, '200.0000', 23, '16.12.2017'),
(14, 4, '120.0000', 10, '16.12.2017'),
(15, 5, '100.0000', 18, '18.12.2017'),
(16, 1, '110.0000', 26, '18.12.2017'),
(17, 2, '170.0000', 5, '18.12.2017'),
(18, 3, '190.0000', 35, '20.12.2017'),
(19, 4, '200.0000', 40, '20.12.2017'),
(20, 5, '140.0000', 25, '22.12.2017');



ALTER TABLE `cinema`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `film`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `session`
  ADD PRIMARY KEY (`cinemaID`,`filmID`);


ALTER TABLE `ticket`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `cinema`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;

ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;

ALTER TABLE `ticket`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=21;

ALTER TABLE `session`
  ADD CONSTRAINT `FK_FilmSession` FOREIGN KEY (`filmID`) REFERENCES `film` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_CinemaSession` FOREIGN KEY (`cinemaID`) REFERENCES `cinema` (`id`) ON DELETE CASCADE;


SELECT (
    (SELECT SUM(`ticket`.`count`) FROM `ticket` 
     LEFT JOIN `cinema`
     ON `ticket`.`session_id` = `cinema`.`id` 
     WHERE `cinema`.`soundType`='Dolby Digital')/SUM(`ticket`.`count`) * 100) AS `precent`
FROM `ticket`;


SELECT SUM(`ticket`.`count`) FROM `ticket` 
LEFT JOIN `cinema`
ON `ticket`.`session_id` = `cinema`.`id` 
WHERE `cinema`.`name`='Манас';


SELECT DISTINCT (SELECT SUM(`price`) FROM ticket) AS SumPrice 
FROM `session` 
WHERE `filmID` = (SELECT `id` FROM `film` WHERE `name`='Декомпозиция 4');


SELECT DISTINCT
	(((SELECT DISTINCT SUM(`count`) FROM `ticket` WHERE `session_id` = 1) + (SELECT DISTINCT SUM(`count`) FROM `ticket` WHERE `session_id` = 2)) /3)AS `Ala-TooCount`
    
FROM `ticket`;


