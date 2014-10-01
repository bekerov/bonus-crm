-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Окт 02 2014 г., 00:10
-- Версия сервера: 5.6.16
-- Версия PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `bonuscrm`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bonuscards`
--

CREATE TABLE IF NOT EXISTS `bonuscards` (
  `series` varchar(4) NOT NULL,
  `card_number` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `release_date` datetime NOT NULL,
  `used_date` datetime DEFAULT NULL,
  `end_date` datetime NOT NULL,
  `sum` int(5) NOT NULL,
  `status` varchar(15) NOT NULL,
  UNIQUE KEY `card_number` (`card_number`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Дамп данных таблицы `bonuscards`
--

INSERT INTO `bonuscards` (`series`, `card_number`, `release_date`, `used_date`, `end_date`, `sum`, `status`) VALUES
('1111', 0000000002, '2014-10-01 00:00:00', NULL, '2015-10-01 00:00:00', 0, 'deactivated'),
('1111', 0000000003, '2014-10-01 23:24:13', NULL, '2015-10-01 23:24:13', 0, 'activated'),
('1234', 0000000004, '2014-10-01 23:30:15', NULL, '2015-04-01 23:30:15', 0, 'expired'),
('6666', 0000000005, '2014-10-01 23:32:48', NULL, '2014-11-01 23:32:48', 0, 'expired'),
('6666', 0000000006, '2014-10-01 23:32:48', NULL, '2014-11-01 23:32:48', 0, 'expired'),
('6666', 0000000007, '2014-10-01 23:32:48', NULL, '2014-11-01 23:32:48', 0, 'expired'),
('6666', 0000000008, '2014-10-01 23:32:48', NULL, '2014-11-01 23:32:48', 0, 'expired'),
('6666', 0000000009, '2014-10-01 23:32:48', NULL, '2014-11-01 23:32:48', 0, 'expired'),
('6666', 0000000010, '2014-10-01 23:32:48', NULL, '2014-11-01 23:32:48', 0, 'expired'),
('7777', 0000000011, '2014-10-01 23:33:05', NULL, '2015-10-01 23:33:05', 0, 'deactivated'),
('7777', 0000000012, '2014-10-01 23:33:05', NULL, '2015-10-01 23:33:05', 0, 'deactivated'),
('7777', 0000000013, '2014-10-01 23:33:05', NULL, '2015-10-01 23:33:05', 0, 'deactivated'),
('7777', 0000000014, '2014-10-01 23:33:05', NULL, '2015-10-01 23:33:05', 0, 'deactivated'),
('7777', 0000000015, '2014-10-01 23:33:05', NULL, '2015-10-01 23:33:05', 0, 'deactivated'),
('7777', 0000000016, '2014-10-01 23:33:05', NULL, '2015-10-01 23:33:05', 0, 'deactivated'),
('7777', 0000000017, '2014-10-01 23:33:05', NULL, '2015-10-01 23:33:05', 0, 'deactivated'),
('7777', 0000000018, '2014-10-01 23:33:05', NULL, '2015-10-01 23:33:05', 0, 'deactivated'),
('7777', 0000000019, '2014-10-01 23:33:05', NULL, '2015-10-01 23:33:05', 0, 'deactivated'),
('7777', 0000000020, '2014-10-01 23:33:05', NULL, '2015-10-01 23:33:05', 0, 'activated'),
('7777', 0000000021, '2014-10-01 23:33:05', NULL, '2015-10-01 23:33:05', 0, 'deactivated');

-- --------------------------------------------------------

--
-- Структура таблицы `card_history`
--

CREATE TABLE IF NOT EXISTS `card_history` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `number_card` int(10) unsigned zerofill NOT NULL,
  `date` datetime NOT NULL,
  `sum` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `card_history`
--

INSERT INTO `card_history` (`id`, `number_card`, `date`, `sum`) VALUES
(1, 0000000002, '2014-10-02 04:10:15', 200),
(2, 0000000002, '2014-10-02 04:11:15', 450);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
