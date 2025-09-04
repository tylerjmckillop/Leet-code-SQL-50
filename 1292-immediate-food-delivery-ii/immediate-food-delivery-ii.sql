# Write your MySQL query statement below
SELECT
  ROUND(SUM(is_immediate) * 100.0 / COUNT(*), 2) AS immediate_percentage
FROM (
  SELECT
    (d.order_date = d.customer_pref_delivery_date) AS is_immediate
  FROM Delivery d
  JOIN (
    SELECT customer_id, MIN(order_date) AS first_order_date
    FROM Delivery
    GROUP BY customer_id
  ) m
    ON d.customer_id = m.customer_id
   AND d.order_date  = m.first_order_date
) x;
