USE master
IF EXISTS(select * from sys.databases where name='BDPlanCadreTEST')
DROP DATABASE BDPlanCadreTEST
GO

CREATE DATABASE BDPlanCadreTEST
GO

USE BDPlanCadreTEST
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
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (1, N'016N', N'Analyser les fonctions de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (2, N'016P', N'Résoudre des problèmes mathématiques et
statistiques en informatique', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (3, N'016Q', N'Mettre à profit les possibilités d''un système
d''exploitation propre à une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (4, N'016R', N'Installer des éléments physiques et logiques
dans une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (5, N'016S', N'Exploiter un langage de programmation
structurée', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (6, N'016T', N'Appliquer une approche de développement par
objets', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (7, N'016U', N'Effectuer la recherche d’information', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (8, N'026V', N'Interagir et communiquer dans des situations de
travail variées', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (9, N'016W', N'Produire des algorithmes', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (10, N'016X', N'Produire une interface utilisateur', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (11, N'016Y', N'Planifier et gérer des activités de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (12, N'016Z', N'Assurer la production et la gestion de
documents', NULL, 1, 1, NULL, 1)
SET IDENTITY_INSERT EnonceCompetence OFF
GO
SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (1, N'Caractériser les fonctions de travail et leurs conditions d''exercise', 1, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (2, N'Examiner les tâches et les opérations liées aux fonctions de travail', 2, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (3, N'Examiner les habiletés et les comportements nécessaire a l''exercice des fonctions de travail.', 3, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (4, N'Examiner la réglementation relative à l''exercice de la profession en général', 4, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (5, N'Effectuer des traitements sur des données
internes de l’ordinateur', 1, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (6, N'Effectuer des opérations logiques', 2, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (7, N'Organiser et traiter de l’information', 3, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (8, N'Résoudre des problèmes de
programmation linéaire', 4, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (9, N'Résoudre des problèmes de
dénombrement', 5, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (10, N'Résoudre des problèmes de probabilité et
de statistique', 6, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (11, N'Exploiter un système de fichiers', 1, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (12, N'Automatiser des tâches', 2, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (13, N'Utiliser les mécanismes de gestion de la
mémoire', 3, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (14, N'Personnaliser l''environnement de la station
de travail', 4, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (15, N'Analyser l''architecture interne de
l''ordinateur', 1, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (16, N'Planifier le travail', 2, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (17, N'Protéger l''environnement de la station de
travail', 3, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (18, N'Installer des éléments physiques', 4, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (19, N'Désinstaller des éléments physiques', 5, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (20, N'Installer des éléments logiques', 6, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (21, N'Désinstaller des éléments logiques', 7, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (22, N'Vérifier l''installation de la station de
travail dans l''environnement de
l''utilisatrice et de l''utilisateur', 8, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (23, N'Consigner l''information sur l''installation', 9, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (24, N'Préparer l’environnement de
programmation.', 1, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (25, N'Adapter l’algorithme aux contraintes du
langage de programmation.', 2, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (26, N'Traduire l’algorithme dans le langage de
programmation.', 3, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (27, N'Compiler le programme', 4, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (28, N'Valider le programme', 5, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (29, N'Créer un modèle objet', 1, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (30, N'Perfectionner le modèle objet', 2, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (31, N'Procéder à la codification d’une classe', 3, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (32, N'Valider le fonctionnement d’une classe', 4, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (33, N'Générer la version exécutable du
programme', 5, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (34, N'Préciser le besoin d’information', 1, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (35, N'Sélectionner et utiliser les sources de
recherche', 2, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (36, N'Consulter et extraire l’information
nécessaire', 3, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (37, N'Consigner les résultats de la recherche', 4, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (38, N'Établir et entretenir des relations
interpersonnelles', 1, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (39, N'Communiquer avec des personnes à
l’interne et à l’externe', 2, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (40, N'Travailler au sein d’une équipe
multidisciplinaire', 3, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (41, N'Appliquer une approche client', 4, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (42, N'Analyser la situation', 1, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (43, N'Mettre au point l''algorithme', 2, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (44, N'Valider l''algorithme', 3, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (45, N'Analyser les caractéristiques des
utilisatrices et des utilisateurs', 1, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (46, N'Établir les caractéristiques d’interaction', 2, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (47, N'Choisir des périphériques d’entrée et de
sortie', 3, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (48, N'Planifier l’organisation globale de
l’interface', 4, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (49, N'Procéder à la programmation de l’interface
utilisateur', 5, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (50, N'Analyser les caractéristiques du travail à
effectuer', 1, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (51, N'Procéder à la planification des activités', 2, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (52, N'Assurer le suivi des activités de travail', 3, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (53, N'Choisir le support du document', 1, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (54, N'Produire un document technique et
administratif', 2, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (55, N'Produire l’aide en ligne', 3, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (56, N'Produire un document de formation', 4, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (57, N'Diffuser un document', 5, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (58, N'Classer un document', 6, NULL, NULL, 12)
SET IDENTITY_INSERT ElementCompetence OFF
GO
SET IDENTITY_INSERT ContexteRealisation ON
GO
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (1, N'a l''aide d''une information récente sur les fonctions de travail suivantes : - programeuse-analyste et programeur-analyste dans les domaine de la gestion et de l''indutrie', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (2, N'À l''aide d''une information récente sur les entreprses dans lesquelles on trouve la programeuse-analyste et le programmeur-analyste et la et le gestionnaire de réseaux informatique', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (3, N'À partir de situations propres au domaine de l''informatique', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (4, N'À partir d''une station de travail et d’un logiciel de statistiques', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (5, N'À l''aide des manuels de références techniques appropriés', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (6, N'Dans des environnements utilisant des systèmes d’exploitation variés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (7, N'À partir d''une station de travail et des logiciels appropriés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (8, N'À l''aide des manuels de références techniques appropriés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (9, N'À partir des normes et des exigences de l''entreprise', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (10, N'En atelier et sur le lieu de travail de l''utilisatrice et de l''utilisateur', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (11, N'À partir d''une demande préautorisée précisant la nature de l''installation', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (12, N'À partir d''une station de travail', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (13, N'À l''aide des éléments physiques et logiques à installer et des outils appropriés', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (14, N'À partir des normes et des exigences de l''entreprise', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (15, N'À l''aide des manuels de références techniques appropriés', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (16, N'À partir d’une station de travail et des logiciels appropriés', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (17, N'À partir d’algorithmes valides et représentatifs du milieu de travail', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (18, N'À partir des normes et des exigences de l’entreprise', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (19, N'À l’aide des manuels de références techniques appropriés à l’environnement de programmation', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (20, N'À partir d''une station de travail et des logiciels appropriés', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (21, N'À partir de situations représentatives du milieu du travail et nécessitant le développement d’applications comportant un nombre limité de classes', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (22, N'À partir des normes et des exigences de l''entreprise', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (23, N'À l’aide de toute la documentation disponible sur les applications à développer', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (24, N'À l''aide des manuels de références techniques appropriés', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (25, N'À partir de besoins d’information précis propres au milieu de travail', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (26, N'À partir de besoins d’information liés à la veille technologique', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (27, N'À partir d’une station de travail et des logiciels appropriés', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (28, N'À l’aide de manuels de références en français et en anglais', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (29, N'Dans des situations de travail variées', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (30, N'En présence des personnes en cause', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (31, N'À partir de situations variées représentatives du milieu de travail', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (32, N'À partir d''une station de travail et des logiciels appropriés', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (33, N'À partir des exigences de l''entreprise', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (34, N'À l’aide des manuels de références techniques appropriés', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (35, N'À partir d''une station de travail et des logiciels appropriés', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (36, N'À partir d’applications variées nécessitant la création d’interfaces', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (37, N'À partir des manuels de références techniques appropriés', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (38, N'À partir des exigences de l''entreprise et des standards de l’informatique', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (39, N'Dans des situations de travail propres à la profession', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (40, N'À l’aide des outils de planification appropriés', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (41, N'À partir des exigences de l''entreprise', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (42, N'Pour des documents en français et en anglais', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (43, N'À partir d’une station de travail et des logiciels de bureautique, de multimédia et de création d’aide en ligne', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (44, N'À l’aide de dictionnaires, de grammaires et d’outils de référence variés', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (45, N'À l’aide de l’inforoute et des services de télécommunication', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (46, N'À partir des exigences de l’entreprise', NULL, 12)
SET IDENTITY_INSERT ContexteRealisation OFF
GO
SET IDENTITY_INSERT CriterePerformance ON
GO
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (1, N'Pertinence de l’information recueillie', 1, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (2, N'Examen complet des caractéristiques générales des fonctions de travail et de leurs conditions d’exercice', 2, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (3, N'Reconnaissance des possibilités d’exercice des professions en entreprise et de pratique entrepreneuriale dans le domaine de l’informatique', 3, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (4, N'Reconnaissance des effets, sur le travail, de l’évolution technologique rapide dans le domaine de l’informatique', 4, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (5, N'Examen complet des opérations, ainsi que des conditions d’exécution et des critères de performance des tâches associés aux différentes fonctions de travail', 1, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (6, N'Détermination exacte de l’importance relative des activités', 2, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (7, N'Mise en relation des étapes du processus de travail avec les tâches des fonctions de travail', 3, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (8, N'Pertinence des liens établis entre les habiletés et comportements et les différentes tâches des fonctions de travail', 1, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (9, N'Examen complet des exigences liées à l’éthique professionnelle', 2, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (10, N'Reconnaissance des droits et des responsabilités des personnes dans les relations employeur-employé et client-fournisseur', 1, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (11, N'Reconnaissance des conséquences des manquements aux lois et règlements', 2, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (12, N'Représentation correcte de nombres dans différentes bases', 1, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (13, N'Conversion correcte de nombres d’une base à une autre', 2, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (14, N'Exécution correcte des opérations arithmétiques dans différentes bases', 3, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (15, N'Représentation juste de données dans la mémoire de l’ordinateur', 4, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (16, N'Interprétation juste des limites de représentation des données dans la mémoire de l’ordinateur', 5, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (17, N'Formulation de propositions appropriées à différentes situations', 1, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (18, N'Construction d’une table de vérité conforme à une proposition', 2, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (19, N'Simplification correcte d’une proposition', 3, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (20, N'Utilisation appropriée de la méthode de preuve par induction', 4, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (21, N'Construction d’ensembles et de sous-ensembles appropriés à différentes situations', 1, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (22, N'Exécution correcte de toutes les opérations dans les ensembles', 2, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (23, N'Établissement de relations justes entre des ensembles', 3, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (24, N'Formulation de propositions appropriées et dans leur forme la plus simple en vue de traiter l’information dans une situation donnée', 4, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (25, N'Traduction correcte des propositions en langage ensembliste', 5, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (26, N'Représentation d’une situation sous forme d’un système d’équations linéaires approprié', 1, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (27, N'Exécution correcte des opérations dans les matrices', 2, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (28, N'Représentation juste d’un système d’équations linéaires sous forme matricielle', 3, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (29, N'Application correcte de méthodes de résolution de problèmes d’un système d’équations linéaires', 4, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (30, N'Calcul exact du nombre de permutations dans un contexte donné', 1, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (31, N'Calcul exact du nombre d’arrangements dans un contexte donné', 2, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (32, N'Calcul exact du nombre de combinaisons dans un contexte donné', 3, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (33, N'Calcul des probabilités d’événements liées aux lois binomiale, normale et de Poisson', 1, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (34, N'Détermination de la nature des variables appropriées à une situation donnée', 2, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (35, N'Choix d’échelles de mesure appropriées à une situation donnée', 3, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (36, N'Choix des mesures statistiques appropriées à une situation donnée', 4, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (37, N'Choix judicieux du mode de représentation de l’information', 5, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (38, N'Application rigoureuse des normes de présentation des tableaux et des graphiques', 6, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (39, N'Utilisation efficace des fonctionnalités d’un logiciel de statistiques', 7, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (40, N'Choix des méthodes d’échantillonnage appropriées à une situation donnée', 8, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (41, N'Estimation par intervalle d’une moyenne et d’une proportion pour des grands échantillons', 9, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (42, N'Comparaison des possibilités et des limites des systèmes de fichiers de différents systèmes d''exploitation', 1, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (43, N'Utilisation correcte des commandes de manipulation des fichiers', 2, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (44, N'Utilisation correcte des commandes de manipulation des répertoires', 3, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (45, N'Utilisation correcte des commandes visant à assurer la sécurité des fichiers et des répertoires', 4, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (46, N'Utilisation correcte des outils visant le stockage et l''intégrité des données', 5, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (47, N'Analyse judicieuse des possibilités et des limites des différents systèmes d''exploitation au regard de l''exécution des tâches', 1, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (48, N'Utilisation correcte du langage de commande propre au système d''exploitation', 2, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (49, N'Utilisation appropriée des commandes en vue d’établir l’ordre de priorité des tâches', 3, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (50, N'Adaptation appropriée des paramètres de sécurité aux exigences des tâches', 4, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (51, N'Application des techniques de débogage appropriées au système d''exploitation', 5, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (52, N'Consignation des commentaires pertinents', 6, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (53, N'Analyse judicieuse des possibilités et des limites des différents systèmes d''exploitation au regard de la gestion de la mémoire', 1, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (54, N'Allocation de la mémoire appropriée aux besoins relatifs à l''exécution d''une tâche', 2, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (55, N'Comparaison des différents types de fichiers de configuration propres au système d''exploitation', 1, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (56, N'Utilisation correcte des commandes de configuration de base du poste de travail', 2, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (57, N'Utilisation correcte des commandes de démarrage et de configuration des périphériques', 3, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (58, N'Démarrage des programmes appropriés aux besoins de l''utilisatrice et de l''utilisateur', 4, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (59, N'Adaptation des paramètres de configuration de l''environnement de travail aux exigences de l''utilisatrice et de l''utilisateur', 5, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (60, N'Consignation précise des paramètres de personnalisation', 6, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (61, N'Distinction et repérage des éléments de la carte maîtresse', 1, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (62, N'Reconnaissance des caractéristiques et des fonctions propres aux processeurs, aux mémoires, aux bus et aux horloges', 2, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (63, N'Reconnaissance des caractéristiques et des fonctions propres aux différents ports de communication', 3, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (64, N'Reconnaissance des relations entre les différents éléments', 4, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (65, N'Analyse judicieuse de la demande', 1, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (66, N'Préparation du matériel nécessaire', 2, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (67, N'Détermination juste de la séquence des opérations', 3, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (68, N'Consignation complète de la configuration physique initiale', 1, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (69, N'Copie de l''ensemble des données', 2, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (70, N'Prise des mesures de sécurité appropriées', 3, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (71, N'Interprétation correcte des fiches techniques', 1, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (72, N'Détermination appropriée de chacun des paramètres d''installation', 2, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (73, N'Installation de l''élément à l''endroit approprié', 3, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (74, N'Configuration conforme à l''environnement du poste', 4, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (75, N'Vérification appropriée du fonctionnement de l''élément', 5, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (76, N'Interprétation judicieuse de l’information technique', 1, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (77, N'Respect du processus de désinstallation en fonction de l’élément à retirer', 2, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (78, N'Prise des précautions appropriées', 3, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (79, N'Interprétation judicieuse de l''information technique', 1, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (80, N'Démarrage approprié de l''installation', 2, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (81, N'Choix des paramètres d''installation en fonction de l''environnement du poste', 3, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (82, N'Vérification approprié du fonctionnement de l''élément', 4, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (83, N'Personnalisation de l''élément appropriée aux besoins de l’utilisatrice et de l''utilisateur', 5, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (84, N'Copie correcte des disques', 1, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (85, N'Interprétation judicieuse de l''information technique', 2, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (86, N'Utilisation appropriée des outils de désinstallation', 3, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (87, N'Respect du processus de désinstallation manuelle', 4, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (88, N'Vérification appropriée du fonctionnement de l''ensemble des éléments', 1, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (89, N'Résolution efficace des problèmes d''installation', 2, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (90, N'Installation de la station de travail conforme aux principes de l''ergonomie', 3, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (91, N'Prise en note de la nouvelle configuration', 1, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (92, N'Rédaction claire et correcte des problèmes éprouvés et des solutions apportées', 2, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (93, N'Mise à jour précise de l''inventaire', 3, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (94, N'Vérification méthodique de l’accès aux différents éléments physiques et logiques de l’environnement', 1, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (95, N'Configuration de l’environnement appropriée aux caractéristiques de la situation', 2, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (96, N'Personnalisation de l’environnement efficace et conforme aux exigences de l’entreprise', 3, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (97, N'Modification appropriée de la représentation des données', 1, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (98, N'Adaptation correcte des conditions d’exécution', 2, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (99, N'Modification appropriée des structures de traitement', 3, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (100, N'Adaptation appropriée de la séquence des opérations', 4, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (101, N'Utilisation efficace des fonctionnalités d’édition de l’environnement', 1, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (102, N'Application des règles de syntaxe et de sémantique propres au langage utilisé', 2, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (103, N'Application rigoureuse des standards de codification', 3, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (104, N'Application judicieuse des principes de la programmation structurée', 4, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (105, N'Mise à profit judicieuse des possibilités du langage', 5, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (106, N'Consignation des commentaires pertinents et conformes aux exigences de l’entreprise', 6, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (107, N'Utilisation efficace des fonctionnalités de compilation de l’environnement', 1, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (108, N'Repérage des erreurs de compilation', 2, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (109, N'Correction des erreurs de compilation', 3, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (110, N'Utilisation efficace des fonctionnalités d’exécution et de débogage de l’environnement', 1, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (111, N'Préparation correcte des jeux d’essai nécessaires à la vérification du fonctionnement du programme', 2, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (112, N'Interprétation juste des résultats', 3, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (113, N'Débogage approprié du programme selon l’algorithme', 4, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (114, N'Établissement complet des domaines d’application', 1, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (115, N'Détermination des classes pertinentes', 2, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (116, N'Établissement des relations hiérarchiques appropriées entre les classes', 3, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (117, N'Détermination des services de chacune des classes', 4, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (118, N'Détermination des attributs pertinents compte tenu de chacune des classes', 5, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (119, N'Représentation graphique appropriée du modèle objet', 6, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (120, N'Mise au point de la séquence des opérations propres aux différents services de la classe', 1, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (121, N'Représentation graphique appropriée du modèle séquentiel', 2, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (122, N'Modification appropriée du modèle objet', 3, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (123, N'Préparation appropriée de l''environnement de programmation', 1, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (124, N'Déclaration et définition de la classe respectant les règles de syntaxe et de sémantique du langage', 2, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (125, N'Exploitation judicieuse des possibilités du langage dans l''application des principes d''encapsulation, d''héritage et de polymorphisme', 3, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (126, N'Application rigoureuse des standards de nomenclature et de documentation reconnus propres à l''entreprise', 4, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (127, N'Repérage et correction des erreurs de compilation de la classe', 5, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (128, N'Préparation correcte des jeux d''essai nécessaires à la vérification du bon fonctionnement de tous les services de la classe', 1, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (129, N'Création d''un environnement de test approprié', 2, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (130, N'Interprétation juste des résultats', 3, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (131, N'Débogage approprié de la classe', 4, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (132, N'Utilisation des mécanismes de génération propres à l’outil employé', 1, NULL, 33)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (133, N'Précision juste du besoin de recherche', 1, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (134, N'Détermination des critères permettant de choisir correctement les sources de la recherche', 2, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (135, N'Manifestation d’initiative', 3, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (136, N'Sélection judicieuse des sources en fonction de la nature et des critères de la recherche', 1, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (137, N'Utilisation correcte et efficace des méthodes et des outils de recherche conventionnels et informatiques', 2, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (138, N'Prise en considération des risques de s’éloigner du besoin initial', 3, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (139, N'Pertinence de l’information consultée', 1, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (140, N'Interprétation juste de l’information en français et en anglais', 2, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (141, N'Pertinence de l’information extraite en fonction du besoin initial', 3, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (142, N'Manifestation de curiosité', 4, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (143, N'Clarté, précision et pertinence de l’information consignée', 1, NULL, 37)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (144, N'Prise en considération de ses forces et de ses faiblesses en matière de relations interpersonnelles', 1, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (145, N'Manifestation d’attitudes favorisant des relations interpersonnelles harmonieuses', 2, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (146, N'Application rigoureuse des règles de politesse et de courtoisie', 3, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (147, N'Adaptation de son approche selon les personnes et les situations', 4, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (148, N'Utilisation appropriée des techniques de gestion des conflits interpersonnels', 5, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (149, N'Manifestation de comportements conformes à l’éthique professionnelle', 6, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (150, N'Manifestation d’une attitude d’écoute et de réceptivité', 1, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (151, N'Adaptation du niveau de langage selon l’interlocutrice et l’interlocuteur', 2, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (152, N'Application correcte des techniques de communication verbale et non verbale', 3, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (153, N'Utilisation appropriée des techniques de négociation et d’argumentation', 4, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (154, N'Distinction juste du rôle et des responsabilités des membres de l’équipe', 1, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (155, N'Prise de ses responsabilités au sein de l’équipe', 2, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (156, N'Contribution active aux activités de l’équipe', 3, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (157, N'Utilisation appropriée des techniques de négociation et d’argumentation', 4, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (158, N'Manifestation d’attitudes favorisant le travail d’équipe', 5, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (159, N'Respect du mode d’action établi par l’équipe', 6, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (160, N'Respect des décisions prises par les membres de l’équipe', 7, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (161, N'Contribution efficace à la résolution des problèmes éprouvés par les membres de l’équipe', 8, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (162, N'Interprétation juste des besoins', 1, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (163, N'Manifestation d’un souci constant de répondre aux besoins des clientes et des clients', 2, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (164, N'Vérification régulière de la satisfaction des clientes et des clients', 3, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (165, N'Réaction appropriée devant les problèmes soulevés par les clientes et les clients', 4, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (166, N'Manifestation d’un souci constant d’améliorer la qualité des services et des produits', 5, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (167, N'Manifestation de comportements conformes à l’éthique professionnelle', 6, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (168, N'Établissement correcte des données d''entrée', 1, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (169, N'Établissement correcte des données de sortie', 2, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (170, N'Établissement correcte de la nature des traitements', 3, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (171, N'Détermination correcte des conditions d’exécution de l''algorithme', 4, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (172, N'Choix d’un mode de représentation de l''algorithme conforme aux exigences de l''entreprise', 1, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (173, N'Détermination d''une séquence logique des opérations', 2, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (174, N'Détermination des structures de traitement appropriées à chacune des opérations', 3, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (175, N'Application rigoureuse des règles de syntaxe propres au mode de représentation retenu', 4, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (176, N'Recherche d''une solution algorithmique efficace', 5, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (177, N'Représentation précise de la solution algorithmique retenue', 6, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (178, N'Présence de toute l''information nécessaire à l''interprétation de l''algorithme', 7, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (179, N'Vérification de la pertinence de la solution compte tenu de la situation initiale', 1, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (180, N'Détermination des erreurs et des lacunes de la solution algorithmique mise au point', 2, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (181, N'Modification appropriée de la solution algorithmique', 3, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (182, N'Examen des caractéristiques des utilisatrices et des utilisateurs liées à l’âge, à la culture et à la scolarisation', 1, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (183, N'Détermination du degré de familiarité avec l’informatique en général et avec l’application à utiliser', 2, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (184, N'Détermination du degré de réceptivité des utilisatrices et des utilisateurs par rapport à l’application à utiliser', 3, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (185, N'Précision des attentes des utilisatrices et des utilisateurs', 4, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (186, N'Reconnaissance des caractéristiques de l’environnement physique', 1, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (187, N'Détermination des modalités d’interaction', 2, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (188, N'Définition des caractéristiques des tâches d’interaction', 3, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (189, N'Vérification de la cohérence entre les modalités et les tâches', 4, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (190, N'Prise en considération des caractéristiques des utilisatrices et des utilisateurs', 1, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (191, N'Prise en considération des caractéristiques de l’interaction', 2, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (192, N'Prise en considération des caractéristiques des exigences d’ergonomie', 3, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (193, N'Prise en considération des contraintes de fiabilité, de coût et de maintenance', 4, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (194, N'Interprétation correcte des fiches techniques des produits offerts sur le marché', 5, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (195, N'Établissement des actions et des exceptions liées aux tâches', 1, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (196, N'Détermination des éléments de présentation des actions et des exceptions', 2, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (197, N'Organisation spatiale appropriée des éléments', 3, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (198, N'Détermination des caractéristiques de présentation des éléments', 4, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (199, N'Organisation de l’interface conforme aux critères d’esthétisme et d’efficacité', 5, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (200, N'Consignation de l’information relative à l’interface', 6, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (201, N'Création des éléments selon les caractéristiques de présentation choisies', 1, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (202, N'Positionnement des éléments selon l’organisation spatiale retenue', 2, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (203, N'Établissement des liens entre les éléments et les programmes de l’application', 3, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (204, N'Validation du fonctionnement de l’interface', 4, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (205, N'Détermination correcte des principales tâches et de leur séquence', 1, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (206, N'Estimation du temps nécessaire à l’exécution des principales tâches', 2, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (207, N'Prise en considération des échéances établies pour l’exécution du travail', 3, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (208, N'Établissement correct de priorités', 1, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (209, N'Prise en considération des points critiques', 2, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (210, N'Prévision d’une marge de manœuvre suffisante pour faire face aux imprévus', 3, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (211, N'Utilisation appropriée des méthodes et des outils de planification', 4, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (212, N'Établissement d’un calendrier des travaux réaliste', 5, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (213, N'Détermination correcte des ressources humaines et matérielles nécessaires à l’exécution du travail', 6, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (214, N'Communication efficace avec les personnes en cause', 7, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (215, N'Présentation correcte du plan de travail pour approbation', 8, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (216, N'Utilisation d’une méthode appropriée de suivi des activités', 1, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (217, N'Gestion efficace du temps', 2, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (218, N'Respect du calendrier des travaux', 3, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (219, N'Adaptation régulière du calendrier des travaux en fonction des imprévus', 4, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (220, N'Détermination juste du support nécessaire', 1, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (221, N'Sélection et utilisation correcte du logiciel de création du document', 2, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (222, N'Établissement juste du plan de travail pour le document à produire', 1, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (223, N'Préparation appropriée des éléments de contenu', 2, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (224, N'Application rigoureuse des règles grammaticales et orthographiques', 3, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (225, N'Établissement correct du format de mise en page', 4, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (226, N'Adaptation correcte du niveau de langage en fonction du public cible', 5, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (227, N'Clarté du texte', 6, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (228, N'Utilisation efficace des logiciels de bureautique et de multimédia', 7, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (229, N'Respect des normes de mise en page', 8, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (230, N'Sélection des éléments qui nécessitent de l’aide en ligne', 1, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (231, N'Respect des normes de présentation', 2, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (232, N'Application rigoureuse des règles grammaticales et orthographiques', 3, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (233, N'Adaptation correcte du niveau de langage en fonction du public cible', 4, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (234, N'Utilisation correcte du logiciel de création d’aide en ligne', 5, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (235, N'Facilité d’utilisation de l’aide en ligne', 6, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (236, N'Vérification de la cohérence de l’aide en ligne', 7, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (237, N'Prise en considération des objectifs d’apprentissage en fonction du public cible et du contexte de formation', 1, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (238, N'Préparation appropriée des éléments de contenu', 2, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (239, N'Utilisation correcte des outils de production du document', 3, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (240, N'Respect des normes de présentation', 4, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (241, N'Application rigoureuse des règles grammaticales et orthographiques', 5, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (242, N'Adaptation correcte du niveau de langage en fonction du public cible', 6, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (243, N'Vérification minutieuse du document', 7, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (244, N'Établissement juste de la liste de diffusion', 1, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (245, N'Sélection et utilisation du mode de diffusion', 2, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (246, N'Vérification systématique de la réception', 3, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (247, N'Respect des règles de conservation d’un document', 1, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (248, N'Attribution précise d’un code à partir du plan de classification', 2, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (249, N'Précision et concision du titre d’un document selon les normes', 3, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (250, N'Consignation minutieuse de l’information dans l’outil de repérage', 4, NULL, 58)
SET IDENTITY_INSERT CriterePerformance OFF
GO
USE master
IF EXISTS(select * from sys.databases where name='BDPlanCadreTEST')
DROP DATABASE BDPlanCadreTEST
GO

CREATE DATABASE BDPlanCadreTEST
GO

USE BDPlanCadreTEST
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
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (1, N'016N', N'Analyser les fonctions de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (2, N'016P', N'Résoudre des problèmes mathématiques et
statistiques en informatique', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (3, N'016Q', N'Mettre à profit les possibilités d''un système
d''exploitation propre à une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (4, N'016R', N'Installer des éléments physiques et logiques
dans une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (5, N'016S', N'Exploiter un langage de programmation
structurée', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (6, N'016T', N'Appliquer une approche de développement par
objets', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (7, N'016U', N'Effectuer la recherche d’information', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (8, N'026V', N'Interagir et communiquer dans des situations de
travail variées', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (9, N'016W', N'Produire des algorithmes', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (10, N'016X', N'Produire une interface utilisateur', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (11, N'016Y', N'Planifier et gérer des activités de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (12, N'016Z', N'Assurer la production et la gestion de
documents', NULL, 1, 1, NULL, 1)
SET IDENTITY_INSERT EnonceCompetence OFF
GO
SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (1, N'Caractériser les fonctions de travail et leurs conditions d''exercise', 1, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (2, N'Examiner les tâches et les opérations liées aux fonctions de travail', 2, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (3, N'Examiner les habiletés et les comportements nécessaire a l''exercice des fonctions de travail.', 3, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (4, N'Examiner la réglementation relative à l''exercice de la profession en général', 4, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (5, N'Effectuer des traitements sur des données
internes de l’ordinateur', 1, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (6, N'Effectuer des opérations logiques', 2, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (7, N'Organiser et traiter de l’information', 3, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (8, N'Résoudre des problèmes de
programmation linéaire', 4, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (9, N'Résoudre des problèmes de
dénombrement', 5, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (10, N'Résoudre des problèmes de probabilité et
de statistique', 6, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (11, N'Exploiter un système de fichiers', 1, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (12, N'Automatiser des tâches', 2, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (13, N'Utiliser les mécanismes de gestion de la
mémoire', 3, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (14, N'Personnaliser l''environnement de la station
de travail', 4, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (15, N'Analyser l''architecture interne de
l''ordinateur', 1, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (16, N'Planifier le travail', 2, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (17, N'Protéger l''environnement de la station de
travail', 3, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (18, N'Installer des éléments physiques', 4, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (19, N'Désinstaller des éléments physiques', 5, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (20, N'Installer des éléments logiques', 6, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (21, N'Désinstaller des éléments logiques', 7, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (22, N'Vérifier l''installation de la station de
travail dans l''environnement de
l''utilisatrice et de l''utilisateur', 8, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (23, N'Consigner l''information sur l''installation', 9, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (24, N'Préparer l’environnement de
programmation.', 1, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (25, N'Adapter l’algorithme aux contraintes du
langage de programmation.', 2, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (26, N'Traduire l’algorithme dans le langage de
programmation.', 3, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (27, N'Compiler le programme', 4, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (28, N'Valider le programme', 5, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (29, N'Créer un modèle objet', 1, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (30, N'Perfectionner le modèle objet', 2, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (31, N'Procéder à la codification d’une classe', 3, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (32, N'Valider le fonctionnement d’une classe', 4, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (33, N'Générer la version exécutable du
programme', 5, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (34, N'Préciser le besoin d’information', 1, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (35, N'Sélectionner et utiliser les sources de
recherche', 2, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (36, N'Consulter et extraire l’information
nécessaire', 3, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (37, N'Consigner les résultats de la recherche', 4, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (38, N'Établir et entretenir des relations
interpersonnelles', 1, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (39, N'Communiquer avec des personnes à
l’interne et à l’externe', 2, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (40, N'Travailler au sein d’une équipe
multidisciplinaire', 3, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (41, N'Appliquer une approche client', 4, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (42, N'Analyser la situation', 1, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (43, N'Mettre au point l''algorithme', 2, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (44, N'Valider l''algorithme', 3, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (45, N'Analyser les caractéristiques des
utilisatrices et des utilisateurs', 1, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (46, N'Établir les caractéristiques d’interaction', 2, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (47, N'Choisir des périphériques d’entrée et de
sortie', 3, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (48, N'Planifier l’organisation globale de
l’interface', 4, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (49, N'Procéder à la programmation de l’interface
utilisateur', 5, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (50, N'Analyser les caractéristiques du travail à
effectuer', 1, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (51, N'Procéder à la planification des activités', 2, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (52, N'Assurer le suivi des activités de travail', 3, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (53, N'Choisir le support du document', 1, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (54, N'Produire un document technique et
administratif', 2, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (55, N'Produire l’aide en ligne', 3, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (56, N'Produire un document de formation', 4, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (57, N'Diffuser un document', 5, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (58, N'Classer un document', 6, NULL, NULL, 12)
SET IDENTITY_INSERT ElementCompetence OFF
GO
SET IDENTITY_INSERT ContexteRealisation ON
GO
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (1, N'a l''aide d''une information récente sur les fonctions de travail suivantes : - programeuse-analyste et programeur-analyste dans les domaine de la gestion et de l''indutrie', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (2, N'À l''aide d''une information récente sur les entreprses dans lesquelles on trouve la programeuse-analyste et le programmeur-analyste et la et le gestionnaire de réseaux informatique', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (3, N'À partir de situations propres au domaine de l''informatique', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (4, N'À partir d''une station de travail et d’un logiciel de statistiques', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (5, N'À l''aide des manuels de références techniques appropriés', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (6, N'Dans des environnements utilisant des systèmes d’exploitation variés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (7, N'À partir d''une station de travail et des logiciels appropriés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (8, N'À l''aide des manuels de références techniques appropriés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (9, N'À partir des normes et des exigences de l''entreprise', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (10, N'En atelier et sur le lieu de travail de l''utilisatrice et de l''utilisateur', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (11, N'À partir d''une demande préautorisée précisant la nature de l''installation', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (12, N'À partir d''une station de travail', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (13, N'À l''aide des éléments physiques et logiques à installer et des outils appropriés', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (14, N'À partir des normes et des exigences de l''entreprise', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (15, N'À l''aide des manuels de références techniques appropriés', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (16, N'À partir d’une station de travail et des logiciels appropriés', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (17, N'À partir d’algorithmes valides et représentatifs du milieu de travail', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (18, N'À partir des normes et des exigences de l’entreprise', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (19, N'À l’aide des manuels de références techniques appropriés à l’environnement de programmation', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (20, N'À partir d''une station de travail et des logiciels appropriés', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (21, N'À partir de situations représentatives du milieu du travail et nécessitant le développement d’applications comportant un nombre limité de classes', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (22, N'À partir des normes et des exigences de l''entreprise', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (23, N'À l’aide de toute la documentation disponible sur les applications à développer', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (24, N'À l''aide des manuels de références techniques appropriés', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (25, N'À partir de besoins d’information précis propres au milieu de travail', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (26, N'À partir de besoins d’information liés à la veille technologique', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (27, N'À partir d’une station de travail et des logiciels appropriés', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (28, N'À l’aide de manuels de références en français et en anglais', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (29, N'Dans des situations de travail variées', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (30, N'En présence des personnes en cause', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (31, N'À partir de situations variées représentatives du milieu de travail', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (32, N'À partir d''une station de travail et des logiciels appropriés', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (33, N'À partir des exigences de l''entreprise', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (34, N'À l’aide des manuels de références techniques appropriés', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (35, N'À partir d''une station de travail et des logiciels appropriés', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (36, N'À partir d’applications variées nécessitant la création d’interfaces', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (37, N'À partir des manuels de références techniques appropriés', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (38, N'À partir des exigences de l''entreprise et des standards de l’informatique', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (39, N'Dans des situations de travail propres à la profession', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (40, N'À l’aide des outils de planification appropriés', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (41, N'À partir des exigences de l''entreprise', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (42, N'Pour des documents en français et en anglais', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (43, N'À partir d’une station de travail et des logiciels de bureautique, de multimédia et de création d’aide en ligne', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (44, N'À l’aide de dictionnaires, de grammaires et d’outils de référence variés', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (45, N'À l’aide de l’inforoute et des services de télécommunication', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (46, N'À partir des exigences de l’entreprise', NULL, 12)
SET IDENTITY_INSERT ContexteRealisation OFF
GO
SET IDENTITY_INSERT CriterePerformance ON
GO
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (1, N'Pertinence de l’information recueillie', 1, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (2, N'Examen complet des caractéristiques générales des fonctions de travail et de leurs conditions d’exercice', 2, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (3, N'Reconnaissance des possibilités d’exercice des professions en entreprise et de pratique entrepreneuriale dans le domaine de l’informatique', 3, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (4, N'Reconnaissance des effets, sur le travail, de l’évolution technologique rapide dans le domaine de l’informatique', 4, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (5, N'Examen complet des opérations, ainsi que des conditions d’exécution et des critères de performance des tâches associés aux différentes fonctions de travail', 1, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (6, N'Détermination exacte de l’importance relative des activités', 2, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (7, N'Mise en relation des étapes du processus de travail avec les tâches des fonctions de travail', 3, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (8, N'Pertinence des liens établis entre les habiletés et comportements et les différentes tâches des fonctions de travail', 1, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (9, N'Examen complet des exigences liées à l’éthique professionnelle', 2, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (10, N'Reconnaissance des droits et des responsabilités des personnes dans les relations employeur-employé et client-fournisseur', 1, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (11, N'Reconnaissance des conséquences des manquements aux lois et règlements', 2, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (12, N'Représentation correcte de nombres dans différentes bases', 1, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (13, N'Conversion correcte de nombres d’une base à une autre', 2, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (14, N'Exécution correcte des opérations arithmétiques dans différentes bases', 3, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (15, N'Représentation juste de données dans la mémoire de l’ordinateur', 4, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (16, N'Interprétation juste des limites de représentation des données dans la mémoire de l’ordinateur', 5, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (17, N'Formulation de propositions appropriées à différentes situations', 1, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (18, N'Construction d’une table de vérité conforme à une proposition', 2, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (19, N'Simplification correcte d’une proposition', 3, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (20, N'Utilisation appropriée de la méthode de preuve par induction', 4, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (21, N'Construction d’ensembles et de sous-ensembles appropriés à différentes situations', 1, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (22, N'Exécution correcte de toutes les opérations dans les ensembles', 2, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (23, N'Établissement de relations justes entre des ensembles', 3, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (24, N'Formulation de propositions appropriées et dans leur forme la plus simple en vue de traiter l’information dans une situation donnée', 4, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (25, N'Traduction correcte des propositions en langage ensembliste', 5, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (26, N'Représentation d’une situation sous forme d’un système d’équations linéaires approprié', 1, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (27, N'Exécution correcte des opérations dans les matrices', 2, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (28, N'Représentation juste d’un système d’équations linéaires sous forme matricielle', 3, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (29, N'Application correcte de méthodes de résolution de problèmes d’un système d’équations linéaires', 4, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (30, N'Calcul exact du nombre de permutations dans un contexte donné', 1, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (31, N'Calcul exact du nombre d’arrangements dans un contexte donné', 2, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (32, N'Calcul exact du nombre de combinaisons dans un contexte donné', 3, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (33, N'Calcul des probabilités d’événements liées aux lois binomiale, normale et de Poisson', 1, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (34, N'Détermination de la nature des variables appropriées à une situation donnée', 2, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (35, N'Choix d’échelles de mesure appropriées à une situation donnée', 3, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (36, N'Choix des mesures statistiques appropriées à une situation donnée', 4, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (37, N'Choix judicieux du mode de représentation de l’information', 5, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (38, N'Application rigoureuse des normes de présentation des tableaux et des graphiques', 6, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (39, N'Utilisation efficace des fonctionnalités d’un logiciel de statistiques', 7, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (40, N'Choix des méthodes d’échantillonnage appropriées à une situation donnée', 8, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (41, N'Estimation par intervalle d’une moyenne et d’une proportion pour des grands échantillons', 9, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (42, N'Comparaison des possibilités et des limites des systèmes de fichiers de différents systèmes d''exploitation', 1, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (43, N'Utilisation correcte des commandes de manipulation des fichiers', 2, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (44, N'Utilisation correcte des commandes de manipulation des répertoires', 3, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (45, N'Utilisation correcte des commandes visant à assurer la sécurité des fichiers et des répertoires', 4, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (46, N'Utilisation correcte des outils visant le stockage et l''intégrité des données', 5, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (47, N'Analyse judicieuse des possibilités et des limites des différents systèmes d''exploitation au regard de l''exécution des tâches', 1, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (48, N'Utilisation correcte du langage de commande propre au système d''exploitation', 2, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (49, N'Utilisation appropriée des commandes en vue d’établir l’ordre de priorité des tâches', 3, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (50, N'Adaptation appropriée des paramètres de sécurité aux exigences des tâches', 4, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (51, N'Application des techniques de débogage appropriées au système d''exploitation', 5, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (52, N'Consignation des commentaires pertinents', 6, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (53, N'Analyse judicieuse des possibilités et des limites des différents systèmes d''exploitation au regard de la gestion de la mémoire', 1, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (54, N'Allocation de la mémoire appropriée aux besoins relatifs à l''exécution d''une tâche', 2, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (55, N'Comparaison des différents types de fichiers de configuration propres au système d''exploitation', 1, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (56, N'Utilisation correcte des commandes de configuration de base du poste de travail', 2, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (57, N'Utilisation correcte des commandes de démarrage et de configuration des périphériques', 3, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (58, N'Démarrage des programmes appropriés aux besoins de l''utilisatrice et de l''utilisateur', 4, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (59, N'Adaptation des paramètres de configuration de l''environnement de travail aux exigences de l''utilisatrice et de l''utilisateur', 5, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (60, N'Consignation précise des paramètres de personnalisation', 6, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (61, N'Distinction et repérage des éléments de la carte maîtresse', 1, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (62, N'Reconnaissance des caractéristiques et des fonctions propres aux processeurs, aux mémoires, aux bus et aux horloges', 2, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (63, N'Reconnaissance des caractéristiques et des fonctions propres aux différents ports de communication', 3, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (64, N'Reconnaissance des relations entre les différents éléments', 4, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (65, N'Analyse judicieuse de la demande', 1, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (66, N'Préparation du matériel nécessaire', 2, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (67, N'Détermination juste de la séquence des opérations', 3, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (68, N'Consignation complète de la configuration physique initiale', 1, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (69, N'Copie de l''ensemble des données', 2, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (70, N'Prise des mesures de sécurité appropriées', 3, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (71, N'Interprétation correcte des fiches techniques', 1, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (72, N'Détermination appropriée de chacun des paramètres d''installation', 2, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (73, N'Installation de l''élément à l''endroit approprié', 3, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (74, N'Configuration conforme à l''environnement du poste', 4, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (75, N'Vérification appropriée du fonctionnement de l''élément', 5, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (76, N'Interprétation judicieuse de l’information technique', 1, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (77, N'Respect du processus de désinstallation en fonction de l’élément à retirer', 2, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (78, N'Prise des précautions appropriées', 3, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (79, N'Interprétation judicieuse de l''information technique', 1, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (80, N'Démarrage approprié de l''installation', 2, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (81, N'Choix des paramètres d''installation en fonction de l''environnement du poste', 3, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (82, N'Vérification approprié du fonctionnement de l''élément', 4, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (83, N'Personnalisation de l''élément appropriée aux besoins de l’utilisatrice et de l''utilisateur', 5, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (84, N'Copie correcte des disques', 1, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (85, N'Interprétation judicieuse de l''information technique', 2, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (86, N'Utilisation appropriée des outils de désinstallation', 3, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (87, N'Respect du processus de désinstallation manuelle', 4, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (88, N'Vérification appropriée du fonctionnement de l''ensemble des éléments', 1, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (89, N'Résolution efficace des problèmes d''installation', 2, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (90, N'Installation de la station de travail conforme aux principes de l''ergonomie', 3, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (91, N'Prise en note de la nouvelle configuration', 1, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (92, N'Rédaction claire et correcte des problèmes éprouvés et des solutions apportées', 2, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (93, N'Mise à jour précise de l''inventaire', 3, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (94, N'Vérification méthodique de l’accès aux différents éléments physiques et logiques de l’environnement', 1, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (95, N'Configuration de l’environnement appropriée aux caractéristiques de la situation', 2, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (96, N'Personnalisation de l’environnement efficace et conforme aux exigences de l’entreprise', 3, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (97, N'Modification appropriée de la représentation des données', 1, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (98, N'Adaptation correcte des conditions d’exécution', 2, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (99, N'Modification appropriée des structures de traitement', 3, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (100, N'Adaptation appropriée de la séquence des opérations', 4, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (101, N'Utilisation efficace des fonctionnalités d’édition de l’environnement', 1, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (102, N'Application des règles de syntaxe et de sémantique propres au langage utilisé', 2, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (103, N'Application rigoureuse des standards de codification', 3, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (104, N'Application judicieuse des principes de la programmation structurée', 4, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (105, N'Mise à profit judicieuse des possibilités du langage', 5, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (106, N'Consignation des commentaires pertinents et conformes aux exigences de l’entreprise', 6, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (107, N'Utilisation efficace des fonctionnalités de compilation de l’environnement', 1, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (108, N'Repérage des erreurs de compilation', 2, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (109, N'Correction des erreurs de compilation', 3, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (110, N'Utilisation efficace des fonctionnalités d’exécution et de débogage de l’environnement', 1, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (111, N'Préparation correcte des jeux d’essai nécessaires à la vérification du fonctionnement du programme', 2, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (112, N'Interprétation juste des résultats', 3, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (113, N'Débogage approprié du programme selon l’algorithme', 4, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (114, N'Établissement complet des domaines d’application', 1, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (115, N'Détermination des classes pertinentes', 2, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (116, N'Établissement des relations hiérarchiques appropriées entre les classes', 3, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (117, N'Détermination des services de chacune des classes', 4, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (118, N'Détermination des attributs pertinents compte tenu de chacune des classes', 5, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (119, N'Représentation graphique appropriée du modèle objet', 6, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (120, N'Mise au point de la séquence des opérations propres aux différents services de la classe', 1, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (121, N'Représentation graphique appropriée du modèle séquentiel', 2, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (122, N'Modification appropriée du modèle objet', 3, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (123, N'Préparation appropriée de l''environnement de programmation', 1, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (124, N'Déclaration et définition de la classe respectant les règles de syntaxe et de sémantique du langage', 2, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (125, N'Exploitation judicieuse des possibilités du langage dans l''application des principes d''encapsulation, d''héritage et de polymorphisme', 3, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (126, N'Application rigoureuse des standards de nomenclature et de documentation reconnus propres à l''entreprise', 4, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (127, N'Repérage et correction des erreurs de compilation de la classe', 5, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (128, N'Préparation correcte des jeux d''essai nécessaires à la vérification du bon fonctionnement de tous les services de la classe', 1, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (129, N'Création d''un environnement de test approprié', 2, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (130, N'Interprétation juste des résultats', 3, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (131, N'Débogage approprié de la classe', 4, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (132, N'Utilisation des mécanismes de génération propres à l’outil employé', 1, NULL, 33)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (133, N'Précision juste du besoin de recherche', 1, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (134, N'Détermination des critères permettant de choisir correctement les sources de la recherche', 2, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (135, N'Manifestation d’initiative', 3, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (136, N'Sélection judicieuse des sources en fonction de la nature et des critères de la recherche', 1, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (137, N'Utilisation correcte et efficace des méthodes et des outils de recherche conventionnels et informatiques', 2, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (138, N'Prise en considération des risques de s’éloigner du besoin initial', 3, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (139, N'Pertinence de l’information consultée', 1, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (140, N'Interprétation juste de l’information en français et en anglais', 2, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (141, N'Pertinence de l’information extraite en fonction du besoin initial', 3, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (142, N'Manifestation de curiosité', 4, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (143, N'Clarté, précision et pertinence de l’information consignée', 1, NULL, 37)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (144, N'Prise en considération de ses forces et de ses faiblesses en matière de relations interpersonnelles', 1, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (145, N'Manifestation d’attitudes favorisant des relations interpersonnelles harmonieuses', 2, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (146, N'Application rigoureuse des règles de politesse et de courtoisie', 3, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (147, N'Adaptation de son approche selon les personnes et les situations', 4, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (148, N'Utilisation appropriée des techniques de gestion des conflits interpersonnels', 5, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (149, N'Manifestation de comportements conformes à l’éthique professionnelle', 6, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (150, N'Manifestation d’une attitude d’écoute et de réceptivité', 1, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (151, N'Adaptation du niveau de langage selon l’interlocutrice et l’interlocuteur', 2, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (152, N'Application correcte des techniques de communication verbale et non verbale', 3, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (153, N'Utilisation appropriée des techniques de négociation et d’argumentation', 4, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (154, N'Distinction juste du rôle et des responsabilités des membres de l’équipe', 1, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (155, N'Prise de ses responsabilités au sein de l’équipe', 2, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (156, N'Contribution active aux activités de l’équipe', 3, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (157, N'Utilisation appropriée des techniques de négociation et d’argumentation', 4, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (158, N'Manifestation d’attitudes favorisant le travail d’équipe', 5, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (159, N'Respect du mode d’action établi par l’équipe', 6, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (160, N'Respect des décisions prises par les membres de l’équipe', 7, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (161, N'Contribution efficace à la résolution des problèmes éprouvés par les membres de l’équipe', 8, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (162, N'Interprétation juste des besoins', 1, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (163, N'Manifestation d’un souci constant de répondre aux besoins des clientes et des clients', 2, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (164, N'Vérification régulière de la satisfaction des clientes et des clients', 3, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (165, N'Réaction appropriée devant les problèmes soulevés par les clientes et les clients', 4, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (166, N'Manifestation d’un souci constant d’améliorer la qualité des services et des produits', 5, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (167, N'Manifestation de comportements conformes à l’éthique professionnelle', 6, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (168, N'Établissement correcte des données d''entrée', 1, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (169, N'Établissement correcte des données de sortie', 2, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (170, N'Établissement correcte de la nature des traitements', 3, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (171, N'Détermination correcte des conditions d’exécution de l''algorithme', 4, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (172, N'Choix d’un mode de représentation de l''algorithme conforme aux exigences de l''entreprise', 1, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (173, N'Détermination d''une séquence logique des opérations', 2, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (174, N'Détermination des structures de traitement appropriées à chacune des opérations', 3, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (175, N'Application rigoureuse des règles de syntaxe propres au mode de représentation retenu', 4, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (176, N'Recherche d''une solution algorithmique efficace', 5, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (177, N'Représentation précise de la solution algorithmique retenue', 6, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (178, N'Présence de toute l''information nécessaire à l''interprétation de l''algorithme', 7, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (179, N'Vérification de la pertinence de la solution compte tenu de la situation initiale', 1, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (180, N'Détermination des erreurs et des lacunes de la solution algorithmique mise au point', 2, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (181, N'Modification appropriée de la solution algorithmique', 3, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (182, N'Examen des caractéristiques des utilisatrices et des utilisateurs liées à l’âge, à la culture et à la scolarisation', 1, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (183, N'Détermination du degré de familiarité avec l’informatique en général et avec l’application à utiliser', 2, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (184, N'Détermination du degré de réceptivité des utilisatrices et des utilisateurs par rapport à l’application à utiliser', 3, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (185, N'Précision des attentes des utilisatrices et des utilisateurs', 4, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (186, N'Reconnaissance des caractéristiques de l’environnement physique', 1, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (187, N'Détermination des modalités d’interaction', 2, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (188, N'Définition des caractéristiques des tâches d’interaction', 3, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (189, N'Vérification de la cohérence entre les modalités et les tâches', 4, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (190, N'Prise en considération des caractéristiques des utilisatrices et des utilisateurs', 1, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (191, N'Prise en considération des caractéristiques de l’interaction', 2, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (192, N'Prise en considération des caractéristiques des exigences d’ergonomie', 3, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (193, N'Prise en considération des contraintes de fiabilité, de coût et de maintenance', 4, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (194, N'Interprétation correcte des fiches techniques des produits offerts sur le marché', 5, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (195, N'Établissement des actions et des exceptions liées aux tâches', 1, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (196, N'Détermination des éléments de présentation des actions et des exceptions', 2, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (197, N'Organisation spatiale appropriée des éléments', 3, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (198, N'Détermination des caractéristiques de présentation des éléments', 4, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (199, N'Organisation de l’interface conforme aux critères d’esthétisme et d’efficacité', 5, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (200, N'Consignation de l’information relative à l’interface', 6, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (201, N'Création des éléments selon les caractéristiques de présentation choisies', 1, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (202, N'Positionnement des éléments selon l’organisation spatiale retenue', 2, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (203, N'Établissement des liens entre les éléments et les programmes de l’application', 3, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (204, N'Validation du fonctionnement de l’interface', 4, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (205, N'Détermination correcte des principales tâches et de leur séquence', 1, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (206, N'Estimation du temps nécessaire à l’exécution des principales tâches', 2, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (207, N'Prise en considération des échéances établies pour l’exécution du travail', 3, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (208, N'Établissement correct de priorités', 1, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (209, N'Prise en considération des points critiques', 2, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (210, N'Prévision d’une marge de manœuvre suffisante pour faire face aux imprévus', 3, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (211, N'Utilisation appropriée des méthodes et des outils de planification', 4, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (212, N'Établissement d’un calendrier des travaux réaliste', 5, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (213, N'Détermination correcte des ressources humaines et matérielles nécessaires à l’exécution du travail', 6, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (214, N'Communication efficace avec les personnes en cause', 7, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (215, N'Présentation correcte du plan de travail pour approbation', 8, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (216, N'Utilisation d’une méthode appropriée de suivi des activités', 1, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (217, N'Gestion efficace du temps', 2, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (218, N'Respect du calendrier des travaux', 3, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (219, N'Adaptation régulière du calendrier des travaux en fonction des imprévus', 4, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (220, N'Détermination juste du support nécessaire', 1, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (221, N'Sélection et utilisation correcte du logiciel de création du document', 2, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (222, N'Établissement juste du plan de travail pour le document à produire', 1, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (223, N'Préparation appropriée des éléments de contenu', 2, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (224, N'Application rigoureuse des règles grammaticales et orthographiques', 3, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (225, N'Établissement correct du format de mise en page', 4, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (226, N'Adaptation correcte du niveau de langage en fonction du public cible', 5, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (227, N'Clarté du texte', 6, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (228, N'Utilisation efficace des logiciels de bureautique et de multimédia', 7, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (229, N'Respect des normes de mise en page', 8, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (230, N'Sélection des éléments qui nécessitent de l’aide en ligne', 1, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (231, N'Respect des normes de présentation', 2, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (232, N'Application rigoureuse des règles grammaticales et orthographiques', 3, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (233, N'Adaptation correcte du niveau de langage en fonction du public cible', 4, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (234, N'Utilisation correcte du logiciel de création d’aide en ligne', 5, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (235, N'Facilité d’utilisation de l’aide en ligne', 6, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (236, N'Vérification de la cohérence de l’aide en ligne', 7, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (237, N'Prise en considération des objectifs d’apprentissage en fonction du public cible et du contexte de formation', 1, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (238, N'Préparation appropriée des éléments de contenu', 2, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (239, N'Utilisation correcte des outils de production du document', 3, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (240, N'Respect des normes de présentation', 4, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (241, N'Application rigoureuse des règles grammaticales et orthographiques', 5, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (242, N'Adaptation correcte du niveau de langage en fonction du public cible', 6, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (243, N'Vérification minutieuse du document', 7, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (244, N'Établissement juste de la liste de diffusion', 1, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (245, N'Sélection et utilisation du mode de diffusion', 2, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (246, N'Vérification systématique de la réception', 3, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (247, N'Respect des règles de conservation d’un document', 1, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (248, N'Attribution précise d’un code à partir du plan de classification', 2, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (249, N'Précision et concision du titre d’un document selon les normes', 3, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (250, N'Consignation minutieuse de l’information dans l’outil de repérage', 4, NULL, 58)
SET IDENTITY_INSERT CriterePerformance OFF
GO
USE master
IF EXISTS(select * from sys.databases where name='BDPlanCadreTEST')
DROP DATABASE BDPlanCadreTEST
GO

CREATE DATABASE BDPlanCadreTEST
GO

USE BDPlanCadreTEST
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
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (1, N'016N', N'Analyser les fonctions de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (2, N'016P', N'Résoudre des problèmes mathématiques et
statistiques en informatique', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (3, N'016Q', N'Mettre à profit les possibilités d''un système
d''exploitation propre à une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (4, N'016R', N'Installer des éléments physiques et logiques
dans une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (5, N'016S', N'Exploiter un langage de programmation
structurée', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (6, N'016T', N'Appliquer une approche de développement par
objets', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (7, N'016U', N'Effectuer la recherche d’information', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (8, N'026V', N'Interagir et communiquer dans des situations de
travail variées', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (9, N'016W', N'Produire des algorithmes', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (10, N'016X', N'Produire une interface utilisateur', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (11, N'016Y', N'Planifier et gérer des activités de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (12, N'016Z', N'Assurer la production et la gestion de
documents', NULL, 1, 1, NULL, 1)
SET IDENTITY_INSERT EnonceCompetence OFF
GO
SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (1, N'Caractériser les fonctions de travail et leurs conditions d''exercise', 1, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (2, N'Examiner les tâches et les opérations liées aux fonctions de travail', 2, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (3, N'Examiner les habiletés et les comportements nécessaire a l''exercice des fonctions de travail.', 3, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (4, N'Examiner la réglementation relative à l''exercice de la profession en général', 4, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (5, N'Effectuer des traitements sur des données
internes de l’ordinateur', 1, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (6, N'Effectuer des opérations logiques', 2, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (7, N'Organiser et traiter de l’information', 3, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (8, N'Résoudre des problèmes de
programmation linéaire', 4, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (9, N'Résoudre des problèmes de
dénombrement', 5, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (10, N'Résoudre des problèmes de probabilité et
de statistique', 6, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (11, N'Exploiter un système de fichiers', 1, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (12, N'Automatiser des tâches', 2, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (13, N'Utiliser les mécanismes de gestion de la
mémoire', 3, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (14, N'Personnaliser l''environnement de la station
de travail', 4, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (15, N'Analyser l''architecture interne de
l''ordinateur', 1, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (16, N'Planifier le travail', 2, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (17, N'Protéger l''environnement de la station de
travail', 3, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (18, N'Installer des éléments physiques', 4, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (19, N'Désinstaller des éléments physiques', 5, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (20, N'Installer des éléments logiques', 6, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (21, N'Désinstaller des éléments logiques', 7, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (22, N'Vérifier l''installation de la station de
travail dans l''environnement de
l''utilisatrice et de l''utilisateur', 8, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (23, N'Consigner l''information sur l''installation', 9, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (24, N'Préparer l’environnement de
programmation.', 1, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (25, N'Adapter l’algorithme aux contraintes du
langage de programmation.', 2, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (26, N'Traduire l’algorithme dans le langage de
programmation.', 3, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (27, N'Compiler le programme', 4, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (28, N'Valider le programme', 5, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (29, N'Créer un modèle objet', 1, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (30, N'Perfectionner le modèle objet', 2, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (31, N'Procéder à la codification d’une classe', 3, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (32, N'Valider le fonctionnement d’une classe', 4, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (33, N'Générer la version exécutable du
programme', 5, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (34, N'Préciser le besoin d’information', 1, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (35, N'Sélectionner et utiliser les sources de
recherche', 2, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (36, N'Consulter et extraire l’information
nécessaire', 3, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (37, N'Consigner les résultats de la recherche', 4, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (38, N'Établir et entretenir des relations
interpersonnelles', 1, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (39, N'Communiquer avec des personnes à
l’interne et à l’externe', 2, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (40, N'Travailler au sein d’une équipe
multidisciplinaire', 3, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (41, N'Appliquer une approche client', 4, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (42, N'Analyser la situation', 1, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (43, N'Mettre au point l''algorithme', 2, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (44, N'Valider l''algorithme', 3, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (45, N'Analyser les caractéristiques des
utilisatrices et des utilisateurs', 1, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (46, N'Établir les caractéristiques d’interaction', 2, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (47, N'Choisir des périphériques d’entrée et de
sortie', 3, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (48, N'Planifier l’organisation globale de
l’interface', 4, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (49, N'Procéder à la programmation de l’interface
utilisateur', 5, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (50, N'Analyser les caractéristiques du travail à
effectuer', 1, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (51, N'Procéder à la planification des activités', 2, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (52, N'Assurer le suivi des activités de travail', 3, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (53, N'Choisir le support du document', 1, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (54, N'Produire un document technique et
administratif', 2, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (55, N'Produire l’aide en ligne', 3, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (56, N'Produire un document de formation', 4, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (57, N'Diffuser un document', 5, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (58, N'Classer un document', 6, NULL, NULL, 12)
SET IDENTITY_INSERT ElementCompetence OFF
GO
SET IDENTITY_INSERT ContexteRealisation ON
GO
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (1, N'a l''aide d''une information récente sur les fonctions de travail suivantes : - programeuse-analyste et programeur-analyste dans les domaine de la gestion et de l''indutrie', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (2, N'À l''aide d''une information récente sur les entreprses dans lesquelles on trouve la programeuse-analyste et le programmeur-analyste et la et le gestionnaire de réseaux informatique', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (3, N'À partir de situations propres au domaine de l''informatique', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (4, N'À partir d''une station de travail et d’un logiciel de statistiques', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (5, N'À l''aide des manuels de références techniques appropriés', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (6, N'Dans des environnements utilisant des systèmes d’exploitation variés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (7, N'À partir d''une station de travail et des logiciels appropriés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (8, N'À l''aide des manuels de références techniques appropriés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (9, N'À partir des normes et des exigences de l''entreprise', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (10, N'En atelier et sur le lieu de travail de l''utilisatrice et de l''utilisateur', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (11, N'À partir d''une demande préautorisée précisant la nature de l''installation', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (12, N'À partir d''une station de travail', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (13, N'À l''aide des éléments physiques et logiques à installer et des outils appropriés', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (14, N'À partir des normes et des exigences de l''entreprise', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (15, N'À l''aide des manuels de références techniques appropriés', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (16, N'À partir d’une station de travail et des logiciels appropriés', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (17, N'À partir d’algorithmes valides et représentatifs du milieu de travail', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (18, N'À partir des normes et des exigences de l’entreprise', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (19, N'À l’aide des manuels de références techniques appropriés à l’environnement de programmation', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (20, N'À partir d''une station de travail et des logiciels appropriés', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (21, N'À partir de situations représentatives du milieu du travail et nécessitant le développement d’applications comportant un nombre limité de classes', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (22, N'À partir des normes et des exigences de l''entreprise', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (23, N'À l’aide de toute la documentation disponible sur les applications à développer', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (24, N'À l''aide des manuels de références techniques appropriés', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (25, N'À partir de besoins d’information précis propres au milieu de travail', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (26, N'À partir de besoins d’information liés à la veille technologique', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (27, N'À partir d’une station de travail et des logiciels appropriés', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (28, N'À l’aide de manuels de références en français et en anglais', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (29, N'Dans des situations de travail variées', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (30, N'En présence des personnes en cause', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (31, N'À partir de situations variées représentatives du milieu de travail', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (32, N'À partir d''une station de travail et des logiciels appropriés', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (33, N'À partir des exigences de l''entreprise', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (34, N'À l’aide des manuels de références techniques appropriés', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (35, N'À partir d''une station de travail et des logiciels appropriés', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (36, N'À partir d’applications variées nécessitant la création d’interfaces', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (37, N'À partir des manuels de références techniques appropriés', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (38, N'À partir des exigences de l''entreprise et des standards de l’informatique', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (39, N'Dans des situations de travail propres à la profession', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (40, N'À l’aide des outils de planification appropriés', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (41, N'À partir des exigences de l''entreprise', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (42, N'Pour des documents en français et en anglais', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (43, N'À partir d’une station de travail et des logiciels de bureautique, de multimédia et de création d’aide en ligne', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (44, N'À l’aide de dictionnaires, de grammaires et d’outils de référence variés', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (45, N'À l’aide de l’inforoute et des services de télécommunication', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (46, N'À partir des exigences de l’entreprise', NULL, 12)
SET IDENTITY_INSERT ContexteRealisation OFF
GO
SET IDENTITY_INSERT CriterePerformance ON
GO
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (1, N'Pertinence de l’information recueillie', 1, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (2, N'Examen complet des caractéristiques générales des fonctions de travail et de leurs conditions d’exercice', 2, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (3, N'Reconnaissance des possibilités d’exercice des professions en entreprise et de pratique entrepreneuriale dans le domaine de l’informatique', 3, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (4, N'Reconnaissance des effets, sur le travail, de l’évolution technologique rapide dans le domaine de l’informatique', 4, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (5, N'Examen complet des opérations, ainsi que des conditions d’exécution et des critères de performance des tâches associés aux différentes fonctions de travail', 1, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (6, N'Détermination exacte de l’importance relative des activités', 2, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (7, N'Mise en relation des étapes du processus de travail avec les tâches des fonctions de travail', 3, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (8, N'Pertinence des liens établis entre les habiletés et comportements et les différentes tâches des fonctions de travail', 1, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (9, N'Examen complet des exigences liées à l’éthique professionnelle', 2, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (10, N'Reconnaissance des droits et des responsabilités des personnes dans les relations employeur-employé et client-fournisseur', 1, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (11, N'Reconnaissance des conséquences des manquements aux lois et règlements', 2, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (12, N'Représentation correcte de nombres dans différentes bases', 1, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (13, N'Conversion correcte de nombres d’une base à une autre', 2, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (14, N'Exécution correcte des opérations arithmétiques dans différentes bases', 3, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (15, N'Représentation juste de données dans la mémoire de l’ordinateur', 4, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (16, N'Interprétation juste des limites de représentation des données dans la mémoire de l’ordinateur', 5, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (17, N'Formulation de propositions appropriées à différentes situations', 1, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (18, N'Construction d’une table de vérité conforme à une proposition', 2, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (19, N'Simplification correcte d’une proposition', 3, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (20, N'Utilisation appropriée de la méthode de preuve par induction', 4, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (21, N'Construction d’ensembles et de sous-ensembles appropriés à différentes situations', 1, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (22, N'Exécution correcte de toutes les opérations dans les ensembles', 2, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (23, N'Établissement de relations justes entre des ensembles', 3, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (24, N'Formulation de propositions appropriées et dans leur forme la plus simple en vue de traiter l’information dans une situation donnée', 4, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (25, N'Traduction correcte des propositions en langage ensembliste', 5, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (26, N'Représentation d’une situation sous forme d’un système d’équations linéaires approprié', 1, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (27, N'Exécution correcte des opérations dans les matrices', 2, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (28, N'Représentation juste d’un système d’équations linéaires sous forme matricielle', 3, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (29, N'Application correcte de méthodes de résolution de problèmes d’un système d’équations linéaires', 4, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (30, N'Calcul exact du nombre de permutations dans un contexte donné', 1, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (31, N'Calcul exact du nombre d’arrangements dans un contexte donné', 2, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (32, N'Calcul exact du nombre de combinaisons dans un contexte donné', 3, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (33, N'Calcul des probabilités d’événements liées aux lois binomiale, normale et de Poisson', 1, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (34, N'Détermination de la nature des variables appropriées à une situation donnée', 2, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (35, N'Choix d’échelles de mesure appropriées à une situation donnée', 3, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (36, N'Choix des mesures statistiques appropriées à une situation donnée', 4, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (37, N'Choix judicieux du mode de représentation de l’information', 5, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (38, N'Application rigoureuse des normes de présentation des tableaux et des graphiques', 6, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (39, N'Utilisation efficace des fonctionnalités d’un logiciel de statistiques', 7, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (40, N'Choix des méthodes d’échantillonnage appropriées à une situation donnée', 8, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (41, N'Estimation par intervalle d’une moyenne et d’une proportion pour des grands échantillons', 9, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (42, N'Comparaison des possibilités et des limites des systèmes de fichiers de différents systèmes d''exploitation', 1, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (43, N'Utilisation correcte des commandes de manipulation des fichiers', 2, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (44, N'Utilisation correcte des commandes de manipulation des répertoires', 3, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (45, N'Utilisation correcte des commandes visant à assurer la sécurité des fichiers et des répertoires', 4, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (46, N'Utilisation correcte des outils visant le stockage et l''intégrité des données', 5, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (47, N'Analyse judicieuse des possibilités et des limites des différents systèmes d''exploitation au regard de l''exécution des tâches', 1, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (48, N'Utilisation correcte du langage de commande propre au système d''exploitation', 2, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (49, N'Utilisation appropriée des commandes en vue d’établir l’ordre de priorité des tâches', 3, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (50, N'Adaptation appropriée des paramètres de sécurité aux exigences des tâches', 4, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (51, N'Application des techniques de débogage appropriées au système d''exploitation', 5, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (52, N'Consignation des commentaires pertinents', 6, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (53, N'Analyse judicieuse des possibilités et des limites des différents systèmes d''exploitation au regard de la gestion de la mémoire', 1, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (54, N'Allocation de la mémoire appropriée aux besoins relatifs à l''exécution d''une tâche', 2, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (55, N'Comparaison des différents types de fichiers de configuration propres au système d''exploitation', 1, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (56, N'Utilisation correcte des commandes de configuration de base du poste de travail', 2, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (57, N'Utilisation correcte des commandes de démarrage et de configuration des périphériques', 3, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (58, N'Démarrage des programmes appropriés aux besoins de l''utilisatrice et de l''utilisateur', 4, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (59, N'Adaptation des paramètres de configuration de l''environnement de travail aux exigences de l''utilisatrice et de l''utilisateur', 5, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (60, N'Consignation précise des paramètres de personnalisation', 6, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (61, N'Distinction et repérage des éléments de la carte maîtresse', 1, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (62, N'Reconnaissance des caractéristiques et des fonctions propres aux processeurs, aux mémoires, aux bus et aux horloges', 2, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (63, N'Reconnaissance des caractéristiques et des fonctions propres aux différents ports de communication', 3, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (64, N'Reconnaissance des relations entre les différents éléments', 4, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (65, N'Analyse judicieuse de la demande', 1, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (66, N'Préparation du matériel nécessaire', 2, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (67, N'Détermination juste de la séquence des opérations', 3, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (68, N'Consignation complète de la configuration physique initiale', 1, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (69, N'Copie de l''ensemble des données', 2, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (70, N'Prise des mesures de sécurité appropriées', 3, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (71, N'Interprétation correcte des fiches techniques', 1, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (72, N'Détermination appropriée de chacun des paramètres d''installation', 2, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (73, N'Installation de l''élément à l''endroit approprié', 3, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (74, N'Configuration conforme à l''environnement du poste', 4, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (75, N'Vérification appropriée du fonctionnement de l''élément', 5, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (76, N'Interprétation judicieuse de l’information technique', 1, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (77, N'Respect du processus de désinstallation en fonction de l’élément à retirer', 2, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (78, N'Prise des précautions appropriées', 3, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (79, N'Interprétation judicieuse de l''information technique', 1, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (80, N'Démarrage approprié de l''installation', 2, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (81, N'Choix des paramètres d''installation en fonction de l''environnement du poste', 3, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (82, N'Vérification approprié du fonctionnement de l''élément', 4, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (83, N'Personnalisation de l''élément appropriée aux besoins de l’utilisatrice et de l''utilisateur', 5, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (84, N'Copie correcte des disques', 1, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (85, N'Interprétation judicieuse de l''information technique', 2, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (86, N'Utilisation appropriée des outils de désinstallation', 3, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (87, N'Respect du processus de désinstallation manuelle', 4, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (88, N'Vérification appropriée du fonctionnement de l''ensemble des éléments', 1, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (89, N'Résolution efficace des problèmes d''installation', 2, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (90, N'Installation de la station de travail conforme aux principes de l''ergonomie', 3, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (91, N'Prise en note de la nouvelle configuration', 1, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (92, N'Rédaction claire et correcte des problèmes éprouvés et des solutions apportées', 2, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (93, N'Mise à jour précise de l''inventaire', 3, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (94, N'Vérification méthodique de l’accès aux différents éléments physiques et logiques de l’environnement', 1, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (95, N'Configuration de l’environnement appropriée aux caractéristiques de la situation', 2, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (96, N'Personnalisation de l’environnement efficace et conforme aux exigences de l’entreprise', 3, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (97, N'Modification appropriée de la représentation des données', 1, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (98, N'Adaptation correcte des conditions d’exécution', 2, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (99, N'Modification appropriée des structures de traitement', 3, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (100, N'Adaptation appropriée de la séquence des opérations', 4, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (101, N'Utilisation efficace des fonctionnalités d’édition de l’environnement', 1, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (102, N'Application des règles de syntaxe et de sémantique propres au langage utilisé', 2, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (103, N'Application rigoureuse des standards de codification', 3, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (104, N'Application judicieuse des principes de la programmation structurée', 4, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (105, N'Mise à profit judicieuse des possibilités du langage', 5, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (106, N'Consignation des commentaires pertinents et conformes aux exigences de l’entreprise', 6, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (107, N'Utilisation efficace des fonctionnalités de compilation de l’environnement', 1, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (108, N'Repérage des erreurs de compilation', 2, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (109, N'Correction des erreurs de compilation', 3, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (110, N'Utilisation efficace des fonctionnalités d’exécution et de débogage de l’environnement', 1, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (111, N'Préparation correcte des jeux d’essai nécessaires à la vérification du fonctionnement du programme', 2, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (112, N'Interprétation juste des résultats', 3, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (113, N'Débogage approprié du programme selon l’algorithme', 4, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (114, N'Établissement complet des domaines d’application', 1, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (115, N'Détermination des classes pertinentes', 2, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (116, N'Établissement des relations hiérarchiques appropriées entre les classes', 3, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (117, N'Détermination des services de chacune des classes', 4, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (118, N'Détermination des attributs pertinents compte tenu de chacune des classes', 5, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (119, N'Représentation graphique appropriée du modèle objet', 6, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (120, N'Mise au point de la séquence des opérations propres aux différents services de la classe', 1, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (121, N'Représentation graphique appropriée du modèle séquentiel', 2, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (122, N'Modification appropriée du modèle objet', 3, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (123, N'Préparation appropriée de l''environnement de programmation', 1, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (124, N'Déclaration et définition de la classe respectant les règles de syntaxe et de sémantique du langage', 2, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (125, N'Exploitation judicieuse des possibilités du langage dans l''application des principes d''encapsulation, d''héritage et de polymorphisme', 3, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (126, N'Application rigoureuse des standards de nomenclature et de documentation reconnus propres à l''entreprise', 4, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (127, N'Repérage et correction des erreurs de compilation de la classe', 5, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (128, N'Préparation correcte des jeux d''essai nécessaires à la vérification du bon fonctionnement de tous les services de la classe', 1, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (129, N'Création d''un environnement de test approprié', 2, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (130, N'Interprétation juste des résultats', 3, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (131, N'Débogage approprié de la classe', 4, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (132, N'Utilisation des mécanismes de génération propres à l’outil employé', 1, NULL, 33)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (133, N'Précision juste du besoin de recherche', 1, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (134, N'Détermination des critères permettant de choisir correctement les sources de la recherche', 2, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (135, N'Manifestation d’initiative', 3, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (136, N'Sélection judicieuse des sources en fonction de la nature et des critères de la recherche', 1, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (137, N'Utilisation correcte et efficace des méthodes et des outils de recherche conventionnels et informatiques', 2, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (138, N'Prise en considération des risques de s’éloigner du besoin initial', 3, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (139, N'Pertinence de l’information consultée', 1, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (140, N'Interprétation juste de l’information en français et en anglais', 2, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (141, N'Pertinence de l’information extraite en fonction du besoin initial', 3, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (142, N'Manifestation de curiosité', 4, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (143, N'Clarté, précision et pertinence de l’information consignée', 1, NULL, 37)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (144, N'Prise en considération de ses forces et de ses faiblesses en matière de relations interpersonnelles', 1, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (145, N'Manifestation d’attitudes favorisant des relations interpersonnelles harmonieuses', 2, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (146, N'Application rigoureuse des règles de politesse et de courtoisie', 3, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (147, N'Adaptation de son approche selon les personnes et les situations', 4, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (148, N'Utilisation appropriée des techniques de gestion des conflits interpersonnels', 5, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (149, N'Manifestation de comportements conformes à l’éthique professionnelle', 6, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (150, N'Manifestation d’une attitude d’écoute et de réceptivité', 1, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (151, N'Adaptation du niveau de langage selon l’interlocutrice et l’interlocuteur', 2, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (152, N'Application correcte des techniques de communication verbale et non verbale', 3, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (153, N'Utilisation appropriée des techniques de négociation et d’argumentation', 4, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (154, N'Distinction juste du rôle et des responsabilités des membres de l’équipe', 1, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (155, N'Prise de ses responsabilités au sein de l’équipe', 2, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (156, N'Contribution active aux activités de l’équipe', 3, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (157, N'Utilisation appropriée des techniques de négociation et d’argumentation', 4, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (158, N'Manifestation d’attitudes favorisant le travail d’équipe', 5, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (159, N'Respect du mode d’action établi par l’équipe', 6, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (160, N'Respect des décisions prises par les membres de l’équipe', 7, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (161, N'Contribution efficace à la résolution des problèmes éprouvés par les membres de l’équipe', 8, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (162, N'Interprétation juste des besoins', 1, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (163, N'Manifestation d’un souci constant de répondre aux besoins des clientes et des clients', 2, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (164, N'Vérification régulière de la satisfaction des clientes et des clients', 3, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (165, N'Réaction appropriée devant les problèmes soulevés par les clientes et les clients', 4, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (166, N'Manifestation d’un souci constant d’améliorer la qualité des services et des produits', 5, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (167, N'Manifestation de comportements conformes à l’éthique professionnelle', 6, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (168, N'Établissement correcte des données d''entrée', 1, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (169, N'Établissement correcte des données de sortie', 2, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (170, N'Établissement correcte de la nature des traitements', 3, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (171, N'Détermination correcte des conditions d’exécution de l''algorithme', 4, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (172, N'Choix d’un mode de représentation de l''algorithme conforme aux exigences de l''entreprise', 1, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (173, N'Détermination d''une séquence logique des opérations', 2, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (174, N'Détermination des structures de traitement appropriées à chacune des opérations', 3, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (175, N'Application rigoureuse des règles de syntaxe propres au mode de représentation retenu', 4, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (176, N'Recherche d''une solution algorithmique efficace', 5, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (177, N'Représentation précise de la solution algorithmique retenue', 6, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (178, N'Présence de toute l''information nécessaire à l''interprétation de l''algorithme', 7, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (179, N'Vérification de la pertinence de la solution compte tenu de la situation initiale', 1, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (180, N'Détermination des erreurs et des lacunes de la solution algorithmique mise au point', 2, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (181, N'Modification appropriée de la solution algorithmique', 3, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (182, N'Examen des caractéristiques des utilisatrices et des utilisateurs liées à l’âge, à la culture et à la scolarisation', 1, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (183, N'Détermination du degré de familiarité avec l’informatique en général et avec l’application à utiliser', 2, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (184, N'Détermination du degré de réceptivité des utilisatrices et des utilisateurs par rapport à l’application à utiliser', 3, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (185, N'Précision des attentes des utilisatrices et des utilisateurs', 4, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (186, N'Reconnaissance des caractéristiques de l’environnement physique', 1, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (187, N'Détermination des modalités d’interaction', 2, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (188, N'Définition des caractéristiques des tâches d’interaction', 3, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (189, N'Vérification de la cohérence entre les modalités et les tâches', 4, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (190, N'Prise en considération des caractéristiques des utilisatrices et des utilisateurs', 1, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (191, N'Prise en considération des caractéristiques de l’interaction', 2, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (192, N'Prise en considération des caractéristiques des exigences d’ergonomie', 3, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (193, N'Prise en considération des contraintes de fiabilité, de coût et de maintenance', 4, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (194, N'Interprétation correcte des fiches techniques des produits offerts sur le marché', 5, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (195, N'Établissement des actions et des exceptions liées aux tâches', 1, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (196, N'Détermination des éléments de présentation des actions et des exceptions', 2, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (197, N'Organisation spatiale appropriée des éléments', 3, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (198, N'Détermination des caractéristiques de présentation des éléments', 4, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (199, N'Organisation de l’interface conforme aux critères d’esthétisme et d’efficacité', 5, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (200, N'Consignation de l’information relative à l’interface', 6, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (201, N'Création des éléments selon les caractéristiques de présentation choisies', 1, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (202, N'Positionnement des éléments selon l’organisation spatiale retenue', 2, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (203, N'Établissement des liens entre les éléments et les programmes de l’application', 3, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (204, N'Validation du fonctionnement de l’interface', 4, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (205, N'Détermination correcte des principales tâches et de leur séquence', 1, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (206, N'Estimation du temps nécessaire à l’exécution des principales tâches', 2, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (207, N'Prise en considération des échéances établies pour l’exécution du travail', 3, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (208, N'Établissement correct de priorités', 1, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (209, N'Prise en considération des points critiques', 2, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (210, N'Prévision d’une marge de manœuvre suffisante pour faire face aux imprévus', 3, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (211, N'Utilisation appropriée des méthodes et des outils de planification', 4, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (212, N'Établissement d’un calendrier des travaux réaliste', 5, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (213, N'Détermination correcte des ressources humaines et matérielles nécessaires à l’exécution du travail', 6, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (214, N'Communication efficace avec les personnes en cause', 7, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (215, N'Présentation correcte du plan de travail pour approbation', 8, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (216, N'Utilisation d’une méthode appropriée de suivi des activités', 1, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (217, N'Gestion efficace du temps', 2, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (218, N'Respect du calendrier des travaux', 3, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (219, N'Adaptation régulière du calendrier des travaux en fonction des imprévus', 4, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (220, N'Détermination juste du support nécessaire', 1, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (221, N'Sélection et utilisation correcte du logiciel de création du document', 2, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (222, N'Établissement juste du plan de travail pour le document à produire', 1, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (223, N'Préparation appropriée des éléments de contenu', 2, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (224, N'Application rigoureuse des règles grammaticales et orthographiques', 3, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (225, N'Établissement correct du format de mise en page', 4, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (226, N'Adaptation correcte du niveau de langage en fonction du public cible', 5, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (227, N'Clarté du texte', 6, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (228, N'Utilisation efficace des logiciels de bureautique et de multimédia', 7, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (229, N'Respect des normes de mise en page', 8, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (230, N'Sélection des éléments qui nécessitent de l’aide en ligne', 1, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (231, N'Respect des normes de présentation', 2, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (232, N'Application rigoureuse des règles grammaticales et orthographiques', 3, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (233, N'Adaptation correcte du niveau de langage en fonction du public cible', 4, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (234, N'Utilisation correcte du logiciel de création d’aide en ligne', 5, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (235, N'Facilité d’utilisation de l’aide en ligne', 6, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (236, N'Vérification de la cohérence de l’aide en ligne', 7, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (237, N'Prise en considération des objectifs d’apprentissage en fonction du public cible et du contexte de formation', 1, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (238, N'Préparation appropriée des éléments de contenu', 2, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (239, N'Utilisation correcte des outils de production du document', 3, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (240, N'Respect des normes de présentation', 4, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (241, N'Application rigoureuse des règles grammaticales et orthographiques', 5, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (242, N'Adaptation correcte du niveau de langage en fonction du public cible', 6, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (243, N'Vérification minutieuse du document', 7, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (244, N'Établissement juste de la liste de diffusion', 1, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (245, N'Sélection et utilisation du mode de diffusion', 2, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (246, N'Vérification systématique de la réception', 3, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (247, N'Respect des règles de conservation d’un document', 1, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (248, N'Attribution précise d’un code à partir du plan de classification', 2, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (249, N'Précision et concision du titre d’un document selon les normes', 3, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (250, N'Consignation minutieuse de l’information dans l’outil de repérage', 4, NULL, 58)
SET IDENTITY_INSERT CriterePerformance OFF
GO
USE master
IF EXISTS(select * from sys.databases where name='BDPlanCadreTEST')
DROP DATABASE BDPlanCadreTEST
GO

CREATE DATABASE BDPlanCadreTEST
GO

USE BDPlanCadreTEST
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
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (1, N'016N', N'Analyser les fonctions de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (2, N'016P', N'Résoudre des problèmes mathématiques et
statistiques en informatique', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (3, N'016Q', N'Mettre à profit les possibilités d''un système
d''exploitation propre à une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (4, N'016R', N'Installer des éléments physiques et logiques
dans une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (5, N'016S', N'Exploiter un langage de programmation
structurée', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (6, N'016T', N'Appliquer une approche de développement par
objets', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (7, N'016U', N'Effectuer la recherche d’information', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (8, N'026V', N'Interagir et communiquer dans des situations de
travail variées', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (9, N'016W', N'Produire des algorithmes', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (10, N'016X', N'Produire une interface utilisateur', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (11, N'016Y', N'Planifier et gérer des activités de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (12, N'016Z', N'Assurer la production et la gestion de
documents', NULL, 1, 1, NULL, 1)
SET IDENTITY_INSERT EnonceCompetence OFF
GO
SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (1, N'Caractériser les fonctions de travail et leurs conditions d''exercise', 1, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (2, N'Examiner les tâches et les opérations liées aux fonctions de travail', 2, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (3, N'Examiner les habiletés et les comportements nécessaire a l''exercice des fonctions de travail.', 3, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (4, N'Examiner la réglementation relative à l''exercice de la profession en général', 4, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (5, N'Effectuer des traitements sur des données
internes de l’ordinateur', 1, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (6, N'Effectuer des opérations logiques', 2, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (7, N'Organiser et traiter de l’information', 3, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (8, N'Résoudre des problèmes de
programmation linéaire', 4, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (9, N'Résoudre des problèmes de
dénombrement', 5, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (10, N'Résoudre des problèmes de probabilité et
de statistique', 6, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (11, N'Exploiter un système de fichiers', 1, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (12, N'Automatiser des tâches', 2, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (13, N'Utiliser les mécanismes de gestion de la
mémoire', 3, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (14, N'Personnaliser l''environnement de la station
de travail', 4, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (15, N'Analyser l''architecture interne de
l''ordinateur', 1, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (16, N'Planifier le travail', 2, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (17, N'Protéger l''environnement de la station de
travail', 3, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (18, N'Installer des éléments physiques', 4, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (19, N'Désinstaller des éléments physiques', 5, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (20, N'Installer des éléments logiques', 6, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (21, N'Désinstaller des éléments logiques', 7, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (22, N'Vérifier l''installation de la station de
travail dans l''environnement de
l''utilisatrice et de l''utilisateur', 8, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (23, N'Consigner l''information sur l''installation', 9, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (24, N'Préparer l’environnement de
programmation.', 1, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (25, N'Adapter l’algorithme aux contraintes du
langage de programmation.', 2, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (26, N'Traduire l’algorithme dans le langage de
programmation.', 3, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (27, N'Compiler le programme', 4, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (28, N'Valider le programme', 5, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (29, N'Créer un modèle objet', 1, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (30, N'Perfectionner le modèle objet', 2, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (31, N'Procéder à la codification d’une classe', 3, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (32, N'Valider le fonctionnement d’une classe', 4, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (33, N'Générer la version exécutable du
programme', 5, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (34, N'Préciser le besoin d’information', 1, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (35, N'Sélectionner et utiliser les sources de
recherche', 2, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (36, N'Consulter et extraire l’information
nécessaire', 3, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (37, N'Consigner les résultats de la recherche', 4, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (38, N'Établir et entretenir des relations
interpersonnelles', 1, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (39, N'Communiquer avec des personnes à
l’interne et à l’externe', 2, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (40, N'Travailler au sein d’une équipe
multidisciplinaire', 3, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (41, N'Appliquer une approche client', 4, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (42, N'Analyser la situation', 1, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (43, N'Mettre au point l''algorithme', 2, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (44, N'Valider l''algorithme', 3, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (45, N'Analyser les caractéristiques des
utilisatrices et des utilisateurs', 1, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (46, N'Établir les caractéristiques d’interaction', 2, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (47, N'Choisir des périphériques d’entrée et de
sortie', 3, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (48, N'Planifier l’organisation globale de
l’interface', 4, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (49, N'Procéder à la programmation de l’interface
utilisateur', 5, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (50, N'Analyser les caractéristiques du travail à
effectuer', 1, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (51, N'Procéder à la planification des activités', 2, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (52, N'Assurer le suivi des activités de travail', 3, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (53, N'Choisir le support du document', 1, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (54, N'Produire un document technique et
administratif', 2, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (55, N'Produire l’aide en ligne', 3, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (56, N'Produire un document de formation', 4, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (57, N'Diffuser un document', 5, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (58, N'Classer un document', 6, NULL, NULL, 12)
SET IDENTITY_INSERT ElementCompetence OFF
GO
SET IDENTITY_INSERT ContexteRealisation ON
GO
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (1, N'a l''aide d''une information récente sur les fonctions de travail suivantes : - programeuse-analyste et programeur-analyste dans les domaine de la gestion et de l''indutrie', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (2, N'À l''aide d''une information récente sur les entreprses dans lesquelles on trouve la programeuse-analyste et le programmeur-analyste et la et le gestionnaire de réseaux informatique', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (3, N'À partir de situations propres au domaine de l''informatique', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (4, N'À partir d''une station de travail et d’un logiciel de statistiques', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (5, N'À l''aide des manuels de références techniques appropriés', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (6, N'Dans des environnements utilisant des systèmes d’exploitation variés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (7, N'À partir d''une station de travail et des logiciels appropriés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (8, N'À l''aide des manuels de références techniques appropriés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (9, N'À partir des normes et des exigences de l''entreprise', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (10, N'En atelier et sur le lieu de travail de l''utilisatrice et de l''utilisateur', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (11, N'À partir d''une demande préautorisée précisant la nature de l''installation', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (12, N'À partir d''une station de travail', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (13, N'À l''aide des éléments physiques et logiques à installer et des outils appropriés', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (14, N'À partir des normes et des exigences de l''entreprise', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (15, N'À l''aide des manuels de références techniques appropriés', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (16, N'À partir d’une station de travail et des logiciels appropriés', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (17, N'À partir d’algorithmes valides et représentatifs du milieu de travail', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (18, N'À partir des normes et des exigences de l’entreprise', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (19, N'À l’aide des manuels de références techniques appropriés à l’environnement de programmation', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (20, N'À partir d''une station de travail et des logiciels appropriés', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (21, N'À partir de situations représentatives du milieu du travail et nécessitant le développement d’applications comportant un nombre limité de classes', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (22, N'À partir des normes et des exigences de l''entreprise', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (23, N'À l’aide de toute la documentation disponible sur les applications à développer', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (24, N'À l''aide des manuels de références techniques appropriés', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (25, N'À partir de besoins d’information précis propres au milieu de travail', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (26, N'À partir de besoins d’information liés à la veille technologique', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (27, N'À partir d’une station de travail et des logiciels appropriés', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (28, N'À l’aide de manuels de références en français et en anglais', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (29, N'Dans des situations de travail variées', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (30, N'En présence des personnes en cause', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (31, N'À partir de situations variées représentatives du milieu de travail', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (32, N'À partir d''une station de travail et des logiciels appropriés', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (33, N'À partir des exigences de l''entreprise', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (34, N'À l’aide des manuels de références techniques appropriés', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (35, N'À partir d''une station de travail et des logiciels appropriés', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (36, N'À partir d’applications variées nécessitant la création d’interfaces', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (37, N'À partir des manuels de références techniques appropriés', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (38, N'À partir des exigences de l''entreprise et des standards de l’informatique', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (39, N'Dans des situations de travail propres à la profession', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (40, N'À l’aide des outils de planification appropriés', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (41, N'À partir des exigences de l''entreprise', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (42, N'Pour des documents en français et en anglais', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (43, N'À partir d’une station de travail et des logiciels de bureautique, de multimédia et de création d’aide en ligne', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (44, N'À l’aide de dictionnaires, de grammaires et d’outils de référence variés', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (45, N'À l’aide de l’inforoute et des services de télécommunication', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (46, N'À partir des exigences de l’entreprise', NULL, 12)
SET IDENTITY_INSERT ContexteRealisation OFF
GO
SET IDENTITY_INSERT CriterePerformance ON
GO
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (1, N'Pertinence de l’information recueillie', 1, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (2, N'Examen complet des caractéristiques générales des fonctions de travail et de leurs conditions d’exercice', 2, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (3, N'Reconnaissance des possibilités d’exercice des professions en entreprise et de pratique entrepreneuriale dans le domaine de l’informatique', 3, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (4, N'Reconnaissance des effets, sur le travail, de l’évolution technologique rapide dans le domaine de l’informatique', 4, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (5, N'Examen complet des opérations, ainsi que des conditions d’exécution et des critères de performance des tâches associés aux différentes fonctions de travail', 1, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (6, N'Détermination exacte de l’importance relative des activités', 2, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (7, N'Mise en relation des étapes du processus de travail avec les tâches des fonctions de travail', 3, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (8, N'Pertinence des liens établis entre les habiletés et comportements et les différentes tâches des fonctions de travail', 1, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (9, N'Examen complet des exigences liées à l’éthique professionnelle', 2, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (10, N'Reconnaissance des droits et des responsabilités des personnes dans les relations employeur-employé et client-fournisseur', 1, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (11, N'Reconnaissance des conséquences des manquements aux lois et règlements', 2, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (12, N'Représentation correcte de nombres dans différentes bases', 1, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (13, N'Conversion correcte de nombres d’une base à une autre', 2, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (14, N'Exécution correcte des opérations arithmétiques dans différentes bases', 3, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (15, N'Représentation juste de données dans la mémoire de l’ordinateur', 4, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (16, N'Interprétation juste des limites de représentation des données dans la mémoire de l’ordinateur', 5, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (17, N'Formulation de propositions appropriées à différentes situations', 1, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (18, N'Construction d’une table de vérité conforme à une proposition', 2, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (19, N'Simplification correcte d’une proposition', 3, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (20, N'Utilisation appropriée de la méthode de preuve par induction', 4, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (21, N'Construction d’ensembles et de sous-ensembles appropriés à différentes situations', 1, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (22, N'Exécution correcte de toutes les opérations dans les ensembles', 2, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (23, N'Établissement de relations justes entre des ensembles', 3, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (24, N'Formulation de propositions appropriées et dans leur forme la plus simple en vue de traiter l’information dans une situation donnée', 4, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (25, N'Traduction correcte des propositions en langage ensembliste', 5, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (26, N'Représentation d’une situation sous forme d’un système d’équations linéaires approprié', 1, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (27, N'Exécution correcte des opérations dans les matrices', 2, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (28, N'Représentation juste d’un système d’équations linéaires sous forme matricielle', 3, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (29, N'Application correcte de méthodes de résolution de problèmes d’un système d’équations linéaires', 4, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (30, N'Calcul exact du nombre de permutations dans un contexte donné', 1, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (31, N'Calcul exact du nombre d’arrangements dans un contexte donné', 2, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (32, N'Calcul exact du nombre de combinaisons dans un contexte donné', 3, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (33, N'Calcul des probabilités d’événements liées aux lois binomiale, normale et de Poisson', 1, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (34, N'Détermination de la nature des variables appropriées à une situation donnée', 2, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (35, N'Choix d’échelles de mesure appropriées à une situation donnée', 3, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (36, N'Choix des mesures statistiques appropriées à une situation donnée', 4, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (37, N'Choix judicieux du mode de représentation de l’information', 5, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (38, N'Application rigoureuse des normes de présentation des tableaux et des graphiques', 6, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (39, N'Utilisation efficace des fonctionnalités d’un logiciel de statistiques', 7, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (40, N'Choix des méthodes d’échantillonnage appropriées à une situation donnée', 8, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (41, N'Estimation par intervalle d’une moyenne et d’une proportion pour des grands échantillons', 9, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (42, N'Comparaison des possibilités et des limites des systèmes de fichiers de différents systèmes d''exploitation', 1, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (43, N'Utilisation correcte des commandes de manipulation des fichiers', 2, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (44, N'Utilisation correcte des commandes de manipulation des répertoires', 3, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (45, N'Utilisation correcte des commandes visant à assurer la sécurité des fichiers et des répertoires', 4, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (46, N'Utilisation correcte des outils visant le stockage et l''intégrité des données', 5, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (47, N'Analyse judicieuse des possibilités et des limites des différents systèmes d''exploitation au regard de l''exécution des tâches', 1, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (48, N'Utilisation correcte du langage de commande propre au système d''exploitation', 2, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (49, N'Utilisation appropriée des commandes en vue d’établir l’ordre de priorité des tâches', 3, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (50, N'Adaptation appropriée des paramètres de sécurité aux exigences des tâches', 4, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (51, N'Application des techniques de débogage appropriées au système d''exploitation', 5, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (52, N'Consignation des commentaires pertinents', 6, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (53, N'Analyse judicieuse des possibilités et des limites des différents systèmes d''exploitation au regard de la gestion de la mémoire', 1, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (54, N'Allocation de la mémoire appropriée aux besoins relatifs à l''exécution d''une tâche', 2, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (55, N'Comparaison des différents types de fichiers de configuration propres au système d''exploitation', 1, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (56, N'Utilisation correcte des commandes de configuration de base du poste de travail', 2, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (57, N'Utilisation correcte des commandes de démarrage et de configuration des périphériques', 3, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (58, N'Démarrage des programmes appropriés aux besoins de l''utilisatrice et de l''utilisateur', 4, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (59, N'Adaptation des paramètres de configuration de l''environnement de travail aux exigences de l''utilisatrice et de l''utilisateur', 5, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (60, N'Consignation précise des paramètres de personnalisation', 6, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (61, N'Distinction et repérage des éléments de la carte maîtresse', 1, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (62, N'Reconnaissance des caractéristiques et des fonctions propres aux processeurs, aux mémoires, aux bus et aux horloges', 2, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (63, N'Reconnaissance des caractéristiques et des fonctions propres aux différents ports de communication', 3, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (64, N'Reconnaissance des relations entre les différents éléments', 4, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (65, N'Analyse judicieuse de la demande', 1, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (66, N'Préparation du matériel nécessaire', 2, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (67, N'Détermination juste de la séquence des opérations', 3, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (68, N'Consignation complète de la configuration physique initiale', 1, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (69, N'Copie de l''ensemble des données', 2, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (70, N'Prise des mesures de sécurité appropriées', 3, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (71, N'Interprétation correcte des fiches techniques', 1, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (72, N'Détermination appropriée de chacun des paramètres d''installation', 2, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (73, N'Installation de l''élément à l''endroit approprié', 3, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (74, N'Configuration conforme à l''environnement du poste', 4, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (75, N'Vérification appropriée du fonctionnement de l''élément', 5, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (76, N'Interprétation judicieuse de l’information technique', 1, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (77, N'Respect du processus de désinstallation en fonction de l’élément à retirer', 2, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (78, N'Prise des précautions appropriées', 3, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (79, N'Interprétation judicieuse de l''information technique', 1, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (80, N'Démarrage approprié de l''installation', 2, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (81, N'Choix des paramètres d''installation en fonction de l''environnement du poste', 3, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (82, N'Vérification approprié du fonctionnement de l''élément', 4, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (83, N'Personnalisation de l''élément appropriée aux besoins de l’utilisatrice et de l''utilisateur', 5, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (84, N'Copie correcte des disques', 1, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (85, N'Interprétation judicieuse de l''information technique', 2, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (86, N'Utilisation appropriée des outils de désinstallation', 3, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (87, N'Respect du processus de désinstallation manuelle', 4, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (88, N'Vérification appropriée du fonctionnement de l''ensemble des éléments', 1, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (89, N'Résolution efficace des problèmes d''installation', 2, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (90, N'Installation de la station de travail conforme aux principes de l''ergonomie', 3, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (91, N'Prise en note de la nouvelle configuration', 1, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (92, N'Rédaction claire et correcte des problèmes éprouvés et des solutions apportées', 2, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (93, N'Mise à jour précise de l''inventaire', 3, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (94, N'Vérification méthodique de l’accès aux différents éléments physiques et logiques de l’environnement', 1, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (95, N'Configuration de l’environnement appropriée aux caractéristiques de la situation', 2, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (96, N'Personnalisation de l’environnement efficace et conforme aux exigences de l’entreprise', 3, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (97, N'Modification appropriée de la représentation des données', 1, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (98, N'Adaptation correcte des conditions d’exécution', 2, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (99, N'Modification appropriée des structures de traitement', 3, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (100, N'Adaptation appropriée de la séquence des opérations', 4, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (101, N'Utilisation efficace des fonctionnalités d’édition de l’environnement', 1, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (102, N'Application des règles de syntaxe et de sémantique propres au langage utilisé', 2, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (103, N'Application rigoureuse des standards de codification', 3, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (104, N'Application judicieuse des principes de la programmation structurée', 4, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (105, N'Mise à profit judicieuse des possibilités du langage', 5, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (106, N'Consignation des commentaires pertinents et conformes aux exigences de l’entreprise', 6, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (107, N'Utilisation efficace des fonctionnalités de compilation de l’environnement', 1, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (108, N'Repérage des erreurs de compilation', 2, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (109, N'Correction des erreurs de compilation', 3, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (110, N'Utilisation efficace des fonctionnalités d’exécution et de débogage de l’environnement', 1, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (111, N'Préparation correcte des jeux d’essai nécessaires à la vérification du fonctionnement du programme', 2, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (112, N'Interprétation juste des résultats', 3, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (113, N'Débogage approprié du programme selon l’algorithme', 4, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (114, N'Établissement complet des domaines d’application', 1, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (115, N'Détermination des classes pertinentes', 2, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (116, N'Établissement des relations hiérarchiques appropriées entre les classes', 3, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (117, N'Détermination des services de chacune des classes', 4, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (118, N'Détermination des attributs pertinents compte tenu de chacune des classes', 5, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (119, N'Représentation graphique appropriée du modèle objet', 6, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (120, N'Mise au point de la séquence des opérations propres aux différents services de la classe', 1, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (121, N'Représentation graphique appropriée du modèle séquentiel', 2, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (122, N'Modification appropriée du modèle objet', 3, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (123, N'Préparation appropriée de l''environnement de programmation', 1, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (124, N'Déclaration et définition de la classe respectant les règles de syntaxe et de sémantique du langage', 2, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (125, N'Exploitation judicieuse des possibilités du langage dans l''application des principes d''encapsulation, d''héritage et de polymorphisme', 3, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (126, N'Application rigoureuse des standards de nomenclature et de documentation reconnus propres à l''entreprise', 4, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (127, N'Repérage et correction des erreurs de compilation de la classe', 5, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (128, N'Préparation correcte des jeux d''essai nécessaires à la vérification du bon fonctionnement de tous les services de la classe', 1, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (129, N'Création d''un environnement de test approprié', 2, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (130, N'Interprétation juste des résultats', 3, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (131, N'Débogage approprié de la classe', 4, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (132, N'Utilisation des mécanismes de génération propres à l’outil employé', 1, NULL, 33)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (133, N'Précision juste du besoin de recherche', 1, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (134, N'Détermination des critères permettant de choisir correctement les sources de la recherche', 2, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (135, N'Manifestation d’initiative', 3, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (136, N'Sélection judicieuse des sources en fonction de la nature et des critères de la recherche', 1, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (137, N'Utilisation correcte et efficace des méthodes et des outils de recherche conventionnels et informatiques', 2, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (138, N'Prise en considération des risques de s’éloigner du besoin initial', 3, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (139, N'Pertinence de l’information consultée', 1, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (140, N'Interprétation juste de l’information en français et en anglais', 2, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (141, N'Pertinence de l’information extraite en fonction du besoin initial', 3, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (142, N'Manifestation de curiosité', 4, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (143, N'Clarté, précision et pertinence de l’information consignée', 1, NULL, 37)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (144, N'Prise en considération de ses forces et de ses faiblesses en matière de relations interpersonnelles', 1, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (145, N'Manifestation d’attitudes favorisant des relations interpersonnelles harmonieuses', 2, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (146, N'Application rigoureuse des règles de politesse et de courtoisie', 3, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (147, N'Adaptation de son approche selon les personnes et les situations', 4, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (148, N'Utilisation appropriée des techniques de gestion des conflits interpersonnels', 5, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (149, N'Manifestation de comportements conformes à l’éthique professionnelle', 6, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (150, N'Manifestation d’une attitude d’écoute et de réceptivité', 1, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (151, N'Adaptation du niveau de langage selon l’interlocutrice et l’interlocuteur', 2, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (152, N'Application correcte des techniques de communication verbale et non verbale', 3, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (153, N'Utilisation appropriée des techniques de négociation et d’argumentation', 4, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (154, N'Distinction juste du rôle et des responsabilités des membres de l’équipe', 1, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (155, N'Prise de ses responsabilités au sein de l’équipe', 2, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (156, N'Contribution active aux activités de l’équipe', 3, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (157, N'Utilisation appropriée des techniques de négociation et d’argumentation', 4, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (158, N'Manifestation d’attitudes favorisant le travail d’équipe', 5, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (159, N'Respect du mode d’action établi par l’équipe', 6, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (160, N'Respect des décisions prises par les membres de l’équipe', 7, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (161, N'Contribution efficace à la résolution des problèmes éprouvés par les membres de l’équipe', 8, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (162, N'Interprétation juste des besoins', 1, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (163, N'Manifestation d’un souci constant de répondre aux besoins des clientes et des clients', 2, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (164, N'Vérification régulière de la satisfaction des clientes et des clients', 3, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (165, N'Réaction appropriée devant les problèmes soulevés par les clientes et les clients', 4, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (166, N'Manifestation d’un souci constant d’améliorer la qualité des services et des produits', 5, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (167, N'Manifestation de comportements conformes à l’éthique professionnelle', 6, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (168, N'Établissement correcte des données d''entrée', 1, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (169, N'Établissement correcte des données de sortie', 2, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (170, N'Établissement correcte de la nature des traitements', 3, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (171, N'Détermination correcte des conditions d’exécution de l''algorithme', 4, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (172, N'Choix d’un mode de représentation de l''algorithme conforme aux exigences de l''entreprise', 1, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (173, N'Détermination d''une séquence logique des opérations', 2, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (174, N'Détermination des structures de traitement appropriées à chacune des opérations', 3, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (175, N'Application rigoureuse des règles de syntaxe propres au mode de représentation retenu', 4, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (176, N'Recherche d''une solution algorithmique efficace', 5, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (177, N'Représentation précise de la solution algorithmique retenue', 6, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (178, N'Présence de toute l''information nécessaire à l''interprétation de l''algorithme', 7, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (179, N'Vérification de la pertinence de la solution compte tenu de la situation initiale', 1, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (180, N'Détermination des erreurs et des lacunes de la solution algorithmique mise au point', 2, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (181, N'Modification appropriée de la solution algorithmique', 3, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (182, N'Examen des caractéristiques des utilisatrices et des utilisateurs liées à l’âge, à la culture et à la scolarisation', 1, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (183, N'Détermination du degré de familiarité avec l’informatique en général et avec l’application à utiliser', 2, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (184, N'Détermination du degré de réceptivité des utilisatrices et des utilisateurs par rapport à l’application à utiliser', 3, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (185, N'Précision des attentes des utilisatrices et des utilisateurs', 4, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (186, N'Reconnaissance des caractéristiques de l’environnement physique', 1, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (187, N'Détermination des modalités d’interaction', 2, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (188, N'Définition des caractéristiques des tâches d’interaction', 3, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (189, N'Vérification de la cohérence entre les modalités et les tâches', 4, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (190, N'Prise en considération des caractéristiques des utilisatrices et des utilisateurs', 1, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (191, N'Prise en considération des caractéristiques de l’interaction', 2, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (192, N'Prise en considération des caractéristiques des exigences d’ergonomie', 3, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (193, N'Prise en considération des contraintes de fiabilité, de coût et de maintenance', 4, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (194, N'Interprétation correcte des fiches techniques des produits offerts sur le marché', 5, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (195, N'Établissement des actions et des exceptions liées aux tâches', 1, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (196, N'Détermination des éléments de présentation des actions et des exceptions', 2, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (197, N'Organisation spatiale appropriée des éléments', 3, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (198, N'Détermination des caractéristiques de présentation des éléments', 4, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (199, N'Organisation de l’interface conforme aux critères d’esthétisme et d’efficacité', 5, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (200, N'Consignation de l’information relative à l’interface', 6, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (201, N'Création des éléments selon les caractéristiques de présentation choisies', 1, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (202, N'Positionnement des éléments selon l’organisation spatiale retenue', 2, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (203, N'Établissement des liens entre les éléments et les programmes de l’application', 3, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (204, N'Validation du fonctionnement de l’interface', 4, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (205, N'Détermination correcte des principales tâches et de leur séquence', 1, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (206, N'Estimation du temps nécessaire à l’exécution des principales tâches', 2, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (207, N'Prise en considération des échéances établies pour l’exécution du travail', 3, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (208, N'Établissement correct de priorités', 1, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (209, N'Prise en considération des points critiques', 2, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (210, N'Prévision d’une marge de manœuvre suffisante pour faire face aux imprévus', 3, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (211, N'Utilisation appropriée des méthodes et des outils de planification', 4, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (212, N'Établissement d’un calendrier des travaux réaliste', 5, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (213, N'Détermination correcte des ressources humaines et matérielles nécessaires à l’exécution du travail', 6, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (214, N'Communication efficace avec les personnes en cause', 7, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (215, N'Présentation correcte du plan de travail pour approbation', 8, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (216, N'Utilisation d’une méthode appropriée de suivi des activités', 1, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (217, N'Gestion efficace du temps', 2, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (218, N'Respect du calendrier des travaux', 3, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (219, N'Adaptation régulière du calendrier des travaux en fonction des imprévus', 4, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (220, N'Détermination juste du support nécessaire', 1, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (221, N'Sélection et utilisation correcte du logiciel de création du document', 2, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (222, N'Établissement juste du plan de travail pour le document à produire', 1, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (223, N'Préparation appropriée des éléments de contenu', 2, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (224, N'Application rigoureuse des règles grammaticales et orthographiques', 3, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (225, N'Établissement correct du format de mise en page', 4, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (226, N'Adaptation correcte du niveau de langage en fonction du public cible', 5, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (227, N'Clarté du texte', 6, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (228, N'Utilisation efficace des logiciels de bureautique et de multimédia', 7, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (229, N'Respect des normes de mise en page', 8, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (230, N'Sélection des éléments qui nécessitent de l’aide en ligne', 1, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (231, N'Respect des normes de présentation', 2, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (232, N'Application rigoureuse des règles grammaticales et orthographiques', 3, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (233, N'Adaptation correcte du niveau de langage en fonction du public cible', 4, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (234, N'Utilisation correcte du logiciel de création d’aide en ligne', 5, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (235, N'Facilité d’utilisation de l’aide en ligne', 6, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (236, N'Vérification de la cohérence de l’aide en ligne', 7, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (237, N'Prise en considération des objectifs d’apprentissage en fonction du public cible et du contexte de formation', 1, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (238, N'Préparation appropriée des éléments de contenu', 2, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (239, N'Utilisation correcte des outils de production du document', 3, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (240, N'Respect des normes de présentation', 4, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (241, N'Application rigoureuse des règles grammaticales et orthographiques', 5, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (242, N'Adaptation correcte du niveau de langage en fonction du public cible', 6, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (243, N'Vérification minutieuse du document', 7, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (244, N'Établissement juste de la liste de diffusion', 1, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (245, N'Sélection et utilisation du mode de diffusion', 2, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (246, N'Vérification systématique de la réception', 3, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (247, N'Respect des règles de conservation d’un document', 1, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (248, N'Attribution précise d’un code à partir du plan de classification', 2, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (249, N'Précision et concision du titre d’un document selon les normes', 3, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (250, N'Consignation minutieuse de l’information dans l’outil de repérage', 4, NULL, 58)
SET IDENTITY_INSERT CriterePerformance OFF
GO
USE master
IF EXISTS(select * from sys.databases where name='BDPlanCadreTEST')
DROP DATABASE BDPlanCadreTEST
GO

CREATE DATABASE BDPlanCadreTEST
GO

USE BDPlanCadreTEST
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
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (1, N'016N', N'Analyser les fonctions de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (2, N'016P', N'Résoudre des problèmes mathématiques et
statistiques en informatique', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (3, N'016Q', N'Mettre à profit les possibilités d''un système
d''exploitation propre à une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (4, N'016R', N'Installer des éléments physiques et logiques
dans une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (5, N'016S', N'Exploiter un langage de programmation
structurée', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (6, N'016T', N'Appliquer une approche de développement par
objets', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (7, N'016U', N'Effectuer la recherche d’information', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (8, N'026V', N'Interagir et communiquer dans des situations de
travail variées', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (9, N'016W', N'Produire des algorithmes', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (10, N'016X', N'Produire une interface utilisateur', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (11, N'016Y', N'Planifier et gérer des activités de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (12, N'016Z', N'Assurer la production et la gestion de
documents', NULL, 1, 1, NULL, 1)
SET IDENTITY_INSERT EnonceCompetence OFF
GO
SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (1, N'Caractériser les fonctions de travail et leurs conditions d''exercise', 1, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (2, N'Examiner les tâches et les opérations liées aux fonctions de travail', 2, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (3, N'Examiner les habiletés et les comportements nécessaire a l''exercice des fonctions de travail.', 3, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (4, N'Examiner la réglementation relative à l''exercice de la profession en général', 4, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (5, N'Effectuer des traitements sur des données
internes de l’ordinateur', 1, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (6, N'Effectuer des opérations logiques', 2, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (7, N'Organiser et traiter de l’information', 3, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (8, N'Résoudre des problèmes de
programmation linéaire', 4, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (9, N'Résoudre des problèmes de
dénombrement', 5, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (10, N'Résoudre des problèmes de probabilité et
de statistique', 6, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (11, N'Exploiter un système de fichiers', 1, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (12, N'Automatiser des tâches', 2, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (13, N'Utiliser les mécanismes de gestion de la
mémoire', 3, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (14, N'Personnaliser l''environnement de la station
de travail', 4, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (15, N'Analyser l''architecture interne de
l''ordinateur', 1, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (16, N'Planifier le travail', 2, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (17, N'Protéger l''environnement de la station de
travail', 3, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (18, N'Installer des éléments physiques', 4, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (19, N'Désinstaller des éléments physiques', 5, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (20, N'Installer des éléments logiques', 6, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (21, N'Désinstaller des éléments logiques', 7, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (22, N'Vérifier l''installation de la station de
travail dans l''environnement de
l''utilisatrice et de l''utilisateur', 8, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (23, N'Consigner l''information sur l''installation', 9, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (24, N'Préparer l’environnement de
programmation.', 1, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (25, N'Adapter l’algorithme aux contraintes du
langage de programmation.', 2, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (26, N'Traduire l’algorithme dans le langage de
programmation.', 3, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (27, N'Compiler le programme', 4, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (28, N'Valider le programme', 5, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (29, N'Créer un modèle objet', 1, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (30, N'Perfectionner le modèle objet', 2, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (31, N'Procéder à la codification d’une classe', 3, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (32, N'Valider le fonctionnement d’une classe', 4, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (33, N'Générer la version exécutable du
programme', 5, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (34, N'Préciser le besoin d’information', 1, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (35, N'Sélectionner et utiliser les sources de
recherche', 2, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (36, N'Consulter et extraire l’information
nécessaire', 3, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (37, N'Consigner les résultats de la recherche', 4, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (38, N'Établir et entretenir des relations
interpersonnelles', 1, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (39, N'Communiquer avec des personnes à
l’interne et à l’externe', 2, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (40, N'Travailler au sein d’une équipe
multidisciplinaire', 3, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (41, N'Appliquer une approche client', 4, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (42, N'Analyser la situation', 1, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (43, N'Mettre au point l''algorithme', 2, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (44, N'Valider l''algorithme', 3, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (45, N'Analyser les caractéristiques des
utilisatrices et des utilisateurs', 1, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (46, N'Établir les caractéristiques d’interaction', 2, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (47, N'Choisir des périphériques d’entrée et de
sortie', 3, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (48, N'Planifier l’organisation globale de
l’interface', 4, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (49, N'Procéder à la programmation de l’interface
utilisateur', 5, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (50, N'Analyser les caractéristiques du travail à
effectuer', 1, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (51, N'Procéder à la planification des activités', 2, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (52, N'Assurer le suivi des activités de travail', 3, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (53, N'Choisir le support du document', 1, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (54, N'Produire un document technique et
administratif', 2, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (55, N'Produire l’aide en ligne', 3, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (56, N'Produire un document de formation', 4, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (57, N'Diffuser un document', 5, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (58, N'Classer un document', 6, NULL, NULL, 12)
SET IDENTITY_INSERT ElementCompetence OFF
GO
SET IDENTITY_INSERT ContexteRealisation ON
GO
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (1, N'a l''aide d''une information récente sur les fonctions de travail suivantes : - programeuse-analyste et programeur-analyste dans les domaine de la gestion et de l''indutrie', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (2, N'À l''aide d''une information récente sur les entreprses dans lesquelles on trouve la programeuse-analyste et le programmeur-analyste et la et le gestionnaire de réseaux informatique', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (3, N'À partir de situations propres au domaine de l''informatique', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (4, N'À partir d''une station de travail et d’un logiciel de statistiques', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (5, N'À l''aide des manuels de références techniques appropriés', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (6, N'Dans des environnements utilisant des systèmes d’exploitation variés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (7, N'À partir d''une station de travail et des logiciels appropriés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (8, N'À l''aide des manuels de références techniques appropriés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (9, N'À partir des normes et des exigences de l''entreprise', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (10, N'En atelier et sur le lieu de travail de l''utilisatrice et de l''utilisateur', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (11, N'À partir d''une demande préautorisée précisant la nature de l''installation', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (12, N'À partir d''une station de travail', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (13, N'À l''aide des éléments physiques et logiques à installer et des outils appropriés', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (14, N'À partir des normes et des exigences de l''entreprise', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (15, N'À l''aide des manuels de références techniques appropriés', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (16, N'À partir d’une station de travail et des logiciels appropriés', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (17, N'À partir d’algorithmes valides et représentatifs du milieu de travail', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (18, N'À partir des normes et des exigences de l’entreprise', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (19, N'À l’aide des manuels de références techniques appropriés à l’environnement de programmation', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (20, N'À partir d''une station de travail et des logiciels appropriés', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (21, N'À partir de situations représentatives du milieu du travail et nécessitant le développement d’applications comportant un nombre limité de classes', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (22, N'À partir des normes et des exigences de l''entreprise', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (23, N'À l’aide de toute la documentation disponible sur les applications à développer', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (24, N'À l''aide des manuels de références techniques appropriés', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (25, N'À partir de besoins d’information précis propres au milieu de travail', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (26, N'À partir de besoins d’information liés à la veille technologique', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (27, N'À partir d’une station de travail et des logiciels appropriés', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (28, N'À l’aide de manuels de références en français et en anglais', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (29, N'Dans des situations de travail variées', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (30, N'En présence des personnes en cause', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (31, N'À partir de situations variées représentatives du milieu de travail', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (32, N'À partir d''une station de travail et des logiciels appropriés', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (33, N'À partir des exigences de l''entreprise', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (34, N'À l’aide des manuels de références techniques appropriés', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (35, N'À partir d''une station de travail et des logiciels appropriés', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (36, N'À partir d’applications variées nécessitant la création d’interfaces', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (37, N'À partir des manuels de références techniques appropriés', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (38, N'À partir des exigences de l''entreprise et des standards de l’informatique', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (39, N'Dans des situations de travail propres à la profession', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (40, N'À l’aide des outils de planification appropriés', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (41, N'À partir des exigences de l''entreprise', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (42, N'Pour des documents en français et en anglais', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (43, N'À partir d’une station de travail et des logiciels de bureautique, de multimédia et de création d’aide en ligne', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (44, N'À l’aide de dictionnaires, de grammaires et d’outils de référence variés', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (45, N'À l’aide de l’inforoute et des services de télécommunication', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (46, N'À partir des exigences de l’entreprise', NULL, 12)
SET IDENTITY_INSERT ContexteRealisation OFF
GO
SET IDENTITY_INSERT CriterePerformance ON
GO
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (1, N'Pertinence de l’information recueillie', 1, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (2, N'Examen complet des caractéristiques générales des fonctions de travail et de leurs conditions d’exercice', 2, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (3, N'Reconnaissance des possibilités d’exercice des professions en entreprise et de pratique entrepreneuriale dans le domaine de l’informatique', 3, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (4, N'Reconnaissance des effets, sur le travail, de l’évolution technologique rapide dans le domaine de l’informatique', 4, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (5, N'Examen complet des opérations, ainsi que des conditions d’exécution et des critères de performance des tâches associés aux différentes fonctions de travail', 1, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (6, N'Détermination exacte de l’importance relative des activités', 2, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (7, N'Mise en relation des étapes du processus de travail avec les tâches des fonctions de travail', 3, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (8, N'Pertinence des liens établis entre les habiletés et comportements et les différentes tâches des fonctions de travail', 1, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (9, N'Examen complet des exigences liées à l’éthique professionnelle', 2, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (10, N'Reconnaissance des droits et des responsabilités des personnes dans les relations employeur-employé et client-fournisseur', 1, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (11, N'Reconnaissance des conséquences des manquements aux lois et règlements', 2, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (12, N'Représentation correcte de nombres dans différentes bases', 1, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (13, N'Conversion correcte de nombres d’une base à une autre', 2, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (14, N'Exécution correcte des opérations arithmétiques dans différentes bases', 3, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (15, N'Représentation juste de données dans la mémoire de l’ordinateur', 4, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (16, N'Interprétation juste des limites de représentation des données dans la mémoire de l’ordinateur', 5, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (17, N'Formulation de propositions appropriées à différentes situations', 1, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (18, N'Construction d’une table de vérité conforme à une proposition', 2, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (19, N'Simplification correcte d’une proposition', 3, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (20, N'Utilisation appropriée de la méthode de preuve par induction', 4, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (21, N'Construction d’ensembles et de sous-ensembles appropriés à différentes situations', 1, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (22, N'Exécution correcte de toutes les opérations dans les ensembles', 2, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (23, N'Établissement de relations justes entre des ensembles', 3, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (24, N'Formulation de propositions appropriées et dans leur forme la plus simple en vue de traiter l’information dans une situation donnée', 4, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (25, N'Traduction correcte des propositions en langage ensembliste', 5, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (26, N'Représentation d’une situation sous forme d’un système d’équations linéaires approprié', 1, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (27, N'Exécution correcte des opérations dans les matrices', 2, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (28, N'Représentation juste d’un système d’équations linéaires sous forme matricielle', 3, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (29, N'Application correcte de méthodes de résolution de problèmes d’un système d’équations linéaires', 4, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (30, N'Calcul exact du nombre de permutations dans un contexte donné', 1, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (31, N'Calcul exact du nombre d’arrangements dans un contexte donné', 2, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (32, N'Calcul exact du nombre de combinaisons dans un contexte donné', 3, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (33, N'Calcul des probabilités d’événements liées aux lois binomiale, normale et de Poisson', 1, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (34, N'Détermination de la nature des variables appropriées à une situation donnée', 2, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (35, N'Choix d’échelles de mesure appropriées à une situation donnée', 3, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (36, N'Choix des mesures statistiques appropriées à une situation donnée', 4, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (37, N'Choix judicieux du mode de représentation de l’information', 5, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (38, N'Application rigoureuse des normes de présentation des tableaux et des graphiques', 6, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (39, N'Utilisation efficace des fonctionnalités d’un logiciel de statistiques', 7, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (40, N'Choix des méthodes d’échantillonnage appropriées à une situation donnée', 8, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (41, N'Estimation par intervalle d’une moyenne et d’une proportion pour des grands échantillons', 9, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (42, N'Comparaison des possibilités et des limites des systèmes de fichiers de différents systèmes d''exploitation', 1, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (43, N'Utilisation correcte des commandes de manipulation des fichiers', 2, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (44, N'Utilisation correcte des commandes de manipulation des répertoires', 3, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (45, N'Utilisation correcte des commandes visant à assurer la sécurité des fichiers et des répertoires', 4, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (46, N'Utilisation correcte des outils visant le stockage et l''intégrité des données', 5, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (47, N'Analyse judicieuse des possibilités et des limites des différents systèmes d''exploitation au regard de l''exécution des tâches', 1, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (48, N'Utilisation correcte du langage de commande propre au système d''exploitation', 2, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (49, N'Utilisation appropriée des commandes en vue d’établir l’ordre de priorité des tâches', 3, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (50, N'Adaptation appropriée des paramètres de sécurité aux exigences des tâches', 4, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (51, N'Application des techniques de débogage appropriées au système d''exploitation', 5, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (52, N'Consignation des commentaires pertinents', 6, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (53, N'Analyse judicieuse des possibilités et des limites des différents systèmes d''exploitation au regard de la gestion de la mémoire', 1, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (54, N'Allocation de la mémoire appropriée aux besoins relatifs à l''exécution d''une tâche', 2, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (55, N'Comparaison des différents types de fichiers de configuration propres au système d''exploitation', 1, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (56, N'Utilisation correcte des commandes de configuration de base du poste de travail', 2, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (57, N'Utilisation correcte des commandes de démarrage et de configuration des périphériques', 3, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (58, N'Démarrage des programmes appropriés aux besoins de l''utilisatrice et de l''utilisateur', 4, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (59, N'Adaptation des paramètres de configuration de l''environnement de travail aux exigences de l''utilisatrice et de l''utilisateur', 5, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (60, N'Consignation précise des paramètres de personnalisation', 6, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (61, N'Distinction et repérage des éléments de la carte maîtresse', 1, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (62, N'Reconnaissance des caractéristiques et des fonctions propres aux processeurs, aux mémoires, aux bus et aux horloges', 2, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (63, N'Reconnaissance des caractéristiques et des fonctions propres aux différents ports de communication', 3, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (64, N'Reconnaissance des relations entre les différents éléments', 4, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (65, N'Analyse judicieuse de la demande', 1, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (66, N'Préparation du matériel nécessaire', 2, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (67, N'Détermination juste de la séquence des opérations', 3, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (68, N'Consignation complète de la configuration physique initiale', 1, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (69, N'Copie de l''ensemble des données', 2, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (70, N'Prise des mesures de sécurité appropriées', 3, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (71, N'Interprétation correcte des fiches techniques', 1, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (72, N'Détermination appropriée de chacun des paramètres d''installation', 2, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (73, N'Installation de l''élément à l''endroit approprié', 3, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (74, N'Configuration conforme à l''environnement du poste', 4, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (75, N'Vérification appropriée du fonctionnement de l''élément', 5, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (76, N'Interprétation judicieuse de l’information technique', 1, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (77, N'Respect du processus de désinstallation en fonction de l’élément à retirer', 2, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (78, N'Prise des précautions appropriées', 3, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (79, N'Interprétation judicieuse de l''information technique', 1, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (80, N'Démarrage approprié de l''installation', 2, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (81, N'Choix des paramètres d''installation en fonction de l''environnement du poste', 3, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (82, N'Vérification approprié du fonctionnement de l''élément', 4, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (83, N'Personnalisation de l''élément appropriée aux besoins de l’utilisatrice et de l''utilisateur', 5, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (84, N'Copie correcte des disques', 1, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (85, N'Interprétation judicieuse de l''information technique', 2, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (86, N'Utilisation appropriée des outils de désinstallation', 3, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (87, N'Respect du processus de désinstallation manuelle', 4, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (88, N'Vérification appropriée du fonctionnement de l''ensemble des éléments', 1, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (89, N'Résolution efficace des problèmes d''installation', 2, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (90, N'Installation de la station de travail conforme aux principes de l''ergonomie', 3, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (91, N'Prise en note de la nouvelle configuration', 1, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (92, N'Rédaction claire et correcte des problèmes éprouvés et des solutions apportées', 2, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (93, N'Mise à jour précise de l''inventaire', 3, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (94, N'Vérification méthodique de l’accès aux différents éléments physiques et logiques de l’environnement', 1, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (95, N'Configuration de l’environnement appropriée aux caractéristiques de la situation', 2, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (96, N'Personnalisation de l’environnement efficace et conforme aux exigences de l’entreprise', 3, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (97, N'Modification appropriée de la représentation des données', 1, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (98, N'Adaptation correcte des conditions d’exécution', 2, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (99, N'Modification appropriée des structures de traitement', 3, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (100, N'Adaptation appropriée de la séquence des opérations', 4, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (101, N'Utilisation efficace des fonctionnalités d’édition de l’environnement', 1, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (102, N'Application des règles de syntaxe et de sémantique propres au langage utilisé', 2, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (103, N'Application rigoureuse des standards de codification', 3, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (104, N'Application judicieuse des principes de la programmation structurée', 4, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (105, N'Mise à profit judicieuse des possibilités du langage', 5, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (106, N'Consignation des commentaires pertinents et conformes aux exigences de l’entreprise', 6, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (107, N'Utilisation efficace des fonctionnalités de compilation de l’environnement', 1, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (108, N'Repérage des erreurs de compilation', 2, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (109, N'Correction des erreurs de compilation', 3, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (110, N'Utilisation efficace des fonctionnalités d’exécution et de débogage de l’environnement', 1, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (111, N'Préparation correcte des jeux d’essai nécessaires à la vérification du fonctionnement du programme', 2, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (112, N'Interprétation juste des résultats', 3, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (113, N'Débogage approprié du programme selon l’algorithme', 4, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (114, N'Établissement complet des domaines d’application', 1, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (115, N'Détermination des classes pertinentes', 2, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (116, N'Établissement des relations hiérarchiques appropriées entre les classes', 3, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (117, N'Détermination des services de chacune des classes', 4, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (118, N'Détermination des attributs pertinents compte tenu de chacune des classes', 5, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (119, N'Représentation graphique appropriée du modèle objet', 6, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (120, N'Mise au point de la séquence des opérations propres aux différents services de la classe', 1, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (121, N'Représentation graphique appropriée du modèle séquentiel', 2, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (122, N'Modification appropriée du modèle objet', 3, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (123, N'Préparation appropriée de l''environnement de programmation', 1, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (124, N'Déclaration et définition de la classe respectant les règles de syntaxe et de sémantique du langage', 2, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (125, N'Exploitation judicieuse des possibilités du langage dans l''application des principes d''encapsulation, d''héritage et de polymorphisme', 3, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (126, N'Application rigoureuse des standards de nomenclature et de documentation reconnus propres à l''entreprise', 4, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (127, N'Repérage et correction des erreurs de compilation de la classe', 5, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (128, N'Préparation correcte des jeux d''essai nécessaires à la vérification du bon fonctionnement de tous les services de la classe', 1, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (129, N'Création d''un environnement de test approprié', 2, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (130, N'Interprétation juste des résultats', 3, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (131, N'Débogage approprié de la classe', 4, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (132, N'Utilisation des mécanismes de génération propres à l’outil employé', 1, NULL, 33)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (133, N'Précision juste du besoin de recherche', 1, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (134, N'Détermination des critères permettant de choisir correctement les sources de la recherche', 2, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (135, N'Manifestation d’initiative', 3, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (136, N'Sélection judicieuse des sources en fonction de la nature et des critères de la recherche', 1, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (137, N'Utilisation correcte et efficace des méthodes et des outils de recherche conventionnels et informatiques', 2, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (138, N'Prise en considération des risques de s’éloigner du besoin initial', 3, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (139, N'Pertinence de l’information consultée', 1, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (140, N'Interprétation juste de l’information en français et en anglais', 2, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (141, N'Pertinence de l’information extraite en fonction du besoin initial', 3, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (142, N'Manifestation de curiosité', 4, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (143, N'Clarté, précision et pertinence de l’information consignée', 1, NULL, 37)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (144, N'Prise en considération de ses forces et de ses faiblesses en matière de relations interpersonnelles', 1, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (145, N'Manifestation d’attitudes favorisant des relations interpersonnelles harmonieuses', 2, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (146, N'Application rigoureuse des règles de politesse et de courtoisie', 3, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (147, N'Adaptation de son approche selon les personnes et les situations', 4, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (148, N'Utilisation appropriée des techniques de gestion des conflits interpersonnels', 5, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (149, N'Manifestation de comportements conformes à l’éthique professionnelle', 6, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (150, N'Manifestation d’une attitude d’écoute et de réceptivité', 1, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (151, N'Adaptation du niveau de langage selon l’interlocutrice et l’interlocuteur', 2, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (152, N'Application correcte des techniques de communication verbale et non verbale', 3, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (153, N'Utilisation appropriée des techniques de négociation et d’argumentation', 4, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (154, N'Distinction juste du rôle et des responsabilités des membres de l’équipe', 1, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (155, N'Prise de ses responsabilités au sein de l’équipe', 2, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (156, N'Contribution active aux activités de l’équipe', 3, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (157, N'Utilisation appropriée des techniques de négociation et d’argumentation', 4, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (158, N'Manifestation d’attitudes favorisant le travail d’équipe', 5, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (159, N'Respect du mode d’action établi par l’équipe', 6, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (160, N'Respect des décisions prises par les membres de l’équipe', 7, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (161, N'Contribution efficace à la résolution des problèmes éprouvés par les membres de l’équipe', 8, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (162, N'Interprétation juste des besoins', 1, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (163, N'Manifestation d’un souci constant de répondre aux besoins des clientes et des clients', 2, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (164, N'Vérification régulière de la satisfaction des clientes et des clients', 3, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (165, N'Réaction appropriée devant les problèmes soulevés par les clientes et les clients', 4, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (166, N'Manifestation d’un souci constant d’améliorer la qualité des services et des produits', 5, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (167, N'Manifestation de comportements conformes à l’éthique professionnelle', 6, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (168, N'Établissement correcte des données d''entrée', 1, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (169, N'Établissement correcte des données de sortie', 2, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (170, N'Établissement correcte de la nature des traitements', 3, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (171, N'Détermination correcte des conditions d’exécution de l''algorithme', 4, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (172, N'Choix d’un mode de représentation de l''algorithme conforme aux exigences de l''entreprise', 1, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (173, N'Détermination d''une séquence logique des opérations', 2, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (174, N'Détermination des structures de traitement appropriées à chacune des opérations', 3, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (175, N'Application rigoureuse des règles de syntaxe propres au mode de représentation retenu', 4, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (176, N'Recherche d''une solution algorithmique efficace', 5, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (177, N'Représentation précise de la solution algorithmique retenue', 6, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (178, N'Présence de toute l''information nécessaire à l''interprétation de l''algorithme', 7, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (179, N'Vérification de la pertinence de la solution compte tenu de la situation initiale', 1, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (180, N'Détermination des erreurs et des lacunes de la solution algorithmique mise au point', 2, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (181, N'Modification appropriée de la solution algorithmique', 3, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (182, N'Examen des caractéristiques des utilisatrices et des utilisateurs liées à l’âge, à la culture et à la scolarisation', 1, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (183, N'Détermination du degré de familiarité avec l’informatique en général et avec l’application à utiliser', 2, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (184, N'Détermination du degré de réceptivité des utilisatrices et des utilisateurs par rapport à l’application à utiliser', 3, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (185, N'Précision des attentes des utilisatrices et des utilisateurs', 4, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (186, N'Reconnaissance des caractéristiques de l’environnement physique', 1, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (187, N'Détermination des modalités d’interaction', 2, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (188, N'Définition des caractéristiques des tâches d’interaction', 3, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (189, N'Vérification de la cohérence entre les modalités et les tâches', 4, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (190, N'Prise en considération des caractéristiques des utilisatrices et des utilisateurs', 1, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (191, N'Prise en considération des caractéristiques de l’interaction', 2, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (192, N'Prise en considération des caractéristiques des exigences d’ergonomie', 3, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (193, N'Prise en considération des contraintes de fiabilité, de coût et de maintenance', 4, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (194, N'Interprétation correcte des fiches techniques des produits offerts sur le marché', 5, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (195, N'Établissement des actions et des exceptions liées aux tâches', 1, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (196, N'Détermination des éléments de présentation des actions et des exceptions', 2, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (197, N'Organisation spatiale appropriée des éléments', 3, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (198, N'Détermination des caractéristiques de présentation des éléments', 4, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (199, N'Organisation de l’interface conforme aux critères d’esthétisme et d’efficacité', 5, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (200, N'Consignation de l’information relative à l’interface', 6, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (201, N'Création des éléments selon les caractéristiques de présentation choisies', 1, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (202, N'Positionnement des éléments selon l’organisation spatiale retenue', 2, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (203, N'Établissement des liens entre les éléments et les programmes de l’application', 3, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (204, N'Validation du fonctionnement de l’interface', 4, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (205, N'Détermination correcte des principales tâches et de leur séquence', 1, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (206, N'Estimation du temps nécessaire à l’exécution des principales tâches', 2, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (207, N'Prise en considération des échéances établies pour l’exécution du travail', 3, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (208, N'Établissement correct de priorités', 1, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (209, N'Prise en considération des points critiques', 2, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (210, N'Prévision d’une marge de manœuvre suffisante pour faire face aux imprévus', 3, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (211, N'Utilisation appropriée des méthodes et des outils de planification', 4, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (212, N'Établissement d’un calendrier des travaux réaliste', 5, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (213, N'Détermination correcte des ressources humaines et matérielles nécessaires à l’exécution du travail', 6, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (214, N'Communication efficace avec les personnes en cause', 7, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (215, N'Présentation correcte du plan de travail pour approbation', 8, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (216, N'Utilisation d’une méthode appropriée de suivi des activités', 1, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (217, N'Gestion efficace du temps', 2, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (218, N'Respect du calendrier des travaux', 3, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (219, N'Adaptation régulière du calendrier des travaux en fonction des imprévus', 4, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (220, N'Détermination juste du support nécessaire', 1, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (221, N'Sélection et utilisation correcte du logiciel de création du document', 2, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (222, N'Établissement juste du plan de travail pour le document à produire', 1, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (223, N'Préparation appropriée des éléments de contenu', 2, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (224, N'Application rigoureuse des règles grammaticales et orthographiques', 3, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (225, N'Établissement correct du format de mise en page', 4, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (226, N'Adaptation correcte du niveau de langage en fonction du public cible', 5, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (227, N'Clarté du texte', 6, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (228, N'Utilisation efficace des logiciels de bureautique et de multimédia', 7, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (229, N'Respect des normes de mise en page', 8, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (230, N'Sélection des éléments qui nécessitent de l’aide en ligne', 1, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (231, N'Respect des normes de présentation', 2, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (232, N'Application rigoureuse des règles grammaticales et orthographiques', 3, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (233, N'Adaptation correcte du niveau de langage en fonction du public cible', 4, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (234, N'Utilisation correcte du logiciel de création d’aide en ligne', 5, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (235, N'Facilité d’utilisation de l’aide en ligne', 6, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (236, N'Vérification de la cohérence de l’aide en ligne', 7, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (237, N'Prise en considération des objectifs d’apprentissage en fonction du public cible et du contexte de formation', 1, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (238, N'Préparation appropriée des éléments de contenu', 2, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (239, N'Utilisation correcte des outils de production du document', 3, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (240, N'Respect des normes de présentation', 4, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (241, N'Application rigoureuse des règles grammaticales et orthographiques', 5, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (242, N'Adaptation correcte du niveau de langage en fonction du public cible', 6, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (243, N'Vérification minutieuse du document', 7, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (244, N'Établissement juste de la liste de diffusion', 1, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (245, N'Sélection et utilisation du mode de diffusion', 2, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (246, N'Vérification systématique de la réception', 3, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (247, N'Respect des règles de conservation d’un document', 1, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (248, N'Attribution précise d’un code à partir du plan de classification', 2, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (249, N'Précision et concision du titre d’un document selon les normes', 3, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (250, N'Consignation minutieuse de l’information dans l’outil de repérage', 4, NULL, 58)
SET IDENTITY_INSERT CriterePerformance OFF
GO
USE master
IF EXISTS(select * from sys.databases where name='BDPlanCadreTEST')
DROP DATABASE BDPlanCadreTEST
GO

CREATE DATABASE BDPlanCadreTEST
GO

USE BDPlanCadreTEST
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
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (1, N'016N', N'Analyser les fonctions de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (2, N'016P', N'Résoudre des problèmes mathématiques et
statistiques en informatique', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (3, N'016Q', N'Mettre à profit les possibilités d''un système
d''exploitation propre à une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (4, N'016R', N'Installer des éléments physiques et logiques
dans une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (5, N'016S', N'Exploiter un langage de programmation
structurée', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (6, N'016T', N'Appliquer une approche de développement par
objets', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (7, N'016U', N'Effectuer la recherche d’information', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (8, N'026V', N'Interagir et communiquer dans des situations de
travail variées', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (9, N'016W', N'Produire des algorithmes', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (10, N'016X', N'Produire une interface utilisateur', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (11, N'016Y', N'Planifier et gérer des activités de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (12, N'016Z', N'Assurer la production et la gestion de
documents', NULL, 1, 1, NULL, 1)
SET IDENTITY_INSERT EnonceCompetence OFF
GO
SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (1, N'Caractériser les fonctions de travail et leurs conditions d''exercise', 1, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (2, N'Examiner les tâches et les opérations liées aux fonctions de travail', 2, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (3, N'Examiner les habiletés et les comportements nécessaire a l''exercice des fonctions de travail.', 3, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (4, N'Examiner la réglementation relative à l''exercice de la profession en général', 4, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (5, N'Effectuer des traitements sur des données
internes de l’ordinateur', 1, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (6, N'Effectuer des opérations logiques', 2, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (7, N'Organiser et traiter de l’information', 3, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (8, N'Résoudre des problèmes de
programmation linéaire', 4, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (9, N'Résoudre des problèmes de
dénombrement', 5, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (10, N'Résoudre des problèmes de probabilité et
de statistique', 6, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (11, N'Exploiter un système de fichiers', 1, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (12, N'Automatiser des tâches', 2, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (13, N'Utiliser les mécanismes de gestion de la
mémoire', 3, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (14, N'Personnaliser l''environnement de la station
de travail', 4, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (15, N'Analyser l''architecture interne de
l''ordinateur', 1, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (16, N'Planifier le travail', 2, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (17, N'Protéger l''environnement de la station de
travail', 3, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (18, N'Installer des éléments physiques', 4, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (19, N'Désinstaller des éléments physiques', 5, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (20, N'Installer des éléments logiques', 6, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (21, N'Désinstaller des éléments logiques', 7, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (22, N'Vérifier l''installation de la station de
travail dans l''environnement de
l''utilisatrice et de l''utilisateur', 8, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (23, N'Consigner l''information sur l''installation', 9, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (24, N'Préparer l’environnement de
programmation.', 1, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (25, N'Adapter l’algorithme aux contraintes du
langage de programmation.', 2, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (26, N'Traduire l’algorithme dans le langage de
programmation.', 3, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (27, N'Compiler le programme', 4, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (28, N'Valider le programme', 5, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (29, N'Créer un modèle objet', 1, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (30, N'Perfectionner le modèle objet', 2, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (31, N'Procéder à la codification d’une classe', 3, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (32, N'Valider le fonctionnement d’une classe', 4, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (33, N'Générer la version exécutable du
programme', 5, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (34, N'Préciser le besoin d’information', 1, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (35, N'Sélectionner et utiliser les sources de
recherche', 2, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (36, N'Consulter et extraire l’information
nécessaire', 3, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (37, N'Consigner les résultats de la recherche', 4, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (38, N'Établir et entretenir des relations
interpersonnelles', 1, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (39, N'Communiquer avec des personnes à
l’interne et à l’externe', 2, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (40, N'Travailler au sein d’une équipe
multidisciplinaire', 3, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (41, N'Appliquer une approche client', 4, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (42, N'Analyser la situation', 1, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (43, N'Mettre au point l''algorithme', 2, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (44, N'Valider l''algorithme', 3, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (45, N'Analyser les caractéristiques des
utilisatrices et des utilisateurs', 1, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (46, N'Établir les caractéristiques d’interaction', 2, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (47, N'Choisir des périphériques d’entrée et de
sortie', 3, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (48, N'Planifier l’organisation globale de
l’interface', 4, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (49, N'Procéder à la programmation de l’interface
utilisateur', 5, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (50, N'Analyser les caractéristiques du travail à
effectuer', 1, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (51, N'Procéder à la planification des activités', 2, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (52, N'Assurer le suivi des activités de travail', 3, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (53, N'Choisir le support du document', 1, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (54, N'Produire un document technique et
administratif', 2, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (55, N'Produire l’aide en ligne', 3, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (56, N'Produire un document de formation', 4, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (57, N'Diffuser un document', 5, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (58, N'Classer un document', 6, NULL, NULL, 12)
SET IDENTITY_INSERT ElementCompetence OFF
GO
SET IDENTITY_INSERT ContexteRealisation ON
GO
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (1, N'a l''aide d''une information récente sur les fonctions de travail suivantes : - programeuse-analyste et programeur-analyste dans les domaine de la gestion et de l''indutrie', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (2, N'À l''aide d''une information récente sur les entreprses dans lesquelles on trouve la programeuse-analyste et le programmeur-analyste et la et le gestionnaire de réseaux informatique', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (3, N'À partir de situations propres au domaine de l''informatique', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (4, N'À partir d''une station de travail et d’un logiciel de statistiques', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (5, N'À l''aide des manuels de références techniques appropriés', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (6, N'Dans des environnements utilisant des systèmes d’exploitation variés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (7, N'À partir d''une station de travail et des logiciels appropriés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (8, N'À l''aide des manuels de références techniques appropriés', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (9, N'À partir des normes et des exigences de l''entreprise', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (10, N'En atelier et sur le lieu de travail de l''utilisatrice et de l''utilisateur', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (11, N'À partir d''une demande préautorisée précisant la nature de l''installation', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (12, N'À partir d''une station de travail', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (13, N'À l''aide des éléments physiques et logiques à installer et des outils appropriés', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (14, N'À partir des normes et des exigences de l''entreprise', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (15, N'À l''aide des manuels de références techniques appropriés', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (16, N'À partir d’une station de travail et des logiciels appropriés', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (17, N'À partir d’algorithmes valides et représentatifs du milieu de travail', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (18, N'À partir des normes et des exigences de l’entreprise', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (19, N'À l’aide des manuels de références techniques appropriés à l’environnement de programmation', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (20, N'À partir d''une station de travail et des logiciels appropriés', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (21, N'À partir de situations représentatives du milieu du travail et nécessitant le développement d’applications comportant un nombre limité de classes', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (22, N'À partir des normes et des exigences de l''entreprise', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (23, N'À l’aide de toute la documentation disponible sur les applications à développer', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (24, N'À l''aide des manuels de références techniques appropriés', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (25, N'À partir de besoins d’information précis propres au milieu de travail', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (26, N'À partir de besoins d’information liés à la veille technologique', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (27, N'À partir d’une station de travail et des logiciels appropriés', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (28, N'À l’aide de manuels de références en français et en anglais', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (29, N'Dans des situations de travail variées', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (30, N'En présence des personnes en cause', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (31, N'À partir de situations variées représentatives du milieu de travail', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (32, N'À partir d''une station de travail et des logiciels appropriés', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (33, N'À partir des exigences de l''entreprise', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (34, N'À l’aide des manuels de références techniques appropriés', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (35, N'À partir d''une station de travail et des logiciels appropriés', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (36, N'À partir d’applications variées nécessitant la création d’interfaces', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (37, N'À partir des manuels de références techniques appropriés', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (38, N'À partir des exigences de l''entreprise et des standards de l’informatique', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (39, N'Dans des situations de travail propres à la profession', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (40, N'À l’aide des outils de planification appropriés', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (41, N'À partir des exigences de l''entreprise', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (42, N'Pour des documents en français et en anglais', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (43, N'À partir d’une station de travail et des logiciels de bureautique, de multimédia et de création d’aide en ligne', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (44, N'À l’aide de dictionnaires, de grammaires et d’outils de référence variés', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (45, N'À l’aide de l’inforoute et des services de télécommunication', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (46, N'À partir des exigences de l’entreprise', NULL, 12)
SET IDENTITY_INSERT ContexteRealisation OFF
GO
SET IDENTITY_INSERT CriterePerformance ON
GO
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (1, N'Pertinence de l’information recueillie', 1, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (2, N'Examen complet des caractéristiques générales des fonctions de travail et de leurs conditions d’exercice', 2, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (3, N'Reconnaissance des possibilités d’exercice des professions en entreprise et de pratique entrepreneuriale dans le domaine de l’informatique', 3, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (4, N'Reconnaissance des effets, sur le travail, de l’évolution technologique rapide dans le domaine de l’informatique', 4, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (5, N'Examen complet des opérations, ainsi que des conditions d’exécution et des critères de performance des tâches associés aux différentes fonctions de travail', 1, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (6, N'Détermination exacte de l’importance relative des activités', 2, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (7, N'Mise en relation des étapes du processus de travail avec les tâches des fonctions de travail', 3, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (8, N'Pertinence des liens établis entre les habiletés et comportements et les différentes tâches des fonctions de travail', 1, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (9, N'Examen complet des exigences liées à l’éthique professionnelle', 2, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (10, N'Reconnaissance des droits et des responsabilités des personnes dans les relations employeur-employé et client-fournisseur', 1, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (11, N'Reconnaissance des conséquences des manquements aux lois et règlements', 2, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (12, N'Représentation correcte de nombres dans différentes bases', 1, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (13, N'Conversion correcte de nombres d’une base à une autre', 2, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (14, N'Exécution correcte des opérations arithmétiques dans différentes bases', 3, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (15, N'Représentation juste de données dans la mémoire de l’ordinateur', 4, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (16, N'Interprétation juste des limites de représentation des données dans la mémoire de l’ordinateur', 5, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (17, N'Formulation de propositions appropriées à différentes situations', 1, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (18, N'Construction d’une table de vérité conforme à une proposition', 2, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (19, N'Simplification correcte d’une proposition', 3, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (20, N'Utilisation appropriée de la méthode de preuve par induction', 4, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (21, N'Construction d’ensembles et de sous-ensembles appropriés à différentes situations', 1, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (22, N'Exécution correcte de toutes les opérations dans les ensembles', 2, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (23, N'Établissement de relations justes entre des ensembles', 3, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (24, N'Formulation de propositions appropriées et dans leur forme la plus simple en vue de traiter l’information dans une situation donnée', 4, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (25, N'Traduction correcte des propositions en langage ensembliste', 5, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (26, N'Représentation d’une situation sous forme d’un système d’équations linéaires approprié', 1, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (27, N'Exécution correcte des opérations dans les matrices', 2, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (28, N'Représentation juste d’un système d’équations linéaires sous forme matricielle', 3, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (29, N'Application correcte de méthodes de résolution de problèmes d’un système d’équations linéaires', 4, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (30, N'Calcul exact du nombre de permutations dans un contexte donné', 1, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (31, N'Calcul exact du nombre d’arrangements dans un contexte donné', 2, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (32, N'Calcul exact du nombre de combinaisons dans un contexte donné', 3, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (33, N'Calcul des probabilités d’événements liées aux lois binomiale, normale et de Poisson', 1, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (34, N'Détermination de la nature des variables appropriées à une situation donnée', 2, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (35, N'Choix d’échelles de mesure appropriées à une situation donnée', 3, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (36, N'Choix des mesures statistiques appropriées à une situation donnée', 4, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (37, N'Choix judicieux du mode de représentation de l’information', 5, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (38, N'Application rigoureuse des normes de présentation des tableaux et des graphiques', 6, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (39, N'Utilisation efficace des fonctionnalités d’un logiciel de statistiques', 7, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (40, N'Choix des méthodes d’échantillonnage appropriées à une situation donnée', 8, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (41, N'Estimation par intervalle d’une moyenne et d’une proportion pour des grands échantillons', 9, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (42, N'Comparaison des possibilités et des limites des systèmes de fichiers de différents systèmes d''exploitation', 1, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (43, N'Utilisation correcte des commandes de manipulation des fichiers', 2, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (44, N'Utilisation correcte des commandes de manipulation des répertoires', 3, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (45, N'Utilisation correcte des commandes visant à assurer la sécurité des fichiers et des répertoires', 4, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (46, N'Utilisation correcte des outils visant le stockage et l''intégrité des données', 5, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (47, N'Analyse judicieuse des possibilités et des limites des différents systèmes d''exploitation au regard de l''exécution des tâches', 1, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (48, N'Utilisation correcte du langage de commande propre au système d''exploitation', 2, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (49, N'Utilisation appropriée des commandes en vue d’établir l’ordre de priorité des tâches', 3, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (50, N'Adaptation appropriée des paramètres de sécurité aux exigences des tâches', 4, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (51, N'Application des techniques de débogage appropriées au système d''exploitation', 5, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (52, N'Consignation des commentaires pertinents', 6, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (53, N'Analyse judicieuse des possibilités et des limites des différents systèmes d''exploitation au regard de la gestion de la mémoire', 1, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (54, N'Allocation de la mémoire appropriée aux besoins relatifs à l''exécution d''une tâche', 2, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (55, N'Comparaison des différents types de fichiers de configuration propres au système d''exploitation', 1, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (56, N'Utilisation correcte des commandes de configuration de base du poste de travail', 2, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (57, N'Utilisation correcte des commandes de démarrage et de configuration des périphériques', 3, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (58, N'Démarrage des programmes appropriés aux besoins de l''utilisatrice et de l''utilisateur', 4, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (59, N'Adaptation des paramètres de configuration de l''environnement de travail aux exigences de l''utilisatrice et de l''utilisateur', 5, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (60, N'Consignation précise des paramètres de personnalisation', 6, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (61, N'Distinction et repérage des éléments de la carte maîtresse', 1, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (62, N'Reconnaissance des caractéristiques et des fonctions propres aux processeurs, aux mémoires, aux bus et aux horloges', 2, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (63, N'Reconnaissance des caractéristiques et des fonctions propres aux différents ports de communication', 3, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (64, N'Reconnaissance des relations entre les différents éléments', 4, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (65, N'Analyse judicieuse de la demande', 1, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (66, N'Préparation du matériel nécessaire', 2, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (67, N'Détermination juste de la séquence des opérations', 3, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (68, N'Consignation complète de la configuration physique initiale', 1, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (69, N'Copie de l''ensemble des données', 2, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (70, N'Prise des mesures de sécurité appropriées', 3, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (71, N'Interprétation correcte des fiches techniques', 1, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (72, N'Détermination appropriée de chacun des paramètres d''installation', 2, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (73, N'Installation de l''élément à l''endroit approprié', 3, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (74, N'Configuration conforme à l''environnement du poste', 4, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (75, N'Vérification appropriée du fonctionnement de l''élément', 5, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (76, N'Interprétation judicieuse de l’information technique', 1, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (77, N'Respect du processus de désinstallation en fonction de l’élément à retirer', 2, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (78, N'Prise des précautions appropriées', 3, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (79, N'Interprétation judicieuse de l''information technique', 1, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (80, N'Démarrage approprié de l''installation', 2, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (81, N'Choix des paramètres d''installation en fonction de l''environnement du poste', 3, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (82, N'Vérification approprié du fonctionnement de l''élément', 4, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (83, N'Personnalisation de l''élément appropriée aux besoins de l’utilisatrice et de l''utilisateur', 5, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (84, N'Copie correcte des disques', 1, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (85, N'Interprétation judicieuse de l''information technique', 2, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (86, N'Utilisation appropriée des outils de désinstallation', 3, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (87, N'Respect du processus de désinstallation manuelle', 4, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (88, N'Vérification appropriée du fonctionnement de l''ensemble des éléments', 1, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (89, N'Résolution efficace des problèmes d''installation', 2, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (90, N'Installation de la station de travail conforme aux principes de l''ergonomie', 3, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (91, N'Prise en note de la nouvelle configuration', 1, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (92, N'Rédaction claire et correcte des problèmes éprouvés et des solutions apportées', 2, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (93, N'Mise à jour précise de l''inventaire', 3, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (94, N'Vérification méthodique de l’accès aux différents éléments physiques et logiques de l’environnement', 1, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (95, N'Configuration de l’environnement appropriée aux caractéristiques de la situation', 2, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (96, N'Personnalisation de l’environnement efficace et conforme aux exigences de l’entreprise', 3, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (97, N'Modification appropriée de la représentation des données', 1, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (98, N'Adaptation correcte des conditions d’exécution', 2, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (99, N'Modification appropriée des structures de traitement', 3, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (100, N'Adaptation appropriée de la séquence des opérations', 4, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (101, N'Utilisation efficace des fonctionnalités d’édition de l’environnement', 1, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (102, N'Application des règles de syntaxe et de sémantique propres au langage utilisé', 2, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (103, N'Application rigoureuse des standards de codification', 3, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (104, N'Application judicieuse des principes de la programmation structurée', 4, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (105, N'Mise à profit judicieuse des possibilités du langage', 5, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (106, N'Consignation des commentaires pertinents et conformes aux exigences de l’entreprise', 6, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (107, N'Utilisation efficace des fonctionnalités de compilation de l’environnement', 1, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (108, N'Repérage des erreurs de compilation', 2, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (109, N'Correction des erreurs de compilation', 3, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (110, N'Utilisation efficace des fonctionnalités d’exécution et de débogage de l’environnement', 1, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (111, N'Préparation correcte des jeux d’essai nécessaires à la vérification du fonctionnement du programme', 2, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (112, N'Interprétation juste des résultats', 3, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (113, N'Débogage approprié du programme selon l’algorithme', 4, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (114, N'Établissement complet des domaines d’application', 1, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (115, N'Détermination des classes pertinentes', 2, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (116, N'Établissement des relations hiérarchiques appropriées entre les classes', 3, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (117, N'Détermination des services de chacune des classes', 4, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (118, N'Détermination des attributs pertinents compte tenu de chacune des classes', 5, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (119, N'Représentation graphique appropriée du modèle objet', 6, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (120, N'Mise au point de la séquence des opérations propres aux différents services de la classe', 1, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (121, N'Représentation graphique appropriée du modèle séquentiel', 2, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (122, N'Modification appropriée du modèle objet', 3, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (123, N'Préparation appropriée de l''environnement de programmation', 1, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (124, N'Déclaration et définition de la classe respectant les règles de syntaxe et de sémantique du langage', 2, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (125, N'Exploitation judicieuse des possibilités du langage dans l''application des principes d''encapsulation, d''héritage et de polymorphisme', 3, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (126, N'Application rigoureuse des standards de nomenclature et de documentation reconnus propres à l''entreprise', 4, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (127, N'Repérage et correction des erreurs de compilation de la classe', 5, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (128, N'Préparation correcte des jeux d''essai nécessaires à la vérification du bon fonctionnement de tous les services de la classe', 1, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (129, N'Création d''un environnement de test approprié', 2, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (130, N'Interprétation juste des résultats', 3, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (131, N'Débogage approprié de la classe', 4, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (132, N'Utilisation des mécanismes de génération propres à l’outil employé', 1, NULL, 33)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (133, N'Précision juste du besoin de recherche', 1, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (134, N'Détermination des critères permettant de choisir correctement les sources de la recherche', 2, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (135, N'Manifestation d’initiative', 3, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (136, N'Sélection judicieuse des sources en fonction de la nature et des critères de la recherche', 1, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (137, N'Utilisation correcte et efficace des méthodes et des outils de recherche conventionnels et informatiques', 2, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (138, N'Prise en considération des risques de s’éloigner du besoin initial', 3, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (139, N'Pertinence de l’information consultée', 1, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (140, N'Interprétation juste de l’information en français et en anglais', 2, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (141, N'Pertinence de l’information extraite en fonction du besoin initial', 3, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (142, N'Manifestation de curiosité', 4, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (143, N'Clarté, précision et pertinence de l’information consignée', 1, NULL, 37)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (144, N'Prise en considération de ses forces et de ses faiblesses en matière de relations interpersonnelles', 1, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (145, N'Manifestation d’attitudes favorisant des relations interpersonnelles harmonieuses', 2, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (146, N'Application rigoureuse des règles de politesse et de courtoisie', 3, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (147, N'Adaptation de son approche selon les personnes et les situations', 4, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (148, N'Utilisation appropriée des techniques de gestion des conflits interpersonnels', 5, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (149, N'Manifestation de comportements conformes à l’éthique professionnelle', 6, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (150, N'Manifestation d’une attitude d’écoute et de réceptivité', 1, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (151, N'Adaptation du niveau de langage selon l’interlocutrice et l’interlocuteur', 2, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (152, N'Application correcte des techniques de communication verbale et non verbale', 3, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (153, N'Utilisation appropriée des techniques de négociation et d’argumentation', 4, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (154, N'Distinction juste du rôle et des responsabilités des membres de l’équipe', 1, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (155, N'Prise de ses responsabilités au sein de l’équipe', 2, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (156, N'Contribution active aux activités de l’équipe', 3, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (157, N'Utilisation appropriée des techniques de négociation et d’argumentation', 4, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (158, N'Manifestation d’attitudes favorisant le travail d’équipe', 5, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (159, N'Respect du mode d’action établi par l’équipe', 6, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (160, N'Respect des décisions prises par les membres de l’équipe', 7, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (161, N'Contribution efficace à la résolution des problèmes éprouvés par les membres de l’équipe', 8, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (162, N'Interprétation juste des besoins', 1, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (163, N'Manifestation d’un souci constant de répondre aux besoins des clientes et des clients', 2, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (164, N'Vérification régulière de la satisfaction des clientes et des clients', 3, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (165, N'Réaction appropriée devant les problèmes soulevés par les clientes et les clients', 4, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (166, N'Manifestation d’un souci constant d’améliorer la qualité des services et des produits', 5, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (167, N'Manifestation de comportements conformes à l’éthique professionnelle', 6, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (168, N'Établissement correcte des données d''entrée', 1, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (169, N'Établissement correcte des données de sortie', 2, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (170, N'Établissement correcte de la nature des traitements', 3, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (171, N'Détermination correcte des conditions d’exécution de l''algorithme', 4, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (172, N'Choix d’un mode de représentation de l''algorithme conforme aux exigences de l''entreprise', 1, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (173, N'Détermination d''une séquence logique des opérations', 2, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (174, N'Détermination des structures de traitement appropriées à chacune des opérations', 3, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (175, N'Application rigoureuse des règles de syntaxe propres au mode de représentation retenu', 4, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (176, N'Recherche d''une solution algorithmique efficace', 5, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (177, N'Représentation précise de la solution algorithmique retenue', 6, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (178, N'Présence de toute l''information nécessaire à l''interprétation de l''algorithme', 7, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (179, N'Vérification de la pertinence de la solution compte tenu de la situation initiale', 1, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (180, N'Détermination des erreurs et des lacunes de la solution algorithmique mise au point', 2, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (181, N'Modification appropriée de la solution algorithmique', 3, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (182, N'Examen des caractéristiques des utilisatrices et des utilisateurs liées à l’âge, à la culture et à la scolarisation', 1, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (183, N'Détermination du degré de familiarité avec l’informatique en général et avec l’application à utiliser', 2, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (184, N'Détermination du degré de réceptivité des utilisatrices et des utilisateurs par rapport à l’application à utiliser', 3, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (185, N'Précision des attentes des utilisatrices et des utilisateurs', 4, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (186, N'Reconnaissance des caractéristiques de l’environnement physique', 1, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (187, N'Détermination des modalités d’interaction', 2, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (188, N'Définition des caractéristiques des tâches d’interaction', 3, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (189, N'Vérification de la cohérence entre les modalités et les tâches', 4, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (190, N'Prise en considération des caractéristiques des utilisatrices et des utilisateurs', 1, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (191, N'Prise en considération des caractéristiques de l’interaction', 2, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (192, N'Prise en considération des caractéristiques des exigences d’ergonomie', 3, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (193, N'Prise en considération des contraintes de fiabilité, de coût et de maintenance', 4, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (194, N'Interprétation correcte des fiches techniques des produits offerts sur le marché', 5, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (195, N'Établissement des actions et des exceptions liées aux tâches', 1, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (196, N'Détermination des éléments de présentation des actions et des exceptions', 2, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (197, N'Organisation spatiale appropriée des éléments', 3, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (198, N'Détermination des caractéristiques de présentation des éléments', 4, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (199, N'Organisation de l’interface conforme aux critères d’esthétisme et d’efficacité', 5, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (200, N'Consignation de l’information relative à l’interface', 6, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (201, N'Création des éléments selon les caractéristiques de présentation choisies', 1, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (202, N'Positionnement des éléments selon l’organisation spatiale retenue', 2, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (203, N'Établissement des liens entre les éléments et les programmes de l’application', 3, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (204, N'Validation du fonctionnement de l’interface', 4, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (205, N'Détermination correcte des principales tâches et de leur séquence', 1, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (206, N'Estimation du temps nécessaire à l’exécution des principales tâches', 2, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (207, N'Prise en considération des échéances établies pour l’exécution du travail', 3, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (208, N'Établissement correct de priorités', 1, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (209, N'Prise en considération des points critiques', 2, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (210, N'Prévision d’une marge de manœuvre suffisante pour faire face aux imprévus', 3, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (211, N'Utilisation appropriée des méthodes et des outils de planification', 4, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (212, N'Établissement d’un calendrier des travaux réaliste', 5, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (213, N'Détermination correcte des ressources humaines et matérielles nécessaires à l’exécution du travail', 6, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (214, N'Communication efficace avec les personnes en cause', 7, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (215, N'Présentation correcte du plan de travail pour approbation', 8, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (216, N'Utilisation d’une méthode appropriée de suivi des activités', 1, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (217, N'Gestion efficace du temps', 2, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (218, N'Respect du calendrier des travaux', 3, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (219, N'Adaptation régulière du calendrier des travaux en fonction des imprévus', 4, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (220, N'Détermination juste du support nécessaire', 1, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (221, N'Sélection et utilisation correcte du logiciel de création du document', 2, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (222, N'Établissement juste du plan de travail pour le document à produire', 1, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (223, N'Préparation appropriée des éléments de contenu', 2, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (224, N'Application rigoureuse des règles grammaticales et orthographiques', 3, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (225, N'Établissement correct du format de mise en page', 4, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (226, N'Adaptation correcte du niveau de langage en fonction du public cible', 5, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (227, N'Clarté du texte', 6, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (228, N'Utilisation efficace des logiciels de bureautique et de multimédia', 7, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (229, N'Respect des normes de mise en page', 8, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (230, N'Sélection des éléments qui nécessitent de l’aide en ligne', 1, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (231, N'Respect des normes de présentation', 2, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (232, N'Application rigoureuse des règles grammaticales et orthographiques', 3, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (233, N'Adaptation correcte du niveau de langage en fonction du public cible', 4, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (234, N'Utilisation correcte du logiciel de création d’aide en ligne', 5, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (235, N'Facilité d’utilisation de l’aide en ligne', 6, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (236, N'Vérification de la cohérence de l’aide en ligne', 7, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (237, N'Prise en considération des objectifs d’apprentissage en fonction du public cible et du contexte de formation', 1, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (238, N'Préparation appropriée des éléments de contenu', 2, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (239, N'Utilisation correcte des outils de production du document', 3, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (240, N'Respect des normes de présentation', 4, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (241, N'Application rigoureuse des règles grammaticales et orthographiques', 5, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (242, N'Adaptation correcte du niveau de langage en fonction du public cible', 6, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (243, N'Vérification minutieuse du document', 7, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (244, N'Établissement juste de la liste de diffusion', 1, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (245, N'Sélection et utilisation du mode de diffusion', 2, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (246, N'Vérification systématique de la réception', 3, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (247, N'Respect des règles de conservation d’un document', 1, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (248, N'Attribution précise d’un code à partir du plan de classification', 2, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (249, N'Précision et concision du titre d’un document selon les normes', 3, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (250, N'Consignation minutieuse de l’information dans l’outil de repérage', 4, NULL, 58)
SET IDENTITY_INSERT CriterePerformance OFF
GO
