INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (180, 'Soins infirmiers')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (200, 'Sciences de a nature')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (210, 'Chimie')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (221, 'Mécanique du bâtiment')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (222, 'Aménagement et urbanisme')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (235, 'Génie mécanique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (241, 'Génie mécanique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (243, 'Électronique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (260, 'Environnement, hygiène')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (300, 'Sciences humaines')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (322, 'Éducation à l''enfance')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (351, 'Éducation spécialisée')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (388, 'Travail social')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (410, 'Techniques administrative')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (412, 'Bureautique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (420, 'Informatique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (500, 'Arts, lettres et communication')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (510, 'Arts visuels')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (582, 'Intégration multimédia')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (589, 'Art et technologie des médias')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (700, 'Sciences, lettres et arts')
GO

SET IDENTITY_INSERT [DevisMinistere] ON
GO
INSERT [dbo].[DevisMinistere] ([idDevis], [codeSpecialisation], [specialisation], [annee], [nbUnite], [nbHeureFrmGenerale], [nbHeureFrmSpecifique], [condition], [sanction], [docMinistere], [codeProgramme]) VALUES (1, N'A1', 'Informatique de gestion', 2000, '91 2/3', 660, 1980, N'Mathématique 536', N'Diplôme Etude Secondaire', NULL, 420)
GO
SET IDENTITY_INSERT [DevisMinistere] OFF
GO
SET IDENTITY_INSERT [Programme] ON
GO
INSERT [dbo].[Programme] ([idProgramme], [nom], [annee], [dateValidation], [idDevis]) VALUES (1,'Le nouveau programme' , 2007, NULL, 1)
GO
SET IDENTITY_INSERT [Programme] OFF
GO