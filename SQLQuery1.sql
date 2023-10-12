SELECT 
AircraftId
,Manufacturer
,FlightHours
,COUNT(fd.Id) AS FlightDestinationsCount
,ROUND(AVG(fd.TicketPrice),2)  AS AvgPrice
FROM Aircraft as a 
INNER  JOIN FlightDestinations as fd ON fd.AircraftId=a.Id
GROUP BY AircraftId,Manufacturer,FlightHours
HAVING COUNT(fd.Id) >=2
ORDER BY  COUNT(fd.Id) DESC, AircraftId
  


   SELECT 
  p.FullName,
  COUNT(a.Id) as CountOfAircraft,
  SUM(fd.TicketPrice) as TotalTicketPrice
FROM 
  Passengers as p
INNER JOIN 
  FlightDestinations as fd ON fd.PassengerId = p.Id
INNER JOIN 
  Aircraft as a ON a.Id = fd.AircraftId
GROUP BY 
  p.FullName
HAVING 
  COUNT(a.Id) > 1 AND SUBSTRING(p.FullName, 2, 1) = 'A'
ORDER BY 
  FullName;

   

   SELECT 
   AirportName,
   Start AS DayTime,
   TicketPrice,
   p.FullName,
   Manufacturer,
   Model
   From FlightDestinations AS fd
   INNER JOIN Airports as a ON a.Id =fd.AirportId
   INNER JOIN Passengers as p ON p.Id=fd.PassengerId
   INNER JOIN Aircraft as ac ON ac.Id = fd.AircraftId
   WHERE DATEPart(HOUR,Start) >=6.00 AND DATEPART(HOUR,Start) <=20.00
   AND TicketPrice >2500
   ORDER BY model

   SELECT * FROM FlightDestinations
   SELECT * FROM Airports
   SELECT * FROM Aircraft

   GO
   CREATE function udf_FlightDestinationsByEmail(@email VARCHAR(50)) 
    RETURNS INT 
	AS
    BEGIN
	return( SELECT     Count(fd.Id)
           FROM Passengers as p
           INNER JOIN FlightDestinations as fd ON fd.PassengerId = p.Id
		   WHERE p.Email= @email)
  	END
 GO
 
	 
 SELECT dbo.udf_FlightDestinationsByEmail ('PierretteDunmuir@gmail.com')

 SELECT 
 Email,
 Count(fd.Id)
 FROM Passengers as p
 INNER JOIN FlightDestinations as fd ON fd.PassengerId = p.Id
 GROUP BY Email