WITH category_counter AS (
  SELECT account_id,
         CASE
           WHEN income < 20000 THEN 'Low Salary'
           WHEN income <= 50000 THEN 'Average Salary'
           ELSE 'High Salary'
         END AS category
  FROM Accounts
),
categories AS (
  SELECT 'Average Salary' AS category
  UNION ALL SELECT 'Low Salary'
  UNION ALL SELECT 'High Salary'
)
SELECT
  cc.category,
  COUNT(c.account_id) AS accounts_count
FROM categories cc
LEFT JOIN category_counter c
  ON cc.category = c.category
GROUP BY cc.category;
