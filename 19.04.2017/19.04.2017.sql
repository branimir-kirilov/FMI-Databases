USE pc
GO

--Task 1--
--Creating new tables--
CREATE TABLE Product123 (
	maker CHAR(4),
	model CHAR(1),
	type VARCHAR(7)
); 
GO

CREATE TABLE Printer123(
	code INT,
	model CHAR(4),
	price DECIMAL(19,2)
);
GO

--Inserting data into them--
INSERT INTO Product123
VALUES ('sony', 'A', 'laptop'),
	   ('nosy', 'D', 'printer'),
	   ('sdsa', 'C', 'pc');

INSERT INTO Printer123
VALUES (4, 'sony', 59.50),
	   (4, 'sony', 103.30),
	   (4, 'sony', 120.30);

--Adding attributes--
ALTER TABLE Printer123
ADD type VARCHAR(6),
    color CHAR(1)

--Removing attributes--
ALTER TABLE Printer123
DROP COLUMN Price

--Removing tables--
DROP TABLE Printer123

DROP TABLE Product123

--Helpers--
--SELECT * 
--FROM Product123

--SELECT *
--FROM Printer123

-----------------------------Task 2----------------------------
--Creating new database--
CREATE DATABASE Facebook
GO

USE Facebook
GO

--Creating new tables in the database--
CREATE TABLE Users(
	id INT IDENTITY NOT NULL,
	email VARCHAR(60) NOT NULL,
	password NVARCHAR(128) NOT NULL, 
	registeredAt DATETIME NOT NULL,
	PRIMARY KEY (id)
);
GO

CREATE TABLE Friends(
	userId INT,
	friendOfId INT,
	FOREIGN KEY(userId) REFERENCES Users(id),
	FOREIGN KEY(friendOfId) REFERENCES Users(id)
);
GO

CREATE TABLE Walls(
	userId INT,
	authorId INT,
	text NVARCHAR(500),
	publishedAt DATETIME,
	FOREIGN KEY (userId) REFERENCES Users(id),
	FOREIGN KEY (authorId) REFERENCES Users(id)
);
GO

CREATE TABLE Groups(
	groupId INT IDENTITY NOT NULL,
	name NVARCHAR(50) NOT NULL,
	description NVARCHAR(150) DEFAULT '',
	PRIMARY KEY (groupId)
); 
GO

CREATE TABLE GroupMemebers(
	groupId INT NOT NULL,
	userId INT NOT NULL,
	FOREIGN KEY (groupId) REFERENCES Groups(groupId),
	FOREIGN KEY (userId) REFERENCES Users(id)
);
GO

--Users--
INSERT INTO Users
VALUES ('brani@gmail.com', 'bdnshdjas2343fho3fihf3iasdasoh#$%54@3jhfofijh3#', '20120618 10:34:09 AM'),
	   ('pesho@gmail.com', 'bdnshdjas2343fho3sdwsfihf3ioh#$%54@3jhfofijh3#', '20120613 12:34:09 PM')

--Friends--
INSERT INTO Friends
VALUES (1,3),
	   (2,3)
GO

INSERT INTO Walls
VALUES (1, 3, 'This is a post on your wall. Just testing shit.', '20120613 12:34:09 PM'),
	   (1, 3, 'Wow I am such a spammer :D', '20120613 12:36:09 PM');
GO

INSERT INTO Groups
VALUES ('Rollerblading people', 'This is a group for people interested in rollerblading'),
	   ('xxX F3n0v3 nA F1k1 Xxx', '');
GO

INSERT INTO GroupMemebers
VALUES (1, 1),
       (1, 2),
	   (1, 3);
GO

----------Helpers--------------
SELECT * 
FROM Users
GO

SELECT * 
FROM Friends
GO

SELECT *
FROM Walls
GO

SELECT * 
FROM Groups
GO

SELECT * 
FROM GroupMemebers
GO
