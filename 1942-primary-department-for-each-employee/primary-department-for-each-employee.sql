
        
    # Write your MySQL query statement below
WITH count AS

        (SELECT
            employee_id
            ,COUNT(*) as dept_count
        FROM Employee
        GROUP BY employee_id
        )

SELECT 
    e.employee_id
    ,e.department_id
FROM Employee e
JOIN count p
ON e.employee_id = p.employee_id
WHERE p.dept_count = 1
   OR e.primary_flag = 'Y'
