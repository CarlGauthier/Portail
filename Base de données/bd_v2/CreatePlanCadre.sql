IF OBJECT_ID ('PlanCadre') IS NOT NULL
DROP TABLE PlanCadre
GO
CREATE TABLE PlanCadre
(
    idPlanCadre             INT             NOT NULL        IDENTITY(1,1),

    numeroCours             VARCHAR(10)     NULL,
    titreCours              VARCHAR(150)    NOT NULL,
    indicationPedago        TEXT			NULL,
    environnementPhys       TEXT			NULL,
	ressource               TEXT			NULL,
	nbHeureTheorie          INT             NULL,
	nbHeurePratique         INT             NULL,
	nbHeureDevoir           INT             NULL,

    idProgramme				INT             NOT NULL,       --FK
	idType					INT				NOT NULL,		--FK

    PRIMARY KEY(idPlanCadre)
);

IF OBJECT_ID ('PlanCadrePrealable') IS NOT NULL
DROP TABLE PlanCadrePrealable
GO
CREATE TABLE PlanCadrePrealable
(
    idPlanCadrePrealable	INT             NOT NULL        IDENTITY(1,1),

    idPlanCadre			    INT				NOT NULL,		--FK
	idPrealable			    INT				NOT NULL,		--FK
	idStatus				INT				NOT NULL		--FK			DEFAULT(),

	PRIMARY KEY(idPlanCadrePrealable)
);

IF OBJECT_ID ('StatusPrealable') IS NOT NULL
DROP TABLE StatusPrealable
GO
CREATE TABLE StatusPrealable
(
    idStatus				INT             NOT NULL        IDENTITY(1,1),

    status					VARCHAR(20)		NOT NULL,

	PRIMARY KEY(idStatus)
);

IF OBJECT_ID ('TypePlanCadre') IS NOT NULL
DROP TABLE TypePlanCadre
GO
CREATE TABLE TypePlanCadre
(
    idType					INT             NOT NULL        IDENTITY(1,1),

    nom			            VARCHAR(20)     NOT NULL,

	PRIMARY KEY(idType)
);

IF OBJECT_ID ('PlanCadreElement') IS NOT NULL
DROP TABLE PlanCadreElement
GO
CREATE TABLE PlanCadreElement
(
    
    idPlanCadreElement      INT             NOT NULL        IDENTITY(1,1),

    idPlanCadre             INT             NOT NULL,       --FK
    idElement               INT             NOT NULL,       --FK
	idElementConnaissance	INT				NULL,		--FK
);

IF OBJECT_ID ('PlanCadreEnonce') IS NOT NULL
DROP TABLE PlanCadreEnonce
GO
CREATE TABLE PlanCadreEnonce
(
    idPlanCadreEnonce		INT             NOT NULL        IDENTITY(1,1),

	ponderationEnHeure      INT             NOT NULL,

    idPlanCadre             INT             NOT NULL,       --FK
    idCompetence			INT				NOT NULL,       --FK
);
IF OBJECT_ID ('ElementConnaissance') IS NOT NULL
DROP TABLE ElementConnaissance
GO
CREATE TABLE ElementConnaissance
(
    idElementConnaissance				INT             NOT NULL        IDENTITY(1,1),
	description							TEXT            NOT NULL,

    idActiviteApprentissage				INT				NULL,		--FK

	PRIMARY KEY(idElementConnaissance)
);

IF OBJECT_ID ('ActiviteApprentissage') IS NOT NULL
DROP TABLE ActiviteApprentissage
GO
CREATE TABLE ActiviteApprentissage
(
    idActiviteApprentissage					INT             NOT NULL        IDENTITY(1,1),
	description								TEXT            NOT NULL,

	PRIMARY KEY(idActiviteApprentissage)
);
