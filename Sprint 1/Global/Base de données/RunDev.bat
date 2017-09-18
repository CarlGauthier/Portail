more CreateDBDev.sql >> sqltemp.sql
more CreateUser.sql >> sqltemp.sql
more InsertUser.sql >> sqltemp.sql
cd All
more CreateCompetence.sql >> ../sqltemp.sql
more CreateProgramme.sql >> ../sqltemp.sql
more FKCompetence.sql >> ../sqltemp.sql
more FKProgramme.sql >> ../sqltemp.sql
more InsertProgramme.sql >> ../sqltemp.sql
cd ../
sqlcmd -S deptinfo420 -E -i sqltemp.sql
del sqltemp.sql
pause