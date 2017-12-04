/* Jeu d'essai créé par Eddy afin de pouvoir tester la gestion /affichage des grilles */
/* En attendant la maj de la bd le champs indicationPedago sert à stocker la catégorie*/ 


/* Suite des inserts des ennoncé de compérences de Fabrice : a replacer au bon endroit dans insertCompetences */

SET IDENTITY_INSERT EnonceCompetence ON
GO
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (13, N'0170', N'Organiser et exploiter des données', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (14, N'0171', N'Corriger des programmes', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (15, N'0173', N'Développer des modèles conceptuels selon l’approche structurée', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (16, N'0174', N'Mettre à profit les possibilités d’un environnement informatique en réseau', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (17, N'0175', N'Créer et exploiter des bases de données', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (18, N'0176', N'Apporter des améliorations fonctionnelles à une application', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (19, N'0177', N'Assurer la qualité d’une application', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (20, N'0178', N'Utiliser des outils de traitements multimédias', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (21, N'0179', N'Assurer soutien technique et formation aux utilisatrices et utilisateurs', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (22, N'017A', N'Mettre en œuvre une application', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (23, N'017B', N'Concevoir et développer une application dans un environnement de base de données', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (24, N'017C', N'Concevoir et développer une application dans un environnement graphique', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (25, N'017D', N'Concevoir et développer une application hypermédia dans des réseaux internes et mondiaux', 1, 1, 1)
SET IDENTITY_INSERT EnonceCompetence OFF
GO

/* Validé */
 


SET IDENTITY_INSERT [PlanCadre] ON
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (2,'420-JBB-JQ','Programmation et introduction aux objets_EF', 2, 4, 2, NULL, NULL,'Spécifique',NULL,NULL,NULL,NULL, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (3,'420-JAC-JQ','Informatique et technologie_EF', 3, 3, 2, NULL, NULL,'Spécifique',NULL,NULL,NULL,NULL, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (4,'420-KCC-JQ','Conception d''interface_EF', 1, 4, 1, NULL, NULL,'Spécifique',NULL,NULL,NULL,NULL, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (5,'420-KEB-JQ','POO Avancée_EF', 1, 4, 1, NULL, NULL,'Spécifique',NULL,NULL,NULL,NULL, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (6,'420-MAT-JQ','Maths_EF', 3, 3, 2, NULL, NULL,'Contributif',NULL,NULL,NULL,NULL, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (7,'601-101-JQ','Écriture et littérature_EF', 2, 2, 3, NULL, NULL,'Générale',NULL,NULL,NULL,NULL, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (8,'601-102-JQ','Littérature et inaginaire_EF', 3, 1, 3, NULL, NULL,'Générale',NULL,NULL,NULL,NULL, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (9,'604-100-MQ','Anglais de base_EF', 2, 1, 3, NULL, NULL,'Générale',NULL,NULL,NULL,NULL, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [elementsConnaissance], [activiteApprentissage], [environnementPhys], [ressource], [idProgramme]) VALUES (10,'604-100-MQ','Anglais adapté_EF', 2, 1, 3, NULL, NULL,'Générale',NULL,NULL,NULL,NULL, 1)
GO
SET IDENTITY_INSERT [PlanCadre] OFF
GO


/* Validé */


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


/* Validé */




SET IDENTITY_INSERT [GrilleCours] ON
GO
INSERT [dbo].[GrilleCours] ([idGrille], [nom]) VALUES (1,'Informatique de gestion')
GO
INSERT [dbo].[GrilleCours] ([idGrille], [nom]) VALUES (2,'Informatique de gestion Dec Bac')
GO
SET IDENTITY_INSERT [GrilleCours] OFF
GO


/* Validé mais débugué en live*/


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

/* Validé !!!!!!!!!!!!!!!!!!! */


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



/* On ne peut pas accéder aux ennoncés compétences de plancadre sans avoir rampli les tables ElementCompetences et PlanCadreElement*/
/* A vérifier si existait déjà ou si je les ai ajouté !!*/

SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (1, N'Caractériser les fonctions de travail et leurs conditions d''exercise', 1, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (2, N'Examiner les tâches et les opérations liées aux fonctions de travail', 2, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (3, N'Examiner les habiletés et les comportements nécessaire a l''exercice des fonctions de travail.', 3, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (4, N'Examiner la réglementation relative à l''exercice de la profession en général', 4, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (5, N'Effectuer des traitements sur des données internes de l’ordinateur', 1, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (6, N'Effectuer des opérations logiques', 2, 2)

SET IDENTITY_INSERT ElementCompetence OFF
GO

/* Validé !!!!!!!!!!!!!!!!!!! */


/* Suite Insert : ajouté le 26 11 2016 */



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


/* Validé */

