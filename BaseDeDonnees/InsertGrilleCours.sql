

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


SET IDENTITY_INSERT [GrilleCours] ON
GO
INSERT [dbo].[GrilleCours] ([idGrille], [nom]) VALUES (1,'Informatique de gestion')
GO
INSERT [dbo].[GrilleCours] ([idGrille], [nom]) VALUES (2,'Informatique de gestion Dec Bac')
GO
SET IDENTITY_INSERT [GrilleCours] OFF
GO




SET IDENTITY_INSERT [Cours] ON
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (1,1,1,1)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (2,13,1,1)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (3,15,1,1)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (4,16,1,1)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (5,11,1,2)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (6,12,1,2)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (7,14,1,2)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (8,17,1,2)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (9,18,1,1)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (10,19,1,2)
GO


INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (11,3,2,1)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (12,2,2,1)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (13,7,2,1)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (14,19,2,1)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (15,5,2,2)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (16,6,2,2)
GO
/*
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (17,7,2,2)
GO
*/
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (18,4,2,2)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (19,10,2,2)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (20,15,2,2)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (21,16,2,3)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (22,9,2,3)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (23,8,2,3)
GO
INSERT [dbo].[Cours] ([idCours], [idPlanCadre], [idGrille], [idSession]) VALUES (24,18,2,3)
GO
SET IDENTITY_INSERT [Cours] OFF
GO

/* Validé !!!!!!!!!!!!!!!!!!! */


/* Clés primaires idPlanCadre changées par rapport à mon premier modele  */


SET IDENTITY_INSERT [PlanCadreEnonce] ON
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (3, 11, 6, 30)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (4, 11, 7, 45)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (5, 11, 15, 45) 
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (6, 12, 2, 45)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (7, 12, 10, 30)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (8, 12, 18, 45) 
GO

INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (9, 13, 2, 45)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (10, 13, 10, 30)
GO

INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (11, 14, 5, 45)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (12, 14, 12, 30)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (13, 14, 13, 45) 
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (14, 15, 3, 75) 
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (15, 10, 6, 15) 
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (16, 10, 7, 15) 
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (17, 10, 7, 15) 
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (18, 2, 21, 30) 
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (19, 2, 23, 30) 
GO

/* Ajout des données PlanCadreEnonce pour les PC insérés par Fred  

INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (15, 2, 24, 30) 
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (16, 2, 4, 15) */
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (20, 3, 5, 15) 
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (21, 3, 10, 15) 
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (22, 3, 18, 15) 
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (23, 5, 17, 30) 
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (24, 5, 18, 15) 
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (25, 8, 8, 75) 
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (26, 9, 22, 30) 
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (27, 9, 23, 30) 
GO
SET IDENTITY_INSERT [PlanCadreEnonce] OFF
GO





