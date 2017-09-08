CREATE TABLE tblEnonceCompetence
(
	codeCompetence		VARCHAR(10)		NOT NULL,

	enonceCompetence	VARCHAR(100)	NOT NULL,
	motClef				VARCHAR(30)		NOT NULL,
	obligatoire			BIT				NOT NULL,
	actif				BIT				NOT NULL	DEFAULT(1),
	commentaire			VARCHAR(200)	NULL,

	idProgramme			INT				NOT NULL,	--FK
	
	PRIMARY KEY(codeCompetence)
)

CREATE TABLE tblContexteRealisation
(
	idContexte			INT				NOT NULL	IDENTITY(1,1),

	contexteRealisation	VARCHAR(150)	NOT NULL,
	commentaire			VARCHAR(200)		NULL,

	codeCompetence		VARCHAR(10)		NOT NULL,	--FK

	PRIMARY KEY(idContexte)
)

CREATE TABLE tblElementCompetence
(
	idElement			INT				NOT NULL	IDENTITY(1,1),

	element				VARCHAR(150)	NOT NULL,
	numero				INT				NOT NULL,
	motClef				VARCHAR(30)		NOT NULL,
	commentaire			VARCHAR(200)	NULL,

	codeCompetence		VARCHAR(10)		NOT NULL,	--FK

	PRIMARY KEY (idElement)
)

CREATE TABLE tblCriterePerformance
(
	idCritere			INT				NOT NULL	IDENTITY(1,1),

	criterePerformance	VARCHAR(150)	NOT NULL,
	numeroPere			INT				NOT NULL,
	numero				INT				NOT NULL,
	motClef				VARCHAR(30)		NOT NULL,
	commentaire			VARCHAR(200)	NULL,

	idElement			INT				NOT NULL,	--FK

	PRIMARY KEY(idCritere)
)