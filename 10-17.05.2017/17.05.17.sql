--17.05.2017--Tasks---

--Creating the database--
CREATE DATABASE FurnitureCompany
GO

--Using the database--
USE FurnitureCompany
GO

--Customer table creation--
CREATE TABLE CUSTOMER (
	Customer_Id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
	Customer_Name NVARCHAR(50) NOT NULL,
	Customer_Address NVARCHAR(60) NOT NULL,
	Customer_City NVARCHAR(50) NOT NULL,
	City_Code INT NOT NULL
);
GO

--Product table creation--
CREATE TABLE PRODUCT (
	Product_Id INT NOT NULL PRIMARY KEY,
	Product_Description NVARCHAR(50) NOT NULL,
	Product_Finish NVARCHAR(40) NOT NULL 
		CHECK(Product_Finish IN('череша', 'естествен ясен', 'бял ясен', 'червен дъб', 'естествен дъб', 'орех')),
	Standart_Price DECIMAL(19,4) NOT NULL,
	Product_Line_Id INT NOT NULL
);
GO

--Order table creation--
CREATE TABLE ORDER_T (
	Order_Id INT NOT NULL PRIMARY KEY,
	Order_Date DATETIME NOT NULL,
	Customer_Id INT	FOREIGN KEY REFERENCES CUSTOMER(Customer_Id)
);
GO

--Order line creation--
CREATE TABLE ORDER_LINE (
	Order_Id INT NOT NULL FOREIGN KEY REFERENCES ORDER_T(Order_Id),
	Product_Id INT NOT NULL FOREIGN KEY REFERENCES PRODUCT(Product_Id),
	Order_Quantity DECIMAL(19,4) NOT NULL 
);
GO

--Add sample data--
insert into CUSTOMER values
('Иван Петров', 'ул. Лавеле 8', 'София', '1000'),
('Камелия Янева', 'ул. Иван Шишман 3', 'Бургас', '8000'),
('Васил Димитров', 'ул. Абаджийска 87', 'Пловдив', '4000'),
('Ани Милева', 'бул. Владислав Варненчик 56', 'Варна','9000');insert into PRODUCT values
(1000, 'офис бюро', 'череша', 195, 10),
(1001, 'директорско бюро', 'червен дъб', 250, 10),
(2000, 'офис стол', 'череша', 75, 20),
(2001, 'директорски стол', 'естествен дъб', 129, 20),
(3000, 'етажерка за книги', 'естествен ясен', 85, 30),
(4000, 'настолна лампа', 'естествен ясен', 35, 40);

insert into ORDER_T values
(100, '2013-01-05', 1),
(101, '2013-12-07', 2),
(102, '2014-10-03', 3),
(103, '2014-10-08', 2),
(104, '2015-10-05', 1),
(105, '2015-10-05', 4),
(106, '2015-10-06', 2),
(107, '2016-01-06', 1);insert into ORDER_LINE values
(100, 4000, 1),
(101, 1000, 2),
(101, 2000, 2),
(102, 3000, 1),
(102, 2000, 1),
(106, 4000, 1),
(103, 4000, 1),
(104, 4000, 1),
(105, 4000, 1),
(107, 4000, 1);--Test inserted data--SELECT * FROM CUSTOMERGOSELECT * FROM PRODUCTGOSELECT * FROM ORDER_TGOSELECT * FROM ORDER_LINEGO--Task2--SELECT p.Product_Id,	   COUNT(*) AS 'Ordered total times',	   SUM(Order_Quantity) AS 'Total Quantity'FROM PRODUCT pINNER JOIN ORDER_LINE ol ON p.Product_Id = ol.Product_IdGROUP BY p.Product_Id--Task3--SELECT p.Product_Id, p.Product_Description, 	   COUNT(*) AS 'Ordered total times',	   SUM(Order_Quantity) AS 'Total Quantity'FROM PRODUCT pLEFT OUTER JOIN ORDER_LINE ol ON p.Product_Id = ol.Product_IdGROUP BY p.Product_Id, p.Product_Description--Task4--SELECT c.Customer_Name, 	   SUM(p.Standart_Price) AS 'Total price of orders'FROM CUSTOMER cINNER JOIN ORDER_T oON c.Customer_Id = o.Customer_IdINNER JOIN ORDER_LINE olON o.Order_Id = ol.Order_IdINNER JOIN PRODUCT pON ol.Product_Id = p.Product_IdGROUP BY c.Customer_Name--PC tasks--USE pcGO--Task 5----Not sure how exactly these two work, but they give the right result, so...--With join--SELECT DISTINCT p.maker FROM product pINNER JOIN product p1ON p.maker = p1.makerWHERE p.type = 'Laptop'AND p1.type = 'Printer'--With subquery--SELECT DISTINCT p.makerFROM product pWHERE p.type = 'Printer'AND EXISTS (	SELECT maker	FROM product	WHERE type = 'Laptop' 	AND p.maker = maker);--Task 6--UPDATE printer SET price=price-(0.05*price)WHERE EXISTS (	SELECT p.maker, AVG(price) AS 'Average Price'	FROM printer pr	INNER JOIN product p	ON pr.model = p.model	GROUP BY p.maker	--HAVING AVG(price) > 800	--The above line checks if the average price is bigger than 800, but in this case the avg of all the makers is not even close to this,	--so, I uncommented it to check how the update statement works.  );--Task 7--SELECT hd, MIN(price) AS 'Min price for this size hd'FROM pcWHERE hd >= 10 AND hd <= 30GROUP BY hd--Ships tasks----Task 8--