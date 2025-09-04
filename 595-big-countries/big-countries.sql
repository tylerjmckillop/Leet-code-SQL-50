# Write your MySQL query statement below

# area needs to be 3000000 or population is 25000000

select name, population, area
from World
where area >= 3000000 or population >= 25000000