with tbl as (select email,count(email) as cnt from Person group by email)

select email from tbl where cnt > 1

SELECT email AS Email FROM Person
GROUP By email
HAVING COUNT(email) > 1