Create Database BookDB;

Use BookDB;

Create Table Category
(
	Category_ID int primary key AUTO_INCREMENT,
    Category_Name nvarchar(50) UNIQUE
);

Create Table Kind
(
	Kind_ID int primary key AUTO_INCREMENT,
    Kind_Name nvarchar(50) UNIQUE,
    Description nvarchar(1000),
    Category_ID int
);

Create Table Book
(
	Book_ID int primary key AUTO_INCREMENT,
    Book_Name nvarchar(100),
    Author nvarchar(100),
    Publisher nvarchar(100),
    Publish_Date Datetime,
    Image varchar(100),
    Price int check (Book_Price > 0),
    Quantity int check (Book_Quantity >= 0),
    View_Number int check (View_Number >= 0),
    Description nvarchar(1000) NOT NULL,
    Kind_ID int
);

Create Table IssuingHouse
(
	IssuingHouse_ID int primary key AUTO_INCREMENT,
    IssuingHouse_Name nvarchar(100) UNIQUE,
    Contact char(15),
    Address nvarchar(100)
);

Create Table IssuanceDetail
(
	IssuingHouse_ID int,
    Book_ID int,
    Import_Date Datetime,
    Import_Quantity int check (Import_Quantity > 0),
    Import_Price int,
    Primary key (IssuingHouse_ID, Book_ID, Import_Date)
);

Create Table Account
(
	Account_ID int primary key AUTO_INCREMENT,
    UserName nvarchar(50) UNIQUE,
    Account_Password nvarchar(50),
    Account_Type int,
    Account_Status int default 1
);

Create Table Customer
(
	Customer_ID int primary key AUTO_INCREMENT,
    Customer_Name nvarchar(50),
    Phone char(15),
    Email nvarchar(50),
    Gender bit,
    Account_ID int
);

Create Table Orders
(
	Order_ID int primary key AUTO_INCREMENT,
    Order_Date Datetime,
    Consignee nvarchar(50),
    Consignee_Phone nvarchar(15),
    Consignee_Address nvarchar(100),
    Note nvarchar(200),
	Total long,
    Order_Status int default 0,
    Customer_ID int
);

Create Table OrderDetail
(
	Order_ID int,
    Book_ID int,
    Quantity int check (Quantity > 0),
    Primary key (Order_ID, Book_ID)
);

ALTER TABLE Kind ADD CONSTRAINT FK_Kind_Category FOREIGN KEY (Category_ID) REFERENCES Category(Category_ID);
ALTER TABLE Book ADD CONSTRAINT FK_Book_Kind FOREIGN KEY (Kind_ID) REFERENCES Kind(Kind_ID);
ALTER TABLE IssuanceDetail ADD CONSTRAINT FK_IssuanceDetail_IssuingHouse FOREIGN KEY (IssuingHouse_ID) REFERENCES IssuingHouse(IssuingHouse_ID);
ALTER TABLE IssuanceDetail ADD CONSTRAINT FK_IssuanceDetail_Book FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID);
ALTER TABLE Customer ADD CONSTRAINT FK_Customer_Account FOREIGN KEY (Account_ID) REFERENCES Account(Account_ID);
ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Customer FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID);
ALTER TABLE OrderDetail ADD CONSTRAINT FK_OrderDetail_Orders FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID);
ALTER TABLE OrderDetail ADD CONSTRAINT FK_OrderDetail_Book FOREIGN KEY (Book_ID) REFERENCES Book(Book_ID);

INSERT INTO `category` (`Category_Name`) VALUES
('Foreign Language'),
('Specialized'),
('Story'),
('Life skill'),
('Informatics');

INSERT INTO `kind` (`Kind_Name`, `Description`, `Category_ID`) VALUES
('English', 'The most popular language in the world', 1),
('Japanese', 'The language of Japan', 1),
('Korean', 'The language of Korea', 1),
('Economic', 'Economic', 2),
('Medicine', 'Medicine', 2),
('Travel', 'Travel', 2),
('Comic', 'Comic', 3),
('Love Story', 'Love Story', 3),
('Ghost Story', 'Ghost Story', 3),
('Beauty Life', 'Beauty Life', 4),
('Orientation', 'Orientation', 4),
('Living Thinking', 'Living Thinking', 4),
('Developing', 'Developing', 5),
('Office', 'Office', 5),
('Design', 'Design', 5);

INSERT INTO `book` (`Book_Name`, `Author`, `Publisher`, `Publish_Date`, `Image`, `Price`, `Quantity`, `View_Number`, `Description`, `Kind_ID`) VALUES
('High School English Grammar and Composition', 'Wren & Martin', 'Cambrigde University', '2010-05-15 00:00:00', 'HighSchoolEnglishGrammarandComposition.jpg', 15, 10, 100, 'It provides ample guidance and practice in sentence building, correct usage, comprehension, written composition and other allied areas so as to equip the student with the ability to communicate effectively in English.', 1),
('Timesaver For Exams - IELTS', 'Norman Whitby, Julie Moore', 'NXB Tổng hợp TP.HCM', '1996-10-10 00:00:00', 'TheWomanintheDunes.jpg', 20, 20, 200, 'Chưa cập nhật', 1),
('Bí Quyết Học Và Thi IELTS', 'Knowledge Link', 'NXB Phụ Nữ', '2000-12-01 00:00:00', 'TheWomanintheDunes.jpg', 15, 20, 150, 'Chưa cập nhật', 1),
('Đàm Thoại Tiếng Nhật Hiện Đại (Kèm CD)', 'Ngọc Yến', 'NXB Thanh niên', '2000-12-01 00:00:00', 'DamThoaiTiengNhatHienDai.jpg', 20, 20, 200, 'Chưa cập nhật', 2),
('Ngữ Pháp Tiếng Nhật Căn Bản (Tái Bản)', 'The Sakura', 'NXB Hồng Đức', '2010-05-15 00:00:00', 'NguPhapTiengNhatCanBan.jpg', 20, 20, 200, 'Chưa cập nhật', 2),
('Tập Viết Tiếng Nhật Căn Bản Kanji', 'Mai Ngọc', 'NXB Đại học quốc gia Hà Nội', '2010-05-15 00:00:00', 'TapVietTiengNhatCanBanKanji.jpg', 20, 20, 200, 'Chưa cập nhật', 2),
('Tập Viết Tiếng Hàn Dành Cho Người Mới Bắt Đầu', 'The Changmi', 'NXB Hồng Đức', '2010-05-15 00:00:00', 'TapVietTiengHanDanhChoNguoiMoiBatDau.jpg', 20, 20, 200, 'Chưa cập nhật', 3),
('3000 Từ Vựng Tiếng Hàn Theo Chủ Đề', 'Dương Thị Hồng Yên', 'NXB Hồng Đức', '2010-05-15 00:00:00', '3000TuVungTiengHanTheoChuDe.jpg', 20, 20, 200, 'Chưa cập nhật', 3),
('Học Tiếng Hàn Thật Là Đơn Giản', 'Seung -eun Oh', 'NXB Đại học quốc gia Hà Nội', '2010-05-15 00:00:00', 'HocTiengHanThatLaDonGian.jpg', 20, 20, 200, 'Chưa cập nhật', 3),
('Phát Triển Khách Hàng Tinh Gọn', 'Cindy Alvarez', 'NXB Công Thương', '2010-05-15 00:00:00', 'PhatTrienKhachHangTinhGon.jpg', 20, 20, 200, 'Chưa cập nhật', 4),
('Kỹ Năng Bán Hàng (Tái Bản 2018)', 'William T. Brooks', 'Nxb Lao động - Xã hội', '2010-05-15 00:00:00', 'KyNangBanHang.jpg', 20, 20, 200, 'Chưa cập nhật', 4),
('Chiến Lược Bán Hàng', 'Đàm Phương', 'NXB Thanh Hóa', '2010-05-15 00:00:00', 'ChienLuocBanHang.jpg', 20, 20, 200, 'Chưa cập nhật', 4),
('Ngủ Ít Vẫn Khỏe', 'Satoru Tsubota', 'NXB Lao động', '2010-05-15 00:00:00', 'NguItVanKhoe.jpg', 20, 20, 200, 'Chưa cập nhật', 5),
('Giấc Ngủ - Liều Thuốc Bổ Cho Cuộc Sống', 'Minh Tuấn, Khánh Hương', 'NXB Văn hóa Thông tin', '2010-05-15 00:00:00', 'GiacNgu-LieuThuocBoChoCuocSong.jpg', 20, 20, 200, 'Chưa cập nhật', 5),
('550 Bài Thuốc Đông Y Gia Truyền Trị Bách Bệnh', 'Quốc Trung', ' NXB Dân Trí', '2010-05-15 00:00:00', '550BaiThuocĐôngYGiaTruyenTriBachBenh.jpg', 20, 20, 200, 'Chưa cập nhật', 5),
('Thích Là Nhích', 'Alex Tu', 'NXB Thế giới', '2010-05-15 00:00:00', 'ThichLaNhich.jpg', 20, 20, 200, 'Chưa cập nhật', 6),
('Nước Đức Trong Lòng Bàn Tay', 'Trần Mai', 'NXB Thế giới', '2010-05-15 00:00:00', 'NuocDucTrongLongBanTay.jpg', 20, 20, 200, 'Chưa cập nhật', 6),
('Hộ Chiếu Xanh Đi Quanh Thế Giới', 'Nhiều tác giả', 'NXB Thế giới', '2010-05-15 00:00:00', 'HoChieuXanhDiQuanhTheGioi.jpg', 20, 20, 200, 'Chưa cập nhật', 6),
('Những Huyền Thoại Truyện Tranh Thế Giới - Thủy Thủ Popeye', 'E. C. Segar', 'NXB Kim Đồng', '2010-05-15 00:00:00', 'NhungHuyenThoaiTruyenTranhTheGioi-ThuyThuPopeye.jpg', 20, 20, 200, 'Chưa cập nhật', 7),
('Truyện Tranh Khoa Học: Why? - Biển', 'Nhiều tác giả', 'NXB Trẻ', '2010-05-15 00:00:00', 'TruyenTranhKhoaHocWhy-Bien.jpg', 20, 20, 200, 'Chưa cập nhật', 7),
('Truyện Tranh Từ Màn Ảnh - Vua Sư Tử', 'Disney', 'NXB Dân Trí', '2010-05-15 00:00:00', 'TruyenTranhTuManAnh-VuaSuTu.jpg', 20, 20, 200, 'Chưa cập nhật', 7),
('Phút Im Lặng', 'Siegfriend Lenz', 'NXB Phụ Nữ', '2010-05-15 00:00:00', 'PhutImLang.jpg', 20, 20, 200, 'Chưa cập nhật', 8),
('Bên Nhau Trọn Đời (Tái Bản 2018)', 'Cố Mạn', 'NXB Văn Học', '2010-05-15 00:00:00', 'BenNhauTronDoi.jpg', 20, 20, 200, 'Chưa cập nhật', 8),
('Bức Thư Bị Lãng Quên (Tái Bản 2017)', 'Cố Tây Tước', 'NXB Thanh Niên', '2010-05-15 00:00:00', 'BucThuBiLangQuen.jpg', 20, 20, 200, 'Chưa cập nhật', 8),
('Kỳ Án Ánh Trăng (Phiên Bản Mới)', 'Quỷ Cổ Nữ', 'NXB Văn Học', '2010-05-15 00:00:00', 'KyAnAnhTrang.jpg', 20, 20, 200, 'Chưa cập nhật', 9),
('Thủy Xa Quán', 'Yukito Ayatsuji', 'NXB Hội Nhà Văn', '2010-05-15 00:00:00', 'ThuyXaQuan.jpg', 20, 20, 200, 'Chưa cập nhật', 9),
('Sông Ngầm', 'Lôi Mễ', 'NXB Văn Học', '2010-05-15 00:00:00', 'SongNgam.jpg', 20, 20, 200, 'Chưa cập nhật', 9),
('Nghĩ Đơn Giản, Sống Đơn Thuần', 'Tolly Burkan', 'NXB Thế Giới', '2010-05-15 00:00:00', 'NghiDonGianSongDonThuan.jpg', 20, 20, 200, 'Chưa cập nhật', 10),
('Tuổi Trẻ Không Trì Hoãn', 'Thần Cách', 'NXB Thế Giới', '2010-05-15 00:00:00', 'TuoiTreKhongTriHoan.jpg', 20, 20, 200, 'Chưa cập nhật', 10),
('Lật Đổ Ông Vua Trì Hoãn', 'Oopsy', 'NXB Thế Giới', '2010-05-15 00:00:00', 'LatDoOngVuaTriHoan.jpg', 20, 20, 200, 'Chưa cập nhật', 10),
('Harvard Bốn Rưỡi Sáng', 'Xiu-ying Wei', 'NXB Thế Giới', '2010-05-15 00:00:00', 'HarvardBonRuoiSang.jpg', 20, 20, 200, 'Chưa cập nhật', 11),
('Phất Tay Lung Lay Thế Giới', 'Oopsy', 'NXB Thế Giới', '2010-05-15 00:00:00', 'PhatTayLungLayTheGioi.jpg', 20, 20, 200, 'Chưa cập nhật', 11),
('Cứ Đi Để Lối Thành Đường', 'Phoenix Ho', 'NXB Thế Giới', '2010-05-15 00:00:00', 'CuDiDeLoiThanhDuong.jpg', 20, 20, 200, 'Chưa cập nhật', 11),
('Tuổi Trẻ Đáng Giá Bao Nhiêu', 'Rosie Nguyễn', 'NXB Hội Nhà Văn', '2010-05-15 00:00:00', 'TuoiTreDangGiaBaoNhieu.jpg', 20, 20, 200, 'Chưa cập nhật', 12),
('Ngày Xưa Có Một Con Bò', 'Camilo Cruz', 'NXB Trẻ', '2010-05-15 00:00:00', 'NgayXuaCoMotConBo.jpg', 20, 20, 200, 'Chưa cập nhật', 12),
('Hiểu Về Trái Tim', 'Minh Niệm', 'NXB Tổng Hợp TP.HCM', '2010-05-15 00:00:00', 'HieuVeTraiTim.jpg', 20, 20, 200, 'Chưa cập nhật', 12),
('Tự Học VB.NET Và SQL SERVER 2008', 'KS. Hoàng Anh Quang', 'NXB Hồng Đức', '2010-05-15 00:00:00', 'TuHocVBNET.jpg', 20, 20, 200, 'Chưa cập nhật', 13),
('Bài Tập Thực Hành Arduino - Lập Trình Điều Khiển Với Arduino', 'Phạm Quang Huy - Lê Cảnh Trung', 'NXB Khoa Học Và Kỹ Thuật', '2010-05-15 00:00:00', 'LapTrinhDieuKhienVoiArduino.jpg', 20, 20, 200, 'Chưa cập nhật', 13),
('Vi Điều Khiển Và Ứng Dụng Arduino Dành Cho Người Tự Học', 'Phạm Quang Huy - Nguyễn Trọng Hiếu', 'NXB Bách Khoa Hà Nội', '2010-05-15 00:00:00', 'ViDieuKhienVaUngDungArduino.jpg', 20, 20, 200, 'Chưa cập nhật', 13),
('Giáo Trình Thực Hành Microsoft Word Dùng Cho Các Phiên Bản', 'Phạm Quang Hiển - Phạm Phương Hoa', 'NXB Thanh Niên', '2010-05-15 00:00:00', 'ThucHanhMicrosoftWord.jpg', 20, 20, 200, 'Chưa cập nhật', 14),
('Tự Học Microsoft Word Dành Cho Người Mới Bắt Đầu (Kèm CD)', 'VL - Comp', 'NXB Hồng Đức', '2010-05-15 00:00:00', 'TuHocMicrosoftWord.jpg', 20, 20, 200, 'Chưa cập nhật', 14),
('Thực Hành Microsoft Word - Excel - Powerpoint 2016 Bằng Các Tuyệt Chiêu (Kèm CD)', 'Nhiều Tác Giả', 'NXB Đồng Nai', '2010-05-15 00:00:00', 'ThucHanhMSOffice.jpg', 20, 20, 200, 'Chưa cập nhật', 14),
('Tự Học Thiết Kế Đồ Họa Trên Photoshop CS6', 'Nguyễn Đức Hiếu (biên soạn)', 'NXB Hồng Đức', '2010-05-15 00:00:00', 'TuHocThietKeDoHoa.jpg', 20, 20, 200, 'Chưa cập nhật', 15),
('Thực Hành Autocad 2017 Cơ Bản Và Nâng Cao (Kèm CD)', 'VL - Comp', 'NXB Hồng Đức', '2010-05-15 00:00:00', 'ThucHanhAutocad.jpg', 20, 20, 200, 'Chưa cập nhật', 15),
('Autocad Structural Detailing Dành Cho Người Bắt Đầu (Kết Cấu Thép)', 'Phạm Quang Hiển - Lê Thanh Nhật', 'NXB Khoa Học Và Kỹ Thuật', '2010-05-15 00:00:00', 'AutocadStructuralDetailing.jpg', 20, 20, 200, 'Chưa cập nhật', 15);


INSERT INTO `issuinghouse` (`IssuingHouse_Name`, `Contact`, `Address`) VALUES
('Alpha books', '01212017777', 'Chưa cập nhật'),
('Văn Lang', '01212017776', 'Chưa cập nhật'),
('Minh Tâm', '01212017775', 'Chưa cập nhật'),
('NXB Phụ Nữ', '01212017774', 'Chưa cập nhật'),
('Thái Hà', '01212017773', 'Chưa cập nhật');

INSERT INTO `account` (`UserName`, `Account_Password`, `Account_Type`, `Account_Status`) VALUES
('duynhat', '123456', 1, 1),
('thanhtruc', '123456', 1, 1),
('chithien', '123456', 2, 1),
('anhthu', '123456', 2, 1),
('queanh', '123456', 2, 1),
('kimyen', '123456', 2, 1),
('vantrung', '123456', 2, 1),
('a', '123456', 2, 1),
('b', '123456', 2, 1),
('c', '123456', 2, 1);

INSERT INTO `customer` (`Customer_Name`, `Phone`, `Email`, `Gender`, `Account_ID`) VALUES
('Nguyễn Chí Thiện', '01212014235', 'chithien@gmail.com', b'1', 3),
('Trần Thị Anh Thư', '01212259135', 'anhthu1211@gmail.com', b'0', 4),
('Võ Quế Anh', '01212019562', 'queanh2126@gmail.com', b'0', 5),
('Trần Thị Kim Yến', '01212014235', 'kimyen1124@gmail.com', b'0', 6),
('Nguyễn Văn Trung', '01212014235', 'vantrung0012@gmail.com', b'1', 7),
('Nguyễn A', '01212014235', 'a@gmail.com', b'1', 8),
('Trần B', '01212259135', 'b@gmail.com', b'0', 9),
('Võ C', '01212019562', 'c@gmail.com', b'0', 10);