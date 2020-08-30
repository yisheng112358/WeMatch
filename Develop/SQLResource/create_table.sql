-- (1) 專案專用資料庫
CREATE database wematch
GO

-- (2)
use wematch
GO

-- (3)
CREATE table members (
member_id int Identity(1,1) Primary Key Not NULL,
member_account varchar(50) Not NULL,	-- 登入資訊
member_pwd varchar(50) Not NULL,	-- 登入資訊
member_name nvarchar(20) Not NULL,
member_email varchar(50) Not NULL,
nickname nvarchar(20),
gender nvarchar(20) Not NULL,	-- M、F和O(Others)
city nvarchar(20) Not NULL,
birthday date Not NULL,
star_sign nvarchar(20),
blood_type varchar(20),
hobbies nvarchar(MAX),
picture_1 image,
picture_2 image,
member_status varchar(20) Not NULL,
self_intro nvarchar(MAX),
)
GO

-- (4)
CREATE table Product(
ProductId int IDENTITY(1,1) PRIMARY KEY NOT NULL,
Category nvarchar(50),
ProductName nvarchar(50)  NOT NULL,
Price money DEFAULT 0,
Stock int NOT NULL DEFAULT 0,
ProductDescription nvarchar(MAX),
Thumbnail image,
DetailImg image,
AddTime DATETIME DEFAULT CURRENT_TIMESTAMP,
)
GO