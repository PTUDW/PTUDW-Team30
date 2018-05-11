Use BookStoreDB;

-- Category
Insert into Category(Category_Name) values ('Foreign Language');

-- Kind
Insert into Kind(Kind_Name, Description, Category_ID) values ('English','The most popular language in the world', 1);
Insert into Kind(Kind_Name, Description, Category_ID) values ('Japanese','The language of Japan', 1);
Insert into Kind(Kind_Name, Description, Category_ID) values ('French','The language of France', 1);

-- Book

-- IssuingHouse

-- IssuanceDetail

-- Account

-- Customer

-- Orders

-- OrderDetail

