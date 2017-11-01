-- Insertion des programmes
INSERT INTO DevisMinistere (annee, codeSpecialisation, nbUnite, nom, specialisation, nbHeurefrmGenerale, nbHeurefrmSpecifique, condition, sanction, commentaire, docMinistere_path, dateValidation, codeProgramme) VALUES
('2001','AA','91 2/3', 'Informatique', 'Informatique de gestion', '660', '1980', 'Mathématique 526/Mathématique 536', 'Diplôme d’études collégiales', NULL, NULL, NULL, '420'),
('2000','A1',NULL,'Intégration multimédia',NULL,NULL,NULL,NULL,'Diplôme d’études collégiales',NULL,NULL,NULL,'582'),
('2001','A0',NULL,'Soins infirmiers',NULL,NULL,NULL,'Mathématique 536','Diplôme d’études collégiales',NULL,NULL,NULL,'180'),
('2000','C0',NULL,'Génie Chimique',NULL,NULL,NULL,'Mathématique 526','Diplôme d’études collégiales',NULL,NULL,NULL,'210')
GO
--select * from EnteteProgramme
--select * from tblProgramme