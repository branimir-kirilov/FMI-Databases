USE movies
GO

SELECT m.TITLE, s.NAME, s.PRESC#
FROM MOVIE m
JOIN STUDIO s
ON m.STUDIONAME = s.NAME
GO

SELECT m.TITLE, s.NAME, s.PRESC#
FROM MOVIE m
CROSS JOIN STUDIO s
GO

---Task 1---
SELECT 
	ms.NAME
FROM MOVIESTAR ms
JOIN STARSIN m
ON m.STARNAME = ms.NAME
WHERE ms.GENDER = 'M' 
AND m.MOVIETITLE = 'Terms of Endearment'
GO

--Task 2--
SELECT 
	s.STARNAME
	AS StarName
FROM MOVIE m
JOIN STARSIN s
ON m.TITLE = s.MOVIETITLE
WHERE m.STUDIONAME = 'MGM'
AND m.YEAR = 1995
GO

--Task 3--
SELECT
	 DISTINCT ex.NAME 
AS ProducerName
FROM MOVIE m
JOIN MOVIEEXEC ex
ON m.PRODUCERC# = ex.CERT#
WHERE m.STUDIONAME = 'MGM'
GO

--Task 4--
SELECT m.TITLE
FROM MOVIE m
CROSS JOIN
	(
		SELECT TITLE, LENGTH
		FROM MOVIE
		WHERE TITLE = 'Star Wars'
	) AS m1
WHERE m.LENGTH > m1.LENGTH
GO


--Task 5--
SELECT mex.NAME
FROM MOVIEEXEC mex
CROSS JOIN 
	(
	SELECT *
	FROM MOVIEEXEC
	WHERE NAME = 'Merv Griffin'
	) AS mex1
WHERE mex.NETWORTH > mex1.NETWORTH
GO
	
--Task 6--
SELECT mv.TITLE
FROM MOVIEEXEC mex
CROSS JOIN 
	(
		SELECT *
		FROM MOVIEEXEC
		WHERE NAME = 'Merv Griffin'
	) AS mex1
INNER JOIN 
	(
		SELECT *
		FROM MOVIE
	) AS mv
ON mv.PRODUCERC# = mex.CERT#
WHERE mex.NETWORTH > mex1.NETWORTH
GO

-----------------2nd section of tasks-----------------------
USE pc 
GO

--Task 1--
SELECT DISTINCT
	p.maker AS Maker,
	l.speed AS LaptopSpeed
FROM laptop l
CROSS JOIN product p
WHERE l.hd > 9
GO

--Task 2--
SELECT DISTINCT
	p.model AS Model,
	l.price AS Price,
	pc.price AS Price,
	pr.price AS Price
FROM product p
CROSS JOIN laptop l 
CROSS JOIN pc pc
CROSS JOIN printer pr
WHERE p.maker = 'B'
GO

--Task 3--
SELECT hd AS HardDiskSize
FROM pc p1
GROUP BY hd
HAVING COUNT(*) >= 2
GO

--Task 4--
SELECT p1.model, p2.model
FROM pc p1, pc p2 
WHERE p1.speed = p2.speed
AND p1.ram = p2.ram
AND p1.model < p2.model
GO   

----Task 5--
--SELECT *
--FROM pc pc
--JOIN product pr
--	ON pc.model = pr.model
--WHERE pc.speed > 400
--GROUP BY pr.model
--HAVING COUNT(*) >= 2
--GO

SELECT *
FROM product p
CROSS JOIN pc pc2
INNER JOIN pc pc 
ON pc.model = p.model
WHERE pc.code != pc2.code
AND pc.speed > 400
GO







