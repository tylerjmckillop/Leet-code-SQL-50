# Write your MySQL query statement below

#Each players first day
WITH first_login AS (
  SELECT
    player_id,
    MIN(event_date) AS first_day
  FROM Activity
  GROUP BY player_id
)
SELECT
  ROUND(
    1.0 * COUNT(DISTINCT f.player_id)
    / (SELECT COUNT(*) FROM first_login),
    2
  ) AS fraction
FROM first_login f
JOIN Activity a2
  ON a2.player_id = f.player_id
 AND a2.event_date = DATE_ADD(f.first_day, INTERVAL 1 DAY);