ALTER TABLE tblEnonceCompetence
ADD FOREIGN KEY(idProgramme) REFERENCES tblProgramme(idProgramme)

ALTER TABLE tblContexteRealisation
ADD FOREIGN KEY(idCompetence)REFERENCES tblEnonceCompetence(idCompetence)

ALTER TABLE tblElementCompetence
ADD FOREIGN KEY(idCompetence) REFERENCES tblEnonceCompetence(idCompetence)

ALTER TABLE tblCriterePerformance
ADD FOREIGN KEY(idElement) REFERENCES tblElementCompetence(idElement)