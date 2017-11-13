--Créé par Eddy
--Le 01/11/2017

ALTER TABLE Cours
ADD FOREIGN KEY(idPlanCadre) REFERENCES PlanCadre(idPlanCadre)

ALTER TABLE Cours
ADD FOREIGN KEY(idGrille) REFERENCES GrilleCours(idGrille)

ALTER TABLE Cours
ADD FOREIGN KEY(idSession) REFERENCES Session(idSession)