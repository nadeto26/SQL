CREATE TABLE Categories
(
ID INT PRIMARY KEY IDENTITY,
Name VARCHAR(50) NOT NULL
)

CREATE TABLE Addresses
(
ID INT PRIMARY KEY IDENTITY,
StreetName VARCHAR(100) NOT NULL,
StreetNumber INT NOT NULL,
Town VARCHAR(30) NOT NULL,
Country VARCHAR(50) NOT NULL,
ZIP INT NOT NULL
)

CREATE TABLE Publishers
(
ID INT PRIMARY KEY IDENTITY,
Name VARCHAR(30) NOT NULL,
AddressId INT FOREIGN KEY REFERENCES Addresses(ID) NOT NULL,
Website VARCHAR(40) NOT NULL,
Phone VARCHAR(20) NOT NULL
)

CREATE TABLE PlayersRanges
(
ID INT PRIMARY KEY IDENTITY,
PlayersMin INT NOT NULL,
PlayersMax  INT NOT NULL
)

CREATE TABLE Boardgames
(
ID INT PRIMARY KEY IDENTITY,
Name VARCHAR(30) NOT NULL,
YearPublished INT NOT NULL,
Rating DECIMAL NOT NULL,
CategoryId INT FOREIGN KEY REFERENCES Categories(ID) NOT NULL,
PublisherId INT FOREIGN KEY REFERENCES Publishers(ID) NOT NULL,
PlayersRangeId INT FOREIGN KEY REFERENCES PlayersRanges(ID) NOT NULL
)

CREATE TABLE Creators
(
ID INT PRIMARY KEY IDENTITY,
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
Email VARCHAR(30) NOT NULL,
)

CREATE TABLE CreatorsBoardgames
(
CreatorId INT PRIMARY KEY FOREIGN KEY REFERENCES Creators(ID) NOT NULL,
BoardgameId INT FOREIGN KEY REFERENCES Boardgames(ID) NOT NULL,
)