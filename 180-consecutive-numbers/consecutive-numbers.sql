# Write your MySQL query statement below

-- WITH cte AS
--     (
--         SELECT 
--             id,
--             num,
--             ROW_NUMBER() OVER( PARTITION BY num ORDER BY id asc) as rn
--         FROM Logs
--     )
-- SELECT *
-- FROM cte
WITH cte AS (
  SELECT
    id,
    num,
    ROW_NUMBER() OVER (ORDER BY id)
    - ROW_NUMBER() OVER (PARTITION BY num ORDER BY id) AS g
  FROM Logs
)
SELECT DISTINCT
  num AS ConsecutiveNums
FROM cte
GROUP BY num, g
HAVING COUNT(*) >= 3