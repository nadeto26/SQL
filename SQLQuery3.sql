SELECT  DepartmentID,
  MAX(Salary)  as MaxSalary
  from Employees
  WHERE Salary NOT BETWEEN 30000 AND 70000
  Group By DepartmentID