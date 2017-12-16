/* Créé par Eddy
Le 01/11/2017*/



ALTER TABLE GrillePlanCadre
ADD FOREIGN KEY(idSession) REFERENCES SessionCours(idSession)

ALTER TABLE GrillePlanCadre
ADD FOREIGN KEY(idGrille) REFERENCES GrilleCours(idGrille)

ALTER TABLE GrillePlanCadre
ADD FOREIGN KEY(idCours) REFERENCES PlanCadre(idCours)


