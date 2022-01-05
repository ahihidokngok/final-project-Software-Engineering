create database quanlykho
go

use quanlykho
go

create table Unit
(
	Id int identity(1,1) primary key,
	DisplayName nvarchar(100)
)

create table Suplier
(
	Id int identity(1,1) primary key,
	Displayname nvarchar(100),
	Address nvarchar(100),
	Phone int,
	Email nvarchar(100),
	ContractDate DateTime
)

create table Customer
(
	Id int identity(1,1) primary key,
	Displayname nvarchar(100),
	Address nvarchar(100),
	Phone int,
	Email nvarchar(100),
	ContractDate DateTime
)

create table Object
(
	Id nvarchar(100) primary key,
	Displayname nvarchar(50),
	IdUnit int not null,
	IdSuplier int not null,

	foreign key(IdUnit) references Unit(Id),
	foreign key(IdSuplier) references Suplier(Id),
)

create table UserRole
(
	Id int identity(1,1) primary key,
	DisplayName nvarchar(100)
)

create table Users
(
	Id int identity(1,1) primary key,
	Displayname nvarchar(100),
	UserName nvarchar(100),
	Password nvarchar(50),
	IdRole int not null

	foreign key (IdRole) references UserRole(Id)
)

create table Input
(
	Id nvarchar(100) primary key,
	DateInput DateTime
)

create table InputInfo
(
	Id nvarchar(100) primary key,
	IdObject nvarchar(100) not null,
	IdInput nvarchar(100) not null,
	Count int,
	InputPrice float default 0,
	OutputPrice float default 0,

	foreign key (IdObject) references Object(Id),
	foreign key (IdInput) references Input(Id)
)

create table Output
(
	Id nvarchar(100) primary key,
	DateOutput DateTime
)

create table OutputInfo
(
	Id nvarchar(100) primary key,
	IdObject nvarchar(100) not null,
	IdoutputInfo nvarchar(100) not null,
	IdCustomer int not null,
	Count int,

	foreign key (IdObject) references Object(Id),
	foreign key (IdoutputInfo) references InputInfo(Id),
	foreign key (IdCustomer) references Customer(Id),
	foreign key (Id) references Output(Id)
)

INSERT INTO Users(DisplayName, Username, Password, IdRole) VALUES(N'Admin', N'admin', N'123', 1)
INSERT INTO Users(DisplayName, Username, Password, IdRole) VALUES(N'Nhân viên', N'staff', N'321', 2)

INSERT INTO UserRole(DisplayName) values(N'Admin')
INSERT INTO UserRole(DisplayName) values(N'Nhân viên')