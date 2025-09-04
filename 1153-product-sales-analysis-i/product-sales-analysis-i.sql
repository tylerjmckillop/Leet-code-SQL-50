# Write your MySQL query statement below
 

select p.product_name, s.price, s.year
from sales s 
inner join product p
on s.product_id = p.product_id