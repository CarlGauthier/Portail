USE BDtest
GO

-- Insertion des codes des programmes
INSERT INTO tblCodeProgramme(code, commentaire)
VALUES ('420', 'Informatique') 
INSERT INTO tblCodeProgramme(code, commentaire)
VALUES ('582', 'Int�gration multim�dia') 
INSERT INTO tblCodeProgramme(code, commentaire)
VALUES ('180', 'Soins infirmiers') 
INSERT INTO tblCodeProgramme(code, commentaire)
VALUES ('210', 'G�nie Chimique') 

-- Insertion des programmes
INSERT INTO tblProgramme (code, annee, codeSpecialisation, nbUnit�, specialisation, nom, formationGeneral, formationSpecifique, condition, sanction, commentaire)
VALUES ('420','2001','AA','91 2/3','Informatique de gestion','Informatique','660','1980','Math�matique 526/Math�matique 536','Dipl�me d��tudes coll�giales','')
INSERT INTO tblProgramme (code, annee, codeSpecialisation, nbUnit�, specialisation, nom, formationGeneral, formationSpecifique, condition, sanction, commentaire)
VALUES ('582','2000','A1','','','Int�gration multim�dia','','','','Dipl�me d��tudes coll�giales','')
INSERT INTO tblProgramme (code, annee, codeSpecialisation, nbUnit�, specialisation, nom, formationGeneral, formationSpecifique, condition, sanction, commentaire)
VALUES ('180','2001','A0','','','Soins infirmiers','','','Math�matique 536','Dipl�me d��tudes coll�giales','')
INSERT INTO tblProgramme (code, annee, codeSpecialisation, nbUnit�, specialisation, nom, formationGeneral, formationSpecifique, condition, sanction, commentaire)
VALUES ('210','2000','C0','','','G�nie Chimique','','','Math�matique 526','Dipl�me d��tudes coll�giales','')


select * from tblCodeProgramme
select * from tblProgramme