USE BDtest
GO

ALTER TABLE tblProgramme
ADD CONSTRAINT fk_codeProgramme FOREIGN KEY (id)	REFERENCES tblCodeProgramme(id)