-- tao csdl
create database if not exists testingsystem;
USE testingsystem;

-- tao bang 1 Department
create table Department(
DepartmentID int not null primary key auto_increment,
DepartmentName varchar(20) not null

);

-- tao bang 2 Position
create table Pposition(
PositionID int not null primary key auto_increment,
PositionName varchar(30)
);

-- tao bang 3 Account
create table Aaccount(
AccountID int not null primary key auto_increment,
Email varchar(30),
Username varchar(20) not null,
Fullname varchar(30) not null,
DepartmentID int not null,
PositionID int not null,
CreateDate date,
constraint fk1 foreign key(DepartmentID) references Department(DepartmentID) on delete cascade,
constraint fk2 foreign key(PositionID) references Pposition(PositionID) on delete cascade
);

-- tao bang 4 Group
create table Ggroup(
GroupID int not null primary key auto_increment,
GroupName varchar(20) not null,
CreatorID int not null,
CreateDate date not null
);

-- tao bang 5 GroupAccount
create table GroupAccount(
GroupID int not null,
AccountID int not null,
JoinDate date,
constraint fk_group1 foreign key(GroupID) references Ggroup(GroupID) on delete cascade,
constraint fk_group2 foreign key(AccountID) references Aaccount(AccountID) on delete cascade
);

-- tao bang 6 TypeQuyestion
create table TypeQuestion(
TypeID int not null primary key auto_increment,
TypeName varchar(30)
);

-- tao bang 7 CategoryQuestion
create table CategoryQuestion(
CategoryID int not null primary key auto_increment,
CategoryName varchar(20)
);

-- tao bang 8 Question
create table Question(
QuestionID int not null primary key auto_increment,
Content varchar(20) not null,
CategoryID int not null,
TypeID int not null,
CreatorID int not null,
CreateDate date,
constraint fk3 foreign key(CategoryID) references CategoryQuestion(CategoryID) on delete cascade,
constraint fk4 foreign key(TypeID) references TypeQuestion(TypeID) on delete cascade
);

-- tao bang 9 Answer
create table Answer(
AnswerID int not null primary key auto_increment,
Content varchar(20),
QuestionID int not null,
isCorrect varchar(10),
constraint fk5 foreign key(QuestionID) references Question(QuestionID) on delete cascade
);

-- tao bang 10 Exam
create table Exam(
ExamID int not null primary key auto_increment,
Code int not null,
Title int,
CategoryID int not null,
Duration int,
CreatorID int not null,
CreateDate date,
constraint fk6 foreign key(CategoryID) references CategoryQuestion(CategoryID) on delete cascade
);
alter table Exam modify Title varchar(30);

-- tao bang 11 ExamQuestion
create table ExamQuestion(
ExamID int not null,
QuestionID int not null,
constraint fk7 foreign key(ExamID) references Exam(ExamID) on delete cascade,
constraint fk8 foreign key(QuestionID) references Question(QuestionID) on delete cascade
);


-- indert du lieu bang 1 
insert into Department(DepartmentName) values('Marketing'),
											('Bao ve'),
                                            ('Sale'),
                                            ('Nhan su'),
                                            ('Ky thuat'),
                                            ('Tai chinh');
delete from Department
where DepartmentID=2;
select *from Department;

-- insert du lieu bang 2
insert into Pposition(PositionName) values('Giam Doc'),
											('Nhan Vien'),
                                            ('Thu Ky'),
                                            ('Truong Phong'),
                                            ('Bao Ve');
select *from Pposition;


-- insert du lieu bang 3
insert into Aaccount(Email,Username,Fullname,DepartmentID,PositionID,CreateDate) values
('bin@gmail.com','Bin','Bin',3,2,'2021-1-1'),
('jack@gmail.com','jack','Tran Phuong Tuan',4,1,'2021-1-1'),
('mtp@gmail.com','MTP','Son Tung',5,5,'2021-1-1'),
('cr7@gmail.com','Ronaldo','Cristiano Ronaldo',1,1,'2021-1-1'),
('m10@gmail.com','Messi','Leonel Messi',4,4,'2021-1-1');
select*from Aaccount;


-- insert du lieu bang 4
insert into Ggroup(GroupName,CreatorID,CreateDate) values
('Group1',1,'2021-2-2'),
('Group2',2,'2021-2-2'),
('Group3',3,'2021-2-2'),
('Group4',4,'2021-2-2'),
('Group5',5,'2021-2-2');
select*from Ggroup;

-- insert du lieu bang 5
insert into GroupAccount(GroupID,AccountID,JoinDate) values
(1,1,'2021-1-1'),
(2,5,'2021-1-1'),
(3,3,'2021-1-1'),
(4,4,'2021-1-1'),
(1,5,'2021-1-1');
select *from GroupAccount;

-- insert du lieu bang 6
insert into TypeQuestion(TypeName) values
('Essay'),
('Yes or No'),
('Open Question'),
('Multiple-Choice'),
('I dont know');
select *from TypeQuestion;


-- insert du lieu bang 7
insert into CategoryQuestion(CategoryName) values
('Java'),
('SQL'),
('Python'),
('C#'),
('.NET');
select *from CategoryQuestion;

-- insert du lieu bang 8
insert into Question(Content,CategoryID,TypeID,CreatorID,CreateDate) values
('Qua cam mau gi ?',1,1,1,'2021-2-2'),
('1 + 1 = ?',1,4,1,'2021-2-2'),
('1 goi my tom gia ?',4,4,2,'2021-2-2'),
('Trai Dat hinh gi ?',3,3,3,'2021-2-2'),
('1 > 5 ?',5,5,4,'2021-2-2');
select*from Question;

-- insert du lieu bang 
insert into Answer(Content,QuestionID,isCorrect) values
('mau cam',6,'Dung'),
('2',7,'Dung'),
('4 nghin',8,'Dung'),
('Tron',9,'Sai'),
('Dung',10,'Sai');
select*from Answer;

-- insert du lieu bang 10
insert into Exam(Code,Title,CategoryID,Duration,CreatorID,CreateDate) values
(1,'bai thi 1',1,10,1,'2021-1-1'),
(2,'bai thi 2',2, 10,2,'2021-1-1'),
(3,'bai thi 3',3,10,3,'2021-1-1'),
(4,'bai thi 4',4,10,4,'2021-1-1'),
(5,'bai thi 5',5,10,5,'2021-1-1');
select*from Exam;

-- insert du lieu bang 11
insert into ExamQuestion(ExamID,QuestionID) values
(1,6),
(2,7),
(3,8),
(4,9),
(5,10);
select *from ExamQuestion;