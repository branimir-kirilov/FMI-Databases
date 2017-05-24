USE ships
GO

CREATE VIEW v_cont_avg_ng(country, avg_num_gun)
AS
SELECT COUNTRY, AVG(NUMGUNS)
FROM CLASSES
GROUP BY COUNTRY
GO

SELECT * 
FROM v_cont_avg_ng
ORDER BY avg_num_gun DESC
GO

-------TASKS------
USE FLIGHTS
GO

-----READONLY VIEW---
CREATE VIEW v_sof
AS 
SELECT f.FNUMBER, dep.CITY AS dep_city, arr.CITY AS arr_city 
FROM FLIGHTS f, AIRPORTS arr, AIRPORTS dep
WHERE f.DEP_AIRPORT = dep.CODE
AND f.ARR_AIRPORT = arr.CODE
AND f.DEP_AIRPORT = 'Sofia'

SELECT * FROM 
v_sof

---UPDATEABLE VIEW----
CREATE VIEW v_sof_agencies
AS
SELECT NAME, COUNTRY, CITY, PHONE
FROM AGENCIES
WHERE CITY = 'Sofia'
--Check option does not allow changing the city here, so the update clause won't pass------
WITH CHECK OPTION

SELECT * FROM v_sof_agencies


-----UPDATING THE TABLE, USING THE VIEW-------
INSERT INTO v_sof_agencies
VALUES('SomeCompany', 'BG', 'Sofia', '0896435334')

UPDATE v_sof_agencies
SET city = 'Burgas'
WHERE name = 'Aerofly'

EXEC sp_helpindex FLIGHTS


-------Tasks-----------
USE FLIGHTS
GO

------01.Създайте изглед, който да извежда име на авиокомпания оператор на полета, номер на
--полет и брой пътници, потвърдили резервация за този полет. Тествайте изгледa.------

CREATE VIEW v_flight_details
AS
SELECT a.NAME, f.FNUMBER, COUNT(*) AS passengers_count
FROM FLIGHTS f, BOOKINGS b, AIRLINES a
WHERE f.AIRLINE_OPERATOR = a.CODE
AND b.FLIGHT_NUMBER = f.FNUMBER 
GROUP BY a.NAME, f.FNUMBER

SELECT * FROM v_flight_details

------02.Създайте изглед, който за всяка агенция извежда името на клиента с най-много
--резервации. Тествайте изгледa.------
CREATE VIEW v_most_bookings
AS
	SELECT c.FNAME, COUNT(*) AS bookings_count
	FROM AIRLINES a, BOOKINGS b, CUSTOMERS c
	WHERE a.CODE = b.AIRLINE_CODE
	AND b.CUSTOMER_ID = c.ID
	GROUP BY c.FNAME
	HAVING COUNT(*) >= ALL
	(
		SELECT COUNT(*)
		FROM AIRLINES a, BOOKINGS b, CUSTOMERS c
		WHERE a.CODE = b.AIRLINE_CODE
		AND b.CUSTOMER_ID = c.ID
		GROUP BY c.FNAME
	)
GO

SELECT * FROM v_most_bookings
GO


------03.Създайте изглед за таблицата Agencies (v_SF_Agencies), който да връща всички данни
------за агенциите от град София. Дефинирайте изгледa с CHECK OPTION. Тествайте изгледa.
CREATE VIEW v_SF_Agencies
AS 
SELECT * 
FROM AGENCIES
WHERE CITY = 'Sofia'
WITH CHECK OPTION
GO

SELECT * FROM v_SF_Agencies
GO

------04.Създайте изглед за таблицата Agencies (v_SF_PH_Agencies), който да връща всички
------данни за агенциите, такива че телефонните номера на тези агенции да са NULL.
------Дефинирайте изгледa с CHECK OPTION. Тествайте изгледa.
CREATE VIEW v_SF_PH_Agencies
AS
SELECT * 
FROM AGENCIES
WHERE PHONE IS NULL
WITH CHECK OPTION 
GO

SELECT * FROM v_SF_PH_Agencies
GO

------05.Опитайте се да вмъкнете следните редове през изгледите от задачи 3 и 4. Какво се
------случва?

INSERT INTO v_SF_Agencies
VALUES('T1 Tour', 'Bulgaria', 'Sofia','+359');
INSERT INTO v_SF_PH_Agencies
VALUES('T2 Tour', 'Bulgaria', 'Sofia',null);
INSERT INTO v_SF_Agencies
VALUES('T3 Tour', 'Bulgaria', 'Varna','+359');
INSERT INTO v_SF_PH_Agencies
VALUES('T4 Tour', 'Bulgaria', 'Varna',null);
INSERT INTO v_SF_PH_Agencies
VALUES('T4 Tour', 'Bulgaria', 'Sofia','+359');
------Movies Tasks------
USE movies
GO

------6. Създайте изглед RichExec, който извежда името, адреса, сертификационния номер и
------нетните активи на всеки продуцент с нетни активи поне 10000000. 

CREATE VIEW v_Rich_Exec
AS
SELECT *
FROM MOVIEEXEC
WHERE NETWORTH >= 10000000
GO

SELECT * FROM v_Rich_Exec
GO

------7. Създайте изглед Executivestar, който извежда името, адреса, пола, рождената дата,
------сертификационния номер и нетните активи на всички звезди, които са и продуценти.

CREATE VIEW v_Executive_Star
AS
SELECT st.NAME, st.ADDRESS, st.GENDER, st.BIRTHDATE, ex.CERT#, ex.NETWORTH
FROM MOVIEEXEC ex, MOVIESTAR st
WHERE ex.NAME = st.NAME 
GO

SELECT * FROM v_Executive_Star
GO

SELECT * 
FROM MOVIEEXEC

SELECT * FROM 
MOVIESTAR