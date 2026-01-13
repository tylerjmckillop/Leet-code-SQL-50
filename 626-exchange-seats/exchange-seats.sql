# Write your MySQL query statement below


SELECT
    CASE 
    WHEN id % 2 = 0 THEN id-1
    WHEN id % 2 <>0 AND id =   (SELECT 
                                MAX(id)
                                FROM seat) THEN id
    WHEN id % 2 <>0 THEN id+1
    END as id,
    student
FROM Seat
ORDER BY id asc
