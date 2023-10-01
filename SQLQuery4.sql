  SELECT  DepartmentID,
  MAX(Salary)  as MaxSalary
  from Employees
  
  Group By DepartmentID
  HAVING Max(Salary) NOT BETWEEN 30000 AND 70000
 