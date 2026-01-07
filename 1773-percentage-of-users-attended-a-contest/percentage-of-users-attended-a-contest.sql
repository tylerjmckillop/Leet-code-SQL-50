# Write your MySQL query statement below

-- SELECT 
--     r.contest_id,
--     COUNT(r.user_id)
--     u.user_name,
--     COUNT(DISTINCT u.user_name)

-- FROM Register r
-- LEFT JOIN
--     Users u
-- ON u.user_id = r.user_id
-- GROUP BY r.contest_id

-- SELECT COUNT(*) FROM Users u

SELECT
    r.contest_id,
    ROUND((COUNT(r.user_id) / u.total) * 100 , 2)  as percentage
FROM Register r
LEFT JOIN
    (
        SELECT
            COUNT(*) as total
        FROM
            Users
    ) u
ON 1=1
GROUP BY r.contest_id
ORDER BY percentage desc, contest_id asc