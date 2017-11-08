

/* Partie à Fabrice : provisoire en attendant sa version et l'actualisation du projet */
CREATE TABLE PlanCadre
{
	idCours				INT				NOT NULL	IDENTITY(1,1),
	
	numeroCours			VARCHAR(10)		NOT NULL,
	titreCours			VARCHAR(50)		NOT NULL,
	ponderation1		INT				NOT NULL,
	ponderation2		INT				NOT NULL,
	ponderation3		INT				NOT NULL,
	PRIMARY KEY(idCours)	
}

CREATE TABLE GrilleCours
{
	idGrille			INT				NOT NULL	IDENTITY(1,1),
	nomGrille			VARCHAR(50)		NOT NULL,
	PRIMARY KEY(idGrille)	
}

CREATE TABLE SessionCours 												/* session = mot réservé */
{
	idSession			INT				NOT NULL	IDENTITY(1,1),
	PRIMARY KEY(idSession)
}

CREATE TABLE GrillePlanCadre /* Faut-il une clé primaire ?*/
{
	idCours				INT				NOT NULL,
	idGrille			INT				NOT NULL,
	idSession			INT				NOT NULL,
}


/* Placer dans un autre script */
ALTER TABLE GrillePlanCadre
ADD FOREIGN KEY(idSession) REFERENCES SessionCours(idSession)

ALTER TABLE GrillePlanCadre
ADD FOREIGN KEY(idGrille) REFERENCES GrilleCours(idGrille)

ALTER TABLE GrillePlanCadre
ADD FOREIGN KEY(idCours) REFERENCES PlanCadre(idCours)


/*
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
*/
