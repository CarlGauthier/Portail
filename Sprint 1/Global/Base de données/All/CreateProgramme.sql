IF OBJECT_ID ('Programme') IS NOT NULL
DROP TABLE Programme
GO
CREATE TABLE Programme
(
	idProgramme				INT				NOT NULL	IDENTITY(1,1),

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

	codeProgramme		CHAR(3)				NOT NULL,		--FK

	PRIMARY KEY (idProgramme)
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
