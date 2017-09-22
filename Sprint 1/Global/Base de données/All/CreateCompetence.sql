CREATE TABLE EnonceCompetence
(	
	idCompetence		INT				NOT NULL	IDENTITY(1,1),

	codeCompetence		VARCHAR(4)		NOT NULL,
	enonceCompetence	VARCHAR(300)	NOT NULL,
	motClef				VARCHAR(30)		NULL,
	obligatoire			BIT				NOT NULL	DEFAULT(1),
	actif				BIT				NOT NULL	DEFAULT(1),
	commentaire			VARCHAR(200)	NULL,

	idProgramme			INT				NOT NULL,	--FK
	
	PRIMARY KEY(idCompetence)
)

CREATE TABLE ContexteRealisation
(
	idContexte			INT				NOT NULL	IDENTITY(1,1),

	contexteRealisation	VARCHAR(300)	NOT NULL,
	commentaire			VARCHAR(200)	NULL,

	idCompetence		INT		NOT NULL,	--FK

	PRIMARY KEY(idContexte)
)

CREATE TABLE ElementCompetence
(
	idElement			INT				NOT NULL	IDENTITY(1,1),

	element				VARCHAR(300)	NOT NULL,
	numero				INT				NOT NULL,
	motClef				VARCHAR(30)		NULL,
	commentaire			VARCHAR(200)	NULL,

	idCompetence		INT				NOT NULL,	--FK

	PRIMARY KEY (idElement)
)

CREATE TABLE CriterePerformance
(
	idCritere			INT				NOT NULL	IDENTITY(1,1),

	criterePerformance	VARCHAR(300)	NOT NULL,
	numero				INT				NOT NULL,
	commentaire			VARCHAR(200)	NULL,

	idElement			INT				NOT NULL,	--FK

	PRIMARY KEY(idCritere)
)