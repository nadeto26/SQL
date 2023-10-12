 GO
CREATE FUNCTION udf_GetVolunteersCountFromADepartment(@VolunteersDepartment VARCHAR (30))
 RETURNS INT 
 AS 
 BEGIN
 RETURN (SELECT Count(d.Id)
 FROM VolunteersDepartments as d 
 INNER JOIN Volunteers as v ON v.DepartmentId=d.Id
 WHERE v.Name=@VolunteersDepartment)
 END
GO


 


 SELECT 
 Count(d.Id)
 FROM VolunteersDepartments as d 
 INNER JOIN Volunteers as v ON v.DepartmentId=d.Id
 SELECT * FROM Volunteers
 