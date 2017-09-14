/*Script de Samuel, modifi� par Eddy le 12 septembre
- Ajout du insert path
- Ajout desinsert date de validation du programme
 */

USE BDtest
GO

-- Insertion des codes des programmes
SET IDENTITY_INSERT dbo.tblCodeProgramme ON;
INSERT INTO tblCodeProgramme(id, code, commentaire)
VALUES ('1','420', 'Informatique') 
INSERT INTO tblCodeProgramme(id, code, commentaire)
VALUES ('2','582', 'Int�gration multim�dia') 
INSERT INTO tblCodeProgramme(id, code, commentaire)
VALUES ('3','180', 'Soins infirmiers') 
INSERT INTO tblCodeProgramme(id, code, commentaire)
VALUES ('4','210', 'G�nie Chimique') 
SET IDENTITY_INSERT dbo.tblCodeProgramme OFF;

-- Insertion des programmes
SET IDENTITY_INSERT dbo.tblProgramme ON;
INSERT INTO tblProgramme (id, code, annee, codeSpecialisation, nbUnit�, specialisation, nom, formationGeneral, formationSpecifique, condition, sanction, commentaire, pathDocMinistere, dateValidation)
VALUES ('1','420','2001','AA','91 2/3','Informatique de gestion','Informatique','660','1980','Math�matique 526/Math�matique 536','Dipl�me d��tudes coll�giales','','test',null) 
INSERT INTO tblProgramme (id, code, annee, codeSpecialisation, nbUnit�, specialisation, nom, formationGeneral, formationSpecifique, condition, sanction, commentaire, pathDocMinistere, dateValidation)
VALUES ('2','582','2000','A1','','','Int�gration multim�dia','','','','Dipl�me d��tudes coll�giales','',null,null)
INSERT INTO tblProgramme (id, code, annee, codeSpecialisation, nbUnit�, specialisation, nom, formationGeneral, formationSpecifique, condition, sanction, commentaire, pathDocMinistere, dateValidation)
VALUES ('3','180','2001','A0','','','Soins infirmiers','','','Math�matique 536','Dipl�me d��tudes coll�giales','',null,null)
INSERT INTO tblProgramme (id, code, annee, codeSpecialisation, nbUnit�, specialisation, nom, formationGeneral, formationSpecifique, condition, sanction, commentaire, pathDocMinistere, dateValidation)
VALUES ('4','210','2000','C0','','','G�nie Chimique','','','Math�matique 526','Dipl�me d��tudes coll�giales','',null,null)
SET IDENTITY_INSERT dbo.tblProgramme OFF;

select * from tblCodeProgramme
select * from tblProgramme