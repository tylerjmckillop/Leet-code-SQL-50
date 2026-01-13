
WITH cte AS 

    (

        SELECT
            account_id,
            income,
            CASE 
                WHEN income < 20000 THEN "Low Salary"
                WHEN income >= 20000 and income <= 50000 THEN "Average Salary"
                WHEN income > 50000 THEN "High Salary"
            END as category
        FROM Accounts

    )

, cte2 AS 
    (
        SELECT
            'Low Salary' AS category
        UNION ALL
        SELECT 'Average Salary' as category
        UNION ALL
        select 'High Salary' as category
    )

SELECT 
    cte2.category,
    Coalesce(count(cte.category), 0) as accounts_count
FROM cte2
LEFT JOIN cte
ON cte.category = cte2.category
GROUP BY category