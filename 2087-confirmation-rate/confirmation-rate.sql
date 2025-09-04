# Write your MySQL query statement below

With FullTable AS 
(

SELECT
    s.user_id
    ,c.action
FROM Signups s
LEFT JOIN Confirmations c
    ON s.user_id = c.user_id

)

SELECT 
    user_id,
     ROUND(
        CASE 
            WHEN COUNT(action) = 0 THEN 0
            ELSE SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(action)
        END
    , 2) AS confirmation_rate
FROM FullTable
GROUP BY user_id

