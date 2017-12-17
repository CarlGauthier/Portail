INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (180, 'Soins infirmiers')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (200, 'Sciences de a nature')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (210, 'Chimie')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (221, 'M�canique du b�timent')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (222, 'Am�nagement et urbanisme')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (235, 'G�nie m�canique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (241, 'G�nie m�canique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (243, '�lectronique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (260, 'Environnement, hygi�ne')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (300, 'Sciences humaines')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (322, '�ducation � l''enfance')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (351, '�ducation sp�cialis�e')
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
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (582, 'Int�gration multim�dia')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (589, 'Art et technologie des m�dias')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [nom]) VALUES (700, 'Sciences, lettres et arts')
GO

SET IDENTITY_INSERT [DevisMinistere] ON
GO
INSERT [dbo].[DevisMinistere] ([idDevis], [codeSpecialisation], [specialisation], [annee], [nbUnite], [nbHeureFrmGenerale], [nbHeureFrmSpecifique], [condition], [sanction], [docMinistere], [codeProgramme]) VALUES (1, N'A1', 'Informatique de gestion', 2000, '91 2/3', 660, 1980, N'Math�matique 536', N'Dipl�me Etude Secondaire', NULL, 420)
GO
SET IDENTITY_INSERT [DevisMinistere] OFF
GO
SET IDENTITY_INSERT [Programme] ON
GO
INSERT [dbo].[Programme] ([idProgramme],[nom], [annee], [dateValidation],[statusValider], [idDevis]) VALUES (1,'l''ancien programme', 2007, NULL, 0, 1)
GO
SET IDENTITY_INSERT [Programme] OFF
GO