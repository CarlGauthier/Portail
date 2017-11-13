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