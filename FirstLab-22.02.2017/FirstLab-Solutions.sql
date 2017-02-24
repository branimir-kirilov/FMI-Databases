/*Task from 22.02.2017*/
USE movies
GO

--Task One
SELECT ADDRESS
FROM STUDIO
WHERE NAME = 'MGM'
GO

--Task Two
SELECT BIRTHDATE
FROM MOVIESTAR
WHERE NAME = 'Sandra Bullock'
GO

--Task Three
SELECT *
FROM STARSIN
WHERE MOVIEYEAR = 1980 
AND MOVIETITLE LIKE '%Empire%'
GO

--Task Four
SELECT NAME
FROM MOVIEEXEC
WHERE NETWORTH > 10000000
GO

--Task Five
SELECT * 
FROM MOVIESTAR
WHERE GENDER = 'M' 
AND ADDRESS = 'Prefect Rd.'
GO

--------------------------------------------------
/*Using pc Database*/
USE pc
GO

--Task One
SELECT speed AS Mhz,
       hd AS GB 
FROM pc
WHERE price < 1200
GO

--Task Two
SELECT 
DISTINCT maker AS UniqueProducers
FROM product
GO

--Task Three
SELECT 
	code AS Number,
	ram AS Ram,
	screen AS ScreenSize
FROM laptop
WHERE price > 1000
GO

--Task Four
SELECT * 
FROM printer
WHERE color = 'y'
GO

--Task Five
SELECT 
	code AS PcSerialNumber,
	ram as Ram,
	speed as Mhz 
FROM pc
WHERE price < 2000
AND cd = '16x' OR cd = '12x'
GO


--------------------------------------------------
/*Using ships Database*/
USE ships
GO

--Task one 
SELECT 
	CLASS AS NAME
FROM CLASSES
WHERE NUMGUNS < 10
GO

--Task Two 
SELECT
	 NAME AS ShipName
FROM SHIPS
WHERE LAUNCHED < 1918 
GO

--Task Three
SELECT 
	SHIP as ShipName,
	BATTLE as SunkInBattle
FROM OUTCOMES
WHERE RESULT = 'sunk'
GO

--Task Four 
SELECT 
	NAME AS ShipName
FROM SHIPS
WHERE NAME = CLASS
GO

--Task Five
SELECT 
	NAME AS ShipName
FROM SHIPS
WHERE NAME LIKE 'R%'
GO

