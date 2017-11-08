IF OBJECT_ID ('Programme') IS NOT NULL
DROP TABLE Programme
GO
CREATE TABLE DevisMinistere
(
        idDevis			        INT             NOT NULL        IDENTITY(1,1),

        annee                   CHAR(4)         NOT NULL,
        nbUnite					VARCHAR(6)      NULL,
        nbHeureFrmGenerale      INT             NULL,
        nbHeureFrmSpecifique    INT             NULL,
        condition               VARCHAR(300)    NULL,
        sanction                VARCHAR(50)     NULL,
        docMinistere			VARCHAR(200)    NULL,

        codeProgramme			CHAR(3)         NOT NULL,       --FK

        PRIMARY KEY (idDevis)
);

IF OBJECT_ID ('Programme') IS NOT NULL
DROP TABLE Programme
GO
CREATE TABLE Programme
(
        idProgramme             INT             NOT NULL        IDENTITY(1,1),

        nom						VARCHAR(50)     NULL,
		annee                   CHAR(4)         NOT NULL,
		codeSpecialisation      VARCHAR(3)      NOT NULL,
		specialisation			VARCHAR(30)		NULL,
        dateValidation          DATETIME        NULL,

        idDevis        			INT             NOT NULL,		--FK

        PRIMARY KEY (idProgramme)
);

IF OBJECT_ID ('EnteteProgramme') IS NOT NULL
DROP TABLE EnteteProgramme
GO
CREATE TABLE EnteteProgramme
(
        codeProgramme           CHAR(3)         NOT NULL,
        nom			            VARCHAR(200)    NOT NULL,

        PRIMARY KEY(codeProgramme)
);
