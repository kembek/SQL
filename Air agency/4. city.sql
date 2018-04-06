USE AirAgency;


--Таблица городов
CREATE TABLE dbo.city
(
	id int NOT NULL IDENTITY(1,1),
	name nvarchar(100) NOT NULL,
	countryID int NOT NULL,
	CONSTRAINT PK_City PRIMARY KEY(id, countryID),
	CONSTRAINT FK_CountryCity FOREIGN KEY(countryID) REFERENCES country(id)
		ON UPDATE CASCADE 
		ON DELETE CASCADE
);

INSERT INTO city(name, countryID) VALUES('Бишкек', 1);
INSERT INTO city(name, countryID) VALUES('Ош', 1);
INSERT INTO city(name, countryID) VALUES('Каракол', 1);

INSERT INTO city(name, countryID) VALUES('Астана', 2);
INSERT INTO city(name, countryID) VALUES('Алматы', 2);
INSERT INTO city(name, countryID) VALUES('Караганда', 2);

INSERT INTO city(name, countryID) VALUES('Москва', 3);
INSERT INTO city(name, countryID) VALUES('Санкт-Петербург', 3);
INSERT INTO city(name, countryID) VALUES('Владивосток', 3);

SELECT name, (SELECT name FROM dbo.country WHERE id=countryID) FROM city;

DELETE FROM city WHERE name = 'Караганда';
DELETE FROM city WHERE name = 'Санкт-Петербург';
DELETE FROM city WHERE name = 'Владивосток';

SELECT name, (SELECT name FROM dbo.country WHERE id=countryID) AS Country FROM city;

