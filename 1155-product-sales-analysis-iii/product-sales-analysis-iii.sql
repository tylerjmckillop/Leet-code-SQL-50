# Write your MySQL query statement below
WITH tab AS
        (SELECT
            product_id
            ,MIN(year) as first_year
        FROM sales s
        GROUP BY product_id)

SELECT
    s.product_id
    ,s.year as first_year
    ,s.quantity
    ,s.price
FROM Sales s
JOIN tab t
    ON s.product_id = t.product_id
WHERE t.first_year = s.year
