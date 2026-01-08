# Write your MySQL query statement below

WITH cte AS 
    (
    SELECT 
        MAX(num) as num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
    )

SELECT 
    MAX(num) as num
FROM cte