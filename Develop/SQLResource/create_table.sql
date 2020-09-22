-- (1) 專案專用資料庫
CREATE database wematch
GO

-- (2)
use wematch
GO

-- (3)
create table Member(
memberId int not null primary key identity(1,1),
memberAccount varchar(50) not null unique,
memberPwd varchar(50) not null,
memberStatus int DEFAULT 1,
memberName nvarchar(20),
memberEmail varchar(50),
birthdayDate date,
gender varchar(20),
nickname nvarchar(20),
starSign nvarchar(20),
city nvarchar(20),
bloodType nvarchar(20),
hobbies nvarchar(MAX),
picture_1 varbinary(MAX),
picture_2 varbinary(MAX),
selfIntro nvarchar(MAX)
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

-- (6)
create  Table Booking(
bookingId int not null identity,
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

-- (7) 教練
create Table Coach(
coachId int primary key not null identity(1,1),
coachPic varbinary(max),
coachName nvarchar(50) not null,
coachNickname nvarchar(50) not null,
coachAge int not null,
courseName nvarchar(50) not null,
courseType nvarchar(50) not null,
license nvarchar(50) not null,
)
GO
