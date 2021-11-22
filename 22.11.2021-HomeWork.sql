CREATE DATABASE HotelDB
USE HotelDB

CREATE TABLE RoomTypes(
	Id INT PRIMARY KEY IDENTITY,
	Name NVARCHAR (100),
)

CREATE TABLE Rooms(
	Id INT PRIMARY KEY IDENTITY,
	RoomNumber INT,
	MaxPerson INT,
	RoomTypes INT REFERENCES RoomTypes(Id)
)

 CREATE TABLE Customers(
	Id INT PRIMARY KEY IDENTITY,
	FullName NVARCHAR (100) NOT NULL,
	Age INT NOT NULL,
	EMail NVARCHAR (50) NOT NULL,
	MobilNumber INT NOT NULL,
	Address NVARCHAR (4000),
	City NVARCHAR (100),
	Country NVARCHAR (100)
 )

 CREATE TABLE CustomerRoom(
	Id INT PRIMARY KEY IDENTITY,
	Rooms INT REFERENCES Rooms(Id),
	Customers INT REFERENCES Customers(Id)
 )

 CREATE TABLE Payments(
	Id INT PRIMARY KEY IDENTITY,
	PaymentType NVARCHAR (100),
	Amount DECIMAL (8,2), 
	Customers INT REFERENCES Customers(Id)
 )

 CREATE TABLE Reservations(
	Id INT PRIMARY KEY IDENTITY,
	ReserNumber INT,
	Customers INT REFERENCES Customers(Id),
	Rooms INT REFERENCES Rooms(Id),
	Payments INT REFERENCES Payments(Id)
 )

 CREATE TABLE Spendings(
	Id INT PRIMARY KEY IDENTITY,
	SpendingName NVARCHAR(100),
	Customers INT REFERENCES Customers(Id),
	Rooms INT REFERENCES Rooms(Id),
	Payments INT REFERENCES Payments(Id)
 )

 CREATE TABLE Cancellations(
	Id INT PRIMARY KEY IDENTITY,
	Customers INT REFERENCES Customers(Id),
	Rooms INT REFERENCES Rooms(Id),
	Spendings INT REFERENCES Spendings(Id),
	Payments INT REFERENCES Payments(Id)
 )

 INSERT INTO RoomTypes
	VALUES ('Businnes Suite Queen'),
		   ('Businnes Suite Twin'),
		   ('Brasilia Suite Queen'),
		   ('Presidential Suite')

INSERT INTO Rooms (RoomNumber,MaxPerson)
	VALUES (1,2),
		   (2,4),
		   (3,2),
		   (4,2),
		   (5,2),
		   (6,3),
		   (7,1),
		   (8,2),
		   (9,2),
		   (10,1),
		   (3,2),
		   (3,2)

INSERT INTO Customers (FullName,Age,EMail,MobilNumber,Address,City,Country)
	VALUES ('Malika Suleymanova',25,'malika@mail.ru',5552211,'Bineqedi','Baku','Azerbaijan'),
		   ('Gulchin Isayeva',23,'g@mail.ru',1113322,'Bineqedi','Baku','Azerbaijan'),
		   ('Chinara Abbasova',22,'ch@mail.ru',4254121,'Bineqedi','Baku','Azerbaijan'),
		   ('Zeyneb Hasanova',25,'z@mail.ru',1112441,'Bineqedi','Baku','Azerbaijan'),
		   ('Laman Abbasova',25,'l@mail.ru',1124141,'Bineqedi','Baku','Azerbaijan'),
		   ('Nazrin Huseynova',22,'mn@mail.ru',4445789,'Bineqedi','Baku','Azerbaijan'),
		   ('Emine Sariyeva',23,'em@mail.ru',4144114,'Bineqedi','Baku','Azerbaijan'),
		   ('Banu Aliyev',29,'b@mail.ru',4123323,'Bineqedi','Baku','Azerbaijan'),
		   ('Samira Hasanova',20,'sh@mail.ru',4446699,'Bineqedi','Baku','Azerbaijan'),
		   ('Kamale Nabiyeva',22,'kn@mail.ru',1112211,'Bineqedi','Baku','Azerbaijan'),
		   ('Sevda Aslanova',30,'sa@mail.ru',1121212,'Bineqedi','Baku','Azerbaijan')

INSERT INTO CustomerRoom (Rooms,Customers)
	VALUES (2,5),
		   (1,2),
		   (3,1),
		   (2,6),
		   (3,5)

INSERT INTO Payments
	VALUES ('Kart',(20.1), 2),
		   ('Kart',(50.5), 3),
		   ('Kart',(35.1), 6),
		   ('Kart',(26.1), 1),
		   ('Kart',(20.1), 8),
		   ('Kart',(63.1), 3)

INSERT INTO Reservations
	VALUES (1,2,1,3),
		   (3,2,1,1),
		   (1,1,1,4),
		   (3,2,1,2),
		   (1,3,1,1),
		   (2,1,1,2),
		   (1,2,1,3)

INSERT INTO Spendings
	VALUES ('Nahar',2,1,2),
		   ('Ichgi',1,3,4),
		   ('Ichgi',3,3,1),
		   ('Ichgi',2,1,2)

INSERT INTO Cancellations
	VALUES (1,2,3,1),
		   (2,1,1,1),
		   (1,1,3,1),
		   (3,1,1,1),
		   (1,2,1,1)


