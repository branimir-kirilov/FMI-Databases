-----CREATING THE DATABASE-----
CREATE DATABASE Flights;
GO

-----USE THE DATABASE-----
USE Flights
GO

CREATE TABLE Airline (
	Code CHAR(2) NOT NULL,
	Name NVARCHAR(100) NOT NULL,
	Country NVARCHAR(100) NOT NULL,
	PRIMARY KEY (Code),
);
GO

CREATE TABLE Airplane(
	Code CHAR(3) NOT NULL,
	Type NVARCHAR(20) NOT NULL,
	Seats INT,
	Year DATETIME,
	PRIMARY KEY (Code)
);
GO

CREATE TABLE Airport (
	Code CHAR(3) NOT NULL,
	Name NVARCHAR(100) NOT NULL,
	Country NVARCHAR(100) NOT NULL,
	City NVARCHAR(100) NOT NULL,
	PRIMARY KEY (Code)
);
GO

CREATE TABLE Flight (
	FNumber NVARCHAR(6) NOT NULL,
	Airline_Operator CHAR(2) NOT NULL,
	Dep_Airport CHAR(3) NOT NULL,
	Arr_Airport CHAR(3) NOT NULL,
	Flight_Time TIME NOT NULL,
	Flight_Duration INT,
	Airplane CHAR(3) NOT NULL,
	PRIMARY KEY (FNumber),
	FOREIGN KEY (Airline_Operator) REFERENCES Airline (Code),
	FOREIGN KEY (Dep_Airport) REFERENCES Airport (Code),
	FOREIGN KEY (Arr_Airport) REFERENCES Airport (Code),
	FOREIGN KEY (Airplane) REFERENCES Airplane (Code)
);
GO

CREATE TABLE Customer (
	Id INT IDENTITY NOT NULL,
	FName NVARCHAR(50) NOT NULL,
	LName NVARCHAR(50) NOT NULL,
	Email NVARCHAR (50) NOT NULL,
	PRIMARY KEY (Id)
);
GO

CREATE TABLE Agency (
	Name NVARCHAR(50),
	Country NVARCHAR(100),
	City NVARCHAR(100),
	Phone NVARCHAR(15),
	PRIMARY KEY (Name)
);
GO

CREATE TABLE Booking (
	Code NVARCHAR(6) NOT NULL,
	Agency NVARCHAR(50) NOT NULL,
	Airline_Code CHAR(2) NOT NULL,
	Flight_Number NVARCHAR(6) NOT NULL,
	Customer_Id INT NOT NULL,
	Booking_Date DATETIME NOT NULL,
	Flight_Date  DATETIME NOT NULL,
	Price DECIMAL(9, 2) NOT NULL,
	Status INT NOT NULL,
	PRIMARY KEY (Code),
	FOREIGN KEY (Agency) REFERENCES Agency (Name),
	FOREIGN KEY (Flight_Number) REFERENCES Flight (FNumber),
	FOREIGN KEY (Customer_Id) REFERENCES Customer (Id)
);
GO

-----Add constraints-----

ALTER TABLE Airline
ADD UNIQUE (Name)

ALTER TABLE Airport
ADD UNIQUE (Name, Country)

ALTER TABLE Airplane
ADD CHECK (Seats>=0)

ALTER TABLE Booking
ADD CHECK (Flight_Date >= Booking_Date)

ALTER TABLE Customer
ADD CHECK (Email LIKE '%@%.%')

ALTER TABLE Booking 
ADD CHECK (Status = 1 OR Status = 0)

----------Inserting test data-----------

INSERT INTO AIRLINE
VALUES ('AZ', 'Alitalia', 'Italy'),
('BA', 'British Airways', 'United Kingdom'),
('LH', 'Lufthansa', 'Germany'),
('SR', 'Swissair', 'Switzerland'),
('FB', 'Bulgaria Air', 'Bulgaria'),
('AF', 'Air France', 'France'),
('TK', 'Turkish Airlines', 'Turkey'),
('AA', 'American Airlines', 'United States');

INSERT INTO AIRPORT
VALUES ('SOF', 'Sofia International', 'Bulgaria', 'Sofia'),
('CDG', 'Charles De Gaulle', 'France', 'Paris'),
('ORY', 'Orly', 'France', 'Paris'),
('LBG', 'Le Bourget', 'France', 'Paris'),
('JFK', 'John F Kennedy International', 'United States', 'New York'),
('ORD', 'Chicago O''Hare International', 'United States', 'Chicago'),
('FCO', 'Leonardo da Vinci International', 'Italy', 'Rome'),
('LHR', 'London Heathrow', 'United Kingdom', 'London');

INSERT INTO AIRPLANE
VALUES ('319', 'Airbus A319', 150, 1993),
('320', 'Airbus A320', 280, 1984),
('321', 'Airbus A321', 150, 1989),
('100', 'Fokker 100', 80, 1991),
('738', 'Boeing 737-800', 90, 1997),
('735', 'Boeing 737-800', 90, 1995);

INSERT INTO FLIGHT
VALUES ('FB1363', 'AZ', 'SOF', 'ORY', '12:45', 100, '738'),
('FB1364', 'AZ', 'CDG', 'SOF', '10:00', 120, '321'),
('SU2060', 'AZ', 'LBG', 'SOF', '11:10', 110, '738'),
('SU2061', 'TK', 'SOF', 'JFK', '13:00', 110, '320'),
('FB363', 'FB', 'SOF', 'ORD', '15:10', 110, '738'),
('FB364', 'FB', 'LHR', 'SOF', '21:05', 120, '738');

INSERT INTO CUSTOMER
VALUES ('Petar', 'Milenov', 'petter@mail.com'),
('Dimitar', 'Petrov', 'petrov@mail.com'),
('Ivan', 'Ivanov', 'ivanov@mail.com'),
('Petar', 'Slavov', 'slavov@mail.com'),
('Bogdan', 'Bobov', 'bobov@mail.com');

INSERT INTO AGENCY
VALUES ('Travel One', 'Bulgaria', 'Sofia', '0783482233'),
('Travel Two', 'Bulgaria', 'Plovdiv', '02882234'),
('Travel Tour', 'Bulgaria', 'Sofia', NULL),
('Aerotravel', 'Bulgaria', 'Varna', '02884233');

INSERT INTO Booking
VALUES ('YN298P', 'Travel One', 'FB', 'FB1363', 1, '2013-11-18', '2013-12-25', 300, 0),
('YA298P', 'Travel Two', 'FB', 'FB1364', 2, '2013-12-18', '2013-12-25', 300, 1),
('YB298P', 'Travel Tour', 'FB', 'SU2060', 3, '2014-01-18', '2014-02-25', 400, 0),
('YC298P', 'Travel One', 'FB', 'SU2061', 4, '2014-11-11', '2014-11-25', 350, 0),
('YD298P', 'Travel Tour', 'FB', 'FB363', 1, '2013-11-03', '2013-12-20', 250, 1),
('YE298P', 'Aerotravel', 'FB', 'FB364', 2, '2013-11-07', '2013-12-21', 150, 0);

------------CHECK DATA----------------

SELECT * FROM Booking
SELECT * FROM Agency
SELECT * FROM Customer
SELECT * FROM Flight
SELECT * FROM Airplane
SELECT * FROM Airport
SELECT * FROM Airline
 