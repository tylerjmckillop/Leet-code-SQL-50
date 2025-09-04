# Write your MySQL query statement below

#Each Row is Name of Employee, Department, and ID of manager.

#IF Manager ID is null then employee does not have a manager 


#Solution to find managers with at least 5 direct reports

WITH Reports AS
    (
SELECT 
    manageriD
    ,COUNT(*) as direct_reports
FROM Employee 
WHERE managerId IS NOT NULL
GROUP BY managerId
HAVING COUNT(*) >= 5
    )

SELECT 
    name
FROM Employee e 
INNER JOIN Reports r 
    ON r.managerID = e.iD
