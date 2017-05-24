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
		CHECK(Product_Finish IN('������', '��������� ����', '��� ����', '������ ���', '��������� ���', '����')),
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
('���� ������', '��. ������ 8', '�����', '1000'),
('������� �����', '��. ���� ������ 3', '������', '8000'),
('����� ��������', '��. ���������� 87', '�������', '4000'),
('��� ������', '���. ��������� ��������� 56', '�����','9000');
(1000, '���� ����', '������', 195, 10),
(1001, '����������� ����', '������ ���', 250, 10),
(2000, '���� ����', '������', 75, 20),
(2001, '����������� ����', '��������� ���', 129, 20),
(3000, '�������� �� �����', '��������� ����', 85, 30),
(4000, '�������� �����', '��������� ����', 35, 40);

insert into ORDER_T values
(100, '2013-01-05', 1),
(101, '2013-12-07', 2),
(102, '2014-10-03', 3),
(103, '2014-10-08', 2),
(104, '2015-10-05', 1),
(105, '2015-10-05', 4),
(106, '2015-10-06', 2),
(107, '2016-01-06', 1);
(100, 4000, 1),
(101, 1000, 2),
(101, 2000, 2),
(102, 3000, 1),
(102, 2000, 1),
(106, 4000, 1),
(103, 4000, 1),
(104, 4000, 1),
(105, 4000, 1),
(107, 4000, 1);