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