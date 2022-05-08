Table: Employee

+-------------+------+
| Column Name | Type |
+-------------+------+
| id          | int  |
| salary      | int  |
+-------------+------+
id is the primary key column for this table.
Each row of this table contains information about the salary of an employee.
 

Write an SQL query to report the second highest salary from the Employee table. If there is no second highest salary, the query should report null.

The query result format is in the following example.

 

Example 1:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
| 2  | 200    |
| 3  | 300    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| 200                 |
+---------------------+
Example 2:

Input: 
Employee table:
+----+--------+
| id | salary |
+----+--------+
| 1  | 100    |
+----+--------+
Output: 
+---------------------+
| SecondHighestSalary |
+---------------------+
| null                |
+---------------------+



# Write your MySQL query statement below

select max(salary) as SecondHighestSalary from  Employee where salary < (SELECT MAX(salary) 
                   FROM Employee
                 ) 

 select ifnull(
      (select distinct salary from Employee
       order by Salary DESC
        LIMIT 1 OFFSET 1),
    null) as SecondHighestSalary



     select ifnull(
      (
          with salary_row as (SELECT 
   salary,row_number() OVER (order by salary desc) AS row_num FROM Employee group by salary
             
             )
          select salary_row.salary from salary_row where salary_row.row_num =2
      
      ),null) as SecondHighestSalary
