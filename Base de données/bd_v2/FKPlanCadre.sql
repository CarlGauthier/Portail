ALTER TABLE PlanCadre
ADD FOREIGN KEY(idProgramme) REFERENCES Programme(idProgramme)

ALTER TABLE PlanCadreElement
ADD FOREIGN KEY(idPlanCadre) REFERENCES PlanCadre(idPlanCadre)

ALTER TABLE PlanCadreElement
ADD FOREIGN KEY(idElement) REFERENCES ElementCompetence(idElement)

ALTER TABLE PlanCadreEnonce
ADD FOREIGN KEY(idPlanCadre) REFERENCES PlanCadre(idPlanCadre)

ALTER TABLE PlanCadreEnonce
ADD FOREIGN KEY(idCompetence) REFERENCES EnonceCompetence(idCompetence)

ALTER TABLE PlanCadreElement
ADD FOREIGN KEY(idElementConnaissance) REFERENCES ElementConnaissance(idElementConnaissance)

ALTER TABLE ElementConnaissance
ADD FOREIGN KEY (idActiviteApprentissage) REFERENCES ActiviteApprentissage(idActiviteApprentissage)
