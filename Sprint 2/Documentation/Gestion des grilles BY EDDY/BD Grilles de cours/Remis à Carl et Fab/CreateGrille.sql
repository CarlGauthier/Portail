/* Créé par Eddy
Le 01/11/2017*/



CREATE TABLE GrilleCours
{
	idGrille			INT				NOT NULL	IDENTITY(1,1),
	nomGrille			VARCHAR(50)		NOT NULL,
	PRIMARY KEY(idGrille)	
}

CREATE TABLE SessionCours 	/* session = mot réservé */
{
	idSession			INT				NOT NULL	IDENTITY(1,1),
	PRIMARY KEY(idSession)
}

CREATE TABLE GrillePlanCadre /* Syntaxe clé primaire composée ?*/
{
	idCours				INT				NOT NULL,
	idGrille			INT				NOT NULL,
	idSession			INT				NOT NULL
}
