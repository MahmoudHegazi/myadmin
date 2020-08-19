-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 18, 2020 at 03:04 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myadmin`
--

-- --------------------------------------------------------

--
-- Table structure for table `archive`
--

CREATE TABLE `archive` (
  `id` int(11) NOT NULL,
  `parent_table` enum('todo','ticket','messages','comment','other') DEFAULT 'other',
  `item_id` enum('todo_title','ticket_id','comment_id','message_id','unlisted') DEFAULT 'unlisted',
  `todo_title` varchar(255) DEFAULT NULL,
  `todo_creator` int(11) DEFAULT NULL,
  `todo_create_date` varchar(40) DEFAULT NULL,
  `todo_important` tinyint(1) DEFAULT NULL,
  `todo_finished` tinyint(1) DEFAULT NULL,
  `todo_details` varchar(255) DEFAULT NULL,
  `ticket_creator` int(11) DEFAULT NULL,
  `ticket_supid` int(11) DEFAULT NULL,
  `ticet_maintenance_record_id` int(11) DEFAULT NULL,
  `ticket_device_id` int(11) DEFAULT NULL,
  `ticket_date_create` varchar(30) DEFAULT NULL,
  `comment_ticket_id` int(11) DEFAULT NULL,
  `comment_content` text,
  `comment_image` text,
  `comment_userid` int(11) DEFAULT NULL,
  `comment_date` varchar(40) DEFAULT NULL,
  `commment_ticket_title` varchar(255) DEFAULT NULL,
  `message_subject` varchar(255) DEFAULT NULL,
  `message_body` text,
  `message_image` text,
  `message_sender_id` int(11) DEFAULT NULL,
  `message_reciver_id` int(11) DEFAULT NULL,
  `empty` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='this table for backup comments, todo, tickets, message data ';

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `location` varchar(70) DEFAULT NULL,
  `image` text,
  `creator_id` int(11) NOT NULL,
  `sup_location` enum('floor1','floor2','floor3','floor4') NOT NULL,
  `resigned` enum('yes','no') NOT NULL DEFAULT 'no',
  `job_title` varchar(50) DEFAULT NULL,
  `employee_id` varchar(15) NOT NULL,
  `department` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `name`, `location`, `image`, `creator_id`, `sup_location`, `resigned`, `job_title`, `employee_id`, `department`) VALUES
(1, 'Mahmoud Hegazi', 'EEC group sheraton main', '/images/profile.jpg', 1, 'floor1', 'no', NULL, '0', NULL),
(2, 'Ahmed (supervisor) ', 'EEC group sheraton main', '/images/fb.jpg', 1, 'floor1', 'no', NULL, '0', NULL),
(3, 'Madonna', 'EEG Group Main shertaon', '/images/girl.jpg', 1, 'floor1', 'no', NULL, '0', NULL),
(4, 'shawky', 'EEG Group Main shertaon', '/images/shwky.jpg', 1, 'floor1', 'no', NULL, '0', NULL),
(5, 'Petter ', 'EEC group main ', '/images/fb.jpg', 3, 'floor1', 'no', NULL, '0', NULL),
(6, 'mazen', 'EEC group sub location ', '/images/fb.jpg', 2, 'floor1', 'no', NULL, '0', NULL),
(7, 'Petter', 'EEC group, Main location', 'images/flower.jpg', 18, 'floor1', 'no', NULL, '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL COMMENT 'device for this recored',
  `supplier_id` int(255) DEFAULT NULL COMMENT 'supplier_id',
  `creator_id` int(11) NOT NULL,
  `price` varchar(25) DEFAULT NULL,
  `last_employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `maintenance`
--

INSERT INTO `maintenance` (`id`, `device_id`, `supplier_id`, `creator_id`, `price`, `last_employee_id`) VALUES
(2, 6, 1, 3, '600', 6),
(3, 7, 2, 3, '300', 1),
(4, 2, 2, 92, '18', 7);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(20) NOT NULL,
  `subject` varchar(30) NOT NULL,
  `body` text NOT NULL,
  `image` text NOT NULL,
  `sender_id` int(11) NOT NULL,
  `reciver_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `subject`, `body`, `image`, `sender_id`, `reciver_id`) VALUES
(1, 'Hello World', 'Welcome this my First Message For you Hello', '', 1, 3),
(2, 'Second Message', 'Hello My friend are you ready for meeting', '/images/laptop.jpg', 2, 10);

-- --------------------------------------------------------

--
-- Table structure for table `mycomment`
--

CREATE TABLE `mycomment` (
  `id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text,
  `date` varchar(30) NOT NULL,
  `user_id` int(11) NOT NULL,
  `image` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mycomment`
--

INSERT INTO `mycomment` (`id`, `ticket_id`, `title`, `content`, `date`, `user_id`, `image`) VALUES
(1, 2, 'giuo', 'giuooooooo', '2020-08-04', 13, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(100) NOT NULL,
  `content` varchar(255) NOT NULL,
  `reciver_id` int(11) NOT NULL,
  `icon` varchar(600) NOT NULL,
  `title` enum('new_message','create_ticket','delete_ticket','added_device','closed_ticket','comment_add','user_created','user_removed','new_maintenance','image_updated','blocked_messages') NOT NULL,
  `header` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `content`, `reciver_id`, `icon`, `title`, `header`) VALUES
(1, 'You Have Got, New Message from Mahmoud Hegazy', 3, '/images/rsz_new_message.jpg', 'new_message', 'New Message'),
(2, 'You Have Got, New Message from Mahmoud Hegazy', 10, '/images/rsz_new_message.jpg', 'new_message', 'New Message');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `sup_id` int(11) NOT NULL COMMENT 'supplier_id',
  `name` varchar(50) NOT NULL,
  `mobile` varchar(20) NOT NULL,
  `sup_image` text COMMENT 'if no images uploaded upload default value',
  `sup_history` text,
  `extra_data` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tables contains suppliers info';

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`sup_id`, `name`, `mobile`, `sup_image`, `sup_history`, `extra_data`) VALUES
(1, 'Petter ', '01113722390', '/images/fb.jpg', 'Our top supplier desktop, he is cute and funny supplier, high price ', 'don\'t call him at morning'),
(2, 'Hend', '0123456789', '/images/girl.png', 'She Provide us with laptops, new only', 'send what\'s up message only');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `username`, `password`, `name`) VALUES
(1, 'maninmid', '$2y$10$0iiNHdVuHfJTyen8GawjtemvbrdlGwity1.a7gjicRrj2Sr6G.Mh2', 'mola'),
(2, 'bsam', '$2y$10$Z5mOTbMe9cTkRjB4UAusBeOjYNw8g5zKs1oIDbSkPQcvV8xhOX7Ji', 'fireomon'),
(3, 'nomo', '$2y$10$aPGyr6lG5BhCWxk7tEUBvuQ54XSsddKZck6jwKTfsYf8ADk9fpVE2', 'fonborg');

-- --------------------------------------------------------

--
-- Table structure for table `todo`
--

CREATE TABLE `todo` (
  `id` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `important` tinyint(1) NOT NULL DEFAULT '0',
  `finished` tinyint(1) NOT NULL DEFAULT '0',
  `details` varchar(255) NOT NULL DEFAULT 'No details..',
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`id`, `title`, `important`, `finished`, `details`, `create_date`, `user_id`) VALUES
(1, 'Make coffee', 0, 0, 'No details..', '2020-08-17 06:50:58', 1),
(2, 'Check emails', 0, 0, 'No details..', '2020-08-17 06:50:58', 12),
(3, 'Create My First App', 0, 1, 'Create admin system to mange Devices and recourse ', '2020-08-17 06:50:58', 10),
(4, 'Get feedback on design', 0, 0, 'No details..', '2020-08-17 06:50:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `name` varchar(45) NOT NULL,
  `image` text,
  `password` varchar(62) NOT NULL,
  `id` int(11) NOT NULL,
  `username` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`name`, `image`, `password`, `id`, `username`) VALUES
('Mahmoud Hegazi', '/images/fb.jpg', 'mahmoud123', 1, '102030'),
('Ahmed (supervisor) ', '/images/fb.jp', 'ahmed123', 2, '101213'),
('madonna', '/images/girl.png', 'madonna123', 3, '121212'),
('shawky', '/images/shwky.jpg', 'shwky123', 10, '141414'),
('michel', '/images/fb.jpg', 'michel123', 12, '151515'),
('mahmoud', '/images/fb.jpg', '7oda123', 13, '161616'),
('romany', '/images/fb.jpg', 'romany123', 14, '191919'),
('wasas', NULL, '$2y$10$S.czyPh5.HcuuHvagUYUdeeEUf8pWqrjBUtZCbBkmDgc9EpsBeIey', 15, 'a'),
('5690855', NULL, '$2y$10$rYwFRP4sNPzG1oGu7I0zBeLHvScWocXzA4B0KI0QmTRrxjsFNjURC', 16, 'Captin Mido'),
('12ews', NULL, '$2y$10$oetV.yp4Ik2kxY221WeL..6/dCWqhzX1JT0Z/ucC2m.lXZFtfztBG', 17, 'mido'),
('12ews1', NULL, '$2y$10$ZIiDpuePeEZcv1tujQ/wteIicOxPTO4xopNY9fkOlTxjLcO1V7eDW', 18, 'mynames'),
('123w', NULL, '$2y$10$zMxTvFhCqaREqWFyb6tFIupvYQuvsDjNCJ54NpKh0gdVp65ZNikwC', 19, 'a'),
('12ewsaaa11', NULL, '$2y$10$pH8vpV8DSc5YyixCu2zrd.W4ITfBoss35dgT5NG.2tgq8PreUw2sG', 20, 'a'),
('56908551', NULL, '$2y$10$Vtgfa75opxcFn7B.w.0y7eZ2LQvzYG/eazLdkjxvbWcqD5AqknvjS', 21, 'aa'),
('56908551', NULL, '$2y$10$.8JKnmKj6fIkx8I0BURrFuFEictJpRg/pO5Y4oGIvdBJOKrjzfcgO', 22, 'aa'),
('56908551', NULL, '$2y$10$muH47gvlZW3kNXnJ8QpyBOtxZ0Ls9GxatKBwvhJF2KvDm79Ct1XMG', 23, 'aa'),
('56908551', NULL, '$2y$10$rkq44s6MsKNnYU/rTP9m0OsMrUb7KPnIxrm0QEa9mSNEG9Io5dYTW', 24, 'aa'),
('56908551333', NULL, '$2y$10$lKy3D3Py602owbMqB5YNTuNAXd81jJ.pl6morpabHlljSF73DlkSK', 25, 'aa'),
('noob123', NULL, '$2y$10$JvgK5vuIa332zll02GLo4e2ft/QB6tB6QIcOVkgrHzVIwQBwFeuJS', 26, 'b'),
('noob123', NULL, '$2y$10$s.KkQYjNxlkMvyXxk8m/a.g3mJCsJw0zrlqJqYb6aLPTebD1bXeWa', 27, 'b'),
('noob123', NULL, '$2y$10$s2d6sBU4x63UPNU.xzx5pOZJVIdJ4v4xRMxBqROW0B4RVsJfYyMaq', 28, 'b'),
('noob123', NULL, '$2y$10$G1g083p51hElSUCACCZx8.cb8ZcdiU2EsM9nw/6BHRcOJroiFCn5u', 29, 'b'),
('manour', NULL, '$2y$10$ViaqJG6kmtgZkXhOn1xt0O1.6jK5A4JdR.1Py0CPGIR00.67lR0IK', 30, 'molo'),
('manour', NULL, '$2y$10$rVLxvZsk4Y9iXhzL0Ae34upZcWBJK/YTU.WR0AvqE7NUFlPxkdw8W', 31, 'molo'),
('manour', NULL, '$2y$10$zhIrOvCvPpwq/nZWN.ZcYe1jU5PfgnqWewTUQrPw8Yd9qql19nNxy', 32, 'molo'),
('manour', NULL, '$2y$10$ZHK83VPAHuot0OQr9I0z6O7CS6l92uOWI6g9GbPUuOgwvm3GyvUEe', 33, 'molo'),
('manour', NULL, '$2y$10$zx4BDkS/LAjLm/ar/0vW6.eIvs8mpd0bOkDjViWLfoN/S6Ay7cY7y', 34, 'molo'),
('manour123', NULL, '$2y$10$BJUkAUjFx3yNaWZzUqXJY.RFrWw1qjPNJQVp5MGX9T967qZhw4Oky', 35, 'molo'),
('manour123', NULL, '$2y$10$U8mV3YrDFRHodOC3hpwfteeYAKkV7p6SXsxyiKQMzIBTwW0.bJblm', 36, 'molo'),
('manour123', NULL, '$2y$10$0YpuiioMCsJBzVW.OzTrwOWgoJpulMte7CaXpq7b6hJENJzjSVaOi', 37, 'molo'),
('molo', NULL, '$2y$10$vtHv2.KAoqKkNiiIWCrGL.DxvYkae2qE7B4qExvGwLO7KZeNkcGHG', 38, 'manour123'),
('midpo', NULL, '$2y$10$QTzn6rEliWFgBxkOk666Te86oeu1bH7T63TeY1v9bj3vCBFSuzpvq', 39, 'superman'),
('omora', NULL, '$2y$10$F6fq8WpdXrc5g1nCHOjk5Oht7WcZhOVsr2YhBO8bIZSJCB/SiOtIO', 40, '126232'),
('', NULL, '$2y$10$dEnKCfMvFiCkCNqcx9y3TOu2ZjVlc1bMTKAqN77zdT6YKSpDUWC2.', 41, 'hawiwi'),
('', NULL, '$2y$10$GTkH98qUACNdzbKS.VSVlOSwHAopJt6ipCt3zL.Scv3K1AeXD9iIu', 42, 'godisgreat'),
('', NULL, '$2y$10$AwgRfjT3eOiqtqdzM9KE7OKJyX7gBQej7FUgPtj/ekV8.LKN5z0uO', 43, 'himon'),
('midon', NULL, '123456', 44, '506077'),
('', NULL, '$2y$10$ibUzXvUQL7IpHZUltoVFhOuDDWmC38toTlIkYwfkS4EM.W7vyFrVy', 45, 'lovemygod'),
('', NULL, '$2y$10$jGzqtWYc3jIFRsy7PbeJPeJ53LSNu3hE8RZVpDSZdMZgiGbrMFLOq', 46, 'My Friend'),
('', NULL, '$2y$10$hqQjwvYPu8uvkvzMiWPcbuQKPNb86X7Oby3ESa4rx1Y/9WmfyJj.S', 47, 'godhelp'),
('', NULL, '$2y$10$IpvI4LwhZn0wckxakCHsxOiTE87CHA9hcAKh5MFiC73CYX49Z2ddS', 48, 'mloka'),
('', NULL, '$2y$10$UshrXazI9xY4JGE22jKYJeQ67ige.AVUD4LzO7aS8c03ToFp1ECf6', 49, 'mloka'),
('', NULL, '$2y$10$mLuUjuWQlCWfdejQkhwjyOPjuhYyCuFFQLGVJOyWRVaBhD/pOkADi', 50, 'mloka'),
('mloka', NULL, '$2y$10$vzRDpmz6Mo1aigP9LYq.EO7Wx0kuWiJyAhNfN72HKlcF6DqHWhrOW', 51, ''),
('thanks god', NULL, '$2y$10$ElOCU7jRNzVq/UOCqfr4ee/0RYZckefIkOXDC3q5B8pxQV2ehm.ce', 52, ''),
('thanks god', NULL, '$2y$10$UQtSwysMuXHDXH9n2CTIEOD1g8InFSOKmpLRTRS0YNdyY.dcr3Ke.', 53, ''),
('New Name', NULL, '$2y$10$H.U.KkgMVb65Cp1i8KqPqeEi3lx3/MatIehSwzkvcbKx.7W0GmFoW', 54, ''),
('', NULL, '$2y$10$yN9kCm5N572/q8zs0tPIkeUy.9nNbDz5DYtvWKXNJZn0x6AelNgsO', 55, ''),
('', NULL, '$2y$10$FRqFYi8ic7l/1eksRnTXX..rpqJjBIKl1VrGGBr2V20ReAOZxIXLi', 56, ''),
('mnoseojm', NULL, '$2y$10$qGAQ3S2DjDnxzg3fr2yzs.30MmkGZ0KNJd7ohmcPYz0mzmABNKVw2', 57, ''),
('morenames', NULL, '$2y$10$dNRWgGxd.tgpkxpVe8KJBeEotPgRIwfXb0XfRvrvy0VKBIDb/mcrq', 59, ''),
('', NULL, '$2y$10$ixG377lXKdH4RhRAGumxi.XBtdhlm9bEQHyLWAxo0oE.vC1XwQANK', 60, '12ews21111'),
('awdf', NULL, '$2y$10$YmkLhR8snqtyccL.sEfGI.RKgN8Hvf3BCX7hRVFiLWQXUUaF3VKqq', 61, '12ews211111'),
('Mahmoud', NULL, '$2y$10$2CLs065rIfw6.EUYtGDAcO9wVSPbgGdSMLCjmtO7cQ1TDoNmSQWv2', 62, '506070'),
('', NULL, '$2y$10$9CvNVmxpa3qehRk9AEdZ5O4zHm9x0xnwW.WXaT2mfDdRsmIGxFoji', 63, ''),
('a', NULL, '$2y$10$0nfrI3aAfD/FhSaRJdvOLO4Z66VfmijxUWS1V1oBr8865Z92Aws8i', 64, '12ews211111'),
('', NULL, '$2y$10$02AALQFi7f9dNASKV0keeO7XTmHwmZmsmKuzRRg2YgeItvV6hL8iq', 65, '55m55'),
('', NULL, '$2y$10$hBkW4mOqopLlqcWSXhw6ouFpVL/1FhbQHt0mmECGD.3xOaGzz6L3G', 66, 'lol1'),
('', NULL, '$2y$10$GbdM3OrWDtZwIGf/AafHu.HiLucsFro5wyjmozsdqu2ito/F4XEcO', 67, 'for123'),
('Xray', NULL, '$2y$10$FViygPkQ7y5eE3.Wj8W6cu5/akAcypgxkHHkD5Dcb/eV8CWeS6Ch2', 68, '12ews21111'),
('The Final User', NULL, '$2y$10$PIV6UYa9OBAvAEzZwhfrhuJzsYHdSnsy9f.vmu3pLL7MDTAGqYtBC', 69, 'thanks123'),
('Ilovephp', NULL, '$2y$10$RMjE2sEJbwEZalZVJ0FefOyXZ69qmMJaVqdeGF2Lkw4CXJ2gLXs5a', 70, 'nuser123'),
('Mahmoud', NULL, '$2y$10$OJ17YfCZK9IPmyBf8.05EOQ8bOFTMAErFuoR0CQpl4K5AR3DqCj02', 71, 'mshakshak24'),
('mido El rwash', NULL, '$2y$10$0ZtQcgtaBx6VLhHeEr601uPuYkD4lYrp4pmRQ4geJH3rTsAW3Tl.O', 72, 'fin123'),
('mido', NULL, '$2y$10$Jkn06F9kADqJ9XKQuwq1neHYlo4AjZbvXl/doxfFjICBGJVvo.Vv2', 73, 'newuser123'),
('Mido', NULL, '$2y$10$GzMV8d52BHbQd84qd5UZ.ujib0.pEB2PFn15nsUDhWoZnCu/Hqb4y', 74, 'user1'),
('mido', NULL, '$2y$10$1I2HLk.fh1nouob01g.sSu/sZrveWndO//UhP2AwNyoXf6ZYGhyUK', 75, 'user1'),
('b', NULL, '$2y$10$Vutd.1zi6EWhO7vjKCB/xePUAYCWMJczHuWPxE3VGV84t0Y9JH0ba', 76, 'user1'),
('moko1', NULL, '$2y$10$ky8nbxcDe7fs64aGsqlUb./TVisubdJKDmRU1Sa8qOs.e3E8GLyF.', 77, '123456'),
('olom1', NULL, '$2y$10$Rl1yghBia.mW4s4uvWBAR.cicYR82yP.g/QNkf6MdHBjz0tiNkmh2', 78, '123456'),
('ok', NULL, '$2y$10$HqIldcn9olc6g6.fM3EWfOanJXxQoXWbPhTvagPrU4y4uKmUfm1JK', 79, '123456'),
('', NULL, '$2y$10$zF8jkY8trdSmnbiHjY8CTeS7jPgK.4VHmKOx38jPWmPsaqMa1sVsu', 80, 'user1'),
('', NULL, '$2y$10$XUcZ0xOOX5Dxm/n2XaV7i.96MlNOhU78KDJeADkkkgNuNZdlwH4QO', 81, '123456'),
('11', NULL, '$2y$10$UcTRTHLdpXPDiJM1jBeYzOGNT5ghq/i2slAP6wqmjS/ckmxIxp7fq', 82, '123456'),
('123456', NULL, '$2y$10$0JofWrZ05L.fZXAPnHdyqeNam7WK0yjsZ/Sc2FAB50qxknt2saHCu', 83, 'user1'),
('a', NULL, '$2y$10$LOB9MuT3RTTPE5MhM0mQbe/W8FeQh21zdQ95riDKpTYZ7BeAlV7uy', 84, '123456'),
('myname', NULL, '$2y$10$8HPjkfDb2K2BvuN6D97DyeVTqhsxn7SLbv9OWxquHjEr2y7I.Y9N6', 85, '505050'),
('myname', NULL, '$2y$10$ijG8WkMb/e0JyA824HwDOu1Jpxk3UTIpLBD4YRtCrs/zUEbRIJYUu', 86, '505050'),
('molom', NULL, '$2y$10$N3uT13PAq7sODuL0BwaPpuqpZhy4vnElqOGWlt2Y8V0lprOPPm6VK', 87, 'klok123'),
('molom', NULL, '$2y$10$UM.yqxrv5eLf8I6H6piNoOkBmursABS0xJzrze6MFG/T5Kh/oacFK', 88, 'michel123'),
('Mahmoud Man', NULL, '$2y$10$Lx3v4ByG6TvDyh/tDaHdP.vCXZ0pu86GWeE0SNGRnc.jvVvcE3A0y', 89, 'mahmoud123'),
('', NULL, '$2y$10$p2xbjaFT3.5yieontTvQNe.lEiDYDSWEaD3zK5uwYs31cq2T.7XlK', 90, 'suermido123'),
('mazen', NULL, '$2y$10$Wf3/P/dAFRrqqcLfB8HRK.95tXRZI/fbfQ3WyBbR.ko1RHQMFw5OS', 91, 'holako'),
('multitask', NULL, '$2y$10$migKBybrvAyCVweh58Yeg.tMDaSYs9tRykeOUGKyi9VTFzFNmLZnC', 92, 'kol123');

-- --------------------------------------------------------

--
-- Table structure for table `workstation`
--

CREATE TABLE `workstation` (
  `id` int(25) NOT NULL,
  `service_tag` varchar(50) NOT NULL,
  `manufacture` varchar(50) DEFAULT NULL COMMENT 'model',
  `purchased_date` varchar(25) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `price` varchar(50) DEFAULT NULL,
  `history` text NOT NULL,
  `status` enum('old','new') NOT NULL COMMENT 'new or old',
  `images` text NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `type` enum('laptop','computer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='all devices';

--
-- Dumping data for table `workstation`
--

INSERT INTO `workstation` (`id`, `service_tag`, `manufacture`, `purchased_date`, `supplier_id`, `price`, `history`, `status`, `images`, `model`, `type`) VALUES
(2, 'BnbJMQF', 'IOS', '3/5/2018', 2, '28.100', 'RAM 16, HD, Screen 4 gig HD, keyboard professional, processor i5', 'new', '/images/mac1.jpg', 'Dell', 'laptop'),
(3, 'HNKzIQA', 'Lenovo', '8/4/2020', 2, '12.255', 'RAM 8, HD, Screen 4 gig HD, keyboard professional, processor i17 ', 'old', '/images/laptop', '', 'laptop'),
(6, 'DebFJbNQ', 'HP', '4/15/2020', 2, '14.000', 'RAM 2, HD, Screen 4 gig HD, keyboard professional, processor i17', 'new', '/images/mac1.jpg', '', 'laptop'),
(7, 'ZeAFJbNF', 'Dell', '3/12/2020', 1, '4.000', 'RAM 24, HD, Screen 8HD, keyboard professional, processor i17', 'old', '/images/desktop.jpg', '', 'laptop');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `archive`
--
ALTER TABLE `archive`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_id` (`creator_id`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `device_id` (`device_id`),
  ADD KEY `last_employee_id` (`last_employee_id`),
  ADD KEY `maintenance_ibfk_1` (`creator_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sender_id` (`sender_id`),
  ADD KEY `reciver_id` (`reciver_id`);

--
-- Indexes for table `mycomment`
--
ALTER TABLE `mycomment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_id` (`ticket_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reciver_id` (`reciver_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`sup_id`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `workstation`
--
ALTER TABLE `workstation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `archive`
--
ALTER TABLE `archive`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mycomment`
--
ALTER TABLE `mycomment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `sup_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'supplier_id', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `workstation`
--
ALTER TABLE `workstation`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `employees_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `maintenance_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`sup_id`),
  ADD CONSTRAINT `maintenance_ibfk_4` FOREIGN KEY (`device_id`) REFERENCES `workstation` (`id`),
  ADD CONSTRAINT `maintenance_ibfk_5` FOREIGN KEY (`last_employee_id`) REFERENCES `employees` (`id`);

--
-- Constraints for table `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`reciver_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `mycomment`
--
ALTER TABLE `mycomment`
  ADD CONSTRAINT `mycomment_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `maintenance` (`id`),
  ADD CONSTRAINT `mycomment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`reciver_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `todo`
--
ALTER TABLE `todo`
  ADD CONSTRAINT `todo_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `workstation`
--
ALTER TABLE `workstation`
  ADD CONSTRAINT `workstation_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`sup_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
