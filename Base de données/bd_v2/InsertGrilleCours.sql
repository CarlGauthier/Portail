/* Jeu d'essai cr�� par Eddy afin de pouvoir tester la gestion /affichage des grilles */
/* En attendant la maj de la bd le champs indicationPedago sert � stocker la cat�gorie*/ 


/* Suite des inserts des ennonc� de comp�rences de Fabrice : a replacer au bon endroit dans insertCompetences */

SET IDENTITY_INSERT EnonceCompetence ON
GO
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (13, N'0170', N'Organiser et exploiter des donn�es', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (14, N'0171', N'Corriger des programmes', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (15, N'0173', N'D�velopper des mod�les conceptuels selon l�approche structur�e', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (16, N'0174', N'Mettre � profit les possibilit�s d�un environnement informatique en r�seau', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (17, N'0175', N'Cr�er et exploiter des bases de donn�es', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (18, N'0176', N'Apporter des am�liorations fonctionnelles � une application', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (19, N'0177', N'Assurer la qualit� d�une application', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (20, N'0178', N'Utiliser des outils de traitements multim�dias', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (21, N'0179', N'Assurer soutien technique et formation aux utilisatrices et utilisateurs', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (22, N'017A', N'Mettre en �uvre une application', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (23, N'017B', N'Concevoir et d�velopper une application dans un environnement de base de donn�es', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (24, N'017C', N'Concevoir et d�velopper une application dans un environnement graphique', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (25, N'017D', N'Concevoir et d�velopper une application hyperm�dia dans des r�seaux internes et mondiaux', 1, 1, 1)
SET IDENTITY_INSERT EnonceCompetence OFF
GO

/* Valid� */
 


SET IDENTITY_INSERT [PlanCadre] ON
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (2,'420-JBB-JQ','Programmation et introduction aux objets_EF', 2, 4, 2, NULL, NULL,'Sp�cifique',NULL,NULL,NULL,NULL, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (3,'420-JAC-JQ','Informatique et technologie_EF', 3, 3, 2, NULL, NULL,'Sp�cifique',NULL,NULL,NULL,NULL, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (4,'420-KCC-JQ','Conception d''interface_EF', 1, 4, 1, NULL, NULL,'Sp�cifique',NULL,NULL,NULL,NULL, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (5,'420-KEB-JQ','POO Avanc�e_EF', 1, 4, 1, NULL, NULL,'Sp�cifique',NULL,NULL,NULL,NULL, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (6,'420-MAT-JQ','Maths_EF', 3, 3, 2, NULL, NULL,'Contributif',NULL,NULL,NULL,NULL, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (7,'601-101-JQ','�criture et litt�rature_EF', 2, 2, 3, NULL, NULL,'G�n�rale',NULL,NULL,NULL,NULL, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (8,'601-102-JQ','Litt�rature et inaginaire_EF', 3, 1, 3, NULL, NULL,'G�n�rale',NULL,NULL,NULL,NULL, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (9,'604-100-MQ','Anglais de base_EF', 2, 1, 3, NULL, NULL,'G�n�rale',NULL,NULL,NULL,NULL, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (10,'604-100-MQ','Anglais adapt�_EF', 2, 1, 3, NULL, NULL,'G�n�rale',NULL,NULL,NULL,NULL, 1)
GO
SET IDENTITY_INSERT [PlanCadre] OFF
GO


/* Valid� */


SET IDENTITY_INSERT [Session] ON
GO
INSERT [dbo].[Session] ([idSession], [nom]) VALUES (1,'I')
GO
INSERT [dbo].[Session] ([idSession], [nom]) VALUES (2,'II')
GO
INSERT [dbo].[Session] ([idSession], [nom]) VALUES (3,'III')
GO
INSERT [dbo].[Session] ([idSession], [nom]) VALUES (4,'IV')
GO
INSERT [dbo].[Session] ([idSession], [nom]) VALUES (5,'V')
GO
INSERT [dbo].[Session] ([idSession], [nom]) VALUES (6,'VI')
GO
SET IDENTITY_INSERT [Session] OFF
GO


/* Valid� */




SET IDENTITY_INSERT [GrilleCours] ON
GO
INSERT [dbo].[GrilleCours] ([idGrille], [nom]) VALUES (1,'Informatique de gestion')
GO
INSERT [dbo].[GrilleCours] ([idGrille], [nom]) VALUES (2,'Informatique de gestion Dec Bac')
GO
SET IDENTITY_INSERT [GrilleCours] OFF
GO


/* Valid� mais d�bugu� en live*/


SET IDENTITY_INSERT [Cours] ON
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (1,1,1,1)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (2,4,1,1)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (3,6,1,1)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (4,7,1,1)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (5,2,1,2)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (6,3,1,2)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (7,5,1,2)
GO
SET IDENTITY_INSERT [Cours] OFF
GO

/* Valid� !!!!!!!!!!!!!!!!!!! */


SET IDENTITY_INSERT [PlanCadreEnonce] ON
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (3, 2, 6, 30)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (4, 2, 7, 45)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (5, 2, 15, 45) 
GO
SET IDENTITY_INSERT [PlanCadreEnonce] OFF
GO



/* On ne peut pas acc�der aux ennonc�s comp�tences de plancadre sans avoir rampli les tables ElementCompetences et PlanCadreElement*/
/* A v�rifier si existait d�j� ou si je les ai ajout� !!*/

SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (1, N'Caract�riser les fonctions de travail et leurs conditions d''exercise', 1, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (2, N'Examiner les t�ches et les op�rations li�es aux fonctions de travail', 2, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (3, N'Examiner les habilet�s et les comportements n�cessaire a l''exercice des fonctions de travail.', 3, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (4, N'Examiner la r�glementation relative � l''exercice de la profession en g�n�ral', 4, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (5, N'Effectuer des traitements sur des donn�es internes de l�ordinateur', 1, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (6, N'Effectuer des op�rations logiques', 2, 2)

SET IDENTITY_INSERT ElementCompetence OFF
GO

/* Valid� !!!!!!!!!!!!!!!!!!! */


/* Suite Insert : ajout� le 26 11 2016 */



SET IDENTITY_INSERT [Cours] ON
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (8,8,1,2)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (9,9,1,1)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (10,10,1,2)
GO
SET IDENTITY_INSERT [Cours] OFF
GO



SET IDENTITY_INSERT [PlanCadreEnonce] ON
GO

INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (6, 3, 2, 45)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (7, 3, 10, 30)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (8, 3, 18, 45) 
GO

INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (9, 4, 2, 45)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (10, 4, 10, 30)
GO

INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (11, 5, 5, 45)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (12, 5, 12, 30)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (13, 5, 13, 45) 
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (14, 6, 3, 75) 
GO

SET IDENTITY_INSERT [PlanCadreEnonce] OFF
GO


/* Valid� */

