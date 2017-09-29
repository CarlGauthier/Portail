/*
use master;
GO
ALTER DATABASE BDPlanCadreDEV SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
GO
*/

USE master
IF EXISTS(select * from sys.databases where name='BDPlanCadreDEV')
DROP DATABASE BDPlanCadreDEV
GO

CREATE DATABASE BDPlanCadreDEV
GO

USE BDPlanCadreDEV
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