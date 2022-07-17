-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 16, 2022 at 08:24 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cmspro`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `AdminName` varchar(200) NOT NULL,
  `EmailId` varchar(150) NOT NULL,
  `ContactNumber` bigint(12) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `AdminName`, `EmailId`, `ContactNumber`, `password`, `updationDate`) VALUES
(1, 'admin', 'Admin', 'admin@gmail.com', 1234567890, 'e10adc3949ba59abbe56e057f20f883e', '18-10-2016 04:18:16');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'Product', 'Product', '2020-06-21 07:06:04', '2022-07-16 18:22:25'),
(2, 'Services', 'Services', '2020-06-22 18:30:00', '2022-07-16 18:23:08'),
(3, 'Other', 'Others', '2022-07-16 18:23:27', '2022-07-16 20:02:50');

-- --------------------------------------------------------

--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `remark` mediumtext,
  `remarkDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `stateName` varchar(255) DEFAULT NULL,
  `stateDescription` tinytext,
  `postingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `stateName`, `stateDescription`, `postingDate`, `updationDate`) VALUES
(1, 'Kedah', 'Malaysia', '2020-06-27 19:18:02', '2022-07-16 20:03:59'),
(2, 'Selangor', 'Malaysia', '2020-06-27 19:18:14', '2022-07-16 20:04:11'),
(3, 'Negeri Sembilan', 'Malaysia', '2020-06-27 19:18:34', '2022-07-16 20:04:20'),
(4, 'Sarawak', 'Malaysia', '2022-07-16 18:51:19', '2022-07-16 20:04:29'),
(5, 'Perak', 'Malaysia', '2022-07-16 18:51:19', '2022-07-16 20:04:40'),
(6, 'Sabah', 'Malaysia', '2022-07-16 18:52:54', '2022-07-16 20:04:52'),
(7, 'Johor', 'Malaysia', '2022-07-16 18:52:54', '2022-07-16 20:05:00'),
(8, 'Perlis', 'Malaysia', '2022-07-16 18:52:54', '2022-07-16 20:05:07'),
(9, 'Pahang', 'Malaysia', '2022-07-16 18:52:54', '2022-07-16 20:05:15'),
(10, 'Kelantan', 'Malaysia', '2022-07-16 18:52:54', '2022-07-16 20:05:25'),
(11, 'Malacca', 'Malaysia', '2022-07-16 18:52:54', NULL),
(12, 'Terengganu', 'Malaysia', '2022-07-16 18:52:54', NULL),
(13, 'Pulau Pinang', 'Malaysia', '2022-07-16 18:52:54', NULL),
(14, 'Labuan', 'Malaysia', '2022-07-16 18:52:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(1, 1, 'Item missing', '2020-03-28 07:11:07', '2022-07-16 18:26:59'),
(2, 1, 'Item damaged', '2020-03-28 07:11:20', '2022-07-16 18:27:10'),
(3, 3, 'Other', '2020-06-24 07:06:44', '2022-07-16 18:31:22'),
(4, 1, 'Wrong parcel', '2022-07-16 18:44:23', '2022-07-16 20:03:09'),
(5, 1, 'Request return parcels', '2022-07-16 18:45:42', '2022-07-16 20:03:21'),
(6, 2, 'Delay delivery', '2022-07-16 18:45:43', '2022-07-16 20:03:32'),
(7, 2, 'Wrong destination', '2022-07-16 18:46:34', '2022-07-16 20:03:41'),
(8, 2, 'Rude behaviour', '2022-07-16 18:46:36', '2022-07-16 20:03:50');

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `complaintType` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `noc` varchar(255) DEFAULT NULL,
  `complaintDetails` mediumtext,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`complaintNumber`, `userId`, `category`, `subcategory`, `complaintType`, `state`, `noc`, `complaintDetails`, `complaintFile`, `regDate`, `status`, `lastUpdationDate`) VALUES
(1, 2, 1, 'Online Shopping', ' Complaint', 'Delhi', 'Test Complaint', 'This is test complaint', '', '2020-06-28 13:20:55', 'closed', '2020-06-28 13:27:41'),
(2, 3, 2, 'other', ' Complaint', 'Haryana', 'hhh', 'hhh', '01 LOGIN DETAILS & PROJECT INFO.txt', '2022-07-12 14:15:51', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblforwardhistory`
--

CREATE TABLE `tblforwardhistory` (
  `id` int(11) NOT NULL,
  `ComplaintNumber` bigint(12) DEFAULT NULL,
  `ForwardFrom` int(6) DEFAULT NULL,
  `ForwardTo` int(6) DEFAULT NULL,
  `ForwadDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblforwardhistory`
--

INSERT INTO `tblforwardhistory` (`id`, `ComplaintNumber`, `ForwardFrom`, `ForwardTo`, `ForwadDate`) VALUES
(1, 1, 1, 2, '2020-06-28 13:22:58'),
(2, 2, 1, 1, '2022-07-12 18:36:28');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubadmin`
--

CREATE TABLE `tblsubadmin` (
  `id` int(11) NOT NULL,
  `SubAdminName` varchar(150) DEFAULT NULL,
  `Department` varchar(150) DEFAULT NULL,
  `EmailId` varchar(150) DEFAULT NULL,
  `ContactNumber` bigint(12) DEFAULT NULL,
  `UserName` varchar(12) DEFAULT NULL,
  `Password` varchar(150) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `IsActive` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubadmin`
--

INSERT INTO `tblsubadmin` (`id`, `SubAdminName`, `Department`, `EmailId`, `ContactNumber`, `UserName`, `Password`, `RegDate`, `LastUpdationDate`, `IsActive`) VALUES
(1, 'Anuj kumar', 'Information Technology', 'test@gmail.com', 1234567890, 'anujk30', '5c428d8875d2948607f3e3fe134d71b4', '2020-06-28 13:00:51', '2020-06-28 13:01:20', 1),
(2, 'Test subadmin', 'Finace', 'testsa@gmail.com', 1234567890, 'testsa', 'f925916e2754e5e03f75dd58a5733251', '2020-06-28 13:22:17', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblsubadminremark`
--

CREATE TABLE `tblsubadminremark` (
  `id` int(11) NOT NULL,
  `ComplainNumber` bigint(12) DEFAULT NULL,
  `ComplainStatus` varchar(20) DEFAULT NULL,
  `ComplainRemark` mediumtext,
  `RemarkBy` int(11) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblsubadminremark`
--

INSERT INTO `tblsubadminremark` (`id`, `ComplainNumber`, `ComplainStatus`, `ComplainRemark`, `RemarkBy`, `PostingDate`) VALUES
(1, 1, 'closed', 'Complaint closed.', 2, '2020-06-28 13:27:41');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 0, 'phpgurukulteam@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-27 19:14:33', '', 0),
(2, 1, 'phpgurukultest@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-27 19:15:08', '28-06-2020 12:47:04 AM', 1),
(3, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-28 13:19:32', '28-06-2020 06:51:17 PM', 1),
(4, 2, 'testuser@gmail.com', 0x3a3a3100000000000000000000000000, '2020-06-28 14:12:03', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactNo` bigint(11) DEFAULT NULL,
  `address` tinytext,
  `State` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT NULL,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userEmail`, `password`, `contactNo`, `address`, `State`, `country`, `pincode`, `userImage`, `regDate`, `updationDate`, `status`) VALUES
(1, 'Anuj kumar', 'phpgurukultest@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 1234567890, NULL, NULL, NULL, NULL, '1fc8381ccac933612936bb617a5ae906.png', '2020-06-27 19:14:17', NULL, 1),
(2, 'Test user', 'testuser@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 1234567899, 'New Delhi', 'Delhi', 'India', 110091, '1fc8381ccac933612936bb617a5ae906.png', '2020-06-28 13:19:15', NULL, 1),
(3, 'Adilah Rashid', 'nuradilah688@gmail.com', 'a9eab742a6a7e91436edc73374a824f5', 137199598, NULL, NULL, NULL, NULL, '72a61bfbbb68e08217197bff6f9116fa.jpg', '2022-07-10 07:29:36', NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `tblforwardhistory`
--
ALTER TABLE `tblforwardhistory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubadmin`
--
ALTER TABLE `tblsubadmin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubadminremark`
--
ALTER TABLE `tblsubadminremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblforwardhistory`
--
ALTER TABLE `tblforwardhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblsubadmin`
--
ALTER TABLE `tblsubadmin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tblsubadminremark`
--
ALTER TABLE `tblsubadminremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
