USE BDtest
GO

-- Insertion des codes des programmes
INSERT INTO tblCodeProgramme(code, commentaire)
VALUES ('420', 'Informatique') 
INSERT INTO tblCodeProgramme(code, commentaire)
VALUES ('582', 'Intégration multimédia') 
INSERT INTO tblCodeProgramme(code, commentaire)
VALUES ('180', 'Soins infirmiers') 
INSERT INTO tblCodeProgramme(code, commentaire)
VALUES ('210', 'Génie Chimique') 

-- Insertion des programmes
INSERT INTO tblProgramme (code, annee, codeSpecialisation, nbUnité, specialisation, nom, formationGeneral, formationSpecifique, condition, sanction, commentaire)
VALUES ('420','2001','AA','91 2/3','Informatique de gestion','Informatique','660','1980','Mathématique 526/Mathématique 536','Diplôme d’études collégiales','')
INSERT INTO tblProgramme (code, annee, codeSpecialisation, nbUnité, specialisation, nom, formationGeneral, formationSpecifique, condition, sanction, commentaire)
VALUES ('582','2000','A1','','','Intégration multimédia','','','','Diplôme d’études collégiales','')
INSERT INTO tblProgramme (code, annee, codeSpecialisation, nbUnité, specialisation, nom, formationGeneral, formationSpecifique, condition, sanction, commentaire)
VALUES ('180','2001','A0','','','Soins infirmiers','','','Mathématique 536','Diplôme d’études collégiales','')
INSERT INTO tblProgramme (code, annee, codeSpecialisation, nbUnité, specialisation, nom, formationGeneral, formationSpecifique, condition, sanction, commentaire)
VALUES ('210','2000','C0','','','Génie Chimique','','','Mathématique 526','Diplôme d’études collégiales','')


select * from tblCodeProgramme
select * from tblProgramme