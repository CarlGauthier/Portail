Requetes nécessaire à la gestion des grilles

use BDPlanCadreV2

select * from dbo.PlanCadre

/* Liste des code compétences pour l'entête */
select codeCompetence from EnonceCompetence 

/* Liste des cours d'une grille */		
select PC.titreCours from dbo.GrilleCours AS GC 
	JOIN dbo.Cours AS C
		ON GC.idGrille = C.idGrille
	JOIN dbo.PlanCadre AS PC
		ON PC.idPlanCadre = C.idPlanCadre
		WHERE GC.idGrille = 1
		
/* Liste des cours d'une grille d'une session */		
select PC.titreCours from dbo.GrilleCours AS GC 
	JOIN dbo.Cours AS C
		ON GC.idGrille = C.idGrille
	JOIN dbo.PlanCadre AS PC
		ON PC.idPlanCadre = C.idPlanCadre
	JOIN Session AS S
		ON S.idSession = C.idSession
		WHERE GC.idGrille = 1 and C.idSession = 1
		
		



/* Récupère les numéro des ennonces de compétences par matière*/	

select * from dbo.EnonceCompetence AS EC 
	JOIN dbo.PlanCadreEnonce AS PCE
		ON EC.idCompetence = PCE.idCompetence
	JOIN dbo.PlanCadre AS PC
		ON PC.idPlanCadre = PCE.idPlanCadre 
		where PC.idPlanCadre = 2


	
	
	
select * from dbo.GrilleCours AS GC 
	JOIN dbo.Cours AS C
		ON GC.idGrille = C.idGrille
	JOIN dbo.Session AS S
		ON S.idSession = C.idSession
	JOIN PlanCadre AS PC
		ON PC.idPlanCadre = C.idPlanCadre
	JOIN Programme AS P
		 ON P.idProgramme = PC.idProgramme
	JOIN PlanCadreEnonce AS PCE
		ON PCE.idPlanCadre = PC.idPlanCadre
	JOIN EnonceCompetence AS EC
		ON EC.idCompetence = PCE.idCompetence 


		
		
		
		
select PC.titreCours from dbo.GrilleCours AS GC 
	JOIN dbo.Cours AS C
		ON GC.idGrille = C.idGrille
	JOIN dbo.Session AS S
		ON S.idSession = C.idSession
	JOIN PlanCadre AS PC
		ON PC.idPlanCadre = C.idPlanCadre
	JOIN Programme AS P
		 ON P.idProgramme = PC.idProgramme
	JOIN PlanCadreEnonce AS PCE
		ON PCE.idPlanCadre = PC.idPlanCadre
	JOIN EnonceCompetence AS EC
		ON EC.idCompetence = PCE.idCompetence 
		WHERE GC.idGrille = 1
		
		
/* Les totaux*/

/* Première ligne du tableau !*/

select EC.codeCompetence, SUM(PCE.ponderationEnHEure) as Total 
	from PlanCadreEnonce as PCE
		join EnonceCompetence as EC
		on PCE.idCompetence = EC.idCompetence
		group by  EC.codeCompetence, PCE.idCompetence

/* Dernière colonne du tableau !*/


select PC.TitreCours, SUM(PCE.ponderationEnHEure) as Total 
	from PlanCadreEnonce as PCE
		join PlanCadre as PC
		on PC.idPlanCadre = PCE.idPlanCadre
		group by  PC.TitreCours, PCE.idCompetence
	
	
/* Les préalables */


		