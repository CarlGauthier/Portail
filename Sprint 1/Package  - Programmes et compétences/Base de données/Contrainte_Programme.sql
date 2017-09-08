USE BDtest
GO

ALTER TABLE tblProgramme
ADD CONSTRAINT fk_codeProgramme FOREIGN KEY (code)	REFERENCES tblCodeProgramme(code)