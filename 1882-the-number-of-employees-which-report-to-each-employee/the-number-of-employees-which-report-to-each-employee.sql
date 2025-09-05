# Write your MySQL query statement below
WITH reports as
    (SELECT 
            employee_id
            ,reports_to
            ,name
            ,age
    FROM Employees
    WHERE reports_to IS NOT NULL)
SELECT
    e.employee_id
    ,e.name
    ,COUNT(r.reports_to)as reports_count
    ,ROUND(AVG(r.age),0) as average_age
FROM Employees e
JOIN reports r 
ON r.reports_to = e.employee_ID
GROUP BY employee_id
ORDER BY employee_id asc

