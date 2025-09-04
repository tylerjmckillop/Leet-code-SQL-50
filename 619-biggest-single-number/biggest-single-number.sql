# Write your MySQL query statement below

WITH singles as
    (SELECT 
        num
        ,COUNT(num) 
    FROM MyNumbers
    group by num
    HAVING COUNT(num) < 2
    )
SELECT 
    MAX(num) as num
FROM singles
