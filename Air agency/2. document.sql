USE AirAgency;


-- Таблица документ
CREATE TABLE dbo.document
(
	id int NOT NULL IDENTITY(1,1),
	name nvarchar(50) NOT NULL,
	CONSTRAINT PK_Document PRIMARY KEY(id)
);

INSERT INTO document(name) VALUES('Ничего');
INSERT INTO document(name) VALUES('Заграничный паспорт');
INSERT INTO document(name) VALUES('Паспорт');

SELECT * FROM document;

