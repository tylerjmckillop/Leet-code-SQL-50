# Write your MySQL query statement below

#show unique id of each users, if unique id not there show null


select ei.unique_id, e.name
from employees e
left join employeeuni ei
on ei.id = e.id
    