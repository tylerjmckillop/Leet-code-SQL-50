# Write your MySQL query statement below

#If change date before 2019-08-18 THEN new_price = 10 

WITH cte AS

    (
        SELECT 
            product_id,
            MAX(change_date) as max_date
        FROM Products
        WHERE change_date <= '2019-08-16'
        GROUP BY product_id
    ),

cte2 as 
    (
        SELECT distinct product_id
        From products
    )

SELECT 
    cte2.product_id,
    COALESCE(p.new_price, 10) as price
FROM cte2
LEFT JOIN cte
ON cte.product_id = cte2.product_id
LEFT JOIN Products p 
ON p.product_id = cte.product_id
AND
p.change_date = cte.max_date
