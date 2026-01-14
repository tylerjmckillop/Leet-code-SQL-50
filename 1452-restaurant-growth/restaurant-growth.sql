# Write your MySQL query statement below


#moving average of how much customers paid in a seven day window (today plus 6 days before)



-- SELECT 
--     visited_on,
--     amount,
--     (SELECT AVG(amount) 
--     FROM Customer AS c2
--     WHERE c2.visited_on BETWEEN DATE_SUB(c1.visited_on, INTERVAL 7 DAY) AND c1.visited_on) as moving_avg
-- FROM Customer AS c1
-- GROUP BY visited_on

WITH dailytotal AS

    (

        SELECT 
            visited_on,
            SUM(amount) as amount
        FROM Customer
        GROUP BY visited_on

    )

SELECT 
    a.visited_on,
    SUM(b.amount) as amount,
    ROUND(AVG(b.amount),2) as average_amount
from dailytotal a
JOIN dailytotal b
WHERE b.visited_on >= DATE_SUB(a.visited_on, INTERVAL 6 DAY) AND b.visited_on <= a.visited_on
GROUP BY a.visited_on 
HAVING COUNT(a.visited_on) = 7
ORDER BY visited_on ASC