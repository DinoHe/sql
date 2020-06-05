-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- 主机： 127.0.0.1
-- 生成日期： 2020-06-05 03:23:37
-- 服务器版本： 5.6.47
-- PHP 版本： 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
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
  `id` int(11) NOT NULL,
  `subordinate` smallint(6) NOT NULL DEFAULT '0' COMMENT '直推人数',
  `hashrate` mediumint(9) NOT NULL COMMENT '要求算力（0.1G）',
  `reward_miner_type` int(11) NOT NULL DEFAULT '1' COMMENT '奖励上级矿机类型',
  `reward_miner_number` tinyint(4) NOT NULL DEFAULT '0' COMMENT '奖励上级矿机数量',
  `reward_member` mediumtext COMMENT '获得奖励的会员ID',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `activities`
--

INSERT INTO `activities` (`id`, `subordinate`, `hashrate`, `reward_miner_type`, `reward_miner_number`, `reward_member`, `created_at`, `updated_at`) VALUES
(1, 10, 10, 1, 1, '[]', NULL, '2020-06-04 05:51:15'),
(2, 30, 300, 2, 1, NULL, NULL, '2020-06-03 10:48:56'),
(3, 60, 6000, 3, 1, NULL, NULL, '2020-06-03 10:49:35'),
(4, 100, 100000, 4, 1, NULL, NULL, '2020-06-03 10:49:58');

-- --------------------------------------------------------

--
-- 表的结构 `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `account` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `weixin` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role_id` int(11) NOT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:启用，1:停用；',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `admins`
--

INSERT INTO `admins` (`id`, `account`, `name`, `phone`, `weixin`, `password`, `role_id`, `blocked`, `created_at`, `updated_at`) VALUES
(1, '13048814716', 'admin', '13048814716', '', '$2y$10$4MSkBixWTxDEs2.pNhMmbek22/mulSlbkJQwpduA6TZuN/nhfpOEu', 1, 0, '2019-12-24 09:18:16', '2019-12-24 10:20:04'),
(4, 'admin001', 'admin001', '12345678901', 'admin001', '$2y$10$2qJatMaRpD3U7SB7g/NH5.yfX3LDGJMHQeiGpgE08ZBiknLWP.J76', 19, 0, '2019-12-26 12:31:20', '2020-06-04 02:21:46');

-- --------------------------------------------------------

--
-- 表的结构 `assets`
--

CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `balance` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '余额（0.01）',
  `blocked_assets` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '冻结资产（0.01）',
  `buy_total` int(11) NOT NULL DEFAULT '0' COMMENT '累积购币数量（0.01）',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `assets`
--

INSERT INTO `assets` (`id`, `member_id`, `balance`, `blocked_assets`, `buy_total`, `created_at`, `updated_at`) VALUES
(1, 1, 13316, 0, 0, '2019-12-19 10:03:12', '2020-06-04 05:53:08');

-- --------------------------------------------------------

--
-- 表的结构 `bills`
--

CREATE TABLE `bills` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `tittle` varchar(50) NOT NULL,
  `operation` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `coins`
--

CREATE TABLE `coins` (
  `id` int(11) NOT NULL,
  `price` mediumint(8) UNSIGNED NOT NULL COMMENT '币价（0.01美元）',
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
(22, 32, '2020-06-05', '2020-06-05');

-- --------------------------------------------------------

--
-- 表的结构 `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `ideals`
--

CREATE TABLE `ideals` (
  `id` int(11) NOT NULL,
  `account` char(11) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `images`
--

CREATE TABLE `images` (
  `id` int(10) NOT NULL,
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `src` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- 转存表中的数据 `images`
--

INSERT INTO `images` (`id`, `type`, `src`, `updated_at`, `created_at`) VALUES
(1, 'home-index-header', 'main-slider-1.jpg', '2020-05-28 09:40:04', '2020-05-28 09:40:04'),
(2, 'home-index-header', 'main-slider-2.jpg', '2020-05-28 09:40:04', '2020-05-28 09:40:04'),
(3, 'miner', '微型云矿机.jpg', '2020-05-28 09:40:04', '2020-05-28 09:40:04'),
(4, 'miner', '小型云矿机.jpg', '2020-05-28 09:40:04', '2020-05-28 09:40:04'),
(5, 'miner', '中型云矿机.jpg', '2020-05-28 09:40:04', '2020-05-28 09:40:04'),
(6, 'miner', '大型云矿机.jpg', '2020-05-28 09:40:04', '2020-05-28 09:40:04'),
(7, 'miner', '超级云矿机.jpg', '2020-05-28 09:40:04', '2020-05-28 09:40:04');

-- --------------------------------------------------------

--
-- 表的结构 `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `members`
--

CREATE TABLE `members` (
  `id` int(11) UNSIGNED NOT NULL,
  `phone` char(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `safe_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invite` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邀请码',
  `level_id` tinyint(1) NOT NULL DEFAULT '1',
  `parentid` int(11) NOT NULL DEFAULT '0',
  `activated` tinyint(1) NOT NULL DEFAULT '1',
  `credit` tinyint(3) NOT NULL DEFAULT '100',
  `describes` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `members`
--

INSERT INTO `members` (`id`, `phone`, `password`, `safe_password`, `invite`, `level_id`, `parentid`, `activated`, `credit`, `describes`, `created_at`, `updated_at`) VALUES
(1, '15570708089', '$2y$10$vCmev0oTwuAAyb2wJYGsFO0wsiosK/L5m9F3TL79U1P32lbko7hay', '$2y$10$GrZV.cal012QoY0fM.8smOfb9A29Ywrby4MJ2Z9T1dgJYvM2p1fSS', 'EHerc8Sh7', 3, 0, 0, 100, NULL, '2019-12-19 09:54:46', '2020-06-05 02:03:47');

-- --------------------------------------------------------

--
-- 表的结构 `member_levels`
--

CREATE TABLE `member_levels` (
  `id` tinyint(1) NOT NULL,
  `level_name` char(4) NOT NULL,
  `sales_times` smallint(6) NOT NULL COMMENT '当天卖出次数',
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
  `id` int(11) NOT NULL,
  `tittle` varchar(6) NOT NULL,
  `coin_number` float(8,2) NOT NULL COMMENT '矿机价格',
  `runtime` mediumint(8) NOT NULL COMMENT '运行周期',
  `nph` float(11,8) NOT NULL COMMENT '每小时产量',
  `total_dig` float(8,2) NOT NULL COMMENT '总产量',
  `hashrate` float(8,2) NOT NULL COMMENT '算力',
  `miner_img` varchar(50) DEFAULT NULL,
  `rent_max` smallint(6) NOT NULL DEFAULT '0' COMMENT '最大租用数量',
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
  `id` int(11) NOT NULL,
  `miner_id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `miner_tittle` varchar(6) NOT NULL,
  `total_dig` float(8,2) NOT NULL COMMENT '总产量',
  `dug` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '已产出数量',
  `nph` float(11,8) NOT NULL COMMENT '每小时产出数量',
  `runtime` mediumint(8) NOT NULL COMMENT '运行周期',
  `hashrate` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '算力',
  `run_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0.运行中;1.已结束',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `my_miners`
--

INSERT INTO `my_miners` (`id`, `miner_id`, `member_id`, `miner_tittle`, `total_dig`, `dug`, `nph`, `runtime`, `hashrate`, `run_status`, `created_at`, `updated_at`) VALUES
(107, 3, 5, '中型云矿机', 240.00, 0.14, 0.14285713, 1680, 999996.00, 2, '2020-05-14 15:13:06', '2020-05-30 12:26:57'),
(104, 1, 4, '微型云矿机', 6.00, 0.15, 0.00833333, 720, 999969.00, 1, '2020-05-14 07:26:05', '2020-05-26 05:47:49'),
(134, 2, 4, '小型云矿机', 24.00, 0.00, 0.02000000, 1200, 0.10, 0, '2020-06-02 08:56:36', '2020-06-02 08:56:36'),
(106, 2, 4, '小型云矿机', 24.00, 9.10, 0.02000000, 1200, 999979.00, 0, '2020-05-14 07:30:31', '2020-06-02 08:40:21'),
(108, 1, 4, '微型云矿机', 6.00, 0.09, 0.00833333, 720, 999969.00, 1, '2020-05-14 15:37:33', '2020-05-26 05:48:15'),
(109, 1, 4, '微型云矿机', 6.00, 3.72, 0.00833333, 720, 999969.00, 0, '2020-05-14 15:44:09', '2020-06-02 08:40:21'),
(110, 1, 4, '微型云矿机', 6.00, 3.72, 0.00833333, 720, 999969.00, 0, '2020-05-14 15:48:48', '2020-06-02 08:40:21'),
(111, 1, 4, '微型云矿机', 6.00, 3.72, 0.00833333, 720, 999969.00, 0, '2020-05-14 15:58:46', '2020-06-02 08:40:21'),
(112, 1, 4, '微型云矿机', 6.00, 3.71, 0.00833333, 720, 999969.00, 0, '2020-05-14 16:32:14', '2020-06-02 08:40:21'),
(113, 1, 4, '微型云矿机', 6.00, 3.71, 0.00833333, 720, 999969.00, 0, '2020-05-14 16:45:04', '2020-06-02 08:40:21'),
(114, 1, 4, '微型云矿机', 6.00, 3.71, 0.00833333, 720, 999969.00, 0, '2020-05-14 16:45:04', '2020-06-02 08:40:21'),
(115, 1, 4, '微型云矿机', 6.00, 3.71, 0.00833333, 720, 999969.00, 0, '2020-05-14 16:45:04', '2020-06-02 08:40:21'),
(116, 1, 4, '微型云矿机', 6.00, 3.71, 0.00833333, 720, 999969.00, 0, '2020-05-14 16:45:04', '2020-06-02 08:40:21'),
(117, 1, 4, '微型云矿机', 6.00, 3.71, 0.00833333, 720, 999969.00, 0, '2020-05-14 16:45:04', '2020-06-02 08:40:21'),
(136, 3, 5, '中型云矿机', 240.00, 0.00, 0.14285713, 1680, 1.00, 0, '2020-06-02 09:21:48', '2020-06-02 09:21:48'),
(135, 2, 5, '小型云矿机', 24.00, 0.00, 0.02000000, 1200, 0.10, 0, '2020-06-02 09:04:20', '2020-06-02 09:04:20'),
(133, 1, 4, '微型云矿机', 6.00, 1.40, 0.00833333, 720, 999969.00, 0, '2020-05-26 06:23:37', '2020-06-02 08:40:21'),
(132, 1, 4, '微型云矿机', 6.00, 1.40, 0.00833333, 720, 999969.00, 0, '2020-05-26 06:23:37', '2020-06-02 08:40:21'),
(125, 1, 5, '微型云矿机', 6.00, 0.00, 0.00833333, 720, 999969.00, 2, '2020-05-14 16:57:46', '2020-05-30 12:26:57'),
(126, 1, 5, '微型云矿机', 6.00, 0.00, 0.00833333, 720, 999969.00, 2, '2020-05-14 16:57:47', '2020-05-30 12:26:57'),
(127, 1, 5, '微型云矿机', 6.00, 0.00, 0.00833333, 720, 999969.00, 2, '2020-05-14 16:57:47', '2020-05-30 12:26:57'),
(128, 1, 5, '微型云矿机', 6.00, 0.00, 0.00833333, 720, 999969.00, 2, '2020-05-14 16:57:47', '2020-05-30 12:26:58'),
(129, 1, 5, '微型云矿机', 6.00, 0.00, 0.00833333, 720, 999969.00, 2, '2020-05-14 16:57:47', '2020-05-30 12:26:58'),
(130, 1, 5, '微型云矿机', 6.00, 0.00, 0.00833333, 720, 999969.00, 2, '2020-05-14 16:57:48', '2020-05-30 12:26:58'),
(131, 2, 5, '小型云矿机', 24.00, 0.00, 0.02000000, 1200, 999979.00, 2, '2020-05-14 16:57:48', '2020-05-30 12:26:58');

-- --------------------------------------------------------

--
-- 表的结构 `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `buy_member_id` int(11) NOT NULL COMMENT '购买方',
  `sales_member_id` int(11) DEFAULT NULL COMMENT '出售方',
  `buy_member_phone` char(11) NOT NULL,
  `sales_member_phone` char(11) NOT NULL,
  `trade_number` mediumint(9) NOT NULL COMMENT '交易数量',
  `trade_price` int(11) NOT NULL COMMENT '单价(0.01$)',
  `trade_total_money` int(11) NOT NULL COMMENT '交易总额(0.01$)',
  `payment_img` varchar(100) DEFAULT NULL,
  `trade_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '2.交易完成;0.待支付;1.待确认',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `tittle` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `pid` smallint(6) NOT NULL,
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
  `id` int(11) NOT NULL,
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
(1, '15570708089', '401544', 1, '2019-12-19 09:50:05', '2019-12-19 09:54:46');

-- --------------------------------------------------------

--
-- 表的结构 `real_name_auths`
--

CREATE TABLE `real_name_auths` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
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
(1, 1, 'heshi', '431124199311270779', '15570708089', '深圳市', '123456', '15570708089', '/idcardImg/1591092171431124199311270779front.jpg', '/idcardImg/1590302838431124199311270779back.jpg', 1, NULL, '2019-12-19 10:26:10', '2020-06-02 10:02:51');

-- --------------------------------------------------------

--
-- 表的结构 `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
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
  `id` int(11) NOT NULL,
  `event` varchar(20) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `content` varchar(10000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `system_notices`
--

CREATE TABLE `system_notices` (
  `id` int(11) NOT NULL,
  `tittle` varchar(50) NOT NULL,
  `content` varchar(10000) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `system_notices`
--

INSERT INTO `system_notices` (`id`, `tittle`, `content`, `created_at`, `updated_at`) VALUES
(4, '交易规则', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>开盘价$0.1，每天上涨$0.01</p></li><li><p>实名认证送2台微型矿机</p></li><li><p>没有矿机运行，无法卖出<br/></p></li></ul><p><br/></p><p>升级规则：</p><table><tbody><tr class=\"firstRow\"><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"87\" style=\"word-break: break-all;\">等级</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"155\" style=\"word-break: break-all;\">要求</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"106\" style=\"word-break: break-all;\">每天卖出次数</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"87\" style=\"word-break: break-all;\">一级会员</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"155\" style=\"word-break: break-all;\">有微型云矿机在运行</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"106\" style=\"word-break: break-all;\">1</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"87\" style=\"word-break: break-all;\">二级会员</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"155\" style=\"word-break: break-all;\">有小型云矿机在运行</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"106\" style=\"word-break: break-all;\">1</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"87\" style=\"word-break: break-all;\">三级会员</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"155\" style=\"word-break: break-all;\">有中型云矿机在运行</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"106\" style=\"word-break: break-all;\">2</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"87\" style=\"word-break: break-all;\">四级会员</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"155\" style=\"word-break: break-all;\">有大型云矿机在运行</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"106\" style=\"word-break: break-all;\">3</td></tr><tr><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"87\" style=\"word-break: break-all;\">五级会员</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"155\" style=\"word-break: break-all;\">有超级云矿机在运行</td><td valign=\"top\" colspan=\"1\" rowspan=\"1\" width=\"106\" style=\"word-break: break-all;\">不限制</td></tr></tbody></table><p><br/></p>', '2020-01-02 09:39:53', '2020-06-03 08:53:28'),
(18, '推广奖励规则', '<ul class=\" list-paddingleft-2\" style=\"list-style-type: disc;\"><li><p>直推奖励：</p><table><tbody><tr class=\"firstRow\"><td width=\"91\" valign=\"top\" style=\"word-break: break-all;\">直推人数</td><td width=\"124\" valign=\"top\" style=\"word-break: break-all;\">团队算力</td><td width=\"153\" valign=\"top\" style=\"word-break: break-all;\">奖励</td></tr><tr><td width=\"91\" valign=\"top\" style=\"word-break: break-all;\">10</td><td width=\"124\" valign=\"top\" style=\"word-break: break-all;\">1G</td><td width=\"153\" valign=\"top\" style=\"word-break: break-all;\">微型云矿机</td></tr><tr><td width=\"91\" valign=\"top\" style=\"word-break: break-all;\">30</td><td width=\"124\" valign=\"top\" style=\"word-break: break-all;\">30G</td><td width=\"153\" valign=\"top\" style=\"word-break: break-all;\">小型云矿机</td></tr><tr><td width=\"91\" valign=\"top\" style=\"word-break: break-all;\">60</td><td width=\"124\" valign=\"top\" style=\"word-break: break-all;\">600G</td><td width=\"153\" valign=\"top\" style=\"word-break: break-all;\">中型云矿机</td></tr><tr><td width=\"91\" valign=\"top\" style=\"word-break: break-all;\">100</td><td width=\"124\" valign=\"top\" style=\"word-break: break-all;\">10000G</td><td width=\"153\" valign=\"top\" style=\"word-break: break-all;\">大型云矿机</td></tr></tbody></table><p><br/></p></li><li><p>疯狂奖励：</p><p>获得直推买币的1%奖励，可直接卖出</p><p><br/></p></li><li><p>等级烧伤：</p><p>低于下级的等级，无法获得以上所有奖励</p></li></ul>', '2020-06-03 08:03:48', '2020-06-03 09:08:19');

-- --------------------------------------------------------

--
-- 表的结构 `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL,
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
(4, 'trade_handling_charge', '0.3', '交易手续费(100%)', 'text', '2019-11-24 14:34:49', '2020-05-22 11:28:38'),
(5, 'realname_reward_miner_number', '2', '实名认证赠送的矿机数量（台）', 'text', '2019-11-24 14:34:49', '2020-05-22 11:28:38'),
(23, 'share_reward', 'on', '开启分享好友奖励（矿机）', 'switch', '2020-05-14 14:46:54', '2020-05-22 11:28:38'),
(14, 'level_constraint', 'on', '等级烧伤制度', 'switch', '2019-12-03 06:46:23', '2020-05-22 11:28:38'),
(24, 'subordinate_buy_reward_rate', '0.01', '直推买币奖励比例(100%)', 'text', '2019-12-03 06:46:23', '2020-05-22 11:28:38'),
(16, 'coin_price_step', '0.01', '币价每天上涨幅度($)', 'text', '2019-12-03 06:46:23', '2020-05-22 11:28:38'),
(22, 'qiandao_give_coin', '0.01', '签到赠送币(HTC)', 'text', '2020-05-14 07:24:28', '2020-05-22 11:28:38'),
(18, 'trade_start', '08', '交易开始时间（H）', 'text', '2019-12-03 06:46:23', '2020-05-22 11:28:38'),
(19, 'trade_end', '20', '交易结束时间（H）', 'text', '2019-12-03 06:46:23', '2020-05-22 11:28:38'),
(20, 'trade_open', 'on', '开启交易系统', 'switch', '2019-12-03 06:46:23', '2020-05-22 11:28:38'),
(21, 'subordinate_buy_reward', 'on', '开启直推买币奖励(HTC)', 'switch', '2019-12-03 06:46:23', '2020-05-22 11:28:38');

-- --------------------------------------------------------

--
-- 表的结构 `trade_numbers`
--

CREATE TABLE `trade_numbers` (
  `id` int(11) NOT NULL,
  `number` smallint(4) NOT NULL,
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- 使用表AUTO_INCREMENT `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- 使用表AUTO_INCREMENT `assets`
--
ALTER TABLE `assets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `coins`
--
ALTER TABLE `coins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- 使用表AUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- 使用表AUTO_INCREMENT `ideals`
--
ALTER TABLE `ideals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `images`
--
ALTER TABLE `images`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=299;

--
-- 使用表AUTO_INCREMENT `members`
--
ALTER TABLE `members`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `member_levels`
--
ALTER TABLE `member_levels`
  MODIFY `id` tinyint(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `miners`
--
ALTER TABLE `miners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- 使用表AUTO_INCREMENT `my_miners`
--
ALTER TABLE `my_miners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- 使用表AUTO_INCREMENT `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=61;

--
-- 使用表AUTO_INCREMENT `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- 使用表AUTO_INCREMENT `phone_tmps`
--
ALTER TABLE `phone_tmps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `real_name_auths`
--
ALTER TABLE `real_name_auths`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- 使用表AUTO_INCREMENT `system_logs`
--
ALTER TABLE `system_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `system_notices`
--
ALTER TABLE `system_notices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- 使用表AUTO_INCREMENT `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- 使用表AUTO_INCREMENT `trade_numbers`
--
ALTER TABLE `trade_numbers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
