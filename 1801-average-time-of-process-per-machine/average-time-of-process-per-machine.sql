# Write your MySQL query statement below

#average time each machine takes to complete a process

WITH sumtimetable AS
( 
SELECT
    machine_id
    ,process_id
    ,SUM(CASE WHEN activity_type = 'start' THEN `timestamp` END) AS sum_start
    ,SUM(CASE WHEN activity_type = 'end'   THEN `timestamp` END) AS sum_end
FROM Activity
GROUP BY machine_id, process_id
ORDER BY machine_id, process_id)
, per_process AS(
    SELECT   machine_id
            ,process_id
            ,sum_end - sum_start as processing_time1
    FROM sumtimetable
)

SELECT 
        machine_id
        ,ROUND(AVG(processing_time1), 3) as processing_time 
FROM per_process 
GROUP BY machine_id
