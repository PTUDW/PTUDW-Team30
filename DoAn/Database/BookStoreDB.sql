-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 22, 2018 lúc 04:42 SA
-- Phiên bản máy phục vụ: 5.7.14
-- Phiên bản PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bookstoredb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `account`
--

CREATE TABLE `account` (
  `Account_ID` int(11) NOT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Account_Password` varchar(50) DEFAULT NULL,
  `Account_Type` int(11) DEFAULT NULL,
  `Account_Status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `account`
--

INSERT INTO `account` (`Account_ID`, `UserName`, `Account_Password`, `Account_Type`, `Account_Status`) VALUES
(1, 'duynhat', '123456', 1, 1),
(2, 'thanhtruc', '123456', 1, 1),
(3, 'chithien2510', '123456', 2, 2),
(4, 'anhthu1211', '123456', 2, 2),
(5, 'queanh2126', '123456', 2, 2),
(6, 'kimyen1124', '123456', 2, 2),
(7, 'vantrung0012', '123456', 2, 2),
(8, 'anhhieu5511', '123456', 2, 2),
(9, 'huyenanh1155', '123456', 2, 2),
(10, 'thuytien1910', '123456', 2, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `book`
--

CREATE TABLE `book` (
  `Book_ID` int(11) NOT NULL,
  `Book_Name` varchar(50) DEFAULT NULL,
  `Author` varchar(50) DEFAULT NULL,
  `Publisher` varchar(50) DEFAULT NULL,
  `Publish_Date` datetime DEFAULT NULL,
  `Image` varchar(50) DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `View_Number` int(11) DEFAULT NULL,
  `Description` varchar(1024) NOT NULL,
  `Kind_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `book`
--

INSERT INTO `book` (`Book_ID`, `Book_Name`, `Author`, `Publisher`, `Publish_Date`, `Image`, `Price`, `Quantity`, `View_Number`, `Description`, `Kind_ID`) VALUES
(1, 'High School English Grammar and Composition', 'Wren & Martin', 'Cambrigde University', '2010-05-15 00:00:00', 'HighSchoolEnglishGrammarandComposition.jpg', 15, 10, 100, 'It provides ample guidance and practice in sentence building, correct usage, comprehension, written composition and other allied areas so as to equip the student with the ability to communicate effectively in English.', 1),
(2, 'The Woman in the Dunes', 'Kobo Abe', 'Tokyo', '1996-10-10 00:00:00', 'TheWomanintheDunes.jpg', 20, 20, 200, 'The Woman in the Dunes, by celebrated writer and thinker Kobo Abe, combines the essence of myth, suspense and the existential novel.\r\n \r\nAfter missing the last bus home following a day trip to the seashore, an amateur entomologist is offered lodging for the night at the bottom of a vast sand pit. But when he attempts to leave the next morning, he quickly discovers that the locals have other plans. Held captive with seemingly no chance of escape, he is tasked with shoveling back the ever-advancing sand dunes that threaten to destroy the village. His only companion is an odd young woman. Together their fates become intertwined as they work side by side at this Sisyphean task.', 2),
(3, 'Easy French Step-by-Step', 'Myrna Bell Rochester', 'Paris', '2000-12-01 00:00:00', 'TheWomanintheDunes.jpg', 15, 20, 150, 'Easy French Step-by-Step proves that a solid grounding in grammar basics is the key to mastering a second language. You are quickly introduced to grammatical rules and concepts in order of importance, which you can build on as you progress through the book. You will also learn more than 300 verbs, chosen by their frequency of use. Numerous exercises and engaging readings help you quickly build your speaking and comprehension prowess.', 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `Category_ID` int(11) NOT NULL,
  `Category_Name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`Category_ID`, `Category_Name`) VALUES
(9, 'Comics'),
(10, 'Cookbooks'),
(1, 'Foreign Language'),
(4, 'Guide'),
(6, 'Health'),
(8, 'History'),
(3, 'Horror'),
(2, 'Mystery'),
(7, 'Science'),
(5, 'Travel');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `Customer_ID` int(11) NOT NULL,
  `Customer_Name` varchar(50) DEFAULT NULL,
  `Phone` char(15) CHARACTER SET latin1 DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Gender` bit(1) DEFAULT NULL,
  `Account_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`Customer_ID`, `Customer_Name`, `Phone`, `Email`, `Gender`, `Account_ID`) VALUES
(1, 'Nguyễn Duy Nhât', '01212073173', 'duynhat240896@gmail.com', b'1', 1),
(2, 'Võ Thị Thanh Trúc', '01212014025', 'trucvo@gmail.com', b'0', 2),
(3, 'Nguyễn Chí Thiện', '01212014235', 'chithien@gmail.com', b'1', 3),
(4, 'Trần Thị Anh Thư', '01212259135', 'anhthu1211@gmail.com', b'0', 4),
(5, 'Võ Quế Anh', '01212019562', 'queanh2126@gmail.com', b'0', 5),
(6, 'Trần Thị Kim Yến', '01212014235', 'kimyen1124@gmail.com', b'0', 6),
(7, 'Nguyễn Văn Trung', '01212014235', 'vantrung0012@gmail.com', b'1', 7),
(8, 'Nguyễn Anh Hiếu', '01212014235', 'anhhieu5511@gmail.com', b'1', 8),
(9, 'Trần Thị Huyền Anh', '01212014235', 'huyenanh1155@gmail.com', b'0', 9),
(10, 'Vũ Thị Thủy Tiên', '01212014235', 'thuytien1910@gmail.com', b'0', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `issuancedetail`
--

CREATE TABLE `issuancedetail` (
  `IssuingHouse_ID` int(11) NOT NULL,
  `Book_ID` int(11) NOT NULL,
  `Import_Date` datetime NOT NULL,
  `Import_Quantity` int(11) DEFAULT NULL,
  `Import_Price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `issuinghouse`
--

CREATE TABLE `issuinghouse` (
  `IssuingHouse_ID` int(11) NOT NULL,
  `IssuingHouse_Name` varchar(50) DEFAULT NULL,
  `Contact` char(15) CHARACTER SET latin1 DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `kind`
--

CREATE TABLE `kind` (
  `Kind_ID` int(11) NOT NULL,
  `Kind_Name` varchar(50) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Category_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `kind`
--

INSERT INTO `kind` (`Kind_ID`, `Kind_Name`, `Description`, `Category_ID`) VALUES
(1, 'English', 'The most popular language in the world', 1),
(2, 'Japanese', 'The language of Japan', 1),
(3, 'French', 'The language of France', 1),
(4, 'Horror Comedy', 'Horror stories include humorous situations', 3),
(5, 'Japanese horror', 'Horror stories by Japanese genre', 3),
(6, 'Korean horror', 'Horror stories by Korean genre', 3),
(7, 'Tourguide', 'Compile all the necessary instructions when traveling', 4),
(8, 'Design guide', 'All design techniques on windows', 4),
(9, 'Programming guide', 'Programming in different languages', 4),
(10, 'Travel Asia', 'Asia travel guide', 5),
(11, 'Travel Europe', 'Euro travel guide', 5),
(12, 'Travel America', 'American travel guide', 5),
(13, 'Infant', 'Infant health care', 6),
(14, 'The Elderly', 'Health care for the elderly', 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `Order_ID` int(11) NOT NULL,
  `Book_ID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `Order_ID` int(11) NOT NULL,
  `Order_Date` datetime DEFAULT NULL,
  `Consignee` varchar(50) DEFAULT NULL,
  `Consignee_Phone` varchar(15) DEFAULT NULL,
  `Consignee_Address` varchar(100) DEFAULT NULL,
  `Note` varchar(200) DEFAULT NULL,
  `Total` mediumtext CHARACTER SET latin1,
  `Order_Status` int(11) DEFAULT '0',
  `Customer_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Account_ID`),
  ADD UNIQUE KEY `UserName` (`UserName`);

--
-- Chỉ mục cho bảng `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`Book_ID`),
  ADD KEY `Kind_ID` (`Kind_ID`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`Category_ID`),
  ADD UNIQUE KEY `Category_Name` (`Category_Name`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Customer_ID`),
  ADD KEY `Account_ID` (`Account_ID`);

--
-- Chỉ mục cho bảng `issuancedetail`
--
ALTER TABLE `issuancedetail`
  ADD PRIMARY KEY (`IssuingHouse_ID`,`Book_ID`,`Import_Date`),
  ADD KEY `Book_ID` (`Book_ID`);

--
-- Chỉ mục cho bảng `issuinghouse`
--
ALTER TABLE `issuinghouse`
  ADD PRIMARY KEY (`IssuingHouse_ID`),
  ADD UNIQUE KEY `IssuingHouse_Name` (`IssuingHouse_Name`);

--
-- Chỉ mục cho bảng `kind`
--
ALTER TABLE `kind`
  ADD PRIMARY KEY (`Kind_ID`),
  ADD UNIQUE KEY `Kind_Name` (`Kind_Name`),
  ADD KEY `Category_ID` (`Category_ID`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`Order_ID`,`Book_ID`),
  ADD KEY `FK_OrderDetail_Book` (`Book_ID`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `Customer_ID` (`Customer_ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `account`
--
ALTER TABLE `account`
  MODIFY `Account_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT cho bảng `book`
--
ALTER TABLE `book`
  MODIFY `Book_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `Category_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `Customer_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT cho bảng `issuinghouse`
--
ALTER TABLE `issuinghouse`
  MODIFY `IssuingHouse_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `kind`
--
ALTER TABLE `kind`
  MODIFY `Kind_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`Kind_ID`) REFERENCES `kind` (`Kind_ID`);

--
-- Các ràng buộc cho bảng `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`Account_ID`) REFERENCES `account` (`Account_ID`);

--
-- Các ràng buộc cho bảng `issuancedetail`
--
ALTER TABLE `issuancedetail`
  ADD CONSTRAINT `issuancedetail_ibfk_1` FOREIGN KEY (`Book_ID`) REFERENCES `book` (`Book_ID`);

--
-- Các ràng buộc cho bảng `kind`
--
ALTER TABLE `kind`
  ADD CONSTRAINT `kind_ibfk_1` FOREIGN KEY (`Category_ID`) REFERENCES `category` (`Category_ID`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customer` (`Customer_ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
