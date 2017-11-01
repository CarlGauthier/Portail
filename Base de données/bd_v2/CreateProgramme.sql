IF OBJECT_ID ('Programme') IS NOT NULL
DROP TABLE Programme
GO
CREATE TABLE DevisMinistere
(
	idDevisMinistere		INT				NOT NULL	IDENTITY(1,1),

	codeSpecialisation		VARCHAR(3)		NOT NULL,
	annee					CHAR(4)			NOT NULL,
	nbUnite					VARCHAR(6)		NULL,
	nbHeureFrmGenerale		INT				NULL,
	nbHeureFrmSpecifique	INT				NULL,
	condition				VARCHAR(300)	NULL,
	sanction				VARCHAR(50)		NULL,
	docMinistere_path		VARCHAR(200)	NULL,
	commentaire				VARCHAR(200)	NULL,

	codePrograme			CHAR(3)			NOT NULL,	--FK

	PRIMARY KEY (idDevisMinistere)

);


IF OBJECT_ID ('InstanceProgramme') IS NOT NULL
DROP TABLE InstanceProgramme
GO
CREATE TABLE InstanceProgramme
(
	idInstanceProgramme		INT				NOT NULL	IDENTITY(1,1),

	nomInstance				VARCHAR(50)		NULL,
	commentaire				VARCHAR(200)	NULL,
	dateValidation			DATETIME		NULL,

	idDevisMinistere		INT				NOT NULL,		--FK

	PRIMARY KEY (idInstanceProgramme)
);

IF OBJECT_ID ('EnteteProgramme') IS NOT NULL
DROP TABLE EnteteProgramme
GO
CREATE TABLE EnteteProgramme
(
	codeProgramme		CHAR(3)			NOT NULL,
	commentaire			VARCHAR(200)	NOT NULL,

	PRIMARY KEY(codeProgramme)
);

IF OBJECT_ID ('PlanCadre') IS NOT NULL
DROP TABLE PlanCadre
GO
CREATE TABLE PlanCadre
(
	idPlanCadre			INT				NOT NULL	IDENTITY(1,1),

	NumeroCours			VARCHAR(10)		NULL,
	titreCours			VARCHAR(150)	NOT NULL,
	ponderationH		INT				NULL,
	ponderationCompt	INT				NULL,
	prealableAbs		VARCHAR(300)	NULL,
	prealableRel		VARCHAR(300)	NULL,
	indicationPedago	VARCHAR(500)	NULL,
	elementsConnaisance	VARCHAR(500)	NULL,
	activiteAprentisage	VARCHAR(500)	NULL,
	environementPhys	VARCHAR(300)	NULL,
	ressource			VARCHAR(300)	NULL,
	heureT				INT				NULL,
	heureL				INT				NULL,
	heureD				INT				NULL,

	idInstanceProgramme	INT				NOT NULL,	--FK

	PRIMARY KEY(idPlanCadre)
);

IF OBJECT_ID ('PlanCadreElement') IS NOT NULL
DROP TABLE PlanCadreElement
GO
CREATE TABLE PlanCadreElement
(
	idPlanCadreElement			INT				NOT NULL	IDENTITY(1,1),

	idPlanCadre					INT				NOT NULL,	--FK
	idElement					INT				NOT NULL,	--FK

);