Create Database BookStoreDB;

Use BookStoreDB;

Create Table Category
(
	Category_ID int primary key AUTO_INCREMENT,
    Category_Name nvarchar(50) UNIQUE
);

Create Table Kind
(
	Kind_ID int primary key AUTO_INCREMENT,
    Kind_Name nvarchar(50) UNIQUE,
    Description nvarchar(500),
    Category_ID int
);

Create Table Book
(
	Book_ID int primary key AUTO_INCREMENT,
    Book_Name nvarchar(50),
    Author nvarchar(50),
    Publisher nvarchar(50),
    Publish_Date Datetime,
    Image nvarchar(50),
    Price int check (Book_Price > 0),
    Quantity int check (Book_Quantity >= 0),
    View_Number int check (View_Number >= 0),
    Kind_ID int
);

Create Table IssuingHouse
(
	IssuingHouse_ID int primary key AUTO_INCREMENT,
    IssuingHouse_Name nvarchar(50) UNIQUE,
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



