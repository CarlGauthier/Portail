IF OBJECT_ID ('EnonceCompetence') IS NOT NULL
DROP TABLE EnonceCompetence
GO
CREATE TABLE EnonceCompetence
(	
	idCompetence		INT				NOT NULL	IDENTITY(1,1),

	codeCompetence		VARCHAR(4)		NOT NULL,
	description			VARCHAR(300)	NOT NULL,
	obligatoire			BIT				NOT NULL	DEFAULT(1),
	actif				BIT				NOT NULL	DEFAULT(1),
	specifique			BIT				NOT NULL	DEFAULT(1),	--Général si 0

	idDevis				INT				NOT NULL,	--FK
	
	PRIMARY KEY(idCompetence)
)

IF OBJECT_ID ('ContexteRealisation') IS NOT NULL
DROP TABLE ContexteRealisation
GO
CREATE TABLE ContexteRealisation
(
	idContexte			INT				NOT NULL	IDENTITY(1,1),

	description			VARCHAR(300)	NOT NULL,
	numero				INT				NOT NULL,

	idCompetence		INT				NOT NULL,	--FK

	PRIMARY KEY(idContexte)
)

IF OBJECT_ID ('ElementCompetence') IS NOT NULL
DROP TABLE ElementCompetence
GO
CREATE TABLE ElementCompetence
(
	idElement			INT				NOT NULL	IDENTITY(1,1),

	description			VARCHAR(300)	NOT NULL,
	numero				INT				NOT NULL,

	idCompetence		INT				NOT NULL,	--FK

	PRIMARY KEY (idElement)
)

IF OBJECT_ID ('CriterePerformance') IS NOT NULL
DROP TABLE CriterePerformance
GO
CREATE TABLE CriterePerformance
(
	idCritere			INT				NOT NULL	IDENTITY(1,1),

	description			VARCHAR(300)	NOT NULL,
	numero				INT				NOT NULL,

	idElement			INT				NOT NULL,	--FK

	PRIMARY KEY(idCritere)
)