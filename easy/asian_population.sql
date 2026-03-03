-- population census

SELECT SUM(c1.Population)
FROM CITY c1
JOIN COUNTRY c2 ON c1.CountryCode = c2.Code
WHERE c2.Continent = 'Asia'
