-- Insertion des programmes
INSERT INTO DevisMinistere (annee, codeSpecialisation, nbUnite, nom, specialisation, nbHeurefrmGenerale, nbHeurefrmSpecifique, condition, sanction, commentaire, docMinistere_path, dateValidation, codeProgramme) VALUES
('2001','AA','91 2/3', 'Informatique', 'Informatique de gestion', '660', '1980', 'Math�matique 526/Math�matique 536', 'Dipl�me d��tudes coll�giales', NULL, NULL, NULL, '420'),
('2000','A1',NULL,'Int�gration multim�dia',NULL,NULL,NULL,NULL,'Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'582'),
('2001','A0',NULL,'Soins infirmiers',NULL,NULL,NULL,'Math�matique 536','Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'180'),
('2000','C0',NULL,'G�nie Chimique',NULL,NULL,NULL,'Math�matique 526','Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'210')
GO
--select * from EnteteProgramme
--select * from tblProgramme