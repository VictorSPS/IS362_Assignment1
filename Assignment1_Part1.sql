-- Assignment 1. Part 1

-- Quantiti of planes with listed speed. Min speed and Max speed

SELECT
COUNT(speed) as PlanesWithSpeed,
MAX(speed) AS MaxSpeed,
MIN(speed) AS MinSpeed
FROM planes;

-- Total distance flown by all of the planes in January 2013?

SELECT
SUM(distance) as TotalDistance
FROM flights
WHERE (month = 1) AND (year = 2013);

-- Total distance flown by all of the planes in January 2013 where the tailnum is missing?
SELECT
SUM(distance) as NullMiles
FROM flights
WHERE (month = 1) AND (year = 2013) AND (tailnum is NULL);

-- Total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer? 

SELECT 
SUM(distance) AS TotalDistance,
p.manufacturer
FROM flights f
INNER  JOIN planes p
ON f.tailnum = p.tailnum
WHERE (f.year = 2013) AND (f.month = 7) AND (f.day = 5)
GROUP BY p.manufacturer;

SELECT 
SUM(distance) AS TotalDistance,
p.manufacturer
FROM flights f
LEFT OUTER JOIN planes p
ON f.tailnum = p.tailnum
WHERE (f.year = 2013) AND (f.month = 7) AND (f.day = 5)
GROUP BY p.manufacturer;


-- My question: Find the airport with longest air_time in 2013? Answer: JFK with air-time 667
SELECT air_time AS 'Longest Air_time', flights.origin
FROM flights 
INNER JOIN planes
ON flights.tailnum = planes.tailnum
WHERE planes.year = 2013
ORDER BY  air_time desc limit 1;
