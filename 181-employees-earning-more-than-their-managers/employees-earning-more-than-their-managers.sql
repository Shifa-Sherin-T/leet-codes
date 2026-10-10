-- Write your PostgreSQL query statement below
select e1.name as Employee
from Employee e1
join employee e2
on e1.managerId=e2.Id
where e1.salary>e2.salary