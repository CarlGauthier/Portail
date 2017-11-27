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

ALTER TABLE PlanCadreEnonce
ADD FOREIGN KEY(idPlanCadre) REFERENCES PlanCadre(idPlanCadre)

ALTER TABLE PlanCadreEnonce
ADD FOREIGN KEY(idCompetence) REFERENCES EnonceCompetence(idCompetence)