# Write your MySQL query statement below

-- Quality = average ratio between query rating and its position

-- Poor quality percentage as the percentage of all queries with rating less than 3

SELECT 

    query_name,
    ROUND(AVG(rating/position), 2)as quality,
    ROUND((SUM(IF(rating < 3, 1, 0)) / COUNT(rating)) * 100 , 2) as poor_query_percentage
 

FROM Queries
GROUP BY query_name