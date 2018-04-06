USE AirAgency;

--Таблица расписаний рейсов
CREATE TABLE dbo.voyage
(
	id int NOT NULL IDENTITY(1, 1),
	voyageNumber int NOT NULL,
	aircraftID int NULL,
	routID int NOT NULL,
	passengerID int NULL,
	dateDeparture nvarchar(100) NOT NULL,
	timeDeparture nvarchar(100) NOT NULL,
	flightTime nvarchar(100) NOT NULL,
	ticketPrice decimal(10, 4) NOT NULL,
	CONSTRAINT PK_Voyage PRIMARY KEY(id),
	CONSTRAINT FK_AirCraftVoyage FOREIGN KEY(aircraftID) REFERENCES aircraft(id)
		ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT FK_PassengerVoyage FOREIGN KEY(passengerID) REFERENCES passenger(id)
		ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO voyage(voyageNumber, aircraftID, routID, passengerID, dateDeparture, timeDeparture, flightTime, ticketPrice)
			VALUES(1234, 1, 1, 1, '1.1.2017', '15:30:00', '3:00:00', 2000);
INSERT INTO voyage(voyageNumber, aircraftID, routID, passengerID, dateDeparture, timeDeparture, flightTime, ticketPrice)
			VALUES(1235, 2, 2, 2, '28.2.2017', '16:30:00', '5:00:00', 5000);
INSERT INTO voyage(voyageNumber, aircraftID, routID, passengerID, dateDeparture, timeDeparture, flightTime, ticketPrice)
			VALUES(1236, 3, 3, 3, '15.3.2017', '22:30:00', '6:00:00', 10000);
			
SELECT voyageNumber, 
		(SELECT name FROM aircraft WHERE id = aircraftID) AS AirCraft,
		(SELECT name FROM city WHERE id=(SELECT cityDestination FROM rout WHERE id=routID)) AS CityDestination,
		(SELECT name FROM city WHERE id=(SELECT cityDeparture FROM rout WHERE id=routID)) AS CityDeparture,
		(SELECT firstName FROM passenger WHERE id = passengerID) AS FirstName,
		(SELECT lastName FROM passenger WHERE id = passengerID) AS SecondName,
		dateDeparture,
		timeDeparture,
		flightTime,
		ticketPrice
FROM voyage;
