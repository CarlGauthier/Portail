USE master
IF EXISTS(select * from sys.databases where name='BDPlanCadreV2')
DROP DATABASE BDPlanCadreV2
GO

CREATE DATABASE BDPlanCadreV2
GO

USE BDPlanCadreV2
GO

-- --------------------------