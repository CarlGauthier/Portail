CREATE TABLE tblEnonceCompetence
(	
	idCompetence		INT				NOT NULL	IDENTITY(1,1),

	codeCompetence		VARCHAR(4)		NOT NULL,
	enonceCompetence	VARCHAR(150)	NOT NULL,
	motClef				VARCHAR(30)		NULL,
	obligatoire			BIT				NOT NULL	DEFAULT(1),
	actif				BIT				NOT NULL	DEFAULT(1),
	commentaire			VARCHAR(200)	NULL,

	idProgramme			INT				NOT NULL,	--FK
	
	PRIMARY KEY(idCompetence)
)

CREATE TABLE tblContexteRealisation
(
	idContexte			INT				NOT NULL	IDENTITY(1,1),

	contexteRealisation	VARCHAR(150)	NOT NULL,
	commentaire			VARCHAR(200)	NULL,

	idCompetence		INT		NOT NULL,	--FK

	PRIMARY KEY(idContexte)
)

CREATE TABLE tblElementCompetence
(
	idElement			INT				NOT NULL	IDENTITY(1,1),

	element				VARCHAR(150)	NOT NULL,
	numero				INT				NOT NULL,
	motClef				VARCHAR(30)		NULL,
	commentaire			VARCHAR(200)	NULL,

	idCompetence		INT				NOT NULL,	--FK

	PRIMARY KEY (idElement)
)

CREATE TABLE tblCriterePerformance
(
	idCritere			INT				NOT NULL	IDENTITY(1,1),

	criterePerformance	VARCHAR(150)	NOT NULL,
	numero				INT				NOT NULL,
	commentaire			VARCHAR(200)	NULL,

	idElement			INT				NOT NULL,	--FK

	PRIMARY KEY(idCritere)
)