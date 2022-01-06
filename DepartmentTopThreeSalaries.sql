SELECT Department.name AS "Department", e.name AS "Employee", e.salary AS "Salary" FROM
(SELECT departmentId, name, salary, DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS 'r' FROM Employee) e
INNER JOIN Department ON Department.id = e.departmentId
WHERE r <= 3;