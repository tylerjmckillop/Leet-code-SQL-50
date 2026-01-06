# Write your MySQL query statement below

# area needs to be 3000000 or population is 25000000


SELECT 
    name,
    population,
    area 
FROM World
WHERE population >= 25000000 OR area >= 3000000