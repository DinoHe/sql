-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2020-06-27 14:24:23
-- 服务器版本： 8.0.20
-- PHP 版本： 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `htc`
--

-- --------------------------------------------------------

--
-- 表的结构 `activities`
--

CREATE TABLE `activities` (
  `id` int NOT NULL,
  `subordinate` smallint NOT NULL DEFAULT '0' COMMENT '直推人数',
  `hashrate` mediumint NOT NULL COMMENT '要求算力（0.1G）',
  `reward_miner_type` int NOT NULL DEFAULT '1' COMMENT '奖励上级矿机类型',
  `reward_miner_number` tinyint NOT NULL DEFAULT '0' COMMENT '奖励上级矿机数量',
  `reward_member` mediumtext COMMENT '获得奖励的会员ID',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `activities`
--

INSERT INTO `activities` (`id`, `subordinate`, `hashrate`, `reward_miner_type`, `reward_miner_number`, `reward_member`, `created_at`, `updated_at`) VALUES
(1, 10, 10, 1, 1, '[]', NULL, '2020-06-19 18:10:08'),
(2, 30, 300, 2, 1, NULL, NULL, '2020-06-03 10:48:56'),
(3, 60, 6000, 3, 1, NULL, NULL, '2020-06-03 10:49:35'),
(4, 100, 100000, 4, 1, NULL, NULL, '2020-06-03 10:49:58');

-- --------------------------------------------------------

--
-- 表的结构 `admins`
--

CREATE TABLE `admins` (
  `id` int NOT NULL,
  `account` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `weixin` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int NOT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:启用，1:停用；',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admins`
--

INSERT INTO `admins` (`id`, `account`, `name`, `phone`, `weixin`, `password`, `role_id`, `blocked`, `created_at`, `updated_at`) VALUES
(1, '13048814716', 'admin', '13048814716', 'admin', '$2y$10$SzodWnNwzG35LBw86uecJevJCeBlekPCea68vhopmcn3uVs8fthFe', 1, 0, '2019-12-24 09:18:16', '2020-06-19 17:41:33'),
(4, 'admin001', 'admin001', '12345678901', 'admin001', '$2y$10$2qJatMaRpD3U7SB7g/NH5.yfX3LDGJMHQeiGpgE08ZBiknLWP.J76', 19, 0, '2019-12-26 12:31:20', '2020-06-04 02:21:46');

-- --------------------------------------------------------

--
-- 表的结构 `assets`
--

CREATE TABLE `assets` (
  `id` int NOT NULL,
  `member_id` int NOT NULL,
  `balance` int UNSIGNED NOT NULL DEFAULT '0' COMMENT '余额（0.01）',
  `blocked_assets` int UNSIGNED NOT NULL DEFAULT '0' COMMENT '冻结资产（0.01）',
  `rewards` int NOT NULL DEFAULT '0' COMMENT '累积奖励（0.01）',
  `buys` int NOT NULL DEFAULT '0' COMMENT '累积购买（0.01HTC）',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `assets`
--

INSERT INTO `assets` (`id`, `member_id`, `balance`, `blocked_assets`, `rewards`, `buys`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 0, 5200, 0, '2019-12-19 10:03:12', '2020-06-19 17:44:58'),
(2, 6, 2971, 0, 0, 20000, '2020-06-12 15:51:06', '2020-06-23 02:28:34');

-- --------------------------------------------------------

--
-- 表的结构 `bills`
--

CREATE TABLE `bills` (
  `id` int NOT NULL,
  `member_id` int NOT NULL,
  `tittle` varchar(50) NOT NULL,
  `operation` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `bills`
--

INSERT INTO `bills` (`id`, `member_id`, `tittle`, `operation`, `created_at`, `updated_at`) VALUES
(1, 1, '余额-签到赠送', '+0.01', '2020-06-08 15:53:04', '2020-06-08 15:53:04'),
(2, 1, '余额-签到赠送', '+0.01', '2020-06-08 16:08:44', '2020-06-08 16:08:44'),
(3, 1, '余额-签到赠送', '+0.01', '2020-06-09 05:58:39', '2020-06-09 05:58:39'),
(4, 1, '余额-租用矿机', '-20', '2020-06-09 07:21:12', '2020-06-09 07:21:12'),
(5, 1, '余额-租用矿机', '-200', '2020-06-09 12:59:10', '2020-06-09 12:59:10'),
(6, 1, '余额-赠送', '+10', '2020-06-09 13:15:49', '2020-06-09 13:15:49'),
(7, 1, '余额-租用矿机', '-5', '2020-06-09 13:22:12', '2020-06-09 13:22:12'),
(8, 1, '余额-赠送', '+10000', '2020-06-09 13:41:08', '2020-06-09 13:41:08'),
(9, 1, '余额-租用矿机', '-200', '2020-06-09 13:42:14', '2020-06-09 13:42:14'),
(10, 1, '余额-赠送', '+-100', '2020-06-09 13:43:47', '2020-06-09 13:43:47'),
(11, 1, '余额-矿机产出', '+0.12', '2020-06-09 13:44:42', '2020-06-09 13:44:42'),
(12, 1, '余额-赠送', '--10', '2020-06-09 13:46:54', '2020-06-09 13:46:54'),
(13, 1, '余额-扣除', '-10', '2020-06-09 13:49:00', '2020-06-09 13:49:00'),
(14, 1, '余额-奖励', '+50', '2020-06-09 13:52:48', '2020-06-09 13:52:48'),
(15, 1, '矿机-赠送', '+1', '2020-06-09 14:07:35', '2020-06-09 14:07:35'),
(16, 1, '余额-签到赠送', '+0.01', '2020-06-09 16:32:11', '2020-06-09 16:32:11'),
(17, 1, '余额-矿机产出', '+1.01', '2020-06-09 16:32:30', '2020-06-09 16:32:30'),
(18, 1, '余额-矿机产出', '+11.93', '2020-06-10 17:19:10', '2020-06-10 17:19:10'),
(19, 1, '余额-签到赠送', '+0.01', '2020-06-10 17:19:25', '2020-06-10 17:19:25'),
(20, 1, '余额-签到赠送', '+0.01', '2020-06-11 04:50:52', '2020-06-11 04:50:52'),
(21, 1, '余额-签到赠送', '+0.01', '2020-06-12 15:16:26', '2020-06-12 15:16:26'),
(22, 1, '余额-矿机产出', '+22.36', '2020-06-12 15:16:37', '2020-06-12 15:16:37'),
(23, 6, '余额-签到赠送', '+0.01', '2020-06-16 13:01:50', '2020-06-16 13:01:50'),
(24, 6, '余额-签到赠送', '+0.01', '2020-06-18 12:41:06', '2020-06-18 12:41:06'),
(25, 1, '余额-直推买币奖励', '+1', '2020-06-18 15:34:19', '2020-06-18 15:34:19'),
(26, 6, '余额-买入', '+100', '2020-06-18 15:34:19', '2020-06-18 15:34:19'),
(27, 1, '余额-卖出', '-100', '2020-06-18 15:34:19', '2020-06-18 15:34:19'),
(28, 1, '余额-签到赠送', '+0.01', '2020-06-18 16:54:25', '2020-06-18 16:54:25'),
(29, 6, '余额-签到赠送', '+0.01', '2020-06-18 17:57:50', '2020-06-18 17:57:50'),
(30, 6, '余额-矿机产出', '+0.86', '2020-06-18 17:57:57', '2020-06-18 17:57:57'),
(31, 1, '余额-直推买币奖励', '+1', '2020-06-18 17:59:25', '2020-06-18 17:59:25'),
(32, 6, '余额-买入', '+100', '2020-06-18 17:59:25', '2020-06-18 17:59:25'),
(33, 1, '余额-卖出', '-100', '2020-06-18 17:59:25', '2020-06-18 17:59:25'),
(34, 6, '余额-租用矿机', '-200', '2020-06-19 14:25:37', '2020-06-19 14:25:37'),
(35, 6, '余额-赠送', '+200', '2020-06-19 14:53:15', '2020-06-19 14:53:15'),
(36, 6, '余额-赠送', '+100', '2020-06-19 14:58:13', '2020-06-19 14:58:13'),
(37, 6, '余额-租用矿机', '-5', '2020-06-19 14:58:36', '2020-06-19 14:58:36'),
(38, 6, '余额-租用矿机', '-5', '2020-06-19 15:07:50', '2020-06-19 15:07:50'),
(39, 6, '余额-租用矿机', '-5', '2020-06-19 15:12:02', '2020-06-19 15:12:02'),
(40, 6, '余额-租用矿机', '-5', '2020-06-19 15:14:31', '2020-06-19 15:14:31'),
(41, 6, '余额-租用矿机', '-5', '2020-06-19 15:14:43', '2020-06-19 15:14:43'),
(42, 6, '余额-租用矿机', '-5', '2020-06-19 15:16:27', '2020-06-19 15:16:27'),
(43, 6, '余额-租用矿机', '-5', '2020-06-19 15:23:01', '2020-06-19 15:23:01'),
(44, 1, '余额-签到赠送', '+0.01', '2020-06-19 17:01:24', '2020-06-19 17:01:24'),
(45, 6, '余额-租用矿机', '-5', '2020-06-19 17:09:09', '2020-06-19 17:09:09'),
(46, 6, '余额-租用矿机', '-200', '2020-06-19 17:09:20', '2020-06-19 17:09:20'),
(47, 6, '余额-租用矿机', '-20', '2020-06-19 17:09:32', '2020-06-19 17:09:32'),
(48, 6, '余额-租用矿机', '-20', '2020-06-19 17:09:35', '2020-06-19 17:09:35'),
(49, 6, '余额-租用矿机', '-20', '2020-06-19 17:09:38', '2020-06-19 17:09:38'),
(50, 1, '余额-扣除', '-9610.59', '2020-06-19 17:44:58', '2020-06-19 17:44:58'),
(51, 6, '余额-签到赠送', '+0.01', '2020-06-22 10:28:24', '2020-06-22 10:28:24'),
(52, 6, '余额-矿机产出', '+28.82', '2020-06-22 10:28:31', '2020-06-22 10:28:31'),
(53, 6, '余额-签到赠送', '+0.01', '2020-06-23 02:28:34', '2020-06-23 02:28:34');

-- --------------------------------------------------------

--
-- 表的结构 `coins`
--

CREATE TABLE `coins` (
  `id` int NOT NULL,
  `price` mediumint UNSIGNED NOT NULL COMMENT '币价（0.01美元）',
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `coins`
--

INSERT INTO `coins` (`id`, `price`, `created_at`, `updated_at`) VALUES
(1, 10, '2020-05-14', '2020-05-14'),
(2, 11, '2020-05-15', '2020-05-15'),
(3, 12, '2020-05-17', '2020-05-17'),
(4, 13, '2020-05-18', '2020-05-18'),
(5, 14, '2020-05-19', '2020-05-19'),
(6, 15, '2020-05-20', '2020-05-20'),
(7, 16, '2020-05-21', '2020-05-21'),
(8, 18, '2020-05-22', '2020-05-22'),
(9, 19, '2020-05-23', '2020-05-23'),
(10, 20, '2020-05-24', '2020-05-24'),
(11, 21, '2020-05-25', '2020-05-25'),
(12, 22, '2020-05-26', '2020-05-26'),
(13, 23, '2020-05-27', '2020-05-27'),
(14, 24, '2020-05-28', '2020-05-28'),
(15, 25, '2020-05-29', '2020-05-29'),
(16, 26, '2020-05-30', '2020-05-30'),
(17, 27, '2020-05-31', '2020-05-31'),
(18, 28, '2020-06-01', '2020-06-01'),
(19, 29, '2020-06-02', '2020-06-02'),
(20, 30, '2020-06-03', '2020-06-03'),
(21, 31, '2020-06-04', '2020-06-04'),
(22, 32, '2020-06-05', '2020-06-05'),
(23, 33, '2020-06-08', '2020-06-08'),
(24, 34, '2020-06-09', '2020-06-09'),
(25, 35, '2020-06-10', '2020-06-10'),
(26, 36, '2020-06-11', '2020-06-11'),
(27, 37, '2020-06-12', '2020-06-12'),
(28, 38, '2020-06-13', '2020-06-13'),
(29, 39, '2020-06-14', '2020-06-14'),
(30, 40, '2020-06-15', '2020-06-15'),
(31, 41, '2020-06-16', '2020-06-16'),
(32, 42, '2020-06-17', '2020-06-17'),
(33, 43, '2020-06-18', '2020-06-18'),
(34, 44, '2020-06-19', '2020-06-19'),
(35, 45, '2020-06-20', '2020-06-20'),
(36, 46, '2020-06-22', '2020-06-22'),
(37, 47, '2020-06-23', '2020-06-23'),
(38, 48, '2020-06-24', '2020-06-24'),
(39, 49, '2020-06-27', '2020-06-27');

-- --------------------------------------------------------

--
-- 表的结构 `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `ideals`
--

CREATE TABLE `ideals` (
  `id` int NOT NULL,
  `account` char(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `images`
--

CREATE TABLE `images` (
  `id` int NOT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `src` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `images`
--

INSERT INTO `images` (`id`, `type`, `src`, `updated_at`, `created_at`) VALUES
(1, 'home-index-header', 'main-slider-1.jpg', '2020-05-28 09:40:04', '2020-05-28 09:40:04'),
(2, 'home-index-header', 'main-slider-2.jpg', '2020-05-28 09:40:04', '2020-05-28 09:40:04'),
(3, 'miner', '微型云矿机.jpg', '2020-06-10 16:55:41', '2020-05-28 09:40:04'),
(4, 'miner', '小型云矿机.jpg', '2020-06-10 16:56:01', '2020-05-28 09:40:04'),
(5, 'miner', '中型云矿机.jpg', '2020-06-10 16:56:17', '2020-05-28 09:40:04'),
(6, 'miner', '大型云矿机.jpg', '2020-06-10 16:56:31', '2020-05-28 09:40:04'),
(7, 'miner', '超级云矿机.jpg', '2020-06-10 16:56:47', '2020-05-28 09:40:04');

-- --------------------------------------------------------

--
-- 表的结构 `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `jobs`
--

INSERT INTO `jobs` (`id`, `queue`, `payload`, `attempts`, `reserved_at`, `available_at`, `created_at`) VALUES
(326, 'match', '{\"displayName\":\"App\\\\Jobs\\\\SalesMatch\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SalesMatch\",\"command\":\"O:19:\\\"App\\\\Jobs\\\\SalesMatch\\\":10:{s:12:\\\"\\u0000*\\u0000salesInfo\\\";a:2:{s:11:\\\"salesNumber\\\";s:2:\\\"50\\\";s:5:\\\"price\\\";s:4:\\\"0.44\\\";}s:14:\\\"\\u0000*\\u0000salesMember\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"App\\\\Http\\\\Models\\\\Members\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"level\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:5:\\\"match\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1592566931, 1592566931),
(325, 'match', '{\"displayName\":\"App\\\\Jobs\\\\SalesMatch\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\SalesMatch\",\"command\":\"O:19:\\\"App\\\\Jobs\\\\SalesMatch\\\":10:{s:12:\\\"\\u0000*\\u0000salesInfo\\\";a:2:{s:11:\\\"salesNumber\\\";s:2:\\\"10\\\";s:5:\\\"price\\\";s:4:\\\"0.44\\\";}s:14:\\\"\\u0000*\\u0000salesMember\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:23:\\\"App\\\\Http\\\\Models\\\\Members\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:1:{i:0;s:5:\\\"level\\\";}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:5:\\\"match\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1592566906, 1592566906),
(324, 'give', '{\"displayName\":\"App\\\\Jobs\\\\RewardMiner\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\RewardMiner\",\"command\":\"O:20:\\\"App\\\\Jobs\\\\RewardMiner\\\":10:{s:5:\\\"\\u0000*\\u0000id\\\";i:1;s:8:\\\"\\u0000*\\u0000level\\\";i:3;s:6:\\\"\\u0000*\\u0000job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";s:4:\\\"give\\\";s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:5:\\\"delay\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 0, NULL, 1592488054, 1592488054);

-- --------------------------------------------------------

--
-- 表的结构 `members`
--

CREATE TABLE `members` (
  `id` int UNSIGNED NOT NULL,
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `safe_password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invite` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邀请码',
  `level_id` tinyint(1) NOT NULL DEFAULT '1',
  `parentid` int NOT NULL DEFAULT '0',
  `activated` tinyint(1) NOT NULL DEFAULT '0',
  `credit` tinyint NOT NULL DEFAULT '100',
  `describes` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `members`
--

INSERT INTO `members` (`id`, `phone`, `password`, `safe_password`, `invite`, `level_id`, `parentid`, `activated`, `credit`, `describes`, `created_at`, `updated_at`) VALUES
(1, '15570708089', '$2y$10$4khTr3vlF5Qw.Iq0Fe.j0ekKDAisKzXot8EwRcc0jpyOpFw.SjpQO', '$2y$10$GrZV.cal012QoY0fM.8smOfb9A29Ywrby4MJ2Z9T1dgJYvM2p1fSS', 'EHerc8Sh7', 3, 0, 3, 100, NULL, '2019-12-19 09:54:46', '2020-06-19 17:44:06'),
(6, '13048814716', '$2y$10$/04.4y/1w32mxkZcU/PbO.EVtwivzts0yz8VsdxF37DZ3z7JdHV8m', '$2y$10$dKoz6FO0IIE/brA3n7XVyuYMr5XaGt6jci6FWX0EWlq4diFXlyE.2', 'J3NeE5iY7', 3, 1, 0, 100, NULL, '2020-06-12 15:51:06', '2020-06-27 14:09:21');

-- --------------------------------------------------------

--
-- 表的结构 `member_levels`
--

CREATE TABLE `member_levels` (
  `id` tinyint(1) NOT NULL,
  `level_name` char(4) NOT NULL,
  `sales_times` smallint NOT NULL COMMENT '当天卖出次数',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `member_levels`
--

INSERT INTO `member_levels` (`id`, `level_name`, `sales_times`, `created_at`, `updated_at`) VALUES
(1, '一级会员', 1, '2019-11-18 14:59:16', NULL),
(2, '二级会员', 1, '2019-11-18 15:00:11', NULL),
(3, '三级会员', 2, '2019-11-18 14:59:16', NULL),
(4, '四级会员', 5, '2019-11-18 15:00:11', '2020-05-23 09:56:43'),
(5, '五级会员', 999, '2019-11-18 15:00:11', '2020-01-04 10:40:23');

-- --------------------------------------------------------

--
-- 表的结构 `miners`
--

CREATE TABLE `miners` (
  `id` int NOT NULL,
  `tittle` varchar(6) NOT NULL,
  `coin_number` float(8,2) NOT NULL COMMENT '矿机价格',
  `runtime` mediumint NOT NULL COMMENT '运行周期',
  `nph` float(11,8) NOT NULL COMMENT '每小时产量',
  `total_dig` float(8,2) NOT NULL COMMENT '总产量',
  `hashrate` float(8,2) NOT NULL COMMENT '算力',
  `miner_img` varchar(50) DEFAULT NULL,
  `rent_max` smallint NOT NULL DEFAULT '0' COMMENT '最大租用数量',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `miners`
--

INSERT INTO `miners` (`id`, `tittle`, `coin_number`, `runtime`, `nph`, `total_dig`, `hashrate`, `miner_img`, `rent_max`, `created_at`, `updated_at`) VALUES
(1, '微型云矿机', 5.00, 720, 0.00833333, 6.00, 0.10, 'img/微型云矿机.jpg', 10, '2019-11-21 14:43:30', '2020-06-03 08:04:40'),
(2, '小型云矿机', 20.00, 1200, 0.02000000, 24.00, 1.00, 'img/小型云矿机.jpg', 10, '2019-11-21 14:43:30', '2020-06-03 08:04:47'),
(3, '中型云矿机', 200.00, 1680, 0.14285713, 240.00, 10.00, 'img/中型云矿机.jpg', 5, '2019-11-21 14:43:30', '2020-06-03 08:04:54'),
(4, '大型云矿机', 2000.00, 2160, 1.11111116, 2400.00, 100.00, 'img/大型云矿机.jpg', 2, '2019-11-21 14:43:30', '2020-06-03 08:05:02'),
(5, '超级云矿机', 20000.00, 2640, 9.09090900, 24000.00, 1000.00, 'img/超级云矿机.jpg', 1, '2019-11-21 14:43:30', '2020-06-03 08:05:10');

-- --------------------------------------------------------

--
-- 表的结构 `my_miners`
--

CREATE TABLE `my_miners` (
  `id` int NOT NULL,
  `miner_id` int NOT NULL,
  `member_id` int NOT NULL,
  `miner_tittle` varchar(6) NOT NULL,
  `total_dig` float(8,2) NOT NULL COMMENT '总产量',
  `dug` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '已产出数量',
  `nph` float(11,8) NOT NULL COMMENT '每小时产出数量',
  `runtime` mediumint NOT NULL COMMENT '运行周期',
  `hashrate` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '算力',
  `run_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0.运行中;1.已结束',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `my_miners`
--

INSERT INTO `my_miners` (`id`, `miner_id`, `member_id`, `miner_tittle`, `total_dig`, `dug`, `nph`, `runtime`, `hashrate`, `run_status`, `created_at`, `updated_at`) VALUES
(165, 2, 6, '小型云矿机', 24.00, 1.30, 0.02000000, 1200, 1.00, 0, '2020-06-19 17:09:38', '2020-06-22 10:28:30'),
(164, 2, 6, '小型云矿机', 24.00, 1.30, 0.02000000, 1200, 1.00, 0, '2020-06-19 17:09:35', '2020-06-22 10:28:30'),
(163, 2, 6, '小型云矿机', 24.00, 1.30, 0.02000000, 1200, 1.00, 0, '2020-06-19 17:09:32', '2020-06-22 10:28:30'),
(162, 3, 6, '中型云矿机', 240.00, 9.29, 0.14285713, 1680, 10.00, 0, '2020-06-19 17:09:20', '2020-06-22 10:28:30'),
(161, 1, 6, '微型云矿机', 6.00, 0.54, 0.00833333, 720, 0.10, 0, '2020-06-19 17:09:09', '2020-06-22 10:28:30'),
(160, 1, 1, '微型云矿机', 6.00, 0.00, 0.00833333, 720, 0.10, 1, '2020-06-19 16:34:10', '2020-06-19 17:46:00'),
(159, 1, 6, '微型云矿机', 6.00, 0.56, 0.00833333, 720, 0.10, 0, '2020-06-19 15:23:01', '2020-06-22 10:28:30'),
(158, 1, 6, '微型云矿机', 6.00, 0.56, 0.00833333, 720, 0.10, 0, '2020-06-19 15:16:27', '2020-06-22 10:28:30'),
(157, 1, 6, '微型云矿机', 6.00, 0.56, 0.00833333, 720, 0.10, 0, '2020-06-19 15:14:43', '2020-06-22 10:28:30'),
(156, 1, 6, '微型云矿机', 6.00, 0.56, 0.00833333, 720, 0.10, 0, '2020-06-19 15:14:31', '2020-06-22 10:28:30'),
(155, 1, 6, '微型云矿机', 6.00, 0.56, 0.00833333, 720, 0.10, 0, '2020-06-19 15:12:02', '2020-06-22 10:28:30'),
(154, 1, 6, '微型云矿机', 6.00, 0.56, 0.00833333, 720, 0.10, 0, '2020-06-19 15:07:50', '2020-06-22 10:28:30'),
(153, 1, 6, '微型云矿机', 6.00, 0.56, 0.00833333, 720, 0.10, 0, '2020-06-19 14:58:36', '2020-06-22 10:28:30'),
(152, 3, 6, '中型云矿机', 240.00, 9.71, 0.14285713, 1680, 10.00, 0, '2020-06-19 14:25:37', '2020-06-22 10:28:30'),
(151, 1, 6, '微型云矿机', 6.00, 1.16, 0.00833333, 720, 0.10, 0, '2020-06-16 13:00:41', '2020-06-22 10:28:31'),
(150, 1, 6, '微型云矿机', 6.00, 1.16, 0.00833333, 720, 0.10, 0, '2020-06-16 13:00:41', '2020-06-22 10:28:31'),
(143, 3, 1, '中型云矿机', 240.00, 10.15, 0.14285713, 1680, 10.00, 1, '2020-06-09 14:07:35', '2020-06-19 17:46:02'),
(142, 2, 1, '小型云矿机', 24.00, 1.42, 0.02000000, 1200, 1.00, 1, '2020-06-09 14:02:56', '2020-06-19 17:46:04'),
(141, 2, 1, '小型云矿机', 24.00, 1.42, 0.02000000, 1200, 1.00, 1, '2020-06-09 14:02:56', '2020-06-19 17:46:06'),
(137, 2, 1, '小型云矿机', 24.00, 1.54, 0.02000000, 1200, 1.00, 1, '2020-06-09 07:21:12', '2020-06-19 17:46:08'),
(138, 3, 1, '中型云矿机', 240.00, 10.15, 0.14285713, 1680, 10.00, 1, '2020-06-09 12:59:10', '2020-06-19 17:46:10'),
(139, 1, 1, '微型云矿机', 6.00, 0.59, 0.00833333, 720, 0.10, 1, '2020-06-09 13:22:12', '2020-06-19 17:46:12'),
(140, 3, 1, '中型云矿机', 240.00, 10.15, 0.14285713, 1680, 10.00, 1, '2020-06-09 13:42:14', '2020-06-19 17:46:14');

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `buy_member_id` int NOT NULL COMMENT '购买方',
  `sales_member_id` int DEFAULT NULL COMMENT '出售方',
  `buy_member_phone` char(11) NOT NULL,
  `sales_member_phone` char(11) NOT NULL,
  `trade_number` mediumint NOT NULL COMMENT '交易数量',
  `trade_price` int NOT NULL COMMENT '单价(0.01$)',
  `trade_total_money` int NOT NULL COMMENT '交易总额(0.01$)',
  `payment_img` varchar(100) DEFAULT NULL,
  `trade_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '2.交易完成;0.待支付;1.待确认',
  `describes` varchar(10) NOT NULL DEFAULT '无' COMMENT '备注',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `buy_member_id`, `sales_member_id`, `buy_member_phone`, `sales_member_phone`, `trade_number`, `trade_price`, `trade_total_money`, `payment_img`, `trade_status`, `describes`, `created_at`, `updated_at`) VALUES
(61, 'HT1592485826089', 6, 1, '13048814716', '15570708089', 50, 43, 2150, NULL, 3, '投诉假图', '2020-06-18 13:10:26', '2020-06-18 15:13:03'),
(62, 'HT1592493726089', 6, 1, '13048814716', '15570708089', 100, 43, 4300, '/payImg/SBpfE5U4WfDhi8ChjvZ5hgUi4LitkpR1dZv0CPW2.jpeg', 2, '无', '2020-06-18 15:22:06', '2020-06-18 15:34:19'),
(63, 'HT1592503120089', 6, 1, '13048814716', '15570708089', 100, 44, 4400, '/payImg/Y671uGH1CvTqiOUZ4CV5iHHgTWCF32uuHrbIupK9.png', 2, '无', '2020-06-18 17:58:40', '2020-06-18 17:59:25'),
(64, 'HT1592568517089', 6, 1, '13048814716', '15570708089', 10, 44, 440, NULL, 3, '无', '2020-06-19 12:08:37', '2020-06-19 14:08:50');

-- --------------------------------------------------------

--
-- 表的结构 `permissions`
--

CREATE TABLE `permissions` (
  `id` int NOT NULL,
  `tittle` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `pid` smallint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `permissions`
--

INSERT INTO `permissions` (`id`, `tittle`, `url`, `pid`, `created_at`, `updated_at`) VALUES
(38, '编辑', 'admin/adminPermissionEdit', 36, '2019-12-26 12:16:21', '2019-12-26 16:41:27'),
(39, '删除', 'admin/adminPermissionDel', 36, '2019-12-26 12:16:54', '2019-12-26 16:41:33'),
(34, '编辑', 'admin/adminRoleEdit', 32, '2019-12-26 12:13:37', '2019-12-26 16:45:02'),
(35, '删除', 'admin/adminRoleDel', 32, '2019-12-26 12:14:35', '2019-12-26 16:45:07'),
(36, '权限管理', 'admin/adminPermission', 0, '2019-12-26 12:15:17', '2019-12-26 12:15:17'),
(37, '添加', 'admin/adminPermissionAdd', 36, '2019-12-26 12:15:38', '2019-12-26 16:41:39'),
(33, '添加', 'admin/adminRoleAdd', 32, '2019-12-26 12:13:11', '2019-12-26 16:45:13'),
(29, '添加', 'admin/adminAdd', 28, '2019-12-26 12:11:18', '2019-12-26 16:45:25'),
(30, '编辑', 'admin/adminEdit', 28, '2019-12-26 12:11:40', '2019-12-26 16:45:30'),
(31, '删除', 'admin/adminDel', 28, '2019-12-26 12:12:02', '2019-12-26 16:45:37'),
(32, '角色管理', 'admin/adminRole', 0, '2019-12-26 12:12:43', '2019-12-26 12:12:43'),
(28, '管理员列表', 'admin/adminList', 0, '2019-12-26 12:10:58', '2019-12-26 12:10:58'),
(40, '系统日志', 'admin/systemLog', 0, '2019-12-26 17:32:42', '2019-12-26 17:32:42'),
(47, '系统公告', 'admin/systemNotice', 0, '2020-01-03 10:43:00', '2020-01-03 10:43:00'),
(46, '删除', 'admin/systemLogDestroy', 40, '2020-01-03 10:41:09', '2020-05-30 11:15:18'),
(48, '添加', 'admin/systemNoticeAdd', 47, '2020-01-03 10:43:27', '2020-01-03 10:43:27'),
(49, '编辑', 'admin/systemNoticeEdit', 47, '2020-01-03 10:43:50', '2020-01-03 10:43:50'),
(50, '删除', 'admin/systemNoticeDel', 47, '2020-01-03 10:44:10', '2020-01-03 10:44:10'),
(51, '系统设置', 'admin/systemSetting', 0, '2020-01-03 10:45:03', '2020-01-03 10:45:03'),
(52, '基本设置', 'admin/systemSettingEdit', 51, '2020-01-03 11:20:50', '2020-03-20 08:13:58'),
(89, '冻结资产', 'admin/memberAssetsBlockEdit', 64, '2020-05-30 11:19:33', '2020-05-30 11:19:33'),
(55, '会员列表', 'admin/memberList', 0, '2020-01-03 16:59:04', '2020-01-03 16:59:04'),
(56, '编辑', 'admin/memberEdit', 55, '2020-01-03 17:00:00', '2020-01-03 17:00:00'),
(57, '删除', 'admin/memberDel', 55, '2020-01-03 17:00:24', '2020-01-03 17:00:24'),
(90, '删除', 'admin/memberAssetsDel', 64, '2020-05-30 11:20:52', '2020-05-30 11:20:52'),
(59, '会员等级管理', 'admin/memberLevel', 0, '2020-01-04 10:43:40', '2020-01-04 10:43:40'),
(60, '添加', 'admin/memberLevelAdd', 59, '2020-01-04 10:44:01', '2020-01-04 10:44:01'),
(61, '编辑', 'admin/memberLevelEdit', 59, '2020-01-04 10:44:27', '2020-01-04 10:44:27'),
(62, '删除', 'admin/memberLevelDel', 59, '2020-01-04 10:45:01', '2020-01-04 10:45:01'),
(63, '会员团队管理', 'admin/memberTeam', 0, '2020-01-04 13:50:12', '2020-03-20 07:52:17'),
(64, '会员资产管理', 'admin/memberAssets', 0, '2020-01-04 13:50:34', '2020-03-20 07:52:25'),
(65, '充值', 'admin/memberAssetsRechargeEdit', 64, '2020-01-04 13:51:41', '2020-01-04 13:51:41'),
(66, '会员实名认证', 'admin/memberRealName', 0, '2020-03-20 07:54:57', '2020-05-30 11:21:46'),
(67, '审核', 'admin/memberRealNameCheckEdit', 66, '2020-03-20 07:56:19', '2020-05-30 11:22:13'),
(68, '会员账单', 'admin/memberBill', 0, '2020-03-20 07:57:39', '2020-05-30 11:24:10'),
(69, '删除', 'admin/memberBillDestroy', 68, '2020-03-20 07:58:10', '2020-05-30 12:26:27'),
(70, '会员矿机管理', 'admin/memberMiner', 0, '2020-03-20 08:02:15', '2020-03-20 08:02:15'),
(71, '赠送矿机', 'admin/memberMinerAdd', 70, '2020-03-20 08:02:41', '2020-05-30 11:26:21'),
(72, '矿机控制', 'admin/memberMinerStop', 70, '2020-03-20 08:04:32', '2020-05-30 11:27:40'),
(73, '删除', 'admin/memberMinerDel', 70, '2020-03-20 08:04:47', '2020-03-20 08:04:47'),
(74, '系统矿机列表', 'admin/minerList', 0, '2020-03-20 08:05:31', '2020-03-20 08:33:53'),
(75, '添加', 'admin/minerAdd', 74, '2020-03-20 08:06:02', '2020-03-20 08:06:02'),
(76, '编辑', 'admin/minerEdit', 74, '2020-03-20 08:06:16', '2020-03-20 08:06:16'),
(77, '删除', 'admin/minerDel', 74, '2020-03-20 08:06:28', '2020-03-20 08:06:38'),
(78, '交易买入管理', 'admin/tradeBuyList', 0, '2020-03-20 08:07:47', '2020-05-30 12:17:17'),
(79, '删除', 'admin/tradeBuyDestroy', 78, '2020-03-20 08:08:55', '2020-05-30 12:20:58'),
(81, '交易卖出管理', 'admin/tradeSalesList', 0, '2020-03-20 08:09:54', '2020-05-30 12:21:53'),
(82, '删除', 'admin/tradeSalesDestroy', 81, '2020-03-20 08:10:07', '2020-05-30 12:22:14'),
(84, '交易订单', 'admin/tradeOrder', 0, '2020-03-20 08:10:59', '2020-05-30 12:23:05'),
(85, '取消交易', 'admin/tradeOrderCancelEdit', 84, '2020-03-20 08:11:28', '2020-05-30 12:23:36'),
(86, '高级设置', 'admin/systemAdvancedSetting', 51, '2020-03-20 08:14:35', '2020-05-30 11:17:01'),
(87, '添加', 'admin/tradeBuyAdd', 78, '2020-03-20 10:19:55', '2020-05-30 12:19:53'),
(91, '编辑', 'admin/memberRealNameEdit', 66, '2020-05-30 11:22:42', '2020-05-30 11:22:42'),
(92, '删除', 'admin/memberRealNameDel', 66, '2020-05-30 11:23:09', '2020-05-30 11:23:09'),
(93, '图片管理', 'admin/imageList', 0, '2020-05-30 11:28:32', '2020-05-30 11:28:32'),
(94, '添加', 'admin/imageAdd', 93, '2020-05-30 11:29:01', '2020-05-30 11:29:01'),
(95, '编辑', 'admin/imageEdit', 93, '2020-05-30 12:15:39', '2020-05-30 12:15:39'),
(96, '删除', 'admin/imageDel', 93, '2020-05-30 12:15:58', '2020-05-30 12:15:58');

-- --------------------------------------------------------

--
-- 表的结构 `phone_tmps`
--

CREATE TABLE `phone_tmps` (
  `id` int NOT NULL,
  `phone` char(11) NOT NULL,
  `code` varchar(6) NOT NULL,
  `captcha_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0.未验证;1.已验证',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `phone_tmps`
--

INSERT INTO `phone_tmps` (`id`, `phone`, `code`, `captcha_status`, `created_at`, `updated_at`) VALUES
(1, '15570708089', '401544', 1, '2019-12-19 09:50:05', '2019-12-19 09:54:46'),
(2, '13048814716', '9904', 0, '2020-06-12 15:50:24', '2020-06-12 15:50:24');

-- --------------------------------------------------------

--
-- 表的结构 `real_name_auths`
--

CREATE TABLE `real_name_auths` (
  `id` int NOT NULL,
  `member_id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `idcard` varchar(18) NOT NULL,
  `weixin` varchar(20) NOT NULL,
  `bank_name` varchar(30) DEFAULT NULL,
  `bank_card` varchar(25) DEFAULT NULL,
  `alipay` varchar(30) NOT NULL,
  `idcard_front_img` varchar(100) NOT NULL COMMENT '身份证正面',
  `idcard_back_img` varchar(100) NOT NULL COMMENT '身份证背面',
  `auth_status` tinyint(1) NOT NULL COMMENT '1,已认证，0.未认证，3.审核中，2.审核未通过',
  `describes` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `real_name_auths`
--

INSERT INTO `real_name_auths` (`id`, `member_id`, `name`, `idcard`, `weixin`, `bank_name`, `bank_card`, `alipay`, `idcard_front_img`, `idcard_back_img`, `auth_status`, `describes`, `created_at`, `updated_at`) VALUES
(1, 1, 'heshi', '431124199311270770', '15570708089', '深圳市', '123456789', '15570708089', '/idcardImg/1591092171431124199311270779front.jpg', '/idcardImg/1591712374431124199311270779back.jpg', 1, NULL, '2019-12-19 10:26:10', '2020-06-09 14:27:37'),
(2, 6, '何仕', '431124199311270779', 'he666', '', '', '13048814716', '/idcardImg/431124199311270779front.jpg', '/idcardImg/431124199311270779back.jpg', 1, NULL, '2020-06-16 07:59:17', '2020-06-16 13:00:41');

-- --------------------------------------------------------

--
-- 表的结构 `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `permission` varchar(1000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `roles`
--

INSERT INTO `roles` (`id`, `name`, `permission`, `created_at`, `updated_at`) VALUES
(1, '超级管理员', '0', '2019-12-23 17:23:40', NULL),
(19, '管理员', '28,40,47,51,55,56,59,63,64,89,65,66,67,91,68,70,71,72,74,78,81,84', '2020-06-01 16:39:04', '2020-06-02 06:34:22');

-- --------------------------------------------------------

--
-- 表的结构 `system_logs`
--

CREATE TABLE `system_logs` (
  `id` int NOT NULL,
  `event` varchar(20) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `system_logs`
--

INSERT INTO `system_logs` (`id`, `event`, `account`, `ip`, `content`, `created_at`, `updated_at`) VALUES
(1, '登录', '13048814716', '112.97.51.201', '登录：13048814716', '2020-06-08 16:14:27', '2020-06-08 16:14:27'),
(2, '登录', '13048814716', '112.97.51.201', '登录：13048814716', '2020-06-08 16:15:42', '2020-06-08 16:15:42'),
(3, '登录', '13048814716', '112.97.51.201', '退出登录：13048814716', '2020-06-08 16:53:26', '2020-06-08 16:53:26'),
(4, '登录', '13048814716', '112.97.54.64', '登录：13048814716', '2020-06-09 06:15:14', '2020-06-09 06:15:14'),
(5, '登录', '13048814716', '112.97.54.64', '登录：13048814716', '2020-06-09 06:16:58', '2020-06-09 06:16:58'),
(6, '新增', '13048814716', '112.97.54.64', '{\"0\":\"tradeBuyAdd\",\"number\":\"5\",\"price\":\"0.34\",\"orderNumber\":\"10\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-09 06:17:46', '2020-06-09 06:17:46'),
(7, '新增', '13048814716', '112.97.54.64', '{\"0\":\"tradeBuyAdd\",\"number\":\"10\",\"price\":\"0.34\",\"orderNumber\":\"10\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-09 06:17:58', '2020-06-09 06:17:58'),
(8, '新增', '13048814716', '112.97.54.64', '{\"0\":\"tradeBuyAdd\",\"number\":\"5\",\"price\":\"0.34\",\"orderNumber\":\"60\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-09 06:18:36', '2020-06-09 06:18:36'),
(9, '新增', '13048814716', '112.97.54.64', '{\"0\":\"tradeBuyAdd\",\"number\":\"10\",\"price\":\"0.34\",\"orderNumber\":\"40\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-09 06:19:21', '2020-06-09 06:19:21'),
(10, '新增', '13048814716', '112.97.54.64', '{\"0\":\"tradeBuyAdd\",\"number\":\"50\",\"price\":\"0.34\",\"orderNumber\":\"50\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-09 06:19:30', '2020-06-09 06:19:30'),
(11, '新增', '13048814716', '112.97.54.64', '{\"0\":\"tradeBuyAdd\",\"number\":\"100\",\"price\":\"0.34\",\"orderNumber\":\"50\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-09 06:19:41', '2020-06-09 06:19:41'),
(12, '新增', '13048814716', '112.97.54.64', '{\"0\":\"tradeBuyAdd\",\"number\":\"200\",\"price\":\"0.34\",\"orderNumber\":\"50\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-09 06:19:51', '2020-06-09 06:19:51'),
(13, '更新', '13048814716', '112.97.54.64', '{\"0\":\"systemNoticeEdit\",\"id\":\"18\",\"tittle\":\"推广奖励规则\",\"content\":\"<ul class=\\\" list-paddingleft-2\\\" style=\\\"list-style-type: disc;\\\"><li><p>直推奖励：<\\/p><table><tbody><tr class=\\\"firstRow\\\"><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">直推人数<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">团队算力<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">奖励<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">10<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">1G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">微型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">30<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">30G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">小型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">60<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">600G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">中型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">100<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">10000G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">大型云矿机<\\/td><\\/tr><\\/tbody><\\/table><p><br\\/><\\/p><\\/li><li><p>疯狂奖励：<\\/p><p>获得直推买币的1%奖励，可直接卖出<\\/p><p><br\\/><\\/p><\\/li><li><p>等级烧伤：<\\/p><p>低于直推的等级，无法获得以上所有奖励<\\/p><\\/li><\\/ul>\",\"s\":\"\\/\\/admin\\/systemNoticeEdit\"}', '2020-06-09 06:52:07', '2020-06-09 06:52:07'),
(14, '更新', '13048814716', '112.97.54.64', '{\"0\":\"systemNoticeEdit\",\"id\":\"18\",\"tittle\":\"推广奖励规则\",\"content\":\"<ul class=\\\" list-paddingleft-2\\\" style=\\\"list-style-type: disc;\\\"><li><p>直推奖励：<\\/p><table><tbody><tr class=\\\"firstRow\\\"><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">直推人数<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">团队算力<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">奖励<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">10<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">1G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">微型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">30<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">30G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">小型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">60<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">600G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">中型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">100<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">10000G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">大型云矿机<\\/td><\\/tr><\\/tbody><\\/table><p><br\\/><\\/p><\\/li><li><p>疯狂奖励：<\\/p><p>获得直推买币的1%，可直接卖出<\\/p><p><br\\/><\\/p><\\/li><li><p>等级烧伤：<\\/p><p>低于直推的等级，无法获得以上所有奖励<\\/p><\\/li><\\/ul>\",\"s\":\"\\/\\/admin\\/systemNoticeEdit\"}', '2020-06-09 06:56:28', '2020-06-09 06:56:28'),
(15, '更新', '13048814716', '112.97.54.64', '{\"0\":\"systemNoticeEdit\",\"id\":\"18\",\"tittle\":\"推广奖励规则\",\"content\":\"<ul class=\\\" list-paddingleft-2\\\" style=\\\"list-style-type: disc;\\\"><li><p>直推奖励：<\\/p><table><tbody><tr class=\\\"firstRow\\\"><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">直推人数<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">团队算力<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">奖励<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">10<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">1G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">微型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">30<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">30G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">小型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">60<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">600G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">中型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">100<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">10000G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">大型云矿机<\\/td><\\/tr><\\/tbody><\\/table><p><br\\/><\\/p><\\/li><li><p>疯狂奖励：<\\/p><p>获得直推买币的1%，可直接卖出<\\/p><p><br\\/><\\/p><\\/li><li><p>等级烧伤：<\\/p><p>低于直推的等级，无法获得以上所有奖励<\\/p><\\/li><\\/ul>\",\"s\":\"\\/\\/admin\\/systemNoticeEdit\"}', '2020-06-09 06:58:33', '2020-06-09 06:58:33'),
(16, '登录', '13048814716', '127.0.0.1', '登录：13048814716', '2020-06-09 07:01:11', '2020-06-09 07:01:11'),
(17, '更新', '13048814716', '127.0.0.1', '{\"0\":\"systemNoticeEdit\",\"id\":\"18\",\"tittle\":\"推广奖励规则\",\"content\":\"<ul class=\\\" list-paddingleft-2\\\" style=\\\"list-style-type: disc;\\\"><li><p>直推奖励：<\\/p><table><tbody><tr class=\\\"firstRow\\\"><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">直推人数<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">团队算力<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">奖励<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">10<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">1G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">微型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">30<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">30G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">小型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">60<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">600G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">中型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">100<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">10000G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">大型云矿机<\\/td><\\/tr><\\/tbody><\\/table><p><br\\/><\\/p><\\/li><li><p>疯狂奖励：<\\/p><p>获得直推买币的1%，可直接卖出<\\/p><p><br\\/><\\/p><\\/li><li><p>等级烧伤：<\\/p><p>低于直推的等级，无法获得以上所有奖励<\\/p><\\/li><\\/ul>\"}', '2020-06-09 07:01:30', '2020-06-09 07:01:30'),
(18, '更新', '13048814716', '112.97.54.64', '{\"0\":\"systemNoticeEdit\",\"id\":\"18\",\"tittle\":\"推广奖励规则\",\"content\":\"<ul class=\\\" list-paddingleft-2\\\" style=\\\"list-style-type: disc;\\\"><li><p>直推奖励：<\\/p><table><tbody><tr class=\\\"firstRow\\\"><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">直推人数<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">团队算力<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">奖励<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">10<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">1G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">微型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">30<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">30G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">小型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">60<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">600G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">中型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">100<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">10000G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">大型云矿机<\\/td><\\/tr><\\/tbody><\\/table><p><br\\/><\\/p><\\/li><li><p>疯狂奖励：<\\/p><p>获得直推买币的1%，可直接卖出<\\/p><p><br\\/><\\/p><\\/li><li><p>等级烧伤：<\\/p><p>低于直推的等级，无法获得以上所有奖励<\\/p><\\/li><\\/ul>\",\"s\":\"\\/\\/admin\\/systemNoticeEdit\"}', '2020-06-09 07:02:38', '2020-06-09 07:02:38'),
(19, '更新', '13048814716', '112.97.54.64', '{\"0\":\"systemNoticeEdit\",\"id\":\"18\",\"tittle\":\"推广奖励规则\",\"content\":\"<ul class=\\\" list-paddingleft-2\\\" style=\\\"list-style-type: disc;\\\"><li><p>直推奖励：<\\/p><table><tbody><tr class=\\\"firstRow\\\"><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">直推人数<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">团队算力<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">奖励<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">10<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">1G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">微型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">30<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">30G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">小型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">60<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">600G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">中型云矿机<\\/td><\\/tr><tr><td width=\\\"91\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">100<\\/td><td width=\\\"124\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">10000G<\\/td><td width=\\\"153\\\" valign=\\\"top\\\" style=\\\"word-break: break-all;\\\">大型云矿机<\\/td><\\/tr><\\/tbody><\\/table><p><br\\/><\\/p><\\/li><li><p>疯狂奖励：<\\/p><p>获得直推买币的1%，可直接卖出<\\/p><p><br\\/><\\/p><\\/li><li><p>等级烧伤：<\\/p><p>低于直推的等级，无法获得以上所有奖励<\\/p><\\/li><\\/ul>\",\"s\":\"\\/\\/admin\\/systemNoticeEdit\"}', '2020-06-09 07:08:43', '2020-06-09 07:08:43'),
(20, '更新', '13048814716', '112.97.54.64', '{\"0\":\"systemNoticeEdit\",\"id\":\"4\",\"tittle\":\"交易规则\",\"content\":\"<ul class=\\\" list-paddingleft-2\\\" style=\\\"list-style-type: disc;\\\"><li><p>开盘价$0.1，每天上涨$0.01<\\/p><\\/li><li><p>实名认证送2台微型矿机<\\/p><\\/li><li><p>没有矿机运行，无法卖出<br\\/><\\/p><\\/li><\\/ul><p><br\\/><\\/p><p>升级规则：<\\/p><table><tbody><tr class=\\\"firstRow\\\"><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"87\\\" style=\\\"word-break: break-all;\\\">等级<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"155\\\" style=\\\"word-break: break-all;\\\">要求<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"106\\\" style=\\\"word-break: break-all;\\\">每天卖出次数<\\/td><\\/tr><tr><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"87\\\" style=\\\"word-break: break-all;\\\">一级会员<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"155\\\" style=\\\"word-break: break-all;\\\">有微型云矿机在运行<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"106\\\" style=\\\"word-break: break-all;\\\">1<\\/td><\\/tr><tr><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"87\\\" style=\\\"word-break: break-all;\\\">二级会员<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"155\\\" style=\\\"word-break: break-all;\\\">有小型云矿机在运行<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"106\\\" style=\\\"word-break: break-all;\\\">1<\\/td><\\/tr><tr><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"87\\\" style=\\\"word-break: break-all;\\\">三级会员<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"155\\\" style=\\\"word-break: break-all;\\\">有中型云矿机在运行<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"106\\\" style=\\\"word-break: break-all;\\\">2<\\/td><\\/tr><tr><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"87\\\" style=\\\"word-break: break-all;\\\">四级会员<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"155\\\" style=\\\"word-break: break-all;\\\">有大型云矿机在运行<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"106\\\" style=\\\"word-break: break-all;\\\">3<\\/td><\\/tr><tr><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"87\\\" style=\\\"word-break: break-all;\\\">五级会员<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"155\\\" style=\\\"word-break: break-all;\\\">有超级云矿机在运行<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"106\\\" style=\\\"word-break: break-all;\\\">不限制<\\/td><\\/tr><\\/tbody><\\/table><p><br\\/><\\/p>\",\"s\":\"\\/\\/admin\\/systemNoticeEdit\"}', '2020-06-09 07:08:56', '2020-06-09 07:08:56'),
(21, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 12:20:12', '2020-06-09 12:20:12'),
(22, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 12:21:32', '2020-06-09 12:21:32'),
(23, '更新', '13048814716', '112.97.57.91', '{\"0\":\"memberAssetsRechargeEdit\",\"balance\":\"10000\",\"buyTotal\":null,\"s\":\"\\/\\/admin\\/memberAssetsRechargeEdit\"}', '2020-06-09 12:22:10', '2020-06-09 12:22:10'),
(24, '登录', '13048814716', '127.0.0.1', '登录：13048814716', '2020-06-09 12:25:54', '2020-06-09 12:25:54'),
(25, '更新', '13048814716', '127.0.0.1', '{\"0\":\"memberAssetsRechargeEdit\",\"balance\":\"10\",\"buyTotal\":null}', '2020-06-09 12:26:15', '2020-06-09 12:26:15'),
(26, '更新', '13048814716', '127.0.0.1', '{\"0\":\"memberAssetsRechargeEdit\",\"balance\":\"10\",\"rewards\":null}', '2020-06-09 13:15:48', '2020-06-09 13:15:48'),
(27, '更新', '13048814716', '127.0.0.1', '{\"0\":\"memberAssetsRechargeEdit\",\"balance\":\"10000\",\"rewards\":null}', '2020-06-09 13:41:08', '2020-06-09 13:41:08'),
(28, '更新', '13048814716', '127.0.0.1', '{\"0\":\"memberAssetsRechargeEdit\",\"balance\":\"-100\",\"rewards\":null}', '2020-06-09 13:43:47', '2020-06-09 13:43:47'),
(29, '更新', '13048814716', '127.0.0.1', '{\"0\":\"memberAssetsRechargeEdit\",\"balance\":\"-10\",\"rewards\":null}', '2020-06-09 13:46:53', '2020-06-09 13:46:53'),
(30, '更新', '13048814716', '127.0.0.1', '{\"0\":\"memberAssetsRechargeEdit\",\"balance\":\"-10\",\"rewards\":null}', '2020-06-09 13:49:00', '2020-06-09 13:49:00'),
(31, '更新', '13048814716', '127.0.0.1', '{\"0\":\"memberAssetsRechargeEdit\",\"balance\":null,\"rewards\":\"50\"}', '2020-06-09 13:51:06', '2020-06-09 13:51:06'),
(32, '更新', '13048814716', '127.0.0.1', '{\"0\":\"memberAssetsRechargeEdit\",\"balance\":null,\"rewards\":\"50\"}', '2020-06-09 13:52:48', '2020-06-09 13:52:48'),
(33, '新增', '13048814716', '127.0.0.1', '{\"0\":\"memberMinerAdd\",\"minerType\":\"1\",\"number\":\"1\"}', '2020-06-09 14:01:38', '2020-06-09 14:01:38'),
(34, '新增', '13048814716', '127.0.0.1', '{\"0\":\"memberMinerAdd\",\"minerType\":\"2\",\"number\":\"2\"}', '2020-06-09 14:02:55', '2020-06-09 14:02:55'),
(35, '新增', '13048814716', '127.0.0.1', '{\"0\":\"memberMinerAdd\",\"minerType\":\"3\",\"number\":\"1\"}', '2020-06-09 14:07:35', '2020-06-09 14:07:35'),
(36, '更新', '13048814716', '127.0.0.1', '{\"0\":\"memberRealNameEdit\",\"name\":\"heshi\",\"idcard\":\"431124199311270779\",\"weixin\":\"15570708089\",\"alipay\":\"15570708089\",\"bank_name\":\"深圳市\",\"bank_card\":\"123456\",\"idcard_front_img\":null}', '2020-06-09 14:19:34', '2020-06-09 14:19:34'),
(37, '更新', '13048814716', '127.0.0.1', '{\"0\":\"memberRealNameEdit\",\"name\":\"heshi\",\"idcard\":\"431124199311270779\",\"weixin\":\"15570708089\",\"alipay\":\"15570708089\",\"bank_name\":\"深圳市\",\"bank_card\":\"123456789\",\"idcard_front_img\":null,\"idcard_back_img\":null}', '2020-06-09 14:27:36', '2020-06-09 14:27:36'),
(38, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 14:29:17', '2020-06-09 14:29:17'),
(39, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 14:55:23', '2020-06-09 14:55:23'),
(40, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 14:56:12', '2020-06-09 14:56:12'),
(41, '登录', '13048814716', '112.97.57.91', '退出登录：13048814716', '2020-06-09 14:57:27', '2020-06-09 14:57:27'),
(42, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 14:57:49', '2020-06-09 14:57:49'),
(43, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 15:02:45', '2020-06-09 15:02:45'),
(44, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 15:04:25', '2020-06-09 15:04:25'),
(45, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 15:08:21', '2020-06-09 15:08:21'),
(46, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 15:09:19', '2020-06-09 15:09:19'),
(47, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 15:12:25', '2020-06-09 15:12:25'),
(48, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 15:18:44', '2020-06-09 15:18:44'),
(49, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 15:21:09', '2020-06-09 15:21:09'),
(50, '登录', '13048814716', '112.97.57.91', '退出登录：13048814716', '2020-06-09 15:22:35', '2020-06-09 15:22:35'),
(51, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 15:22:54', '2020-06-09 15:22:54'),
(52, '登录', '13048814716', '112.97.57.91', '退出登录：13048814716', '2020-06-09 15:22:59', '2020-06-09 15:22:59'),
(53, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 15:25:16', '2020-06-09 15:25:16'),
(54, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 15:31:52', '2020-06-09 15:31:52'),
(55, '登录', '13048814716', '112.97.57.91', '退出登录：13048814716', '2020-06-09 15:31:56', '2020-06-09 15:31:56'),
(56, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 15:32:21', '2020-06-09 15:32:21'),
(57, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 15:36:46', '2020-06-09 15:36:46'),
(58, '登录', '13048814716', '112.97.57.91', '退出登录：13048814716', '2020-06-09 15:37:09', '2020-06-09 15:37:09'),
(59, '登录', '13048814716', '112.97.57.91', '登录：13048814716', '2020-06-09 15:47:06', '2020-06-09 15:47:06'),
(60, '登录', '13048814716', '112.97.63.245', '登录：13048814716', '2020-06-09 19:07:41', '2020-06-09 19:07:41'),
(61, '登录', '13048814716', '127.0.0.1', '登录：13048814716', '2020-06-10 16:54:23', '2020-06-10 16:54:23'),
(62, '更新', '13048814716', '127.0.0.1', '{\"0\":\"imageEdit\",\"type\":\"miner\",\"imgTittle\":\"微型云矿机\"}', '2020-06-10 16:55:41', '2020-06-10 16:55:41'),
(63, '更新', '13048814716', '127.0.0.1', '{\"0\":\"imageEdit\",\"type\":\"miner\",\"imgTittle\":\"小型云矿机\"}', '2020-06-10 16:56:01', '2020-06-10 16:56:01'),
(64, '更新', '13048814716', '127.0.0.1', '{\"0\":\"imageEdit\",\"type\":\"miner\",\"imgTittle\":\"中型云矿机\"}', '2020-06-10 16:56:17', '2020-06-10 16:56:17'),
(65, '更新', '13048814716', '127.0.0.1', '{\"0\":\"imageEdit\",\"type\":\"miner\",\"imgTittle\":\"大型云矿机\"}', '2020-06-10 16:56:31', '2020-06-10 16:56:31'),
(66, '更新', '13048814716', '127.0.0.1', '{\"0\":\"imageEdit\",\"type\":\"miner\",\"imgTittle\":\"超级云矿机\"}', '2020-06-10 16:56:47', '2020-06-10 16:56:47'),
(67, '登录', '13048814716', '113.116.195.95', '登录：13048814716', '2020-06-11 04:53:49', '2020-06-11 04:53:49'),
(68, '登录', '13048814716', '113.116.195.95', '登录：13048814716', '2020-06-11 05:00:07', '2020-06-11 05:00:07'),
(69, '新增', '13048814716', '113.116.195.95', '{\"0\":\"tradeBuyAdd\",\"number\":\"5\",\"price\":\"0.36\",\"orderNumber\":\"40\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-11 05:00:55', '2020-06-11 05:00:55'),
(70, '新增', '13048814716', '113.116.195.95', '{\"0\":\"tradeBuyAdd\",\"number\":\"10\",\"price\":\"0.36\",\"orderNumber\":\"40\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-11 05:01:06', '2020-06-11 05:01:06'),
(71, '新增', '13048814716', '113.116.195.95', '{\"0\":\"tradeBuyAdd\",\"number\":\"50\",\"price\":\"0.36\",\"orderNumber\":\"40\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-11 05:01:16', '2020-06-11 05:01:16'),
(72, '新增', '13048814716', '113.116.195.95', '{\"0\":\"tradeBuyAdd\",\"number\":\"100\",\"price\":\"0.36\",\"orderNumber\":\"40\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-11 05:01:26', '2020-06-11 05:01:26'),
(73, '新增', '13048814716', '113.116.195.95', '{\"0\":\"tradeBuyAdd\",\"number\":\"200\",\"price\":\"0.36\",\"orderNumber\":\"49\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-11 05:01:37', '2020-06-11 05:01:37'),
(74, '登录', '13048814716', '113.116.195.95', '退出登录：13048814716', '2020-06-11 05:49:22', '2020-06-11 05:49:22'),
(75, '登录', '13048814716', '113.116.195.95', '登录：13048814716', '2020-06-11 06:06:38', '2020-06-11 06:06:38'),
(76, '登录', '13048814716', '113.116.195.95', '登录：13048814716', '2020-06-11 06:08:00', '2020-06-11 06:08:00'),
(77, '登录', '13048814716', '113.116.195.95', '登录：13048814716', '2020-06-11 06:20:13', '2020-06-11 06:20:13'),
(78, '登录', '13048814716', '113.116.195.95', '登录：13048814716', '2020-06-11 06:34:09', '2020-06-11 06:34:09'),
(79, '登录', '13048814716', '112.97.57.196', '登录：13048814716', '2020-06-12 14:28:34', '2020-06-12 14:28:34'),
(80, '新增', '13048814716', '112.97.57.196', '{\"0\":\"tradeBuyAdd\",\"number\":\"5\",\"price\":\"0.37\",\"orderNumber\":\"3\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-12 14:56:24', '2020-06-12 14:56:24'),
(81, '新增', '13048814716', '112.97.57.196', '{\"0\":\"tradeBuyAdd\",\"number\":\"5\",\"price\":\"0.37\",\"orderNumber\":\"2\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-12 14:57:30', '2020-06-12 14:57:30'),
(82, '登录', '13048814716', '112.97.57.196', '登录：13048814716', '2020-06-12 16:28:24', '2020-06-12 16:28:24'),
(83, '更新', '13048814716', '112.97.57.196', '{\"0\":\"memberAssetsBlockEdit\",\"blockNumber\":\"10\",\"s\":\"\\/\\/admin\\/memberAssetsBlockEdit\"}', '2020-06-12 16:48:21', '2020-06-12 16:48:21'),
(84, '更新', '13048814716', '112.97.57.196', '{\"0\":\"memberAssetsBlockEdit\",\"blockNumber\":\"-10\",\"s\":\"\\/\\/admin\\/memberAssetsBlockEdit\"}', '2020-06-12 16:48:30', '2020-06-12 16:48:30'),
(85, '更新', '13048814716', '112.97.57.196', '{\"0\":\"memberAssetsBlockEdit\",\"blockNumber\":\"10\",\"s\":\"\\/\\/admin\\/memberAssetsBlockEdit\"}', '2020-06-12 16:49:44', '2020-06-12 16:49:44'),
(86, '更新', '13048814716', '112.97.57.196', '{\"0\":\"memberAssetsBlockEdit\",\"blockNumber\":\"-10\",\"s\":\"\\/\\/admin\\/memberAssetsBlockEdit\"}', '2020-06-12 16:49:50', '2020-06-12 16:49:50'),
(87, '更新', '13048814716', '112.97.57.196', '{\"0\":\"memberAssetsBlockEdit\",\"blockNumber\":\"0\",\"s\":\"\\/\\/admin\\/memberAssetsBlockEdit\"}', '2020-06-12 16:51:08', '2020-06-12 16:51:08'),
(88, '更新', '13048814716', '112.97.57.196', '{\"0\":\"memberAssetsBlockEdit\",\"blockNumber\":\"10\",\"s\":\"\\/\\/admin\\/memberAssetsBlockEdit\"}', '2020-06-12 17:07:28', '2020-06-12 17:07:28'),
(89, '更新', '13048814716', '112.97.57.196', '{\"0\":\"memberAssetsBlockEdit\",\"blockNumber\":\"-5\",\"s\":\"\\/\\/admin\\/memberAssetsBlockEdit\"}', '2020-06-12 17:07:33', '2020-06-12 17:07:33'),
(90, '更新', '13048814716', '112.97.57.196', '{\"0\":\"memberAssetsBlockEdit\",\"blockNumber\":\"-5\",\"s\":\"\\/\\/admin\\/memberAssetsBlockEdit\"}', '2020-06-12 17:07:38', '2020-06-12 17:07:38'),
(91, '更新', '13048814716', '112.97.57.196', '{\"0\":\"memberAssetsBlockEdit\",\"blockNumber\":\"10000\",\"s\":\"\\/\\/admin\\/memberAssetsBlockEdit\"}', '2020-06-12 17:11:38', '2020-06-12 17:11:38'),
(92, '更新', '13048814716', '112.97.57.196', '{\"0\":\"memberAssetsBlockEdit\",\"blockNumber\":\"10000\",\"s\":\"\\/\\/admin\\/memberAssetsBlockEdit\"}', '2020-06-12 17:12:24', '2020-06-12 17:12:24'),
(93, '更新', '13048814716', '112.97.57.196', '{\"0\":\"memberAssetsBlockEdit\",\"blockNumber\":\"10000\",\"s\":\"\\/\\/admin\\/memberAssetsBlockEdit\"}', '2020-06-12 17:14:02', '2020-06-12 17:14:02'),
(94, '更新', '13048814716', '112.97.57.196', '{\"0\":\"memberAssetsBlockEdit\",\"blockNumber\":\"10000\",\"s\":\"\\/\\/admin\\/memberAssetsBlockEdit\"}', '2020-06-12 17:14:11', '2020-06-12 17:14:11'),
(95, '更新', '13048814716', '112.97.57.196', '{\"0\":\"memberAssetsBlockEdit\",\"blockNumber\":\"9000\",\"s\":\"\\/\\/admin\\/memberAssetsBlockEdit\"}', '2020-06-12 17:15:43', '2020-06-12 17:15:43'),
(96, '更新', '13048814716', '112.97.57.196', '{\"0\":\"memberAssetsBlockEdit\",\"blockNumber\":\"-9000\",\"s\":\"\\/\\/admin\\/memberAssetsBlockEdit\"}', '2020-06-12 17:16:15', '2020-06-12 17:16:15'),
(97, '登录', '13048814716', '112.97.50.192', '登录：13048814716', '2020-06-16 08:00:10', '2020-06-16 08:00:10'),
(98, '更新', '13048814716', '112.97.50.192', '{\"0\":\"memberRealNameCheckEdit\",\"auth_status\":\"1\",\"s\":\"\\/\\/admin\\/memberRealNameCheckEdit\"}', '2020-06-16 08:00:25', '2020-06-16 08:00:25'),
(99, '登录', '13048814716', '112.97.60.39', '登录：13048814716', '2020-06-16 12:25:10', '2020-06-16 12:25:10'),
(100, '更新', '13048814716', '112.97.60.39', '{\"0\":\"memberRealNameCheckEdit\",\"auth_status\":\"0\",\"s\":\"\\/\\/admin\\/memberRealNameCheckEdit\"}', '2020-06-16 12:25:30', '2020-06-16 12:25:30'),
(101, '更新', '13048814716', '112.97.60.39', '{\"0\":\"memberRealNameCheckEdit\",\"auth_status\":\"1\",\"s\":\"\\/\\/admin\\/memberRealNameCheckEdit\"}', '2020-06-16 12:25:40', '2020-06-16 12:25:40'),
(102, '更新', '13048814716', '112.97.60.39', '{\"0\":\"memberRealNameCheckEdit\",\"auth_status\":\"1\",\"s\":\"\\/\\/admin\\/memberRealNameCheckEdit\"}', '2020-06-16 12:42:29', '2020-06-16 12:42:29'),
(103, '更新', '13048814716', '112.97.60.39', '{\"0\":\"memberRealNameCheckEdit\",\"auth_status\":\"2\",\"s\":\"\\/\\/admin\\/memberRealNameCheckEdit\"}', '2020-06-16 12:55:24', '2020-06-16 12:55:24'),
(104, '更新', '13048814716', '112.97.60.39', '{\"0\":\"memberRealNameCheckEdit\",\"auth_status\":\"2\",\"s\":\"\\/\\/admin\\/memberRealNameCheckEdit\"}', '2020-06-16 13:00:36', '2020-06-16 13:00:36'),
(105, '更新', '13048814716', '112.97.60.39', '{\"0\":\"memberRealNameCheckEdit\",\"memberId\":\"6\",\"auth_status\":\"1\",\"s\":\"\\/\\/admin\\/memberRealNameCheckEdit\"}', '2020-06-16 13:00:41', '2020-06-16 13:00:41'),
(106, '登录', '13048814716', '127.0.0.1', '登录：13048814716', '2020-06-16 17:01:37', '2020-06-16 17:01:37'),
(107, '登录', '13048814716', '112.97.63.146', '登录：13048814716', '2020-06-18 14:30:31', '2020-06-18 14:30:31'),
(108, '登录', '13048814716', '112.97.63.146', '退出登录：13048814716', '2020-06-18 14:53:08', '2020-06-18 14:53:08'),
(109, '登录', '13048814716', '112.97.63.146', '登录：13048814716', '2020-06-18 14:54:15', '2020-06-18 14:54:15'),
(110, '登录', '13048814716', '112.97.63.146', '退出登录：13048814716', '2020-06-18 14:57:31', '2020-06-18 14:57:31'),
(111, '登录', '13048814716', '112.97.63.146', '登录：13048814716', '2020-06-18 15:12:22', '2020-06-18 15:12:22'),
(112, '更新', '13048814716', '112.97.63.146', '{\"0\":\"tradeOrderCancelEdit\",\"cancelType\":\"blockBuy\",\"s\":\"\\/\\/admin\\/tradeOrderCancelEdit\"}', '2020-06-18 15:13:03', '2020-06-18 15:13:03'),
(113, '更新', '13048814716', '112.97.63.146', '{\"0\":\"memberEdit\",\"id\":\"6\",\"credit\":\"94\",\"password\":null,\"safe_password\":null,\"activated\":\"0\",\"s\":\"\\/\\/admin\\/memberEdit\"}', '2020-06-18 15:14:26', '2020-06-18 15:14:26'),
(114, '更新', '13048814716', '112.97.63.146', '{\"0\":\"memberEdit\",\"id\":\"6\",\"credit\":\"94\",\"password\":null,\"safe_password\":null,\"activated\":\"0\",\"s\":\"\\/\\/admin\\/memberEdit\"}', '2020-06-18 15:19:19', '2020-06-18 15:19:19'),
(115, '新增', '13048814716', '112.97.63.146', '{\"0\":\"tradeBuyAdd\",\"number\":\"5\",\"price\":\"0.43\",\"orderNumber\":\"30\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-18 16:54:53', '2020-06-18 16:54:53'),
(116, '新增', '13048814716', '112.97.63.146', '{\"0\":\"tradeBuyAdd\",\"number\":\"10\",\"price\":\"0.43\",\"orderNumber\":\"30\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-18 16:55:02', '2020-06-18 16:55:02'),
(117, '新增', '13048814716', '112.97.63.146', '{\"0\":\"tradeBuyAdd\",\"number\":\"50\",\"price\":\"0.43\",\"orderNumber\":\"30\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-18 16:55:10', '2020-06-18 16:55:10'),
(118, '新增', '13048814716', '112.97.63.146', '{\"0\":\"tradeBuyAdd\",\"number\":\"50\",\"price\":\"0.43\",\"orderNumber\":\"30\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-18 16:55:20', '2020-06-18 16:55:20'),
(119, '新增', '13048814716', '112.97.63.146', '{\"0\":\"tradeBuyAdd\",\"number\":\"200\",\"price\":\"0.43\",\"orderNumber\":\"20\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-18 16:55:29', '2020-06-18 16:55:29'),
(120, '新增', '13048814716', '112.97.63.146', '{\"0\":\"tradeBuyAdd\",\"number\":\"100\",\"price\":\"0.43\",\"orderNumber\":\"30\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-18 16:55:44', '2020-06-18 16:55:44'),
(121, '新增', '13048814716', '112.97.63.146', '{\"0\":\"tradeBuyAdd\",\"number\":\"200\",\"price\":\"0.43\",\"orderNumber\":\"10\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-18 16:56:44', '2020-06-18 16:56:44'),
(122, '新增', '13048814716', '112.97.63.146', '{\"0\":\"tradeBuyAdd\",\"number\":\"10\",\"price\":\"0.43\",\"orderNumber\":\"20\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-18 16:57:36', '2020-06-18 16:57:36'),
(123, '更新', '13048814716', '112.97.63.146', '{\"0\":\"memberAssetsBlockEdit\",\"blockNumber\":\"-65\",\"s\":\"\\/\\/admin\\/memberAssetsBlockEdit\"}', '2020-06-18 18:09:37', '2020-06-18 18:09:37'),
(124, '登录', '13048814716', '112.97.54.231', '登录：13048814716', '2020-06-19 10:31:20', '2020-06-19 10:31:20'),
(125, '更新', '13048814716', '112.97.54.231', '{\"0\":\"memberAssetsRechargeEdit\",\"balance\":\"200\",\"rewards\":null,\"s\":\"\\/\\/admin\\/memberAssetsRechargeEdit\"}', '2020-06-19 14:53:15', '2020-06-19 14:53:15'),
(126, '更新', '13048814716', '112.97.54.231', '{\"0\":\"memberAssetsRechargeEdit\",\"balance\":\"100\",\"rewards\":null,\"s\":\"\\/\\/admin\\/memberAssetsRechargeEdit\"}', '2020-06-19 14:58:13', '2020-06-19 14:58:13'),
(127, '更新', '13048814716', '112.97.54.231', '{\"0\":\"adminEdit\",\"name\":\"admin\",\"password\":\"hocytheyoun631\",\"phone\":\"13048814716\",\"weixin\":\"admin\",\"role\":\"1\",\"s\":\"\\/\\/admin\\/adminEdit\"}', '2020-06-19 17:41:33', '2020-06-19 17:41:33'),
(128, '更新', '13048814716', '112.97.54.231', '{\"0\":\"memberEdit\",\"id\":\"1\",\"credit\":\"100\",\"password\":null,\"safe_password\":null,\"activated\":\"3\",\"s\":\"\\/\\/admin\\/memberEdit\"}', '2020-06-19 17:44:06', '2020-06-19 17:44:06'),
(129, '更新', '13048814716', '112.97.54.231', '{\"0\":\"memberEdit\",\"id\":\"6\",\"credit\":\"100\",\"password\":null,\"safe_password\":null,\"activated\":\"0\",\"s\":\"\\/\\/admin\\/memberEdit\"}', '2020-06-19 17:44:26', '2020-06-19 17:44:26'),
(130, '更新', '13048814716', '112.97.54.231', '{\"0\":\"memberAssetsRechargeEdit\",\"balance\":\"-9610.59\",\"rewards\":null,\"s\":\"\\/\\/admin\\/memberAssetsRechargeEdit\"}', '2020-06-19 17:44:58', '2020-06-19 17:44:58'),
(131, '更新', '13048814716', '112.97.54.231', '{\"0\":\"memberActivityEdit\",\"subordinate\":\"10\",\"hashrate\":\"1\",\"minerType\":\"1\",\"number\":\"1\",\"rewardMembers\":null,\"s\":\"\\/\\/admin\\/memberActivityEdit\"}', '2020-06-19 18:09:32', '2020-06-19 18:09:32'),
(132, '更新', '13048814716', '112.97.54.231', '{\"0\":\"memberActivityEdit\",\"subordinate\":\"10\",\"hashrate\":\"1\",\"minerType\":\"1\",\"number\":\"1\",\"rewardMembers\":\"13048814716\",\"s\":\"\\/\\/admin\\/memberActivityEdit\"}', '2020-06-19 18:09:58', '2020-06-19 18:09:58'),
(133, '更新', '13048814716', '112.97.54.231', '{\"0\":\"memberActivityEdit\",\"subordinate\":\"10\",\"hashrate\":\"1\",\"minerType\":\"1\",\"number\":\"1\",\"rewardMembers\":null,\"s\":\"\\/\\/admin\\/memberActivityEdit\"}', '2020-06-19 18:10:08', '2020-06-19 18:10:08'),
(134, '登录', '13048814716', '112.97.61.124', '登录：13048814716', '2020-06-22 11:23:38', '2020-06-22 11:23:38'),
(135, '新增', '13048814716', '112.97.61.124', '{\"0\":\"tradeBuyAdd\",\"number\":\"5\",\"price\":\"0.46\",\"orderNumber\":\"30\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-22 11:26:43', '2020-06-22 11:26:43'),
(136, '新增', '13048814716', '112.97.61.124', '{\"0\":\"tradeBuyAdd\",\"number\":\"10\",\"price\":\"0.46\",\"orderNumber\":\"30\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-22 11:26:59', '2020-06-22 11:26:59'),
(137, '新增', '13048814716', '112.97.61.124', '{\"0\":\"tradeBuyAdd\",\"number\":\"50\",\"price\":\"0.46\",\"orderNumber\":\"30\",\"s\":\"\\/\\/admin\\/tradeBuyAdd\"}', '2020-06-22 11:27:13', '2020-06-22 11:27:13'),
(138, '登录', '13048814716', '113.116.195.139', '登录：13048814716', '2020-06-24 03:40:16', '2020-06-24 03:40:16'),
(139, '登录', '13048814716', '113.116.195.139', '登录：13048814716', '2020-06-24 07:41:21', '2020-06-24 07:41:21'),
(140, '更新', '13048814716', '113.116.195.139', '{\"0\":\"systemNoticeEdit\",\"id\":\"4\",\"tittle\":\"交易规则\",\"content\":\"<ul class=\\\" list-paddingleft-2\\\" style=\\\"list-style-type: disc;\\\"><li><p>开盘价$0.1，每天上涨$0.01<\\/p><\\/li><li><p>实名认证送2台微型矿机<\\/p><\\/li><li><p>没有矿机运行，无法卖出<\\/p><\\/li><li><p>超过2小时不付款，信用减2，交易自动取消<\\/p><\\/li><li><p>上传假图或者少付款，被投诉直接封号，信用减6<br\\/><\\/p><\\/li><li><p>信用低于96，无法卖出，买一次币信用加1<\\/p><\\/li><\\/ul><p><br\\/><\\/p><p>升级规则：<\\/p><table><tbody><tr class=\\\"firstRow\\\"><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"87\\\" style=\\\"word-break: break-all;\\\">等级<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"155\\\" style=\\\"word-break: break-all;\\\">要求<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"106\\\" style=\\\"word-break: break-all;\\\">每天卖出次数<\\/td><\\/tr><tr><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"87\\\" style=\\\"word-break: break-all;\\\">一级会员<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"155\\\" style=\\\"word-break: break-all;\\\">有微型云矿机在运行<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"106\\\" style=\\\"word-break: break-all;\\\">1<\\/td><\\/tr><tr><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"87\\\" style=\\\"word-break: break-all;\\\">二级会员<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"155\\\" style=\\\"word-break: break-all;\\\">有小型云矿机在运行<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"106\\\" style=\\\"word-break: break-all;\\\">1<\\/td><\\/tr><tr><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"87\\\" style=\\\"word-break: break-all;\\\">三级会员<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"155\\\" style=\\\"word-break: break-all;\\\">有中型云矿机在运行<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"106\\\" style=\\\"word-break: break-all;\\\">2<\\/td><\\/tr><tr><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"87\\\" style=\\\"word-break: break-all;\\\">四级会员<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"155\\\" style=\\\"word-break: break-all;\\\">有大型云矿机在运行<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"106\\\" style=\\\"word-break: break-all;\\\">3<\\/td><\\/tr><tr><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"87\\\" style=\\\"word-break: break-all;\\\">五级会员<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"155\\\" style=\\\"word-break: break-all;\\\">有超级云矿机在运行<\\/td><td valign=\\\"top\\\" colspan=\\\"1\\\" rowspan=\\\"1\\\" width=\\\"106\\\" style=\\\"word-break: break-all;\\\">不限制<\\/td><\\/tr><\\/tbody><\\/table><p><br\\/><\\/p>\",\"s\":\"\\/\\/admin\\/systemNoticeEdit\"}', '2020-06-24 07:51:26', '2020-06-24 07:51:26'),
(141, '登录', '13048814716', '113.116.195.139', '退出登录：13048814716', '2020-06-24 07:52:13', '2020-06-24 07:52:13');

-- --------------------------------------------------------

--
-- 表的结构 `system_notices`
--

CREATE TABLE `system_notices` (
  `id` int NOT NULL,
  `tittle` varchar(50) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `system_notices`
--

INSERT INTO `system_notices` (`id`, `tittle`, `content`, `created_at`, `updated_at`) VALUES
(4, '交易规则', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>开盘价$0.1，每天上涨$0.01</p></li><li><p>实名认证送2台微型矿机</p></li><li><p>没有矿机运行，无法卖出</p></li><li><p>超过2小时不付款，信用减2，交易自动取消</p></li><li><p>上传假图或者少付款，被投诉直接封号，信用减6<br/></p></li><li><p>信用低于96，无法卖出，买一次币信用加1</p></li></ul><p><br/></p><p>升级规则：</p><table><tbody><tr class=\"firstRow\"><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"87\" style=\"word-break: break-all;\">等级</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"155\" style=\"word-break: break-all;\">要求</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"106\" style=\"word-break: break-all;\">每天卖出次数</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"87\" style=\"word-break: break-all;\">一级会员</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"155\" style=\"word-break: break-all;\">有微型云矿机在运行</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"106\" style=\"word-break: break-all;\">1</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"87\" style=\"word-break: break-all;\">二级会员</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"155\" style=\"word-break: break-all;\">有小型云矿机在运行</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"106\" style=\"word-break: break-all;\">1</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"87\" style=\"word-break: break-all;\">三级会员</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"155\" style=\"word-break: break-all;\">有中型云矿机在运行</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"106\" style=\"word-break: break-all;\">2</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"87\" style=\"word-break: break-all;\">四级会员</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"155\" style=\"word-break: break-all;\">有大型云矿机在运行</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"106\" style=\"word-break: break-all;\">3</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"87\" style=\"word-break: break-all;\">五级会员</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"155\" style=\"word-break: break-all;\">有超级云矿机在运行</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"106\" style=\"word-break: break-all;\">不限制</td></tr></tbody></table><p><br/></p>', '2020-01-02 09:39:53', '2020-06-24 07:51:26'),
(18, '推广奖励规则', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>直推奖励：</p><table><tbody><tr class=\"firstRow\"><td width=\"91\" valign=\"top\" style=\"word-break: break-all;\">直推人数</td><td width=\"124\" valign=\"top\" style=\"word-break: break-all;\">团队算力</td><td width=\"153\" valign=\"top\" style=\"word-break: break-all;\">奖励</td></tr><tr><td width=\"91\" valign=\"top\" style=\"word-break: break-all;\">10</td><td width=\"124\" valign=\"top\" style=\"word-break: break-all;\">1G</td><td width=\"153\" valign=\"top\" style=\"word-break: break-all;\">微型云矿机</td></tr><tr><td width=\"91\" valign=\"top\" style=\"word-break: break-all;\">30</td><td width=\"124\" valign=\"top\" style=\"word-break: break-all;\">30G</td><td width=\"153\" valign=\"top\" style=\"word-break: break-all;\">小型云矿机</td></tr><tr><td width=\"91\" valign=\"top\" style=\"word-break: break-all;\">60</td><td width=\"124\" valign=\"top\" style=\"word-break: break-all;\">600G</td><td width=\"153\" valign=\"top\" style=\"word-break: break-all;\">中型云矿机</td></tr><tr><td width=\"91\" valign=\"top\" style=\"word-break: break-all;\">100</td><td width=\"124\" valign=\"top\" style=\"word-break: break-all;\">10000G</td><td width=\"153\" valign=\"top\" style=\"word-break: break-all;\">大型云矿机</td></tr></tbody></table><p><br/></p></li><li><p>疯狂奖励：</p><p>获得直推买币的1%，可直接卖出</p><p><br/></p></li><li><p>等级烧伤：</p><p>低于直推的等级，无法获得以上所有奖励</p></li></ul>', '2020-06-03 08:03:48', '2020-06-09 07:08:43');

-- --------------------------------------------------------

--
-- 表的结构 `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int NOT NULL,
  `tittle` varchar(50) NOT NULL COMMENT 'key',
  `value` varchar(50) NOT NULL,
  `describes` varchar(100) DEFAULT NULL COMMENT '描述',
  `input_type` varchar(20) NOT NULL DEFAULT 'text' COMMENT '元素类型',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `system_settings`
--

INSERT INTO `system_settings` (`id`, `tittle`, `value`, `describes`, `input_type`, `created_at`, `updated_at`) VALUES
(4, 'trade_handling_charge', '0.3', '交易手续费(100%)', 'text', '2019-11-24 14:34:49', '2020-06-24 07:51:35'),
(5, 'realname_reward_miner_number', '2', '实名认证赠送的矿机数量（台）', 'text', '2019-11-24 14:34:49', '2020-06-24 07:51:35'),
(23, 'share_reward', 'on', '开启分享好友奖励（矿机）', 'switch', '2020-05-14 14:46:54', '2020-06-24 07:51:35'),
(14, 'level_constraint', 'on', '等级烧伤制度', 'switch', '2019-12-03 06:46:23', '2020-06-24 07:51:35'),
(24, 'subordinate_buy_reward_rate', '0.01', '直推买币奖励比例(100%)', 'text', '2019-12-03 06:46:23', '2020-06-24 07:51:35'),
(16, 'coin_price_step', '0.01', '币价每天上涨幅度($)', 'text', '2019-12-03 06:46:23', '2020-06-24 07:51:36'),
(22, 'qiandao_give_coin', '0.01', '签到赠送币(HTC)', 'text', '2020-05-14 07:24:28', '2020-06-24 07:51:36'),
(18, 'trade_start', '08', '交易开始时间（H）', 'text', '2019-12-03 06:46:23', '2020-06-24 07:51:36'),
(19, 'trade_end', '20', '交易结束时间（H）', 'text', '2019-12-03 06:46:23', '2020-06-24 07:51:36'),
(20, 'trade_open', 'on', '开启交易系统', 'switch', '2019-12-03 06:46:23', '2020-06-24 07:51:36'),
(21, 'subordinate_buy_reward', 'on', '开启直推买币奖励(HTC)', 'switch', '2019-12-03 06:46:23', '2020-06-24 07:51:36'),
(6, 'low_credit_forbidden_sales', '96', '低于信用-禁止卖出（<）', 'text', '2019-11-24 14:34:49', '2020-06-24 07:51:36');

-- --------------------------------------------------------

--
-- 表的结构 `trade_numbers`
--

CREATE TABLE `trade_numbers` (
  `id` int NOT NULL,
  `number` smallint NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `trade_numbers`
--

INSERT INTO `trade_numbers` (`id`, `number`, `created_at`, `updated_at`) VALUES
(1, 5, '2019-12-04 08:43:41', NULL),
(2, 10, '2019-12-04 08:43:41', NULL),
(3, 50, '2019-12-04 08:43:44', NULL),
(4, 100, '2019-12-04 08:43:44', NULL),
(5, 200, '2019-12-04 08:43:44', NULL);

--
-- 转储表的索引
--

--
-- 表的索引 `activities`
--
ALTER TABLE `activities`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `assets`
--
ALTER TABLE `assets`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `coins`
--
ALTER TABLE `coins`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `ideals`
--
ALTER TABLE `ideals`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `queue` (`queue`(250));

--
-- 表的索引 `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phone` (`phone`);

--
-- 表的索引 `member_levels`
--
ALTER TABLE `member_levels`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `miners`
--
ALTER TABLE `miners`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `my_miners`
--
ALTER TABLE `my_miners`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `phone_tmps`
--
ALTER TABLE `phone_tmps`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `real_name_auths`
--
ALTER TABLE `real_name_auths`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `system_logs`
--
ALTER TABLE `system_logs`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `system_notices`
--
ALTER TABLE `system_notices`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `trade_numbers`
--
ALTER TABLE `trade_numbers`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `activities`
--
ALTER TABLE `activities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- 使用表AUTO_INCREMENT `coins`
--
ALTER TABLE `coins`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- 使用表AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- 使用表AUTO_INCREMENT `ideals`
--
ALTER TABLE `ideals`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `images`
--
ALTER TABLE `images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=327;

--
-- 使用表AUTO_INCREMENT `members`
--
ALTER TABLE `members`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- 使用表AUTO_INCREMENT `member_levels`
--
ALTER TABLE `member_levels`
  MODIFY `id` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `miners`
--
ALTER TABLE `miners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `my_miners`
--
ALTER TABLE `my_miners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- 使用表AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- 使用表AUTO_INCREMENT `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- 使用表AUTO_INCREMENT `phone_tmps`
--
ALTER TABLE `phone_tmps`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `real_name_auths`
--
ALTER TABLE `real_name_auths`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 使用表AUTO_INCREMENT `system_logs`
--
ALTER TABLE `system_logs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- 使用表AUTO_INCREMENT `system_notices`
--
ALTER TABLE `system_notices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用表AUTO_INCREMENT `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 使用表AUTO_INCREMENT `trade_numbers`
--
ALTER TABLE `trade_numbers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
