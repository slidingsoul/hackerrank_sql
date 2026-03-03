-- draw the triangle 2

SET @n = 20;

WITH RECURSIVE nums AS (
    SELECT 0 AS i
    UNION ALL
    SELECT i + 1
    FROM nums
    WHERE i + 1 < @n
)
SELECT REPEAT('* ', i + 1) AS pattern
FROM nums;
