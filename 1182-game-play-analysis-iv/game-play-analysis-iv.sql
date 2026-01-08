# Write your MySQL query statement below


#To get number of players
-- SELECT COUNT(DISTINCT player_id)
-- FROM Activity 

SELECT 
        ROUND((
        SELECT COUNT(DISTINCT b.player_id) as immediate_login
        FROM Activity a
        JOIN 
            (SELECT
                player_id,
                MIN(event_date) as first_day,
                DATE_ADD(MIN(event_date), INTERVAL 1 DAY) as dayafter
            FROM Activity
            GROUP BY player_id
            ) b
        ON 
            a.player_id = b.player_id AND
            a.event_date = b.dayafter
            )/COUNT(DISTINCT player_id),2) as fraction
FROM Activity 
