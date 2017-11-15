--Créé par Eddy
--Le 01/11/2017

IF OBJECT_ID ('GrilleCours') IS NOT NULL
DROP TABLE GrilleCours
GO
CREATE TABLE GrilleCours
(
	idGrille			INT				NOT NULL	IDENTITY(1,1),

	nom					VARCHAR(50)		NOT NULL,

	PRIMARY KEY(idGrille)	
)

IF OBJECT_ID ('Session') IS NOT NULL
DROP TABLE Session
GO
CREATE TABLE Session
(
	idSession			INT				NOT NULL	IDENTITY(1,1),

	nom					VARCHAR(30)		NOT NULL,

	PRIMARY KEY(idSession)
)

IF OBJECT_ID ('Cours') IS NOT NULL
DROP TABLE Cours
GO
CREATE TABLE Cours
(
	idCours				INT				NOT NULL	IDENTITY(1,1),

	idPlanCadre			INT				NOT NULL,	--FK
	idGrille			INT				NOT NULL,	--FK
	idSession			INT				NOT NULL,	--FK

	PRIMARY KEY(idCours)
)