ALTER TABLE DevisMinistere
ADD FOREIGN KEY(codeProgramme) REFERENCES EnteteProgramme(codeProgramme)

ALTER TABLE Programme
ADD FOREIGN KEY(idDevis) REFERENCES DevisMinistere(idDevis)