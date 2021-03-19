-- Exercise 1
create table TRAINEE(
TraineeID int not null primary key auto_increment,
Full_Name varchar(30) not null,
Birth_Date date not null,
Gender enum('male','female','unknown'),
ET_IQ int,
ET_Gmath int,
ET_English int,
Training_Class int,
Evaluation_Notes varchar(50)
);

-- Exercise 2
create table Ex2(
ID int not null primary key auto_increment,
Name varchar(30),
Code varchar(5),
ModifiedDate date
);

-- Exercise 3
create table Ex3(
ID int not null primary key auto_increment,
Name nvarchar(30),
BirthDate date,
Gender bit,
IsDeletedFlag bit not null
);
insert into Ex3(Name,BirthDate,Gender,IsDeletedFlag) values
('Bin','2020-1-1',1,1);
