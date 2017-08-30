USE master
IF EXISTS(select * from sys.databases where name='BDTest')
DROP DATABASE BDTest
GO

CREATE DATABASE BDTest
GO

USE BDTest
GO

-- --------------------------

CREATE TABLE TableTest (

	id			INT			NOT NULL	IDENTITY(1,1),

	champ		VARCHAR(5)	NOT NULL,

	PRIMARY KEY(id)
)
GO

INSERT INTO TableTest (champ) VALUES
('ABCDE'),
('FGHIJ'),
('KLMNO'),
('12345'),
('67890')
GO
