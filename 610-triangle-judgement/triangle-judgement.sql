# Write your MySQL query statement below
# length one line < sum 2 other lines

SELECT
  x,
  y,
  z,
  CASE
    WHEN x + y > z
     AND x + z > y
     AND y + z > x
    THEN 'Yes'
    ELSE 'No'
  END AS triangle
FROM Triangle;