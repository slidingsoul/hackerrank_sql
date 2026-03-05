-- weather observation station

WITH ordered AS(
    SELECT ROW_NUMBER() OVER(ORDER BY LAT_N) as rn, LAT_N, COUNT(*) OVER() as totalRows FROM STATION
)
SELECT ROUND(AVG(LAT_N), 4) as median
FROM ordered
WHERE rn IN (FLOOR((totalRows + 1) / 2), FLOOR((totalRows + 2) / 2))


/*
SET @rowIndex := -1;

SELECT ROUND(AVG(lat), 4)
FROM (SELECT @rowIndex := @rowIndex + 1 as rn, s.LAT_N as lat FROM STATION s ORDER BY s.LAT_N) as d
WHERE d.rn IN(FLOOR(@rowIndex / 2), CEIL(@rowIndex / 2));
*/
