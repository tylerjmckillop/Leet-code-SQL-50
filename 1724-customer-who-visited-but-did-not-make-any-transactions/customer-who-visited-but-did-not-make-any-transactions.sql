# Write your MySQL query statement below

#find ids of users who visited without making any transactions and the number of times they made these types of visits

/*
select v.customer_id, count(v.visit_id) as count_no_trans
from visits v
left join transactions t
on v.visit_id = t.visit_id
where amount is null
group by customer_id
order by count_no_trans
*/

SELECT v.customer_id, COUNT(v.visit_id) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t
  ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY v.customer_id
ORDER BY count_no_trans;
