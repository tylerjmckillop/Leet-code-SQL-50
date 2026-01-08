# Write your MySQL query statement below

WITH cte AS
    (
        SELECT
            s.product_id,
            MIN(s.year) as first_year
        FROM Sales s
        GROUP BY product_id
    )
SELECT 
    s.product_id,
    cte.first_year,
    s.quantity,
    s.price
FROM Sales s
JOIN cte ON
        cte.product_id = s.product_id
AND
        cte.first_year = s.year
    