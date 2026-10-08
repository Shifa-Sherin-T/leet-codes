-- Write your PostgreSQL query statement below
select u.name,sum(t.amount)as Balance
from users u
join Transactions t
on u.account=t.account
group by u.name,t.account
having sum(t.amount)>10000