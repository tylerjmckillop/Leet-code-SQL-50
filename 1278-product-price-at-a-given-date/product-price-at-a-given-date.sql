# Write your MySQL query statement below

WITH newprod AS

            (SELECT 
                product_id,
                new_price,
                change_date
            FROM Products
            WHERE 
                change_date <= "2019-08-16"
            )
, max_change AS
(SELECT
    product_id,
    MAX(change_date) as max_change_date
FROM newprod
GROUP BY product_id
)

,t3 as (
SELECT DISTINCT
    p.product_id
FROM Products p
)

SELECT 
    t3.product_id,
    CASE WHEN np.new_price IS Null THEN 10 ELSE np.new_price END as price
FROM newprod np
JOIN max_change m
ON m.max_change_date = np.change_date AND m.product_id = np.product_id
RIGHT JOIN t3 
ON t3.product_id = np.product_id

