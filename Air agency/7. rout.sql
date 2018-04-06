USE AirAgency;

--Таблица маршрутов
CREATE TABLE dbo.rout
(
	id int NOT NULL IDENTITY(1,1),
	cityDeparture int NOT NULL,
	cityDestination int NOT NULL,
	CONSTRAINT PK_CityRout PRIMARY KEY(id, cityDeparture, cityDestination),
	
);

INSERT INTO rout(cityDeparture, cityDestination) VALUES(1, 2);
INSERT INTO rout(cityDeparture, cityDestination) VALUES(2, 3);
INSERT INTO rout(cityDeparture, cityDestination) VALUES(3, 4);

SELECT	(SELECT name FROM city WHERE id = cityDeparture) AS CityDeparture,
		(SELECT name FROM city WHERE id = cityDestination) AS CityDestination
FROM rout;