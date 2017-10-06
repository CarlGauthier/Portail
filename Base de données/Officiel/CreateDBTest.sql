USE master
IF EXISTS(select * from sys.databases where name='BDPlanCadreTEST')
DROP DATABASE BDPlanCadreTEST
GO

CREATE DATABASE BDPlanCadreTEST
GO

USE BDPlanCadreTEST
GO

-- --------------------------

IF EXISTS(select * from sys.databases where name='tt')
DROP DATABASE tt;

CREATE TABLE tt (

	id			INT			NOT NULL	IDENTITY(1,1),

	champ		VARCHAR(5)	NOT NULL,

	PRIMARY KEY(id)
)
GO