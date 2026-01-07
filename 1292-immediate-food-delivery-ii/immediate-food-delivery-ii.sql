# Write your MySQL query statement below

# pref date = order date --> immediate
# pref date != order date --> scheduled

#first order is order with earliest order date

#percentage of immediate orders in the FIRST order of all customers

-- SELECT 
--     *,
--     IF(order_date = customer_pref_delivery_date, 'immediate', 'scheduled') as IorS,
--     MIN(order_date)
-- FROM Delivery
-- GROUP BY customer_Id

-- SELECT
--     d1.customer_id,
--     MIN(d1.order_date),
--     MIN(d1.customer_pref_delivery_date),
    
--     IF(min(d1.order_date) = min(d1.customer_pref_delivery_date), 1, 2)as IorS
-- FROM Delivery d1
-- JOIN 
--     (Delivery d2
-- ON d1.order_date = d2.order_date AND d1.customer_id = d2.customer_id
-- GROUP BY d1.customer_Id

SELECT 
    ROUND(AVG(d.order_date = d.customer_pref_delivery_date) * 100 ,2) as immediate_percentage
FROM Delivery d
JOIN
    (
SELECT customer_id, MIN(order_date) AS first_order_date
  FROM Delivery
  GROUP BY customer_id
    ) f
ON d.customer_id = f.customer_id
 AND d.order_date = f.first_order_date