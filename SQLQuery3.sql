CREATE TABLE Owners
(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL,
PhoneNumber Varchar(15) NOT NULL,
Address VARCHAR(50) NULL
)

CREATE TABLE AnimalTypes
(
Id INT PRIMARY KEY IDENTITY,
AnimalType VARCHAR(30) NOT NULL
)

CREATE TABLE Cages
(
Id INT PRIMARY KEY IDENTITY,
AnimalTypeId INT NOT NULL FOREIGN KEY REFERENCES AnimalTypes(Id)
)

CREATE TABLE Animals
(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(30) NOT NULL,
BirthDate DATE NOT NULL,
OwnerId INT NULL FOREIGN KEY REFERENCES Owners(Id),
AnimalTypeId INT NOT NULL FOREIGN KEY REFERENCES AnimalTypes(Id)
)

CREATE TABLE AnimalsCages
(
CageId INT NOT NULL FOREIGN KEY REFERENCES Cages(Id),
AnimalId INT FOREIGN KEY REFERENCES Animals(Id) NOT NULL,
PRIMARY KEY(CageId , AnimalId)
)

CREATE TABLE VolunteersDepartments
(
Id INT Primary key IDENTITY,
DepartmentName VARCHAR(30) NOT NULL
)

CREATE TABLE Volunteers
(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL,
PhoneNumber VARCHAR(15) NOT NULL,
Address VARCHAR(50) NULL,
AnimalId INT FOREIGN KEY REFERENCES Animals(Id),
DepartmentId INT FOREIGN KEY REFERENCES VolunteersDepartments(Id) NOT NULL
)


SELECT * FROM Owners
SELECT * FROM Animals
SELECT *FROM AnimalTypes

SELECT
CONCAT (o.Name , '-', ' ', a.Name),
o.PhoneNumber,
c.CageId as CageId
FROM Animals as a 
INNER JOIN AnimalTypes as at ON at.Id=a.AnimalTypeId
INNER JOIN Owners as o ON o.Id = a.OwnerId
INNER JOIN AnimalsCages as c ON c.AnimalId = a.Id
WHERE AnimalType = 'Mammals'
ORDER BY o.Name, a.Name DESC


SELECT 
Name ,
PhoneNumber,
 TRIM(REPLACE(REPLACE(v.Address, 'Sofia', ''),',',''))
 Address
FROM Volunteers as v
INNER JOIN VolunteersDepartments as vd ON vd.Id= v.DepartmentId
WHERE DepartmentName = 'Education program assistant' AND Address LIKE '%Sofia%'
ORDER BY Name 


SELECT 
a.Name,
a.BirthDate,
at.AnimalType
FROM Animals as a
INNER JOIN AnimalTypes as at ON a.AnimalTypeId = at.Id
WHERE OwnerId IS NULL AND BirthDate < '2022' AND at.AnimalType != 'Birds'
ORDER BY a.Name


SELECT 
Name,
FORMAT (BirthDate,'yyyy') as BirthYear,
AnimalType
FROM Animals as a
INNER JOIN AnimalTypes as at ON a.AnimalTypeId = at.Id
WHERE OwnerId IS NULL AND  DATEDIFF(YEAR, BirthDate, '2022-01-01') < 5 AND at.AnimalType != 'Birds'
ORDER BY Name

SELECT * FROM AnimalTypes
SELECT * FROM Animals
 
 
 