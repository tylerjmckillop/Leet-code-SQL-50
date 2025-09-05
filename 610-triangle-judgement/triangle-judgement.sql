# Write your MySQL query statement below
# length one line < sum 2 other lines

SELECT
x
,y
,z
,IF(x+y>z AND y+z>x AND x+z>y, "Yes", "No") as triangle
FROM triangle
