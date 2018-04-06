USE AirAgency;

-- Таблица стран
CREATE TABLE dbo.country
(
	id int NOT NULL IDENTITY(1,1),
	name nvarchar(100) NOT NULL
	CONSTRAINT PK_Country PRIMARY KEY(id)
);

INSERT INTO country(name) VALUES('Кыргызская Республика');
INSERT INTO country(name) VALUES('Республика Казахстан');
INSERT INTO country(name) VALUES('Россия');

SELECT * FROM country;

UPDATE country SET name = 'Российская Федерация' WHERE name='Россия';

SELECT * FROM country;
