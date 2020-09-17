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
memberStatus int,
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

-- (4) 新增管理員帳號
insert into Member(memberAccount, memberPwd, memberStatus) values ('nana99156', 'Do!ng123', 2)

--(5)
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