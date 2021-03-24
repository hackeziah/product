-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2019 at 08:45 AM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbproduct`
--

-- --------------------------------------------------------

--
-- Table structure for table `tblcustomer`
--

CREATE TABLE `tblcustomer` (
  `custid` int(11) NOT NULL,
  `custname` varchar(50) NOT NULL,
  `custaddress` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcustomer`
--

INSERT INTO `tblcustomer` (`custid`, `custname`, `custaddress`) VALUES
(27, 'Rainen', 'Taguig'),
(30, 'Princess', 'Tondo'),
(31, 'sdf', 'fd'),
(32, 'qwe', 'qew'),
(33, 'lk', 'lk'),
(34, 'lk', 'lk'),
(35, 'qwee', 'ewq');

-- --------------------------------------------------------

--
-- Table structure for table `tblorder`
--

CREATE TABLE `tblorder` (
  `orderid` int(11) NOT NULL,
  `orderdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `pid` int(11) NOT NULL,
  `custid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblorder`
--

INSERT INTO `tblorder` (`orderid`, `orderdate`, `pid`, `custid`) VALUES
(8, '2019-02-09 08:28:32', 10, 30),
(9, '2019-02-09 08:35:41', 8, 27),
(22, '2019-02-09 08:45:04', 19, 31),
(24, '2019-02-09 08:45:38', 10, 33),
(25, '2019-02-09 08:45:46', 10, 34),
(26, '2019-02-09 08:46:10', 18, 35),
(27, '2019-02-09 08:48:51', 6, 27);

-- --------------------------------------------------------

--
-- Table structure for table `tblproductdetails`
--

CREATE TABLE `tblproductdetails` (
  `pid` int(11) NOT NULL,
  `pname` varchar(30) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblproductdetails`
--

INSERT INTO `tblproductdetails` (`pid`, `pname`, `price`) VALUES
(4, 'apple', 5),
(6, 'Meat', 100),
(8, 'Chicken', 200),
(9, 'Celery', 90),
(10, 'Fruits', 50),
(18, 'test', 0),
(19, 'samp', 0),
(20, 'samp', 0),
(21, 'samp', 0),
(22, 'ggg', 0),
(23, 'try', 0),
(24, 'ad', 0),
(25, 'qwe', 0),
(26, 'lk', 0),
(27, 'adf', 0),
(28, 'adf', 0),
(29, 'C2', 25),
(30, 'asfd', 213);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  ADD PRIMARY KEY (`custid`);

--
-- Indexes for table `tblorder`
--
ALTER TABLE `tblorder`
  ADD PRIMARY KEY (`orderid`),
  ADD KEY `fk_a` (`pid`),
  ADD KEY `fk_b` (`custid`);

--
-- Indexes for table `tblproductdetails`
--
ALTER TABLE `tblproductdetails`
  ADD PRIMARY KEY (`pid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblcustomer`
--
ALTER TABLE `tblcustomer`
  MODIFY `custid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `tblorder`
--
ALTER TABLE `tblorder`
  MODIFY `orderid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `tblproductdetails`
--
ALTER TABLE `tblproductdetails`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblorder`
--
ALTER TABLE `tblorder`
  ADD CONSTRAINT `fk_a` FOREIGN KEY (`pid`) REFERENCES `tblproductdetails` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_b` FOREIGN KEY (`custid`) REFERENCES `tblcustomer` (`custid`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
