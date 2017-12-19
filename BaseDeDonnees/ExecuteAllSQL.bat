chcp 1252
del sqltemp.sql
more CreateDB.sql >> sqltemp.sql
more CreateCompetence.sql >> sqltemp.sql
more CreateProgramme.sql >> sqltemp.sql
more CreatePlanCadre.sql >> sqltemp.sql
more CreateGrille.sql >> sqltemp.sql
more CreateUser.sql >> sqltemp.sql
more FKCompetence.sql >> sqltemp.sql
more FKProgramme.sql >> sqltemp.sql
more FKPlanCadre.sql >> sqltemp.sql
more FKGrille.sql >> sqltemp.sql
more InsertProgramme.sql >> sqltemp.sql
more InsertCompetence.sql >> sqltemp.sql
more InsertPlanCadre.sql >> sqltemp.sql
more InsertGrilleCours.sql >> sqltemp.sql
more InsertUser.sql >> sqltemp.sql
more triggerDate.sql >> sqltemp.sql
sqlcmd -S --NOM DU SERVEUR-- -E -i sqltemp.sql
del sqltemp.sql
pause