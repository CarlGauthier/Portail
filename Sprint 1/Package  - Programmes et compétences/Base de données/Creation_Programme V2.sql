/*Script de Samuel, modifié par Eddy le 12 septembre
- Ajout du path
- Ajout d'une date de validation du programme
 */

/*
use master;
GO
ALTER DATABASE BDtest SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
 */

USE master
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name='BDtest')
DROP DATABASE BDtest
GO

CREATE DATABASE BDtest
GO

USE BDtest
GO 

IF OBJECT_ID ('dbo.tblProgramme') IS NOT NULL
DROP TABLE dbo.tblProgramme
GO
CREATE TABLE tblProgramme (
	id					int				IDENTITY(1,1)	NOT NULL,
	code				CHAR(3)			UNIQUE			NOT NULL,
	annee				CHAR(4)							NOT NULL,
	codeSpecialisation	VARCHAR(3)		UNIQUE			NOT NULL,
	nbUnité				VARCHAR(10),		
	specialisation		VARCHAR(30),
	nom					VARCHAR(50),
	formationGeneral	VARCHAR(6),
	formationSpecifique VARCHAR(6),
	condition			VARCHAR(300),
	sanction			VARCHAR(50),
	commentaire			VARCHAR(200),
	pathDocMinistere	VARCHAR(200),
	dateValidation		DATETIME,
	PRIMARY KEY (id)
);

IF OBJECT_ID ('dbo.tblCodeProgramme') IS NOT NULL
DROP TABLE dbo.tblCodeProgramme
GO
CREATE TABLE tblCodeProgramme (
	id			 int			IDENTITY(1,1)	NOT NULL,
	code		 CHAR(3)		UNIQUE			NOT NULL,
	commentaire	 VARCHAR(200),
	PRIMARY KEY (id)
);
