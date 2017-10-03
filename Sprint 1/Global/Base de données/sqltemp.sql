USE master
IF EXISTS(select * from sys.databases where name='BDPlanCadre')
DROP DATABASE BDPlanCadre
GO

CREATE DATABASE BDPlanCadre
GO

USE BDPlanCadre
GO

-- --------------------------

IF EXISTS(select * from sys.databases where name='tt')
DROP DATABASE tt;

CREATE TABLE tt (

        id                      INT                     NOT NULL        IDENTITY(1,1),

        champ           VARCHAR(5)      NOT NULL,

        PRIMARY KEY(id)
)
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 2017-09-12 10:19:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
        [MigrationId] [nvarchar](150) NOT NULL,
        [ContextKey] [nvarchar](300) NOT NULL,
        [Model] [varbinary](max) NOT NULL,
        [ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
        [MigrationId] ASC,
        [ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 2017-09-12 10:19:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
        [Id] [nvarchar](128) NOT NULL,
        [Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
        [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 2017-09-12 10:19:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
        [Id] [int] IDENTITY(1,1) NOT NULL,
        [UserId] [nvarchar](128) NOT NULL,
        [ClaimType] [nvarchar](max) NULL,
        [ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
        [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 2017-09-12 10:19:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
        [LoginProvider] [nvarchar](128) NOT NULL,
        [ProviderKey] [nvarchar](128) NOT NULL,
        [UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
        [LoginProvider] ASC,
        [ProviderKey] ASC,
        [UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 2017-09-12 10:19:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
        [UserId] [nvarchar](128) NOT NULL,
        [RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
        [UserId] ASC,
        [RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 2017-09-12 10:19:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
        [Id] [nvarchar](128) NOT NULL,
        [Email] [nvarchar](256) NULL,
        [EmailConfirmed] [bit] NOT NULL,
        [PasswordHash] [nvarchar](max) NULL,
        [SecurityStamp] [nvarchar](max) NULL,
        [PhoneNumber] [nvarchar](max) NULL,
        [PhoneNumberConfirmed] [bit] NOT NULL,
        [TwoFactorEnabled] [bit] NOT NULL,
        [LockoutEndDateUtc] [datetime] NULL,
        [LockoutEnabled] [bit] NOT NULL,
        [AccessFailedCount] [int] NOT NULL,
        [UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
        [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
DELETE FROM AspNetUsers
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'0c4b02f4-3c62-4030-b8e0-24aac3b87d5d', N'gauca1532715@etu.cegepjonquiere.ca', 0, N'ANbx0N9o/ZTfsvHCw/EvTUMGmHRFyd1EKMhXKFNk5JhLQNI8AWUq+Ho7UZ1q7YlhJg==', N'a06d14fc-8270-42f0-8a0d-8c600b9325cb', NULL, 0, 0, NULL, 1, 0, N'gauca1532715@etu.cegepjonquiere.ca')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'1950c7ef-d051-490d-84dc-1e2e8872d660', N'foned1530057@etu.cegepjonquiere.ca', 0, N'ALshSBLXPe+qLlE9k0SDkP2ylyWebaAAR3++HbNeAi6JhqO2qGUUnt0psbWgJ24BXQ==', N'46150be5-20da-448b-9e79-76e82d0806d4', NULL, 0, 0, NULL, 1, 0, N'foned1530057@etu.cegepjonquiere.ca')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'4c194a5d-9ec8-4a9c-8994-7f91986cf480', N'larsa1432920@etu.cegepjonquiere.ca', 0, N'AOO/q2oMaxjNYF1sF8H7UMWVYv8vL7R6pOrt80/PVF1Gu1dDVIsGRdVZPk9V5RB/Yw==', N'0ad20b90-7166-4197-a93f-fc6b5e62ce61', NULL, 0, 0, NULL, 1, 0, N'larsa1432920@etu.cegepjonquiere.ca')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'ac2682c3-a26b-480a-83ec-b571b309a62a', N'cotfr1530860@etu.cegepjonquiere.ca', 0, N'AHEQtMJyh0h099STis/lvt8St8WZnYrJ/pf9LPIWtNT5GP4WDvgyIY6KJ6orrWt1hA==', N'34ecfb43-c36d-4ba8-9227-9964e95a605b', NULL, 0, 0, NULL, 1, 0, N'cotfr1530860@etu.cegepjonquiere.ca')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'de02a4d2-d6b1-4522-839c-342d5e446748', N'ducma1532694@etu.cegepjonquiere.ca', 0, N'AJiirWHrRF0C8skz4jL2mVGQmx41KedxAd8STYZJ0MsdTdA4Q23rpp5s2U8OR7Um9w==', N'bedc7731-2912-4355-8d5b-a4b55a8d8811', NULL, 0, 0, NULL, 1, 0, N'ducma1532694@etu.cegepjonquiere.ca')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'efa8d199-9093-4ba5-824f-460ddb3ca4b9', N'hamfa1330387@etu.cegepjonquiere.ca', 0, N'AIKik20IEcYt6I25Tdbz2Ik4ONNx93HAQRY2+WwxWGoA9rI2LU+kLYenFktS8ujcXQ==', N'6973e3b8-1ef4-45b4-80ea-5442a8cd574b', NULL, 0, 0, NULL, 1, 0, N'hamfa1330387@etu.cegepjonquiere.ca')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'eb364e3b-b9e5-406b-83eb-b2845acf3202', N'ericchose@outlook.ca', 0, N'ALWEsr41t9MzK/Ug02i2HDaij3MaytU+7/28tPtVYhtS+baXjg8dxZiefmE/SAU3lg==', N'33a123d0-029c-4e16-975e-91c7f64b3b28', NULL, 0, 0, NULL, 1, 0, N'ericchose@outlook.ca')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'10a69245-2a83-4923-9482-f55551274033', N'aymentravail@outlook.ca', 0, N'AAHKoJqrLCNgFtvM5FEpS8Xu5OujMBtfbSXDwpVcT5xE+L+zAAFq6x+pAu8kx/9x0Q==', N'81f8bb06-ad14-42bd-92f1-80c2af97c542', NULL, 0, 0, NULL, 1, 0, N'aymentravail@outlook.ca')

DELETE FROM AspNetRoles
INSERT INTO AspNetRoles (id, name) VALUES
(0, 'Admin'),
(1, 'RCP'),
(2, 'Conseiller'),
(3, 'Enseignant'),
(4, 'RCD'),
(5, 'Gestionnaire de stage')
GO

DELETE FROM AspNetUserRoles
INSERT INTO AspNetUserRoles (UserId, RoleId) VALUES
('0c4b02f4-3c62-4030-b8e0-24aac3b87d5d', 0), --CARL
('1950c7ef-d051-490d-84dc-1e2e8872d660', 2), --EDDY
('4c194a5d-9ec8-4a9c-8994-7f91986cf480', 1), --SAM
('ac2682c3-a26b-480a-83ec-b571b309a62a', 3), --FRED
('de02a4d2-d6b1-4522-839c-342d5e446748', 5), --MARCAND
('efa8d199-9093-4ba5-824f-460ddb3ca4b9', 4), --FAB

('eb364e3b-b9e5-406b-83eb-b2845acf3202', 0), --ERIC
('eb364e3b-b9e5-406b-83eb-b2845acf3202', 1),
('eb364e3b-b9e5-406b-83eb-b2845acf3202', 2),
('eb364e3b-b9e5-406b-83eb-b2845acf3202', 3),
('eb364e3b-b9e5-406b-83eb-b2845acf3202', 4),
('eb364e3b-b9e5-406b-83eb-b2845acf3202', 5),

('10a69245-2a83-4923-9482-f55551274033', 1), --AYMEN
('10a69245-2a83-4923-9482-f55551274033', 5)

--select * from AspNetRoles
--select * from AspNetUserClaims
--select * from AspNetUserLogins
--select * from AspNetUserRoles
--select * from AspNetUsers

--USE [BDPlanCadreTEST]
CREATE TABLE EnonceCompetence
(       
        idCompetence            INT                             NOT NULL        IDENTITY(1,1),

        codeCompetence          VARCHAR(4)              NOT NULL,
        enonceCompetence        VARCHAR(300)    NOT NULL,
        motClef                         VARCHAR(30)             NULL,
        obligatoire                     BIT                             NOT NULL        DEFAULT(1),
        actif                           BIT                             NOT NULL        DEFAULT(1),
        commentaire                     VARCHAR(200)    NULL,

        idProgramme                     INT                             NOT NULL,       --FK
        
        PRIMARY KEY(idCompetence)
)

CREATE TABLE ContexteRealisation
(
        idContexte                      INT                             NOT NULL        IDENTITY(1,1),

        contexteRealisation     VARCHAR(300)    NOT NULL,
        commentaire                     VARCHAR(200)    NULL,

        idCompetence            INT             NOT NULL,       --FK

        PRIMARY KEY(idContexte)
)

CREATE TABLE ElementCompetence
(
        idElement                       INT                             NOT NULL        IDENTITY(1,1),

        element                         VARCHAR(300)    NOT NULL,
        numero                          INT                             NOT NULL,
        motClef                         VARCHAR(30)             NULL,
        commentaire                     VARCHAR(200)    NULL,

        idCompetence            INT                             NOT NULL,       --FK

        PRIMARY KEY (idElement)
)

CREATE TABLE CriterePerformance
(
        idCritere                       INT                             NOT NULL        IDENTITY(1,1),

        criterePerformance      VARCHAR(300)    NOT NULL,
        numero                          INT                             NOT NULL,
        commentaire                     VARCHAR(200)    NULL,

        idElement                       INT                             NOT NULL,       --FK

        PRIMARY KEY(idCritere)
)
IF OBJECT_ID ('Programme') IS NOT NULL
DROP TABLE Programme
GO
CREATE TABLE Programme
(
        idProgramme                             INT                             NOT NULL        IDENTITY(1,1),

        annee                                   CHAR(4)                 NOT NULL,
        nom                                             VARCHAR(50)             NULL,
        nbUnite                                 VARCHAR(6)              NULL,
        codeSpecialisation              VARCHAR(3)              NOT NULL,
        specialisation                  VARCHAR(30)             NULL,
        nbHeurefrmGenerale              INT                             NULL,
        nbHeurefrmSpecifique    INT                             NULL,
        condition                               VARCHAR(300)    NULL,
        sanction                                VARCHAR(50)             NULL,
        commentaire                             VARCHAR(200)    NULL,
        docMinistere_path               VARCHAR(200)    NULL,
        dateValidation                  DATETIME                NULL,

        codeProgramme                   CHAR(3)                 NOT NULL,               --FK

        PRIMARY KEY (idProgramme)
);

IF OBJECT_ID ('EnteteProgramme') IS NOT NULL
DROP TABLE EnteteProgramme
GO
CREATE TABLE EnteteProgramme
(
        codeProgramme           CHAR(3)                 NOT NULL,
        commentaire                     VARCHAR(200)    NOT NULL,

        PRIMARY KEY(codeProgramme)
);
ALTER TABLE EnonceCompetence
ADD FOREIGN KEY(idProgramme) REFERENCES Programme(idProgramme)

ALTER TABLE ContexteRealisation
ADD FOREIGN KEY(idCompetence)REFERENCES EnonceCompetence(idCompetence)

ALTER TABLE ElementCompetence
ADD FOREIGN KEY(idCompetence) REFERENCES EnonceCompetence(idCompetence)

ALTER TABLE CriterePerformance
ADD FOREIGN KEY(idElement) REFERENCES ElementCompetence(idElement)
ALTER TABLE Programme
ADD FOREIGN KEY(codeProgramme) REFERENCES EnteteProgramme(codeProgramme)
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (180, 'Soins infirmiers')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (200, 'Sciences de a nature')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (210, 'Chimie')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (221, 'Mécanique du bâtiment')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (222, 'Aménagement et urbanisme')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (235, 'Génie mécanique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (241, 'Génie mécanique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (243, 'Électronique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (260, 'Environnement, hygiène')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (300, 'Sciences humaines')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (322, 'Éducation à l''enfance')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (351, 'Éducation spécialisée')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (388, 'Travail social')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (410, 'Techniques administrative')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (412, 'Bureautique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (420, 'Informatique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (500, 'Arts, lettres et communication')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (510, 'Arts visuels')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (582, 'Intégration multimédia')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (589, 'Art et technologie des médias')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (700, 'Sciences, lettres et arts')
GO
-- Insertion des programmes
INSERT INTO Programme (annee, codeSpecialisation, nbUnite, nom, specialisation, nbHeurefrmGenerale, nbHeurefrmSpecifique, condition, sanction, commentaire, docMinistere_path, dateValidation, codeProgramme) VALUES
('2001','AA','91 2/3', 'Informatique', 'Informatique de gestion', '660', '1980', 'Mathématique 526/Mathématique 536', 'Diplôme d’études collégiales', NULL, NULL, NULL, '420'),
('2000','A1',NULL,'Intégration multimédia',NULL,NULL,NULL,NULL,'Diplôme d’études collégiales',NULL,NULL,NULL,'582'),
('2001','A0',NULL,'Soins infirmiers',NULL,NULL,NULL,'Mathématique 536','Diplôme d’études collégiales',NULL,NULL,NULL,'180'),
('2000','C0',NULL,'Génie Chimique',NULL,NULL,NULL,'Mathématique 526','Diplôme d’études collégiales',NULL,NULL,NULL,'210')
GO
--select * from EnteteProgramme
--select * from tblProgramme
SET IDENTITY_INSERT EnonceCompetence ON
GO
INSERT EnonceCompetence (idCompetence, codeCompetence, enonceCompetence, motClef, obligatoire, actif, commentaire, idProgramme) VALUES (1, '016N', 'Analyser les fonctions de travail', NULL, 1, 1, NULL, 1)
GO
INSERT EnonceCompetence (idCompetence, codeCompetence, enonceCompetence, motClef, obligatoire, actif, commentaire, idProgramme) VALUES (2, '016P', 'Résoudre des problèmes mathématiques et statistiques en informatique', NULL, 1, 1, NULL, 1)
GO
INSERT EnonceCompetence (idCompetence, codeCompetence, enonceCompetence, motClef, obligatoire, actif, commentaire, idProgramme) VALUES (3, '016Q', 'Mettre à profit les possibilités d''un système d''exploitation propre à une station de travail', NULL, 1, 1, NULL, 1)
GO
INSERT EnonceCompetence (idCompetence, codeCompetence, enonceCompetence, motClef, obligatoire, actif, commentaire, idProgramme) VALUES (4, '016R', 'Installer des éléments physiques et logiques dans une station de travail', NULL, 1, 1, NULL, 1)
GO
INSERT EnonceCompetence (idCompetence, codeCompetence, enonceCompetence, motClef, obligatoire, actif, commentaire, idProgramme) VALUES (5, '016S', 'Exploiter un langage de programmation structurée', NULL, 1, 1, NULL, 1)
GO
INSERT EnonceCompetence (idCompetence, codeCompetence, enonceCompetence, motClef, obligatoire, actif, commentaire, idProgramme) VALUES (6, '016T', 'Appliquer une approche de développement par objets', NULL, 1, 1, NULL, 1)
GO
INSERT EnonceCompetence (idCompetence, codeCompetence, enonceCompetence, motClef, obligatoire, actif, commentaire, idProgramme) VALUES (7, '016U', 'Effectuer la recherche d''information', NULL, 1, 1, NULL, 1)
GO
INSERT EnonceCompetence (idCompetence, codeCompetence, enonceCompetence, motClef, obligatoire, actif, commentaire, idProgramme) VALUES (8, '026V', 'Interagir et communiquer dans des situations de travail variées', NULL, 1, 1, NULL, 1)
GO
SET IDENTITY_INSERT EnonceCompetence OFF
GO
SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (1, 'Caractériser les fonctions de travail et leurs conditions d''exercise', 1, NULL, NULL, 1)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (2, 'Examiner les tâches et les opérations liées aux fonctions de travail', 2, NULL, NULL, 1)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (3, 'Examiner les habiletés et les comportements nécessaire a l''exercice des fonctions de travail.', 3, NULL, NULL, 1)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (4, 'Examiner la réglementation relative à l''exercice de la profession en général', 4, NULL, NULL, 1)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (5, 'Effectuer des traitements sur des données internes de l''ordinateur', 1, NULL, NULL, 2)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (6, 'Effectuer des opérations logiques', 2, NULL, NULL, 2)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (7, 'Organiser et traiter de l''information', 3, NULL, NULL, 2)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (8, 'Résoudre des problèmes de programmation linéaire', 4, NULL, NULL, 2)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (9, 'Résoudre des problèmes de dénombrement', 5, NULL, NULL, 2)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (10, 'Résoudre des problèmes de probabilité et de statistique', 6, NULL, NULL, 2)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (11, 'Exploiter un système de fichiers', 1, NULL, NULL, 3)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (12, 'Automatiser des tâches', 2, NULL, NULL, 3)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (13, 'Utiliser les mécanismes de gestion de la mémoire', 3, NULL, NULL, 3)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (14, 'Personnaliser l''environnement de la station de travail', 4, NULL, NULL, 3)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (15, 'Analyser l''architecture interne de l''ordinateur', 1, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (16, 'Planifier le travail', 2, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (17, 'Protéger l''environnement de la station de travail', 3, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (18, 'Installer des éléments physiques', 4, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (19, 'Désinstaller des éléments physiques', 5, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (20, 'Installer des éléments logiques', 6, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (21, 'Désinstaller des éléments logiques', 7, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (22, 'Vérifier l''installation de la station de travail dans l''environnement de l''utilisatrice et de l''utilisateur', 8, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (23, 'Consigner l''information sur l''installation', 9, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (24, 'Préparer l''environnement de programmation.', 1, NULL, NULL, 5)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (25, 'Adapter l''algorithme aux contraintes du langage de programmation.', 2, NULL, NULL, 5)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (26, 'Traduire l''algorithme dans le langage de programmation.', 3, NULL, NULL, 5)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (27, 'Compiler le programme', 4, NULL, NULL, 5)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (28, 'Valider le programme', 5, NULL, NULL, 5)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (29, 'Créer un modèle objet', 1, NULL, NULL, 6)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (30, 'Perfectionner le modèle objet', 2, NULL, NULL, 6)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (31, 'Procéder à la codification d''une classe', 3, NULL, NULL, 6)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (32, 'Valider le fonctionnement d''une classe', 4, NULL, NULL, 6)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (33, 'Générer la version exécutable du programme', 5, NULL, NULL, 6)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (34, 'Préciser le besoin d''information', 1, NULL, NULL, 7)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (35, 'Sélectionner et utiliser les sources de recherche', 2, NULL, NULL, 7)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (36, 'Consulter et extraire l''information nécessaire', 3, NULL, NULL, 7)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (37, 'Consigner les résultats de la recherche', 4, NULL, NULL, 7)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (38, 'Établir et entretenir des relations interpersonnelles', 1, NULL, NULL, 8)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (39, 'Communiquer avec des personnes à l''interne et à l''externe', 2, NULL, NULL, 8)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (40, 'Travailler au sein d''une équipe multidisciplinaire', 3, NULL, NULL, 8)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (41, 'Appliquer une approche client', 4, NULL, NULL, 8)
GO
SET IDENTITY_INSERT ElementCompetence OFF
GO
SET IDENTITY_INSERT ContexteRealisation ON
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (1, 'a l''aide d''une information récente sur les fonctions de travail suivantes : - programeuse-analyste et programeur-analyste dans les domaine de la gestion et de l''indutrie', NULL, 1)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (2, 'À l''aide d''une information récente sur les entreprses dans lesquelles on trouve la programeuse-analyste et le programmeur-analyste et la et le gestionnaire de réseaux informatique', NULL, 1)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (3, 'À partir de situations propres au domaine de l''informatique', NULL, 2)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (4, 'À partir d''une station de travail et d''un logiciel de statistiques', NULL, 2)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (5, 'À l''aide des manuels de références techniques appropriés', NULL, 2)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (6, 'Dans des environnements utilisant des systèmes d''exploitation variés', NULL, 3)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (7, 'À partir d''une station de travail et des logiciels appropriés', NULL, 3)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (8, 'À l''aide des manuels de références techniques appropriés', NULL, 3)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (9, 'À partir des normes et des exigences de l''entreprise', NULL, 3)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (10, 'En atelier et sur le lieu de travail de l''utilisatrice et de l''utilisateur', NULL, 4)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (11, 'À partir d''une demande préautorisée précisant la nature de l''installation', NULL, 4)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (12, 'À partir d''une station de travail', NULL, 4)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (13, 'À l''aide des éléments physiques et logiques à installer et des outils appropriés', NULL, 4)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (14, 'À partir des normes et des exigences de l''entreprise', NULL, 4)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (15, 'À l''aide des manuels de références techniques appropriés', NULL, 4)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (16, 'À partir d''une station de travail et des logiciels appropriés', NULL, 5)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (17, 'À partir d''algorithmes valides et représentatifs du milieu de travail', NULL, 5)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (18, 'À partir des normes et des exigences de l''entreprise', NULL, 5)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (19, 'À l''aide des manuels de références techniques appropriés à l''environnement de programmation', NULL, 5)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (20, 'À partir d''une station de travail et des logiciels appropriés', NULL, 6)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (21, 'À partir de situations représentatives du milieu du travail et nécessitant le développement d''applications comportant un nombre limité de classes', NULL, 6)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (22, 'À partir des normes et des exigences de l''entreprise', NULL, 6)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (23, 'À l''aide de toute la documentation disponible sur les applications à développer', NULL, 6)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (24, 'À l''aide des manuels de références techniques appropriés', NULL, 6)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (25, 'À partir de besoins d''information précis propres au milieu de travail', NULL, 7)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (26, 'À partir de besoins d''information liés à la veille technologique', NULL, 7)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (27, 'À partir d''une station de travail et des logiciels appropriés', NULL, 7)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (28, 'À l''aide de manuels de références en français et en anglais', NULL, 7)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (29, 'Dans des situations de travail variées', NULL, 8)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (30, 'En présence des personnes en cause', NULL, 8)
GO
SET IDENTITY_INSERT ContexteRealisation OFF
GO
SET IDENTITY_INSERT CriterePerformance ON
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (1, 'Pertinence de l''information recueillie', 1, NULL, 1)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (2, 'Examen complet des caractéristiques générales des fonctions de travail et de leurs conditions d''exercice', 2, NULL, 1)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (3, 'Reconnaissance des possibilités d''exercice des professions en entreprise et de pratique entrepreneuriale dans le domaine de l''informatique', 3, NULL, 1)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (4, 'Reconnaissance des effets, sur le travail, de l''évolution technologique rapide dans le domaine de l''informatique', 4, NULL, 1)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (5, 'Examen complet des opérations, ainsi que des conditions d''exécution et des critères de performance des tâches associés aux différentes fonctions de travail', 1, NULL, 2)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (6, 'Détermination exacte de l''importance relative des activités', 2, NULL, 2)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (7, 'Mise en relation des étapes du processus de travail avec les tâches des fonctions de travail', 3, NULL, 2)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (8, 'Pertinence des liens établis entre les habiletés et comportements et les différentes tâches des fonctions de travail', 1, NULL, 3)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (9, 'Examen complet des exigences liées à l''éthique professionnelle', 2, NULL, 3)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (10, 'Reconnaissance des droits et des responsabilités des personnes dans les relations employeur-employé et client-fournisseur', 1, NULL, 4)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (11, 'Reconnaissance des conséquences des manquements aux lois et règlements', 2, NULL, 4)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (12, 'Représentation correcte de nombres dans différentes bases', 1, NULL, 5)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (13, 'Conversion correcte de nombres d''une base à une autre', 2, NULL, 5)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (14, 'Exécution correcte des opérations arithmétiques dans différentes bases', 3, NULL, 5)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (15, 'Représentation juste de données dans la mémoire de l''ordinateur', 4, NULL, 5)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (16, 'Interprétation juste des limites de représentation des données dans la mémoire de l''ordinateur', 5, NULL, 5)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (17, 'Formulation de propositions appropriées à différentes situations', 1, NULL, 6)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (18, 'Construction d''une table de vérité conforme à une proposition', 2, NULL, 6)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (19, 'Simplification correcte d''une proposition', 3, NULL, 6)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (20, 'Utilisation appropriée de la méthode de preuve par induction', 4, NULL, 6)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (21, 'Construction d''ensembles et de sous-ensembles appropriés à différentes situations', 1, NULL, 7)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (22, 'Exécution correcte de toutes les opérations dans les ensembles', 2, NULL, 7)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (23, 'Établissement de relations justes entre des ensembles', 3, NULL, 7)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (24, 'Formulation de propositions appropriées et dans leur forme la plus simple en vue de traiter l''information dans une situation donnée', 4, NULL, 7)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (25, 'Traduction correcte des propositions en langage ensembliste', 5, NULL, 7)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (26, 'Représentation d''une situation sous forme d''un système d''équations linéaires approprié', 1, NULL, 8)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (27, 'Exécution correcte des opérations dans les matrices', 2, NULL, 8)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (28, 'Représentation juste d''un système d''équations linéaires sous forme matricielle', 3, NULL, 8)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (29, 'Application correcte de méthodes de résolution de problèmes d''un système d''équations linéaires', 4, NULL, 8)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (30, 'Calcul exact du nombre de permutations dans un contexte donné', 1, NULL, 9)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (31, 'Calcul exact du nombre d''arrangements dans un contexte donné', 2, NULL, 9)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (32, 'Calcul exact du nombre de combinaisons dans un contexte donné', 3, NULL, 9)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (33, 'Calcul des probabilités d''événements liées aux lois binomiale, normale et de Poisson', 1, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (34, 'Détermination de la nature des variables appropriées à une situation donnée', 2, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (35, 'Choix d''échelles de mesure appropriées à une situation donnée', 3, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (36, 'Choix des mesures statistiques appropriées à une situation donnée', 4, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (37, 'Choix judicieux du mode de représentation de l''information', 5, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (38, 'Application rigoureuse des normes de présentation des tableaux et des graphiques', 6, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (39, 'Utilisation efficace des fonctionnalités d''un logiciel de statistiques', 7, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (40, 'Choix des méthodes d''échantillonnage appropriées à une situation donnée', 8, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (41, 'Estimation par intervalle d''une moyenne et d''une proportion pour des grands échantillons', 9, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (42, 'Comparaison des possibilités et des limites des systèmes de fichiers de différents systèmes d''exploitation', 1, NULL, 11)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (43, 'Utilisation correcte des commandes de manipulation des fichiers', 2, NULL, 11)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (44, 'Utilisation correcte des commandes de manipulation des répertoires', 3, NULL, 11)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (45, 'Utilisation correcte des commandes visant à assurer la sécurité des fichiers et des répertoires', 4, NULL, 11)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (46, 'Utilisation correcte des outils visant le stockage et l''intégrité des données', 5, NULL, 11)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (47, 'Analyse judicieuse des possibilités et des limites des différents systèmes d''exploitation au regard de l''exécution des tâches', 1, NULL, 12)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (48, 'Utilisation correcte du langage de commande propre au système d''exploitation', 2, NULL, 12)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (49, 'Utilisation appropriée des commandes en vue d''établir l''ordre de priorité des tâches', 3, NULL, 12)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (50, 'Adaptation appropriée des paramètres de sécurité aux exigences des tâches', 4, NULL, 12)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (51, 'Application des techniques de débogage appropriées au système d''exploitation', 5, NULL, 12)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (52, 'Consignation des commentaires pertinents', 6, NULL, 12)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (53, 'Analyse judicieuse des possibilités et des limites des différents systèmes d''exploitation au regard de la gestion de la mémoire', 1, NULL, 13)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (54, 'Allocation de la mémoire appropriée aux besoins relatifs à l''exécution d''une tâche', 2, NULL, 13)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (55, 'Comparaison des différents types de fichiers de configuration propres au système d''exploitation', 1, NULL, 14)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (56, 'Utilisation correcte des commandes de configuration de base du poste de travail', 2, NULL, 14)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (57, 'Utilisation correcte des commandes de démarrage et de configuration des périphériques', 3, NULL, 14)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (58, 'Démarrage des programmes appropriés aux besoins de l''utilisatrice et de l''utilisateur', 4, NULL, 14)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (59, 'Adaptation des paramètres de configuration de l''environnement de travail aux exigences de l''utilisatrice et de l''utilisateur', 5, NULL, 14)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (60, 'Consignation précise des paramètres de personnalisation', 6, NULL, 14)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (61, 'Distinction et repérage des éléments de la carte maîtresse', 1, NULL, 15)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (62, 'Reconnaissance des caractéristiques et des fonctions propres aux processeurs, aux mémoires, aux bus et aux horloges', 2, NULL, 15)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (63, 'Reconnaissance des caractéristiques et des fonctions propres aux différents ports de communication', 3, NULL, 15)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (64, 'Reconnaissance des relations entre les différents éléments', 4, NULL, 15)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (65, 'Analyse judicieuse de la demande', 1, NULL, 16)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (66, 'Préparation du matériel nécessaire', 2, NULL, 16)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (67, 'Détermination juste de la séquence des opérations', 3, NULL, 16)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (68, 'Consignation complète de la configuration physique initiale', 1, NULL, 17)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (69, 'Copie de l''ensemble des données', 2, NULL, 17)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (70, 'Prise des mesures de sécurité appropriées', 3, NULL, 17)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (71, 'Interprétation correcte des fiches techniques', 1, NULL, 18)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (72, 'Détermination appropriée de chacun des paramètres d''installation', 2, NULL, 18)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (73, 'Installation de l''élément à l''endroit approprié', 3, NULL, 18)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (74, 'Configuration conforme à l''environnement du poste', 4, NULL, 18)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (75, 'Vérification appropriée du fonctionnement de l''élément', 5, NULL, 18)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (76, 'Interprétation judicieuse de l''information technique', 1, NULL, 19)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (77, 'Respect du processus de désinstallation en fonction de l''élément à retirer', 2, NULL, 19)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (78, 'Prise des précautions appropriées', 3, NULL, 19)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (79, 'Interprétation judicieuse de l''information technique', 1, NULL, 20)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (80, 'Démarrage approprié de l''installation', 2, NULL, 20)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (81, 'Choix des paramètres d''installation en fonction de l''environnement du poste', 3, NULL, 20)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (82, 'Vérification approprié du fonctionnement de l''élément', 4, NULL, 20)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (83, 'Personnalisation de l''élément appropriée aux besoins de l''utilisatrice et de l''utilisateur', 5, NULL, 20)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (84, 'Copie correcte des disques', 1, NULL, 21)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (85, 'Interprétation judicieuse de l''information technique', 2, NULL, 21)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (86, 'Utilisation appropriée des outils de désinstallation', 3, NULL, 21)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (87, 'Respect du processus de désinstallation manuelle', 4, NULL, 21)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (88, 'Vérification appropriée du fonctionnement de l''ensemble des éléments', 1, NULL, 22)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (89, 'Résolution efficace des problèmes d''installation', 2, NULL, 22)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (90, 'Installation de la station de travail conforme aux principes de l''ergonomie', 3, NULL, 22)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (91, 'Prise en note de la nouvelle configuration', 1, NULL, 23)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (92, 'Rédaction claire et correcte des problèmes éprouvés et des solutions apportées', 2, NULL, 23)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (93, 'Mise à jour précise de l''inventaire', 3, NULL, 23)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (94, 'Vérification méthodique de l''accès aux différents éléments physiques et logiques de l''environnement', 1, NULL, 24)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (95, 'Configuration de l''environnement appropriée aux caractéristiques de la situation', 2, NULL, 24)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (96, 'Personnalisation de l''environnement efficace et conforme aux exigences de l''entreprise', 3, NULL, 24)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (97, 'Modification appropriée de la représentation des données', 1, NULL, 25)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (98, 'Adaptation correcte des conditions d''exécution', 2, NULL, 25)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (99, 'Modification appropriée des structures de traitement', 3, NULL, 25)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (100, 'Adaptation appropriée de la séquence des opérations', 4, NULL, 25)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (101, 'Utilisation efficace des fonctionnalités d''édition de l''environnement', 1, NULL, 26)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (102, 'Application des règles de syntaxe et de sémantique propres au langage utilisé', 2, NULL, 26)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (103, 'Application rigoureuse des standards de codification', 3, NULL, 26)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (104, 'Application judicieuse des principes de la programmation structurée', 4, NULL, 26)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (105, 'Mise à profit judicieuse des possibilités du langage', 5, NULL, 26)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (106, 'Consignation des commentaires pertinents et conformes aux exigences de l''entreprise', 6, NULL, 26)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (107, 'Utilisation efficace des fonctionnalités de compilation de l''environnement', 1, NULL, 27)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (108, 'Repérage des erreurs de compilation', 2, NULL, 27)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (109, 'Correction des erreurs de compilation', 3, NULL, 27)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (110, 'Utilisation efficace des fonctionnalités d''exécution et de débogage de l''environnement', 1, NULL, 28)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (111, 'Préparation correcte des jeux d''essai nécessaires à la vérification du fonctionnement du programme', 2, NULL, 28)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (112, 'Interprétation juste des résultats', 3, NULL, 28)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (113, 'Débogage approprié du programme selon l''algorithme', 4, NULL, 28)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (114, 'Établissement complet des domaines d''application', 1, NULL, 29)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (115, 'Détermination des classes pertinentes', 2, NULL, 29)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (116, 'Établissement des relations hiérarchiques appropriées entre les classes', 3, NULL, 29)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (117, 'Détermination des services de chacune des classes', 4, NULL, 29)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (118, 'Détermination des attributs pertinents compte tenu de chacune des classes', 5, NULL, 29)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (119, 'Représentation graphique appropriée du modèle objet', 6, NULL, 29)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (120, 'Mise au point de la séquence des opérations propres aux différents services de la classe', 1, NULL, 30)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (121, 'Représentation graphique appropriée du modèle séquentiel', 2, NULL, 30)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (122, 'Modification appropriée du modèle objet', 3, NULL, 30)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (123, 'Préparation appropriée de l''environnement de programmation', 1, NULL, 31)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (124, 'Déclaration et définition de la classe respectant les règles de syntaxe et de sémantique du langage', 2, NULL, 31)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (125, 'Exploitation judicieuse des possibilités du langage dans l''application des principes d''encapsulation, d''héritage et de polymorphisme', 3, NULL, 31)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (126, 'Application rigoureuse des standards de nomenclature et de documentation reconnus propres à l''entreprise', 4, NULL, 31)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (127, 'Repérage et correction des erreurs de compilation de la classe', 5, NULL, 31)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (128, 'Préparation correcte des jeux d''essai nécessaires à la vérification du bon fonctionnement de tous les services de la classe', 1, NULL, 32)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (129, 'Création d''un environnement de test approprié', 2, NULL, 32)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (130, 'Interprétation juste des résultats', 3, NULL, 32)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (131, 'Débogage approprié de la classe', 4, NULL, 32)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (132, 'Utilisation des mécanismes de génération propres à l''outil employé', 1, NULL, 33)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (133, 'Précision juste du besoin de recherche', 1, NULL, 34)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (134, 'Détermination des critères permettant de choisir correctement les sources de la recherche', 2, NULL, 34)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (135, 'Manifestation d''initiative', 3, NULL, 34)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (136, 'Sélection judicieuse des sources en fonction de la nature et des critères de la recherche', 1, NULL, 35)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (137, 'Utilisation correcte et efficace des méthodes et des outils de recherche conventionnels et informatiques', 2, NULL, 35)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (138, 'Prise en considération des risques de s''éloigner du besoin initial', 3, NULL, 35)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (139, 'Pertinence de l''information consultée', 1, NULL, 36)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (140, 'Interprétation juste de l''information en français et en anglais', 2, NULL, 36)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (141, 'Pertinence de l''information extraite en fonction du besoin initial', 3, NULL, 36)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (142, 'Manifestation de curiosité', 4, NULL, 36)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (143, 'Clarté, précision et pertinence de l''information consignée', 1, NULL, 37)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (144, 'Prise en considération de ses forces et de ses faiblesses en matière de relations interpersonnelles', 1, NULL, 38)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (145, 'Manifestation d''attitudes favorisant des relations interpersonnelles harmonieuses', 2, NULL, 38)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (146, 'Application rigoureuse des règles de politesse et de courtoisie', 3, NULL, 38)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (147, 'Adaptation de son approche selon les personnes et les situations', 4, NULL, 38)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (148, 'Utilisation appropriée des techniques de gestion des conflits interpersonnels', 5, NULL, 38)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (149, 'Manifestation de comportements conformes à l''éthique professionnelle', 6, NULL, 38)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (150, 'Manifestation d''une attitude d''écoute et de réceptivité', 1, NULL, 39)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (151, 'Adaptation du niveau de langage selon l''interlocutrice et l''interlocuteur', 2, NULL, 39)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (152, 'Application correcte des techniques de communication verbale et non verbale', 3, NULL, 39)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (153, 'Utilisation appropriée des techniques de négociation et d''argumentation', 4, NULL, 39)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (154, 'Distinction juste du rôle et des responsabilités des membres de l''équipe', 1, NULL, 40)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (155, 'Prise de ses responsabilités au sein de l''équipe', 2, NULL, 40)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (156, 'Contribution active aux activités de l''équipe', 3, NULL, 40)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (157, 'Utilisation appropriée des techniques de négociation et d''argumentation', 4, NULL, 40)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (158, 'Manifestation d''attitudes favorisant le travail d''équipe', 5, NULL, 40)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (159, 'Respect du mode d''action établi par l''équipe', 6, NULL, 40)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (160, 'Respect des décisions prises par les membres de l''équipe', 7, NULL, 40)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (161, 'Contribution efficace à la résolution des problèmes éprouvés par les membres de l''équipe', 8, NULL, 40)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (162, 'Interprétation juste des besoins', 1, NULL, 41)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (163, 'Manifestation d''un souci constant de répondre aux besoins des clientes et des clients', 2, NULL, 41)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (164, 'Vérification régulière de la satisfaction des clientes et des clients', 3, NULL, 41)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (165, 'Réaction appropriée devant les problèmes soulevés par les clientes et les clients', 4, NULL, 41)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (166, 'Manifestation d''un souci constant d''améliorer la qualité des services et des produits', 5, NULL, 41)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (167, 'Manifestation de comportements conformes à l''éthique professionnelle', 6, NULL, 41)
GO
SET IDENTITY_INSERT CriterePerformance OFF
GO
