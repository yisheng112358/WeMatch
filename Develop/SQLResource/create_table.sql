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
productId int IDENTITY(1,1) PRIMARY KEY NOT NULL,
category nvarchar(50),
productName nvarchar(50)  NOT NULL,
price money DEFAULT 0,
stock int NOT NULL DEFAULT 0,
productDescription nvarchar(MAX),
thumbnail image,
detailImg image,
addTime DATETIME DEFAULT CURRENT_TIMESTAMP,
)
GO

-- (5)影片教學 Fitness Videoflix
CREATE table Video(
videoId int primary key not null identity(1,1),
videoName nvarchar(50) not null,
videoCategory nvarchar(50) not null,       --背部.胸部.腿部
videoLink varchar(max) not null,           --Youtube wibsite
videoDesc nvarchar(max),                   --Description
)
GO


create  Table Booking(
bookingiId int not null identity,
bookingDate nvarchar(max) not null,
bookingTime nvarchar(max) not null,
ept1 nvarchar(max),
ept2 nvarchar(max),
ept3 nvarchar(max),
ept4 nvarchar(max),
ept5 nvarchar(max),
ept6 nvarchar(max),
ept7 nvarchar(max),
ept8 nvarchar(max),
ept9 nvarchar(max),
ept10 nvarchar(max),
ept11 nvarchar(max),
ept12 nvarchar(max),
)

GO