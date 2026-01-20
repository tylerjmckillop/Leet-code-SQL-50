# Write your MySQL query statement below
-- HAVE AT LEAST 100 UNITS ORDERED IN FEB 2020


SELECT
    product_name,
    SUM(unit) as unit
FROM Orders o
INNER JOIN Products p
ON p.product_ID = o.product_id 
WHERE order_date BETWEEN '2020-02-01' AND '2020-02-29' 
GROUP BY product_name
HAVING unit >= 100