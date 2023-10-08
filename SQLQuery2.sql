CREATE TABLE Countries
(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(10) NOT NULL
)

CREATE TABLE Addresses
(
Id INT PRIMARY KEY IDENTITY,
StreetName NVARCHAR(20) NOT NULL,
StreetNumber INT NOT NULL,
PostCode INT NOT NULL,
City VARCHAR(25) NOT NULL,
CountryId INT FOREIGN KEY REFERENCES Countries(Id) NOT NULL
)


CREATE TABLE Vendors
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(25) NOT NULL,
NumberVAT NVARCHAR(15) NOT NULL,
AddressId INT FOREIGN KEY REFERENCES Addresses(Id) NOT NULL
)

CREATE TABLE Clients
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(25) NOT NULL,
NumberVAT NVARCHAR(15) NOT NULL,
AddressId INT FOREIGN KEY REFERENCES Addresses(Id) NOT NULL
)

CREATE TABLE Categories
(
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(10) NOT NULL
)

CREATE TABLE Products
(
Id INT PRIMARY KEY IDENTITY,
Name NVARCHAR(35) NOT NULL,
Price DECIMAL(18,2) NOT NULL,
CategoryId INT FOREIGN KEY REFERENCES Categories(Id) NOT NULL,
VendorId INT FOREIGN KEY REFERENCES Vendors(Id) NOT NULL
)

CREATE TABLE Invoices
(
Id INT PRIMARY KEY IDENTITY,
Number INT UNIQUE NOT NULL,
IssueDate DateTime2 NOT NULL,
DueDate DateTime2 NOT NULL,
Amount DECIMAL(18,2) NOT NULL,
Currency VARCHAR(5) NOT NULL,
ClientId INT FOREIGN KEY REFERENCES Clients(Id) NOT NULL
)

CREATE TABLE ProductsClients
(
ProductId INT FOREIGN KEY REFERENCES Products(Id) NOT NULL,
ClientId INT FOREIGN KEY REFERENCES Clients(Id) NOT NULL,
PRIMARY KEY (ProductId,ClientId)
)


SELECT Number,Currency FROM Invoices
ORDER BY amount  DESC , DueDate ASC

SELECT * FROM Categories

SELECT 
p.Id,
p.Name,
Price,
c.Name
FROM Products as p 
INNER JOIN Categories as c ON c.Id =p.CategoryId
 WHERE c.Name = 'ADR' OR c.Name = 'Others'
ORDER BY Price DESC

SELECT 
c.Id,
c.Name as Client,
CONCAT (StreetName,',' ,' ',StreetNumber,',',' ',PostCode,',',' ', City, ',', ' ',ct.Name)  as Address
FROM Clients as c
INNER JOIN Addresses as a ON a.Id =c.AddressId
INNER JOIN ProductsClients as pc ON pc.ClientId= c.Id
INNER JOIN Countries as ct ON a.CountryId= ct.Id
 WHERE pc.ProductId IS NULL
ORDER BY c.Id


SELECT * FROM Addresses
SELECT * FROM Countries
SELECT * FROM Invoices
SELECT * FROM Products
select * from Vendors
select * from ProductsClients
SELECt * FROM Categories
SELECT * FROM Clients

SELECT TOP 7
Number,
Amount,
c.Name as Client
FROM Invoices as i
INNER JOIN Clients as c ON c.Id=i.ClientId
 WHERE i.IssueDate < CONVERT(DATETIME2, '2023-01-01') AND i.Currency = 'EUR'
OR i.Amount > 500 AND  SUBSTRING(c.NumberVAT, 1, 2) = 'DE'
ORDER BY number , amount desc


SELECT 
c.Name,
MAX(Price),
NumberVAT
FROM Clients as c
INNER JOIN Products as p 
ON p.Id = c.Id
WHERE c.Name  NOT LIKE '%KG'
GROUP BY c.Name,NumberVAT
ORDER BY MAX(p.Price) DESC
 

