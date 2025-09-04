# Write your MySQL query statement below

#solution that reports the name and bonus amount of each employee with a bonus less than 1000

SELECT name, bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empId = b.empId
where bonus < 1000 or bonus is null

