# Write your MySQL query statement below
WITH productnum AS (
  SELECT COUNT(product_key) AS total_products
  FROM Product
)
SELECT c.customer_id
FROM Customer c
CROSS JOIN productnum p
GROUP BY c.customer_id, p.total_products
HAVING COUNT(DISTINCT c.product_key) = p.total_products;

