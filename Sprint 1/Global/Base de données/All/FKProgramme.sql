USE BDPlanCadre
GO

ALTER TABLE tblProgramme
ADD FOREIGN KEY(idCodeProgramme) REFERENCES tblCodeProgramme(idCodeProgramme)