-- (1) 專案專用資料庫
CREATE database wematch
GO

-- (2)
use wematch
GO

-- (3)
CREATE table Member(
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