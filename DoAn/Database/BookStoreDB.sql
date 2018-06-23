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

create database bookstoredb;
use bookstoredb;
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
(3, 'chithien', '123456', 2, 1),
(4, 'anhthu', '123456', 2, 1),
(5, 'queanh', '123456', 2, 1),
(6, 'kimyen', '123456', 2, 1),
(7, 'vantrung', '123456', 2, 1),
(8, 'a', '123456', 2, 1),
(9, 'b', '123456', 2, 1),
(10, 'c', '123456', 2, 1);

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
(2, 'Timesaver For Exams - IELTS', 'Norman Whitby, Julie Moore', 'NXB Tổng hợp TP.HCM', '1996-10-10 00:00:00', 'TheWomanintheDunes.jpg', 20, 20, 200, 'Chưa cập nhật', 1),
(3, 'Bí Quyết Học Và Thi IELTS', 'Knowledge Link', 'NXB Phụ Nữ', '2000-12-01 00:00:00', 'TheWomanintheDunes.jpg', 15, 20, 150, 'Chưa cập nhật', 1),
(4, 'Đàm Thoại Tiếng Nhật Hiện Đại (Kèm CD)', 'Ngọc Yến', 'NXB Thanh niên', '2000-12-01 00:00:00', 'DamThoaiTiengNhatHienDai.jpg', 20, 20, 200, 'Chưa cập nhật', 2),
(5, 'Ngữ Pháp Tiếng Nhật Căn Bản (Tái Bản)', 'The Sakura', 'NXB Hồng Đức', '2010-05-15 00:00:00', 'NguPhapTiengNhatCanBan.jpg', 20, 20, 200, 'Chưa cập nhật', 2),
(6, 'Tập Viết Tiếng Nhật Căn Bản Kanji', 'Mai Ngọc', 'NXB Đại học quốc gia Hà Nội', '2010-05-15 00:00:00', 'TapVietTiengNhatCanBanKanji.jpg', 20, 20, 200, 'Chưa cập nhật', 2),
(7, 'Tập Viết Tiếng Hàn Dành Cho Người Mới Bắt Đầu', 'The Changmi', 'NXB Hồng Đức', '2010-05-15 00:00:00', 'TapVietTiengHanDanhChoNguoiMoiBatDau.jpg', 20, 20, 200, 'Chưa cập nhật', 3),
(8, '3000 Từ Vựng Tiếng Hàn Theo Chủ Đề', 'Dương Thị Hồng Yên', 'NXB Hồng Đức', '2010-05-15 00:00:00', '3000TuVungTiengHanTheoChuDe.jpg', 20, 20, 200, 'Chưa cập nhật', 3),
(9, 'Học Tiếng Hàn Thật Là Đơn Giản', 'Seung -eun Oh', 'NXB Đại học quốc gia Hà Nội', '2010-05-15 00:00:00', 'HocTiengHanThatLaDonGian.jpg', 20, 20, 200, 'Chưa cập nhật', 3),
(10, 'Phát Triển Khách Hàng Tinh Gọn', 'Cindy Alvarez', 'NXB Công Thương', '2010-05-15 00:00:00', 'PhatTrienKhachHangTinhGon.jpg', 20, 20, 200, 'Chưa cập nhật', 4),
(11, 'Kỹ Năng Bán Hàng (Tái Bản 2018)', 'William T. Brooks', 'Nxb Lao động - Xã hội', '2010-05-15 00:00:00', 'KyNangBanHang.jpg', 20, 20, 200, 'Chưa cập nhật', 4),
(12, 'Chiến Lược Bán Hàng', 'Đàm Phương', 'NXB Thanh Hóa', '2010-05-15 00:00:00', 'ChienLuocBanHang.jpg', 20, 20, 200, 'Chưa cập nhật', 4),
(13, 'Ngủ Ít Vẫn Khỏe', 'Satoru Tsubota', 'NXB Lao động', '2010-05-15 00:00:00', 'NguItVanKhoe.jpg', 20, 20, 200, 'Chưa cập nhật', 5),
(14, 'Giấc Ngủ - Liều Thuốc Bổ Cho Cuộc Sống', 'Minh Tuấn, Khánh Hương', 'NXB Văn hóa Thông tin', '2010-05-15 00:00:00', 'GiacNgu-LieuThuocBoChoCuocSong.jpg', 20, 20, 200, 'Chưa cập nhật', 5),
(15, '550 Bài Thuốc Đông Y Gia Truyền Trị Bách Bệnh', 'Quốc Trung', ' NXB Dân Trí', '2010-05-15 00:00:00', '550BaiThuocĐôngYGiaTruyenTriBachBenh.jpg', 20, 20, 200, 'Chưa cập nhật', 5),
(16, 'Thích Là Nhích', 'Alex Tu', 'NXB Thế giới', '2010-05-15 00:00:00', 'ThichLaNhich.jpg', 20, 20, 200, 'Chưa cập nhật', 6),
(17, 'Nước Đức Trong Lòng Bàn Tay', 'Trần Mai', 'NXB Thế giới', '2010-05-15 00:00:00', 'NuocDucTrongLongBanTay.jpg', 20, 20, 200, 'Chưa cập nhật', 6),
(18, 'Hộ Chiếu Xanh Đi Quanh Thế Giới', 'Nhiều tác giả', 'NXB Thế giới', '2010-05-15 00:00:00', 'HoChieuXanhDiQuanhTheGioi.jpg', 20, 20, 200, 'Chưa cập nhật', 6),
(19, 'Những Huyền Thoại Truyện Tranh Thế Giới - Thủy Thủ Popeye', 'E. C. Segar', 'NXB Kim Đồng', '2010-05-15 00:00:00', 'NhungHuyenThoaiTruyenTranhTheGioi-ThuyThuPopeye.jpg', 20, 20, 200, 'Chưa cập nhật', 7),
(20, 'Truyện Tranh Khoa Học: Why? - Biển', 'Nhiều tác giả', 'NXB Trẻ', '2010-05-15 00:00:00', 'TruyenTranhKhoaHocWhy-Bien.jpg', 20, 20, 200, 'Chưa cập nhật', 7),
(21, 'Truyện Tranh Từ Màn Ảnh - Vua Sư Tử', 'Disney', 'NXB Dân Trí', '2010-05-15 00:00:00', 'TruyenTranhTuManAnh-VuaSuTu.jpg', 20, 20, 200, 'Chưa cập nhật', 7),
(22, 'Phút Im Lặng', 'Siegfriend Lenz', 'NXB Phụ Nữ', '2010-05-15 00:00:00', 'PhutImLang.jpg', 20, 20, 200, 'Chưa cập nhật', 8),
(23, 'Bên Nhau Trọn Đời (Tái Bản 2018)', 'Cố Mạn', 'NXB Văn Học', '2010-05-15 00:00:00', 'BenNhauTronDoi.jpg', 20, 20, 200, 'Chưa cập nhật', 8),
(24, 'Bức Thư Bị Lãng Quên (Tái Bản 2017)', 'Cố Tây Tước', 'NXB Thanh Niên', '2010-05-15 00:00:00', 'BucThuBiLangQuen.jpg', 20, 20, 200, 'Chưa cập nhật', 8),
(25, 'Kỳ Án Ánh Trăng (Phiên Bản Mới)', 'Quỷ Cổ Nữ', 'NXB Văn Học', '2010-05-15 00:00:00', 'KyAnAnhTrang.jpg', 20, 20, 200, 'Chưa cập nhật', 9),
(26, 'Thủy Xa Quán', 'Yukito Ayatsuji', 'NXB Hội Nhà Văn', '2010-05-15 00:00:00', 'ThuyXaQuan.jpg', 20, 20, 200, 'Chưa cập nhật', 9),
(27, 'Sông Ngầm', 'Lôi Mễ', 'NXB Văn Học', '2010-05-15 00:00:00', 'SongNgam.jpg', 20, 20, 200, 'Chưa cập nhật', 9),
(28, 'Nghĩ Đơn Giản, Sống Đơn Thuần', 'Tolly Burkan', 'NXB Thế Giới', '2010-05-15 00:00:00', 'NghiDonGianSongDonThuan.jpg', 20, 20, 200, 'Chưa cập nhật', 10),
(29, 'Tuổi Trẻ Không Trì Hoãn', 'Thần Cách', 'NXB Thế Giới', '2010-05-15 00:00:00', 'TuoiTreKhongTriHoan.jpg', 20, 20, 200, 'Chưa cập nhật', 10),
(30, 'Lật Đổ Ông Vua Trì Hoãn', 'Oopsy', 'NXB Thế Giới', '2010-05-15 00:00:00', 'LatDoOngVuaTriHoan.jpg', 20, 20, 200, 'Chưa cập nhật', 10),
(31, 'Harvard Bốn Rưỡi Sáng', 'Xiu-ying Wei', 'NXB Thế Giới', '2010-05-15 00:00:00', 'HarvardBonRuoiSang.jpg', 20, 20, 200, 'Chưa cập nhật', 11),
(32, 'Phất Tay Lung Lay Thế Giới', 'Oopsy', 'NXB Thế Giới', '2010-05-15 00:00:00', 'PhatTayLungLayTheGioi.jpg', 20, 20, 200, 'Chưa cập nhật', 11),
(33, 'Cứ Đi Để Lối Thành Đường', 'Phoenix Ho', 'NXB Thế Giới', '2010-05-15 00:00:00', 'CuDiDeLoiThanhDuong.jpg', 20, 20, 200, 'Chưa cập nhật', 11),
(34, 'Tuổi Trẻ Đáng Giá Bao Nhiêu', 'Rosie Nguyễn', 'NXB Hội Nhà Văn', '2010-05-15 00:00:00', 'TuoiTreDangGiaBaoNhieu.jpg', 20, 20, 200, 'Chưa cập nhật', 12),
(35, 'Ngày Xưa Có Một Con Bò', 'Camilo Cruz', 'NXB Trẻ', '2010-05-15 00:00:00', 'NgayXuaCoMotConBo.jpg', 20, 20, 200, 'Chưa cập nhật', 12),
(36, 'Hiểu Về Trái Tim', 'Minh Niệm', 'NXB Tổng Hợp TP.HCM', '2010-05-15 00:00:00', 'HieuVeTraiTim.jpg', 20, 20, 200, 'Chưa cập nhật', 12),
(37, 'Tự Học VB.NET Và SQL SERVER 2008', 'KS. Hoàng Anh Quang', 'NXB Hồng Đức', '2010-05-15 00:00:00', 'TuHocVBNET.jpg', 20, 20, 200, 'Chưa cập nhật', 13),
(38, 'Bài Tập Thực Hành Arduino - Lập Trình Điều Khiển Với Arduino', 'Phạm Quang Huy - Lê Cảnh Trung', 'NXB Khoa Học Và Kỹ Thuật', '2010-05-15 00:00:00', 'LapTrinhDieuKhienVoiArduino.jpg', 20, 20, 200, 'Chưa cập nhật', 13),
(39, 'Vi Điều Khiển Và Ứng Dụng Arduino Dành Cho Người Tự Học', 'Phạm Quang Huy - Nguyễn Trọng Hiếu', 'NXB Bách Khoa Hà Nội', '2010-05-15 00:00:00', 'ViDieuKhienVaUngDungArduino.jpg', 20, 20, 200, 'Chưa cập nhật', 13),
(40, 'Giáo Trình Thực Hành Microsoft Word Dùng Cho Các Phiên Bản', 'Phạm Quang Hiển - Phạm Phương Hoa', 'NXB Thanh Niên', '2010-05-15 00:00:00', 'ThucHanhMicrosoftWord.jpg', 20, 20, 200, 'Chưa cập nhật', 14),
(41, 'Tự Học Microsoft Word Dành Cho Người Mới Bắt Đầu (Kèm CD)', 'VL - Comp', 'NXB Hồng Đức', '2010-05-15 00:00:00', 'TuHocMicrosoftWord.jpg', 20, 20, 200, 'Chưa cập nhật', 14),
(42, 'Thực Hành Microsoft Word - Excel - Powerpoint 2016 Bằng Các Tuyệt Chiêu (Kèm CD)', 'Nhiều Tác Giả', 'NXB Đồng Nai', '2010-05-15 00:00:00', 'ThucHanhMSOffice.jpg', 20, 20, 200, 'Chưa cập nhật', 14),
(43, 'Tự Học Thiết Kế Đồ Họa Trên Photoshop CS6', 'Nguyễn Đức Hiếu (biên soạn)', 'NXB Hồng Đức', '2010-05-15 00:00:00', 'TuHocThietKeDoHoa.jpg', 20, 20, 200, 'Chưa cập nhật', 15),
(44, 'Thực Hành Autocad 2017 Cơ Bản Và Nâng Cao (Kèm CD)', 'VL - Comp', 'NXB Hồng Đức', '2010-05-15 00:00:00', 'ThucHanhAutocad.jpg', 20, 20, 200, 'Chưa cập nhật', 15),
(45, 'Autocad Structural Detailing Dành Cho Người Bắt Đầu (Kết Cấu Thép)', 'Phạm Quang Hiển - Lê Thanh Nhật', 'NXB Khoa Học Và Kỹ Thuật', '2010-05-15 00:00:00', 'AutocadStructuralDetailing.jpg', 20, 20, 200, 'Chưa cập nhật', 15);

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
(1, 'Foreign Language'),
(2, 'Specialized'),
(3, 'Story'),
(4, 'Life skill'),
(5, 'Informatics');


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
(1, 'Nguyễn Chí Thiện', '01212014235', 'chithien@gmail.com', b'1', 3),
(2, 'Trần Thị Anh Thư', '01212259135', 'anhthu1211@gmail.com', b'0', 4),
(3, 'Võ Quế Anh', '01212019562', 'queanh2126@gmail.com', b'0', 5),
(4, 'Trần Thị Kim Yến', '01212014235', 'kimyen1124@gmail.com', b'0', 6),
(5, 'Nguyễn Văn Trung', '01212014235', 'vantrung0012@gmail.com', b'1', 7),
(6, 'Nguyễn A', '01212014235', 'a@gmail.com', b'1', 8),
(7, 'Trần B', '01212259135', 'b@gmail.com', b'0', 9),
(8, 'Võ C', '01212019562', 'c@gmail.com', b'0', 10);

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

-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `issuinghouse` (`IssuingHouse_ID`, `IssuingHouse_Name`, `Contact`, `Address`) VALUES
(1, 'Alpha books', '01212017777', 'Chưa cập nhật'),
(2, 'Văn Lang', '01212017776', 'Chưa cập nhật'),
(3, 'Minh Tâm', '01212017775', 'Chưa cập nhật'),
(4, 'NXB Phụ Nữ', '01212017774', 'Chưa cập nhật'),
(5, 'Thái Hà', '01212017773', 'Chưa cập nhật');

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
(3, 'Korean', 'The language of Korea', 1),
(4, 'Economic', 'Economic', 2),
(5, 'Medicine', 'Medicine', 2),
(6, 'Travel', 'Travel', 2),
(7, 'Comic', 'Comic', 3),
(8, 'Love Story', 'Love Story', 3),
(9, 'Ghost Story', 'Ghost Story', 3),
(10, 'Beauty Life', 'Beauty Life', 4),
(11, 'Orientation', 'Orientation', 4),
(12, 'Living Thinking', 'Living Thinking', 4),
(13, 'Developing', 'Developing', 5),
(14, 'Office', 'Office', 5),
(15, 'Design', 'Design', 5);


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
