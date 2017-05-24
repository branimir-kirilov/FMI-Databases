--Movies tasks--
USE movies
GO

--Task 1--
INSERT INTO MOVIESTAR (NAME, BIRTHDATE)
VALUES ('Nicole Kidman', CAST(N'1967-06-20' AS DateTime))
GO

--Task 2--
DELETE FROM MOVIEEXEC
WHERE NETWORTH > 30000000
GO

--Task 3--
DELETE FROM MOVIESTAR
WHERE ADDRESS IS NULL
GO

--PC tasks--
USE pc
GO

--Task 4--
INSERT INTO pc (model, speed, ram, hd, cd, price, code)
VALUES ('1100', 2400, 2, 500, '52x', 299, 12)
GO

INSERT INTO product (maker, model, type)
VALUES ('C', '1100', 'PC')
GO

--Task 5--
DELETE FROM pc
WHERE model = '1100'
GO

--Task 6--
DELETE l
FROM laptop l
INNER JOIN product p
ON l.model = p.model
WHERE p.maker NOT IN 
(
	SELECT maker
	FROM product
	WHERE type = 'printer'
	GROUP BY maker	
) 
GO

--Task 7--
UPDATE product
SET maker = 'A'
WHERE maker = 'B'
GO

--Task 8--
UPDATE pc
SET
    price = price / 2,
	hd = hd + 20
GO

--Task 9--
UPDATE l
SET l.screen = l.screen + 1
FROM laptop l
INNER JOIN product p
ON l.model = p.model
WHERE p.maker = 'B'
GO
--Well we no longer have maker B..--

--Ships tasks--
USE ships
GO

--Task 10--
INSERT INTO SHIPS (NAME, CLASS, LAUNCHED)
VALUES ('Nelson', 'Nelson', 1927),
       ('Rodney', 'Nelson', 1927)
GO

INSERT INTO CLASSES (CLASS, TYPE, COUNTRY, NUMGUNS, BORE, DISPLACEMENT)
VALUES ('Nelson', 'bb', 'Gt.Britain', 9, 16, 34000)
GO

--Task 11--
DELETE s
FROM SHIPS s
INNER JOIN OUTCOMES o
ON s.NAME = o.SHIP
WHERE o.RESULT = 'sunk'
GO

--Task 12--
UPDATE CLASSES
SET BORE = BORE * 2.5,
	DISPLACEMENT = DISPLACEMENT * 1.1
GO

SELECT * 
FROM CLASSES
GO

