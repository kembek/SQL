USE AirAgency;

--Таблица пассажиров
CREATE TABLE dbo.passenger
(
	id int NOT NULL IDENTITY(1,1),
	firstName nvarchar(100) NOT NULL,
	lastName nvarchar(100) NOT NULL,
	patrName nvarchar(100) NULL,
	documentID int NOT NULL,
	documentSerial nvarchar(100) NOT NULL,
	documentNumber nvarchar(100) NOT NULL
	CONSTRAINT PK_Passenger PRIMARY KEY(id),
	CONSTRAINT FK_Passenger FOREIGN KEY(documentID) REFERENCES document(id)
		ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO passenger(firstName, lastName, patrName, documentID, documentSerial, documentNumber)
				VALUES('Касым', 'Матенов', 'Аскариев', 1, 'AA', '123456');
INSERT INTO passenger(firstName, lastName, patrName, documentID, documentSerial, documentNumber)
				VALUES('Асан', 'Карыпбеков', 'Мусанович', 2, 'AA', '123456');
INSERT INTO passenger(firstName, lastName, patrName, documentID, documentSerial, documentNumber)
				VALUES('Бекболот', 'Мамыров', '', 3, 'AA', '123456');

SELECT  firstName, lastName, patrName, (SELECT name FROM document WHERE id = documentID) AS document, documentSerial, documentNumber
FROM passenger;