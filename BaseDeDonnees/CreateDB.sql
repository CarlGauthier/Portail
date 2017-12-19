USE master
IF EXISTS(select * from sys.databases where name='BDPlanCadre')
DROP DATABASE BDPlanCadre
GO

CREATE DATABASE BDPlanCadre
GO

USE BDPlanCadre
GO

-- --------------------------