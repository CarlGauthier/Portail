USE BDPlanCadre
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
INSERT INTO tblProgramme (code, annee, nom, nbUnite, codeSpecialisation, specialisation, nbHeurefrmGenerale, nbHeurefrmSpecifique, condition, sanction, commentaire, docMinistere_path, dateValidation, idCodeProgramme) VALUES
('420','2001','Informatique','91 2/3', 'AA', 'Informatique de gestion', '660', '1980', 'Mathématique 526/Mathématique 536', 'Diplôme d’études collégiales', NULL, NULL, NULL, '1')
--('582','2000','A1',NULL,'Intégration multimédia',NULL,NULL,NULL,NULL,'Diplôme d’études collégiales',NULL,NULL,NULL,'2'),
--('180','2001','A0',NULL,'Soins infirmiers',NULL,NULL,NULL,'Mathématique 536','Diplôme d’études collégiales',NULL,NULL,NULL,'3'),
--('210','2000','C0',NULL,'Génie Chimique',NULL,NULL,NULL,'Mathématique 526','Diplôme d’études collégiales',NULL,NULL,NULL,'4')

--select * from tblCodeProgramme
--select * from tblProgramme