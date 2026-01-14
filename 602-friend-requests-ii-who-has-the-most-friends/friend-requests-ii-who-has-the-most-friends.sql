-- SELECT 
--     accepter_id as id,
--     COUNT(accepter_id) Number_Appears
-- FROM RequestAccepted 
-- GROUP BY accepter_Id

-- UNION ALL 

-- SELECT 
--     requester_id as id,
--     COUNT(requester_Id) Number_Appears
-- FROM RequestAccepted
-- GROUP BY requester_Id

SELECT
    id,
    SUM(number_appears) as num
FROM 

(SELECT 
    requester_id as id,
    COUNT(requester_id) as Number_Appears
FROM RequestAccepted
GROUP BY requester_id 

UNION ALL

SELECT 
    accepter_id as id,
    COUNT(accepter_id) Number_Appears
FROM RequestAccepted 
GROUP BY accepter_Id) t
GROUP BY id
ORDER BY num desc
LIMIT 1