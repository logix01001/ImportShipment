-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 17, 2021 at 03:25 PM
-- Server version: 8.0.14
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `import_shipment`
--

-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

CREATE TABLE `audits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` bigint(20) UNSIGNED NOT NULL,
  `old_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `new_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `url` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audits`
--

INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'created', 'App\\Models\\ImportDocument', 9, '[]', '{\"document_code\":\"IDOC2021_8\",\"bl_number\":\"TEST123456\",\"shipping_company_code_fk\":\"20\",\"factory_code\":\"002\",\"document_received_date\":\"2020-01-25\",\"document_received_time\":\"9:00 AM\",\"id\":9}', 'http://10.169.141.111:8000/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0', NULL, '2021-01-31 20:09:21', '2021-01-31 20:09:21'),
(2, 'App\\Models\\User', 1, 'created', 'App\\Models\\LodgementDetail', 9, '[]', '{\"document_code_fk\":\"IDOC2021_8\",\"id\":9}', 'http://10.169.141.111:8000/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0', NULL, '2021-01-31 20:09:21', '2021-01-31 20:09:21'),
(3, 'App\\Models\\User', 1, 'created', 'App\\Models\\ImportDocument', 66, '[]', '{\"document_code\":\"IDOC2021_62\",\"bl_number\":\"TESTJE\",\"shipping_company_code_fk\":\"27\",\"factory_code\":\"001\",\"document_received_date\":\"2021-02-01\",\"document_received_time\":\"08:00 AM\",\"id\":66}', 'http://10.169.141.111:8000/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0', NULL, '2021-02-03 18:38:47', '2021-02-03 18:38:47'),
(4, 'App\\Models\\User', 1, 'created', 'App\\Models\\LodgementDetail', 66, '[]', '{\"document_code_fk\":\"IDOC2021_62\",\"id\":66}', 'http://10.169.141.111:8000/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0', NULL, '2021-02-03 18:38:49', '2021-02-03 18:38:49'),
(5, 'App\\Models\\User', 1, 'created', 'App\\Models\\ImportDocument', 67, '[]', '{\"document_code\":\"IDOC2021_63\",\"bl_number\":\"HICOTEST123456\",\"shipping_company_code_fk\":\"20\",\"factory_code\":\"001\",\"document_received_date\":\"2021-02-01\",\"document_received_time\":\"10:00\",\"id\":67}', 'http://10.169.141.111:8000/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0', NULL, '2021-02-03 22:36:00', '2021-02-03 22:36:00'),
(6, 'App\\Models\\User', 1, 'created', 'App\\Models\\LodgementDetail', 67, '[]', '{\"document_code_fk\":\"IDOC2021_63\",\"id\":67}', 'http://10.169.141.111:8000/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0', NULL, '2021-02-03 22:36:01', '2021-02-03 22:36:01'),
(7, 'App\\Models\\User', 1, 'created', 'App\\Models\\ImportDocument', 68, '[]', '{\"document_code\":\"IDOC2021_64\",\"bl_number\":\"OOLU12345678\",\"shipping_company_code_fk\":\"4\",\"factory_code\":\"001\",\"document_received_date\":\"2021-02-05\",\"document_received_time\":\"NO DOCS\",\"id\":68}', 'http://10.169.141.111:8000/new_record', '10.169.164.100', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 23:09:50', '2021-02-03 23:09:50'),
(8, 'App\\Models\\User', 1, 'created', 'App\\Models\\LodgementDetail', 68, '[]', '{\"document_code_fk\":\"IDOC2021_64\",\"id\":68}', 'http://10.169.141.111:8000/new_record', '10.169.164.100', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-03 23:09:50', '2021-02-03 23:09:50'),
(9, 'App\\Models\\User', 1, 'created', 'App\\Models\\ImportDocument', 69, '[]', '{\"document_code\":\"IDOC2021_65\",\"bl_number\":\"abc12345678\",\"shipping_company_code_fk\":\"4\",\"factory_code\":\"003\",\"document_received_date\":\"2021-02-05\",\"document_received_time\":\"9:00\",\"id\":69}', 'http://10.169.141.111:8000/new_record', '10.169.141.124', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 15:49:59', '2021-02-04 15:49:59'),
(10, 'App\\Models\\User', 1, 'created', 'App\\Models\\LodgementDetail', 69, '[]', '{\"document_code_fk\":\"IDOC2021_65\",\"id\":69}', 'http://10.169.141.111:8000/new_record', '10.169.141.124', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.104 Safari/537.36', NULL, '2021-02-04 15:49:59', '2021-02-04 15:49:59'),
(11, 'App\\Models\\User', 1, 'created', 'App\\Models\\ImportDocument', 70, '[]', '{\"document_code\":\"IDOC2021_66\",\"bl_number\":\"TEST88878\",\"shipping_company_code_fk\":\"24\",\"factory_code\":\"000\",\"document_received_date\":\"2021-02-01\",\"document_received_time\":\"8:00 AM\",\"id\":70}', 'http://10.169.141.111:8000/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0', NULL, '2021-02-04 16:48:12', '2021-02-04 16:48:12'),
(12, 'App\\Models\\User', 1, 'created', 'App\\Models\\LodgementDetail', 70, '[]', '{\"document_code_fk\":\"IDOC2021_66\",\"id\":70}', 'http://10.169.141.111:8000/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0', NULL, '2021-02-04 16:48:12', '2021-02-04 16:48:12'),
(13, 'App\\Models\\User', 1, 'created', 'App\\Models\\ImportDocument', 71, '[]', '{\"document_code\":\"IDOC2021_67\",\"bl_number\":\"OOLUTEST\",\"shipping_company_code_fk\":\"24\",\"factory_code\":\"000\",\"document_received_date\":\"2021-02-09\",\"document_received_time\":\"10:00 AM\",\"id\":71}', 'http://10.169.141.111:8000/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0', NULL, '2021-02-04 17:13:16', '2021-02-04 17:13:16'),
(14, 'App\\Models\\User', 1, 'created', 'App\\Models\\LodgementDetail', 71, '[]', '{\"document_code_fk\":\"IDOC2021_67\",\"id\":71}', 'http://10.169.141.111:8000/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:86.0) Gecko/20100101 Firefox/86.0', NULL, '2021-02-04 17:13:16', '2021-02-04 17:13:16'),
(15, 'App\\Models\\User', 1, 'created', 'App\\Models\\ImportDocument', 72, '[]', '{\"document_code\":\"IDOC2021_68\",\"bl_number\":\"45678978\",\"shipping_company_code_fk\":\"10\",\"factory_code\":\"002\",\"document_received_date\":\"2021-02-28\",\"document_received_time\":\"NO DOCS\",\"id\":72}', 'http://10.169.141.111:8000/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', NULL, '2021-04-05 22:14:47', '2021-04-05 22:14:47'),
(16, 'App\\Models\\User', 1, 'created', 'App\\Models\\LodgementDetail', 72, '[]', '{\"document_code_fk\":\"IDOC2021_68\",\"id\":72}', 'http://10.169.141.111:8000/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', NULL, '2021-04-05 22:14:47', '2021-04-05 22:14:47'),
(17, 'App\\Models\\User', 1, 'created', 'App\\Models\\ImportDocument', 73, '[]', '{\"document_code\":\"IDOC2021_69\",\"bl_number\":\"BRYAN123\",\"shipping_company_code_fk\":\"27\",\"factory_code\":\"001\",\"document_received_date\":\"2021-04-08\",\"document_received_time\":\"10:55\",\"id\":73}', 'http://10.169.141.111:8000/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', NULL, '2021-04-07 22:49:28', '2021-04-07 22:49:28'),
(18, 'App\\Models\\User', 1, 'created', 'App\\Models\\LodgementDetail', 73, '[]', '{\"document_code_fk\":\"IDOC2021_69\",\"id\":73}', 'http://10.169.141.111:8000/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', NULL, '2021-04-07 22:49:28', '2021-04-07 22:49:28'),
(19, 'App\\Models\\User', 1, 'created', 'App\\Models\\ImportDocument', 74, '[]', '{\"document_code\":\"IDOC2021_70\",\"bl_number\":\"darwin123\",\"shipping_company_code_fk\":\"27\",\"factory_code\":\"001\",\"document_received_date\":\"2021-04-08\",\"document_received_time\":\"10:55\",\"id\":74}', 'http://10.169.141.111:8000/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', NULL, '2021-04-07 22:50:18', '2021-04-07 22:50:18'),
(20, 'App\\Models\\User', 1, 'created', 'App\\Models\\LodgementDetail', 74, '[]', '{\"document_code_fk\":\"IDOC2021_70\",\"id\":74}', 'http://10.169.141.111:8000/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', NULL, '2021-04-07 22:50:18', '2021-04-07 22:50:18'),
(21, 'App\\Models\\User', 1, 'created', 'App\\Models\\ImportDocument', 1, '[]', '{\"document_code\":\"IDOC2021_1\",\"bl_number\":\"ONEYSMZB00852310\",\"shipping_company_code_fk\":\"11\",\"factory_code\":\"002\",\"document_received_date\":\"2021-04-16\",\"document_received_time\":\"TEST ONLY\",\"id\":1}', 'http://hrdapps55/isd/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', NULL, '2021-04-16 01:28:06', '2021-04-16 01:28:06'),
(22, 'App\\Models\\User', 1, 'created', 'App\\Models\\LodgementDetail', 1, '[]', '{\"document_code_fk\":\"IDOC2021_1\",\"id\":1}', 'http://hrdapps55/isd/new_record', '10.169.141.111', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:88.0) Gecko/20100101 Firefox/88.0', NULL, '2021-04-16 01:28:07', '2021-04-16 01:28:07'),
(23, 'App\\Models\\User', 18, 'created', 'App\\Models\\ImportDocument', 1, '[]', '{\"document_code\":\"IDOC2021_1\",\"bl_number\":\"OOLU12345678\",\"shipping_company_code_fk\":\"10\",\"factory_code\":\"001\",\"document_received_date\":\"2021-04-17\",\"document_received_time\":\"09:00AM\",\"id\":1}', 'http://hrdapps55/isd/new_record', '10.169.164.22', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-16 23:36:37', '2021-04-16 23:36:37'),
(24, 'App\\Models\\User', 18, 'created', 'App\\Models\\LodgementDetail', 1, '[]', '{\"document_code_fk\":\"IDOC2021_1\",\"id\":1}', 'http://hrdapps55/isd/new_record', '10.169.164.22', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-16 23:36:38', '2021-04-16 23:36:38'),
(25, 'App\\Models\\User', 4, 'created', 'App\\Models\\ImportDocument', 2, '[]', '{\"document_code\":\"IDOC2021_2\",\"bl_number\":\"SITJGKKMNH0147\",\"shipping_company_code_fk\":\"14\",\"factory_code\":\"002\",\"document_received_date\":\"2021-04-17\",\"document_received_time\":\"07:53\",\"id\":2}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:10:21', '2021-04-17 00:10:21'),
(26, 'App\\Models\\User', 4, 'created', 'App\\Models\\LodgementDetail', 2, '[]', '{\"document_code_fk\":\"IDOC2021_2\",\"id\":2}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:10:21', '2021-04-17 00:10:21'),
(27, 'App\\Models\\User', 4, 'created', 'App\\Models\\ImportDocument', 3, '[]', '{\"document_code\":\"IDOC2021_3\",\"bl_number\":\"ONEYSMZB03023300\",\"shipping_company_code_fk\":\"26\",\"factory_code\":\"001\",\"document_received_date\":\"2021-04-16\",\"document_received_time\":\"15:45\",\"id\":3}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:15:55', '2021-04-17 00:15:55'),
(28, 'App\\Models\\User', 4, 'created', 'App\\Models\\LodgementDetail', 3, '[]', '{\"document_code_fk\":\"IDOC2021_3\",\"id\":3}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:15:55', '2021-04-17 00:15:55'),
(29, 'App\\Models\\User', 4, 'created', 'App\\Models\\ImportDocument', 4, '[]', '{\"document_code\":\"IDOC2021_4\",\"bl_number\":\"ONEYSMZB02717500\",\"shipping_company_code_fk\":\"26\",\"factory_code\":\"001\",\"document_received_date\":\"2021-04-16\",\"document_received_time\":\"15:44\",\"id\":4}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:16:18', '2021-04-17 00:16:18'),
(30, 'App\\Models\\User', 4, 'created', 'App\\Models\\LodgementDetail', 4, '[]', '{\"document_code_fk\":\"IDOC2021_4\",\"id\":4}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:16:18', '2021-04-17 00:16:18'),
(31, 'App\\Models\\User', 4, 'created', 'App\\Models\\ImportDocument', 5, '[]', '{\"document_code\":\"IDOC2021_5\",\"bl_number\":\"ACD211062\",\"shipping_company_code_fk\":\"21\",\"factory_code\":\"000\",\"document_received_date\":\"2021-04-16\",\"document_received_time\":\"16:00\",\"id\":5}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:17:03', '2021-04-17 00:17:03'),
(32, 'App\\Models\\User', 4, 'created', 'App\\Models\\LodgementDetail', 5, '[]', '{\"document_code_fk\":\"IDOC2021_5\",\"id\":5}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:17:03', '2021-04-17 00:17:03'),
(33, 'App\\Models\\User', 4, 'created', 'App\\Models\\ImportDocument', 6, '[]', '{\"document_code\":\"IDOC2021_6\",\"bl_number\":\"YMLUI433104721\",\"shipping_company_code_fk\":\"11\",\"factory_code\":\"001\",\"document_received_date\":\"2021-04-16\",\"document_received_time\":\"16:10\",\"id\":6}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:17:47', '2021-04-17 00:17:47'),
(34, 'App\\Models\\User', 4, 'created', 'App\\Models\\LodgementDetail', 6, '[]', '{\"document_code_fk\":\"IDOC2021_6\",\"id\":6}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:17:47', '2021-04-17 00:17:47'),
(35, 'App\\Models\\User', 4, 'created', 'App\\Models\\ImportDocument', 7, '[]', '{\"document_code\":\"IDOC2021_7\",\"bl_number\":\"YMLUI433104728\",\"shipping_company_code_fk\":\"11\",\"factory_code\":\"001\",\"document_received_date\":\"2021-04-16\",\"document_received_time\":\"04;15\",\"id\":7}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:18:19', '2021-04-17 00:18:19'),
(36, 'App\\Models\\User', 4, 'created', 'App\\Models\\LodgementDetail', 7, '[]', '{\"document_code_fk\":\"IDOC2021_7\",\"id\":7}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:18:19', '2021-04-17 00:18:19'),
(37, 'App\\Models\\User', 4, 'created', 'App\\Models\\ImportDocument', 8, '[]', '{\"document_code\":\"IDOC2021_8\",\"bl_number\":\"HHE-14601810\",\"shipping_company_code_fk\":\"11\",\"factory_code\":\"004\",\"document_received_date\":\"2021-04-16\",\"document_received_time\":\"15:59\",\"id\":8}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:19:11', '2021-04-17 00:19:11'),
(38, 'App\\Models\\User', 4, 'created', 'App\\Models\\LodgementDetail', 8, '[]', '{\"document_code_fk\":\"IDOC2021_8\",\"id\":8}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:19:11', '2021-04-17 00:19:11'),
(39, 'App\\Models\\User', 4, 'created', 'App\\Models\\ImportDocument', 9, '[]', '{\"document_code\":\"IDOC2021_9\",\"bl_number\":\"VIE0180247\",\"shipping_company_code_fk\":\"21\",\"factory_code\":\"001\",\"document_received_date\":\"2021-04-16\",\"document_received_time\":\"15:57\",\"id\":9}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:19:33', '2021-04-17 00:19:33'),
(40, 'App\\Models\\User', 4, 'created', 'App\\Models\\LodgementDetail', 9, '[]', '{\"document_code_fk\":\"IDOC2021_9\",\"id\":9}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:19:33', '2021-04-17 00:19:33'),
(41, 'App\\Models\\User', 4, 'created', 'App\\Models\\ImportDocument', 10, '[]', '{\"document_code\":\"IDOC2021_10\",\"bl_number\":\"ONEYSMZB03152600\",\"shipping_company_code_fk\":\"26\",\"factory_code\":\"002\",\"document_received_date\":\"2021-04-16\",\"document_received_time\":\"14:22\",\"id\":10}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:19:57', '2021-04-17 00:19:57'),
(42, 'App\\Models\\User', 4, 'created', 'App\\Models\\LodgementDetail', 10, '[]', '{\"document_code_fk\":\"IDOC2021_10\",\"id\":10}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:19:57', '2021-04-17 00:19:57'),
(43, 'App\\Models\\User', 4, 'created', 'App\\Models\\ImportDocument', 11, '[]', '{\"document_code\":\"IDOC2021_11\",\"bl_number\":\"SITJGKKMNH0148\",\"shipping_company_code_fk\":\"14\",\"factory_code\":\"001\",\"document_received_date\":\"2021-04-17\",\"document_received_time\":\"07:49\",\"id\":11}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:20:38', '2021-04-17 00:20:38'),
(44, 'App\\Models\\User', 4, 'created', 'App\\Models\\LodgementDetail', 11, '[]', '{\"document_code_fk\":\"IDOC2021_11\",\"id\":11}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:20:39', '2021-04-17 00:20:39'),
(45, 'App\\Models\\User', 4, 'created', 'App\\Models\\ImportDocument', 12, '[]', '{\"document_code\":\"IDOC2021_12\",\"bl_number\":\"ONEYSMZB02978700\",\"shipping_company_code_fk\":\"26\",\"factory_code\":\"002\",\"document_received_date\":\"2021-04-16\",\"document_received_time\":\"14:18\",\"id\":12}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:21:08', '2021-04-17 00:21:08'),
(46, 'App\\Models\\User', 4, 'created', 'App\\Models\\LodgementDetail', 12, '[]', '{\"document_code_fk\":\"IDOC2021_12\",\"id\":12}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:21:08', '2021-04-17 00:21:08'),
(47, 'App\\Models\\User', 4, 'created', 'App\\Models\\ImportDocument', 13, '[]', '{\"document_code\":\"IDOC2021_13\",\"bl_number\":\"YMLUI272110258\",\"shipping_company_code_fk\":\"11\",\"factory_code\":\"001\",\"document_received_date\":\"2021-04-16\",\"document_received_time\":\"14:14\",\"id\":13}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:21:38', '2021-04-17 00:21:38'),
(48, 'App\\Models\\User', 4, 'created', 'App\\Models\\LodgementDetail', 13, '[]', '{\"document_code_fk\":\"IDOC2021_13\",\"id\":13}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:21:38', '2021-04-17 00:21:38'),
(49, 'App\\Models\\User', 4, 'created', 'App\\Models\\ImportDocument', 14, '[]', '{\"document_code\":\"IDOC2021_14\",\"bl_number\":\"049BA05714\",\"shipping_company_code_fk\":\"7\",\"factory_code\":\"004\",\"document_received_date\":\"2021-04-17\",\"document_received_time\":\"no docs\",\"id\":14}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:30:48', '2021-04-17 00:30:48'),
(50, 'App\\Models\\User', 4, 'created', 'App\\Models\\LodgementDetail', 14, '[]', '{\"document_code_fk\":\"IDOC2021_14\",\"id\":14}', 'http://hrdapps55/isd/new_record', '10.169.164.32', 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.128 Safari/537.36', NULL, '2021-04-17 00:30:48', '2021-04-17 00:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `bl_volumes`
--

CREATE TABLE `bl_volumes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_code_fk` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `volume` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `container_amounts`
--

CREATE TABLE `container_amounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `no_containers` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `edited_by` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `container_amounts`
--

INSERT INTO `container_amounts` (`id`, `no_containers`, `amount`, `edited_by`, `created_at`, `updated_at`) VALUES
(1, 1, 400.00, NULL, NULL, NULL),
(2, 2, 400.00, NULL, NULL, NULL),
(3, 3, 800.00, NULL, NULL, NULL),
(4, 4, 800.00, NULL, NULL, NULL),
(5, 5, 1200.00, NULL, NULL, NULL),
(6, 6, 1200.00, NULL, NULL, NULL),
(7, 7, 1600.00, NULL, NULL, NULL),
(8, 8, 1600.00, NULL, NULL, NULL),
(9, 9, 2000.00, NULL, NULL, NULL),
(10, 10, 2000.00, NULL, NULL, NULL),
(11, 11, 2400.00, NULL, NULL, NULL),
(12, 12, 2400.00, NULL, NULL, NULL),
(13, 13, 2800.00, NULL, NULL, NULL),
(14, 14, 2800.00, NULL, NULL, NULL),
(15, 15, 3200.00, NULL, NULL, NULL),
(16, 16, 3200.00, NULL, NULL, NULL),
(17, 17, 3600.00, NULL, NULL, NULL),
(18, 18, 3600.00, NULL, NULL, NULL),
(19, 19, 4000.00, NULL, NULL, NULL),
(20, 20, 4000.00, NULL, NULL, NULL),
(21, 21, 4400.00, NULL, NULL, NULL),
(22, 22, 4400.00, NULL, NULL, NULL),
(23, 23, 4800.00, NULL, NULL, NULL),
(24, 24, 4800.00, NULL, NULL, NULL),
(25, 25, 5200.00, NULL, NULL, NULL),
(26, 26, 5200.00, NULL, NULL, NULL),
(27, 27, 5600.00, NULL, NULL, NULL),
(28, 28, 5600.00, NULL, NULL, NULL),
(29, 29, 6000.00, NULL, NULL, NULL),
(30, 30, 6000.00, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `failed_jobs`
--

INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`) VALUES
(1, '8885ef3d-e2e6-45e9-9102-83e6314118cd', 'database', 'default', '{\"uuid\":\"8885ef3d-e2e6-45e9-9102-83e6314118cd\",\"displayName\":\"App\\\\Jobs\\\\EditByJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\EditByJob\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\EditByJob\\\":13:{s:13:\\\"reqcolumnuest\\\";N;s:6:\\\"docsid\\\";a:2:{i:0;s:11:\\\"IDOC2021_42\\\";i:1;s:11:\\\"IDOC2021_29\\\";}s:5:\\\"value\\\";i:1;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'ErrorException: Undefined property: App\\Jobs\\EditByJob::$column in C:\\Apache24\\htdocs\\ImportShipment\\app\\Jobs\\EditByJob.php:44\nStack trace:\n#0 C:\\Apache24\\htdocs\\ImportShipment\\app\\Jobs\\EditByJob.php(44): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Undefined prope...\', \'C:\\\\Apache24\\\\htd...\', 44, Array)\n#1 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\EditByJob->handle()\n#2 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(610): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#7 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\EditByJob))\n#8 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\EditByJob))\n#9 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(118): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\EditByJob), false)\n#11 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\EditByJob))\n#12 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\EditByJob))\n#13 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\EditByJob))\n#15 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(406): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(356): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(158): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(116): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(100): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(610): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#27 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(971): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(290): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(166): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\Apache24\\htdocs\\ImportShipment\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}'),
(2, '8352f944-cdc8-40b9-a83f-1a507a0a3540', 'database', 'default', '{\"uuid\":\"8352f944-cdc8-40b9-a83f-1a507a0a3540\",\"displayName\":\"App\\\\Jobs\\\\EditByJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\EditByJob\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\EditByJob\\\":13:{s:6:\\\"column\\\";s:17:\\\"shipment_priority\\\";s:6:\\\"docsid\\\";a:2:{i:0;s:11:\\\"IDOC2021_42\\\";i:1;s:11:\\\"IDOC2021_29\\\";}s:5:\\\"value\\\";i:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'ErrorException: Trying to get property \'username\' of non-object in C:\\Apache24\\htdocs\\ImportShipment\\app\\Jobs\\EditByJob.php:44\nStack trace:\n#0 C:\\Apache24\\htdocs\\ImportShipment\\app\\Jobs\\EditByJob.php(44): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Trying to get p...\', \'C:\\\\Apache24\\\\htd...\', 44, Array)\n#1 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\EditByJob->handle()\n#2 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(610): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#7 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\EditByJob))\n#8 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\EditByJob))\n#9 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(118): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\EditByJob), false)\n#11 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\EditByJob))\n#12 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\EditByJob))\n#13 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\EditByJob))\n#15 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(406): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(356): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(158): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(116): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(100): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(610): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#27 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(971): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(290): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(166): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\Apache24\\htdocs\\ImportShipment\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}'),
(3, 'af1998cf-ae02-4eda-b63e-5c5c19973216', 'database', 'default', '{\"uuid\":\"af1998cf-ae02-4eda-b63e-5c5c19973216\",\"displayName\":\"App\\\\Jobs\\\\EditByJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\EditByJob\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\EditByJob\\\":13:{s:6:\\\"column\\\";s:17:\\\"shipment_priority\\\";s:6:\\\"docsid\\\";a:2:{i:0;s:11:\\\"IDOC2021_42\\\";i:1;s:11:\\\"IDOC2021_29\\\";}s:5:\\\"value\\\";i:1;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'ErrorException: Trying to get property \'username\' of non-object in C:\\Apache24\\htdocs\\ImportShipment\\app\\Jobs\\EditByJob.php:44\nStack trace:\n#0 C:\\Apache24\\htdocs\\ImportShipment\\app\\Jobs\\EditByJob.php(44): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Trying to get p...\', \'C:\\\\Apache24\\\\htd...\', 44, Array)\n#1 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\EditByJob->handle()\n#2 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(610): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#7 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\EditByJob))\n#8 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\EditByJob))\n#9 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(118): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\EditByJob), false)\n#11 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\EditByJob))\n#12 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\EditByJob))\n#13 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\EditByJob))\n#15 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(406): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(356): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(158): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(116): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(100): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(610): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#27 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(971): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(290): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(166): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\Apache24\\htdocs\\ImportShipment\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}'),
(4, '596efa79-7e5a-43a5-b048-1a24f0db2895', 'database', 'default', '{\"uuid\":\"596efa79-7e5a-43a5-b048-1a24f0db2895\",\"displayName\":\"App\\\\Jobs\\\\EditByJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\EditByJob\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\EditByJob\\\":13:{s:6:\\\"column\\\";s:17:\\\"shipment_priority\\\";s:6:\\\"docsid\\\";a:2:{i:0;s:11:\\\"IDOC2021_42\\\";i:1;s:11:\\\"IDOC2021_29\\\";}s:5:\\\"value\\\";i:0;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'ErrorException: Trying to get property \'username\' of non-object in C:\\Apache24\\htdocs\\ImportShipment\\app\\Jobs\\EditByJob.php:44\nStack trace:\n#0 C:\\Apache24\\htdocs\\ImportShipment\\app\\Jobs\\EditByJob.php(44): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Trying to get p...\', \'C:\\\\Apache24\\\\htd...\', 44, Array)\n#1 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\EditByJob->handle()\n#2 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(610): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#7 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\EditByJob))\n#8 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\EditByJob))\n#9 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(118): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\EditByJob), false)\n#11 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\EditByJob))\n#12 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\EditByJob))\n#13 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\EditByJob))\n#15 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(406): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(356): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(158): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(116): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(100): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(610): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#27 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(971): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(290): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(166): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\Apache24\\htdocs\\ImportShipment\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}'),
(5, 'd558946f-b13a-4679-9628-473969e621b6', 'database', 'default', '{\"uuid\":\"d558946f-b13a-4679-9628-473969e621b6\",\"displayName\":\"App\\\\Jobs\\\\EditByJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\EditByJob\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\EditByJob\\\":13:{s:6:\\\"column\\\";s:17:\\\"shipment_priority\\\";s:6:\\\"docsid\\\";a:2:{i:0;s:11:\\\"IDOC2021_42\\\";i:1;s:11:\\\"IDOC2021_29\\\";}s:5:\\\"value\\\";i:1;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'ErrorException: Trying to get property \'username\' of non-object in C:\\Apache24\\htdocs\\ImportShipment\\app\\Jobs\\EditByJob.php:44\nStack trace:\n#0 C:\\Apache24\\htdocs\\ImportShipment\\app\\Jobs\\EditByJob.php(44): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Trying to get p...\', \'C:\\\\Apache24\\\\htd...\', 44, Array)\n#1 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\EditByJob->handle()\n#2 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(610): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#7 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\EditByJob))\n#8 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\EditByJob))\n#9 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(118): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\EditByJob), false)\n#11 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\EditByJob))\n#12 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\EditByJob))\n#13 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\EditByJob))\n#15 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(406): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(356): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(158): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(116): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(100): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(610): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#27 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(971): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(290): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(166): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\Apache24\\htdocs\\ImportShipment\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}');
INSERT INTO `failed_jobs` (`id`, `uuid`, `connection`, `queue`, `payload`, `exception`) VALUES
(6, '56a373e8-a9e0-40a4-bf27-a4326a3dbdb2', 'database', 'default', '{\"uuid\":\"56a373e8-a9e0-40a4-bf27-a4326a3dbdb2\",\"displayName\":\"App\\\\Jobs\\\\EditByJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\EditByJob\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\EditByJob\\\":13:{s:6:\\\"column\\\";s:17:\\\"shipment_priority\\\";s:6:\\\"docsid\\\";a:2:{i:0;s:11:\\\"IDOC2021_42\\\";i:1;s:11:\\\"IDOC2021_29\\\";}s:5:\\\"value\\\";i:1;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'ErrorException: Trying to get property \'username\' of non-object in C:\\Apache24\\htdocs\\ImportShipment\\app\\Jobs\\EditByJob.php:44\nStack trace:\n#0 C:\\Apache24\\htdocs\\ImportShipment\\app\\Jobs\\EditByJob.php(44): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Trying to get p...\', \'C:\\\\Apache24\\\\htd...\', 44, Array)\n#1 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\EditByJob->handle()\n#2 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(610): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#7 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\EditByJob))\n#8 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\EditByJob))\n#9 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(118): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\EditByJob), false)\n#11 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\EditByJob))\n#12 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\EditByJob))\n#13 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\EditByJob))\n#15 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(406): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(356): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(158): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(116): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(100): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(610): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#27 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(971): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(290): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(166): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\Apache24\\htdocs\\ImportShipment\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}'),
(7, 'b88d3d90-68ad-45ac-908c-e8c5737080d2', 'database', 'default', '{\"uuid\":\"b88d3d90-68ad-45ac-908c-e8c5737080d2\",\"displayName\":\"App\\\\Jobs\\\\EditByJob\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"maxExceptions\":null,\"backoff\":null,\"timeout\":null,\"retryUntil\":null,\"data\":{\"commandName\":\"App\\\\Jobs\\\\EditByJob\",\"command\":\"O:18:\\\"App\\\\Jobs\\\\EditByJob\\\":13:{s:6:\\\"column\\\";s:17:\\\"shipment_priority\\\";s:6:\\\"docsid\\\";a:2:{i:0;s:11:\\\"IDOC2021_42\\\";i:1;s:11:\\\"IDOC2021_29\\\";}s:5:\\\"value\\\";i:1;s:3:\\\"job\\\";N;s:10:\\\"connection\\\";N;s:5:\\\"queue\\\";N;s:15:\\\"chainConnection\\\";N;s:10:\\\"chainQueue\\\";N;s:19:\\\"chainCatchCallbacks\\\";N;s:5:\\\"delay\\\";N;s:11:\\\"afterCommit\\\";N;s:10:\\\"middleware\\\";a:0:{}s:7:\\\"chained\\\";a:0:{}}\"}}', 'ErrorException: Trying to get property \'username\' of non-object in C:\\Apache24\\htdocs\\ImportShipment\\app\\Jobs\\EditByJob.php:44\nStack trace:\n#0 C:\\Apache24\\htdocs\\ImportShipment\\app\\Jobs\\EditByJob.php(44): Illuminate\\Foundation\\Bootstrap\\HandleExceptions->handleError(8, \'Trying to get p...\', \'C:\\\\Apache24\\\\htd...\', 44, Array)\n#1 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): App\\Jobs\\EditByJob->handle()\n#2 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#3 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#4 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#5 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(610): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#6 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(128): Illuminate\\Container\\Container->call(Array)\n#7 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Bus\\Dispatcher->Illuminate\\Bus\\{closure}(Object(App\\Jobs\\EditByJob))\n#8 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\EditByJob))\n#9 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Bus\\Dispatcher.php(132): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#10 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(118): Illuminate\\Bus\\Dispatcher->dispatchNow(Object(App\\Jobs\\EditByJob), false)\n#11 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(128): Illuminate\\Queue\\CallQueuedHandler->Illuminate\\Queue\\{closure}(Object(App\\Jobs\\EditByJob))\n#12 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Pipeline\\Pipeline.php(103): Illuminate\\Pipeline\\Pipeline->Illuminate\\Pipeline\\{closure}(Object(App\\Jobs\\EditByJob))\n#13 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(120): Illuminate\\Pipeline\\Pipeline->then(Object(Closure))\n#14 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\CallQueuedHandler.php(70): Illuminate\\Queue\\CallQueuedHandler->dispatchThroughMiddleware(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(App\\Jobs\\EditByJob))\n#15 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Jobs\\Job.php(98): Illuminate\\Queue\\CallQueuedHandler->call(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Array)\n#16 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(406): Illuminate\\Queue\\Jobs\\Job->fire()\n#17 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(356): Illuminate\\Queue\\Worker->process(\'database\', Object(Illuminate\\Queue\\Jobs\\DatabaseJob), Object(Illuminate\\Queue\\WorkerOptions))\n#18 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Worker.php(158): Illuminate\\Queue\\Worker->runJob(Object(Illuminate\\Queue\\Jobs\\DatabaseJob), \'database\', Object(Illuminate\\Queue\\WorkerOptions))\n#19 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(116): Illuminate\\Queue\\Worker->daemon(\'database\', \'default\', Object(Illuminate\\Queue\\WorkerOptions))\n#20 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Queue\\Console\\WorkCommand.php(100): Illuminate\\Queue\\Console\\WorkCommand->runWorker(\'database\', \'default\')\n#21 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(36): Illuminate\\Queue\\Console\\WorkCommand->handle()\n#22 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Util.php(40): Illuminate\\Container\\BoundMethod::Illuminate\\Container\\{closure}()\n#23 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(93): Illuminate\\Container\\Util::unwrapIfClosure(Object(Closure))\n#24 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\BoundMethod.php(37): Illuminate\\Container\\BoundMethod::callBoundMethod(Object(Illuminate\\Foundation\\Application), Array, Object(Closure))\n#25 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Container\\Container.php(610): Illuminate\\Container\\BoundMethod::call(Object(Illuminate\\Foundation\\Application), Array, Array, NULL)\n#26 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(136): Illuminate\\Container\\Container->call(Array)\n#27 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Command\\Command.php(255): Illuminate\\Console\\Command->execute(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#28 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Command.php(121): Symfony\\Component\\Console\\Command\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Illuminate\\Console\\OutputStyle))\n#29 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(971): Illuminate\\Console\\Command->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#30 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(290): Symfony\\Component\\Console\\Application->doRunCommand(Object(Illuminate\\Queue\\Console\\WorkCommand), Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#31 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\symfony\\console\\Application.php(166): Symfony\\Component\\Console\\Application->doRun(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#32 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Console\\Application.php(93): Symfony\\Component\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#33 C:\\Apache24\\htdocs\\ImportShipment\\vendor\\laravel\\framework\\src\\Illuminate\\Foundation\\Console\\Kernel.php(129): Illuminate\\Console\\Application->run(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#34 C:\\Apache24\\htdocs\\ImportShipment\\artisan(37): Illuminate\\Foundation\\Console\\Kernel->handle(Object(Symfony\\Component\\Console\\Input\\ArgvInput), Object(Symfony\\Component\\Console\\Output\\ConsoleOutput))\n#35 {main}');

-- --------------------------------------------------------

--
-- Table structure for table `import_documents`
--

CREATE TABLE `import_documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bl_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipment_priority` tinyint(1) NOT NULL DEFAULT '0',
  `size_20` int(11) NOT NULL DEFAULT '0',
  `size_40` int(11) NOT NULL DEFAULT '0',
  `total_amount` double(8,2) NOT NULL DEFAULT '0.00',
  `document_received_date` date NOT NULL,
  `document_received_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `processing_date` date DEFAULT NULL,
  `processing_time` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sps_ic_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `factory_code` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_company_code_fk` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estimated_time_arrival` date DEFAULT NULL,
  `actual_time_arrival` date DEFAULT NULL,
  `latest_estimated_time_arrival` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pod` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `registry_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connecting_vessel` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `source_details` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credit_line` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prepaid` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `billing_request_date` date DEFAULT NULL,
  `billing_received_date` date DEFAULT NULL,
  `coordinator_payment_date` date DEFAULT NULL,
  `coordinator_remarks` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endorse_date` date DEFAULT NULL,
  `cro_received_date` date DEFAULT NULL,
  `cro_validity` date DEFAULT NULL,
  `remarks_others` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `import_documents`
--

INSERT INTO `import_documents` (`id`, `document_code`, `bl_number`, `shipment_priority`, `size_20`, `size_40`, `total_amount`, `document_received_date`, `document_received_time`, `processing_date`, `processing_time`, `sps_ic_number`, `factory_code`, `shipping_company_code_fk`, `estimated_time_arrival`, `actual_time_arrival`, `latest_estimated_time_arrival`, `pod`, `registry_no`, `connecting_vessel`, `source_details`, `credit_line`, `prepaid`, `billing_request_date`, `billing_received_date`, `coordinator_payment_date`, `coordinator_remarks`, `endorse_date`, `cro_received_date`, `cro_validity`, `remarks_others`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'IDOC2021_1', 'OOLU12345678', 0, 0, 0, 0.00, '2021-04-17', '09:00AM', NULL, NULL, NULL, '001', '10', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-16 23:36:37', '2021-04-17 05:20:41'),
(2, 'IDOC2021_2', 'SITJGKKMNH0147', 0, 0, 0, 0.00, '2021-04-17', '07:53', NULL, NULL, NULL, '002', '14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 00:10:21', '2021-04-17 00:10:21'),
(3, 'IDOC2021_3', 'ONEYSMZB03023300', 0, 0, 0, 0.00, '2021-04-16', '15:45', '2021-04-17', NULL, NULL, '001', '26', '2021-04-20', NULL, '2021-04-17', 'SOUTH', 'YMT0012-21', 'HYUNDAI INTEGRAL 0CB4DS1NC', 'A/N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 00:15:55', '2021-04-17 01:56:24'),
(4, 'IDOC2021_4', 'ONEYSMZB02717500', 0, 0, 0, 0.00, '2021-04-16', '15:44', NULL, NULL, 'HTIDA123456', '001', '26', NULL, NULL, '2021-04-17', 'SOUTH', 'YMT0012-21', 'HYUNDAI INTEGRAL 0CB4DS1NC', 'A/N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 00:16:18', '2021-04-17 01:56:24'),
(5, 'IDOC2021_5', 'ACD211062', 0, 0, 0, 0.00, '2021-04-16', '16:00', NULL, NULL, 'HTIDA123456', '000', '21', NULL, NULL, '2021-04-19', 'SOUTH', 'YMT0012-21', 'HYUNDAI INTEGRAL 0CB4DS1NC', 'A/N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 00:17:03', '2021-04-17 01:11:23'),
(6, 'IDOC2021_6', 'YMLUI433104721', 0, 0, 0, 0.00, '2021-04-16', '16:10', NULL, NULL, NULL, '001', '11', NULL, NULL, '2021-04-17', 'SOUTH', 'YMT0012-21', 'HYUNDAI INTEGRAL 0CB4DS1NC', 'A/N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 00:17:47', '2021-04-17 01:56:24'),
(7, 'IDOC2021_7', 'YMLUI433104728', 0, 0, 0, 0.00, '2021-04-16', '04;15', NULL, NULL, NULL, '001', '11', NULL, NULL, '2021-04-17', 'SOUTH', 'YMT0012-21', 'HYUNDAI INTEGRAL 0CB4DS1NC', 'A/N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 00:18:19', '2021-04-17 01:56:24'),
(8, 'IDOC2021_8', 'HHE-14601810', 0, 0, 0, 0.00, '2021-04-16', '15:59', NULL, NULL, NULL, '004', '11', NULL, NULL, '2021-04-17', 'SOUTH', 'YMT0012-21', 'HYUNDAI INTEGRAL 0CB4DS1NC', 'A/N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 00:19:11', '2021-04-17 01:56:24'),
(9, 'IDOC2021_9', 'VIE0180247', 0, 0, 0, 0.00, '2021-04-16', '15:57', NULL, NULL, NULL, '001', '21', NULL, NULL, '2021-04-17', 'SOUTH', 'YMT0012-21', 'HYUNDAI INTEGRAL 0CB4DS1NC', 'A/N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 00:19:33', '2021-04-17 01:56:24'),
(10, 'IDOC2021_10', 'ONEYSMZB03152600', 0, 0, 0, 0.00, '2021-04-16', '14:22', NULL, NULL, NULL, '002', '26', NULL, NULL, '2021-04-17', 'SOUTH', 'YMT0012-21', 'HYUNDAI INTEGRAL 0CB4DS1NC', 'A/N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 00:19:57', '2021-04-17 01:56:24'),
(11, 'IDOC2021_11', 'SITJGKKMNH0148', 0, 0, 0, 0.00, '2021-04-17', '07:49', NULL, NULL, NULL, '001', '14', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 00:20:38', '2021-04-17 00:20:38'),
(12, 'IDOC2021_12', 'ONEYSMZB02978700', 0, 0, 0, 0.00, '2021-04-16', '14:18', NULL, NULL, NULL, '002', '26', NULL, NULL, '2021-04-17', 'SOUTH', 'YMT0012-21', 'HYUNDAI INTEGRAL 0CB4DS1NC', 'A/N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 00:21:08', '2021-04-17 01:56:24'),
(13, 'IDOC2021_13', 'YMLUI272110258', 0, 0, 0, 0.00, '2021-04-16', '14:15', NULL, NULL, NULL, '001', '11', NULL, NULL, '2021-04-17', 'SOUTH', 'YMT0012-21', 'HYUNDAI INTEGRAL 0CB4DS1NC', 'A/N', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 00:21:38', '2021-04-17 01:56:24'),
(14, 'IDOC2021_14', '049BA05714', 0, 0, 0, 0.00, '2021-04-17', 'no docs', NULL, NULL, NULL, '004', '7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-17 00:30:48', '2021-04-17 00:30:48');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lodgement_details`
--

CREATE TABLE `lodgement_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_code_fk` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_document_received_processing` tinyint(1) NOT NULL DEFAULT '0',
  `document_received_processing_date` date DEFAULT NULL,
  `document_received_processing_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target_lodgement_date` date DEFAULT NULL,
  `document_status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_date` date DEFAULT NULL,
  `e2m_date` date DEFAULT NULL,
  `ip_checked_date` date DEFAULT NULL,
  `e2m_checked_date` date DEFAULT NULL,
  `ip_approval_date` date DEFAULT NULL,
  `e2m_approval_date` date DEFAULT NULL,
  `ip_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tsad_number` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `op_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `turnover_process_date` date DEFAULT NULL,
  `remarks_tag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `assessment_tag` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_lodgement_incharge` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `e2m_lodgement_incharge` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `invoice_item_number` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `lodgement_details`
--

INSERT INTO `lodgement_details` (`id`, `document_code_fk`, `is_document_received_processing`, `document_received_processing_date`, `document_received_processing_by`, `target_lodgement_date`, `document_status`, `ip_date`, `e2m_date`, `ip_checked_date`, `e2m_checked_date`, `ip_approval_date`, `e2m_approval_date`, `ip_number`, `tsad_number`, `op_number`, `turnover_process_date`, `remarks_tag`, `assessment_tag`, `ip_lodgement_incharge`, `e2m_lodgement_incharge`, `invoice_item_number`, `created_at`, `updated_at`) VALUES
(1, 'IDOC2021_1', 0, NULL, NULL, NULL, NULL, '2021-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18', NULL, NULL, NULL, NULL, 1, '2021-04-16 23:36:38', '2021-04-17 06:58:00'),
(2, 'IDOC2021_2', 0, NULL, NULL, NULL, 'FOR PORTAL', '2021-04-17', '2021-04-17', NULL, NULL, NULL, '2021-04-19', NULL, NULL, NULL, '2021-04-18', NULL, NULL, NULL, NULL, 1, '2021-04-17 00:10:21', '2021-04-17 06:58:00'),
(3, 'IDOC2021_3', 0, NULL, NULL, NULL, 'FOR PORTAL', '2021-04-13', '2021-04-13', NULL, '2021-04-14', '2021-04-14', '2021-04-19', NULL, NULL, NULL, '2021-04-18', NULL, NULL, NULL, NULL, 1, '2021-04-17 00:15:55', '2021-04-17 06:58:00'),
(4, 'IDOC2021_4', 0, NULL, NULL, NULL, NULL, '2021-04-13', '2021-04-13', NULL, '2021-04-14', '2021-04-14', NULL, NULL, NULL, NULL, '2021-04-18', NULL, NULL, NULL, NULL, 1, '2021-04-17 00:16:18', '2021-04-17 06:58:00'),
(5, 'IDOC2021_5', 0, NULL, NULL, NULL, NULL, '2021-04-13', '2021-04-13', NULL, '2021-04-14', '2021-04-14', NULL, NULL, NULL, NULL, '2021-04-18', NULL, NULL, NULL, NULL, 1, '2021-04-17 00:17:03', '2021-04-17 06:58:00'),
(6, 'IDOC2021_6', 0, NULL, NULL, NULL, 'FOR PORTAL', '2021-04-13', '2021-04-13', NULL, '2021-04-14', '2021-04-14', '2021-04-19', NULL, NULL, NULL, '2021-04-18', NULL, NULL, NULL, NULL, 1, '2021-04-17 00:17:47', '2021-04-17 06:58:00'),
(7, 'IDOC2021_7', 0, NULL, NULL, NULL, 'FOR PORTAL', '2021-04-13', '2021-04-13', NULL, '2021-04-14', '2021-04-14', '2021-04-19', NULL, NULL, NULL, '2021-04-18', NULL, NULL, NULL, NULL, 1, '2021-04-17 00:18:19', '2021-04-17 06:58:00'),
(8, 'IDOC2021_8', 0, NULL, NULL, NULL, 'FOR PORTAL', '2021-04-13', '2021-04-13', NULL, '2021-04-14', '2021-04-14', '2021-04-19', NULL, NULL, NULL, '2021-04-18', NULL, NULL, NULL, NULL, 1, '2021-04-17 00:19:11', '2021-04-17 06:58:00'),
(9, 'IDOC2021_9', 0, NULL, NULL, NULL, 'FOR PORTAL', '2021-04-13', '2021-04-13', NULL, '2021-04-14', '2021-04-14', '2021-04-19', NULL, NULL, NULL, '2021-04-18', NULL, NULL, NULL, NULL, 1, '2021-04-17 00:19:33', '2021-04-17 06:58:00'),
(10, 'IDOC2021_10', 0, NULL, NULL, NULL, 'FOR PORTAL', '2021-04-13', '2021-04-13', NULL, '2021-04-14', '2021-04-14', '2021-04-19', NULL, NULL, NULL, '2021-04-18', NULL, NULL, NULL, NULL, 1, '2021-04-17 00:19:57', '2021-04-17 06:58:00'),
(11, 'IDOC2021_11', 0, NULL, NULL, NULL, NULL, '2021-04-17', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-18', NULL, NULL, NULL, NULL, 1, '2021-04-17 00:20:39', '2021-04-17 06:58:00'),
(12, 'IDOC2021_12', 0, NULL, NULL, NULL, 'FOR PORTAL', '2021-04-13', '2021-04-13', NULL, '2021-04-14', '2021-04-14', '2021-04-19', NULL, NULL, NULL, '2021-04-18', NULL, NULL, NULL, NULL, 1, '2021-04-17 00:21:08', '2021-04-17 06:58:00'),
(13, 'IDOC2021_13', 0, NULL, NULL, NULL, NULL, '2021-04-13', '2021-04-13', NULL, '2021-04-14', '2021-04-14', NULL, NULL, NULL, NULL, '2021-04-18', NULL, NULL, NULL, NULL, 1, '2021-04-17 00:21:38', '2021-04-17 06:58:00'),
(14, 'IDOC2021_14', 0, NULL, NULL, NULL, 'FOR PORTAL', '2021-04-17', '2021-04-17', NULL, NULL, NULL, '2021-04-19', NULL, NULL, NULL, '2021-04-18', NULL, NULL, NULL, NULL, 1, '2021-04-17 00:30:48', '2021-04-17 06:58:00');

-- --------------------------------------------------------

--
-- Table structure for table `lodgement_statuses`
--

CREATE TABLE `lodgement_statuses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(10, '2014_10_12_000000_create_users_table', 1),
(11, '2014_10_12_100000_create_password_resets_table', 1),
(12, '2021_01_13_040141_create_permission_tables', 1),
(13, '2021_01_18_010211_create_m_factories_table', 1),
(14, '2021_01_21_044506_create_import_documents_table', 1),
(15, '2021_01_21_062207_create_bl_volumes_table', 1),
(16, '2021_01_21_065443_create_lodgement_details_table', 1),
(17, '2021_01_22_012944_create_shipping_lines_table', 1),
(18, '2021_01_25_012045_add_connecting_vessels_to_import_documents_table', 1),
(21, '2021_01_25_013222_create_lodgement_statuses_table', 2),
(22, '2021_01_25_064833_add_index_import_document', 3),
(23, '2021_01_26_041954_create_audits_table', 4),
(24, '2021_01_26_234335_add_assessment_tag_to_lodgement_details', 5),
(25, '2021_01_28_235551_add_name_to_lodgement_statses', 6),
(27, '2021_02_02_064727_add_size_volume_to_import_document', 7),
(34, '2021_03_04_013505_create_container_amounts_table', 8),
(36, '2021_03_10_014848_add_op_number_to_lodgement_details_table', 9),
(37, '2021_03_12_022801_add_container_amount_to_import_documents', 10),
(38, '2021_04_06_020520_create_jobs_table', 11),
(39, '2021_04_06_022946_create_failed_jobs_table', 12),
(40, '2021_04_06_231931_add_shipment_priority_to_import_documents', 13),
(43, '2021_04_16_140642_add_latest_eta', 14);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_permissions`
--

INSERT INTO `model_has_permissions` (`permission_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 16),
(1, 'App\\Models\\User', 17),
(1, 'App\\Models\\User', 18),
(1, 'App\\Models\\User', 19);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(10, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 2),
(1, 'App\\Models\\User', 3),
(1, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 5),
(4, 'App\\Models\\User', 8),
(6, 'App\\Models\\User', 13),
(10, 'App\\Models\\User', 18),
(10, 'App\\Models\\User', 19);

-- --------------------------------------------------------

--
-- Table structure for table `m_factories`
--

CREATE TABLE `m_factories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `factory_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `factory_abbr` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `factory_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `m_factories`
--

INSERT INTO `m_factories` (`id`, `factory_code`, `factory_abbr`, `factory_name`, `created_at`, `updated_at`, `deleted_at`, `deleted_by`) VALUES
(1, '000', 'PV TECH', 'PV Tech (S) Pte., Ltd.', NULL, NULL, NULL, NULL),
(2, '001', 'SCAD', 'SCAD Services (S) Pte., Ltd.', NULL, NULL, NULL, NULL),
(3, '002', 'HTI', 'House Technology Industries Pte., Ltd.', NULL, NULL, NULL, NULL),
(4, '003', 'HRD', 'HRD Singapore Pte., Ltd.', NULL, NULL, NULL, NULL),
(5, '004', 'WUKONG', 'Wu Kong Singapore Pte., Ltd.', NULL, NULL, NULL, NULL),
(6, '005', 'MAJESTIC', 'Majestic Landscape Corporation', NULL, NULL, NULL, NULL),
(7, '100', 'PV TECH', 'PV Tech (S) Pte., Ltd.', NULL, NULL, NULL, NULL),
(8, '101', 'SCAD', 'SCAD Services (S) Pte., Ltd.', NULL, NULL, NULL, NULL),
(9, '102', 'HTI', 'House Technology Industries Pte., Ltd.', NULL, NULL, NULL, NULL),
(10, '103', 'HRD', 'HRD Singapore Pte., Ltd.', NULL, NULL, NULL, NULL),
(11, '104', 'WUKONG', 'Wu Kong Singapore Pte., Ltd.', NULL, NULL, NULL, NULL),
(12, '105', 'MAJESTIC', 'Majestic Landscape Corporation', NULL, NULL, NULL, NULL),
(13, '100', 'PV TECH', 'PV Tech (S) Pte., Ltd.', NULL, NULL, NULL, NULL),
(14, '101', 'SCAD', 'SCAD Services (S) Pte., Ltd.', NULL, NULL, NULL, NULL),
(15, '102', 'HTI', 'House Technology Industries Pte., Ltd.', NULL, NULL, NULL, NULL),
(16, '103', 'HRD', 'HRD Singapore Pte., Ltd.', NULL, NULL, NULL, NULL),
(17, '104', 'WUKONG', 'Wu Kong Singapore Pte., Ltd.', NULL, NULL, NULL, NULL),
(18, '105', 'MAJESTIC', 'Majestic Landscape Corporation', NULL, NULL, NULL, NULL),
(19, '100', 'PV TECH', 'PV Tech (S) Pte., Ltd.', NULL, NULL, NULL, NULL),
(20, '101', 'SCAD', 'SCAD Services (S) Pte., Ltd.', NULL, NULL, NULL, NULL),
(21, '102', 'HTI', 'House Technology Industries Pte., Ltd.', NULL, NULL, NULL, NULL),
(22, '103', 'HRD', 'HRD Singapore Pte., Ltd.', NULL, NULL, NULL, NULL),
(23, '104', 'WUKONG', 'Wu Kong Singapore Pte., Ltd.', NULL, NULL, NULL, NULL),
(24, '105', 'MAJESTIC', 'Majestic Landscape Corporation', NULL, NULL, NULL, NULL),
(25, '100', 'PV TECH', 'PV Tech (S) Pte., Ltd.', NULL, NULL, NULL, NULL),
(26, '101', 'SCAD', 'SCAD Services (S) Pte., Ltd.', NULL, NULL, NULL, NULL),
(27, '102', 'HTI', 'House Technology Industries Pte., Ltd.', NULL, NULL, NULL, NULL),
(28, '103', 'HRD', 'HRD Singapore Pte., Ltd.', NULL, NULL, NULL, NULL),
(29, '104', 'WUKONG', 'Wu Kong Singapore Pte., Ltd.', NULL, NULL, NULL, NULL),
(30, '105', 'MAJESTIC', 'Majestic Landscape Corporation', NULL, NULL, NULL, NULL),
(31, '100', 'PV TECH', 'PV Tech (S) Pte., Ltd.', NULL, NULL, NULL, NULL),
(32, '101', 'SCAD', 'SCAD Services (S) Pte., Ltd.', NULL, NULL, NULL, NULL),
(33, '102', 'HTI', 'House Technology Industries Pte., Ltd.', NULL, NULL, NULL, NULL),
(34, '103', 'HRD', 'HRD Singapore Pte., Ltd.', NULL, NULL, NULL, NULL),
(35, '104', 'WUKONG', 'Wu Kong Singapore Pte., Ltd.', NULL, NULL, NULL, NULL),
(36, '105', 'MAJESTIC', 'Majestic Landscape Corporation', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'access-settings', 'web', '2021-02-03 17:27:12', '2021-02-03 17:27:12');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'ARRIVAL UPDATE', 'web', '2021-01-25 21:34:23', '2021-01-25 21:34:23'),
(2, 'COORDINATOR', 'web', '2021-01-25 21:34:47', '2021-01-25 21:34:47'),
(4, 'LODGEMENT', 'web', '2021-01-25 21:37:30', '2021-01-25 21:37:30'),
(5, 'LODGEMENT LEADER', 'web', '2021-01-25 21:37:30', '2021-01-25 21:37:30'),
(6, 'MANILA PROCESSOR', 'web', NULL, NULL),
(7, 'URGENT MONITORING', 'web', NULL, NULL),
(10, 'MASTER', 'web', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipping_lines`
--

CREATE TABLE `shipping_lines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `shipping_company_code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_company_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_mk` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `shipping_lines`
--

INSERT INTO `shipping_lines` (`id`, `shipping_company_code`, `shipping_company_name`, `invoice_mk`, `created_at`, `updated_at`, `deleted_at`, `deleted_by`) VALUES
(1, '24', 'NAMSUNG', 'U', '2021-01-24 17:24:07', '2021-01-24 17:24:07', NULL, NULL),
(2, '27', 'FLATRACK', '9', '2021-01-24 17:24:07', '2021-01-24 17:24:07', NULL, NULL),
(3, '10', 'HYUNDAI', 'Y', '2021-01-24 17:24:07', '2021-01-24 17:24:07', NULL, NULL),
(4, '20', 'COSCO', 'X', '2021-01-24 17:24:07', '2021-01-24 17:24:07', NULL, NULL),
(5, '9', 'HEUNG-A/WALLEM', 'A', '2021-01-24 17:24:07', '2021-01-24 17:24:07', NULL, NULL),
(6, '11', 'YANG MING', 'G', '2021-01-24 17:24:07', '2021-01-24 17:24:07', NULL, NULL),
(7, '13', 'CHINA SHIPPING', 'N', '2021-01-24 17:24:07', '2021-01-24 17:24:07', NULL, NULL),
(8, '14', 'SITC', 'I', '2021-01-24 17:24:07', '2021-01-24 17:24:07', NULL, NULL),
(9, '16', 'SINOKOR', 'R', '2021-01-24 17:24:07', '2021-01-24 17:24:07', NULL, NULL),
(10, '1', 'K\'LINE', 'K', '2021-01-24 17:24:08', '2021-01-24 17:24:08', NULL, NULL),
(11, '2', 'TSK', 'T', '2021-01-24 17:24:08', '2021-01-24 17:24:08', NULL, NULL),
(12, '3', 'HANJIN', 'H', '2021-01-24 17:24:08', '2021-01-24 17:24:08', NULL, NULL),
(13, '4', 'OOCL', 'O', '2021-01-24 17:24:08', '2021-01-24 17:24:08', NULL, NULL),
(14, '5', 'KMTC', 'C', '2021-01-24 17:24:08', '2021-01-24 17:24:08', NULL, NULL),
(15, '6', 'EVERGREEN', 'E', '2021-01-24 17:24:08', '2021-01-24 17:24:08', NULL, NULL),
(16, '7', 'WANHAI', 'W', '2021-01-24 17:24:08', '2021-01-24 17:24:08', NULL, NULL),
(17, '8', 'MAERSK', 'M', '2021-01-24 17:24:08', '2021-01-24 17:24:08', NULL, NULL),
(18, '12', 'MOL', 'S', '2021-01-24 17:24:08', '2021-01-24 17:24:08', NULL, NULL),
(19, '15', 'TS LINES', 'L', '2021-01-24 17:24:08', '2021-01-24 17:24:08', NULL, NULL),
(20, '18', 'SYMS/SCHENKER', 'D', '2021-01-24 17:24:08', '2021-01-24 17:24:08', NULL, NULL),
(21, '19', 'APL', 'P', '2021-01-24 17:24:08', '2021-01-24 17:24:08', NULL, NULL),
(22, '22', 'GOLD STAR', 'B', '2021-01-24 17:24:09', '2021-01-24 17:24:09', NULL, NULL),
(23, '23', 'AIR', 'Z', '2021-01-24 17:24:09', '2021-01-24 17:24:09', NULL, NULL),
(24, '21', 'CMA&CGM', 'V', '2021-01-24 17:24:09', '2021-01-24 17:24:09', NULL, NULL),
(25, '25', 'CK LINE', 'F', '2021-01-24 17:24:09', '2021-01-24 17:24:09', NULL, NULL),
(26, '26', 'ONE', 'J', '2021-01-24 17:24:09', '2021-01-24 17:24:09', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deletedBy` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `deletedBy`) VALUES
(1, 'Jerome Del Rosario', '028731', '$2y$10$J6j6SVINQf/RZ2NTND2xi.IbmX9Qc3hx9jYM3v2tEPnbTsr8zJWOy', NULL, NULL, NULL, NULL, NULL),
(2, 'Michael Allan Carino', '016273', '$2y$10$CBJnnS6JPm8ovlzrsRKafejZBpA/k8KZrkOnLIDkRhkDqjr0UAW1.', NULL, NULL, NULL, NULL, NULL),
(3, 'MARGIE P. CESTINA', '39726', '$2y$10$LjiLaAq6w0yd.Ltew5coa.tWsQedE7PVUGzMRRGmrYyuXJOwnmXzO', NULL, NULL, NULL, NULL, NULL),
(4, 'ALONA C. CANA', '38671', '$2y$10$pMdfdCE4aQIbsWnH5tJHTOi8vXGMVS5XeKlsQTjN1bOHYgzCX6b.G', NULL, NULL, NULL, NULL, NULL),
(5, 'MERYLOU A. PASCUA', '37950', '$2y$10$bDtGwNj/uw0HYIRgQmXhBuCu2hWnMq8pY0hpolGIhSbZ./LAo5itK', NULL, NULL, NULL, NULL, NULL),
(6, 'AILENE A. DE ROSAS', '37264', '$2y$10$CEbhc9FlRl.XVpZgW3pFNuCSTOv4S0B1sPWvsu7D9LBbrrgqlPWOm', NULL, NULL, NULL, NULL, NULL),
(7, 'ARIEL A. BALDEVIA', '33381', '$2y$10$T4adhzfwfTBVZg/L.WZXneWAVVC/mqJTC76T5vLzOa.qSY8W6mj9u', NULL, NULL, NULL, NULL, NULL),
(8, 'MARIEL D. RESURRECCION', '35706', '$2y$10$oYStdQOw.oXOlrf2FXzEoOl4I0762L/CjR8jTTy8uB74KRHfNgeuy', NULL, NULL, NULL, NULL, NULL),
(9, 'CARILLE A. DAYAWON', '38672', '$2y$10$fN48fGG/1AcIqSZwgHGw9Ow4zSUMxAlFoGES4w0hho2WXX9Ktx8v.', NULL, NULL, NULL, NULL, NULL),
(10, 'MANILYN S. SURETA', '39640', '$2y$10$geqBJ30y/2dPo6O.UoJBEOXrPcQei2.q.oTKO7nYnrSC6izWJipdu', NULL, NULL, NULL, NULL, NULL),
(11, 'SHIELA MARIE B. VILLEGAS', '39725', '$2y$10$cZBlp8GbYeUNA/fDaWJZW.ZUiU2kex.et4J4ABkGoxsk2DjaDf7Re', NULL, NULL, NULL, NULL, NULL),
(12, 'JOHN WILFRED R. RATONEL', '28991', '$2y$10$B0XeAkPE/Jh9Aasufq75buJYygJwBA.yNtQe3VAwv1Q.LlbaGSweS', NULL, NULL, NULL, NULL, NULL),
(13, 'JEREL A. MANZANO', '28972', '$2y$10$56eKb0WCVg5Tq/xHJISnqOc.zTbfP7SQ4Fl8NRa/w3OUO0eX8MYu6', NULL, NULL, NULL, NULL, NULL),
(14, 'DONEL C. ESTOCE', '29026', '$2y$10$4n82o8kk1pSUXvqZQfYjRujXXZkBScclOFE1razCROTAY7Olyo6om', NULL, NULL, NULL, NULL, NULL),
(15, 'REENIER MARK B. TIBOR', '29257', '$2y$10$N9vaIDTz/C7yGv9rOF1cb.Af3NVP4RX0Sw503D/HaeCzOVHxYJTUW', NULL, NULL, NULL, NULL, NULL),
(16, 'ESTHER V. DIONGLAY', '18021', '$2y$10$JBvuIKWnuzxGghqQACeNqulPjzjkJx5UKe6GSBvsZ3AT3oPS10fNe', NULL, NULL, NULL, NULL, NULL),
(17, 'KRISTINA S. SAYO', '20525', '$2y$10$uVCVOqrooHnBSdinK4HXi.RVOay/aOQId65NeIIshW4HDiRKX/IRq', NULL, NULL, NULL, NULL, NULL),
(18, 'RHENGIBELL G. GLUDA', '27275', '$2y$10$a3NoZn/lV1ticLZfV1hgOO65HLlYB/WRYex.FJJXpHbdp0PqC89sG', NULL, NULL, NULL, NULL, NULL),
(19, 'ELMA V. DELA VEGA', '27677', '$2y$10$LCVzlQbkwg5GLPW7B7ODbenGikLce1yf6V8LwCC.eHaCte9bfBoLG', NULL, NULL, NULL, NULL, NULL),
(20, 'JANET A. TUMANAN', '28155', '$2y$10$vg3VoG0J.SRmaWaoLQ9kH.gI6Wd09uCZSAgkz8UJ7N3vRGr4aP./S', NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  ADD KEY `audits_user_id_user_type_index` (`user_id`,`user_type`);

--
-- Indexes for table `bl_volumes`
--
ALTER TABLE `bl_volumes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `container_amounts`
--
ALTER TABLE `container_amounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `import_documents`
--
ALTER TABLE `import_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `import_documents_document_code_index` (`document_code`),
  ADD KEY `import_documents_bl_number_index` (`bl_number`),
  ADD KEY `import_documents_document_received_date_index` (`document_received_date`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `lodgement_details`
--
ALTER TABLE `lodgement_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lodgement_statuses`
--
ALTER TABLE `lodgement_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `m_factories`
--
ALTER TABLE `m_factories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `shipping_lines`
--
ALTER TABLE `shipping_lines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audits`
--
ALTER TABLE `audits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `bl_volumes`
--
ALTER TABLE `bl_volumes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `container_amounts`
--
ALTER TABLE `container_amounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `import_documents`
--
ALTER TABLE `import_documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `lodgement_details`
--
ALTER TABLE `lodgement_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `lodgement_statuses`
--
ALTER TABLE `lodgement_statuses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `m_factories`
--
ALTER TABLE `m_factories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `shipping_lines`
--
ALTER TABLE `shipping_lines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
