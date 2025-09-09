# Write your MySQL query statement below

WITH t1 AS
    (SELECT 
            *,
            SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
    )

SELECT t1.person_name
FROM Queue q
JOIN t1
ON t1.person_id = q.person_id AND t1.person_name = q.person_name AND t1.weight = q.weight AND t1.turn = q.turn
WHERE t1.total_weight <= 1000
ORDER BY q.turn desc LIMIT 1
