# Write your MySQL query statement below


#SELECT 
#    num if num = num -1 and num = num -2 as ConsecutiveNums
#FROM Logs

SELECT DISTINCT
    l1.num as ConsecutiveNums
FROM logs AS l1
JOIN logs as l2 ON l2.id = l1.id +1 
JOIN logs as l3 ON l3.id = l2.id +1
WHERE l1.num = l2.num and l2.num = l3.num