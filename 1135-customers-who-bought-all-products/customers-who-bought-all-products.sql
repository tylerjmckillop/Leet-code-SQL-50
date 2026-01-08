# Write your MySQL query statement below

-- To do this, we count how many distinct products each customer bought and compare it with the total number of products in the Product table.

-- If both numbers are equal, it means the customer purchased every product.
#isolate the customers who have both the product key join onto them?

SELECT
    customer_id
FROM Customer
GROUP BY customer_id
HAVING IF(

        COUNT(DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) FROM Product), customer_id, NULL

        )


