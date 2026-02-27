# african cities

SELECT cit.NAME
FROM CITY cit
JOIN COUNTRY ctr ON cit.CountryCode = ctr.Code
WHERE ctr.CONTINENT = 'Africa'