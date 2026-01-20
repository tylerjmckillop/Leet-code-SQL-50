# Write your MySQL query statement below

WITH rank_table AS
    (
        SELECT 
            id,
            name,
            salary,
            departmentId,
            dense_rank() OVER ( partition by departmentId order by salary desc ) as ranked_values
        FROM Employee
    )

SELECT 
    d.name as Department,
    rt.name as Employee,
    rt.salary as Salary
FROM rank_table rt
INNER JOIN department d
ON rt.departmentId = d.id
WHERE ranked_values < 4
