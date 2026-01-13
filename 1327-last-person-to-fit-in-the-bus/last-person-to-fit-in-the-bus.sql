# Write your MySQL query statement below

WITH cte as
    (
        SELECT 
            person_id,
            person_name,
            weight,
            turn,
            SUM(weight) OVER (ORDER BY turn asc) AS Total_Weight
        FROM Queue
    ),

 cte2 as
    (
        SELECT
            person_name,
            turn,
            max(turn) over () as max_turn
        FROM cte
        WHERE total_weight <= 1000 
    )

SELECT 
    person_name
FROM cte2
WHERE max_turn = turn