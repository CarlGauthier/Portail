USE BDPlanCadre
GO 

IF OBJECT_ID ('tblProgramme') IS NOT NULL
DROP TABLE tblProgramme
GO
CREATE TABLE tblProgramme
(
	idProgramme				INT				NOT NULL	IDENTITY(1,1),

	code					CHAR(3)			NOT NULL	UNIQUE,
	annee					CHAR(4)			NOT NULL,
	nom						VARCHAR(50)		NULL,
	nbUnite					VARCHAR(6)		NULL,
	codeSpecialisation		VARCHAR(3)		NOT NULL,
	specialisation			VARCHAR(30)		NULL,
	nbHeurefrmGenerale		INT				NULL,
	nbHeurefrmSpecifique	INT				NULL,
	condition				VARCHAR(300)	NULL,
	sanction				VARCHAR(50)		NULL,
	commentaire				VARCHAR(200)	NULL,
	docMinistere_path		VARCHAR(200)	NULL,
	dateValidation			DATETIME		NULL,

	idCodeProgramme			INT				NOT NULL	UNIQUE,		--FK

	PRIMARY KEY (idProgramme)
);

IF OBJECT_ID ('tblCodeProgramme') IS NOT NULL
DROP TABLE tblCodeProgramme
GO
CREATE TABLE tblCodeProgramme
(
	idCodeProgramme		INT				NOT NULL	IDENTITY(1,1),
		
	code				CHAR(3)			NOT NULL	UNIQUE,
	commentaire			VARCHAR(200)	NULL,

	PRIMARY KEY(idCodeProgramme)
);
