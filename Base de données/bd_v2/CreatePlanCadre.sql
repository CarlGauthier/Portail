IF OBJECT_ID ('PlanCadre') IS NOT NULL
DROP TABLE PlanCadre
GO
CREATE TABLE PlanCadre
(
    idPlanCadre             INT             NOT NULL        IDENTITY(1,1),

    numeroCours             VARCHAR(10)     NULL,
    titreCours              VARCHAR(150)    NOT NULL,
    prealableAbs            VARCHAR(300)    NULL,
    prealableRel            VARCHAR(300)    NULL,
    indicationPedago        VARCHAR(500)    NULL,
    elementsConnaissance    VARCHAR(500)    NULL,
    activiteApprentissage   VARCHAR(500)    NULL,
    environnementPhys       VARCHAR(300)    NULL,
	ressource               VARCHAR(300)    NULL,
	nbHeureTheorie          INT             NULL,
	nbHeurePratique         INT             NULL,
	nbHeureDevoir           INT             NULL,

    idProgramme				INT             NOT NULL,       --FK

    PRIMARY KEY(idPlanCadre)
);

IF OBJECT_ID ('PlanCadreElement') IS NOT NULL
DROP TABLE PlanCadreElement
GO
CREATE TABLE PlanCadreElement
(
    idPlanCadreElement      INT             NOT NULL        IDENTITY(1,1),

    idPlanCadre             INT             NOT NULL,       --FK
    idElement               INT             NOT NULL,       --FK
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
