
  #Employees can be multiple departments
  #N = one department / primary department
  #Find employees and their primary department      
  #One row is an employee and their primary department
  #One row in input is an employee and the department they are apart of, whether it is their primary or not

#Only one department

SELECT 
    employee_id,
    department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(department_id) = 1


UNION

SELECT
    employee_Id,
    department_id
FROM Employee
WHERE primary_flag = 'Y'
