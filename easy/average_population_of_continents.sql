-- Average Population of Each Continent

SELECT c2.Continent, FLOOR(AVG(c1.Population))
FROM CITY c1
JOIN COUNTRY c2 ON c1.CountryCode = c2.Code
GROUP BY c2.Continent
