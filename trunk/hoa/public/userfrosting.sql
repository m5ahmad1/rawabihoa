-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2018 at 12:14 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `userfrosting`
--

-- --------------------------------------------------------

--
-- Table structure for table `uf_about_us_members`
--

CREATE TABLE `uf_about_us_members` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `profile_pic_path` text NOT NULL,
  `neighborhood_id` int(11) NOT NULL,
  `membership_type` varchar(20) NOT NULL,
  `description` text NOT NULL,
  `display` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uf_about_us_members`
--

INSERT INTO `uf_about_us_members` (`id`, `name`, `profile_pic_path`, `neighborhood_id`, `membership_type`, `description`, `display`) VALUES
(14, 'Abdurrahman Abu-Hijleh', 'images/members/5a857f5c1e93d0.125248001518698332_AbdurrahmanAbu-Hijleh.jpg', 2, 'head', 'His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. His name is abd. He has a horse. ', 1),
(15, 'Larry Page', 'images/members/5a857fbc045fc0.017920001518698428_LarryPage.jpg', 3, 'head', 'He works at Google', 1),
(16, 'Test10', 'images/members/5a857f9a8d0780.577660001518698394_Test10.jpg', 2, 'owner', 'he is just a test.  Ignore him. hackerman', 1),
(17, 'Jeff Bezos', 'images/members/5a857f3a3fe410.261700001518698298_JeffBezos.jpg', 4, 'head', 'He has 120 billion dollars and a building in rawabi', 1),
(18, 'Jack Dorsey', 'images/members/5a857ecc14c580.085083001518698188_JackDorsey.jpg', 5, 'head', 'Twitter and the bubonic plague', 1),
(19, 'Test100', 'images/members/5a857fe26b42f0.439346001518698466_Test100.jpg', 3, 'owner', 'This \\\"is\\\"\\n\\nTest100', 1),
(21, 'Test10000', 'images/members/5a857f207ad280.503083001518698272_Test10000.jpg', 5, 'owner', 'No Desc.\\n\\n\\\"at all\\\"', 1),
(22, 'LastTest', 'images/members/5a857f51b77ec0.751599001518698321_LastTest.jpg', 4, 'owner', ':( :) :(', 1),
(23, 'Test100000', 'images/members/5a857fb2749300.477491001518698418_Test100000.jpg', 2, 'owner', 'Test100000. too many testssss', 1),
(24, 'Test100000000000', 'images/members/5a857f2ea8de10.691685001518698286_Test100000000000.jpg', 5, 'owner', 'iwannacry', 1),
(25, 'dsfasdf', 'images/members/5a857f442a4840.173191001518698308_dsfasdf.png', 4, 'owner', 'dfsdafdsfdsfdsafadsdfafsddafsfda', 1),
(26, 'sdfadsfas', 'images/members/5a857edaf03120.983830001518698202_sdfadsfas.png', 5, 'owner', 'gdfgdfsgsfdsgsdfgs', 1),
(27, 'Jon Snow', 'images/members/5a858042a30a20.667813001518698562_JonSnow.jpg', 5, 'owner', 'Fights zombies in GoT', 1),
(28, 'Morty', 'images/members/5a8582d2282bc0.164543001518699218_Morty.jpg', 2, 'manager', 'He is rick\'s sidekick.', 1),
(29, 'Rick Sanchez', 'images/members/5a85833c214520.136278001518699324_RickSanchez.png', 5, 'manager', 'The one and  only  rick', 1),
(35, 'zzzz', 'images/members/5a86cdad929640.600424001518783917_zzzz.png', 5, 'manager', 'sleepy', 1),
(36, 'zzz', 'images/members/noimage.png', 3, 'owner', 'zzzzzz', 1);

-- --------------------------------------------------------

--
-- Table structure for table `uf_authorize_group`
--

CREATE TABLE `uf_authorize_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `hook` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'A code that references a specific action or URI that the group has access to.',
  `conditions` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'The conditions under which members of this group have access for this hook.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uf_authorize_group`
--

INSERT INTO `uf_authorize_group` (`id`, `group_id`, `hook`, `conditions`) VALUES
(1, 2, 'uri_payments', 'always()'),
(2, 1, 'uri_dashboard', 'always()'),
(3, 2, 'uri_users', 'always()'),
(4, 1, 'uri_account_settings', 'always()'),
(5, 1, 'update_account_setting', 'equals(self.id, user.id)&&in(property,[\\\"email\\\",\\\"locale\\\",\\\"password\\\"])'),
(6, 2, 'update_account_setting', 'in(property,[\\\"email\\\",\\\"display_name\\\",\\\"title\\\",\\\"locale\\\",\\\"flag_password_reset\\\",\\\"flag_enabled\\\"])'),
(7, 2, 'view_account_setting', 'in(property,[\\\"user_name\\\",\\\"email\\\",\\\"display_name\\\",\\\"title\\\",\\\"locale\\\",\\\"flag_enabled\\\",\\\"groups\\\",\\\"primary_group_id\\\"])'),
(8, 2, 'delete_account', 'always()'),
(9, 2, 'create_account', 'always()'),
(10, 1, 'uri_payments', 'always()'),
(11, 1, 'view_account_setting', 'always()');

-- --------------------------------------------------------

--
-- Table structure for table `uf_authorize_user`
--

CREATE TABLE `uf_authorize_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `hook` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'A code that references a specific action or URI that the user has access to.',
  `conditions` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'The conditions under which the user has access for this hook.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `uf_bills`
--

CREATE TABLE `uf_bills` (
  `id` int(11) NOT NULL,
  `billAmount` text NOT NULL,
  `unit_id` int(11) NOT NULL,
  `year` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uf_bills`
--

INSERT INTO `uf_bills` (`id`, `billAmount`, `unit_id`, `year`) VALUES
(4917, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 85, 2018),
(4918, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 85, 2017),
(4914, 'a:4:{i:0;N;i:1;N;i:2;N;i:3;N;}', 84, 2019),
(4915, 'a:4:{i:0;N;i:1;N;i:2;N;i:3;N;}', 84, 2020),
(4916, 'a:4:{i:0;N;i:1;N;i:2;N;i:3;N;}', 84, 2016),
(4913, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 84, 2017),
(4912, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 84, 2018),
(4911, 'a:3:{i:0;N;i:1;N;i:2;N;}', 82, 2015),
(4910, 'a:3:{i:0;N;i:1;N;i:2;N;}', 81, 2015),
(4898, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 81, 2017),
(4908, 'a:4:{i:0;N;i:1;N;i:2;N;i:3;N;}', 81, 2016),
(4909, 'a:3:{i:0;N;i:1;N;i:2;N;}', 82, 2016),
(4899, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 82, 2017),
(4900, 'a:12:{i:0;s:3:\"520\";i:1;s:3:\"520\";i:2;s:3:\"500\";i:3;s:3:\"500\";i:4;s:3:\"550\";i:5;s:3:\"500\";i:6;s:4:\"5000\";i:7;s:3:\"500\";i:8;s:3:\"400\";i:9;s:3:\"500\";i:10;s:3:\"500\";i:11;s:3:\"500\";}', 81, 2018),
(4901, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 82, 2018),
(4905, 'a:3:{i:0;N;i:1;N;i:2;N;}', 82, 2019),
(4906, 'a:4:{i:0;N;i:1;N;i:2;N;i:3;N;}', 81, 2020),
(4907, 'a:3:{i:0;N;i:1;N;i:2;N;}', 82, 2020),
(4903, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 83, 2017),
(4904, 'a:4:{i:0;N;i:1;N;i:2;N;i:3;N;}', 81, 2019),
(4902, 'a:12:{i:0;s:3:\"550\";i:1;s:3:\"500\";i:2;s:3:\"500\";i:3;s:3:\"500\";i:4;s:3:\"500\";i:5;s:3:\"500\";i:6;s:3:\"500\";i:7;s:3:\"500\";i:8;s:3:\"500\";i:9;s:3:\"500\";i:10;s:3:\"500\";i:11;s:3:\"500\";}', 83, 2018),
(4919, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 86, 2017),
(4920, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 86, 2018),
(4921, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 87, 2017),
(4922, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 87, 2018),
(4923, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 88, 2017),
(4924, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 88, 2018),
(4925, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 89, 2017),
(4926, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 89, 2018),
(4927, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 90, 2017),
(4928, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 90, 2018),
(4929, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 91, 2017),
(4930, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 91, 2018),
(4931, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 92, 2017),
(4932, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 92, 2018),
(4933, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 93, 2017),
(4934, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 93, 2018),
(4935, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 94, 2018),
(4936, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 95, 2018),
(4937, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 96, 2018),
(4938, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 97, 2018),
(4939, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 101, 2018),
(4940, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 102, 2017),
(4941, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 102, 2018),
(4942, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 103, 2017),
(4943, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 103, 2018),
(4944, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 104, 2017),
(4945, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 104, 2018),
(4946, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 105, 2017),
(4947, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 105, 2018),
(4948, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 106, 2017),
(4949, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 106, 2018),
(4950, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 107, 2017),
(4951, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 107, 2018),
(4952, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 108, 2017),
(4953, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 108, 2018),
(4954, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 109, 2017),
(4955, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 109, 2018),
(4956, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 110, 2017),
(4957, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 110, 2018),
(4958, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 111, 2017),
(4959, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 111, 2018),
(4960, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 112, 2017),
(4961, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 112, 2018),
(4962, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 113, 2017),
(4963, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 113, 2018),
(4964, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 114, 2017),
(4965, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 114, 2018),
(4966, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 115, 2017),
(4967, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 115, 2018),
(4968, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 116, 2017),
(4969, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 116, 2018),
(4970, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 117, 2017),
(4971, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 117, 2018),
(4972, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 118, 2017),
(4973, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 118, 2018),
(4974, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 119, 2017),
(4975, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 119, 2018),
(4976, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 120, 2017),
(4977, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 120, 2018),
(4978, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 121, 2017),
(4979, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 121, 2018),
(4980, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 122, 2017),
(4981, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 122, 2018),
(4982, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 123, 2017),
(4983, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 123, 2018),
(4984, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 124, 2017),
(4985, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 124, 2018),
(4986, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 125, 2017),
(4987, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 125, 2018),
(4988, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 126, 2017),
(4989, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 126, 2018),
(4990, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 127, 2017),
(4991, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 127, 2018),
(4992, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 128, 2017),
(4993, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 128, 2018),
(4994, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 129, 2017),
(4995, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 129, 2018),
(4996, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 130, 2017),
(4997, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 130, 2018),
(4998, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 131, 2017),
(4999, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 131, 2018),
(5000, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 132, 2017),
(5001, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 132, 2018),
(5002, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 133, 2017),
(5003, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 133, 2018),
(5004, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 134, 2017),
(5005, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 134, 2018),
(5006, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 135, 2017),
(5007, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 135, 2018),
(5008, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 136, 2017),
(5009, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 136, 2018),
(5010, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 137, 2017),
(5011, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 137, 2018),
(5012, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 138, 2017),
(5013, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 138, 2018),
(5014, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 139, 2017),
(5015, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 139, 2018),
(5016, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 140, 2017),
(5017, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 140, 2018),
(5018, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 141, 2017),
(5019, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 141, 2018),
(5020, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 142, 2017),
(5021, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 142, 2018),
(5022, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 143, 2017),
(5023, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 143, 2018),
(5024, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 144, 2017),
(5025, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 144, 2018),
(5026, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 145, 2017),
(5027, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 145, 2018),
(5028, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 146, 2017),
(5029, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 146, 2018),
(5030, 'a:12:{i:0;i:300;i:1;i:300;i:2;i:300;i:3;i:300;i:4;i:300;i:5;i:300;i:6;i:300;i:7;i:300;i:8;i:300;i:9;i:300;i:10;i:300;i:11;i:300;}', 147, 2017),
(5031, 'a:12:{i:0;i:500;i:1;i:500;i:2;i:500;i:3;i:500;i:4;i:500;i:5;i:500;i:6;i:500;i:7;i:500;i:8;i:500;i:9;i:500;i:10;i:500;i:11;i:500;}', 147, 2018);

-- --------------------------------------------------------

--
-- Table structure for table `uf_bill_transactions`
--

CREATE TABLE `uf_bill_transactions` (
  `id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `bill_year_month` varchar(100) NOT NULL,
  `bill_old_amount` int(255) NOT NULL,
  `bill_new_amount` int(255) NOT NULL,
  `admin_transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `executed_by` varchar(50) NOT NULL,
  `bill_note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uf_bill_transactions`
--

INSERT INTO `uf_bill_transactions` (`id`, `unit_id`, `bill_year_month`, `bill_old_amount`, `bill_new_amount`, `admin_transaction_date`, `executed_by`, `bill_note`) VALUES
(2, 81, 'Jan-2018', 500, 520, '2018-03-27 07:14:07', '1', 'no reason'),
(3, 81, 'Sep-2018', 500, 400, '2018-03-27 07:14:07', '1', 'because'),
(4, 83, 'Jan-2018', 500, 550, '2018-03-27 07:26:36', '1', 'asd'),
(5, 81, 'May-2018', 500, 550, '2018-03-27 11:05:15', '1', ''),
(6, 81, 'Jul-2018', 500, 5000, '2018-03-27 11:05:15', '1', '');

-- --------------------------------------------------------

--
-- Table structure for table `uf_configuration`
--

CREATE TABLE `uf_configuration` (
  `id` int(10) UNSIGNED NOT NULL,
  `plugin` varchar(50) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The name of the plugin that manages this setting (set to ''''userfrosting'''' for core settings)',
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'The name of the setting.',
  `value` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'The current value of the setting.',
  `description` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'A brief description of this setting.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uf_configuration`
--

INSERT INTO `uf_configuration` (`id`, `plugin`, `name`, `value`, `description`) VALUES
(1, 'userfrosting', 'site_title', 'Rawabi HOA', 'The title of the site.  By default, displayed in the title tag, as well as the upper left corner of every user page.'),
(2, 'userfrosting', 'admin_email', 'a.y.rizeq@gmail.com', 'The administrative email for the site.  Automated emails, such as verification emails and password reset links, will come from this address.'),
(3, 'userfrosting', 'email_login', '1', 'Specify whether users can login via email address or username instead of just username.'),
(4, 'userfrosting', 'can_register', '1', 'Specify whether public registration of new accounts is enabled.  Enable if you have a service that users can sign up for, disable if you only want accounts to be created by you or an admin.'),
(5, 'userfrosting', 'enable_captcha', '1', 'Specify whether new users must complete a captcha code when registering for an account.'),
(6, 'userfrosting', 'require_activation', '1', 'Specify whether email verification is required for newly registered accounts.  Accounts created by another user never need to be verified.'),
(7, 'userfrosting', 'resend_activation_threshold', '0', 'The time, in seconds, that a user must wait before requesting that the account verification email be resent.'),
(8, 'userfrosting', 'reset_password_timeout', '10800', 'The time, in seconds, before a user\'s password reset token expires.'),
(9, 'userfrosting', 'create_password_expiration', '86400', 'The time, in seconds, before a new user\'s password creation token expires.'),
(10, 'userfrosting', 'default_locale', 'en_US', 'The default language for newly registered users.'),
(11, 'userfrosting', 'guest_theme', 'default', 'The template theme to use for unauthenticated (guest) users.'),
(12, 'userfrosting', 'minify_css', '0', 'Specify whether to use concatenated, minified CSS (production) or raw CSS includes (dev).'),
(13, 'userfrosting', 'minify_js', '0', 'Specify whether to use concatenated, minified JS (production) or raw JS includes (dev).'),
(14, 'userfrosting', 'version', '0.3.1.23', 'The current version of UserFrosting.'),
(15, 'userfrosting', 'author', 'Abdallah', 'The author of the site.  Will be used in the site\'s author meta tag.'),
(16, 'userfrosting', 'show_terms_on_register', '1', 'Specify whether or not to show terms and conditions when registering.'),
(17, 'userfrosting', 'site_location', 'Rawabi', 'The nation or state in which legal jurisdiction for this site falls.'),
(18, 'userfrosting', 'install_status', 'complete', ''),
(19, 'userfrosting', 'root_account_config_token', '', ''),
(20, 'userfrosting', 'email_host', 'smtp.gmail.com', ''),
(21, 'userfrosting', 'email_port', '587', ''),
(22, 'userfrosting', 'email_secure', 'tls', ''),
(23, 'userfrosting', 'email_username', 'asal2test@gmail.com', ''),
(24, 'userfrosting', 'email_pass', 'Asal@111', ''),
(25, 'userfrosting', 'email_auth', '1', ''),
(26, 'userfrosting', 'about_us_content', 'aboutTextContent.txt', ''),
(27, 'userfrosting', 'about_us_pic_path', 'images/about/5a8920b7a24590.664669001518936247_aboutusmottoheader.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `uf_files`
--

CREATE TABLE `uf_files` (
  `id` int(11) NOT NULL,
  `file_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `uploaded` date NOT NULL,
  `Neighborhood` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT 'All',
  `PostedDate` date NOT NULL,
  `visible` int(1) NOT NULL DEFAULT '1',
  `DisplayName` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uf_files`
--

INSERT INTO `uf_files` (`id`, `file_name`, `uploaded`, `Neighborhood`, `PostedDate`, `visible`, `DisplayName`) VALUES
(401, '1519044186_123.png', '2018-02-19', 'All', '2017-10-04', 1, '123Photo'),
(402, '1519046891_aaafs.png', '2018-02-19', '2', '2017-09-05', 1, 'Photo test12'),
(404, '1519111214_Rawabi_HOA_Project_Plan.docx', '2018-02-20', '5', '2023-02-20', 1, 'روابي'),
(405, '1519231005_Quadratic.xlsx', '2018-02-21', '4', '2018-02-21', 0, 'Rawabi  Project');

-- --------------------------------------------------------

--
-- Table structure for table `uf_fixed_bills`
--

CREATE TABLE `uf_fixed_bills` (
  `id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `fixedBillAmount` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uf_fixed_bills_operations`
--

CREATE TABLE `uf_fixed_bills_operations` (
  `id` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `billAmount` int(11) NOT NULL,
  `extraFees` int(11) NOT NULL,
  `interestAmount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uf_fixed_bills_operations`
--

INSERT INTO `uf_fixed_bills_operations` (`id`, `year`, `billAmount`, `extraFees`, `interestAmount`) VALUES
(7, 2018, 500, 0, 0),
(8, 2017, 300, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `uf_group`
--

CREATE TABLE `uf_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Specifies whether this permission is a default setting for new accounts.',
  `can_delete` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Specifies whether this permission can be deleted from the control panel.',
  `theme` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default' COMMENT 'The theme assigned to primary users in this group.',
  `landing_page` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'dashboard' COMMENT 'The page to take primary members to when they first log in.',
  `new_user_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'New User' COMMENT 'The default title to assign to new primary users.',
  `icon` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'fa fa-user' COMMENT 'The icon representing primary users in this group.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uf_group`
--

INSERT INTO `uf_group` (`id`, `name`, `is_default`, `can_delete`, `theme`, `landing_page`, `new_user_title`, `icon`) VALUES
(1, 'User', 2, 0, 'default', 'payments', 'New User', 'fa fa-user'),
(2, 'Administrator', 0, 0, 'root', 'unit', 'Brood Spawn', 'fa fa-flag');

-- --------------------------------------------------------

--
-- Table structure for table `uf_group_user`
--

CREATE TABLE `uf_group_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uf_group_user`
--

INSERT INTO `uf_group_user` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 2),
(2, 2, 2),
(4, 4, 1),
(8, 8, 1),
(9, 9, 1),
(17, 17, 1),
(18, 48, 1);

-- --------------------------------------------------------

--
-- Table structure for table `uf_neighborhood`
--

CREATE TABLE `uf_neighborhood` (
  `id` int(11) NOT NULL,
  `neighborhood_en` varchar(255) NOT NULL,
  `neighborhood_ar` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `uf_neighborhood`
--

INSERT INTO `uf_neighborhood` (`id`, `neighborhood_en`, `neighborhood_ar`) VALUES
(2, 'Suwan', 'صوان'),
(3, 'Warwar', 'وروار'),
(4, 'Makmata', 'مكمته'),
(5, 'Dulaim', 'دوليم');

-- --------------------------------------------------------

--
-- Table structure for table `uf_owner`
--

CREATE TABLE `uf_owner` (
  `id` int(11) NOT NULL,
  `name` varchar(500) CHARACTER SET utf8 NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `uf_payments`
--

CREATE TABLE `uf_payments` (
  `id` int(11) NOT NULL,
  `payment_Amount` text CHARACTER SET utf8 NOT NULL,
  `unit_id` int(11) DEFAULT NULL,
  `year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uf_payments`
--

INSERT INTO `uf_payments` (`id`, `payment_Amount`, `unit_id`, `year`) VALUES
(1, 'a:12:{i:0;s:2:\"15\";i:1;s:1:\"0\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"0\";i:5;s:1:\"0\";i:6;s:1:\"0\";i:7;s:1:\"0\";i:8;s:1:\"0\";i:9;s:1:\"0\";i:10;s:1:\"0\";i:11;s:1:\"0\";}', 82, 2018),
(2, 'a:12:{i:0;s:3:\"321\";i:1;s:1:\"0\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"0\";i:5;s:1:\"0\";i:6;s:1:\"0\";i:7;s:1:\"0\";i:8;s:1:\"0\";i:9;s:1:\"0\";i:10;s:1:\"0\";i:11;s:1:\"0\";}', 83, 2018),
(3, 'a:12:{i:0;s:2:\"10\";i:1;s:1:\"0\";i:2;s:1:\"0\";i:3;s:1:\"0\";i:4;s:1:\"0\";i:5;s:1:\"0\";i:6;s:1:\"0\";i:7;s:1:\"0\";i:8;s:1:\"0\";i:9;s:1:\"0\";i:10;s:1:\"0\";i:11;s:1:\"0\";}', 81, 2018);

-- --------------------------------------------------------

--
-- Table structure for table `uf_payment_transactions`
--

CREATE TABLE `uf_payment_transactions` (
  `id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `amount` int(255) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `payment_number` int(255) NOT NULL,
  `payment_note` text NOT NULL,
  `executed_by` int(10) NOT NULL,
  `admin_transaction_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `payment_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uf_payment_transactions`
--

INSERT INTO `uf_payment_transactions` (`id`, `unit_id`, `amount`, `payment_date`, `payment_type`, `payment_number`, `payment_note`, `executed_by`, `admin_transaction_date`, `payment_year`) VALUES
(2, 81, 95, '2018-03-25', 'Cash', 0, '', 1, '2018-03-25 07:20:06', 2018),
(3, 82, 31, '2018-03-24', 'Direct deposit', 2131241, '', 1, '2018-03-25 07:20:42', 2018),
(4, 82, 45, '2018-03-25', 'Cash', 24234, 'dsafdsafasdf', 1, '2018-03-25 07:21:02', 2018),
(5, 81, 350, '2018-03-25', 'Cash', 0, '', 1, '2018-03-25 08:43:38', 2017),
(6, 82, 15, '2018-03-27', 'Check', 741852963, 'how', 1, '2018-03-27 06:39:42', 2018),
(7, 83, 321, '2018-03-27', 'Cash', 0, '', 1, '2018-03-27 07:14:47', 2018),
(8, 81, 10, '2018-03-27', 'Check', 14568, 'test payment', 1, '2018-03-27 11:05:15', 2018);

-- --------------------------------------------------------

--
-- Table structure for table `uf_tickets`
--

CREATE TABLE `uf_tickets` (
  `id` int(10) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` text CHARACTER SET utf8 NOT NULL,
  `feedback` text CHARACTER SET utf8 NOT NULL,
  `status` varchar(20) NOT NULL DEFAULT 'open',
  `sent_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `feedback_sent_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uf_tickets`
--

INSERT INTO `uf_tickets` (`id`, `user_id`, `message`, `feedback`, `status`, `sent_at`, `feedback_sent_at`) VALUES
(9, 17, 'test complaint', 'no', 'closed', '2018-02-20 07:01:40', '2018-03-01 07:29:17'),
(10, 17, 'ndafkahsdjhdjasihfjdahsijasdajfdalijhf', 'yes', 'in_progress', '2018-02-20 07:59:19', '2018-03-01 07:30:13'),
(13, 17, 'my name is  abd. my name is  abbbd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. my name is  abd. ', 'too long didn\'t read', 'open', '2018-02-20 09:58:06', '2018-03-01 10:44:24'),
(20, 17, 'closed test', 'test_reponse', 'closed', '2018-02-22 08:35:40', '2018-03-01 07:22:47'),
(23, 17, 'مرحبا يا قوم', '-', 'open', '2018-02-22 10:02:53', NULL),
(25, 17, 'هيا بنا', 'closed complaint', 'closed', '2018-02-22 11:20:20', '2018-02-28 05:04:20'),
(27, 17, 'test progress', 'feedback test', 'in_progress', '2018-02-22 12:29:53', '2018-03-01 07:22:25'),
(31, 17, 'final test', 'hmmmm', 'open', '2018-02-22 12:54:56', '2018-03-01 07:05:23'),
(35, 17, 'another final test', 'this task was moved to in progress', 'in_progress', '2018-02-22 13:30:32', '2018-02-28 05:03:55'),
(39, 49, 'my complaint abada', '-', 'open', '2018-02-28 05:02:30', NULL),
(40, 17, 'pls answer', 'no', 'open', '2018-03-01 10:44:48', '2018-03-15 09:48:48');

-- --------------------------------------------------------

--
-- Table structure for table `uf_transactions`
--

CREATE TABLE `uf_transactions` (
  `id` int(11) NOT NULL,
  `transaction_Type` varchar(255) CHARACTER SET utf8 NOT NULL,
  `admin_transaction_date` datetime NOT NULL,
  `unit_id` int(11) NOT NULL,
  `payment_number` int(255) NOT NULL,
  `payment_type` varchar(255) CHARACTER SET utf8 NOT NULL,
  `payment_Date` date NOT NULL,
  `payment_Amount` int(255) NOT NULL,
  `payment_due_date` date NOT NULL,
  `bills_Note` text CHARACTER SET utf8 NOT NULL,
  `payment_Note` text CHARACTER SET utf8 NOT NULL,
  `done_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uf_transactions`
--

INSERT INTO `uf_transactions` (`id`, `transaction_Type`, `admin_transaction_date`, `unit_id`, `payment_number`, `payment_type`, `payment_Date`, `payment_Amount`, `payment_due_date`, `bills_Note`, `payment_Note`, `done_by`) VALUES
(1, 'bill', '2018-03-22 11:03:03', 81, 0, '', '0000-00-00', 520, '2018-12-01', '', '', 'admin'),
(2, 'payment', '2018-03-22 11:03:03', 81, 0, '', '0000-00-00', 253, '2018-09-01', '', '', 'admin'),
(3, 'bill', '2018-03-22 11:03:58', 81, 0, '', '0000-00-00', 501, '2018-09-01', '', '', 'admin'),
(4, 'bill', '2018-03-22 11:03:58', 81, 0, '', '0000-00-00', 505, '2018-11-01', '', '', 'admin'),
(5, 'bill', '2018-03-22 11:03:58', 81, 0, '', '0000-00-00', 524, '2018-12-01', '', '', 'admin'),
(6, 'payment', '2018-03-22 11:03:58', 81, 0, '', '0000-00-00', 378, '2018-09-01', '', '', 'admin'),
(7, 'bill', '2018-03-22 11:03:15', 81, 0, '', '0000-00-00', 522, '2018-12-01', '', '', 'admin'),
(8, 'bill', '2018-03-22 11:03:33', 81, 0, '', '0000-00-00', 521, '2018-12-01', '', '', 'admin'),
(9, 'payment', '2018-03-22 11:03:33', 81, 0, '', '0000-00-00', 300, '2018-09-01', '', '', 'admin'),
(10, 'bill', '2018-03-22 11:03:25', 82, 0, '', '0000-00-00', 350, '2018-12-01', '', '', 'admin'),
(11, 'payment', '2018-03-22 11:03:25', 82, 0, '', '0000-00-00', 300, '2018-01-01', '', '', 'admin'),
(12, 'payment', '2018-03-22 11:03:25', 82, 0, '', '0000-00-00', 300, '2018-02-01', '', '', 'admin'),
(13, 'payment', '2018-03-22 11:03:25', 82, 0, '', '0000-00-00', 300, '2018-03-01', '', '', 'admin'),
(14, 'payment', '2018-03-22 11:03:25', 82, 0, '', '0000-00-00', 300, '2018-04-01', '', '', 'admin'),
(15, 'payment', '2018-03-22 11:03:25', 82, 0, '', '0000-00-00', 300, '2018-05-01', '', '', 'admin'),
(16, 'payment', '2018-03-22 11:03:25', 82, 0, '', '0000-00-00', 300, '2018-06-01', '', '', 'admin'),
(17, 'payment', '2018-03-22 11:03:25', 82, 0, '', '0000-00-00', 300, '2018-07-01', '', '', 'admin'),
(18, 'payment', '2018-03-22 11:03:25', 82, 0, '', '0000-00-00', 300, '2018-08-01', '', '', 'admin'),
(19, 'payment', '2018-03-22 11:03:25', 82, 0, '', '0000-00-00', 300, '2018-09-01', '', '', 'admin'),
(20, 'payment', '2018-03-22 11:03:25', 82, 0, '', '0000-00-00', 300, '2018-10-01', '', '', 'admin'),
(21, 'payment', '2018-03-22 11:03:25', 82, 0, '', '0000-00-00', 300, '2018-11-01', '', '', 'admin'),
(22, 'payment', '2018-03-22 11:03:25', 82, 0, '', '0000-00-00', 200, '2018-12-01', '', '', 'admin'),
(23, 'bill', '2018-03-22 11:03:07', 82, 0, '', '0000-00-00', 300, '2018-12-01', '', '', 'admin'),
(24, 'payment', '2018-03-22 11:03:07', 82, 0, '', '0000-00-00', 300, '2018-01-01', '', '', 'admin'),
(25, 'payment', '2018-03-22 11:03:07', 82, 0, '', '0000-00-00', 300, '2018-02-01', '', '', 'admin'),
(26, 'payment', '2018-03-22 11:03:07', 82, 0, '', '0000-00-00', 300, '2018-03-01', '', '', 'admin'),
(27, 'payment', '2018-03-22 11:03:07', 82, 0, '', '0000-00-00', 300, '2018-04-01', '', '', 'admin'),
(28, 'payment', '2018-03-22 11:03:07', 82, 0, '', '0000-00-00', 300, '2018-05-01', '', '', 'admin'),
(29, 'payment', '2018-03-22 11:03:07', 82, 0, '', '0000-00-00', 300, '2018-06-01', '', '', 'admin'),
(30, 'payment', '2018-03-22 11:03:07', 82, 0, '', '0000-00-00', 300, '2018-07-01', '', '', 'admin'),
(31, 'payment', '2018-03-22 11:03:07', 82, 0, '', '0000-00-00', 300, '2018-08-01', '', '', 'admin'),
(32, 'payment', '2018-03-22 11:03:07', 82, 0, '', '0000-00-00', 300, '2018-09-01', '', '', 'admin'),
(33, 'payment', '2018-03-22 11:03:07', 82, 0, '', '0000-00-00', 300, '2018-10-01', '', '', 'admin'),
(34, 'payment', '2018-03-22 11:03:07', 82, 0, '', '0000-00-00', 300, '2018-11-01', '', '', 'admin'),
(35, 'payment', '2018-03-22 11:03:07', 82, 0, '', '0000-00-00', 200, '2018-12-01', '', '', 'admin'),
(36, 'bill', '2018-03-22 11:03:24', 82, 0, '', '0000-00-00', 350, '2018-12-01', '', '', 'admin'),
(37, 'payment', '2018-03-22 11:03:24', 82, 0, '', '0000-00-00', 300, '2018-01-01', '', '', 'admin'),
(38, 'payment', '2018-03-22 11:03:24', 82, 0, '', '0000-00-00', 300, '2018-02-01', '', '', 'admin'),
(39, 'payment', '2018-03-22 11:03:24', 82, 0, '', '0000-00-00', 300, '2018-03-01', '', '', 'admin'),
(40, 'payment', '2018-03-22 11:03:24', 82, 0, '', '0000-00-00', 300, '2018-04-01', '', '', 'admin'),
(41, 'payment', '2018-03-22 11:03:24', 82, 0, '', '0000-00-00', 300, '2018-05-01', '', '', 'admin'),
(42, 'payment', '2018-03-22 11:03:24', 82, 0, '', '0000-00-00', 300, '2018-06-01', '', '', 'admin'),
(43, 'payment', '2018-03-22 11:03:24', 82, 0, '', '0000-00-00', 300, '2018-07-01', '', '', 'admin'),
(44, 'payment', '2018-03-22 11:03:24', 82, 0, '', '0000-00-00', 300, '2018-08-01', '', '', 'admin'),
(45, 'payment', '2018-03-22 11:03:24', 82, 0, '', '0000-00-00', 300, '2018-09-01', '', '', 'admin'),
(46, 'payment', '2018-03-22 11:03:24', 82, 0, '', '0000-00-00', 300, '2018-10-01', '', '', 'admin'),
(47, 'payment', '2018-03-22 11:03:24', 82, 0, '', '0000-00-00', 300, '2018-11-01', '', '', 'admin'),
(48, 'payment', '2018-03-22 11:03:24', 82, 0, '', '0000-00-00', 200, '2018-12-01', '', '', 'admin'),
(49, 'bill', '2018-03-22 14:03:32', 81, 0, '', '0000-00-00', 530, '2018-12-01', '', '', 'admin'),
(50, 'bill', '2018-03-22 14:03:44', 81, 0, '', '0000-00-00', 531, '2018-12-01', '', '', 'admin'),
(51, 'payment', '2018-03-22 14:03:44', 81, 0, '', '0000-00-00', 351, '2018-09-01', '', '', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `uf_unit`
--

CREATE TABLE `uf_unit` (
  `id` int(11) NOT NULL,
  `building` int(11) NOT NULL,
  `neighborhood` varchar(255) CHARACTER SET utf8 NOT NULL,
  `owner` int(11) DEFAULT NULL,
  `pending_owner` int(11) DEFAULT NULL,
  `dateofres` date NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8 NOT NULL,
  `rawabicode` varchar(255) NOT NULL,
  `topocode` varchar(255) NOT NULL,
  `key_handing` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uf_unit`
--

INSERT INTO `uf_unit` (`id`, `building`, `neighborhood`, `owner`, `pending_owner`, `dateofres`, `phone`, `rawabicode`, `topocode`, `key_handing`) VALUES
(134, 0, '2', NULL, NULL, '2018-06-09', '', '2', '2', '2018-06-15'),
(139, 0, '3', NULL, NULL, '2018-06-15', '', '10', '54', '2018-06-15'),
(140, 0, '2', NULL, NULL, '2018-06-15', '', '55', '54', '2018-06-15'),
(143, 0, '3', NULL, NULL, '2018-06-15', '', '22', '22', '2018-06-06'),
(145, 0, '3', NULL, NULL, '2018-06-09', '', '2', '444', '2018-06-08'),
(146, 0, '3', NULL, NULL, '2018-06-02', '', '43', '32', '2018-06-08'),
(147, 0, '5', NULL, NULL, '2018-06-02', '', '2', '2', '2018-06-06');

-- --------------------------------------------------------

--
-- Table structure for table `uf_user`
--

CREATE TABLE `uf_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `locale` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en_US' COMMENT 'The language and locale to use for this user.',
  `primary_group_id` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'The id of this user''''s primary group.',
  `secret_token` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT 'The current one-time use token for various user activities confirmed via email.',
  `flag_verified` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Set to ''''1'''' if the user has verified their account via email, ''''0'''' otherwise.',
  `flag_enabled` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Set to ''''1'''' if the user''''s account is currently enabled, ''''0'''' otherwise.  Disabled accounts cannot be logged in to, but they retain all of their data and settings.',
  `flag_password_reset` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Set to ''''1'''' if the user has an outstanding password reset request, ''''0'''' otherwise.',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uf_user`
--

INSERT INTO `uf_user` (`id`, `user_name`, `display_name`, `email`, `title`, `locale`, `primary_group_id`, `secret_token`, `flag_verified`, `flag_enabled`, `flag_password_reset`, `created_at`, `updated_at`, `password`, `phone_number`) VALUES
(1, 'admin', 'admin', 'arizeq@asaltech.com', 'New User', 'en_US', 2, '4a2b5a04d757d82ce455e7fe11aa9a25', 1, 1, 0, '2017-07-06 08:11:57', '2017-12-18 12:14:22', '$2y$10$KLR0t4y.gBWVR5.r/34/E.ovoA6dq7.dD0of4Pcx7XZtTN0J6/T2K', ''),
(2, 'ahmad', 'Ahmad', 'user@gmail.com', 'New User', 'en_US', 1, '7c1b97bd0d95fb54794415bb995e6632', 1, 1, 0, '2017-08-21 13:45:17', '2017-11-27 12:49:46', '$2y$10$KLR0t4y.gBWVR5.r/34/E.ovoA6dq7.dD0of4Pcx7XZtTN0J6/T2K', ''),
(17, 'user', 'Mohammad Nazzal', 'alaabatta94@gmail.com', 'New User', 'en_US', 1, '69e724b100bb50d699e69f129dfd6cc6', 1, 1, 0, '2017-10-19 09:37:38', '2017-10-23 12:34:48', '$2y$10$KLR0t4y.gBWVR5.r/34/E.ovoA6dq7.dD0of4Pcx7XZtTN0J6/T2K', ''),
(47, 'omar.shabaro@gmail.com', 'opoi', 'omar.shabaro@gmail.com', 'New User', 'en_US', 1, '32dfe896e11686dbb9d1f1cfbe3b1ea5', 1, 1, 0, '2017-11-22 11:19:14', '2017-12-17 08:07:20', '$2y$10$V/DYDUNk/tnPnFn06czF.uODR1RShypDZdiq7Vz6T1zbRdixMHS32', '56545454656'),
(48, 'sameh', 'sameh firehat', 'sameh@asaltech.com', 'New User', 'en_US', 1, '6b5d38f4f9d6cb3c10af8946963ed8b2', 1, 1, 1, '2017-12-17 08:42:06', '2017-12-17 08:42:30', '', ''),
(49, 'abda', 'abdallah', 'arizeq@gmail.com', 'New User', 'en_US', 1, 'ac0b995ec8a2f6dcfe83ce0b39da98cf', 1, 1, 1, '2017-12-18 09:37:00', '2017-12-20 18:09:18', '$2y$10$Fzib173gPSWTwucKVvwAPOlFSyY69ujbTBR9EekAdHpXu1B43sIT.', '');

-- --------------------------------------------------------

--
-- Table structure for table `uf_user_event`
--

CREATE TABLE `uf_user_event` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `event_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'An identifier used to track the type of event.',
  `occurred_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `uf_user_event`
--

INSERT INTO `uf_user_event` (`id`, `user_id`, `event_type`, `occurred_at`, `description`) VALUES
(1, 1, 'sign_up', '2017-07-06 08:11:57', 'User abda successfully registered on 2017-07-06 11:11:57.'),
(2, 1, 'sign_in', '2017-07-06 08:12:56', 'User abda signed in at 2017-07-06 11:12:56.'),
(3, 2, 'sign_up', '2017-07-09 07:15:32', 'User user successfully registered on 2017-07-09 10:15:32.'),
(4, 2, 'verification_request', '2017-07-09 07:15:32', 'User user requested verification on 2017-07-09 10:15:32.'),
(5, 2, 'sign_in', '2017-07-09 07:16:13', 'User user signed in at 2017-07-09 10:16:13.'),
(6, 2, 'sign_in', '2017-07-09 07:19:49', 'User user signed in at 2017-07-09 10:19:49.'),
(7, 2, 'sign_in', '2017-07-09 07:24:00', 'User user signed in at 2017-07-09 10:24:00.'),
(8, 2, 'password_reset_request', '2017-07-09 07:26:16', 'User user requested a password reset on 2017-07-09 10:26:16.'),
(9, 1, 'password_reset_request', '2017-07-09 07:26:34', 'User abda requested a password reset on 2017-07-09 10:26:34.'),
(10, 2, 'sign_in', '2017-07-09 07:27:10', 'User user signed in at 2017-07-09 10:27:10.'),
(11, 2, 'sign_in', '2017-07-09 08:12:04', 'User user signed in at 2017-07-09 11:12:04.'),
(12, 2, 'password_reset_request', '2017-07-09 08:18:04', 'User user requested a password reset on 2017-07-09 11:18:04.'),
(13, 2, 'sign_in', '2017-07-09 08:18:31', 'User user signed in at 2017-07-09 11:18:31.'),
(14, 1, 'password_reset_request', '2017-07-09 08:19:40', 'User abda requested a password reset on 2017-07-09 11:19:40.'),
(15, 2, 'sign_in', '2017-07-09 08:21:20', 'User user signed in at 2017-07-09 11:21:20.'),
(16, 1, 'password_reset_request', '2017-07-09 08:41:26', 'User abda requested a password reset on 2017-07-09 11:41:26.'),
(17, 1, 'sign_in', '2017-07-09 08:42:20', 'User abda signed in at 2017-07-09 11:42:20.'),
(18, 1, 'sign_in', '2017-07-09 08:42:30', 'User abda signed in at 2017-07-09 11:42:30.'),
(19, 2, 'sign_in', '2017-07-09 08:42:45', 'User user signed in at 2017-07-09 11:42:45.'),
(20, 1, 'sign_in', '2017-07-09 08:42:53', 'User abda signed in at 2017-07-09 11:42:53.'),
(21, 2, 'sign_in', '2017-07-09 10:55:52', 'User user signed in at 2017-07-09 13:55:52.'),
(22, 2, 'sign_in', '2017-07-09 12:12:59', 'User user signed in at 2017-07-09 15:12:59.'),
(23, 2, 'sign_in', '2017-07-09 12:22:09', 'User user signed in at 2017-07-09 15:22:09.'),
(24, 2, 'sign_in', '2017-07-09 12:49:50', 'User user signed in at 2017-07-09 15:49:50.'),
(25, 2, 'sign_in', '2017-07-09 13:17:05', 'User user signed in at 2017-07-09 16:17:05.'),
(26, 2, 'sign_in', '2017-07-09 14:30:10', 'User user signed in at 2017-07-09 17:30:10.'),
(27, 2, 'sign_in', '2017-07-09 15:46:49', 'User user signed in at 2017-07-09 18:46:49.'),
(28, 2, 'sign_in', '2017-07-09 20:02:53', 'User user signed in at 2017-07-09 23:02:53.'),
(29, 2, 'sign_in', '2017-07-09 20:04:42', 'User user signed in at 2017-07-09 23:04:42.'),
(30, 2, 'sign_in', '2017-07-10 06:51:10', 'User user signed in at 2017-07-10 09:51:10.'),
(31, 2, 'sign_in', NULL, 'User user signed in at 2017-07-10 09:59:50.'),
(32, 2, 'sign_in', '2017-07-10 07:01:19', 'User user signed in at 2017-07-10 10:01:19.'),
(33, 2, 'sign_in', '2017-07-10 07:20:46', 'User user signed in at 2017-07-10 10:20:46.'),
(34, 2, 'sign_in', '2017-07-10 08:13:00', 'User user signed in at 2017-07-10 11:13:00.'),
(35, 2, 'sign_in', '2017-07-10 08:29:59', 'User user signed in at 2017-07-10 11:29:59.'),
(36, 2, 'sign_in', '2017-07-10 09:02:08', 'User user signed in at 2017-07-10 12:02:08.'),
(37, 2, 'sign_in', '2017-07-10 09:03:07', 'User user signed in at 2017-07-10 12:03:07.'),
(38, 2, 'sign_in', '2017-07-10 10:28:50', 'User user signed in at 2017-07-10 13:28:50.'),
(39, 2, 'sign_in', '2017-07-10 10:28:56', 'User user signed in at 2017-07-10 13:28:56.'),
(40, 2, 'sign_in', '2017-07-10 10:44:09', 'User user signed in at 2017-07-10 13:44:09.'),
(41, 2, 'sign_in', '2017-07-10 11:07:39', 'User user signed in at 2017-07-10 14:07:39.'),
(42, 2, 'sign_in', '2017-07-10 11:43:21', 'User user signed in at 2017-07-10 14:43:21.'),
(43, 2, 'sign_in', '2017-07-10 11:56:08', 'User user signed in at 2017-07-10 14:56:08.'),
(44, 2, 'sign_in', '2017-07-10 13:06:54', 'User user signed in at 2017-07-10 16:06:54.'),
(45, 2, 'sign_in', '2017-07-10 13:49:23', 'User user signed in at 2017-07-10 16:49:23.'),
(46, 2, 'sign_in', '2017-07-10 16:25:21', 'User user signed in at 2017-07-10 19:25:21.'),
(47, 2, 'sign_in', '2017-07-10 16:26:10', 'User user signed in at 2017-07-10 19:26:10.'),
(48, 1, 'sign_in', '2017-07-10 17:15:43', 'User abda signed in at 2017-07-10 20:15:43.'),
(49, 1, 'sign_in', '2017-07-10 17:16:20', 'User abda signed in at 2017-07-10 20:16:20.'),
(50, 2, 'sign_in', '2017-07-10 17:16:34', 'User user signed in at 2017-07-10 20:16:34.'),
(51, 2, 'sign_in', '2017-07-10 17:44:34', 'User user signed in at 2017-07-10 20:44:34.'),
(52, 2, 'sign_in', '2017-07-10 17:52:23', 'User user signed in at 2017-07-10 20:52:23.'),
(53, 1, 'sign_in', '2017-07-10 17:52:45', 'User abda signed in at 2017-07-10 20:52:45.'),
(54, 2, 'sign_in', '2017-07-10 17:56:25', 'User user signed in at 2017-07-10 20:56:25.'),
(55, 2, 'sign_in', '2017-07-10 17:58:20', 'User user signed in at 2017-07-10 20:58:20.'),
(56, 2, 'sign_in', '2017-07-10 18:07:23', 'User user signed in at 2017-07-10 21:07:23.'),
(57, 2, 'sign_in', '2017-07-10 18:07:33', 'User user signed in at 2017-07-10 21:07:33.'),
(58, 1, 'sign_in', '2017-07-10 18:07:47', 'User abda signed in at 2017-07-10 21:07:47.'),
(59, 2, 'sign_in', '2017-07-10 18:57:14', 'User user signed in at 2017-07-10 21:57:14.'),
(60, 2, 'sign_in', '2017-07-10 19:10:01', 'User user signed in at 2017-07-10 22:10:01.'),
(61, 2, 'sign_in', '2017-07-10 19:10:52', 'User user signed in at 2017-07-10 22:10:52.'),
(62, 1, 'sign_in', '2017-07-10 20:13:18', 'User abda signed in at 2017-07-10 23:13:18.'),
(63, 2, 'sign_in', '2017-07-10 20:29:22', 'User user signed in at 2017-07-10 23:29:22.'),
(64, 1, 'sign_in', '2017-07-10 20:30:45', 'User abda signed in at 2017-07-10 23:30:45.'),
(65, 2, 'sign_in', '2017-07-10 20:31:47', 'User user signed in at 2017-07-10 23:31:47.'),
(66, 2, 'sign_in', '2017-07-10 20:42:01', 'User user signed in at 2017-07-10 23:42:01.'),
(67, 2, 'sign_in', '2017-07-10 20:57:20', 'User user signed in at 2017-07-10 23:57:20.'),
(68, 1, 'sign_in', '2017-07-10 20:59:16', 'User abda signed in at 2017-07-10 23:59:16.'),
(69, 2, 'sign_in', '2017-07-11 07:00:45', 'User user signed in at 2017-07-11 10:00:45.'),
(70, 1, 'sign_in', '2017-07-11 07:02:00', 'User abda signed in at 2017-07-11 10:02:00.'),
(71, 2, 'sign_in', '2017-07-11 07:13:30', 'User user signed in at 2017-07-11 10:13:30.'),
(72, 2, 'sign_in', '2017-07-11 07:13:35', 'User user signed in at 2017-07-11 10:13:35.'),
(73, 2, 'sign_in', '2017-07-11 07:13:42', 'User user signed in at 2017-07-11 10:13:42.'),
(74, 2, 'sign_in', '2017-07-11 07:19:08', 'User user signed in at 2017-07-11 10:19:08.'),
(75, 1, 'sign_in', '2017-07-11 07:19:20', 'User abda signed in at 2017-07-11 10:19:20.'),
(76, 2, 'sign_in', '2017-07-11 08:07:22', 'User user signed in at 2017-07-11 11:07:22.'),
(77, 1, 'sign_in', '2017-07-11 08:15:27', 'User abda signed in at 2017-07-11 11:15:27.'),
(78, 2, 'sign_in', '2017-07-11 08:24:47', 'User user signed in at 2017-07-11 11:24:47.'),
(79, 1, 'sign_in', '2017-07-11 08:25:03', 'User abda signed in at 2017-07-11 11:25:03.'),
(80, 2, 'sign_in', '2017-07-11 08:39:13', 'User user signed in at 2017-07-11 11:39:13.'),
(81, 1, 'sign_in', '2017-07-11 08:39:48', 'User abda signed in at 2017-07-11 11:39:48.'),
(82, 2, 'sign_in', '2017-07-11 08:44:42', 'User user signed in at 2017-07-11 11:44:42.'),
(83, 1, 'sign_in', '2017-07-11 08:44:52', 'User abda signed in at 2017-07-11 11:44:52.'),
(84, 2, 'sign_in', '2017-07-11 11:56:41', 'User user signed in at 2017-07-11 14:56:41.'),
(85, 1, 'sign_in', '2017-07-11 11:56:52', 'User abda signed in at 2017-07-11 14:56:52.'),
(86, 2, 'sign_in', '2017-07-11 12:35:52', 'User user signed in at 2017-07-11 15:35:52.'),
(87, 1, 'sign_in', '2017-07-11 12:36:00', 'User abda signed in at 2017-07-11 15:36:00.'),
(88, 2, 'sign_in', '2017-07-11 13:17:20', 'User user signed in at 2017-07-11 16:17:20.'),
(89, 2, 'sign_in', '2017-07-11 13:27:47', 'User user signed in at 2017-07-11 16:27:47.'),
(90, 2, 'sign_in', '2017-07-11 13:27:51', 'User user signed in at 2017-07-11 16:27:51.'),
(91, 1, 'sign_in', '2017-07-11 13:27:59', 'User abda signed in at 2017-07-11 16:27:59.'),
(92, 2, 'sign_in', '2017-07-11 13:28:04', 'User user signed in at 2017-07-11 16:28:04.'),
(93, 1, 'sign_in', '2017-07-11 13:29:33', 'User abda signed in at 2017-07-11 16:29:33.'),
(94, 2, 'sign_in', '2017-07-11 13:29:39', 'User user signed in at 2017-07-11 16:29:39.'),
(95, 1, 'sign_in', '2017-07-11 13:33:35', 'User abda signed in at 2017-07-11 16:33:35.'),
(96, 2, 'sign_in', '2017-07-11 13:33:42', 'User user signed in at 2017-07-11 16:33:42.'),
(97, 2, 'sign_in', '2017-07-11 13:35:24', 'User user signed in at 2017-07-11 16:35:24.'),
(98, 1, 'sign_in', '2017-07-11 13:35:30', 'User abda signed in at 2017-07-11 16:35:30.'),
(99, 2, 'sign_in', '2017-07-11 13:35:39', 'User user signed in at 2017-07-11 16:35:39.'),
(100, 2, 'sign_in', '2017-07-11 13:40:30', 'User user signed in at 2017-07-11 16:40:30.'),
(101, 1, 'sign_in', '2017-07-11 14:00:31', 'User abda signed in at 2017-07-11 17:00:31.'),
(102, 2, 'sign_in', '2017-07-11 14:00:52', 'User user signed in at 2017-07-11 17:00:52.'),
(103, 1, 'sign_in', '2017-07-11 14:01:10', 'User abda signed in at 2017-07-11 17:01:10.'),
(104, 2, 'sign_in', '2017-07-11 18:36:03', 'User user signed in at 2017-07-11 21:36:03.'),
(105, 1, 'sign_in', '2017-07-11 18:36:36', 'User abda signed in at 2017-07-11 21:36:36.'),
(106, 2, 'sign_in', '2017-07-11 18:36:55', 'User user signed in at 2017-07-11 21:36:55.'),
(107, 1, 'sign_in', '2017-07-11 18:38:57', 'User abda signed in at 2017-07-11 21:38:57.'),
(108, 2, 'sign_in', '2017-07-11 18:40:22', 'User user signed in at 2017-07-11 21:40:22.'),
(109, 2, 'sign_in', '2017-07-11 18:40:39', 'User user signed in at 2017-07-11 21:40:39.'),
(110, 1, 'sign_in', '2017-07-11 18:40:46', 'User abda signed in at 2017-07-11 21:40:46.'),
(111, 2, 'sign_in', '2017-07-11 19:26:19', 'User user signed in at 2017-07-11 22:26:19.'),
(112, 1, 'sign_in', '2017-07-12 08:49:41', 'User abda signed in at 2017-07-12 11:49:41.'),
(113, 2, 'sign_in', '2017-07-12 14:06:38', 'User user signed in at 2017-07-12 17:06:38.'),
(114, 2, 'sign_in', '2017-07-12 14:06:49', 'User user signed in at 2017-07-12 17:06:49.'),
(115, 1, 'sign_in', '2017-07-12 14:06:56', 'User abda signed in at 2017-07-12 17:06:56.'),
(116, 2, 'sign_in', '2017-07-12 16:18:42', 'User user signed in at 2017-07-12 19:18:42.'),
(117, 2, 'sign_in', '2017-07-12 16:24:21', 'User user signed in at 2017-07-12 19:24:21.'),
(118, 1, 'sign_in', '2017-07-12 16:24:27', 'User abda signed in at 2017-07-12 19:24:27.'),
(119, 2, 'sign_in', '2017-07-12 19:40:12', 'User user signed in at 2017-07-12 22:40:12.'),
(120, 2, 'sign_in', '2017-07-12 19:40:29', 'User user signed in at 2017-07-12 22:40:29.'),
(121, 1, 'sign_in', '2017-07-12 19:40:46', 'User abda signed in at 2017-07-12 22:40:46.'),
(122, 2, 'sign_in', '2017-07-12 19:42:20', 'User user signed in at 2017-07-12 22:42:20.'),
(123, 1, 'sign_in', '2017-07-12 19:42:37', 'User abda signed in at 2017-07-12 22:42:37.'),
(124, 2, 'sign_in', '2017-07-13 12:23:14', 'User user signed in at 2017-07-13 15:23:14.'),
(125, 1, 'sign_in', '2017-07-13 12:23:20', 'User abda signed in at 2017-07-13 15:23:20.'),
(126, 2, 'sign_in', '2017-07-16 11:36:12', 'User user signed in at 2017-07-16 14:36:12.'),
(127, 2, 'sign_in', '2017-07-16 11:36:16', 'User user signed in at 2017-07-16 14:36:16.'),
(128, 1, 'sign_in', '2017-07-16 11:36:21', 'User abda signed in at 2017-07-16 14:36:21.'),
(129, 2, 'sign_in', '2017-07-18 11:38:06', 'User user signed in at 2017-07-18 14:38:06.'),
(130, 1, 'sign_in', '2017-07-18 11:38:18', 'User abda signed in at 2017-07-18 14:38:18.'),
(131, 2, 'sign_in', '2017-07-18 12:55:41', 'User user signed in at 2017-07-18 15:55:41.'),
(132, 1, 'sign_in', '2017-07-18 12:55:48', 'User abda signed in at 2017-07-18 15:55:48.'),
(133, 2, 'sign_in', NULL, 'User user signed in at 2017-07-20 15:07:04.'),
(134, 2, 'sign_in', '2017-07-20 12:23:58', 'User user signed in at 2017-07-20 15:23:58.'),
(135, 1, 'sign_in', '2017-07-20 12:24:03', 'User abda signed in at 2017-07-20 15:24:03.'),
(136, 2, 'sign_in', '2017-07-20 12:32:44', 'User user signed in at 2017-07-20 15:32:44.'),
(137, 2, 'sign_in', '2017-07-20 12:45:15', 'User user signed in at 2017-07-20 15:45:15.'),
(138, 1, 'sign_in', '2017-07-20 12:45:29', 'User abda signed in at 2017-07-20 15:45:29.'),
(139, 2, 'sign_in', '2017-07-20 12:58:43', 'User user signed in at 2017-07-20 15:58:43.'),
(140, 1, 'sign_in', '2017-07-20 13:02:59', 'User abda signed in at 2017-07-20 16:02:59.'),
(141, 2, 'sign_in', '2017-07-20 13:04:31', 'User user signed in at 2017-07-20 16:04:31.'),
(142, 2, 'sign_in', '2017-07-20 13:04:45', 'User user signed in at 2017-07-20 16:04:45.'),
(143, 2, 'sign_in', '2017-07-20 13:05:18', 'User user signed in at 2017-07-20 16:05:18.'),
(144, 1, 'sign_in', '2017-07-20 13:07:18', 'User abda signed in at 2017-07-20 16:07:18.'),
(145, 2, 'sign_in', '2017-07-20 13:21:06', 'User user signed in at 2017-07-20 16:21:06.'),
(146, 1, 'sign_in', '2017-07-20 13:21:11', 'User abda signed in at 2017-07-20 16:21:11.'),
(147, 2, 'sign_in', '2017-07-20 14:09:41', 'User user signed in at 2017-07-20 17:09:41.'),
(148, 1, 'sign_in', '2017-07-20 14:09:46', 'User abda signed in at 2017-07-20 17:09:46.'),
(149, 2, 'sign_in', '2017-07-23 06:29:13', 'User user signed in at 2017-07-23 09:29:13.'),
(150, 1, 'sign_in', '2017-07-23 06:29:20', 'User abda signed in at 2017-07-23 09:29:20.'),
(151, 2, 'sign_in', '2017-07-23 06:37:41', 'User user signed in at 2017-07-23 09:37:41.'),
(152, 2, 'sign_in', '2017-07-23 06:37:54', 'User user signed in at 2017-07-23 09:37:54.'),
(153, 1, 'sign_in', '2017-07-23 06:37:59', 'User abda signed in at 2017-07-23 09:37:59.'),
(154, 2, 'sign_in', '2017-07-23 06:55:38', 'User user signed in at 2017-07-23 09:55:38.'),
(155, 1, 'sign_in', '2017-07-23 06:55:45', 'User abda signed in at 2017-07-23 09:55:45.'),
(156, 2, 'sign_in', '2017-07-23 06:58:34', 'User user signed in at 2017-07-23 09:58:34.'),
(157, 1, 'sign_in', '2017-07-23 06:58:41', 'User abda signed in at 2017-07-23 09:58:41.'),
(158, 2, 'sign_in', '2017-07-23 07:12:23', 'User user signed in at 2017-07-23 10:12:23.'),
(159, 1, 'sign_in', '2017-07-23 07:12:39', 'User abda signed in at 2017-07-23 10:12:39.'),
(160, 2, 'sign_in', '2017-07-23 07:16:21', 'User user signed in at 2017-07-23 10:16:21.'),
(161, 1, 'sign_in', '2017-07-23 07:20:16', 'User abda signed in at 2017-07-23 10:20:16.'),
(162, 2, 'sign_in', '2017-07-23 07:22:06', 'User user signed in at 2017-07-23 10:22:06.'),
(163, 1, 'sign_in', '2017-07-23 07:22:12', 'User abda signed in at 2017-07-23 10:22:12.'),
(164, 2, 'sign_in', '2017-07-23 16:28:57', 'User user signed in at 2017-07-23 19:28:57.'),
(165, 1, 'sign_in', '2017-07-23 16:29:02', 'User abda signed in at 2017-07-23 19:29:02.'),
(166, 2, 'sign_in', '2017-07-23 16:29:31', 'User user signed in at 2017-07-23 19:29:31.'),
(167, 1, 'sign_in', '2017-07-23 16:29:37', 'User abda signed in at 2017-07-23 19:29:37.'),
(168, 2, 'sign_in', '2017-07-24 07:44:56', 'User user signed in at 2017-07-24 10:44:56.'),
(169, 1, 'sign_in', '2017-07-24 07:45:01', 'User abda signed in at 2017-07-24 10:45:01.'),
(170, 2, 'sign_in', '2017-07-24 07:48:52', 'User user signed in at 2017-07-24 10:48:52.'),
(171, 1, 'sign_in', '2017-07-24 07:48:57', 'User abda signed in at 2017-07-24 10:48:57.'),
(172, 2, 'sign_in', '2017-07-24 07:54:00', 'User user signed in at 2017-07-24 10:54:00.'),
(173, 1, 'sign_in', '2017-07-24 07:54:06', 'User abda signed in at 2017-07-24 10:54:06.'),
(174, 2, 'sign_in', '2017-07-24 07:57:02', 'User user signed in at 2017-07-24 10:57:02.'),
(175, 1, 'sign_in', '2017-07-24 07:57:11', 'User abda signed in at 2017-07-24 10:57:11.'),
(176, 2, 'sign_in', '2017-07-24 08:03:40', 'User user signed in at 2017-07-24 11:03:40.'),
(177, 1, 'sign_in', '2017-07-24 08:03:45', 'User abda signed in at 2017-07-24 11:03:45.'),
(178, 2, 'sign_in', '2017-07-24 08:04:42', 'User user signed in at 2017-07-24 11:04:42.'),
(179, 1, 'sign_in', '2017-07-24 08:17:01', 'User abda signed in at 2017-07-24 11:17:01.'),
(180, 1, 'sign_in', '2017-07-24 08:22:12', 'User abda signed in at 2017-07-24 11:22:12.'),
(181, 2, 'sign_in', '2017-07-24 08:29:29', 'User user signed in at 2017-07-24 11:29:29.'),
(182, 1, 'sign_in', '2017-07-24 08:29:34', 'User abda signed in at 2017-07-24 11:29:34.'),
(183, 2, 'sign_in', '2017-07-24 08:30:33', 'User user signed in at 2017-07-24 11:30:33.'),
(184, 1, 'sign_in', '2017-07-24 08:30:38', 'User abda signed in at 2017-07-24 11:30:38.'),
(185, 2, 'sign_in', '2017-07-24 08:41:58', 'User user signed in at 2017-07-24 11:41:58.'),
(186, 1, 'sign_in', '2017-07-24 08:42:04', 'User abda signed in at 2017-07-24 11:42:04.'),
(187, 2, 'sign_in', '2017-07-24 08:51:07', 'User user signed in at 2017-07-24 11:51:07.'),
(188, 1, 'sign_in', '2017-07-24 08:52:10', 'User abda signed in at 2017-07-24 11:52:10.'),
(189, 2, 'sign_in', '2017-07-24 08:56:45', 'User user signed in at 2017-07-24 11:56:45.'),
(190, 2, 'sign_in', '2017-07-24 08:57:53', 'User user signed in at 2017-07-24 11:57:53.'),
(191, 1, 'sign_in', '2017-07-24 08:58:30', 'User abda signed in at 2017-07-24 11:58:30.'),
(192, 2, 'sign_in', '2017-07-24 10:47:32', 'User user signed in at 2017-07-24 13:47:32.'),
(193, 1, 'sign_in', '2017-07-24 10:47:37', 'User abda signed in at 2017-07-24 13:47:37.'),
(194, 2, 'sign_in', '2017-07-24 10:49:15', 'User user signed in at 2017-07-24 13:49:15.'),
(195, 1, 'sign_in', '2017-07-24 10:49:20', 'User abda signed in at 2017-07-24 13:49:20.'),
(196, 2, 'sign_in', '2017-07-24 10:53:27', 'User user signed in at 2017-07-24 13:53:27.'),
(197, 2, 'sign_in', '2017-07-24 10:56:03', 'User user signed in at 2017-07-24 13:56:03.'),
(198, 1, 'sign_in', '2017-07-24 10:56:10', 'User abda signed in at 2017-07-24 13:56:10.'),
(199, 1, 'sign_in', '2017-07-24 10:59:55', 'User abda signed in at 2017-07-24 13:59:55.'),
(200, 1, 'sign_in', '2017-07-24 11:06:23', 'User abda signed in at 2017-07-24 14:06:23.'),
(201, 1, 'sign_in', '2017-07-24 11:08:39', 'User abda signed in at 2017-07-24 14:08:39.'),
(202, 1, 'sign_in', '2017-07-24 11:09:40', 'User abda signed in at 2017-07-24 14:09:40.'),
(203, 1, 'sign_in', '2017-07-24 11:10:38', 'User abda signed in at 2017-07-24 14:10:38.'),
(204, 2, 'sign_in', '2017-07-24 11:12:03', 'User user signed in at 2017-07-24 14:12:03.'),
(205, 1, 'sign_in', '2017-07-24 11:12:08', 'User abda signed in at 2017-07-24 14:12:08.'),
(206, 2, 'sign_in', '2017-07-24 11:19:26', 'User user signed in at 2017-07-24 14:19:26.'),
(207, 1, 'sign_in', '2017-07-24 11:19:31', 'User abda signed in at 2017-07-24 14:19:31.'),
(208, 2, 'sign_in', '2017-07-24 11:39:08', 'User user signed in at 2017-07-24 14:39:08.'),
(209, 1, 'sign_in', '2017-07-24 11:39:19', 'User abda signed in at 2017-07-24 14:39:19.'),
(210, 1, 'sign_in', '2017-07-24 11:57:09', 'User abda signed in at 2017-07-24 14:57:09.'),
(211, 1, 'sign_in', '2017-07-24 12:00:48', 'User abda signed in at 2017-07-24 15:00:48.'),
(212, 1, 'sign_in', '2017-07-24 12:04:10', 'User abda signed in at 2017-07-24 15:04:10.'),
(213, 2, 'sign_in', '2017-07-25 08:43:03', 'User user signed in at 2017-07-25 11:43:03.'),
(214, 1, 'sign_in', '2017-07-25 08:43:26', 'User abda signed in at 2017-07-25 11:43:26.'),
(215, 2, 'sign_in', '2017-07-25 10:56:54', 'User user signed in at 2017-07-25 13:56:54.'),
(216, 1, 'sign_in', '2017-07-25 10:57:01', 'User abda signed in at 2017-07-25 13:57:01.'),
(217, 1, 'sign_in', '2017-07-25 11:08:47', 'User abda signed in at 2017-07-25 14:08:47.'),
(218, 1, 'sign_in', '2017-07-25 20:47:09', 'User abda signed in at 2017-07-25 23:47:09.'),
(219, 2, 'sign_in', '2017-07-31 15:07:49', 'User user signed in at 2017-07-31 18:07:49.'),
(220, 2, 'sign_in', '2017-07-31 15:07:56', 'User user signed in at 2017-07-31 18:07:56.'),
(221, 2, 'sign_in', '2017-07-31 15:08:06', 'User user signed in at 2017-07-31 18:08:06.'),
(222, 1, 'sign_in', '2017-07-31 15:08:22', 'User abda signed in at 2017-07-31 18:08:22.'),
(223, 2, 'sign_in', '2017-08-13 08:14:06', 'User user signed in at 2017-08-13 11:14:06.'),
(224, 1, 'sign_in', '2017-08-13 08:14:28', 'User abda signed in at 2017-08-13 11:14:28.'),
(225, 1, 'sign_in', '2017-08-14 13:09:07', 'User abda signed in at 2017-08-14 16:09:07.'),
(226, 1, 'sign_in', '2017-08-14 13:09:26', 'User abda signed in at 2017-08-14 16:09:26.'),
(227, 2, 'sign_in', '2017-08-21 11:22:03', 'User user signed in at 2017-08-21 14:22:03.'),
(228, 1, 'sign_in', '2017-08-21 11:22:15', 'User abda signed in at 2017-08-21 14:22:15.'),
(229, 2, 'sign_in', '2017-08-21 11:30:06', 'User user signed in at 2017-08-21 14:30:06.'),
(230, 2, 'sign_in', '2017-08-21 11:30:36', 'User user signed in at 2017-08-21 14:30:36.'),
(231, 1, 'sign_in', '2017-08-21 11:31:06', 'User abda signed in at 2017-08-21 14:31:06.'),
(232, 1, 'sign_in', '2017-08-21 11:50:01', 'User abda signed in at 2017-08-21 14:50:01.'),
(233, 1, 'sign_in', '2017-08-21 11:51:46', 'User abda signed in at 2017-08-21 14:51:46.'),
(234, 1, 'sign_in', '2017-08-21 11:53:07', 'User abda signed in at 2017-08-21 14:53:07.'),
(235, 1, 'sign_in', '2017-08-21 11:55:15', 'User abda signed in at 2017-08-21 14:55:15.'),
(236, 1, 'sign_in', '2017-08-21 11:56:11', 'User abda signed in at 2017-08-21 14:56:11.'),
(237, 1, 'sign_in', '2017-08-21 12:21:06', 'User abda signed in at 2017-08-21 15:21:06.'),
(238, 1, 'sign_in', '2017-08-21 12:21:45', 'User abda signed in at 2017-08-21 15:21:45.'),
(239, 1, 'sign_in', '2017-08-21 12:22:30', 'User abda signed in at 2017-08-21 15:22:30.'),
(240, 1, 'sign_in', '2017-08-21 12:23:33', 'User abda signed in at 2017-08-21 15:23:33.'),
(241, 1, 'sign_in', '2017-08-21 12:25:35', 'User abda signed in at 2017-08-21 15:25:35.'),
(242, 1, 'sign_in', '2017-08-21 12:26:32', 'User abda signed in at 2017-08-21 15:26:32.'),
(243, 1, 'sign_in', '2017-08-21 12:27:16', 'User abda signed in at 2017-08-21 15:27:16.'),
(244, 1, 'sign_in', '2017-08-21 13:09:29', 'User abda signed in at 2017-08-21 16:09:29.'),
(245, 1, 'sign_in', '2017-08-21 13:09:53', 'User abda signed in at 2017-08-21 16:09:53.'),
(246, 1, 'sign_in', '2017-08-21 13:24:20', 'User abda signed in at 2017-08-21 16:24:20.'),
(247, 1, 'sign_in', '2017-08-21 13:27:24', 'User abda signed in at 2017-08-21 16:27:24.'),
(248, 1, 'sign_in', '2017-08-21 13:29:14', 'User abda signed in at 2017-08-21 16:29:14.'),
(249, 1, 'sign_in', '2017-08-21 13:31:04', 'User abda signed in at 2017-08-21 16:31:04.'),
(252, 1, 'sign_in', '2017-08-21 13:44:44', 'User abda signed in at 2017-08-21 16:44:44.'),
(253, 4, 'sign_up', '2017-08-21 13:45:17', 'User user was created by abda on 2017-08-21 16:45:17.'),
(254, 4, 'password_reset_request', '2017-08-21 13:45:17', 'User user requested a password reset on 2017-08-21 16:45:17.'),
(255, 4, 'sign_in', '2017-08-21 13:45:42', 'User user signed in at 2017-08-21 16:45:42.'),
(256, 1, 'sign_in', '2017-08-21 13:45:55', 'User abda signed in at 2017-08-21 16:45:55.'),
(257, 4, 'sign_in', '2017-08-21 13:46:06', 'User user signed in at 2017-08-21 16:46:06.'),
(258, 4, 'sign_in', '2017-08-21 15:28:14', 'User user signed in at 2017-08-21 18:28:14.'),
(259, 4, 'sign_in', '2017-08-21 15:37:01', 'User user signed in at 2017-08-21 18:37:01.'),
(260, 1, 'sign_in', '2017-08-21 15:37:07', 'User abda signed in at 2017-08-21 18:37:07.'),
(261, 1, 'sign_in', '2017-08-21 15:38:38', 'User admin signed in at 2017-08-21 18:38:38.'),
(262, 4, 'sign_in', '2017-08-21 15:40:32', 'User user signed in at 2017-08-21 18:40:32.'),
(263, 1, 'sign_in', '2017-08-21 15:40:37', 'User admin signed in at 2017-08-21 18:40:37.'),
(264, 4, 'sign_in', '2017-08-21 15:51:01', 'User user signed in at 2017-08-21 18:51:01.'),
(265, 1, 'sign_in', '2017-08-21 15:54:59', 'User admin signed in at 2017-08-21 18:54:59.'),
(266, 4, 'sign_in', '2017-08-21 15:55:47', 'User user signed in at 2017-08-21 18:55:47.'),
(267, 1, 'sign_in', '2017-08-21 15:58:45', 'User admin signed in at 2017-08-21 18:58:45.'),
(268, 4, 'sign_in', '2017-08-21 16:00:01', 'User user signed in at 2017-08-21 19:00:01.'),
(269, 4, 'sign_in', '2017-08-22 07:15:19', 'User user signed in at 2017-08-22 10:15:19.'),
(270, 1, 'sign_in', '2017-08-22 07:22:08', 'User admin signed in at 2017-08-22 10:22:08.'),
(271, 4, 'sign_in', '2017-08-22 07:22:14', 'User user signed in at 2017-08-22 10:22:14.'),
(272, 1, 'sign_in', '2017-08-22 07:24:14', 'User admin signed in at 2017-08-22 10:24:14.'),
(273, 1, 'sign_in', '2017-08-22 07:24:51', 'User admin signed in at 2017-08-22 10:24:51.'),
(274, 1, 'sign_in', '2017-08-22 07:25:20', 'User admin signed in at 2017-08-22 10:25:20.'),
(275, 4, 'sign_in', '2017-08-22 07:25:27', 'User user signed in at 2017-08-22 10:25:27.'),
(276, 1, 'sign_in', '2017-08-22 07:26:13', 'User admin signed in at 2017-08-22 10:26:13.'),
(277, 4, 'sign_in', '2017-08-22 07:26:18', 'User user signed in at 2017-08-22 10:26:18.'),
(278, 1, 'sign_in', '2017-08-22 07:27:43', 'User admin signed in at 2017-08-22 10:27:43.'),
(279, 4, 'sign_in', '2017-08-22 07:28:26', 'User user signed in at 2017-08-22 10:28:26.'),
(280, 1, 'sign_in', '2017-08-22 07:28:34', 'User admin signed in at 2017-08-22 10:28:34.'),
(281, 4, 'sign_in', '2017-08-22 07:28:49', 'User user signed in at 2017-08-22 10:28:49.'),
(282, 1, 'sign_in', '2017-08-22 07:35:59', 'User admin signed in at 2017-08-22 10:35:59.'),
(283, 4, 'sign_in', '2017-08-22 07:37:06', 'User user signed in at 2017-08-22 10:37:06.'),
(284, 1, 'sign_in', '2017-08-22 07:49:11', 'User admin signed in at 2017-08-22 10:49:11.'),
(285, 4, 'sign_in', '2017-08-22 07:51:28', 'User user signed in at 2017-08-22 10:51:28.'),
(286, 1, 'sign_in', '2017-08-22 07:51:39', 'User admin signed in at 2017-08-22 10:51:39.'),
(287, 4, 'sign_in', '2017-08-22 07:55:24', 'User user signed in at 2017-08-22 10:55:24.'),
(288, 4, 'sign_in', '2017-08-22 08:30:09', 'User user signed in at 2017-08-22 11:30:09.'),
(289, 1, 'sign_in', '2017-08-22 08:47:42', 'User admin signed in at 2017-08-22 11:47:42.'),
(290, 4, 'sign_in', '2017-08-22 08:51:12', 'User user signed in at 2017-08-22 11:51:12.'),
(291, 1, 'sign_in', '2017-08-22 08:51:43', 'User admin signed in at 2017-08-22 11:51:43.'),
(292, 4, 'sign_in', '2017-08-22 08:54:16', 'User user signed in at 2017-08-22 11:54:16.'),
(293, 1, 'sign_in', '2017-08-22 08:54:35', 'User admin signed in at 2017-08-22 11:54:35.'),
(294, 4, 'sign_in', '2017-08-22 08:55:16', 'User user signed in at 2017-08-22 11:55:16.'),
(295, 2, 'sign_in', '2017-08-22 11:13:56', 'User user signed in at 2017-08-22 14:13:56.'),
(296, 2, 'sign_in', '2017-08-22 11:15:20', 'User user signed in at 2017-08-22 14:15:20.'),
(297, 1, 'sign_in', '2017-08-22 11:15:29', 'User admin signed in at 2017-08-22 14:15:29.'),
(298, 2, 'sign_in', '2017-08-22 11:20:09', 'User user signed in at 2017-08-22 14:20:09.'),
(299, 2, 'sign_in', '2017-08-22 11:20:56', 'User user signed in at 2017-08-22 14:20:56.'),
(300, 2, 'sign_in', '2017-08-22 11:21:42', 'User user signed in at 2017-08-22 14:21:42.'),
(301, 1, 'sign_in', '2017-08-22 11:23:32', 'User admin signed in at 2017-08-22 14:23:32.'),
(302, 2, 'sign_in', '2017-08-22 11:23:39', 'User user signed in at 2017-08-22 14:23:39.'),
(303, 1, 'sign_in', '2017-08-22 11:29:39', 'User admin signed in at 2017-08-22 14:29:39.'),
(304, 2, 'sign_in', '2017-08-22 11:29:56', 'User user signed in at 2017-08-22 14:29:56.'),
(305, 2, 'sign_in', '2017-08-22 11:32:34', 'User user signed in at 2017-08-22 14:32:34.'),
(306, 2, 'sign_in', '2017-08-22 11:37:17', 'User user signed in at 2017-08-22 14:37:17.'),
(307, 2, 'sign_in', '2017-08-22 11:39:51', 'User user signed in at 2017-08-22 14:39:51.'),
(308, 2, 'sign_in', '2017-08-22 11:42:28', 'User user signed in at 2017-08-22 14:42:28.'),
(309, 2, 'sign_in', '2017-08-22 11:46:04', 'User user signed in at 2017-08-22 14:46:04.'),
(310, 2, 'sign_in', NULL, 'User user signed in at 2017-08-22 14:54:35.'),
(311, 1, 'sign_in', NULL, 'User admin signed in at 2017-08-22 14:57:48.'),
(312, 2, 'sign_in', NULL, 'User user signed in at 2017-08-22 14:59:16.'),
(313, 2, 'sign_in', NULL, 'User user signed in at 2017-08-22 15:00:46.'),
(314, 1, 'sign_in', NULL, 'User admin signed in at 2017-08-22 15:00:55.'),
(315, 2, 'sign_in', NULL, 'User user signed in at 2017-08-22 15:06:15.'),
(316, 1, 'sign_in', NULL, 'User admin signed in at 2017-08-22 15:07:05.'),
(317, 1, 'sign_in', NULL, 'User admin signed in at 2017-08-22 15:08:33.'),
(318, 2, 'sign_in', NULL, 'User user signed in at 2017-08-22 15:13:50.'),
(319, 1, 'sign_in', NULL, 'User admin signed in at 2017-08-22 15:13:59.'),
(320, 2, 'sign_in', NULL, 'User user signed in at 2017-08-22 15:21:47.'),
(321, 1, 'sign_in', NULL, 'User admin signed in at 2017-08-22 15:22:30.'),
(322, 2, 'sign_in', NULL, 'User user signed in at 2017-08-22 15:46:50.'),
(323, 1, 'sign_in', NULL, 'User admin signed in at 2017-08-22 15:48:19.'),
(324, 2, 'sign_in', NULL, 'User user signed in at 2017-08-22 15:48:48.'),
(325, 1, 'sign_in', NULL, 'User admin signed in at 2017-08-22 15:52:49.'),
(326, 1, 'sign_in', NULL, 'User admin signed in at 2017-08-22 15:54:36.'),
(327, 2, 'sign_in', NULL, 'User user signed in at 2017-08-22 15:59:46.'),
(328, 1, 'sign_in', NULL, 'User admin signed in at 2017-08-23 10:46:31.'),
(329, 2, 'sign_in', NULL, 'User user signed in at 2017-08-23 15:43:39.'),
(330, 1, 'sign_in', NULL, 'User admin signed in at 2017-08-23 17:06:21.'),
(331, 2, 'sign_in', NULL, 'User user signed in at 2017-08-23 17:24:49.'),
(332, 1, 'sign_in', NULL, 'User admin signed in at 2017-08-23 17:31:03.'),
(333, 2, 'sign_in', NULL, 'User user signed in at 2017-08-23 17:33:17.'),
(334, 1, 'sign_in', NULL, 'User admin signed in at 2017-08-23 17:33:51.'),
(335, 2, 'sign_in', NULL, 'User user signed in at 2017-08-24 15:07:37.'),
(336, 2, 'sign_in', NULL, 'User user signed in at 2017-08-24 15:07:48.'),
(337, 1, 'sign_in', NULL, 'User admin signed in at 2017-08-24 15:07:53.'),
(338, 3, 'sign_in', NULL, 'User abatta signed in at 2017-10-16 13:48:12.'),
(339, 3, 'sign_in', NULL, 'User abatta signed in at 2017-10-16 14:01:32.'),
(340, 3, 'sign_in', NULL, 'User abatta signed in at 2017-10-16 14:36:19.'),
(341, 1, 'sign_in', NULL, 'User abatta signed in at 2017-10-16 14:38:35.'),
(342, 1, 'sign_in', NULL, 'User abatta signed in at 2017-10-16 14:45:53.'),
(343, 1, 'sign_in', NULL, 'User admin signed in at 2017-10-16 14:47:37.'),
(344, 1, 'sign_in', NULL, 'User admin signed in at 2017-10-16 14:48:21.'),
(345, 3, 'sign_in', NULL, 'User abatta signed in at 2017-10-16 14:51:53.'),
(346, 3, 'sign_in', NULL, 'User abatta signed in at 2017-10-16 14:52:22.'),
(347, 3, 'sign_in', NULL, 'User abatta signed in at 2017-10-16 14:53:45.'),
(348, 3, 'sign_in', NULL, 'User abatta signed in at 2017-10-16 14:57:06.'),
(349, 1, 'sign_in', NULL, 'User admin signed in at 2017-10-16 14:57:30.'),
(352, 1, 'sign_in', NULL, 'User admin signed in at 2017-10-16 15:18:11.'),
(353, 1, 'sign_in', NULL, 'User admin signed in at 2017-10-16 15:20:10.'),
(354, 2, 'sign_in', NULL, 'User user signed in at 2017-10-16 15:51:39.'),
(355, 1, 'sign_in', NULL, 'User admin signed in at 2017-10-16 15:54:32.'),
(356, 2, 'sign_in', NULL, 'User user signed in at 2017-10-16 19:53:58.'),
(357, 1, 'sign_in', NULL, 'User admin signed in at 2017-10-16 20:04:40.'),
(360, 2, 'sign_in', NULL, 'User user signed in at 2017-10-17 10:12:48.'),
(361, 1, 'sign_in', NULL, 'User admin signed in at 2017-10-17 14:13:31.'),
(362, 1, 'sign_in', NULL, 'User admin signed in at 2017-10-17 15:21:18.'),
(365, 2, 'sign_in', NULL, 'User user signed in at 2017-10-17 15:28:55.'),
(366, 1, 'sign_in', NULL, 'User admin signed in at 2017-10-17 15:30:34.'),
(370, 1, 'sign_in', '2017-10-17 12:56:38', 'User admin signed in at 2017-10-17 15:56:38.'),
(371, 8, 'sign_up', '2017-10-17 12:57:51', 'User abatta was created by admin on 2017-10-17 15:57:51.'),
(372, 8, 'password_reset_request', '2017-10-17 12:57:51', 'User abatta requested a password reset on 2017-10-17 15:57:51.'),
(373, 8, 'sign_in', '2017-10-17 12:58:49', 'User abatta signed in at 2017-10-17 15:58:49.'),
(374, 1, 'sign_in', '2017-10-17 12:59:52', 'User admin signed in at 2017-10-17 15:59:52.'),
(375, 8, 'sign_in', '2017-10-17 13:01:19', 'User abatta signed in at 2017-10-17 16:01:19.'),
(376, 2, 'sign_in', '2017-10-17 17:23:11', 'User user signed in at 2017-10-17 20:23:11.'),
(377, 2, 'sign_in', '2017-10-17 17:25:27', 'User user signed in at 2017-10-17 20:25:27.'),
(378, 2, 'sign_in', '2017-10-17 18:08:52', 'User user signed in at 2017-10-17 21:08:52.'),
(379, 1, 'sign_in', '2017-10-17 19:02:00', 'User admin signed in at 2017-10-17 22:02:00.'),
(380, 1, 'sign_in', '2017-10-17 19:21:17', 'User admin signed in at 2017-10-17 22:21:17.'),
(381, 1, 'sign_in', '2017-10-18 05:44:29', 'User admin signed in at 2017-10-18 08:44:29.'),
(382, 2, 'sign_in', '2017-10-18 05:51:53', 'User user signed in at 2017-10-18 08:51:53.'),
(383, 1, 'sign_in', '2017-10-18 05:52:06', 'User admin signed in at 2017-10-18 08:52:06.'),
(384, 2, 'sign_in', '2017-10-18 07:17:50', 'User user signed in at 2017-10-18 10:17:50.'),
(385, 2, 'sign_in', '2017-10-18 08:14:19', 'User user signed in at 2017-10-18 11:14:19.'),
(386, 2, 'sign_in', '2017-10-18 11:10:19', 'User user signed in at 2017-10-18 14:10:19.'),
(387, 2, 'sign_in', '2017-10-18 11:11:38', 'User user signed in at 2017-10-18 14:11:38.'),
(388, 2, 'sign_in', '2017-10-18 16:26:22', 'User user signed in at 2017-10-18 19:26:22.'),
(389, 2, 'sign_in', '2017-10-18 16:42:07', 'User user signed in at 2017-10-18 19:42:07.'),
(390, 8, 'sign_in', '2017-10-19 06:16:48', 'User abatta signed in at 2017-10-19 09:16:48.'),
(391, 2, 'sign_in', '2017-10-19 06:18:28', 'User user signed in at 2017-10-19 09:18:28.'),
(392, 2, 'sign_in', '2017-10-19 06:38:14', 'User user signed in at 2017-10-19 09:38:14.'),
(393, 8, 'sign_in', '2017-10-19 06:38:37', 'User abatta signed in at 2017-10-19 09:38:37.'),
(394, 2, 'sign_in', '2017-10-19 06:42:21', 'User user signed in at 2017-10-19 09:42:21.'),
(395, 8, 'sign_in', '2017-10-19 06:42:31', 'User abatta signed in at 2017-10-19 09:42:31.'),
(396, 2, 'sign_in', '2017-10-19 07:35:42', 'User user signed in at 2017-10-19 10:35:42.'),
(397, 8, 'sign_in', '2017-10-19 07:39:57', 'User abatta signed in at 2017-10-19 10:39:57.'),
(398, 8, 'sign_in', '2017-10-19 07:42:02', 'User abatta signed in at 2017-10-19 10:42:02.'),
(399, 8, 'sign_in', '2017-10-19 07:43:01', 'User abatta signed in at 2017-10-19 10:43:01.'),
(400, 8, 'sign_in', '2017-10-19 07:44:27', 'User abatta signed in at 2017-10-19 10:44:27.'),
(401, 8, 'sign_in', '2017-10-19 07:47:00', 'User abatta signed in at 2017-10-19 10:47:00.'),
(402, 2, 'sign_in', '2017-10-19 07:52:25', 'User user signed in at 2017-10-19 10:52:25.'),
(403, 2, 'sign_in', '2017-10-19 07:55:15', 'User user signed in at 2017-10-19 10:55:15.'),
(404, 8, 'sign_in', '2017-10-19 07:55:51', 'User abatta signed in at 2017-10-19 10:55:51.'),
(405, 2, 'sign_in', '2017-10-19 08:00:53', 'User user signed in at 2017-10-19 11:00:53.'),
(406, 8, 'sign_in', '2017-10-19 08:01:43', 'User abatta signed in at 2017-10-19 11:01:43.'),
(407, 1, 'sign_in', '2017-10-19 08:08:47', 'User admin signed in at 2017-10-19 11:08:47.'),
(408, 9, 'sign_up', '2017-10-19 08:14:22', 'User abatta was created by admin on 2017-10-19 11:14:22.'),
(409, 9, 'password_reset_request', '2017-10-19 08:14:22', 'User abatta requested a password reset on 2017-10-19 11:14:22.'),
(417, 2, 'sign_in', '2017-10-19 08:40:45', 'User user signed in at 2017-10-19 11:40:45.'),
(418, 1, 'sign_in', '2017-10-19 08:53:01', 'User admin signed in at 2017-10-19 11:53:01.'),
(427, 17, 'sign_up', '2017-10-19 09:37:38', 'User abatta was created by admin on 2017-10-19 12:37:38.'),
(428, 17, 'password_reset_request', '2017-10-19 09:37:38', 'User abatta requested a password reset on 2017-10-19 12:37:38.'),
(429, 17, 'sign_in', '2017-10-19 09:38:06', 'User abatta signed in at 2017-10-19 12:38:06.'),
(430, 2, 'sign_in', '2017-10-19 09:43:34', 'User user signed in at 2017-10-19 12:43:34.'),
(431, 17, 'sign_in', '2017-10-19 09:43:56', 'User abatta signed in at 2017-10-19 12:43:56.'),
(432, 1, 'sign_in', '2017-10-19 09:49:57', 'User admin signed in at 2017-10-19 12:49:57.'),
(433, 1, 'sign_in', '2017-10-19 10:00:25', 'User admin signed in at 2017-10-19 13:00:25.'),
(434, 17, 'sign_in', '2017-10-19 10:01:38', 'User abatta signed in at 2017-10-19 13:01:38.'),
(435, 17, 'sign_in', '2017-10-19 10:10:12', 'User user signed in at 2017-10-19 13:10:12.'),
(436, 2, 'sign_in', '2017-10-19 10:10:31', 'User abatta signed in at 2017-10-19 13:10:31.'),
(437, 3, 'sign_in', '2017-10-19 10:11:29', 'User abatta signed in at 2017-10-19 13:11:29.'),
(438, 17, 'sign_in', '2017-10-19 10:14:16', 'User user signed in at 2017-10-19 13:14:16.'),
(439, 17, 'sign_in', '2017-10-19 10:31:12', 'User user signed in at 2017-10-19 13:31:12.'),
(440, 2, 'sign_in', '2017-10-19 10:31:34', 'User abatta signed in at 2017-10-19 13:31:34.'),
(441, 2, 'sign_in', '2017-10-19 10:33:56', 'User abatta signed in at 2017-10-19 13:33:56.'),
(442, 17, 'sign_in', '2017-10-19 10:46:30', 'User abatta signed in at 2017-10-19 13:46:30.'),
(443, 17, 'sign_in', '2017-10-19 16:59:42', 'User abatta signed in at 2017-10-19 19:59:42.'),
(444, 17, 'sign_in', '2017-10-19 17:01:48', 'User abatta signed in at 2017-10-19 20:01:48.'),
(445, 17, 'sign_in', '2017-10-19 17:03:01', 'User abatta signed in at 2017-10-19 20:03:01.'),
(446, 17, 'sign_in', '2017-10-19 17:03:56', 'User abatta signed in at 2017-10-19 20:03:56.'),
(447, 17, 'sign_in', '2017-10-19 17:56:44', 'User abatta signed in at 2017-10-19 20:56:44.'),
(448, 17, 'sign_in', '2017-10-19 17:58:58', 'User abatta signed in at 2017-10-19 20:58:58.'),
(449, 17, 'sign_in', '2017-10-19 18:02:42', 'User abatta signed in at 2017-10-19 21:02:42.'),
(450, 17, 'sign_in', '2017-10-20 17:27:11', 'User abatta signed in at 2017-10-20 20:27:11.'),
(451, 2, 'sign_in', '2017-10-20 17:27:21', 'User user signed in at 2017-10-20 20:27:21.'),
(452, 17, 'sign_in', '2017-10-20 17:27:48', 'User abatta signed in at 2017-10-20 20:27:48.'),
(453, 1, 'sign_in', '2017-10-20 17:28:34', 'User admin signed in at 2017-10-20 20:28:34.'),
(454, 1, 'sign_in', '2017-10-20 18:05:56', 'User admin signed in at 2017-10-20 21:05:56.'),
(455, 17, 'sign_in', '2017-10-21 13:52:20', 'User abatta signed in at 2017-10-21 16:52:20.'),
(456, 1, 'sign_in', '2017-10-21 13:53:04', 'User admin signed in at 2017-10-21 16:53:04.'),
(457, 1, 'sign_in', '2017-10-22 06:33:19', 'User admin signed in at 2017-10-22 09:33:19.'),
(458, 17, 'sign_in', '2017-10-22 06:48:46', 'User abatta signed in at 2017-10-22 09:48:46.'),
(459, 17, 'sign_in', '2017-10-22 06:49:24', 'User abatta signed in at 2017-10-22 09:49:24.'),
(460, 1, 'sign_in', '2017-10-22 06:49:44', 'User admin signed in at 2017-10-22 09:49:44.'),
(461, 1, 'sign_in', '2017-10-22 06:51:33', 'User admin signed in at 2017-10-22 09:51:33.'),
(462, 1, 'sign_in', '2017-10-22 06:54:33', 'User admin signed in at 2017-10-22 09:54:33.'),
(463, 17, 'sign_in', '2017-10-22 07:07:28', 'User abatta signed in at 2017-10-22 10:07:28.'),
(464, 1, 'sign_in', '2017-10-22 07:08:30', 'User admin signed in at 2017-10-22 10:08:30.'),
(465, 1, 'sign_in', '2017-10-22 07:41:48', 'User admin signed in at 2017-10-22 10:41:48.'),
(466, 1, 'sign_in', '2017-10-22 07:51:00', 'User admin signed in at 2017-10-22 10:51:00.'),
(467, 1, 'sign_in', '2017-10-22 07:53:18', 'User admin signed in at 2017-10-22 10:53:18.'),
(468, 1, 'sign_in', '2017-10-22 07:54:37', 'User admin signed in at 2017-10-22 10:54:37.'),
(469, 1, 'sign_in', '2017-10-22 07:57:31', 'User admin signed in at 2017-10-22 10:57:31.'),
(470, 1, 'sign_in', '2017-10-22 08:27:46', 'User admin signed in at 2017-10-22 11:27:46.'),
(471, 1, 'sign_in', '2017-10-22 08:38:33', 'User admin signed in at 2017-10-22 11:38:33.'),
(472, 1, 'sign_in', '2017-10-22 08:42:24', 'User admin signed in at 2017-10-22 11:42:24.'),
(473, 1, 'sign_in', '2017-10-22 09:04:36', 'User admin signed in at 2017-10-22 12:04:36.'),
(474, 1, 'sign_in', '2017-10-22 12:04:35', 'User admin signed in at 2017-10-22 15:04:35.'),
(475, 1, 'sign_in', '2017-10-22 12:34:27', 'User admin signed in at 2017-10-22 15:34:27.'),
(476, 1, 'sign_in', '2017-10-22 12:49:56', 'User admin signed in at 2017-10-22 15:49:56.'),
(477, 1, 'sign_in', '2017-10-22 18:34:47', 'User admin signed in at 2017-10-22 21:34:47.'),
(478, 1, 'sign_in', '2017-10-23 05:50:56', 'User admin signed in at 2017-10-23 08:50:56.'),
(479, 1, 'sign_in', '2017-10-23 12:11:50', 'User admin signed in at 2017-10-23 15:11:50.'),
(480, 17, 'sign_in', '2017-10-23 12:28:06', 'User abatta signed in at 2017-10-23 15:28:06.'),
(481, 1, 'sign_in', '2017-10-23 12:28:17', 'User admin signed in at 2017-10-23 15:28:17.'),
(482, 17, 'password_reset_request', '2017-10-23 12:28:30', 'User abatta requested a password reset on 2017-10-23 15:28:30.'),
(483, 17, 'sign_in', '2017-10-23 12:30:17', 'User abatta signed in at 2017-10-23 15:30:17.'),
(484, 1, 'sign_in', '2017-10-23 12:30:31', 'User admin signed in at 2017-10-23 15:30:31.'),
(485, 17, 'password_reset_request', '2017-10-23 12:30:51', 'User abatta requested a password reset on 2017-10-23 15:30:51.'),
(486, 17, 'sign_in', '2017-10-23 12:34:54', 'User abatta signed in at 2017-10-23 15:34:54.'),
(487, 2, 'sign_in', '2017-10-23 12:41:13', 'User ahmad signed in at 2017-10-23 15:41:13.'),
(488, 17, 'sign_in', '2017-10-23 17:49:15', 'User abatta signed in at 2017-10-23 20:49:15.'),
(489, 17, 'sign_in', '2017-10-23 18:21:56', 'User abatta signed in at 2017-10-23 21:21:56.'),
(490, 1, 'sign_in', '2017-10-25 06:28:08', 'User admin signed in at 2017-10-25 09:28:08.'),
(491, 1, 'sign_in', '2017-10-28 17:09:52', 'User admin signed in at 2017-10-28 20:09:52.'),
(492, 17, 'sign_in', '2017-10-28 17:34:27', 'User abatta signed in at 2017-10-28 20:34:27.'),
(493, 1, 'sign_in', '2017-10-29 09:06:40', 'User admin signed in at 2017-10-29 11:06:40.'),
(494, 1, 'sign_in', '2017-10-29 09:11:09', 'User admin signed in at 2017-10-29 11:11:09.'),
(495, 1, 'sign_in', '2017-10-29 09:30:15', 'User admin signed in at 2017-10-29 11:30:15.'),
(496, 1, 'sign_in', '2017-10-30 07:38:41', 'User admin signed in at 2017-10-30 09:38:41.'),
(497, 1, 'sign_in', '2017-10-30 08:28:56', 'User admin signed in at 2017-10-30 10:28:56.'),
(498, 17, 'sign_in', '2017-10-30 12:11:13', 'User abatta signed in at 2017-10-30 14:11:13.'),
(499, 1, 'sign_in', '2017-10-30 19:05:45', 'User admin signed in at 2017-10-30 21:05:45.'),
(500, 17, 'sign_in', '2017-10-31 07:41:14', 'User abatta signed in at 2017-10-31 09:41:14.'),
(501, 17, 'sign_in', '2017-10-31 08:24:58', 'User abatta signed in at 2017-10-31 10:24:58.'),
(502, 1, 'sign_in', '2017-10-31 10:01:55', 'User admin signed in at 2017-10-31 12:01:55.'),
(503, 17, 'sign_in', '2017-10-31 10:04:09', 'User user signed in at 2017-10-31 12:04:09.'),
(504, 1, 'sign_in', '2017-10-31 10:06:20', 'User admin signed in at 2017-10-31 12:06:20.'),
(505, 1, 'sign_in', '2017-11-07 10:51:59', 'User admin signed in at 2017-11-07 12:51:59.'),
(506, 17, 'sign_in', '2017-11-07 10:58:16', 'User user signed in at 2017-11-07 12:58:16.'),
(507, 1, 'sign_in', '2017-11-08 08:49:58', 'User admin signed in at 2017-11-08 10:49:58.'),
(508, 1, 'sign_in', '2017-11-09 13:17:56', 'User admin signed in at 2017-11-09 15:17:56.'),
(509, 1, 'sign_in', '2017-11-09 13:56:23', 'User admin signed in at 2017-11-09 15:56:23.'),
(510, 1, 'sign_in', '2017-11-09 14:05:07', 'User admin signed in at 2017-11-09 16:05:07.'),
(511, 1, 'sign_in', '2017-11-09 23:21:05', 'User admin signed in at 2017-11-10 01:21:05.'),
(512, 1, 'sign_in', '2017-11-09 23:22:46', 'User admin signed in at 2017-11-10 01:22:46.'),
(513, 1, 'sign_in', '2017-11-10 22:35:59', 'User admin signed in at 2017-11-11 00:35:59.'),
(514, 1, 'sign_in', '2017-11-16 15:09:59', 'User admin signed in at 2017-11-16 17:09:59.'),
(515, 1, 'sign_in', '2017-11-20 16:44:48', 'User admin signed in at 2017-11-20 18:44:48.'),
(516, 1, 'sign_in', '2017-11-20 16:48:43', 'User admin signed in at 2017-11-20 18:48:43.'),
(517, 1, 'sign_in', '2017-11-20 16:49:54', 'User admin signed in at 2017-11-20 18:49:54.'),
(518, 1, 'sign_in', '2017-11-20 16:53:47', 'User admin signed in at 2017-11-20 18:53:47.'),
(519, 1, 'sign_in', '2017-11-23 11:04:10', 'User admin signed in at 2017-11-23 13:04:10.'),
(520, 1, 'sign_in', '2017-11-23 12:21:48', 'User admin signed in at 2017-11-23 14:21:48.'),
(521, 1, 'sign_in', '2017-11-23 12:24:26', 'User admin signed in at 2017-11-23 14:24:26.'),
(522, 1, 'sign_in', '2017-11-23 14:21:12', 'User admin signed in at 2017-11-23 16:21:12.'),
(523, 1, 'sign_in', '2017-11-27 10:12:46', 'User admin signed in at 2017-11-27 12:12:46.'),
(524, 1, 'sign_in', '2017-11-27 10:31:27', 'User admin signed in at 2017-11-27 12:31:27.'),
(525, 1, 'sign_in', '2017-11-27 10:33:36', 'User admin signed in at 2017-11-27 12:33:36.'),
(526, 1, 'sign_in', '2017-11-27 10:34:46', 'User admin signed in at 2017-11-27 12:34:46.'),
(527, 1, 'sign_in', '2017-11-27 14:28:34', 'User admin signed in at 2017-11-27 16:28:34.'),
(528, 1, 'sign_in', '2017-11-27 14:30:47', 'User admin signed in at 2017-11-27 16:30:47.'),
(529, 1, 'sign_in', '2017-11-28 13:19:07', 'User admin signed in at 2017-11-28 15:19:07.'),
(530, 1, 'sign_in', '2017-12-03 12:59:21', 'User admin signed in at 2017-12-03 14:59:21.'),
(531, 1, 'sign_in', '2017-12-03 14:36:02', 'User admin signed in at 2017-12-03 16:36:02.'),
(532, 1, 'sign_in', '2017-12-03 14:40:58', 'User admin signed in at 2017-12-03 16:40:58.'),
(533, 1, 'sign_in', '2017-12-03 14:41:51', 'User admin signed in at 2017-12-03 16:41:51.'),
(534, 1, 'sign_in', '2017-12-04 08:35:27', 'User admin signed in at 2017-12-04 10:35:27.'),
(535, 1, 'sign_in', '2017-12-04 11:23:20', 'User admin signed in at 2017-12-04 13:23:20.'),
(536, 1, 'sign_in', '2017-12-04 11:25:33', 'User admin signed in at 2017-12-04 13:25:33.'),
(537, 1, 'sign_in', '2017-12-04 11:31:09', 'User admin signed in at 2017-12-04 13:31:09.'),
(538, 1, 'sign_in', '2017-12-04 11:38:54', 'User admin signed in at 2017-12-04 13:38:54.'),
(539, 1, 'sign_in', '2017-12-04 11:43:47', 'User admin signed in at 2017-12-04 13:43:47.'),
(540, 1, 'sign_in', '2017-12-04 11:47:31', 'User admin signed in at 2017-12-04 13:47:31.'),
(541, 1, 'sign_in', '2017-12-05 13:01:13', 'User admin signed in at 2017-12-05 15:01:13.'),
(542, 1, 'sign_in', '2017-12-10 07:49:31', 'User admin signed in at 2017-12-10 09:49:30.'),
(543, 1, 'sign_in', '2017-12-10 11:07:52', 'User admin signed in at 2017-12-10 13:07:52.'),
(544, 1, 'sign_in', '2017-12-10 13:23:33', 'User admin signed in at 2017-12-10 15:23:33.'),
(545, 1, 'sign_in', '2017-12-11 07:37:38', 'User admin signed in at 2017-12-11 09:37:38.'),
(546, 1, 'sign_in', '2017-12-11 07:48:13', 'User admin signed in at 2017-12-11 09:48:13.'),
(547, 1, 'sign_in', '2017-12-11 08:02:26', 'User admin signed in at 2017-12-11 10:02:26.'),
(548, 17, 'sign_in', '2017-12-14 07:00:41', 'User user signed in at 2017-12-14 09:00:41.'),
(549, 1, 'sign_in', '2017-12-14 07:00:49', 'User admin signed in at 2017-12-14 09:00:49.'),
(550, 17, 'sign_in', '2017-12-14 07:01:55', 'User user signed in at 2017-12-14 09:01:55.'),
(551, 17, 'sign_in', '2017-12-14 07:10:01', 'User user signed in at 2017-12-14 09:10:01.'),
(552, 17, 'sign_in', '2017-12-14 07:12:02', 'User user signed in at 2017-12-14 09:12:02.'),
(553, 17, 'sign_in', '2017-12-14 07:12:17', 'User user signed in at 2017-12-14 09:12:17.'),
(554, 17, 'sign_in', '2017-12-14 07:12:27', 'User user signed in at 2017-12-14 09:12:27.'),
(555, 17, 'sign_in', '2017-12-14 07:12:53', 'User user signed in at 2017-12-14 09:12:53.'),
(556, 17, 'sign_in', '2017-12-14 07:16:55', 'User user signed in at 2017-12-14 09:16:55.'),
(557, 17, 'sign_in', '2017-12-14 07:17:09', 'User user signed in at 2017-12-14 09:17:09.'),
(558, 17, 'sign_in', '2017-12-14 07:19:38', 'User user signed in at 2017-12-14 09:19:38.'),
(559, 17, 'sign_in', '2017-12-14 07:19:47', 'User user signed in at 2017-12-14 09:19:47.'),
(560, 1, 'sign_in', '2017-12-14 07:19:57', 'User admin signed in at 2017-12-14 09:19:57.'),
(561, 17, 'sign_in', '2017-12-14 07:20:19', 'User user signed in at 2017-12-14 09:20:19.'),
(562, 17, 'sign_in', '2017-12-14 07:20:32', 'User user signed in at 2017-12-14 09:20:32.'),
(563, 17, 'sign_in', '2017-12-14 07:20:42', 'User user signed in at 2017-12-14 09:20:42.'),
(564, 17, 'sign_in', '2017-12-14 07:22:22', 'User user signed in at 2017-12-14 09:22:22.'),
(565, 1, 'sign_in', '2017-12-14 07:23:30', 'User admin signed in at 2017-12-14 09:23:30.'),
(566, 17, 'sign_in', '2017-12-14 07:23:41', 'User user signed in at 2017-12-14 09:23:41.'),
(567, 17, 'sign_in', '2017-12-14 07:26:36', 'User user signed in at 2017-12-14 09:26:36.'),
(568, 17, 'sign_in', '2017-12-14 07:29:07', 'User user signed in at 2017-12-14 09:29:07.'),
(569, 17, 'sign_in', '2017-12-14 07:29:30', 'User user signed in at 2017-12-14 09:29:30.'),
(570, 17, 'sign_in', '2017-12-14 07:29:47', 'User user signed in at 2017-12-14 09:29:47.'),
(571, 17, 'sign_in', '2017-12-14 07:30:00', 'User user signed in at 2017-12-14 09:30:00.'),
(572, 1, 'sign_in', '2017-12-14 07:30:39', 'User admin signed in at 2017-12-14 09:30:39.'),
(573, 17, 'sign_in', '2017-12-14 07:31:49', 'User user signed in at 2017-12-14 09:31:49.'),
(574, 17, 'sign_in', '2017-12-14 07:32:39', 'User user signed in at 2017-12-14 09:32:39.'),
(575, 1, 'sign_in', '2017-12-14 08:14:32', 'User admin signed in at 2017-12-14 10:14:32.'),
(576, 17, 'sign_in', '2017-12-14 08:16:58', 'User user signed in at 2017-12-14 10:16:58.'),
(577, 17, 'sign_in', '2017-12-14 08:17:04', 'User user signed in at 2017-12-14 10:17:04.'),
(578, 1, 'sign_in', '2017-12-14 08:17:17', 'User admin signed in at 2017-12-14 10:17:17.'),
(579, 17, 'sign_in', '2017-12-14 08:48:10', 'User user signed in at 2017-12-14 10:48:10.'),
(580, 1, 'sign_in', '2017-12-14 08:48:30', 'User admin signed in at 2017-12-14 10:48:30.'),
(581, 17, 'sign_in', '2017-12-14 08:49:08', 'User user signed in at 2017-12-14 10:49:08.'),
(582, 17, 'sign_in', '2017-12-14 08:49:38', 'User user signed in at 2017-12-14 10:49:38.'),
(583, 17, 'sign_in', '2017-12-14 08:49:54', 'User user signed in at 2017-12-14 10:49:54.'),
(584, 17, 'sign_in', '2017-12-14 08:50:08', 'User user signed in at 2017-12-14 10:50:08.'),
(585, 17, 'sign_in', '2017-12-14 08:50:16', 'User user signed in at 2017-12-14 10:50:16.'),
(586, 1, 'sign_in', '2017-12-14 08:50:46', 'User admin signed in at 2017-12-14 10:50:46.'),
(587, 17, 'sign_in', '2017-12-14 08:52:03', 'User user signed in at 2017-12-14 10:52:03.'),
(588, 1, 'sign_in', '2017-12-14 08:56:25', 'User admin signed in at 2017-12-14 10:56:25.'),
(589, 17, 'sign_in', '2017-12-14 08:57:43', 'User user signed in at 2017-12-14 10:57:43.');
INSERT INTO `uf_user_event` (`id`, `user_id`, `event_type`, `occurred_at`, `description`) VALUES
(590, 17, 'sign_in', '2017-12-14 09:01:26', 'User user signed in at 2017-12-14 11:01:26.'),
(591, 1, 'sign_in', '2017-12-14 09:01:31', 'User admin signed in at 2017-12-14 11:01:31.'),
(592, 17, 'sign_in', '2017-12-14 09:02:24', 'User user signed in at 2017-12-14 11:02:24.'),
(593, 1, 'sign_in', '2017-12-14 09:15:44', 'User admin signed in at 2017-12-14 11:15:44.'),
(594, 17, 'sign_in', '2017-12-14 09:15:50', 'User user signed in at 2017-12-14 11:15:50.'),
(595, 17, 'sign_in', '2017-12-14 09:19:07', 'User user signed in at 2017-12-14 11:19:07.'),
(596, 1, 'sign_in', '2017-12-14 09:19:14', 'User admin signed in at 2017-12-14 11:19:14.'),
(597, 17, 'sign_in', '2017-12-14 09:21:19', 'User user signed in at 2017-12-14 11:21:19.'),
(598, 1, 'sign_in', '2017-12-14 09:34:46', 'User admin signed in at 2017-12-14 11:34:46.'),
(599, 17, 'sign_in', '2017-12-14 09:35:12', 'User user signed in at 2017-12-14 11:35:12.'),
(600, 1, 'sign_in', '2017-12-14 09:35:55', 'User admin signed in at 2017-12-14 11:35:55.'),
(601, 1, 'sign_in', '2017-12-14 09:36:42', 'User admin signed in at 2017-12-14 11:36:42.'),
(602, 17, 'sign_in', '2017-12-14 09:36:47', 'User user signed in at 2017-12-14 11:36:47.'),
(603, 1, 'sign_in', '2017-12-14 09:37:14', 'User admin signed in at 2017-12-14 11:37:14.'),
(604, 17, 'sign_in', '2017-12-14 09:44:23', 'User user signed in at 2017-12-14 11:44:23.'),
(605, 1, 'sign_in', '2017-12-14 09:44:42', 'User admin signed in at 2017-12-14 11:44:42.'),
(606, 17, 'sign_in', '2017-12-14 09:59:03', 'User user signed in at 2017-12-14 11:59:03.'),
(607, 1, 'sign_in', '2017-12-14 10:03:06', 'User admin signed in at 2017-12-14 12:03:06.'),
(608, 17, 'sign_in', '2017-12-14 10:03:53', 'User user signed in at 2017-12-14 12:03:53.'),
(609, 1, 'sign_in', '2017-12-14 10:05:44', 'User admin signed in at 2017-12-14 12:05:44.'),
(610, 17, 'sign_in', '2017-12-14 10:06:37', 'User user signed in at 2017-12-14 12:06:37.'),
(611, 1, 'sign_in', '2017-12-14 10:24:38', 'User admin signed in at 2017-12-14 12:24:38.'),
(612, 17, 'sign_in', '2017-12-14 10:24:42', 'User user signed in at 2017-12-14 12:24:42.'),
(613, 17, 'sign_in', '2017-12-14 10:25:41', 'User user signed in at 2017-12-14 12:25:41.'),
(614, 1, 'sign_in', '2017-12-14 10:25:46', 'User admin signed in at 2017-12-14 12:25:46.'),
(615, 17, 'sign_in', '2017-12-14 10:25:52', 'User user signed in at 2017-12-14 12:25:52.'),
(616, 1, 'sign_in', '2017-12-14 10:31:42', 'User admin signed in at 2017-12-14 12:31:42.'),
(617, 17, 'sign_in', '2017-12-14 10:35:33', 'User user signed in at 2017-12-14 12:35:33.'),
(618, 1, 'sign_in', '2017-12-14 10:35:38', 'User admin signed in at 2017-12-14 12:35:38.'),
(619, 17, 'sign_in', '2017-12-14 10:35:47', 'User user signed in at 2017-12-14 12:35:47.'),
(620, 1, 'sign_in', '2017-12-14 12:00:17', 'User admin signed in at 2017-12-14 14:00:17.'),
(621, 17, 'sign_in', '2017-12-14 12:00:22', 'User user signed in at 2017-12-14 14:00:22.'),
(622, 1, 'sign_in', '2017-12-14 12:00:37', 'User admin signed in at 2017-12-14 14:00:37.'),
(623, 17, 'sign_in', '2017-12-14 12:00:43', 'User user signed in at 2017-12-14 14:00:43.'),
(624, 1, 'sign_in', '2017-12-14 12:11:54', 'User admin signed in at 2017-12-14 14:11:54.'),
(625, 17, 'sign_in', '2017-12-14 12:14:26', 'User user signed in at 2017-12-14 14:14:26.'),
(626, 1, 'sign_in', '2017-12-14 12:43:39', 'User admin signed in at 2017-12-14 14:43:39.'),
(627, 17, 'sign_in', '2017-12-14 12:43:55', 'User user signed in at 2017-12-14 14:43:55.'),
(628, 1, 'sign_in', '2017-12-14 12:47:02', 'User admin signed in at 2017-12-14 14:47:02.'),
(629, 17, 'sign_in', '2017-12-14 12:48:16', 'User user signed in at 2017-12-14 14:48:16.'),
(630, 1, 'sign_in', '2017-12-14 12:48:39', 'User admin signed in at 2017-12-14 14:48:39.'),
(631, 17, 'sign_in', '2017-12-14 12:49:54', 'User user signed in at 2017-12-14 14:49:54.'),
(632, 1, 'sign_in', '2017-12-14 13:02:06', 'User admin signed in at 2017-12-14 15:02:06.'),
(633, 17, 'sign_in', '2017-12-14 13:03:44', 'User user signed in at 2017-12-14 15:03:44.'),
(634, 17, 'sign_in', '2017-12-14 13:06:07', 'User user signed in at 2017-12-14 15:06:07.'),
(635, 1, 'sign_in', '2017-12-14 13:07:53', 'User admin signed in at 2017-12-14 15:07:53.'),
(636, 1, 'sign_in', '2017-12-17 07:08:18', 'User admin signed in at 2017-12-17 09:08:18.'),
(637, 17, 'sign_in', '2017-12-17 07:47:42', 'User user signed in at 2017-12-17 09:47:42.'),
(638, 1, 'sign_in', '2017-12-17 07:50:45', 'User admin signed in at 2017-12-17 09:50:45.'),
(639, 17, 'sign_in', '2017-12-17 08:07:01', 'User user signed in at 2017-12-17 10:07:01.'),
(640, 1, 'sign_in', '2017-12-17 08:07:06', 'User admin signed in at 2017-12-17 10:07:06.'),
(641, 17, 'sign_in', '2017-12-17 08:31:39', 'User user signed in at 2017-12-17 10:31:39.'),
(642, 1, 'sign_in', '2017-12-17 08:31:52', 'User admin signed in at 2017-12-17 10:31:52.'),
(643, 48, 'sign_up', '2017-12-17 08:42:06', 'User sameh was created by admin on 2017-12-17 10:42:06.'),
(644, 48, 'password_reset_request', '2017-12-17 08:42:06', 'User sameh requested a password reset on 2017-12-17 10:42:06.'),
(645, 17, 'sign_in', '2017-12-17 08:43:31', 'User user signed in at 2017-12-17 10:43:31.'),
(646, 1, 'sign_in', '2017-12-17 08:44:16', 'User admin signed in at 2017-12-17 10:44:16.'),
(647, 17, 'sign_in', '2017-12-17 08:44:35', 'User user signed in at 2017-12-17 10:44:35.'),
(648, 1, 'sign_in', '2017-12-17 08:44:56', 'User admin signed in at 2017-12-17 10:44:56.'),
(649, 17, 'sign_in', '2017-12-17 08:45:22', 'User user signed in at 2017-12-17 10:45:22.'),
(650, 1, 'sign_in', '2017-12-17 08:46:41', 'User admin signed in at 2017-12-17 10:46:41.'),
(651, 17, 'sign_in', '2017-12-17 08:46:52', 'User user signed in at 2017-12-17 10:46:52.'),
(652, 1, 'sign_in', '2017-12-17 08:49:06', 'User admin signed in at 2017-12-17 10:49:06.'),
(653, 17, 'sign_in', '2017-12-17 08:57:15', 'User user signed in at 2017-12-17 10:57:15.'),
(654, 1, 'sign_in', '2017-12-17 08:59:42', 'User admin signed in at 2017-12-17 10:59:42.'),
(655, 17, 'sign_in', '2017-12-17 09:01:19', 'User user signed in at 2017-12-17 11:01:19.'),
(656, 1, 'sign_in', '2017-12-17 09:24:57', 'User admin signed in at 2017-12-17 11:24:57.'),
(657, 17, 'sign_in', '2017-12-17 09:25:37', 'User user signed in at 2017-12-17 11:25:37.'),
(658, 1, 'sign_in', '2017-12-17 09:30:56', 'User admin signed in at 2017-12-17 11:30:56.'),
(659, 17, 'sign_in', '2017-12-17 09:32:23', 'User user signed in at 2017-12-17 11:32:23.'),
(660, 1, 'sign_in', '2017-12-17 09:41:39', 'User admin signed in at 2017-12-17 11:41:39.'),
(661, 17, 'sign_in', '2017-12-17 09:41:50', 'User user signed in at 2017-12-17 11:41:50.'),
(662, 1, 'sign_in', '2017-12-17 10:24:45', 'User admin signed in at 2017-12-17 12:24:45.'),
(663, 17, 'sign_in', '2017-12-17 10:26:42', 'User user signed in at 2017-12-17 12:26:42.'),
(664, 17, 'sign_in', '2017-12-17 10:31:59', 'User user signed in at 2017-12-17 12:31:59.'),
(665, 1, 'sign_in', '2017-12-17 10:36:26', 'User admin signed in at 2017-12-17 12:36:26.'),
(666, 17, 'sign_in', '2017-12-17 12:09:54', 'User user signed in at 2017-12-17 14:09:54.'),
(667, 1, 'sign_in', '2017-12-17 12:10:52', 'User admin signed in at 2017-12-17 14:10:52.'),
(668, 17, 'sign_in', '2017-12-17 12:12:19', 'User user signed in at 2017-12-17 14:12:19.'),
(669, 1, 'sign_in', '2017-12-17 12:28:04', 'User admin signed in at 2017-12-17 14:28:04.'),
(670, 17, 'sign_in', '2017-12-17 12:36:33', 'User user signed in at 2017-12-17 14:36:33.'),
(671, 1, 'sign_in', '2017-12-17 12:36:59', 'User admin signed in at 2017-12-17 14:36:59.'),
(672, 17, 'sign_in', '2017-12-17 12:37:15', 'User user signed in at 2017-12-17 14:37:15.'),
(673, 1, 'sign_in', '2017-12-17 12:38:29', 'User admin signed in at 2017-12-17 14:38:29.'),
(674, 17, 'sign_in', '2017-12-17 12:39:11', 'User user signed in at 2017-12-17 14:39:11.'),
(675, 1, 'sign_in', '2017-12-17 12:39:21', 'User admin signed in at 2017-12-17 14:39:21.'),
(676, 17, 'sign_in', '2017-12-17 12:40:02', 'User user signed in at 2017-12-17 14:40:02.'),
(677, 1, 'sign_in', '2017-12-17 12:41:23', 'User admin signed in at 2017-12-17 14:41:23.'),
(678, 17, 'sign_in', '2017-12-17 12:42:01', 'User user signed in at 2017-12-17 14:42:01.'),
(679, 1, 'sign_in', '2017-12-17 12:51:34', 'User admin signed in at 2017-12-17 14:51:34.'),
(680, 1, 'sign_in', '2017-12-17 12:58:22', 'User admin signed in at 2017-12-17 14:58:22.'),
(681, 17, 'sign_in', '2017-12-17 12:58:28', 'User user signed in at 2017-12-17 14:58:28.'),
(682, 1, 'sign_in', '2017-12-17 13:10:07', 'User admin signed in at 2017-12-17 15:10:07.'),
(683, 17, 'sign_in', '2017-12-17 13:10:41', 'User user signed in at 2017-12-17 15:10:41.'),
(684, 1, 'sign_in', '2017-12-17 13:30:54', 'User admin signed in at 2017-12-17 15:30:54.'),
(685, 17, 'sign_in', '2017-12-17 13:33:53', 'User user signed in at 2017-12-17 15:33:53.'),
(686, 17, 'sign_in', '2017-12-17 13:42:20', 'User user signed in at 2017-12-17 15:42:20.'),
(687, 17, 'sign_in', '2017-12-17 13:43:57', 'User user signed in at 2017-12-17 15:43:57.'),
(688, 17, 'sign_in', '2017-12-17 13:44:09', 'User user signed in at 2017-12-17 15:44:09.'),
(689, 1, 'sign_in', '2017-12-17 13:44:15', 'User admin signed in at 2017-12-17 15:44:15.'),
(690, 17, 'sign_in', '2017-12-17 13:45:33', 'User user signed in at 2017-12-17 15:45:33.'),
(691, 17, 'sign_in', '2017-12-17 13:45:52', 'User user signed in at 2017-12-17 15:45:52.'),
(692, 17, 'sign_in', '2017-12-17 13:48:06', 'User user signed in at 2017-12-17 15:48:06.'),
(693, 17, 'sign_in', '2017-12-17 13:48:36', 'User user signed in at 2017-12-17 15:48:36.'),
(694, 17, 'sign_in', '2017-12-17 13:49:26', 'User user signed in at 2017-12-17 15:49:26.'),
(695, 1, 'sign_in', '2017-12-17 13:52:12', 'User admin signed in at 2017-12-17 15:52:12.'),
(696, 17, 'sign_in', '2017-12-17 14:01:28', 'User user signed in at 2017-12-17 16:01:28.'),
(697, 1, 'sign_in', '2017-12-17 14:06:13', 'User admin signed in at 2017-12-17 16:06:13.'),
(698, 17, 'sign_in', '2017-12-17 14:06:25', 'User user signed in at 2017-12-17 16:06:25.'),
(699, 1, 'sign_in', '2017-12-17 14:15:55', 'User admin signed in at 2017-12-17 16:15:55.'),
(700, 17, 'sign_in', '2017-12-17 14:22:08', 'User user signed in at 2017-12-17 16:22:08.'),
(701, 1, 'sign_in', '2017-12-18 06:57:17', 'User admin signed in at 2017-12-18 08:57:17.'),
(702, 17, 'sign_in', '2017-12-18 06:57:55', 'User user signed in at 2017-12-18 08:57:55.'),
(703, 1, 'sign_in', '2017-12-18 06:58:54', 'User admin signed in at 2017-12-18 08:58:54.'),
(704, 17, 'sign_in', '2017-12-18 07:01:55', 'User user signed in at 2017-12-18 09:01:55.'),
(705, 17, 'sign_in', '2017-12-18 07:30:04', 'User user signed in at 2017-12-18 09:30:04.'),
(706, 17, 'sign_in', '2017-12-18 07:39:18', 'User user signed in at 2017-12-18 09:39:18.'),
(707, 1, 'sign_in', '2017-12-18 07:43:30', 'User admin signed in at 2017-12-18 09:43:30.'),
(708, 17, 'sign_in', '2017-12-18 07:46:48', 'User user signed in at 2017-12-18 09:46:48.'),
(709, 1, 'sign_in', '2017-12-18 08:54:43', 'User admin signed in at 2017-12-18 10:54:43.'),
(710, 17, 'sign_in', '2017-12-18 08:55:57', 'User user signed in at 2017-12-18 10:55:57.'),
(711, 1, 'sign_in', '2017-12-18 08:59:57', 'User admin signed in at 2017-12-18 10:59:57.'),
(712, 17, 'sign_in', '2017-12-18 09:24:53', 'User user signed in at 2017-12-18 11:24:53.'),
(713, 17, 'sign_in', '2017-12-18 09:26:50', 'User user signed in at 2017-12-18 11:26:50.'),
(714, 17, 'sign_in', '2017-12-18 09:27:11', 'User user signed in at 2017-12-18 11:27:11.'),
(715, 17, 'sign_in', '2017-12-18 09:28:54', 'User user signed in at 2017-12-18 11:28:54.'),
(716, 17, 'sign_in', '2017-12-18 09:29:58', 'User user signed in at 2017-12-18 11:29:58.'),
(717, 17, 'sign_in', '2017-12-18 09:30:50', 'User user signed in at 2017-12-18 11:30:50.'),
(718, 17, 'sign_in', '2017-12-18 09:32:25', 'User user signed in at 2017-12-18 11:32:25.'),
(719, 17, 'sign_in', '2017-12-18 09:32:34', 'User user signed in at 2017-12-18 11:32:34.'),
(720, 1, 'sign_in', '2017-12-18 09:36:40', 'User admin signed in at 2017-12-18 11:36:40.'),
(723, 1, 'sign_in', '2017-12-18 09:37:15', 'User admin signed in at 2017-12-18 11:37:15.'),
(725, 1, 'sign_in', '2017-12-18 12:01:07', 'User admin signed in at 2017-12-18 14:01:07.'),
(726, 17, 'sign_in', '2017-12-18 12:05:46', 'User user signed in at 2017-12-18 14:05:46.'),
(727, 1, 'sign_in', '2017-12-18 12:06:20', 'User admin signed in at 2017-12-18 14:06:20.'),
(728, 17, 'sign_in', '2017-12-18 12:08:55', 'User user signed in at 2017-12-18 14:08:55.'),
(729, 1, 'sign_in', '2017-12-18 12:11:21', 'User admin signed in at 2017-12-18 14:11:21.'),
(730, 1, 'sign_in', '2017-12-18 12:13:23', 'User admin signed in at 2017-12-18 14:13:23.'),
(731, 1, 'sign_in', '2017-12-18 12:13:53', 'User admin signed in at 2017-12-18 14:13:53.'),
(732, 17, 'sign_in', '2017-12-18 12:14:26', 'User user signed in at 2017-12-18 14:14:26.'),
(733, 1, 'sign_in', '2017-12-18 12:16:31', 'User admin signed in at 2017-12-18 14:16:31.'),
(734, 1, 'sign_in', '2017-12-18 12:20:29', 'User admin signed in at 2017-12-18 14:20:29.'),
(735, 17, 'sign_in', '2017-12-18 12:20:39', 'User user signed in at 2017-12-18 14:20:39.'),
(736, 1, 'sign_in', '2017-12-18 12:24:43', 'User admin signed in at 2017-12-18 14:24:43.'),
(737, 17, 'sign_in', '2017-12-18 12:33:02', 'User user signed in at 2017-12-18 14:33:02.'),
(738, 1, 'sign_in', '2017-12-18 12:33:57', 'User admin signed in at 2017-12-18 14:33:57.'),
(739, 17, 'sign_in', '2017-12-18 12:34:09', 'User user signed in at 2017-12-18 14:34:09.'),
(740, 1, 'sign_in', '2017-12-18 12:36:10', 'User admin signed in at 2017-12-18 14:36:10.'),
(741, 17, 'sign_in', '2017-12-18 12:36:20', 'User user signed in at 2017-12-18 14:36:20.'),
(742, 1, 'sign_in', '2017-12-18 12:37:49', 'User admin signed in at 2017-12-18 14:37:49.'),
(743, 17, 'sign_in', '2017-12-18 12:38:11', 'User user signed in at 2017-12-18 14:38:11.'),
(744, 1, 'sign_in', '2017-12-18 12:39:35', 'User admin signed in at 2017-12-18 14:39:35.'),
(745, 1, 'sign_in', '2017-12-18 12:41:10', 'User admin signed in at 2017-12-18 14:41:10.'),
(746, 17, 'sign_in', '2017-12-18 12:41:43', 'User user signed in at 2017-12-18 14:41:43.'),
(747, 17, 'sign_in', '2017-12-18 12:44:46', 'User user signed in at 2017-12-18 14:44:46.'),
(749, 1, 'sign_in', '2017-12-18 13:01:19', 'User admin signed in at 2017-12-18 15:01:19.'),
(750, 17, 'sign_in', '2017-12-18 13:09:11', 'User user signed in at 2017-12-18 15:09:11.'),
(751, 1, 'sign_in', '2017-12-18 13:09:51', 'User admin signed in at 2017-12-18 15:09:51.'),
(752, 1, 'sign_in', '2017-12-18 13:34:03', 'User admin signed in at 2017-12-18 15:34:03.'),
(753, 17, 'sign_in', '2017-12-18 13:50:55', 'User user signed in at 2017-12-18 15:50:55.'),
(754, 1, 'sign_in', '2017-12-18 13:56:54', 'User admin signed in at 2017-12-18 15:56:54.'),
(755, 17, 'sign_in', '2017-12-18 13:58:34', 'User user signed in at 2017-12-18 15:58:34.'),
(756, 1, 'sign_in', '2017-12-18 13:59:02', 'User admin signed in at 2017-12-18 15:59:02.'),
(757, 17, 'sign_in', '2017-12-19 09:02:01', 'User user signed in at 2017-12-19 11:02:01.'),
(758, 1, 'sign_in', '2017-12-19 09:02:44', 'User admin signed in at 2017-12-19 11:02:44.'),
(759, 17, 'sign_in', '2017-12-20 18:03:17', 'User user signed in at 2017-12-20 20:03:17.'),
(760, 1, 'sign_in', '2017-12-20 18:08:52', 'User admin signed in at 2017-12-20 20:08:52.'),
(762, 1, 'sign_in', '2017-12-21 06:38:33', 'User admin signed in at 2017-12-21 08:38:33.'),
(763, 1, 'sign_in', '2017-12-21 07:47:20', 'User admin signed in at 2017-12-21 09:47:20.'),
(765, 17, 'sign_in', '2017-12-21 09:31:46', 'User user signed in at 2017-12-21 11:31:46.'),
(766, 1, 'sign_in', '2017-12-21 09:32:46', 'User admin signed in at 2017-12-21 11:32:46.'),
(767, 1, 'sign_in', '2017-12-21 09:34:58', 'User admin signed in at 2017-12-21 11:34:58.'),
(768, 1, 'sign_in', '2017-12-24 14:04:31', 'User admin signed in at 2017-12-24 16:04:31.'),
(769, 1, 'sign_in', '2017-12-24 14:21:35', 'User admin signed in at 2017-12-24 16:21:35.'),
(770, 1, 'sign_in', '2017-12-24 14:24:04', 'User admin signed in at 2017-12-24 16:24:04.'),
(771, 17, 'sign_in', '2018-01-24 12:36:04', 'User user signed in at 2018-01-24 14:36:04.'),
(772, 1, 'sign_in', '2018-01-24 12:36:09', 'User admin signed in at 2018-01-24 14:36:09.'),
(773, 1, 'sign_in', '2018-01-24 12:37:09', 'User admin signed in at 2018-01-24 14:37:09.'),
(774, 17, 'sign_in', '2018-01-24 16:08:19', 'User user signed in at 2018-01-24 18:08:19.'),
(775, 1, 'sign_in', '2018-01-25 07:19:04', 'User admin signed in at 2018-01-25 09:19:04.'),
(776, 17, 'sign_in', '2018-01-25 07:56:50', 'User user signed in at 2018-01-25 09:56:50.'),
(778, 1, 'sign_in', '2018-01-25 07:58:07', 'User admin signed in at 2018-01-25 09:58:07.'),
(779, 1, 'sign_in', '2018-02-04 10:07:15', 'User admin signed in at 2018-02-04 12:07:15.'),
(780, 17, 'sign_in', '2018-02-04 11:26:11', 'User user signed in at 2018-02-04 13:26:11.'),
(781, 1, 'sign_in', '2018-02-04 11:36:06', 'User admin signed in at 2018-02-04 13:36:06.'),
(782, 17, 'sign_in', '2018-02-04 12:27:21', 'User user signed in at 2018-02-04 14:27:21.'),
(783, 1, 'sign_in', '2018-02-04 12:27:43', 'User admin signed in at 2018-02-04 14:27:43.'),
(784, 1, 'sign_in', '2018-02-04 13:33:31', 'User admin signed in at 2018-02-04 15:33:31.'),
(785, 1, 'sign_in', '2018-02-05 13:51:16', 'User admin signed in at 2018-02-05 15:51:16.'),
(786, 1, 'sign_in', '2018-02-06 14:15:15', 'User admin signed in at 2018-02-06 16:15:15.'),
(787, 17, 'sign_in', '2018-02-08 08:23:25', 'User user signed in at 2018-02-08 10:23:25.'),
(788, 1, 'sign_in', '2018-02-08 08:23:53', 'User admin signed in at 2018-02-08 10:23:53.'),
(789, 1, 'sign_in', '2018-02-08 08:53:45', 'User admin signed in at 2018-02-08 10:53:45.'),
(790, 1, 'sign_in', '2018-02-08 08:56:57', 'User admin signed in at 2018-02-08 10:56:57.'),
(791, 17, 'sign_in', '2018-02-08 09:05:59', 'User user signed in at 2018-02-08 11:05:59.'),
(792, 1, 'sign_in', '2018-02-08 09:09:39', 'User admin signed in at 2018-02-08 11:09:39.'),
(793, 17, 'sign_in', '2018-02-08 09:39:55', 'User user signed in at 2018-02-08 11:39:55.'),
(794, 1, 'sign_in', '2018-02-08 09:40:07', 'User admin signed in at 2018-02-08 11:40:07.'),
(795, 1, 'sign_in', '2018-02-08 09:50:00', 'User admin signed in at 2018-02-08 11:50:00.'),
(796, 1, 'sign_in', '2018-02-11 06:19:50', 'User admin signed in at 2018-02-11 08:19:50.'),
(799, 1, 'sign_in', '2018-02-11 11:55:20', 'User admin signed in at 2018-02-11 13:55:20.'),
(800, 1, 'sign_in', '2018-02-12 12:03:12', 'User admin signed in at 2018-02-12 14:03:12.'),
(801, 17, 'sign_in', '2018-02-13 07:58:11', 'User user signed in at 2018-02-13 09:58:11.'),
(802, 1, 'sign_in', '2018-02-13 08:02:32', 'User admin signed in at 2018-02-13 10:02:32.'),
(803, 1, 'sign_in', '2018-02-14 10:53:27', 'User admin signed in at 2018-02-14 12:53:27.'),
(804, 1, 'sign_in', '2018-02-14 11:24:12', 'User admin signed in at 2018-02-14 13:24:12.'),
(805, 1, 'sign_in', '2018-02-14 16:25:44', 'User admin signed in at 2018-02-14 18:25:44.'),
(806, 1, 'sign_in', '2018-02-14 16:26:24', 'User admin signed in at 2018-02-14 18:26:24.'),
(807, 17, 'sign_in', '2018-02-15 13:10:08', 'User user signed in at 2018-02-15 15:10:08.'),
(808, 1, 'sign_in', '2018-02-15 13:11:13', 'User admin signed in at 2018-02-15 15:11:13.'),
(809, 1, 'sign_in', '2018-02-15 13:11:41', 'User admin signed in at 2018-02-15 15:11:41.'),
(810, 1, 'sign_in', '2018-02-16 09:08:08', 'User admin signed in at 2018-02-16 11:08:08.'),
(811, 1, 'sign_in', '2018-02-16 16:23:18', 'User admin signed in at 2018-02-16 18:23:18.'),
(812, 17, 'sign_in', '2018-02-17 05:23:06', 'User user signed in at 2018-02-17 07:23:06.'),
(813, 1, 'sign_in', '2018-02-17 05:24:11', 'User admin signed in at 2018-02-17 07:24:11.'),
(814, 1, 'sign_in', '2018-02-17 15:26:48', 'User admin signed in at 2018-02-17 17:26:48.'),
(815, 1, 'sign_in', '2018-02-18 06:27:37', 'User admin signed in at 2018-02-18 08:27:37.'),
(816, 1, 'sign_in', '2018-02-18 11:38:36', 'User admin signed in at 2018-02-18 13:38:36.'),
(817, 17, 'sign_in', '2018-02-18 12:37:56', 'User user signed in at 2018-02-18 14:37:56.'),
(818, 1, 'sign_in', '2018-02-18 13:00:53', 'User admin signed in at 2018-02-18 15:00:53.'),
(819, 17, 'sign_in', '2018-02-18 13:05:58', 'User user signed in at 2018-02-18 15:05:58.'),
(820, 1, 'sign_in', '2018-02-18 13:38:29', 'User admin signed in at 2018-02-18 15:38:29.'),
(821, 17, 'sign_in', '2018-02-18 13:40:23', 'User user signed in at 2018-02-18 15:40:23.'),
(822, 17, 'sign_in', '2018-02-18 14:10:24', 'User user signed in at 2018-02-18 16:10:24.'),
(823, 17, 'sign_in', '2018-02-18 14:10:47', 'User user signed in at 2018-02-18 16:10:47.'),
(824, 1, 'sign_in', '2018-02-18 14:41:14', 'User admin signed in at 2018-02-18 16:41:14.'),
(825, 1, 'sign_in', '2018-02-19 03:53:07', 'User admin signed in at 2018-02-19 05:53:07.'),
(826, 17, 'sign_in', '2018-02-19 04:06:25', 'User user signed in at 2018-02-19 06:06:25.'),
(827, 17, 'sign_in', '2018-02-19 04:26:44', 'User user signed in at 2018-02-19 06:26:44.'),
(828, 17, 'sign_in', '2018-02-19 04:27:05', 'User user signed in at 2018-02-19 06:27:05.'),
(829, 1, 'sign_in', '2018-02-19 04:40:30', 'User admin signed in at 2018-02-19 06:40:30.'),
(830, 17, 'sign_in', '2018-02-19 04:40:56', 'User user signed in at 2018-02-19 06:40:56.'),
(831, 1, 'sign_in', '2018-02-19 06:07:13', 'User admin signed in at 2018-02-19 08:07:13.'),
(832, 17, 'sign_in', '2018-02-19 06:07:41', 'User user signed in at 2018-02-19 08:07:41.'),
(833, 17, 'sign_in', '2018-02-19 06:15:24', 'User user signed in at 2018-02-19 08:15:24.'),
(834, 17, 'sign_in', '2018-02-19 07:00:40', 'User user signed in at 2018-02-19 09:00:40.'),
(835, 1, 'sign_in', '2018-02-19 07:00:56', 'User admin signed in at 2018-02-19 09:00:56.'),
(836, 17, 'sign_in', '2018-02-19 07:31:03', 'User user signed in at 2018-02-19 09:31:03.'),
(837, 1, 'sign_in', '2018-02-19 07:45:46', 'User admin signed in at 2018-02-19 09:45:46.'),
(838, 17, 'sign_in', '2018-02-19 07:46:56', 'User user signed in at 2018-02-19 09:46:56.'),
(839, 1, 'sign_in', '2018-02-19 08:24:05', 'User admin signed in at 2018-02-19 10:24:05.'),
(840, 17, 'sign_in', '2018-02-20 06:52:11', 'User user signed in at 2018-02-20 08:52:11.'),
(841, 1, 'sign_in', '2018-02-20 06:53:09', 'User admin signed in at 2018-02-20 08:53:09.'),
(842, 17, 'sign_in', '2018-02-20 06:55:18', 'User user signed in at 2018-02-20 08:55:18.'),
(843, 17, 'sign_in', '2018-02-20 07:17:40', 'User user signed in at 2018-02-20 09:17:40.'),
(844, 1, 'sign_in', '2018-02-20 08:00:31', 'User admin signed in at 2018-02-20 10:00:31.'),
(845, 17, 'sign_in', '2018-02-20 08:05:06', 'User user signed in at 2018-02-20 10:05:06.'),
(846, 1, 'sign_in', '2018-02-20 08:12:38', 'User admin signed in at 2018-02-20 10:12:38.'),
(847, 17, 'sign_in', '2018-02-20 08:14:39', 'User user signed in at 2018-02-20 10:14:39.'),
(848, 1, 'sign_in', '2018-02-20 08:30:10', 'User admin signed in at 2018-02-20 10:30:10.'),
(849, 17, 'sign_in', '2018-02-20 08:54:39', 'User user signed in at 2018-02-20 10:54:39.'),
(850, 1, 'sign_in', '2018-02-20 08:55:04', 'User admin signed in at 2018-02-20 10:55:04.'),
(851, 1, 'sign_in', '2018-02-20 08:57:34', 'User admin signed in at 2018-02-20 10:57:34.'),
(852, 17, 'sign_in', '2018-02-20 08:57:46', 'User user signed in at 2018-02-20 10:57:46.'),
(853, 1, 'sign_in', '2018-02-20 08:58:24', 'User admin signed in at 2018-02-20 10:58:24.'),
(854, 17, 'sign_in', '2018-02-20 08:58:44', 'User user signed in at 2018-02-20 10:58:44.'),
(855, 1, 'sign_in', '2018-02-20 12:46:14', 'User admin signed in at 2018-02-20 14:46:14.'),
(856, 1, 'sign_in', '2018-02-20 12:46:50', 'User admin signed in at 2018-02-20 14:46:50.'),
(857, 1, 'sign_in', '2018-02-20 13:02:56', 'User admin signed in at 2018-02-20 15:02:56.'),
(858, 1, 'sign_in', '2018-02-20 13:08:47', 'User admin signed in at 2018-02-20 15:08:47.'),
(859, 1, 'sign_in', '2018-02-20 13:19:50', 'User admin signed in at 2018-02-20 15:19:50.'),
(860, 17, 'sign_in', '2018-02-20 13:58:58', 'User user signed in at 2018-02-20 15:58:58.'),
(861, 17, 'sign_in', '2018-02-20 19:05:04', 'User user signed in at 2018-02-20 21:05:04.'),
(862, 1, 'sign_in', '2018-02-21 14:09:35', 'User admin signed in at 2018-02-21 16:09:35.'),
(863, 17, 'sign_in', '2018-02-22 06:32:21', 'User user signed in at 2018-02-22 08:32:21.'),
(864, 17, 'sign_in', '2018-02-22 07:13:13', 'User user signed in at 2018-02-22 09:13:13.'),
(865, 1, 'sign_in', '2018-02-22 09:07:45', 'User admin signed in at 2018-02-22 11:07:45.'),
(866, 17, 'sign_in', '2018-02-22 09:10:17', 'User user signed in at 2018-02-22 11:10:17.'),
(867, 1, 'sign_in', '2018-02-22 09:28:29', 'User admin signed in at 2018-02-22 11:28:29.'),
(868, 17, 'sign_in', '2018-02-22 09:55:34', 'User user signed in at 2018-02-22 11:55:34.'),
(870, 17, 'sign_in', '2018-02-22 13:24:45', 'User user signed in at 2018-02-22 15:24:45.'),
(872, 17, 'sign_in', '2018-02-22 13:40:51', 'User user signed in at 2018-02-22 15:40:51.'),
(873, 1, 'sign_in', '2018-02-22 16:25:53', 'User admin signed in at 2018-02-22 18:25:53.'),
(874, 17, 'sign_in', '2018-02-22 16:33:51', 'User user signed in at 2018-02-22 18:33:51.'),
(875, 1, 'sign_in', '2018-02-23 02:32:26', 'User admin signed in at 2018-02-23 04:32:26.'),
(876, 17, 'sign_in', '2018-02-23 02:35:06', 'User user signed in at 2018-02-23 04:35:06.'),
(877, 1, 'sign_in', '2018-02-23 03:18:50', 'User admin signed in at 2018-02-23 05:18:50.'),
(878, 17, 'sign_in', '2018-02-23 03:26:49', 'User user signed in at 2018-02-23 05:26:49.'),
(879, 1, 'sign_in', '2018-02-23 03:27:18', 'User admin signed in at 2018-02-23 05:27:18.'),
(880, 17, 'sign_in', '2018-02-23 03:37:14', 'User user signed in at 2018-02-23 05:37:14.'),
(881, 17, 'sign_in', '2018-02-23 03:56:09', 'User user signed in at 2018-02-23 05:56:09.'),
(882, 17, 'sign_in', '2018-02-23 04:03:57', 'User user signed in at 2018-02-23 06:03:57.'),
(883, 1, 'sign_in', '2018-02-23 04:04:07', 'User admin signed in at 2018-02-23 06:04:07.'),
(884, 17, 'sign_in', '2018-02-23 04:05:40', 'User user signed in at 2018-02-23 06:05:40.'),
(885, 1, 'sign_in', '2018-02-23 05:54:37', 'User admin signed in at 2018-02-23 07:54:37.'),
(886, 17, 'sign_in', '2018-02-23 05:56:05', 'User user signed in at 2018-02-23 07:56:05.'),
(887, 1, 'sign_in', '2018-02-23 06:00:11', 'User admin signed in at 2018-02-23 08:00:11.'),
(888, 17, 'sign_in', '2018-02-23 06:06:12', 'User user signed in at 2018-02-23 08:06:12.'),
(889, 17, 'sign_in', '2018-02-23 07:28:15', 'User user signed in at 2018-02-23 09:28:15.'),
(890, 17, 'sign_in', '2018-02-23 07:29:35', 'User user signed in at 2018-02-23 09:29:35.'),
(891, 1, 'sign_in', '2018-02-23 07:33:13', 'User admin signed in at 2018-02-23 09:33:13.'),
(892, 17, 'sign_in', '2018-02-24 13:12:06', 'User user signed in at 2018-02-24 15:12:06.'),
(893, 17, 'sign_in', '2018-02-25 06:28:00', 'User user signed in at 2018-02-25 08:28:00.'),
(894, 1, 'sign_in', '2018-02-25 06:50:34', 'User admin signed in at 2018-02-25 08:50:34.'),
(895, 17, 'sign_in', '2018-02-25 06:59:30', 'User user signed in at 2018-02-25 08:59:30.'),
(896, 1, 'sign_in', '2018-02-25 06:59:43', 'User admin signed in at 2018-02-25 08:59:43.'),
(897, 17, 'sign_in', '2018-02-25 07:14:02', 'User user signed in at 2018-02-25 09:14:02.'),
(898, 1, 'sign_in', '2018-02-25 07:15:08', 'User admin signed in at 2018-02-25 09:15:08.'),
(899, 17, 'sign_in', '2018-02-25 09:47:47', 'User user signed in at 2018-02-25 11:47:47.'),
(900, 1, 'sign_in', '2018-02-25 10:02:34', 'User admin signed in at 2018-02-25 12:02:34.'),
(901, 17, 'sign_in', '2018-02-25 12:12:35', 'User user signed in at 2018-02-25 14:12:35.'),
(902, 1, 'sign_in', '2018-02-25 12:13:10', 'User admin signed in at 2018-02-25 14:13:10.'),
(903, 17, 'sign_in', '2018-02-25 13:01:33', 'User user signed in at 2018-02-25 15:01:33.'),
(904, 1, 'sign_in', '2018-02-25 13:01:51', 'User admin signed in at 2018-02-25 15:01:51.'),
(905, 1, 'sign_in', '2018-02-26 05:51:23', 'User admin signed in at 2018-02-26 07:51:23.'),
(906, 1, 'sign_in', '2018-02-26 07:46:11', 'User admin signed in at 2018-02-26 09:46:11.'),
(907, 1, 'sign_in', '2018-02-26 07:46:39', 'User admin signed in at 2018-02-26 09:46:39.'),
(908, 1, 'sign_in', '2018-02-27 00:26:07', 'User admin signed in at 2018-02-27 02:26:07.'),
(909, 17, 'sign_in', '2018-02-28 04:54:17', 'User user signed in at 2018-02-28 06:54:17.'),
(911, 17, 'sign_in', '2018-02-28 05:02:46', 'User user signed in at 2018-02-28 07:02:46.'),
(912, 1, 'sign_in', '2018-02-28 05:03:17', 'User admin signed in at 2018-02-28 07:03:17.'),
(913, 17, 'sign_in', '2018-02-28 05:05:33', 'User user signed in at 2018-02-28 07:05:33.'),
(914, 17, 'sign_in', '2018-02-28 05:08:18', 'User user signed in at 2018-02-28 07:08:18.'),
(915, 1, 'sign_in', '2018-02-28 05:08:27', 'User admin signed in at 2018-02-28 07:08:27.'),
(916, 1, 'sign_in', '2018-03-01 03:40:07', 'User admin signed in at 2018-03-01 05:40:07.'),
(917, 1, 'sign_in', '2018-03-01 06:59:18', 'User admin signed in at 2018-03-01 08:59:18.'),
(918, 1, 'sign_in', '2018-03-01 07:08:49', 'User admin signed in at 2018-03-01 09:08:49.'),
(919, 1, 'sign_in', '2018-03-01 07:20:50', 'User admin signed in at 2018-03-01 09:20:50.'),
(920, 17, 'sign_in', '2018-03-01 07:30:29', 'User user signed in at 2018-03-01 09:30:29.'),
(921, 1, 'sign_in', '2018-03-01 07:32:14', 'User admin signed in at 2018-03-01 09:32:14.'),
(922, 1, 'sign_in', '2018-03-01 09:57:50', 'User admin signed in at 2018-03-01 11:57:50.'),
(923, 17, 'sign_in', '2018-03-01 10:12:13', 'User user signed in at 2018-03-01 12:12:13.'),
(924, 1, 'sign_in', '2018-03-01 10:15:36', 'User admin signed in at 2018-03-01 12:15:36.'),
(925, 1, 'sign_in', '2018-03-01 10:18:51', 'User admin signed in at 2018-03-01 12:18:51.'),
(926, 1, 'sign_in', '2018-03-01 10:19:07', 'User admin signed in at 2018-03-01 12:19:07.'),
(927, 1, 'sign_in', '2018-03-01 10:21:38', 'User admin signed in at 2018-03-01 12:21:38.'),
(928, 17, 'sign_in', '2018-03-01 10:33:43', 'User user signed in at 2018-03-01 12:33:43.'),
(929, 1, 'sign_in', '2018-03-01 10:34:31', 'User admin signed in at 2018-03-01 12:34:31.'),
(930, 1, 'sign_in', '2018-03-01 10:40:02', 'User admin signed in at 2018-03-01 12:40:02.'),
(931, 17, 'sign_in', '2018-03-01 10:44:39', 'User user signed in at 2018-03-01 12:44:39.'),
(932, 1, 'sign_in', '2018-03-01 10:44:59', 'User admin signed in at 2018-03-01 12:44:59.'),
(933, 1, 'sign_in', '2018-03-01 10:47:27', 'User admin signed in at 2018-03-01 12:47:27.'),
(934, 1, 'sign_in', '2018-03-01 11:12:53', 'User admin signed in at 2018-03-01 13:12:53.'),
(935, 17, 'sign_in', '2018-03-01 11:13:14', 'User user signed in at 2018-03-01 13:13:14.'),
(937, 17, 'sign_in', '2018-03-01 11:18:55', 'User user signed in at 2018-03-01 13:18:55.'),
(938, 1, 'sign_in', '2018-03-01 11:37:22', 'User admin signed in at 2018-03-01 13:37:22.'),
(939, 1, 'sign_in', '2018-03-01 11:53:53', 'User admin signed in at 2018-03-01 13:53:53.'),
(940, 17, 'sign_in', '2018-03-01 12:50:14', 'User user signed in at 2018-03-01 14:50:14.'),
(941, 1, 'sign_in', '2018-03-04 06:21:27', 'User admin signed in at 2018-03-04 08:21:27.'),
(942, 17, 'sign_in', '2018-03-04 07:45:59', 'User user signed in at 2018-03-04 09:45:59.'),
(943, 1, 'sign_in', '2018-03-04 07:50:32', 'User admin signed in at 2018-03-04 09:50:32.'),
(944, 1, 'sign_in', '2018-03-04 07:57:13', 'User admin signed in at 2018-03-04 09:57:13.'),
(945, 1, 'sign_in', '2018-03-04 08:27:14', 'User admin signed in at 2018-03-04 10:27:14.'),
(946, 1, 'sign_in', '2018-03-04 08:31:21', 'User admin signed in at 2018-03-04 10:31:21.'),
(948, 1, 'sign_in', '2018-03-04 12:20:18', 'User admin signed in at 2018-03-04 14:20:18.'),
(949, 17, 'sign_in', '2018-03-04 12:27:09', 'User user signed in at 2018-03-04 14:27:09.'),
(950, 1, 'sign_in', '2018-03-04 12:28:26', 'User admin signed in at 2018-03-04 14:28:26.'),
(951, 17, 'sign_in', '2018-03-04 12:33:47', 'User user signed in at 2018-03-04 14:33:47.'),
(952, 1, 'sign_in', '2018-03-04 12:34:43', 'User admin signed in at 2018-03-04 14:34:43.'),
(955, 1, 'sign_in', '2018-03-04 13:08:07', 'User admin signed in at 2018-03-04 15:08:07.'),
(956, 1, 'sign_in', '2018-03-04 14:24:54', 'User admin signed in at 2018-03-04 16:24:54.'),
(957, 1, 'sign_in', '2018-03-06 07:09:31', 'User admin signed in at 2018-03-06 09:09:31.'),
(958, 17, 'sign_in', '2018-03-06 11:56:46', 'User user signed in at 2018-03-06 13:56:46.'),
(959, 1, 'sign_in', '2018-03-06 12:01:31', 'User admin signed in at 2018-03-06 14:01:31.'),
(960, 1, 'sign_in', '2018-03-08 06:26:40', 'User admin signed in at 2018-03-08 08:26:40.'),
(961, 1, 'sign_in', '2018-03-11 06:27:01', 'User admin signed in at 2018-03-11 08:27:01.'),
(962, 1, 'sign_in', '2018-03-11 08:11:56', 'User admin signed in at 2018-03-11 10:11:56.'),
(963, 1, 'sign_in', '2018-03-11 08:46:53', 'User admin signed in at 2018-03-11 10:46:53.'),
(964, 1, 'sign_in', '2018-03-13 06:27:09', 'User admin signed in at 2018-03-13 08:27:09.'),
(965, 1, 'sign_in', '2018-03-13 10:12:31', 'User admin signed in at 2018-03-13 12:12:31.'),
(966, 1, 'sign_in', '2018-03-14 10:18:47', 'User admin signed in at 2018-03-14 12:18:47.'),
(967, 1, 'sign_in', '2018-03-14 14:25:47', 'User admin signed in at 2018-03-14 16:25:47.'),
(968, 1, 'sign_in', '2018-03-15 06:56:17', 'User admin signed in at 2018-03-15 08:56:17.'),
(969, 17, 'sign_in', '2018-03-15 06:56:45', 'User user signed in at 2018-03-15 08:56:45.'),
(970, 17, 'sign_in', '2018-03-15 06:57:00', 'User user signed in at 2018-03-15 08:57:00.'),
(971, 17, 'sign_in', '2018-03-15 06:58:03', 'User user signed in at 2018-03-15 08:58:03.'),
(972, 17, 'sign_in', '2018-03-15 07:08:21', 'User user signed in at 2018-03-15 09:08:21.'),
(973, 17, 'sign_in', '2018-03-15 07:08:33', 'User user signed in at 2018-03-15 09:08:33.'),
(974, 1, 'sign_in', '2018-03-15 07:09:09', 'User admin signed in at 2018-03-15 09:09:09.'),
(975, 17, 'sign_in', '2018-03-15 07:12:46', 'User user signed in at 2018-03-15 09:12:46.'),
(976, 1, 'sign_in', '2018-03-15 07:17:17', 'User admin signed in at 2018-03-15 09:17:17.'),
(977, 1, 'sign_in', '2018-03-15 07:26:00', 'User admin signed in at 2018-03-15 09:26:00.'),
(978, 1, 'sign_in', '2018-03-15 07:26:26', 'User admin signed in at 2018-03-15 09:26:26.'),
(979, 17, 'sign_in', '2018-03-15 07:26:49', 'User user signed in at 2018-03-15 09:26:49.'),
(980, 1, 'sign_in', '2018-03-15 07:30:00', 'User admin signed in at 2018-03-15 09:30:00.'),
(981, 1, 'sign_in', '2018-03-18 06:51:17', 'User admin signed in at 2018-03-18 08:51:17.'),
(982, 1, 'sign_in', '2018-03-18 08:53:59', 'User admin signed in at 2018-03-18 10:53:59.'),
(983, 1, 'sign_in', '2018-03-18 08:54:32', 'User admin signed in at 2018-03-18 10:54:32.'),
(984, 1, 'sign_in', '2018-03-18 09:58:34', 'User admin signed in at 2018-03-18 11:58:34.'),
(985, 1, 'sign_in', '2018-03-18 11:02:00', 'User admin signed in at 2018-03-18 13:02:00.'),
(986, 1, 'sign_in', '2018-03-20 07:02:14', 'User admin signed in at 2018-03-20 09:02:14.'),
(987, 1, 'sign_in', '2018-03-22 06:54:20', 'User admin signed in at 2018-03-22 08:54:20.'),
(988, 1, 'sign_in', '2018-03-22 09:18:20', 'User admin signed in at 2018-03-22 11:18:20.'),
(989, 1, 'sign_in', '2018-03-22 09:19:21', 'User admin signed in at 2018-03-22 11:19:21.'),
(990, 1, 'sign_in', '2018-03-22 09:20:29', 'User admin signed in at 2018-03-22 11:20:29.'),
(991, 1, 'sign_in', '2018-03-22 09:21:03', 'User admin signed in at 2018-03-22 11:21:03.'),
(992, 1, 'sign_in', '2018-03-22 09:21:24', 'User admin signed in at 2018-03-22 11:21:24.'),
(993, 1, 'sign_in', '2018-03-22 09:28:31', 'User admin signed in at 2018-03-22 11:28:30.'),
(994, 1, 'sign_in', '2018-03-22 09:32:57', 'User admin signed in at 2018-03-22 11:32:57.'),
(995, 1, 'sign_in', '2018-03-22 09:35:10', 'User admin signed in at 2018-03-22 11:35:10.'),
(996, 1, 'sign_in', '2018-03-22 12:17:24', 'User admin signed in at 2018-03-22 14:17:24.'),
(997, 1, 'sign_in', '2018-03-22 12:31:35', 'User admin signed in at 2018-03-22 14:31:35.'),
(998, 1, 'sign_in', '2018-03-22 12:39:04', 'User admin signed in at 2018-03-22 14:39:04.'),
(999, 1, 'sign_in', '2018-03-22 12:39:22', 'User admin signed in at 2018-03-22 14:39:22.'),
(1000, 1, 'sign_in', '2018-03-22 12:40:11', 'User admin signed in at 2018-03-22 14:40:11.'),
(1001, 1, 'sign_in', '2018-03-22 12:42:58', 'User admin signed in at 2018-03-22 14:42:58.'),
(1002, 1, 'sign_in', '2018-03-25 05:15:07', 'User admin signed in at 2018-03-25 08:15:07.'),
(1003, 1, 'sign_in', '2018-03-25 07:12:41', 'User admin signed in at 2018-03-25 10:12:41.'),
(1004, 1, 'sign_in', '2018-03-25 07:35:42', 'User admin signed in at 2018-03-25 10:35:42.'),
(1005, 1, 'sign_in', '2018-03-25 08:08:23', 'User admin signed in at 2018-03-25 11:08:23.'),
(1006, 1, 'sign_in', '2018-03-25 08:09:23', 'User admin signed in at 2018-03-25 11:09:22.'),
(1007, 17, 'sign_in', '2018-03-25 08:28:47', 'User user signed in at 2018-03-25 11:28:47.'),
(1008, 1, 'sign_in', '2018-03-25 08:31:12', 'User admin signed in at 2018-03-25 11:31:12.'),
(1009, 1, 'sign_in', '2018-03-27 06:10:51', 'User admin signed in at 2018-03-27 09:10:51.'),
(1010, 1, 'sign_in', '2018-03-27 07:03:39', 'User admin signed in at 2018-03-27 10:03:39.'),
(1011, 1, 'sign_in', '2018-03-27 07:08:02', 'User admin signed in at 2018-03-27 10:08:02.'),
(1012, 1, 'sign_in', '2018-03-27 07:25:55', 'User admin signed in at 2018-03-27 10:25:55.'),
(1013, 1, 'sign_in', '2018-03-27 07:26:25', 'User admin signed in at 2018-03-27 10:26:25.'),
(1014, 1, 'sign_in', '2018-03-27 11:00:55', 'User admin signed in at 2018-03-27 14:00:55.'),
(1015, 17, 'sign_in', '2018-03-27 11:01:09', 'User user signed in at 2018-03-27 14:01:09.'),
(1016, 1, 'sign_in', '2018-03-27 11:03:17', 'User admin signed in at 2018-03-27 14:03:17.'),
(1017, 17, 'sign_in', '2018-03-27 11:39:21', 'User user signed in at 2018-03-27 14:39:21.'),
(1018, 1, 'sign_in', '2018-03-27 11:56:59', 'User admin signed in at 2018-03-27 14:56:59.'),
(1019, 17, 'sign_in', '2018-03-27 12:05:15', 'User user signed in at 2018-03-27 15:05:15.'),
(1020, 1, 'sign_in', '2018-03-27 12:10:22', 'User admin signed in at 2018-03-27 15:10:22.'),
(1021, 1, 'sign_in', '2018-03-29 06:01:18', 'User admin signed in at 2018-03-29 09:01:18.'),
(1022, 17, 'sign_in', '2018-03-29 06:58:18', 'User user signed in at 2018-03-29 09:58:18.'),
(1023, 1, 'sign_in', '2018-03-29 07:36:36', 'User admin signed in at 2018-03-29 10:36:36.'),
(1024, 1, 'sign_in', '2018-03-29 08:50:44', 'User admin signed in at 2018-03-29 11:50:44.'),
(1025, 17, 'sign_in', '2018-03-29 08:57:06', 'User user signed in at 2018-03-29 11:57:06.'),
(1026, 1, 'sign_in', '2018-03-29 08:57:29', 'User admin signed in at 2018-03-29 11:57:29.'),
(1027, 17, 'sign_in', '2018-03-29 08:58:01', 'User user signed in at 2018-03-29 11:58:01.'),
(1028, 1, 'sign_in', '2018-03-29 10:06:52', 'User admin signed in at 2018-03-29 13:06:52.'),
(1029, 1, 'sign_in', '2018-03-29 10:12:55', 'User admin signed in at 2018-03-29 13:12:55.'),
(1030, 17, 'sign_in', '2018-03-29 10:13:00', 'User user signed in at 2018-03-29 13:13:00.'),
(1031, 1, 'sign_in', '2018-04-01 06:06:27', 'User admin signed in at 2018-04-01 09:06:27.'),
(1032, 1, 'sign_in', '2018-04-01 06:46:23', 'User admin signed in at 2018-04-01 09:46:23.'),
(1033, 17, 'sign_in', '2018-04-01 06:46:31', 'User user signed in at 2018-04-01 09:46:31.'),
(1034, 1, 'sign_in', '2018-04-01 06:47:22', 'User admin signed in at 2018-04-01 09:47:22.'),
(1035, 17, 'sign_in', '2018-04-01 06:47:41', 'User user signed in at 2018-04-01 09:47:41.'),
(1036, 1, 'sign_in', '2018-04-01 07:03:41', 'User admin signed in at 2018-04-01 10:03:41.'),
(1037, 17, 'sign_in', '2018-04-01 07:06:31', 'User user signed in at 2018-04-01 10:06:31.'),
(1038, 1, 'sign_in', '2018-04-01 07:21:18', 'User admin signed in at 2018-04-01 10:21:18.'),
(1039, 17, 'sign_in', '2018-04-01 07:21:28', 'User user signed in at 2018-04-01 10:21:28.'),
(1040, 1, 'sign_in', '2018-04-01 07:25:21', 'User admin signed in at 2018-04-01 10:25:21.'),
(1041, 1, 'sign_in', '2018-04-01 07:25:32', 'User admin signed in at 2018-04-01 10:25:32.'),
(1042, 17, 'sign_in', '2018-04-01 07:25:40', 'User user signed in at 2018-04-01 10:25:40.'),
(1043, 1, 'sign_in', '2018-04-01 07:59:36', 'User admin signed in at 2018-04-01 10:59:36.'),
(1044, 17, 'sign_in', '2018-04-01 08:19:05', 'User user signed in at 2018-04-01 11:19:05.'),
(1045, 1, 'sign_in', '2018-04-01 08:19:24', 'User admin signed in at 2018-04-01 11:19:24.'),
(1046, 17, 'sign_in', '2018-04-01 10:04:12', 'User user signed in at 2018-04-01 13:04:12.'),
(1047, 17, 'sign_in', '2018-04-01 10:04:23', 'User user signed in at 2018-04-01 13:04:23.'),
(1048, 17, 'sign_in', '2018-04-01 10:33:00', 'User user signed in at 2018-04-01 13:33:00.'),
(1049, 17, 'sign_in', '2018-04-01 10:46:43', 'User user signed in at 2018-04-01 13:46:43.'),
(1050, 1, 'sign_in', '2018-04-01 10:54:49', 'User admin signed in at 2018-04-01 13:54:49.'),
(1051, 1, 'sign_in', '2018-04-01 10:57:06', 'User admin signed in at 2018-04-01 13:57:06.'),
(1052, 17, 'sign_in', '2018-04-01 10:57:18', 'User user signed in at 2018-04-01 13:57:18.'),
(1053, 1, 'sign_in', '2018-04-01 10:59:03', 'User admin signed in at 2018-04-01 13:59:03.'),
(1054, 17, 'sign_in', '2018-04-01 11:03:05', 'User user signed in at 2018-04-01 14:03:05.'),
(1055, 1, 'sign_in', '2018-04-01 11:14:39', 'User admin signed in at 2018-04-01 14:14:39.'),
(1056, 17, 'sign_in', '2018-04-01 11:23:53', 'User user signed in at 2018-04-01 14:23:53.'),
(1057, 1, 'sign_in', '2018-04-01 12:16:09', 'User admin signed in at 2018-04-01 15:16:09.'),
(1058, 17, 'sign_in', '2018-04-01 12:16:48', 'User user signed in at 2018-04-01 15:16:48.'),
(1059, 1, 'sign_in', '2018-04-01 12:29:24', 'User admin signed in at 2018-04-01 15:29:24.'),
(1060, 1, 'sign_in', '2018-04-01 12:32:06', 'User admin signed in at 2018-04-01 15:32:06.'),
(1061, 17, 'sign_in', '2018-04-01 12:32:51', 'User user signed in at 2018-04-01 15:32:51.'),
(1062, 1, 'sign_in', '2018-04-01 13:48:37', 'User admin signed in at 2018-04-01 16:48:37.'),
(1063, 17, 'sign_in', '2018-04-01 13:49:17', 'User user signed in at 2018-04-01 16:49:17.'),
(1064, 1, 'sign_in', '2018-04-01 13:54:17', 'User admin signed in at 2018-04-01 16:54:17.'),
(1065, 1, 'sign_in', '2018-04-01 13:56:51', 'User admin signed in at 2018-04-01 16:56:51.'),
(1066, 17, 'sign_in', '2018-04-01 13:57:12', 'User user signed in at 2018-04-01 16:57:12.'),
(1067, 17, 'sign_in', '2018-04-03 06:10:47', 'User user signed in at 2018-04-03 09:10:47.'),
(1068, 17, 'sign_in', '2018-04-03 07:38:40', 'User user signed in at 2018-04-03 10:38:40.'),
(1069, 17, 'sign_in', '2018-04-05 06:18:24', 'User user signed in at 2018-04-05 09:18:24.'),
(1070, 1, 'sign_in', '2018-04-05 06:18:45', 'User admin signed in at 2018-04-05 09:18:45.'),
(1071, 1, 'sign_in', '2018-04-05 06:20:10', 'User admin signed in at 2018-04-05 09:20:10.'),
(1072, 17, 'sign_in', '2018-04-08 06:15:12', 'User user signed in at 2018-04-08 09:15:12.'),
(1073, 1, 'sign_in', '2018-04-08 07:46:19', 'User admin signed in at 2018-04-08 10:46:19.'),
(1074, 17, 'sign_in', '2018-04-08 07:46:51', 'User user signed in at 2018-04-08 10:46:51.'),
(1075, 17, 'sign_in', '2018-04-08 07:51:41', 'User user signed in at 2018-04-08 10:51:41.'),
(1076, 1, 'sign_in', '2018-04-08 08:16:22', 'User admin signed in at 2018-04-08 11:16:22.'),
(1077, 17, 'sign_in', '2018-04-08 08:16:28', 'User user signed in at 2018-04-08 11:16:28.'),
(1078, 1, 'sign_in', '2018-04-08 08:17:40', 'User admin signed in at 2018-04-08 11:17:40.'),
(1079, 17, 'sign_in', '2018-04-08 08:18:55', 'User user signed in at 2018-04-08 11:18:55.'),
(1080, 17, 'sign_in', '2018-04-08 08:19:17', 'User user signed in at 2018-04-08 11:19:17.'),
(1081, 1, 'sign_in', '2018-04-08 08:19:26', 'User admin signed in at 2018-04-08 11:19:26.'),
(1082, 17, 'sign_in', '2018-04-08 08:19:42', 'User user signed in at 2018-04-08 11:19:42.'),
(1083, 1, 'sign_in', '2018-04-08 10:46:37', 'User admin signed in at 2018-04-08 13:46:37.'),
(1084, 17, 'sign_in', '2018-04-08 10:56:03', 'User user signed in at 2018-04-08 13:56:03.'),
(1085, 1, 'sign_in', '2018-04-08 11:00:17', 'User admin signed in at 2018-04-08 14:00:17.'),
(1086, 17, 'sign_in', '2018-04-08 13:47:26', 'User user signed in at 2018-04-08 16:47:26.'),
(1087, 17, 'sign_in', '2018-04-12 06:43:54', 'User user signed in at 2018-04-12 09:43:53.'),
(1088, 1, 'sign_in', '2018-04-12 06:49:47', 'User admin signed in at 2018-04-12 09:49:47.'),
(1089, 17, 'sign_in', '2018-04-12 06:59:29', 'User user signed in at 2018-04-12 09:59:29.'),
(1090, 1, 'sign_in', '2018-04-12 07:15:40', 'User admin signed in at 2018-04-12 10:15:40.'),
(1091, 1, 'sign_in', '2018-04-15 08:14:28', 'User admin signed in at 2018-04-15 11:14:28.'),
(1092, 17, 'sign_in', '2018-04-15 12:34:15', 'User user signed in at 2018-04-15 15:34:15.'),
(1093, 1, 'sign_in', '2018-04-15 12:39:44', 'User admin signed in at 2018-04-15 15:39:44.'),
(1094, 1, 'sign_in', '2018-04-17 07:40:17', 'User admin signed in at 2018-04-17 10:40:17.'),
(1095, 1, 'sign_in', '2018-04-17 10:40:39', 'User admin signed in at 2018-04-17 13:40:39.'),
(1096, 1, 'sign_in', '2018-04-19 05:44:25', 'User admin signed in at 2018-04-19 08:44:25.'),
(1097, 17, 'sign_in', '2018-04-19 07:48:37', 'User user signed in at 2018-04-19 10:48:37.'),
(1098, 1, 'sign_in', '2018-04-19 08:06:56', 'User admin signed in at 2018-04-19 11:06:56.'),
(1099, 17, 'sign_in', '2018-04-22 08:25:18', 'User user signed in at 2018-04-22 11:25:18.'),
(1100, 1, 'sign_in', '2018-06-04 11:37:17', 'User admin signed in at 2018-06-04 14:37:17.'),
(1101, 1, 'sign_in', '2018-06-05 07:00:41', 'User admin signed in at 2018-06-05 10:00:41.'),
(1102, 1, 'sign_in', '2018-06-05 07:06:49', 'User admin signed in at 2018-06-05 10:06:49.'),
(1103, 17, 'sign_in', '2018-06-05 07:37:34', 'User user signed in at 2018-06-05 10:37:34.'),
(1104, 1, 'sign_in', '2018-06-05 07:43:27', 'User admin signed in at 2018-06-05 10:43:27.'),
(1105, 17, 'sign_in', '2018-06-05 07:44:34', 'User user signed in at 2018-06-05 10:44:34.'),
(1106, 1, 'sign_in', '2018-06-05 08:03:55', 'User admin signed in at 2018-06-05 11:03:55.'),
(1113, 1, 'sign_in', '2018-06-05 08:54:43', 'User admin signed in at 2018-06-05 11:54:43.'),
(1114, 1, 'sign_in', '2018-06-05 10:38:47', 'User admin signed in at 2018-06-05 13:38:47.'),
(1115, 1, 'sign_in', '2018-06-05 10:41:50', 'User admin signed in at 2018-06-05 13:41:50.'),
(1116, 1, 'sign_in', '2018-06-05 10:49:19', 'User admin signed in at 2018-06-05 13:49:19.'),
(1117, 1, 'sign_in', '2018-06-05 10:50:48', 'User admin signed in at 2018-06-05 13:50:48.'),
(1122, 1, 'sign_in', '2018-06-05 10:56:22', 'User admin signed in at 2018-06-05 13:56:22.'),
(1123, 17, 'sign_in', '2018-06-05 11:55:19', 'User user signed in at 2018-06-05 14:55:19.'),
(1124, 1, 'sign_in', '2018-06-05 11:55:52', 'User admin signed in at 2018-06-05 14:55:52.'),
(1125, 1, 'sign_in', '2018-06-05 12:01:30', 'User admin signed in at 2018-06-05 15:01:30.');

-- --------------------------------------------------------

--
-- Table structure for table `uf_user_rememberme`
--

CREATE TABLE `uf_user_rememberme` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `token` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `persistent_token` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `uf_about_us_members`
--
ALTER TABLE `uf_about_us_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `neighborhood_id` (`neighborhood_id`);

--
-- Indexes for table `uf_authorize_group`
--
ALTER TABLE `uf_authorize_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uf_authorize_user`
--
ALTER TABLE `uf_authorize_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uf_bills`
--
ALTER TABLE `uf_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uf_bill_transactions`
--
ALTER TABLE `uf_bill_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uf_configuration`
--
ALTER TABLE `uf_configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uf_files`
--
ALTER TABLE `uf_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uf_fixed_bills`
--
ALTER TABLE `uf_fixed_bills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uf_fixed_bills_operations`
--
ALTER TABLE `uf_fixed_bills_operations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uf_group`
--
ALTER TABLE `uf_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uf_group_user`
--
ALTER TABLE `uf_group_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uf_neighborhood`
--
ALTER TABLE `uf_neighborhood`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uf_owner`
--
ALTER TABLE `uf_owner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uf_payments`
--
ALTER TABLE `uf_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uf_payment_transactions`
--
ALTER TABLE `uf_payment_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uf_tickets`
--
ALTER TABLE `uf_tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `uf_transactions`
--
ALTER TABLE `uf_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uf_unit`
--
ALTER TABLE `uf_unit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uf_user`
--
ALTER TABLE `uf_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `uf_user_event`
--
ALTER TABLE `uf_user_event`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `uf_about_us_members`
--
ALTER TABLE `uf_about_us_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT for table `uf_authorize_group`
--
ALTER TABLE `uf_authorize_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `uf_authorize_user`
--
ALTER TABLE `uf_authorize_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uf_bills`
--
ALTER TABLE `uf_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5032;
--
-- AUTO_INCREMENT for table `uf_bill_transactions`
--
ALTER TABLE `uf_bill_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `uf_configuration`
--
ALTER TABLE `uf_configuration`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `uf_files`
--
ALTER TABLE `uf_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=407;
--
-- AUTO_INCREMENT for table `uf_fixed_bills`
--
ALTER TABLE `uf_fixed_bills`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `uf_fixed_bills_operations`
--
ALTER TABLE `uf_fixed_bills_operations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `uf_group`
--
ALTER TABLE `uf_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `uf_group_user`
--
ALTER TABLE `uf_group_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `uf_neighborhood`
--
ALTER TABLE `uf_neighborhood`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `uf_owner`
--
ALTER TABLE `uf_owner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `uf_payments`
--
ALTER TABLE `uf_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `uf_payment_transactions`
--
ALTER TABLE `uf_payment_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `uf_tickets`
--
ALTER TABLE `uf_tickets`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
--
-- AUTO_INCREMENT for table `uf_transactions`
--
ALTER TABLE `uf_transactions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `uf_unit`
--
ALTER TABLE `uf_unit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=148;
--
-- AUTO_INCREMENT for table `uf_user`
--
ALTER TABLE `uf_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT for table `uf_user_event`
--
ALTER TABLE `uf_user_event`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1126;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `uf_about_us_members`
--
ALTER TABLE `uf_about_us_members`
  ADD CONSTRAINT `uf_about_us_members_ibfk_1` FOREIGN KEY (`neighborhood_id`) REFERENCES `uf_neighborhood` (`id`);

--
-- Constraints for table `uf_tickets`
--
ALTER TABLE `uf_tickets`
  ADD CONSTRAINT `uf_tickets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `uf_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
