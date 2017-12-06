ALTER TABLE PlanCadre
ADD FOREIGN KEY(idProgramme) REFERENCES Programme(idProgramme)

ALTER TABLE PlanCadre
ADD FOREIGN KEY(idType) REFERENCES TypePlanCadre(idType)

ALTER TABLE PlanCadrePrealable
ADD FOREIGN KEY(idPlanCadre) REFERENCES PlanCadre(idPlanCadre)

ALTER TABLE PlanCadrePrealable
ADD FOREIGN KEY(idPrealable) REFERENCES PlanCadre(idPlanCadre)

ALTER TABLE PlanCadrePrealable
ADD FOREIGN KEY(idStatus) REFERENCES StatusPrealable(idStatus)

ALTER TABLE PlanCadreElement
ADD FOREIGN KEY(idPlanCadre) REFERENCES PlanCadre(idPlanCadre)

ALTER TABLE PlanCadreElement
ADD FOREIGN KEY(idElement) REFERENCES ElementCompetence(idElement)

ALTER TABLE PlanCadreElement
ADD FOREIGN KEY(idElementConnaissance) REFERENCES ElementConnaissance(idElementConnaissance)

ALTER TABLE PlanCadreEnonce
ADD FOREIGN KEY(idPlanCadre) REFERENCES PlanCadre(idPlanCadre)

ALTER TABLE PlanCadreEnonce
ADD FOREIGN KEY(idCompetence) REFERENCES EnonceCompetence(idCompetence)

ALTER TABLE ElementConnaissance
ADD FOREIGN KEY (idActiviteApprentissage) REFERENCES ActiviteApprentissage(idActiviteApprentissage)

ALTER TABLE ElementConnaissance
ADD FOREIGN KEY (idActivite) REFERENCES ActiviteApprentissage(idActivite)
