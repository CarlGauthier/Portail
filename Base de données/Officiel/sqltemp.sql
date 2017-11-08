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
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (221, 'M�canique du b�timent')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (222, 'Am�nagement et urbanisme')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (235, 'G�nie m�canique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (241, 'G�nie m�canique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (243, '�lectronique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (260, 'Environnement, hygi�ne')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (300, 'Sciences humaines')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (322, '�ducation � l''enfance')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (351, '�ducation sp�cialis�e')
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
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (582, 'Int�gration multim�dia')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (589, 'Art et technologie des m�dias')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (700, 'Sciences, lettres et arts')
GO
-- Insertion des programmes
INSERT INTO Programme (annee, codeSpecialisation, nbUnite, nom, specialisation, nbHeurefrmGenerale, nbHeurefrmSpecifique, condition, sanction, commentaire, docMinistere_path, dateValidation, codeProgramme) VALUES
('2001','AA','91 2/3', 'Informatique', 'Informatique de gestion', '660', '1980', 'Math�matique 526/Math�matique 536', 'Dipl�me d��tudes coll�giales', NULL, NULL, NULL, '420'),
('2000','A1',NULL,'Int�gration multim�dia',NULL,NULL,NULL,NULL,'Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'582'),
('2001','A0',NULL,'Soins infirmiers',NULL,NULL,NULL,'Math�matique 536','Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'180'),
('2000','C0',NULL,'G�nie Chimique',NULL,NULL,NULL,'Math�matique 526','Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'210')
GO
--select * from EnteteProgramme
--select * from tblProgramme
SET IDENTITY_INSERT EnonceCompetence ON
GO
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (1, N'016N', N'Analyser les fonctions de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (2, N'016P', N'R�soudre des probl�mes math�matiques et
statistiques en informatique', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (3, N'016Q', N'Mettre � profit les possibilit�s d''un syst�me
d''exploitation propre � une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (4, N'016R', N'Installer des �l�ments physiques et logiques
dans une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (5, N'016S', N'Exploiter un langage de programmation
structur�e', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (6, N'016T', N'Appliquer une approche de d�veloppement par
objets', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (7, N'016U', N'Effectuer la recherche d�information', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (8, N'026V', N'Interagir et communiquer dans des situations de
travail vari�es', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (9, N'016W', N'Produire des algorithmes', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (10, N'016X', N'Produire une interface utilisateur', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (11, N'016Y', N'Planifier et g�rer des activit�s de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (12, N'016Z', N'Assurer la production et la gestion de
documents', NULL, 1, 1, NULL, 1)
SET IDENTITY_INSERT EnonceCompetence OFF
GO
SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (1, N'Caract�riser les fonctions de travail et leurs conditions d''exercise', 1, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (2, N'Examiner les t�ches et les op�rations li�es aux fonctions de travail', 2, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (3, N'Examiner les habilet�s et les comportements n�cessaire a l''exercice des fonctions de travail.', 3, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (4, N'Examiner la r�glementation relative � l''exercice de la profession en g�n�ral', 4, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (5, N'Effectuer des traitements sur des donn�es
internes de l�ordinateur', 1, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (6, N'Effectuer des op�rations logiques', 2, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (7, N'Organiser et traiter de l�information', 3, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (8, N'R�soudre des probl�mes de
programmation lin�aire', 4, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (9, N'R�soudre des probl�mes de
d�nombrement', 5, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (10, N'R�soudre des probl�mes de probabilit� et
de statistique', 6, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (11, N'Exploiter un syst�me de fichiers', 1, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (12, N'Automatiser des t�ches', 2, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (13, N'Utiliser les m�canismes de gestion de la
m�moire', 3, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (14, N'Personnaliser l''environnement de la station
de travail', 4, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (15, N'Analyser l''architecture interne de
l''ordinateur', 1, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (16, N'Planifier le travail', 2, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (17, N'Prot�ger l''environnement de la station de
travail', 3, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (18, N'Installer des �l�ments physiques', 4, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (19, N'D�sinstaller des �l�ments physiques', 5, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (20, N'Installer des �l�ments logiques', 6, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (21, N'D�sinstaller des �l�ments logiques', 7, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (22, N'V�rifier l''installation de la station de
travail dans l''environnement de
l''utilisatrice et de l''utilisateur', 8, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (23, N'Consigner l''information sur l''installation', 9, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (24, N'Pr�parer l�environnement de
programmation.', 1, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (25, N'Adapter l�algorithme aux contraintes du
langage de programmation.', 2, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (26, N'Traduire l�algorithme dans le langage de
programmation.', 3, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (27, N'Compiler le programme', 4, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (28, N'Valider le programme', 5, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (29, N'Cr�er un mod�le objet', 1, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (30, N'Perfectionner le mod�le objet', 2, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (31, N'Proc�der � la codification d�une classe', 3, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (32, N'Valider le fonctionnement d�une classe', 4, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (33, N'G�n�rer la version ex�cutable du
programme', 5, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (34, N'Pr�ciser le besoin d�information', 1, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (35, N'S�lectionner et utiliser les sources de
recherche', 2, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (36, N'Consulter et extraire l�information
n�cessaire', 3, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (37, N'Consigner les r�sultats de la recherche', 4, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (38, N'�tablir et entretenir des relations
interpersonnelles', 1, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (39, N'Communiquer avec des personnes �
l�interne et � l�externe', 2, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (40, N'Travailler au sein d�une �quipe
multidisciplinaire', 3, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (41, N'Appliquer une approche client', 4, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (42, N'Analyser la situation', 1, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (43, N'Mettre au point l''algorithme', 2, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (44, N'Valider l''algorithme', 3, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (45, N'Analyser les caract�ristiques des
utilisatrices et des utilisateurs', 1, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (46, N'�tablir les caract�ristiques d�interaction', 2, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (47, N'Choisir des p�riph�riques d�entr�e et de
sortie', 3, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (48, N'Planifier l�organisation globale de
l�interface', 4, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (49, N'Proc�der � la programmation de l�interface
utilisateur', 5, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (50, N'Analyser les caract�ristiques du travail �
effectuer', 1, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (51, N'Proc�der � la planification des activit�s', 2, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (52, N'Assurer le suivi des activit�s de travail', 3, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (53, N'Choisir le support du document', 1, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (54, N'Produire un document technique et
administratif', 2, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (55, N'Produire l�aide en ligne', 3, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (56, N'Produire un document de formation', 4, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (57, N'Diffuser un document', 5, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (58, N'Classer un document', 6, NULL, NULL, 12)
SET IDENTITY_INSERT ElementCompetence OFF
GO
SET IDENTITY_INSERT ContexteRealisation ON
GO
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (1, N'a l''aide d''une information r�cente sur les fonctions de travail suivantes : - programeuse-analyste et programeur-analyste dans les domaine de la gestion et de l''indutrie', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (2, N'� l''aide d''une information r�cente sur les entreprses dans lesquelles on trouve la programeuse-analyste et le programmeur-analyste et la et le gestionnaire de r�seaux informatique', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (3, N'� partir de situations propres au domaine de l''informatique', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (4, N'� partir d''une station de travail et d�un logiciel de statistiques', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (5, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (6, N'Dans des environnements utilisant des syst�mes d�exploitation vari�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (7, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (8, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (9, N'� partir des normes et des exigences de l''entreprise', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (10, N'En atelier et sur le lieu de travail de l''utilisatrice et de l''utilisateur', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (11, N'� partir d''une demande pr�autoris�e pr�cisant la nature de l''installation', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (12, N'� partir d''une station de travail', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (13, N'� l''aide des �l�ments physiques et logiques � installer et des outils appropri�s', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (14, N'� partir des normes et des exigences de l''entreprise', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (15, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (16, N'� partir d�une station de travail et des logiciels appropri�s', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (17, N'� partir d�algorithmes valides et repr�sentatifs du milieu de travail', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (18, N'� partir des normes et des exigences de l�entreprise', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (19, N'� l�aide des manuels de r�f�rences techniques appropri�s � l�environnement de programmation', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (20, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (21, N'� partir de situations repr�sentatives du milieu du travail et n�cessitant le d�veloppement d�applications comportant un nombre limit� de classes', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (22, N'� partir des normes et des exigences de l''entreprise', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (23, N'� l�aide de toute la documentation disponible sur les applications � d�velopper', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (24, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (25, N'� partir de besoins d�information pr�cis propres au milieu de travail', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (26, N'� partir de besoins d�information li�s � la veille technologique', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (27, N'� partir d�une station de travail et des logiciels appropri�s', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (28, N'� l�aide de manuels de r�f�rences en fran�ais et en anglais', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (29, N'Dans des situations de travail vari�es', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (30, N'En pr�sence des personnes en cause', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (31, N'� partir de situations vari�es repr�sentatives du milieu de travail', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (32, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (33, N'� partir des exigences de l''entreprise', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (34, N'� l�aide des manuels de r�f�rences techniques appropri�s', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (35, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (36, N'� partir d�applications vari�es n�cessitant la cr�ation d�interfaces', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (37, N'� partir des manuels de r�f�rences techniques appropri�s', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (38, N'� partir des exigences de l''entreprise et des standards de l�informatique', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (39, N'Dans des situations de travail propres � la profession', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (40, N'� l�aide des outils de planification appropri�s', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (41, N'� partir des exigences de l''entreprise', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (42, N'Pour des documents en fran�ais et en anglais', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (43, N'� partir d�une station de travail et des logiciels de bureautique, de multim�dia et de cr�ation d�aide en ligne', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (44, N'� l�aide de dictionnaires, de grammaires et d�outils de r�f�rence vari�s', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (45, N'� l�aide de l�inforoute et des services de t�l�communication', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (46, N'� partir des exigences de l�entreprise', NULL, 12)
SET IDENTITY_INSERT ContexteRealisation OFF
GO
SET IDENTITY_INSERT CriterePerformance ON
GO
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (1, N'Pertinence de l�information recueillie', 1, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (2, N'Examen complet des caract�ristiques g�n�rales des fonctions de travail et de leurs conditions d�exercice', 2, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (3, N'Reconnaissance des possibilit�s d�exercice des professions en entreprise et de pratique entrepreneuriale dans le domaine de l�informatique', 3, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (4, N'Reconnaissance des effets, sur le travail, de l��volution technologique rapide dans le domaine de l�informatique', 4, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (5, N'Examen complet des op�rations, ainsi que des conditions d�ex�cution et des crit�res de performance des t�ches associ�s aux diff�rentes fonctions de travail', 1, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (6, N'D�termination exacte de l�importance relative des activit�s', 2, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (7, N'Mise en relation des �tapes du processus de travail avec les t�ches des fonctions de travail', 3, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (8, N'Pertinence des liens �tablis entre les habilet�s et comportements et les diff�rentes t�ches des fonctions de travail', 1, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (9, N'Examen complet des exigences li�es � l��thique professionnelle', 2, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (10, N'Reconnaissance des droits et des responsabilit�s des personnes dans les relations employeur-employ� et client-fournisseur', 1, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (11, N'Reconnaissance des cons�quences des manquements aux lois et r�glements', 2, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (12, N'Repr�sentation correcte de nombres dans diff�rentes bases', 1, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (13, N'Conversion correcte de nombres d�une base � une autre', 2, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (14, N'Ex�cution correcte des op�rations arithm�tiques dans diff�rentes bases', 3, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (15, N'Repr�sentation juste de donn�es dans la m�moire de l�ordinateur', 4, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (16, N'Interpr�tation juste des limites de repr�sentation des donn�es dans la m�moire de l�ordinateur', 5, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (17, N'Formulation de propositions appropri�es � diff�rentes situations', 1, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (18, N'Construction d�une table de v�rit� conforme � une proposition', 2, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (19, N'Simplification correcte d�une proposition', 3, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (20, N'Utilisation appropri�e de la m�thode de preuve par induction', 4, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (21, N'Construction d�ensembles et de sous-ensembles appropri�s � diff�rentes situations', 1, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (22, N'Ex�cution correcte de toutes les op�rations dans les ensembles', 2, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (23, N'�tablissement de relations justes entre des ensembles', 3, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (24, N'Formulation de propositions appropri�es et dans leur forme la plus simple en vue de traiter l�information dans une situation donn�e', 4, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (25, N'Traduction correcte des propositions en langage ensembliste', 5, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (26, N'Repr�sentation d�une situation sous forme d�un syst�me d��quations lin�aires appropri�', 1, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (27, N'Ex�cution correcte des op�rations dans les matrices', 2, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (28, N'Repr�sentation juste d�un syst�me d��quations lin�aires sous forme matricielle', 3, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (29, N'Application correcte de m�thodes de r�solution de probl�mes d�un syst�me d��quations lin�aires', 4, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (30, N'Calcul exact du nombre de permutations dans un contexte donn�', 1, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (31, N'Calcul exact du nombre d�arrangements dans un contexte donn�', 2, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (32, N'Calcul exact du nombre de combinaisons dans un contexte donn�', 3, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (33, N'Calcul des probabilit�s d��v�nements li�es aux lois binomiale, normale et de Poisson', 1, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (34, N'D�termination de la nature des variables appropri�es � une situation donn�e', 2, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (35, N'Choix d��chelles de mesure appropri�es � une situation donn�e', 3, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (36, N'Choix des mesures statistiques appropri�es � une situation donn�e', 4, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (37, N'Choix judicieux du mode de repr�sentation de l�information', 5, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (38, N'Application rigoureuse des normes de pr�sentation des tableaux et des graphiques', 6, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (39, N'Utilisation efficace des fonctionnalit�s d�un logiciel de statistiques', 7, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (40, N'Choix des m�thodes d��chantillonnage appropri�es � une situation donn�e', 8, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (41, N'Estimation par intervalle d�une moyenne et d�une proportion pour des grands �chantillons', 9, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (42, N'Comparaison des possibilit�s et des limites des syst�mes de fichiers de diff�rents syst�mes d''exploitation', 1, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (43, N'Utilisation correcte des commandes de manipulation des fichiers', 2, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (44, N'Utilisation correcte des commandes de manipulation des r�pertoires', 3, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (45, N'Utilisation correcte des commandes visant � assurer la s�curit� des fichiers et des r�pertoires', 4, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (46, N'Utilisation correcte des outils visant le stockage et l''int�grit� des donn�es', 5, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (47, N'Analyse judicieuse des possibilit�s et des limites des diff�rents syst�mes d''exploitation au regard de l''ex�cution des t�ches', 1, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (48, N'Utilisation correcte du langage de commande propre au syst�me d''exploitation', 2, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (49, N'Utilisation appropri�e des commandes en vue d��tablir l�ordre de priorit� des t�ches', 3, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (50, N'Adaptation appropri�e des param�tres de s�curit� aux exigences des t�ches', 4, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (51, N'Application des techniques de d�bogage appropri�es au syst�me d''exploitation', 5, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (52, N'Consignation des commentaires pertinents', 6, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (53, N'Analyse judicieuse des possibilit�s et des limites des diff�rents syst�mes d''exploitation au regard de la gestion de la m�moire', 1, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (54, N'Allocation de la m�moire appropri�e aux besoins relatifs � l''ex�cution d''une t�che', 2, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (55, N'Comparaison des diff�rents types de fichiers de configuration propres au syst�me d''exploitation', 1, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (56, N'Utilisation correcte des commandes de configuration de base du poste de travail', 2, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (57, N'Utilisation correcte des commandes de d�marrage et de configuration des p�riph�riques', 3, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (58, N'D�marrage des programmes appropri�s aux besoins de l''utilisatrice et de l''utilisateur', 4, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (59, N'Adaptation des param�tres de configuration de l''environnement de travail aux exigences de l''utilisatrice et de l''utilisateur', 5, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (60, N'Consignation pr�cise des param�tres de personnalisation', 6, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (61, N'Distinction et rep�rage des �l�ments de la carte ma�tresse', 1, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (62, N'Reconnaissance des caract�ristiques et des fonctions propres aux processeurs, aux m�moires, aux bus et aux horloges', 2, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (63, N'Reconnaissance des caract�ristiques et des fonctions propres aux diff�rents ports de communication', 3, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (64, N'Reconnaissance des relations entre les diff�rents �l�ments', 4, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (65, N'Analyse judicieuse de la demande', 1, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (66, N'Pr�paration du mat�riel n�cessaire', 2, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (67, N'D�termination juste de la s�quence des op�rations', 3, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (68, N'Consignation compl�te de la configuration physique initiale', 1, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (69, N'Copie de l''ensemble des donn�es', 2, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (70, N'Prise des mesures de s�curit� appropri�es', 3, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (71, N'Interpr�tation correcte des fiches techniques', 1, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (72, N'D�termination appropri�e de chacun des param�tres d''installation', 2, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (73, N'Installation de l''�l�ment � l''endroit appropri�', 3, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (74, N'Configuration conforme � l''environnement du poste', 4, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (75, N'V�rification appropri�e du fonctionnement de l''�l�ment', 5, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (76, N'Interpr�tation judicieuse de l�information technique', 1, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (77, N'Respect du processus de d�sinstallation en fonction de l��l�ment � retirer', 2, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (78, N'Prise des pr�cautions appropri�es', 3, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (79, N'Interpr�tation judicieuse de l''information technique', 1, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (80, N'D�marrage appropri� de l''installation', 2, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (81, N'Choix des param�tres d''installation en fonction de l''environnement du poste', 3, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (82, N'V�rification appropri� du fonctionnement de l''�l�ment', 4, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (83, N'Personnalisation de l''�l�ment appropri�e aux besoins de l�utilisatrice et de l''utilisateur', 5, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (84, N'Copie correcte des disques', 1, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (85, N'Interpr�tation judicieuse de l''information technique', 2, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (86, N'Utilisation appropri�e des outils de d�sinstallation', 3, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (87, N'Respect du processus de d�sinstallation manuelle', 4, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (88, N'V�rification appropri�e du fonctionnement de l''ensemble des �l�ments', 1, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (89, N'R�solution efficace des probl�mes d''installation', 2, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (90, N'Installation de la station de travail conforme aux principes de l''ergonomie', 3, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (91, N'Prise en note de la nouvelle configuration', 1, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (92, N'R�daction claire et correcte des probl�mes �prouv�s et des solutions apport�es', 2, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (93, N'Mise � jour pr�cise de l''inventaire', 3, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (94, N'V�rification m�thodique de l�acc�s aux diff�rents �l�ments physiques et logiques de l�environnement', 1, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (95, N'Configuration de l�environnement appropri�e aux caract�ristiques de la situation', 2, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (96, N'Personnalisation de l�environnement efficace et conforme aux exigences de l�entreprise', 3, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (97, N'Modification appropri�e de la repr�sentation des donn�es', 1, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (98, N'Adaptation correcte des conditions d�ex�cution', 2, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (99, N'Modification appropri�e des structures de traitement', 3, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (100, N'Adaptation appropri�e de la s�quence des op�rations', 4, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (101, N'Utilisation efficace des fonctionnalit�s d��dition de l�environnement', 1, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (102, N'Application des r�gles de syntaxe et de s�mantique propres au langage utilis�', 2, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (103, N'Application rigoureuse des standards de codification', 3, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (104, N'Application judicieuse des principes de la programmation structur�e', 4, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (105, N'Mise � profit judicieuse des possibilit�s du langage', 5, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (106, N'Consignation des commentaires pertinents et conformes aux exigences de l�entreprise', 6, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (107, N'Utilisation efficace des fonctionnalit�s de compilation de l�environnement', 1, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (108, N'Rep�rage des erreurs de compilation', 2, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (109, N'Correction des erreurs de compilation', 3, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (110, N'Utilisation efficace des fonctionnalit�s d�ex�cution et de d�bogage de l�environnement', 1, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (111, N'Pr�paration correcte des jeux d�essai n�cessaires � la v�rification du fonctionnement du programme', 2, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (112, N'Interpr�tation juste des r�sultats', 3, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (113, N'D�bogage appropri� du programme selon l�algorithme', 4, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (114, N'�tablissement complet des domaines d�application', 1, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (115, N'D�termination des classes pertinentes', 2, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (116, N'�tablissement des relations hi�rarchiques appropri�es entre les classes', 3, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (117, N'D�termination des services de chacune des classes', 4, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (118, N'D�termination des attributs pertinents compte tenu de chacune des classes', 5, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (119, N'Repr�sentation graphique appropri�e du mod�le objet', 6, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (120, N'Mise au point de la s�quence des op�rations propres aux diff�rents services de la classe', 1, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (121, N'Repr�sentation graphique appropri�e du mod�le s�quentiel', 2, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (122, N'Modification appropri�e du mod�le objet', 3, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (123, N'Pr�paration appropri�e de l''environnement de programmation', 1, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (124, N'D�claration et d�finition de la classe respectant les r�gles de syntaxe et de s�mantique du langage', 2, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (125, N'Exploitation judicieuse des possibilit�s du langage dans l''application des principes d''encapsulation, d''h�ritage et de polymorphisme', 3, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (126, N'Application rigoureuse des standards de nomenclature et de documentation reconnus propres � l''entreprise', 4, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (127, N'Rep�rage et correction des erreurs de compilation de la classe', 5, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (128, N'Pr�paration correcte des jeux d''essai n�cessaires � la v�rification du bon fonctionnement de tous les services de la classe', 1, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (129, N'Cr�ation d''un environnement de test appropri�', 2, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (130, N'Interpr�tation juste des r�sultats', 3, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (131, N'D�bogage appropri� de la classe', 4, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (132, N'Utilisation des m�canismes de g�n�ration propres � l�outil employ�', 1, NULL, 33)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (133, N'Pr�cision juste du besoin de recherche', 1, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (134, N'D�termination des crit�res permettant de choisir correctement les sources de la recherche', 2, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (135, N'Manifestation d�initiative', 3, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (136, N'S�lection judicieuse des sources en fonction de la nature et des crit�res de la recherche', 1, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (137, N'Utilisation correcte et efficace des m�thodes et des outils de recherche conventionnels et informatiques', 2, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (138, N'Prise en consid�ration des risques de s��loigner du besoin initial', 3, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (139, N'Pertinence de l�information consult�e', 1, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (140, N'Interpr�tation juste de l�information en fran�ais et en anglais', 2, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (141, N'Pertinence de l�information extraite en fonction du besoin initial', 3, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (142, N'Manifestation de curiosit�', 4, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (143, N'Clart�, pr�cision et pertinence de l�information consign�e', 1, NULL, 37)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (144, N'Prise en consid�ration de ses forces et de ses faiblesses en mati�re de relations interpersonnelles', 1, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (145, N'Manifestation d�attitudes favorisant des relations interpersonnelles harmonieuses', 2, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (146, N'Application rigoureuse des r�gles de politesse et de courtoisie', 3, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (147, N'Adaptation de son approche selon les personnes et les situations', 4, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (148, N'Utilisation appropri�e des techniques de gestion des conflits interpersonnels', 5, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (149, N'Manifestation de comportements conformes � l��thique professionnelle', 6, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (150, N'Manifestation d�une attitude d��coute et de r�ceptivit�', 1, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (151, N'Adaptation du niveau de langage selon l�interlocutrice et l�interlocuteur', 2, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (152, N'Application correcte des techniques de communication verbale et non verbale', 3, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (153, N'Utilisation appropri�e des techniques de n�gociation et d�argumentation', 4, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (154, N'Distinction juste du r�le et des responsabilit�s des membres de l��quipe', 1, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (155, N'Prise de ses responsabilit�s au sein de l��quipe', 2, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (156, N'Contribution active aux activit�s de l��quipe', 3, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (157, N'Utilisation appropri�e des techniques de n�gociation et d�argumentation', 4, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (158, N'Manifestation d�attitudes favorisant le travail d��quipe', 5, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (159, N'Respect du mode d�action �tabli par l��quipe', 6, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (160, N'Respect des d�cisions prises par les membres de l��quipe', 7, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (161, N'Contribution efficace � la r�solution des probl�mes �prouv�s par les membres de l��quipe', 8, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (162, N'Interpr�tation juste des besoins', 1, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (163, N'Manifestation d�un souci constant de r�pondre aux besoins des clientes et des clients', 2, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (164, N'V�rification r�guli�re de la satisfaction des clientes et des clients', 3, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (165, N'R�action appropri�e devant les probl�mes soulev�s par les clientes et les clients', 4, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (166, N'Manifestation d�un souci constant d�am�liorer la qualit� des services et des produits', 5, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (167, N'Manifestation de comportements conformes � l��thique professionnelle', 6, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (168, N'�tablissement correcte des donn�es d''entr�e', 1, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (169, N'�tablissement correcte des donn�es de sortie', 2, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (170, N'�tablissement correcte de la nature des traitements', 3, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (171, N'D�termination correcte des conditions d�ex�cution de l''algorithme', 4, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (172, N'Choix d�un mode de repr�sentation de l''algorithme conforme aux exigences de l''entreprise', 1, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (173, N'D�termination d''une s�quence logique des op�rations', 2, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (174, N'D�termination des structures de traitement appropri�es � chacune des op�rations', 3, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (175, N'Application rigoureuse des r�gles de syntaxe propres au mode de repr�sentation retenu', 4, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (176, N'Recherche d''une solution algorithmique efficace', 5, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (177, N'Repr�sentation pr�cise de la solution algorithmique retenue', 6, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (178, N'Pr�sence de toute l''information n�cessaire � l''interpr�tation de l''algorithme', 7, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (179, N'V�rification de la pertinence de la solution compte tenu de la situation initiale', 1, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (180, N'D�termination des erreurs et des lacunes de la solution algorithmique mise au point', 2, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (181, N'Modification appropri�e de la solution algorithmique', 3, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (182, N'Examen des caract�ristiques des utilisatrices et des utilisateurs li�es � l��ge, � la culture et � la scolarisation', 1, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (183, N'D�termination du degr� de familiarit� avec l�informatique en g�n�ral et avec l�application � utiliser', 2, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (184, N'D�termination du degr� de r�ceptivit� des utilisatrices et des utilisateurs par rapport � l�application � utiliser', 3, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (185, N'Pr�cision des attentes des utilisatrices et des utilisateurs', 4, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (186, N'Reconnaissance des caract�ristiques de l�environnement physique', 1, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (187, N'D�termination des modalit�s d�interaction', 2, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (188, N'D�finition des caract�ristiques des t�ches d�interaction', 3, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (189, N'V�rification de la coh�rence entre les modalit�s et les t�ches', 4, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (190, N'Prise en consid�ration des caract�ristiques des utilisatrices et des utilisateurs', 1, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (191, N'Prise en consid�ration des caract�ristiques de l�interaction', 2, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (192, N'Prise en consid�ration des caract�ristiques des exigences d�ergonomie', 3, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (193, N'Prise en consid�ration des contraintes de fiabilit�, de co�t et de maintenance', 4, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (194, N'Interpr�tation correcte des fiches techniques des produits offerts sur le march�', 5, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (195, N'�tablissement des actions et des exceptions li�es aux t�ches', 1, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (196, N'D�termination des �l�ments de pr�sentation des actions et des exceptions', 2, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (197, N'Organisation spatiale appropri�e des �l�ments', 3, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (198, N'D�termination des caract�ristiques de pr�sentation des �l�ments', 4, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (199, N'Organisation de l�interface conforme aux crit�res d�esth�tisme et d�efficacit�', 5, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (200, N'Consignation de l�information relative � l�interface', 6, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (201, N'Cr�ation des �l�ments selon les caract�ristiques de pr�sentation choisies', 1, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (202, N'Positionnement des �l�ments selon l�organisation spatiale retenue', 2, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (203, N'�tablissement des liens entre les �l�ments et les programmes de l�application', 3, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (204, N'Validation du fonctionnement de l�interface', 4, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (205, N'D�termination correcte des principales t�ches et de leur s�quence', 1, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (206, N'Estimation du temps n�cessaire � l�ex�cution des principales t�ches', 2, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (207, N'Prise en consid�ration des �ch�ances �tablies pour l�ex�cution du travail', 3, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (208, N'�tablissement correct de priorit�s', 1, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (209, N'Prise en consid�ration des points critiques', 2, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (210, N'Pr�vision d�une marge de man�uvre suffisante pour faire face aux impr�vus', 3, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (211, N'Utilisation appropri�e des m�thodes et des outils de planification', 4, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (212, N'�tablissement d�un calendrier des travaux r�aliste', 5, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (213, N'D�termination correcte des ressources humaines et mat�rielles n�cessaires � l�ex�cution du travail', 6, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (214, N'Communication efficace avec les personnes en cause', 7, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (215, N'Pr�sentation correcte du plan de travail pour approbation', 8, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (216, N'Utilisation d�une m�thode appropri�e de suivi des activit�s', 1, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (217, N'Gestion efficace du temps', 2, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (218, N'Respect du calendrier des travaux', 3, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (219, N'Adaptation r�guli�re du calendrier des travaux en fonction des impr�vus', 4, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (220, N'D�termination juste du support n�cessaire', 1, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (221, N'S�lection et utilisation correcte du logiciel de cr�ation du document', 2, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (222, N'�tablissement juste du plan de travail pour le document � produire', 1, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (223, N'Pr�paration appropri�e des �l�ments de contenu', 2, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (224, N'Application rigoureuse des r�gles grammaticales et orthographiques', 3, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (225, N'�tablissement correct du format de mise en page', 4, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (226, N'Adaptation correcte du niveau de langage en fonction du public cible', 5, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (227, N'Clart� du texte', 6, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (228, N'Utilisation efficace des logiciels de bureautique et de multim�dia', 7, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (229, N'Respect des normes de mise en page', 8, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (230, N'S�lection des �l�ments qui n�cessitent de l�aide en ligne', 1, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (231, N'Respect des normes de pr�sentation', 2, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (232, N'Application rigoureuse des r�gles grammaticales et orthographiques', 3, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (233, N'Adaptation correcte du niveau de langage en fonction du public cible', 4, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (234, N'Utilisation correcte du logiciel de cr�ation d�aide en ligne', 5, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (235, N'Facilit� d�utilisation de l�aide en ligne', 6, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (236, N'V�rification de la coh�rence de l�aide en ligne', 7, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (237, N'Prise en consid�ration des objectifs d�apprentissage en fonction du public cible et du contexte de formation', 1, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (238, N'Pr�paration appropri�e des �l�ments de contenu', 2, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (239, N'Utilisation correcte des outils de production du document', 3, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (240, N'Respect des normes de pr�sentation', 4, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (241, N'Application rigoureuse des r�gles grammaticales et orthographiques', 5, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (242, N'Adaptation correcte du niveau de langage en fonction du public cible', 6, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (243, N'V�rification minutieuse du document', 7, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (244, N'�tablissement juste de la liste de diffusion', 1, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (245, N'S�lection et utilisation du mode de diffusion', 2, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (246, N'V�rification syst�matique de la r�ception', 3, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (247, N'Respect des r�gles de conservation d�un document', 1, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (248, N'Attribution pr�cise d�un code � partir du plan de classification', 2, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (249, N'Pr�cision et concision du titre d�un document selon les normes', 3, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (250, N'Consignation minutieuse de l�information dans l�outil de rep�rage', 4, NULL, 58)
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
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (221, 'M�canique du b�timent')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (222, 'Am�nagement et urbanisme')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (235, 'G�nie m�canique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (241, 'G�nie m�canique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (243, '�lectronique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (260, 'Environnement, hygi�ne')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (300, 'Sciences humaines')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (322, '�ducation � l''enfance')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (351, '�ducation sp�cialis�e')
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
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (582, 'Int�gration multim�dia')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (589, 'Art et technologie des m�dias')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (700, 'Sciences, lettres et arts')
GO
-- Insertion des programmes
INSERT INTO Programme (annee, codeSpecialisation, nbUnite, nom, specialisation, nbHeurefrmGenerale, nbHeurefrmSpecifique, condition, sanction, commentaire, docMinistere_path, dateValidation, codeProgramme) VALUES
('2001','AA','91 2/3', 'Informatique', 'Informatique de gestion', '660', '1980', 'Math�matique 526/Math�matique 536', 'Dipl�me d��tudes coll�giales', NULL, NULL, NULL, '420'),
('2000','A1',NULL,'Int�gration multim�dia',NULL,NULL,NULL,NULL,'Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'582'),
('2001','A0',NULL,'Soins infirmiers',NULL,NULL,NULL,'Math�matique 536','Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'180'),
('2000','C0',NULL,'G�nie Chimique',NULL,NULL,NULL,'Math�matique 526','Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'210')
GO
--select * from EnteteProgramme
--select * from tblProgramme
SET IDENTITY_INSERT EnonceCompetence ON
GO
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (1, N'016N', N'Analyser les fonctions de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (2, N'016P', N'R�soudre des probl�mes math�matiques et
statistiques en informatique', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (3, N'016Q', N'Mettre � profit les possibilit�s d''un syst�me
d''exploitation propre � une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (4, N'016R', N'Installer des �l�ments physiques et logiques
dans une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (5, N'016S', N'Exploiter un langage de programmation
structur�e', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (6, N'016T', N'Appliquer une approche de d�veloppement par
objets', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (7, N'016U', N'Effectuer la recherche d�information', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (8, N'026V', N'Interagir et communiquer dans des situations de
travail vari�es', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (9, N'016W', N'Produire des algorithmes', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (10, N'016X', N'Produire une interface utilisateur', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (11, N'016Y', N'Planifier et g�rer des activit�s de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (12, N'016Z', N'Assurer la production et la gestion de
documents', NULL, 1, 1, NULL, 1)
SET IDENTITY_INSERT EnonceCompetence OFF
GO
SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (1, N'Caract�riser les fonctions de travail et leurs conditions d''exercise', 1, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (2, N'Examiner les t�ches et les op�rations li�es aux fonctions de travail', 2, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (3, N'Examiner les habilet�s et les comportements n�cessaire a l''exercice des fonctions de travail.', 3, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (4, N'Examiner la r�glementation relative � l''exercice de la profession en g�n�ral', 4, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (5, N'Effectuer des traitements sur des donn�es
internes de l�ordinateur', 1, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (6, N'Effectuer des op�rations logiques', 2, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (7, N'Organiser et traiter de l�information', 3, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (8, N'R�soudre des probl�mes de
programmation lin�aire', 4, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (9, N'R�soudre des probl�mes de
d�nombrement', 5, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (10, N'R�soudre des probl�mes de probabilit� et
de statistique', 6, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (11, N'Exploiter un syst�me de fichiers', 1, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (12, N'Automatiser des t�ches', 2, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (13, N'Utiliser les m�canismes de gestion de la
m�moire', 3, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (14, N'Personnaliser l''environnement de la station
de travail', 4, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (15, N'Analyser l''architecture interne de
l''ordinateur', 1, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (16, N'Planifier le travail', 2, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (17, N'Prot�ger l''environnement de la station de
travail', 3, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (18, N'Installer des �l�ments physiques', 4, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (19, N'D�sinstaller des �l�ments physiques', 5, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (20, N'Installer des �l�ments logiques', 6, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (21, N'D�sinstaller des �l�ments logiques', 7, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (22, N'V�rifier l''installation de la station de
travail dans l''environnement de
l''utilisatrice et de l''utilisateur', 8, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (23, N'Consigner l''information sur l''installation', 9, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (24, N'Pr�parer l�environnement de
programmation.', 1, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (25, N'Adapter l�algorithme aux contraintes du
langage de programmation.', 2, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (26, N'Traduire l�algorithme dans le langage de
programmation.', 3, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (27, N'Compiler le programme', 4, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (28, N'Valider le programme', 5, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (29, N'Cr�er un mod�le objet', 1, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (30, N'Perfectionner le mod�le objet', 2, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (31, N'Proc�der � la codification d�une classe', 3, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (32, N'Valider le fonctionnement d�une classe', 4, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (33, N'G�n�rer la version ex�cutable du
programme', 5, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (34, N'Pr�ciser le besoin d�information', 1, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (35, N'S�lectionner et utiliser les sources de
recherche', 2, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (36, N'Consulter et extraire l�information
n�cessaire', 3, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (37, N'Consigner les r�sultats de la recherche', 4, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (38, N'�tablir et entretenir des relations
interpersonnelles', 1, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (39, N'Communiquer avec des personnes �
l�interne et � l�externe', 2, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (40, N'Travailler au sein d�une �quipe
multidisciplinaire', 3, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (41, N'Appliquer une approche client', 4, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (42, N'Analyser la situation', 1, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (43, N'Mettre au point l''algorithme', 2, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (44, N'Valider l''algorithme', 3, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (45, N'Analyser les caract�ristiques des
utilisatrices et des utilisateurs', 1, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (46, N'�tablir les caract�ristiques d�interaction', 2, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (47, N'Choisir des p�riph�riques d�entr�e et de
sortie', 3, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (48, N'Planifier l�organisation globale de
l�interface', 4, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (49, N'Proc�der � la programmation de l�interface
utilisateur', 5, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (50, N'Analyser les caract�ristiques du travail �
effectuer', 1, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (51, N'Proc�der � la planification des activit�s', 2, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (52, N'Assurer le suivi des activit�s de travail', 3, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (53, N'Choisir le support du document', 1, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (54, N'Produire un document technique et
administratif', 2, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (55, N'Produire l�aide en ligne', 3, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (56, N'Produire un document de formation', 4, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (57, N'Diffuser un document', 5, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (58, N'Classer un document', 6, NULL, NULL, 12)
SET IDENTITY_INSERT ElementCompetence OFF
GO
SET IDENTITY_INSERT ContexteRealisation ON
GO
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (1, N'a l''aide d''une information r�cente sur les fonctions de travail suivantes : - programeuse-analyste et programeur-analyste dans les domaine de la gestion et de l''indutrie', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (2, N'� l''aide d''une information r�cente sur les entreprses dans lesquelles on trouve la programeuse-analyste et le programmeur-analyste et la et le gestionnaire de r�seaux informatique', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (3, N'� partir de situations propres au domaine de l''informatique', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (4, N'� partir d''une station de travail et d�un logiciel de statistiques', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (5, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (6, N'Dans des environnements utilisant des syst�mes d�exploitation vari�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (7, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (8, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (9, N'� partir des normes et des exigences de l''entreprise', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (10, N'En atelier et sur le lieu de travail de l''utilisatrice et de l''utilisateur', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (11, N'� partir d''une demande pr�autoris�e pr�cisant la nature de l''installation', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (12, N'� partir d''une station de travail', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (13, N'� l''aide des �l�ments physiques et logiques � installer et des outils appropri�s', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (14, N'� partir des normes et des exigences de l''entreprise', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (15, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (16, N'� partir d�une station de travail et des logiciels appropri�s', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (17, N'� partir d�algorithmes valides et repr�sentatifs du milieu de travail', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (18, N'� partir des normes et des exigences de l�entreprise', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (19, N'� l�aide des manuels de r�f�rences techniques appropri�s � l�environnement de programmation', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (20, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (21, N'� partir de situations repr�sentatives du milieu du travail et n�cessitant le d�veloppement d�applications comportant un nombre limit� de classes', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (22, N'� partir des normes et des exigences de l''entreprise', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (23, N'� l�aide de toute la documentation disponible sur les applications � d�velopper', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (24, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (25, N'� partir de besoins d�information pr�cis propres au milieu de travail', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (26, N'� partir de besoins d�information li�s � la veille technologique', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (27, N'� partir d�une station de travail et des logiciels appropri�s', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (28, N'� l�aide de manuels de r�f�rences en fran�ais et en anglais', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (29, N'Dans des situations de travail vari�es', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (30, N'En pr�sence des personnes en cause', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (31, N'� partir de situations vari�es repr�sentatives du milieu de travail', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (32, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (33, N'� partir des exigences de l''entreprise', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (34, N'� l�aide des manuels de r�f�rences techniques appropri�s', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (35, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (36, N'� partir d�applications vari�es n�cessitant la cr�ation d�interfaces', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (37, N'� partir des manuels de r�f�rences techniques appropri�s', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (38, N'� partir des exigences de l''entreprise et des standards de l�informatique', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (39, N'Dans des situations de travail propres � la profession', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (40, N'� l�aide des outils de planification appropri�s', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (41, N'� partir des exigences de l''entreprise', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (42, N'Pour des documents en fran�ais et en anglais', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (43, N'� partir d�une station de travail et des logiciels de bureautique, de multim�dia et de cr�ation d�aide en ligne', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (44, N'� l�aide de dictionnaires, de grammaires et d�outils de r�f�rence vari�s', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (45, N'� l�aide de l�inforoute et des services de t�l�communication', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (46, N'� partir des exigences de l�entreprise', NULL, 12)
SET IDENTITY_INSERT ContexteRealisation OFF
GO
SET IDENTITY_INSERT CriterePerformance ON
GO
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (1, N'Pertinence de l�information recueillie', 1, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (2, N'Examen complet des caract�ristiques g�n�rales des fonctions de travail et de leurs conditions d�exercice', 2, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (3, N'Reconnaissance des possibilit�s d�exercice des professions en entreprise et de pratique entrepreneuriale dans le domaine de l�informatique', 3, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (4, N'Reconnaissance des effets, sur le travail, de l��volution technologique rapide dans le domaine de l�informatique', 4, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (5, N'Examen complet des op�rations, ainsi que des conditions d�ex�cution et des crit�res de performance des t�ches associ�s aux diff�rentes fonctions de travail', 1, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (6, N'D�termination exacte de l�importance relative des activit�s', 2, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (7, N'Mise en relation des �tapes du processus de travail avec les t�ches des fonctions de travail', 3, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (8, N'Pertinence des liens �tablis entre les habilet�s et comportements et les diff�rentes t�ches des fonctions de travail', 1, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (9, N'Examen complet des exigences li�es � l��thique professionnelle', 2, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (10, N'Reconnaissance des droits et des responsabilit�s des personnes dans les relations employeur-employ� et client-fournisseur', 1, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (11, N'Reconnaissance des cons�quences des manquements aux lois et r�glements', 2, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (12, N'Repr�sentation correcte de nombres dans diff�rentes bases', 1, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (13, N'Conversion correcte de nombres d�une base � une autre', 2, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (14, N'Ex�cution correcte des op�rations arithm�tiques dans diff�rentes bases', 3, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (15, N'Repr�sentation juste de donn�es dans la m�moire de l�ordinateur', 4, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (16, N'Interpr�tation juste des limites de repr�sentation des donn�es dans la m�moire de l�ordinateur', 5, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (17, N'Formulation de propositions appropri�es � diff�rentes situations', 1, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (18, N'Construction d�une table de v�rit� conforme � une proposition', 2, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (19, N'Simplification correcte d�une proposition', 3, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (20, N'Utilisation appropri�e de la m�thode de preuve par induction', 4, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (21, N'Construction d�ensembles et de sous-ensembles appropri�s � diff�rentes situations', 1, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (22, N'Ex�cution correcte de toutes les op�rations dans les ensembles', 2, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (23, N'�tablissement de relations justes entre des ensembles', 3, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (24, N'Formulation de propositions appropri�es et dans leur forme la plus simple en vue de traiter l�information dans une situation donn�e', 4, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (25, N'Traduction correcte des propositions en langage ensembliste', 5, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (26, N'Repr�sentation d�une situation sous forme d�un syst�me d��quations lin�aires appropri�', 1, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (27, N'Ex�cution correcte des op�rations dans les matrices', 2, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (28, N'Repr�sentation juste d�un syst�me d��quations lin�aires sous forme matricielle', 3, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (29, N'Application correcte de m�thodes de r�solution de probl�mes d�un syst�me d��quations lin�aires', 4, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (30, N'Calcul exact du nombre de permutations dans un contexte donn�', 1, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (31, N'Calcul exact du nombre d�arrangements dans un contexte donn�', 2, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (32, N'Calcul exact du nombre de combinaisons dans un contexte donn�', 3, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (33, N'Calcul des probabilit�s d��v�nements li�es aux lois binomiale, normale et de Poisson', 1, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (34, N'D�termination de la nature des variables appropri�es � une situation donn�e', 2, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (35, N'Choix d��chelles de mesure appropri�es � une situation donn�e', 3, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (36, N'Choix des mesures statistiques appropri�es � une situation donn�e', 4, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (37, N'Choix judicieux du mode de repr�sentation de l�information', 5, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (38, N'Application rigoureuse des normes de pr�sentation des tableaux et des graphiques', 6, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (39, N'Utilisation efficace des fonctionnalit�s d�un logiciel de statistiques', 7, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (40, N'Choix des m�thodes d��chantillonnage appropri�es � une situation donn�e', 8, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (41, N'Estimation par intervalle d�une moyenne et d�une proportion pour des grands �chantillons', 9, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (42, N'Comparaison des possibilit�s et des limites des syst�mes de fichiers de diff�rents syst�mes d''exploitation', 1, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (43, N'Utilisation correcte des commandes de manipulation des fichiers', 2, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (44, N'Utilisation correcte des commandes de manipulation des r�pertoires', 3, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (45, N'Utilisation correcte des commandes visant � assurer la s�curit� des fichiers et des r�pertoires', 4, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (46, N'Utilisation correcte des outils visant le stockage et l''int�grit� des donn�es', 5, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (47, N'Analyse judicieuse des possibilit�s et des limites des diff�rents syst�mes d''exploitation au regard de l''ex�cution des t�ches', 1, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (48, N'Utilisation correcte du langage de commande propre au syst�me d''exploitation', 2, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (49, N'Utilisation appropri�e des commandes en vue d��tablir l�ordre de priorit� des t�ches', 3, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (50, N'Adaptation appropri�e des param�tres de s�curit� aux exigences des t�ches', 4, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (51, N'Application des techniques de d�bogage appropri�es au syst�me d''exploitation', 5, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (52, N'Consignation des commentaires pertinents', 6, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (53, N'Analyse judicieuse des possibilit�s et des limites des diff�rents syst�mes d''exploitation au regard de la gestion de la m�moire', 1, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (54, N'Allocation de la m�moire appropri�e aux besoins relatifs � l''ex�cution d''une t�che', 2, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (55, N'Comparaison des diff�rents types de fichiers de configuration propres au syst�me d''exploitation', 1, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (56, N'Utilisation correcte des commandes de configuration de base du poste de travail', 2, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (57, N'Utilisation correcte des commandes de d�marrage et de configuration des p�riph�riques', 3, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (58, N'D�marrage des programmes appropri�s aux besoins de l''utilisatrice et de l''utilisateur', 4, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (59, N'Adaptation des param�tres de configuration de l''environnement de travail aux exigences de l''utilisatrice et de l''utilisateur', 5, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (60, N'Consignation pr�cise des param�tres de personnalisation', 6, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (61, N'Distinction et rep�rage des �l�ments de la carte ma�tresse', 1, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (62, N'Reconnaissance des caract�ristiques et des fonctions propres aux processeurs, aux m�moires, aux bus et aux horloges', 2, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (63, N'Reconnaissance des caract�ristiques et des fonctions propres aux diff�rents ports de communication', 3, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (64, N'Reconnaissance des relations entre les diff�rents �l�ments', 4, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (65, N'Analyse judicieuse de la demande', 1, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (66, N'Pr�paration du mat�riel n�cessaire', 2, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (67, N'D�termination juste de la s�quence des op�rations', 3, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (68, N'Consignation compl�te de la configuration physique initiale', 1, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (69, N'Copie de l''ensemble des donn�es', 2, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (70, N'Prise des mesures de s�curit� appropri�es', 3, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (71, N'Interpr�tation correcte des fiches techniques', 1, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (72, N'D�termination appropri�e de chacun des param�tres d''installation', 2, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (73, N'Installation de l''�l�ment � l''endroit appropri�', 3, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (74, N'Configuration conforme � l''environnement du poste', 4, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (75, N'V�rification appropri�e du fonctionnement de l''�l�ment', 5, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (76, N'Interpr�tation judicieuse de l�information technique', 1, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (77, N'Respect du processus de d�sinstallation en fonction de l��l�ment � retirer', 2, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (78, N'Prise des pr�cautions appropri�es', 3, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (79, N'Interpr�tation judicieuse de l''information technique', 1, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (80, N'D�marrage appropri� de l''installation', 2, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (81, N'Choix des param�tres d''installation en fonction de l''environnement du poste', 3, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (82, N'V�rification appropri� du fonctionnement de l''�l�ment', 4, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (83, N'Personnalisation de l''�l�ment appropri�e aux besoins de l�utilisatrice et de l''utilisateur', 5, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (84, N'Copie correcte des disques', 1, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (85, N'Interpr�tation judicieuse de l''information technique', 2, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (86, N'Utilisation appropri�e des outils de d�sinstallation', 3, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (87, N'Respect du processus de d�sinstallation manuelle', 4, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (88, N'V�rification appropri�e du fonctionnement de l''ensemble des �l�ments', 1, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (89, N'R�solution efficace des probl�mes d''installation', 2, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (90, N'Installation de la station de travail conforme aux principes de l''ergonomie', 3, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (91, N'Prise en note de la nouvelle configuration', 1, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (92, N'R�daction claire et correcte des probl�mes �prouv�s et des solutions apport�es', 2, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (93, N'Mise � jour pr�cise de l''inventaire', 3, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (94, N'V�rification m�thodique de l�acc�s aux diff�rents �l�ments physiques et logiques de l�environnement', 1, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (95, N'Configuration de l�environnement appropri�e aux caract�ristiques de la situation', 2, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (96, N'Personnalisation de l�environnement efficace et conforme aux exigences de l�entreprise', 3, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (97, N'Modification appropri�e de la repr�sentation des donn�es', 1, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (98, N'Adaptation correcte des conditions d�ex�cution', 2, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (99, N'Modification appropri�e des structures de traitement', 3, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (100, N'Adaptation appropri�e de la s�quence des op�rations', 4, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (101, N'Utilisation efficace des fonctionnalit�s d��dition de l�environnement', 1, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (102, N'Application des r�gles de syntaxe et de s�mantique propres au langage utilis�', 2, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (103, N'Application rigoureuse des standards de codification', 3, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (104, N'Application judicieuse des principes de la programmation structur�e', 4, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (105, N'Mise � profit judicieuse des possibilit�s du langage', 5, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (106, N'Consignation des commentaires pertinents et conformes aux exigences de l�entreprise', 6, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (107, N'Utilisation efficace des fonctionnalit�s de compilation de l�environnement', 1, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (108, N'Rep�rage des erreurs de compilation', 2, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (109, N'Correction des erreurs de compilation', 3, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (110, N'Utilisation efficace des fonctionnalit�s d�ex�cution et de d�bogage de l�environnement', 1, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (111, N'Pr�paration correcte des jeux d�essai n�cessaires � la v�rification du fonctionnement du programme', 2, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (112, N'Interpr�tation juste des r�sultats', 3, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (113, N'D�bogage appropri� du programme selon l�algorithme', 4, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (114, N'�tablissement complet des domaines d�application', 1, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (115, N'D�termination des classes pertinentes', 2, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (116, N'�tablissement des relations hi�rarchiques appropri�es entre les classes', 3, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (117, N'D�termination des services de chacune des classes', 4, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (118, N'D�termination des attributs pertinents compte tenu de chacune des classes', 5, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (119, N'Repr�sentation graphique appropri�e du mod�le objet', 6, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (120, N'Mise au point de la s�quence des op�rations propres aux diff�rents services de la classe', 1, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (121, N'Repr�sentation graphique appropri�e du mod�le s�quentiel', 2, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (122, N'Modification appropri�e du mod�le objet', 3, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (123, N'Pr�paration appropri�e de l''environnement de programmation', 1, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (124, N'D�claration et d�finition de la classe respectant les r�gles de syntaxe et de s�mantique du langage', 2, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (125, N'Exploitation judicieuse des possibilit�s du langage dans l''application des principes d''encapsulation, d''h�ritage et de polymorphisme', 3, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (126, N'Application rigoureuse des standards de nomenclature et de documentation reconnus propres � l''entreprise', 4, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (127, N'Rep�rage et correction des erreurs de compilation de la classe', 5, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (128, N'Pr�paration correcte des jeux d''essai n�cessaires � la v�rification du bon fonctionnement de tous les services de la classe', 1, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (129, N'Cr�ation d''un environnement de test appropri�', 2, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (130, N'Interpr�tation juste des r�sultats', 3, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (131, N'D�bogage appropri� de la classe', 4, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (132, N'Utilisation des m�canismes de g�n�ration propres � l�outil employ�', 1, NULL, 33)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (133, N'Pr�cision juste du besoin de recherche', 1, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (134, N'D�termination des crit�res permettant de choisir correctement les sources de la recherche', 2, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (135, N'Manifestation d�initiative', 3, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (136, N'S�lection judicieuse des sources en fonction de la nature et des crit�res de la recherche', 1, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (137, N'Utilisation correcte et efficace des m�thodes et des outils de recherche conventionnels et informatiques', 2, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (138, N'Prise en consid�ration des risques de s��loigner du besoin initial', 3, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (139, N'Pertinence de l�information consult�e', 1, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (140, N'Interpr�tation juste de l�information en fran�ais et en anglais', 2, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (141, N'Pertinence de l�information extraite en fonction du besoin initial', 3, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (142, N'Manifestation de curiosit�', 4, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (143, N'Clart�, pr�cision et pertinence de l�information consign�e', 1, NULL, 37)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (144, N'Prise en consid�ration de ses forces et de ses faiblesses en mati�re de relations interpersonnelles', 1, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (145, N'Manifestation d�attitudes favorisant des relations interpersonnelles harmonieuses', 2, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (146, N'Application rigoureuse des r�gles de politesse et de courtoisie', 3, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (147, N'Adaptation de son approche selon les personnes et les situations', 4, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (148, N'Utilisation appropri�e des techniques de gestion des conflits interpersonnels', 5, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (149, N'Manifestation de comportements conformes � l��thique professionnelle', 6, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (150, N'Manifestation d�une attitude d��coute et de r�ceptivit�', 1, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (151, N'Adaptation du niveau de langage selon l�interlocutrice et l�interlocuteur', 2, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (152, N'Application correcte des techniques de communication verbale et non verbale', 3, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (153, N'Utilisation appropri�e des techniques de n�gociation et d�argumentation', 4, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (154, N'Distinction juste du r�le et des responsabilit�s des membres de l��quipe', 1, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (155, N'Prise de ses responsabilit�s au sein de l��quipe', 2, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (156, N'Contribution active aux activit�s de l��quipe', 3, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (157, N'Utilisation appropri�e des techniques de n�gociation et d�argumentation', 4, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (158, N'Manifestation d�attitudes favorisant le travail d��quipe', 5, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (159, N'Respect du mode d�action �tabli par l��quipe', 6, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (160, N'Respect des d�cisions prises par les membres de l��quipe', 7, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (161, N'Contribution efficace � la r�solution des probl�mes �prouv�s par les membres de l��quipe', 8, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (162, N'Interpr�tation juste des besoins', 1, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (163, N'Manifestation d�un souci constant de r�pondre aux besoins des clientes et des clients', 2, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (164, N'V�rification r�guli�re de la satisfaction des clientes et des clients', 3, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (165, N'R�action appropri�e devant les probl�mes soulev�s par les clientes et les clients', 4, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (166, N'Manifestation d�un souci constant d�am�liorer la qualit� des services et des produits', 5, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (167, N'Manifestation de comportements conformes � l��thique professionnelle', 6, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (168, N'�tablissement correcte des donn�es d''entr�e', 1, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (169, N'�tablissement correcte des donn�es de sortie', 2, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (170, N'�tablissement correcte de la nature des traitements', 3, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (171, N'D�termination correcte des conditions d�ex�cution de l''algorithme', 4, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (172, N'Choix d�un mode de repr�sentation de l''algorithme conforme aux exigences de l''entreprise', 1, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (173, N'D�termination d''une s�quence logique des op�rations', 2, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (174, N'D�termination des structures de traitement appropri�es � chacune des op�rations', 3, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (175, N'Application rigoureuse des r�gles de syntaxe propres au mode de repr�sentation retenu', 4, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (176, N'Recherche d''une solution algorithmique efficace', 5, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (177, N'Repr�sentation pr�cise de la solution algorithmique retenue', 6, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (178, N'Pr�sence de toute l''information n�cessaire � l''interpr�tation de l''algorithme', 7, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (179, N'V�rification de la pertinence de la solution compte tenu de la situation initiale', 1, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (180, N'D�termination des erreurs et des lacunes de la solution algorithmique mise au point', 2, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (181, N'Modification appropri�e de la solution algorithmique', 3, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (182, N'Examen des caract�ristiques des utilisatrices et des utilisateurs li�es � l��ge, � la culture et � la scolarisation', 1, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (183, N'D�termination du degr� de familiarit� avec l�informatique en g�n�ral et avec l�application � utiliser', 2, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (184, N'D�termination du degr� de r�ceptivit� des utilisatrices et des utilisateurs par rapport � l�application � utiliser', 3, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (185, N'Pr�cision des attentes des utilisatrices et des utilisateurs', 4, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (186, N'Reconnaissance des caract�ristiques de l�environnement physique', 1, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (187, N'D�termination des modalit�s d�interaction', 2, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (188, N'D�finition des caract�ristiques des t�ches d�interaction', 3, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (189, N'V�rification de la coh�rence entre les modalit�s et les t�ches', 4, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (190, N'Prise en consid�ration des caract�ristiques des utilisatrices et des utilisateurs', 1, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (191, N'Prise en consid�ration des caract�ristiques de l�interaction', 2, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (192, N'Prise en consid�ration des caract�ristiques des exigences d�ergonomie', 3, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (193, N'Prise en consid�ration des contraintes de fiabilit�, de co�t et de maintenance', 4, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (194, N'Interpr�tation correcte des fiches techniques des produits offerts sur le march�', 5, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (195, N'�tablissement des actions et des exceptions li�es aux t�ches', 1, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (196, N'D�termination des �l�ments de pr�sentation des actions et des exceptions', 2, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (197, N'Organisation spatiale appropri�e des �l�ments', 3, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (198, N'D�termination des caract�ristiques de pr�sentation des �l�ments', 4, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (199, N'Organisation de l�interface conforme aux crit�res d�esth�tisme et d�efficacit�', 5, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (200, N'Consignation de l�information relative � l�interface', 6, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (201, N'Cr�ation des �l�ments selon les caract�ristiques de pr�sentation choisies', 1, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (202, N'Positionnement des �l�ments selon l�organisation spatiale retenue', 2, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (203, N'�tablissement des liens entre les �l�ments et les programmes de l�application', 3, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (204, N'Validation du fonctionnement de l�interface', 4, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (205, N'D�termination correcte des principales t�ches et de leur s�quence', 1, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (206, N'Estimation du temps n�cessaire � l�ex�cution des principales t�ches', 2, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (207, N'Prise en consid�ration des �ch�ances �tablies pour l�ex�cution du travail', 3, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (208, N'�tablissement correct de priorit�s', 1, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (209, N'Prise en consid�ration des points critiques', 2, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (210, N'Pr�vision d�une marge de man�uvre suffisante pour faire face aux impr�vus', 3, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (211, N'Utilisation appropri�e des m�thodes et des outils de planification', 4, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (212, N'�tablissement d�un calendrier des travaux r�aliste', 5, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (213, N'D�termination correcte des ressources humaines et mat�rielles n�cessaires � l�ex�cution du travail', 6, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (214, N'Communication efficace avec les personnes en cause', 7, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (215, N'Pr�sentation correcte du plan de travail pour approbation', 8, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (216, N'Utilisation d�une m�thode appropri�e de suivi des activit�s', 1, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (217, N'Gestion efficace du temps', 2, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (218, N'Respect du calendrier des travaux', 3, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (219, N'Adaptation r�guli�re du calendrier des travaux en fonction des impr�vus', 4, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (220, N'D�termination juste du support n�cessaire', 1, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (221, N'S�lection et utilisation correcte du logiciel de cr�ation du document', 2, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (222, N'�tablissement juste du plan de travail pour le document � produire', 1, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (223, N'Pr�paration appropri�e des �l�ments de contenu', 2, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (224, N'Application rigoureuse des r�gles grammaticales et orthographiques', 3, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (225, N'�tablissement correct du format de mise en page', 4, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (226, N'Adaptation correcte du niveau de langage en fonction du public cible', 5, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (227, N'Clart� du texte', 6, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (228, N'Utilisation efficace des logiciels de bureautique et de multim�dia', 7, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (229, N'Respect des normes de mise en page', 8, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (230, N'S�lection des �l�ments qui n�cessitent de l�aide en ligne', 1, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (231, N'Respect des normes de pr�sentation', 2, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (232, N'Application rigoureuse des r�gles grammaticales et orthographiques', 3, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (233, N'Adaptation correcte du niveau de langage en fonction du public cible', 4, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (234, N'Utilisation correcte du logiciel de cr�ation d�aide en ligne', 5, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (235, N'Facilit� d�utilisation de l�aide en ligne', 6, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (236, N'V�rification de la coh�rence de l�aide en ligne', 7, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (237, N'Prise en consid�ration des objectifs d�apprentissage en fonction du public cible et du contexte de formation', 1, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (238, N'Pr�paration appropri�e des �l�ments de contenu', 2, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (239, N'Utilisation correcte des outils de production du document', 3, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (240, N'Respect des normes de pr�sentation', 4, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (241, N'Application rigoureuse des r�gles grammaticales et orthographiques', 5, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (242, N'Adaptation correcte du niveau de langage en fonction du public cible', 6, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (243, N'V�rification minutieuse du document', 7, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (244, N'�tablissement juste de la liste de diffusion', 1, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (245, N'S�lection et utilisation du mode de diffusion', 2, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (246, N'V�rification syst�matique de la r�ception', 3, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (247, N'Respect des r�gles de conservation d�un document', 1, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (248, N'Attribution pr�cise d�un code � partir du plan de classification', 2, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (249, N'Pr�cision et concision du titre d�un document selon les normes', 3, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (250, N'Consignation minutieuse de l�information dans l�outil de rep�rage', 4, NULL, 58)
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
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (221, 'M�canique du b�timent')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (222, 'Am�nagement et urbanisme')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (235, 'G�nie m�canique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (241, 'G�nie m�canique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (243, '�lectronique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (260, 'Environnement, hygi�ne')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (300, 'Sciences humaines')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (322, '�ducation � l''enfance')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (351, '�ducation sp�cialis�e')
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
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (582, 'Int�gration multim�dia')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (589, 'Art et technologie des m�dias')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (700, 'Sciences, lettres et arts')
GO
-- Insertion des programmes
INSERT INTO Programme (annee, codeSpecialisation, nbUnite, nom, specialisation, nbHeurefrmGenerale, nbHeurefrmSpecifique, condition, sanction, commentaire, docMinistere_path, dateValidation, codeProgramme) VALUES
('2001','AA','91 2/3', 'Informatique', 'Informatique de gestion', '660', '1980', 'Math�matique 526/Math�matique 536', 'Dipl�me d��tudes coll�giales', NULL, NULL, NULL, '420'),
('2000','A1',NULL,'Int�gration multim�dia',NULL,NULL,NULL,NULL,'Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'582'),
('2001','A0',NULL,'Soins infirmiers',NULL,NULL,NULL,'Math�matique 536','Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'180'),
('2000','C0',NULL,'G�nie Chimique',NULL,NULL,NULL,'Math�matique 526','Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'210')
GO
--select * from EnteteProgramme
--select * from tblProgramme
SET IDENTITY_INSERT EnonceCompetence ON
GO
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (1, N'016N', N'Analyser les fonctions de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (2, N'016P', N'R�soudre des probl�mes math�matiques et
statistiques en informatique', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (3, N'016Q', N'Mettre � profit les possibilit�s d''un syst�me
d''exploitation propre � une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (4, N'016R', N'Installer des �l�ments physiques et logiques
dans une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (5, N'016S', N'Exploiter un langage de programmation
structur�e', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (6, N'016T', N'Appliquer une approche de d�veloppement par
objets', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (7, N'016U', N'Effectuer la recherche d�information', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (8, N'026V', N'Interagir et communiquer dans des situations de
travail vari�es', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (9, N'016W', N'Produire des algorithmes', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (10, N'016X', N'Produire une interface utilisateur', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (11, N'016Y', N'Planifier et g�rer des activit�s de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (12, N'016Z', N'Assurer la production et la gestion de
documents', NULL, 1, 1, NULL, 1)
SET IDENTITY_INSERT EnonceCompetence OFF
GO
SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (1, N'Caract�riser les fonctions de travail et leurs conditions d''exercise', 1, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (2, N'Examiner les t�ches et les op�rations li�es aux fonctions de travail', 2, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (3, N'Examiner les habilet�s et les comportements n�cessaire a l''exercice des fonctions de travail.', 3, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (4, N'Examiner la r�glementation relative � l''exercice de la profession en g�n�ral', 4, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (5, N'Effectuer des traitements sur des donn�es
internes de l�ordinateur', 1, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (6, N'Effectuer des op�rations logiques', 2, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (7, N'Organiser et traiter de l�information', 3, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (8, N'R�soudre des probl�mes de
programmation lin�aire', 4, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (9, N'R�soudre des probl�mes de
d�nombrement', 5, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (10, N'R�soudre des probl�mes de probabilit� et
de statistique', 6, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (11, N'Exploiter un syst�me de fichiers', 1, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (12, N'Automatiser des t�ches', 2, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (13, N'Utiliser les m�canismes de gestion de la
m�moire', 3, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (14, N'Personnaliser l''environnement de la station
de travail', 4, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (15, N'Analyser l''architecture interne de
l''ordinateur', 1, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (16, N'Planifier le travail', 2, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (17, N'Prot�ger l''environnement de la station de
travail', 3, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (18, N'Installer des �l�ments physiques', 4, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (19, N'D�sinstaller des �l�ments physiques', 5, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (20, N'Installer des �l�ments logiques', 6, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (21, N'D�sinstaller des �l�ments logiques', 7, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (22, N'V�rifier l''installation de la station de
travail dans l''environnement de
l''utilisatrice et de l''utilisateur', 8, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (23, N'Consigner l''information sur l''installation', 9, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (24, N'Pr�parer l�environnement de
programmation.', 1, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (25, N'Adapter l�algorithme aux contraintes du
langage de programmation.', 2, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (26, N'Traduire l�algorithme dans le langage de
programmation.', 3, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (27, N'Compiler le programme', 4, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (28, N'Valider le programme', 5, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (29, N'Cr�er un mod�le objet', 1, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (30, N'Perfectionner le mod�le objet', 2, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (31, N'Proc�der � la codification d�une classe', 3, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (32, N'Valider le fonctionnement d�une classe', 4, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (33, N'G�n�rer la version ex�cutable du
programme', 5, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (34, N'Pr�ciser le besoin d�information', 1, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (35, N'S�lectionner et utiliser les sources de
recherche', 2, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (36, N'Consulter et extraire l�information
n�cessaire', 3, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (37, N'Consigner les r�sultats de la recherche', 4, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (38, N'�tablir et entretenir des relations
interpersonnelles', 1, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (39, N'Communiquer avec des personnes �
l�interne et � l�externe', 2, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (40, N'Travailler au sein d�une �quipe
multidisciplinaire', 3, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (41, N'Appliquer une approche client', 4, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (42, N'Analyser la situation', 1, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (43, N'Mettre au point l''algorithme', 2, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (44, N'Valider l''algorithme', 3, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (45, N'Analyser les caract�ristiques des
utilisatrices et des utilisateurs', 1, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (46, N'�tablir les caract�ristiques d�interaction', 2, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (47, N'Choisir des p�riph�riques d�entr�e et de
sortie', 3, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (48, N'Planifier l�organisation globale de
l�interface', 4, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (49, N'Proc�der � la programmation de l�interface
utilisateur', 5, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (50, N'Analyser les caract�ristiques du travail �
effectuer', 1, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (51, N'Proc�der � la planification des activit�s', 2, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (52, N'Assurer le suivi des activit�s de travail', 3, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (53, N'Choisir le support du document', 1, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (54, N'Produire un document technique et
administratif', 2, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (55, N'Produire l�aide en ligne', 3, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (56, N'Produire un document de formation', 4, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (57, N'Diffuser un document', 5, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (58, N'Classer un document', 6, NULL, NULL, 12)
SET IDENTITY_INSERT ElementCompetence OFF
GO
SET IDENTITY_INSERT ContexteRealisation ON
GO
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (1, N'a l''aide d''une information r�cente sur les fonctions de travail suivantes : - programeuse-analyste et programeur-analyste dans les domaine de la gestion et de l''indutrie', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (2, N'� l''aide d''une information r�cente sur les entreprses dans lesquelles on trouve la programeuse-analyste et le programmeur-analyste et la et le gestionnaire de r�seaux informatique', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (3, N'� partir de situations propres au domaine de l''informatique', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (4, N'� partir d''une station de travail et d�un logiciel de statistiques', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (5, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (6, N'Dans des environnements utilisant des syst�mes d�exploitation vari�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (7, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (8, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (9, N'� partir des normes et des exigences de l''entreprise', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (10, N'En atelier et sur le lieu de travail de l''utilisatrice et de l''utilisateur', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (11, N'� partir d''une demande pr�autoris�e pr�cisant la nature de l''installation', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (12, N'� partir d''une station de travail', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (13, N'� l''aide des �l�ments physiques et logiques � installer et des outils appropri�s', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (14, N'� partir des normes et des exigences de l''entreprise', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (15, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (16, N'� partir d�une station de travail et des logiciels appropri�s', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (17, N'� partir d�algorithmes valides et repr�sentatifs du milieu de travail', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (18, N'� partir des normes et des exigences de l�entreprise', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (19, N'� l�aide des manuels de r�f�rences techniques appropri�s � l�environnement de programmation', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (20, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (21, N'� partir de situations repr�sentatives du milieu du travail et n�cessitant le d�veloppement d�applications comportant un nombre limit� de classes', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (22, N'� partir des normes et des exigences de l''entreprise', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (23, N'� l�aide de toute la documentation disponible sur les applications � d�velopper', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (24, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (25, N'� partir de besoins d�information pr�cis propres au milieu de travail', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (26, N'� partir de besoins d�information li�s � la veille technologique', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (27, N'� partir d�une station de travail et des logiciels appropri�s', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (28, N'� l�aide de manuels de r�f�rences en fran�ais et en anglais', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (29, N'Dans des situations de travail vari�es', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (30, N'En pr�sence des personnes en cause', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (31, N'� partir de situations vari�es repr�sentatives du milieu de travail', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (32, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (33, N'� partir des exigences de l''entreprise', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (34, N'� l�aide des manuels de r�f�rences techniques appropri�s', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (35, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (36, N'� partir d�applications vari�es n�cessitant la cr�ation d�interfaces', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (37, N'� partir des manuels de r�f�rences techniques appropri�s', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (38, N'� partir des exigences de l''entreprise et des standards de l�informatique', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (39, N'Dans des situations de travail propres � la profession', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (40, N'� l�aide des outils de planification appropri�s', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (41, N'� partir des exigences de l''entreprise', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (42, N'Pour des documents en fran�ais et en anglais', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (43, N'� partir d�une station de travail et des logiciels de bureautique, de multim�dia et de cr�ation d�aide en ligne', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (44, N'� l�aide de dictionnaires, de grammaires et d�outils de r�f�rence vari�s', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (45, N'� l�aide de l�inforoute et des services de t�l�communication', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (46, N'� partir des exigences de l�entreprise', NULL, 12)
SET IDENTITY_INSERT ContexteRealisation OFF
GO
SET IDENTITY_INSERT CriterePerformance ON
GO
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (1, N'Pertinence de l�information recueillie', 1, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (2, N'Examen complet des caract�ristiques g�n�rales des fonctions de travail et de leurs conditions d�exercice', 2, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (3, N'Reconnaissance des possibilit�s d�exercice des professions en entreprise et de pratique entrepreneuriale dans le domaine de l�informatique', 3, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (4, N'Reconnaissance des effets, sur le travail, de l��volution technologique rapide dans le domaine de l�informatique', 4, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (5, N'Examen complet des op�rations, ainsi que des conditions d�ex�cution et des crit�res de performance des t�ches associ�s aux diff�rentes fonctions de travail', 1, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (6, N'D�termination exacte de l�importance relative des activit�s', 2, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (7, N'Mise en relation des �tapes du processus de travail avec les t�ches des fonctions de travail', 3, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (8, N'Pertinence des liens �tablis entre les habilet�s et comportements et les diff�rentes t�ches des fonctions de travail', 1, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (9, N'Examen complet des exigences li�es � l��thique professionnelle', 2, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (10, N'Reconnaissance des droits et des responsabilit�s des personnes dans les relations employeur-employ� et client-fournisseur', 1, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (11, N'Reconnaissance des cons�quences des manquements aux lois et r�glements', 2, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (12, N'Repr�sentation correcte de nombres dans diff�rentes bases', 1, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (13, N'Conversion correcte de nombres d�une base � une autre', 2, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (14, N'Ex�cution correcte des op�rations arithm�tiques dans diff�rentes bases', 3, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (15, N'Repr�sentation juste de donn�es dans la m�moire de l�ordinateur', 4, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (16, N'Interpr�tation juste des limites de repr�sentation des donn�es dans la m�moire de l�ordinateur', 5, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (17, N'Formulation de propositions appropri�es � diff�rentes situations', 1, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (18, N'Construction d�une table de v�rit� conforme � une proposition', 2, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (19, N'Simplification correcte d�une proposition', 3, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (20, N'Utilisation appropri�e de la m�thode de preuve par induction', 4, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (21, N'Construction d�ensembles et de sous-ensembles appropri�s � diff�rentes situations', 1, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (22, N'Ex�cution correcte de toutes les op�rations dans les ensembles', 2, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (23, N'�tablissement de relations justes entre des ensembles', 3, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (24, N'Formulation de propositions appropri�es et dans leur forme la plus simple en vue de traiter l�information dans une situation donn�e', 4, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (25, N'Traduction correcte des propositions en langage ensembliste', 5, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (26, N'Repr�sentation d�une situation sous forme d�un syst�me d��quations lin�aires appropri�', 1, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (27, N'Ex�cution correcte des op�rations dans les matrices', 2, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (28, N'Repr�sentation juste d�un syst�me d��quations lin�aires sous forme matricielle', 3, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (29, N'Application correcte de m�thodes de r�solution de probl�mes d�un syst�me d��quations lin�aires', 4, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (30, N'Calcul exact du nombre de permutations dans un contexte donn�', 1, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (31, N'Calcul exact du nombre d�arrangements dans un contexte donn�', 2, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (32, N'Calcul exact du nombre de combinaisons dans un contexte donn�', 3, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (33, N'Calcul des probabilit�s d��v�nements li�es aux lois binomiale, normale et de Poisson', 1, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (34, N'D�termination de la nature des variables appropri�es � une situation donn�e', 2, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (35, N'Choix d��chelles de mesure appropri�es � une situation donn�e', 3, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (36, N'Choix des mesures statistiques appropri�es � une situation donn�e', 4, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (37, N'Choix judicieux du mode de repr�sentation de l�information', 5, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (38, N'Application rigoureuse des normes de pr�sentation des tableaux et des graphiques', 6, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (39, N'Utilisation efficace des fonctionnalit�s d�un logiciel de statistiques', 7, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (40, N'Choix des m�thodes d��chantillonnage appropri�es � une situation donn�e', 8, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (41, N'Estimation par intervalle d�une moyenne et d�une proportion pour des grands �chantillons', 9, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (42, N'Comparaison des possibilit�s et des limites des syst�mes de fichiers de diff�rents syst�mes d''exploitation', 1, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (43, N'Utilisation correcte des commandes de manipulation des fichiers', 2, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (44, N'Utilisation correcte des commandes de manipulation des r�pertoires', 3, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (45, N'Utilisation correcte des commandes visant � assurer la s�curit� des fichiers et des r�pertoires', 4, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (46, N'Utilisation correcte des outils visant le stockage et l''int�grit� des donn�es', 5, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (47, N'Analyse judicieuse des possibilit�s et des limites des diff�rents syst�mes d''exploitation au regard de l''ex�cution des t�ches', 1, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (48, N'Utilisation correcte du langage de commande propre au syst�me d''exploitation', 2, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (49, N'Utilisation appropri�e des commandes en vue d��tablir l�ordre de priorit� des t�ches', 3, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (50, N'Adaptation appropri�e des param�tres de s�curit� aux exigences des t�ches', 4, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (51, N'Application des techniques de d�bogage appropri�es au syst�me d''exploitation', 5, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (52, N'Consignation des commentaires pertinents', 6, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (53, N'Analyse judicieuse des possibilit�s et des limites des diff�rents syst�mes d''exploitation au regard de la gestion de la m�moire', 1, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (54, N'Allocation de la m�moire appropri�e aux besoins relatifs � l''ex�cution d''une t�che', 2, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (55, N'Comparaison des diff�rents types de fichiers de configuration propres au syst�me d''exploitation', 1, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (56, N'Utilisation correcte des commandes de configuration de base du poste de travail', 2, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (57, N'Utilisation correcte des commandes de d�marrage et de configuration des p�riph�riques', 3, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (58, N'D�marrage des programmes appropri�s aux besoins de l''utilisatrice et de l''utilisateur', 4, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (59, N'Adaptation des param�tres de configuration de l''environnement de travail aux exigences de l''utilisatrice et de l''utilisateur', 5, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (60, N'Consignation pr�cise des param�tres de personnalisation', 6, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (61, N'Distinction et rep�rage des �l�ments de la carte ma�tresse', 1, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (62, N'Reconnaissance des caract�ristiques et des fonctions propres aux processeurs, aux m�moires, aux bus et aux horloges', 2, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (63, N'Reconnaissance des caract�ristiques et des fonctions propres aux diff�rents ports de communication', 3, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (64, N'Reconnaissance des relations entre les diff�rents �l�ments', 4, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (65, N'Analyse judicieuse de la demande', 1, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (66, N'Pr�paration du mat�riel n�cessaire', 2, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (67, N'D�termination juste de la s�quence des op�rations', 3, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (68, N'Consignation compl�te de la configuration physique initiale', 1, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (69, N'Copie de l''ensemble des donn�es', 2, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (70, N'Prise des mesures de s�curit� appropri�es', 3, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (71, N'Interpr�tation correcte des fiches techniques', 1, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (72, N'D�termination appropri�e de chacun des param�tres d''installation', 2, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (73, N'Installation de l''�l�ment � l''endroit appropri�', 3, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (74, N'Configuration conforme � l''environnement du poste', 4, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (75, N'V�rification appropri�e du fonctionnement de l''�l�ment', 5, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (76, N'Interpr�tation judicieuse de l�information technique', 1, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (77, N'Respect du processus de d�sinstallation en fonction de l��l�ment � retirer', 2, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (78, N'Prise des pr�cautions appropri�es', 3, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (79, N'Interpr�tation judicieuse de l''information technique', 1, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (80, N'D�marrage appropri� de l''installation', 2, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (81, N'Choix des param�tres d''installation en fonction de l''environnement du poste', 3, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (82, N'V�rification appropri� du fonctionnement de l''�l�ment', 4, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (83, N'Personnalisation de l''�l�ment appropri�e aux besoins de l�utilisatrice et de l''utilisateur', 5, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (84, N'Copie correcte des disques', 1, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (85, N'Interpr�tation judicieuse de l''information technique', 2, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (86, N'Utilisation appropri�e des outils de d�sinstallation', 3, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (87, N'Respect du processus de d�sinstallation manuelle', 4, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (88, N'V�rification appropri�e du fonctionnement de l''ensemble des �l�ments', 1, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (89, N'R�solution efficace des probl�mes d''installation', 2, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (90, N'Installation de la station de travail conforme aux principes de l''ergonomie', 3, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (91, N'Prise en note de la nouvelle configuration', 1, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (92, N'R�daction claire et correcte des probl�mes �prouv�s et des solutions apport�es', 2, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (93, N'Mise � jour pr�cise de l''inventaire', 3, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (94, N'V�rification m�thodique de l�acc�s aux diff�rents �l�ments physiques et logiques de l�environnement', 1, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (95, N'Configuration de l�environnement appropri�e aux caract�ristiques de la situation', 2, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (96, N'Personnalisation de l�environnement efficace et conforme aux exigences de l�entreprise', 3, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (97, N'Modification appropri�e de la repr�sentation des donn�es', 1, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (98, N'Adaptation correcte des conditions d�ex�cution', 2, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (99, N'Modification appropri�e des structures de traitement', 3, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (100, N'Adaptation appropri�e de la s�quence des op�rations', 4, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (101, N'Utilisation efficace des fonctionnalit�s d��dition de l�environnement', 1, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (102, N'Application des r�gles de syntaxe et de s�mantique propres au langage utilis�', 2, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (103, N'Application rigoureuse des standards de codification', 3, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (104, N'Application judicieuse des principes de la programmation structur�e', 4, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (105, N'Mise � profit judicieuse des possibilit�s du langage', 5, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (106, N'Consignation des commentaires pertinents et conformes aux exigences de l�entreprise', 6, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (107, N'Utilisation efficace des fonctionnalit�s de compilation de l�environnement', 1, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (108, N'Rep�rage des erreurs de compilation', 2, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (109, N'Correction des erreurs de compilation', 3, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (110, N'Utilisation efficace des fonctionnalit�s d�ex�cution et de d�bogage de l�environnement', 1, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (111, N'Pr�paration correcte des jeux d�essai n�cessaires � la v�rification du fonctionnement du programme', 2, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (112, N'Interpr�tation juste des r�sultats', 3, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (113, N'D�bogage appropri� du programme selon l�algorithme', 4, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (114, N'�tablissement complet des domaines d�application', 1, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (115, N'D�termination des classes pertinentes', 2, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (116, N'�tablissement des relations hi�rarchiques appropri�es entre les classes', 3, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (117, N'D�termination des services de chacune des classes', 4, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (118, N'D�termination des attributs pertinents compte tenu de chacune des classes', 5, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (119, N'Repr�sentation graphique appropri�e du mod�le objet', 6, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (120, N'Mise au point de la s�quence des op�rations propres aux diff�rents services de la classe', 1, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (121, N'Repr�sentation graphique appropri�e du mod�le s�quentiel', 2, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (122, N'Modification appropri�e du mod�le objet', 3, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (123, N'Pr�paration appropri�e de l''environnement de programmation', 1, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (124, N'D�claration et d�finition de la classe respectant les r�gles de syntaxe et de s�mantique du langage', 2, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (125, N'Exploitation judicieuse des possibilit�s du langage dans l''application des principes d''encapsulation, d''h�ritage et de polymorphisme', 3, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (126, N'Application rigoureuse des standards de nomenclature et de documentation reconnus propres � l''entreprise', 4, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (127, N'Rep�rage et correction des erreurs de compilation de la classe', 5, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (128, N'Pr�paration correcte des jeux d''essai n�cessaires � la v�rification du bon fonctionnement de tous les services de la classe', 1, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (129, N'Cr�ation d''un environnement de test appropri�', 2, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (130, N'Interpr�tation juste des r�sultats', 3, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (131, N'D�bogage appropri� de la classe', 4, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (132, N'Utilisation des m�canismes de g�n�ration propres � l�outil employ�', 1, NULL, 33)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (133, N'Pr�cision juste du besoin de recherche', 1, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (134, N'D�termination des crit�res permettant de choisir correctement les sources de la recherche', 2, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (135, N'Manifestation d�initiative', 3, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (136, N'S�lection judicieuse des sources en fonction de la nature et des crit�res de la recherche', 1, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (137, N'Utilisation correcte et efficace des m�thodes et des outils de recherche conventionnels et informatiques', 2, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (138, N'Prise en consid�ration des risques de s��loigner du besoin initial', 3, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (139, N'Pertinence de l�information consult�e', 1, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (140, N'Interpr�tation juste de l�information en fran�ais et en anglais', 2, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (141, N'Pertinence de l�information extraite en fonction du besoin initial', 3, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (142, N'Manifestation de curiosit�', 4, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (143, N'Clart�, pr�cision et pertinence de l�information consign�e', 1, NULL, 37)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (144, N'Prise en consid�ration de ses forces et de ses faiblesses en mati�re de relations interpersonnelles', 1, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (145, N'Manifestation d�attitudes favorisant des relations interpersonnelles harmonieuses', 2, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (146, N'Application rigoureuse des r�gles de politesse et de courtoisie', 3, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (147, N'Adaptation de son approche selon les personnes et les situations', 4, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (148, N'Utilisation appropri�e des techniques de gestion des conflits interpersonnels', 5, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (149, N'Manifestation de comportements conformes � l��thique professionnelle', 6, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (150, N'Manifestation d�une attitude d��coute et de r�ceptivit�', 1, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (151, N'Adaptation du niveau de langage selon l�interlocutrice et l�interlocuteur', 2, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (152, N'Application correcte des techniques de communication verbale et non verbale', 3, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (153, N'Utilisation appropri�e des techniques de n�gociation et d�argumentation', 4, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (154, N'Distinction juste du r�le et des responsabilit�s des membres de l��quipe', 1, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (155, N'Prise de ses responsabilit�s au sein de l��quipe', 2, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (156, N'Contribution active aux activit�s de l��quipe', 3, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (157, N'Utilisation appropri�e des techniques de n�gociation et d�argumentation', 4, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (158, N'Manifestation d�attitudes favorisant le travail d��quipe', 5, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (159, N'Respect du mode d�action �tabli par l��quipe', 6, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (160, N'Respect des d�cisions prises par les membres de l��quipe', 7, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (161, N'Contribution efficace � la r�solution des probl�mes �prouv�s par les membres de l��quipe', 8, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (162, N'Interpr�tation juste des besoins', 1, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (163, N'Manifestation d�un souci constant de r�pondre aux besoins des clientes et des clients', 2, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (164, N'V�rification r�guli�re de la satisfaction des clientes et des clients', 3, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (165, N'R�action appropri�e devant les probl�mes soulev�s par les clientes et les clients', 4, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (166, N'Manifestation d�un souci constant d�am�liorer la qualit� des services et des produits', 5, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (167, N'Manifestation de comportements conformes � l��thique professionnelle', 6, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (168, N'�tablissement correcte des donn�es d''entr�e', 1, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (169, N'�tablissement correcte des donn�es de sortie', 2, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (170, N'�tablissement correcte de la nature des traitements', 3, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (171, N'D�termination correcte des conditions d�ex�cution de l''algorithme', 4, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (172, N'Choix d�un mode de repr�sentation de l''algorithme conforme aux exigences de l''entreprise', 1, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (173, N'D�termination d''une s�quence logique des op�rations', 2, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (174, N'D�termination des structures de traitement appropri�es � chacune des op�rations', 3, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (175, N'Application rigoureuse des r�gles de syntaxe propres au mode de repr�sentation retenu', 4, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (176, N'Recherche d''une solution algorithmique efficace', 5, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (177, N'Repr�sentation pr�cise de la solution algorithmique retenue', 6, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (178, N'Pr�sence de toute l''information n�cessaire � l''interpr�tation de l''algorithme', 7, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (179, N'V�rification de la pertinence de la solution compte tenu de la situation initiale', 1, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (180, N'D�termination des erreurs et des lacunes de la solution algorithmique mise au point', 2, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (181, N'Modification appropri�e de la solution algorithmique', 3, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (182, N'Examen des caract�ristiques des utilisatrices et des utilisateurs li�es � l��ge, � la culture et � la scolarisation', 1, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (183, N'D�termination du degr� de familiarit� avec l�informatique en g�n�ral et avec l�application � utiliser', 2, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (184, N'D�termination du degr� de r�ceptivit� des utilisatrices et des utilisateurs par rapport � l�application � utiliser', 3, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (185, N'Pr�cision des attentes des utilisatrices et des utilisateurs', 4, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (186, N'Reconnaissance des caract�ristiques de l�environnement physique', 1, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (187, N'D�termination des modalit�s d�interaction', 2, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (188, N'D�finition des caract�ristiques des t�ches d�interaction', 3, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (189, N'V�rification de la coh�rence entre les modalit�s et les t�ches', 4, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (190, N'Prise en consid�ration des caract�ristiques des utilisatrices et des utilisateurs', 1, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (191, N'Prise en consid�ration des caract�ristiques de l�interaction', 2, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (192, N'Prise en consid�ration des caract�ristiques des exigences d�ergonomie', 3, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (193, N'Prise en consid�ration des contraintes de fiabilit�, de co�t et de maintenance', 4, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (194, N'Interpr�tation correcte des fiches techniques des produits offerts sur le march�', 5, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (195, N'�tablissement des actions et des exceptions li�es aux t�ches', 1, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (196, N'D�termination des �l�ments de pr�sentation des actions et des exceptions', 2, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (197, N'Organisation spatiale appropri�e des �l�ments', 3, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (198, N'D�termination des caract�ristiques de pr�sentation des �l�ments', 4, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (199, N'Organisation de l�interface conforme aux crit�res d�esth�tisme et d�efficacit�', 5, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (200, N'Consignation de l�information relative � l�interface', 6, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (201, N'Cr�ation des �l�ments selon les caract�ristiques de pr�sentation choisies', 1, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (202, N'Positionnement des �l�ments selon l�organisation spatiale retenue', 2, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (203, N'�tablissement des liens entre les �l�ments et les programmes de l�application', 3, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (204, N'Validation du fonctionnement de l�interface', 4, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (205, N'D�termination correcte des principales t�ches et de leur s�quence', 1, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (206, N'Estimation du temps n�cessaire � l�ex�cution des principales t�ches', 2, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (207, N'Prise en consid�ration des �ch�ances �tablies pour l�ex�cution du travail', 3, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (208, N'�tablissement correct de priorit�s', 1, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (209, N'Prise en consid�ration des points critiques', 2, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (210, N'Pr�vision d�une marge de man�uvre suffisante pour faire face aux impr�vus', 3, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (211, N'Utilisation appropri�e des m�thodes et des outils de planification', 4, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (212, N'�tablissement d�un calendrier des travaux r�aliste', 5, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (213, N'D�termination correcte des ressources humaines et mat�rielles n�cessaires � l�ex�cution du travail', 6, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (214, N'Communication efficace avec les personnes en cause', 7, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (215, N'Pr�sentation correcte du plan de travail pour approbation', 8, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (216, N'Utilisation d�une m�thode appropri�e de suivi des activit�s', 1, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (217, N'Gestion efficace du temps', 2, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (218, N'Respect du calendrier des travaux', 3, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (219, N'Adaptation r�guli�re du calendrier des travaux en fonction des impr�vus', 4, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (220, N'D�termination juste du support n�cessaire', 1, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (221, N'S�lection et utilisation correcte du logiciel de cr�ation du document', 2, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (222, N'�tablissement juste du plan de travail pour le document � produire', 1, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (223, N'Pr�paration appropri�e des �l�ments de contenu', 2, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (224, N'Application rigoureuse des r�gles grammaticales et orthographiques', 3, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (225, N'�tablissement correct du format de mise en page', 4, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (226, N'Adaptation correcte du niveau de langage en fonction du public cible', 5, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (227, N'Clart� du texte', 6, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (228, N'Utilisation efficace des logiciels de bureautique et de multim�dia', 7, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (229, N'Respect des normes de mise en page', 8, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (230, N'S�lection des �l�ments qui n�cessitent de l�aide en ligne', 1, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (231, N'Respect des normes de pr�sentation', 2, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (232, N'Application rigoureuse des r�gles grammaticales et orthographiques', 3, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (233, N'Adaptation correcte du niveau de langage en fonction du public cible', 4, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (234, N'Utilisation correcte du logiciel de cr�ation d�aide en ligne', 5, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (235, N'Facilit� d�utilisation de l�aide en ligne', 6, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (236, N'V�rification de la coh�rence de l�aide en ligne', 7, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (237, N'Prise en consid�ration des objectifs d�apprentissage en fonction du public cible et du contexte de formation', 1, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (238, N'Pr�paration appropri�e des �l�ments de contenu', 2, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (239, N'Utilisation correcte des outils de production du document', 3, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (240, N'Respect des normes de pr�sentation', 4, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (241, N'Application rigoureuse des r�gles grammaticales et orthographiques', 5, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (242, N'Adaptation correcte du niveau de langage en fonction du public cible', 6, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (243, N'V�rification minutieuse du document', 7, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (244, N'�tablissement juste de la liste de diffusion', 1, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (245, N'S�lection et utilisation du mode de diffusion', 2, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (246, N'V�rification syst�matique de la r�ception', 3, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (247, N'Respect des r�gles de conservation d�un document', 1, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (248, N'Attribution pr�cise d�un code � partir du plan de classification', 2, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (249, N'Pr�cision et concision du titre d�un document selon les normes', 3, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (250, N'Consignation minutieuse de l�information dans l�outil de rep�rage', 4, NULL, 58)
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
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (221, 'M�canique du b�timent')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (222, 'Am�nagement et urbanisme')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (235, 'G�nie m�canique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (241, 'G�nie m�canique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (243, '�lectronique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (260, 'Environnement, hygi�ne')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (300, 'Sciences humaines')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (322, '�ducation � l''enfance')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (351, '�ducation sp�cialis�e')
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
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (582, 'Int�gration multim�dia')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (589, 'Art et technologie des m�dias')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (700, 'Sciences, lettres et arts')
GO
-- Insertion des programmes
INSERT INTO Programme (annee, codeSpecialisation, nbUnite, nom, specialisation, nbHeurefrmGenerale, nbHeurefrmSpecifique, condition, sanction, commentaire, docMinistere_path, dateValidation, codeProgramme) VALUES
('2001','AA','91 2/3', 'Informatique', 'Informatique de gestion', '660', '1980', 'Math�matique 526/Math�matique 536', 'Dipl�me d��tudes coll�giales', NULL, NULL, NULL, '420'),
('2000','A1',NULL,'Int�gration multim�dia',NULL,NULL,NULL,NULL,'Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'582'),
('2001','A0',NULL,'Soins infirmiers',NULL,NULL,NULL,'Math�matique 536','Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'180'),
('2000','C0',NULL,'G�nie Chimique',NULL,NULL,NULL,'Math�matique 526','Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'210')
GO
--select * from EnteteProgramme
--select * from tblProgramme
SET IDENTITY_INSERT EnonceCompetence ON
GO
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (1, N'016N', N'Analyser les fonctions de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (2, N'016P', N'R�soudre des probl�mes math�matiques et
statistiques en informatique', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (3, N'016Q', N'Mettre � profit les possibilit�s d''un syst�me
d''exploitation propre � une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (4, N'016R', N'Installer des �l�ments physiques et logiques
dans une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (5, N'016S', N'Exploiter un langage de programmation
structur�e', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (6, N'016T', N'Appliquer une approche de d�veloppement par
objets', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (7, N'016U', N'Effectuer la recherche d�information', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (8, N'026V', N'Interagir et communiquer dans des situations de
travail vari�es', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (9, N'016W', N'Produire des algorithmes', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (10, N'016X', N'Produire une interface utilisateur', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (11, N'016Y', N'Planifier et g�rer des activit�s de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (12, N'016Z', N'Assurer la production et la gestion de
documents', NULL, 1, 1, NULL, 1)
SET IDENTITY_INSERT EnonceCompetence OFF
GO
SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (1, N'Caract�riser les fonctions de travail et leurs conditions d''exercise', 1, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (2, N'Examiner les t�ches et les op�rations li�es aux fonctions de travail', 2, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (3, N'Examiner les habilet�s et les comportements n�cessaire a l''exercice des fonctions de travail.', 3, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (4, N'Examiner la r�glementation relative � l''exercice de la profession en g�n�ral', 4, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (5, N'Effectuer des traitements sur des donn�es
internes de l�ordinateur', 1, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (6, N'Effectuer des op�rations logiques', 2, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (7, N'Organiser et traiter de l�information', 3, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (8, N'R�soudre des probl�mes de
programmation lin�aire', 4, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (9, N'R�soudre des probl�mes de
d�nombrement', 5, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (10, N'R�soudre des probl�mes de probabilit� et
de statistique', 6, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (11, N'Exploiter un syst�me de fichiers', 1, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (12, N'Automatiser des t�ches', 2, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (13, N'Utiliser les m�canismes de gestion de la
m�moire', 3, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (14, N'Personnaliser l''environnement de la station
de travail', 4, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (15, N'Analyser l''architecture interne de
l''ordinateur', 1, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (16, N'Planifier le travail', 2, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (17, N'Prot�ger l''environnement de la station de
travail', 3, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (18, N'Installer des �l�ments physiques', 4, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (19, N'D�sinstaller des �l�ments physiques', 5, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (20, N'Installer des �l�ments logiques', 6, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (21, N'D�sinstaller des �l�ments logiques', 7, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (22, N'V�rifier l''installation de la station de
travail dans l''environnement de
l''utilisatrice et de l''utilisateur', 8, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (23, N'Consigner l''information sur l''installation', 9, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (24, N'Pr�parer l�environnement de
programmation.', 1, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (25, N'Adapter l�algorithme aux contraintes du
langage de programmation.', 2, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (26, N'Traduire l�algorithme dans le langage de
programmation.', 3, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (27, N'Compiler le programme', 4, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (28, N'Valider le programme', 5, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (29, N'Cr�er un mod�le objet', 1, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (30, N'Perfectionner le mod�le objet', 2, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (31, N'Proc�der � la codification d�une classe', 3, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (32, N'Valider le fonctionnement d�une classe', 4, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (33, N'G�n�rer la version ex�cutable du
programme', 5, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (34, N'Pr�ciser le besoin d�information', 1, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (35, N'S�lectionner et utiliser les sources de
recherche', 2, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (36, N'Consulter et extraire l�information
n�cessaire', 3, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (37, N'Consigner les r�sultats de la recherche', 4, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (38, N'�tablir et entretenir des relations
interpersonnelles', 1, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (39, N'Communiquer avec des personnes �
l�interne et � l�externe', 2, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (40, N'Travailler au sein d�une �quipe
multidisciplinaire', 3, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (41, N'Appliquer une approche client', 4, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (42, N'Analyser la situation', 1, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (43, N'Mettre au point l''algorithme', 2, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (44, N'Valider l''algorithme', 3, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (45, N'Analyser les caract�ristiques des
utilisatrices et des utilisateurs', 1, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (46, N'�tablir les caract�ristiques d�interaction', 2, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (47, N'Choisir des p�riph�riques d�entr�e et de
sortie', 3, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (48, N'Planifier l�organisation globale de
l�interface', 4, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (49, N'Proc�der � la programmation de l�interface
utilisateur', 5, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (50, N'Analyser les caract�ristiques du travail �
effectuer', 1, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (51, N'Proc�der � la planification des activit�s', 2, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (52, N'Assurer le suivi des activit�s de travail', 3, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (53, N'Choisir le support du document', 1, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (54, N'Produire un document technique et
administratif', 2, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (55, N'Produire l�aide en ligne', 3, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (56, N'Produire un document de formation', 4, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (57, N'Diffuser un document', 5, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (58, N'Classer un document', 6, NULL, NULL, 12)
SET IDENTITY_INSERT ElementCompetence OFF
GO
SET IDENTITY_INSERT ContexteRealisation ON
GO
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (1, N'a l''aide d''une information r�cente sur les fonctions de travail suivantes : - programeuse-analyste et programeur-analyste dans les domaine de la gestion et de l''indutrie', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (2, N'� l''aide d''une information r�cente sur les entreprses dans lesquelles on trouve la programeuse-analyste et le programmeur-analyste et la et le gestionnaire de r�seaux informatique', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (3, N'� partir de situations propres au domaine de l''informatique', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (4, N'� partir d''une station de travail et d�un logiciel de statistiques', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (5, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (6, N'Dans des environnements utilisant des syst�mes d�exploitation vari�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (7, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (8, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (9, N'� partir des normes et des exigences de l''entreprise', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (10, N'En atelier et sur le lieu de travail de l''utilisatrice et de l''utilisateur', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (11, N'� partir d''une demande pr�autoris�e pr�cisant la nature de l''installation', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (12, N'� partir d''une station de travail', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (13, N'� l''aide des �l�ments physiques et logiques � installer et des outils appropri�s', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (14, N'� partir des normes et des exigences de l''entreprise', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (15, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (16, N'� partir d�une station de travail et des logiciels appropri�s', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (17, N'� partir d�algorithmes valides et repr�sentatifs du milieu de travail', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (18, N'� partir des normes et des exigences de l�entreprise', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (19, N'� l�aide des manuels de r�f�rences techniques appropri�s � l�environnement de programmation', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (20, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (21, N'� partir de situations repr�sentatives du milieu du travail et n�cessitant le d�veloppement d�applications comportant un nombre limit� de classes', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (22, N'� partir des normes et des exigences de l''entreprise', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (23, N'� l�aide de toute la documentation disponible sur les applications � d�velopper', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (24, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (25, N'� partir de besoins d�information pr�cis propres au milieu de travail', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (26, N'� partir de besoins d�information li�s � la veille technologique', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (27, N'� partir d�une station de travail et des logiciels appropri�s', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (28, N'� l�aide de manuels de r�f�rences en fran�ais et en anglais', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (29, N'Dans des situations de travail vari�es', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (30, N'En pr�sence des personnes en cause', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (31, N'� partir de situations vari�es repr�sentatives du milieu de travail', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (32, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (33, N'� partir des exigences de l''entreprise', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (34, N'� l�aide des manuels de r�f�rences techniques appropri�s', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (35, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (36, N'� partir d�applications vari�es n�cessitant la cr�ation d�interfaces', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (37, N'� partir des manuels de r�f�rences techniques appropri�s', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (38, N'� partir des exigences de l''entreprise et des standards de l�informatique', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (39, N'Dans des situations de travail propres � la profession', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (40, N'� l�aide des outils de planification appropri�s', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (41, N'� partir des exigences de l''entreprise', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (42, N'Pour des documents en fran�ais et en anglais', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (43, N'� partir d�une station de travail et des logiciels de bureautique, de multim�dia et de cr�ation d�aide en ligne', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (44, N'� l�aide de dictionnaires, de grammaires et d�outils de r�f�rence vari�s', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (45, N'� l�aide de l�inforoute et des services de t�l�communication', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (46, N'� partir des exigences de l�entreprise', NULL, 12)
SET IDENTITY_INSERT ContexteRealisation OFF
GO
SET IDENTITY_INSERT CriterePerformance ON
GO
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (1, N'Pertinence de l�information recueillie', 1, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (2, N'Examen complet des caract�ristiques g�n�rales des fonctions de travail et de leurs conditions d�exercice', 2, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (3, N'Reconnaissance des possibilit�s d�exercice des professions en entreprise et de pratique entrepreneuriale dans le domaine de l�informatique', 3, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (4, N'Reconnaissance des effets, sur le travail, de l��volution technologique rapide dans le domaine de l�informatique', 4, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (5, N'Examen complet des op�rations, ainsi que des conditions d�ex�cution et des crit�res de performance des t�ches associ�s aux diff�rentes fonctions de travail', 1, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (6, N'D�termination exacte de l�importance relative des activit�s', 2, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (7, N'Mise en relation des �tapes du processus de travail avec les t�ches des fonctions de travail', 3, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (8, N'Pertinence des liens �tablis entre les habilet�s et comportements et les diff�rentes t�ches des fonctions de travail', 1, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (9, N'Examen complet des exigences li�es � l��thique professionnelle', 2, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (10, N'Reconnaissance des droits et des responsabilit�s des personnes dans les relations employeur-employ� et client-fournisseur', 1, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (11, N'Reconnaissance des cons�quences des manquements aux lois et r�glements', 2, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (12, N'Repr�sentation correcte de nombres dans diff�rentes bases', 1, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (13, N'Conversion correcte de nombres d�une base � une autre', 2, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (14, N'Ex�cution correcte des op�rations arithm�tiques dans diff�rentes bases', 3, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (15, N'Repr�sentation juste de donn�es dans la m�moire de l�ordinateur', 4, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (16, N'Interpr�tation juste des limites de repr�sentation des donn�es dans la m�moire de l�ordinateur', 5, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (17, N'Formulation de propositions appropri�es � diff�rentes situations', 1, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (18, N'Construction d�une table de v�rit� conforme � une proposition', 2, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (19, N'Simplification correcte d�une proposition', 3, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (20, N'Utilisation appropri�e de la m�thode de preuve par induction', 4, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (21, N'Construction d�ensembles et de sous-ensembles appropri�s � diff�rentes situations', 1, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (22, N'Ex�cution correcte de toutes les op�rations dans les ensembles', 2, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (23, N'�tablissement de relations justes entre des ensembles', 3, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (24, N'Formulation de propositions appropri�es et dans leur forme la plus simple en vue de traiter l�information dans une situation donn�e', 4, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (25, N'Traduction correcte des propositions en langage ensembliste', 5, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (26, N'Repr�sentation d�une situation sous forme d�un syst�me d��quations lin�aires appropri�', 1, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (27, N'Ex�cution correcte des op�rations dans les matrices', 2, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (28, N'Repr�sentation juste d�un syst�me d��quations lin�aires sous forme matricielle', 3, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (29, N'Application correcte de m�thodes de r�solution de probl�mes d�un syst�me d��quations lin�aires', 4, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (30, N'Calcul exact du nombre de permutations dans un contexte donn�', 1, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (31, N'Calcul exact du nombre d�arrangements dans un contexte donn�', 2, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (32, N'Calcul exact du nombre de combinaisons dans un contexte donn�', 3, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (33, N'Calcul des probabilit�s d��v�nements li�es aux lois binomiale, normale et de Poisson', 1, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (34, N'D�termination de la nature des variables appropri�es � une situation donn�e', 2, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (35, N'Choix d��chelles de mesure appropri�es � une situation donn�e', 3, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (36, N'Choix des mesures statistiques appropri�es � une situation donn�e', 4, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (37, N'Choix judicieux du mode de repr�sentation de l�information', 5, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (38, N'Application rigoureuse des normes de pr�sentation des tableaux et des graphiques', 6, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (39, N'Utilisation efficace des fonctionnalit�s d�un logiciel de statistiques', 7, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (40, N'Choix des m�thodes d��chantillonnage appropri�es � une situation donn�e', 8, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (41, N'Estimation par intervalle d�une moyenne et d�une proportion pour des grands �chantillons', 9, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (42, N'Comparaison des possibilit�s et des limites des syst�mes de fichiers de diff�rents syst�mes d''exploitation', 1, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (43, N'Utilisation correcte des commandes de manipulation des fichiers', 2, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (44, N'Utilisation correcte des commandes de manipulation des r�pertoires', 3, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (45, N'Utilisation correcte des commandes visant � assurer la s�curit� des fichiers et des r�pertoires', 4, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (46, N'Utilisation correcte des outils visant le stockage et l''int�grit� des donn�es', 5, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (47, N'Analyse judicieuse des possibilit�s et des limites des diff�rents syst�mes d''exploitation au regard de l''ex�cution des t�ches', 1, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (48, N'Utilisation correcte du langage de commande propre au syst�me d''exploitation', 2, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (49, N'Utilisation appropri�e des commandes en vue d��tablir l�ordre de priorit� des t�ches', 3, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (50, N'Adaptation appropri�e des param�tres de s�curit� aux exigences des t�ches', 4, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (51, N'Application des techniques de d�bogage appropri�es au syst�me d''exploitation', 5, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (52, N'Consignation des commentaires pertinents', 6, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (53, N'Analyse judicieuse des possibilit�s et des limites des diff�rents syst�mes d''exploitation au regard de la gestion de la m�moire', 1, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (54, N'Allocation de la m�moire appropri�e aux besoins relatifs � l''ex�cution d''une t�che', 2, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (55, N'Comparaison des diff�rents types de fichiers de configuration propres au syst�me d''exploitation', 1, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (56, N'Utilisation correcte des commandes de configuration de base du poste de travail', 2, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (57, N'Utilisation correcte des commandes de d�marrage et de configuration des p�riph�riques', 3, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (58, N'D�marrage des programmes appropri�s aux besoins de l''utilisatrice et de l''utilisateur', 4, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (59, N'Adaptation des param�tres de configuration de l''environnement de travail aux exigences de l''utilisatrice et de l''utilisateur', 5, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (60, N'Consignation pr�cise des param�tres de personnalisation', 6, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (61, N'Distinction et rep�rage des �l�ments de la carte ma�tresse', 1, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (62, N'Reconnaissance des caract�ristiques et des fonctions propres aux processeurs, aux m�moires, aux bus et aux horloges', 2, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (63, N'Reconnaissance des caract�ristiques et des fonctions propres aux diff�rents ports de communication', 3, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (64, N'Reconnaissance des relations entre les diff�rents �l�ments', 4, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (65, N'Analyse judicieuse de la demande', 1, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (66, N'Pr�paration du mat�riel n�cessaire', 2, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (67, N'D�termination juste de la s�quence des op�rations', 3, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (68, N'Consignation compl�te de la configuration physique initiale', 1, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (69, N'Copie de l''ensemble des donn�es', 2, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (70, N'Prise des mesures de s�curit� appropri�es', 3, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (71, N'Interpr�tation correcte des fiches techniques', 1, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (72, N'D�termination appropri�e de chacun des param�tres d''installation', 2, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (73, N'Installation de l''�l�ment � l''endroit appropri�', 3, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (74, N'Configuration conforme � l''environnement du poste', 4, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (75, N'V�rification appropri�e du fonctionnement de l''�l�ment', 5, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (76, N'Interpr�tation judicieuse de l�information technique', 1, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (77, N'Respect du processus de d�sinstallation en fonction de l��l�ment � retirer', 2, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (78, N'Prise des pr�cautions appropri�es', 3, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (79, N'Interpr�tation judicieuse de l''information technique', 1, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (80, N'D�marrage appropri� de l''installation', 2, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (81, N'Choix des param�tres d''installation en fonction de l''environnement du poste', 3, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (82, N'V�rification appropri� du fonctionnement de l''�l�ment', 4, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (83, N'Personnalisation de l''�l�ment appropri�e aux besoins de l�utilisatrice et de l''utilisateur', 5, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (84, N'Copie correcte des disques', 1, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (85, N'Interpr�tation judicieuse de l''information technique', 2, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (86, N'Utilisation appropri�e des outils de d�sinstallation', 3, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (87, N'Respect du processus de d�sinstallation manuelle', 4, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (88, N'V�rification appropri�e du fonctionnement de l''ensemble des �l�ments', 1, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (89, N'R�solution efficace des probl�mes d''installation', 2, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (90, N'Installation de la station de travail conforme aux principes de l''ergonomie', 3, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (91, N'Prise en note de la nouvelle configuration', 1, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (92, N'R�daction claire et correcte des probl�mes �prouv�s et des solutions apport�es', 2, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (93, N'Mise � jour pr�cise de l''inventaire', 3, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (94, N'V�rification m�thodique de l�acc�s aux diff�rents �l�ments physiques et logiques de l�environnement', 1, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (95, N'Configuration de l�environnement appropri�e aux caract�ristiques de la situation', 2, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (96, N'Personnalisation de l�environnement efficace et conforme aux exigences de l�entreprise', 3, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (97, N'Modification appropri�e de la repr�sentation des donn�es', 1, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (98, N'Adaptation correcte des conditions d�ex�cution', 2, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (99, N'Modification appropri�e des structures de traitement', 3, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (100, N'Adaptation appropri�e de la s�quence des op�rations', 4, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (101, N'Utilisation efficace des fonctionnalit�s d��dition de l�environnement', 1, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (102, N'Application des r�gles de syntaxe et de s�mantique propres au langage utilis�', 2, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (103, N'Application rigoureuse des standards de codification', 3, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (104, N'Application judicieuse des principes de la programmation structur�e', 4, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (105, N'Mise � profit judicieuse des possibilit�s du langage', 5, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (106, N'Consignation des commentaires pertinents et conformes aux exigences de l�entreprise', 6, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (107, N'Utilisation efficace des fonctionnalit�s de compilation de l�environnement', 1, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (108, N'Rep�rage des erreurs de compilation', 2, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (109, N'Correction des erreurs de compilation', 3, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (110, N'Utilisation efficace des fonctionnalit�s d�ex�cution et de d�bogage de l�environnement', 1, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (111, N'Pr�paration correcte des jeux d�essai n�cessaires � la v�rification du fonctionnement du programme', 2, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (112, N'Interpr�tation juste des r�sultats', 3, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (113, N'D�bogage appropri� du programme selon l�algorithme', 4, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (114, N'�tablissement complet des domaines d�application', 1, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (115, N'D�termination des classes pertinentes', 2, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (116, N'�tablissement des relations hi�rarchiques appropri�es entre les classes', 3, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (117, N'D�termination des services de chacune des classes', 4, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (118, N'D�termination des attributs pertinents compte tenu de chacune des classes', 5, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (119, N'Repr�sentation graphique appropri�e du mod�le objet', 6, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (120, N'Mise au point de la s�quence des op�rations propres aux diff�rents services de la classe', 1, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (121, N'Repr�sentation graphique appropri�e du mod�le s�quentiel', 2, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (122, N'Modification appropri�e du mod�le objet', 3, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (123, N'Pr�paration appropri�e de l''environnement de programmation', 1, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (124, N'D�claration et d�finition de la classe respectant les r�gles de syntaxe et de s�mantique du langage', 2, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (125, N'Exploitation judicieuse des possibilit�s du langage dans l''application des principes d''encapsulation, d''h�ritage et de polymorphisme', 3, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (126, N'Application rigoureuse des standards de nomenclature et de documentation reconnus propres � l''entreprise', 4, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (127, N'Rep�rage et correction des erreurs de compilation de la classe', 5, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (128, N'Pr�paration correcte des jeux d''essai n�cessaires � la v�rification du bon fonctionnement de tous les services de la classe', 1, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (129, N'Cr�ation d''un environnement de test appropri�', 2, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (130, N'Interpr�tation juste des r�sultats', 3, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (131, N'D�bogage appropri� de la classe', 4, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (132, N'Utilisation des m�canismes de g�n�ration propres � l�outil employ�', 1, NULL, 33)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (133, N'Pr�cision juste du besoin de recherche', 1, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (134, N'D�termination des crit�res permettant de choisir correctement les sources de la recherche', 2, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (135, N'Manifestation d�initiative', 3, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (136, N'S�lection judicieuse des sources en fonction de la nature et des crit�res de la recherche', 1, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (137, N'Utilisation correcte et efficace des m�thodes et des outils de recherche conventionnels et informatiques', 2, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (138, N'Prise en consid�ration des risques de s��loigner du besoin initial', 3, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (139, N'Pertinence de l�information consult�e', 1, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (140, N'Interpr�tation juste de l�information en fran�ais et en anglais', 2, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (141, N'Pertinence de l�information extraite en fonction du besoin initial', 3, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (142, N'Manifestation de curiosit�', 4, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (143, N'Clart�, pr�cision et pertinence de l�information consign�e', 1, NULL, 37)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (144, N'Prise en consid�ration de ses forces et de ses faiblesses en mati�re de relations interpersonnelles', 1, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (145, N'Manifestation d�attitudes favorisant des relations interpersonnelles harmonieuses', 2, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (146, N'Application rigoureuse des r�gles de politesse et de courtoisie', 3, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (147, N'Adaptation de son approche selon les personnes et les situations', 4, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (148, N'Utilisation appropri�e des techniques de gestion des conflits interpersonnels', 5, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (149, N'Manifestation de comportements conformes � l��thique professionnelle', 6, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (150, N'Manifestation d�une attitude d��coute et de r�ceptivit�', 1, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (151, N'Adaptation du niveau de langage selon l�interlocutrice et l�interlocuteur', 2, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (152, N'Application correcte des techniques de communication verbale et non verbale', 3, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (153, N'Utilisation appropri�e des techniques de n�gociation et d�argumentation', 4, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (154, N'Distinction juste du r�le et des responsabilit�s des membres de l��quipe', 1, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (155, N'Prise de ses responsabilit�s au sein de l��quipe', 2, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (156, N'Contribution active aux activit�s de l��quipe', 3, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (157, N'Utilisation appropri�e des techniques de n�gociation et d�argumentation', 4, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (158, N'Manifestation d�attitudes favorisant le travail d��quipe', 5, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (159, N'Respect du mode d�action �tabli par l��quipe', 6, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (160, N'Respect des d�cisions prises par les membres de l��quipe', 7, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (161, N'Contribution efficace � la r�solution des probl�mes �prouv�s par les membres de l��quipe', 8, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (162, N'Interpr�tation juste des besoins', 1, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (163, N'Manifestation d�un souci constant de r�pondre aux besoins des clientes et des clients', 2, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (164, N'V�rification r�guli�re de la satisfaction des clientes et des clients', 3, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (165, N'R�action appropri�e devant les probl�mes soulev�s par les clientes et les clients', 4, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (166, N'Manifestation d�un souci constant d�am�liorer la qualit� des services et des produits', 5, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (167, N'Manifestation de comportements conformes � l��thique professionnelle', 6, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (168, N'�tablissement correcte des donn�es d''entr�e', 1, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (169, N'�tablissement correcte des donn�es de sortie', 2, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (170, N'�tablissement correcte de la nature des traitements', 3, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (171, N'D�termination correcte des conditions d�ex�cution de l''algorithme', 4, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (172, N'Choix d�un mode de repr�sentation de l''algorithme conforme aux exigences de l''entreprise', 1, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (173, N'D�termination d''une s�quence logique des op�rations', 2, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (174, N'D�termination des structures de traitement appropri�es � chacune des op�rations', 3, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (175, N'Application rigoureuse des r�gles de syntaxe propres au mode de repr�sentation retenu', 4, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (176, N'Recherche d''une solution algorithmique efficace', 5, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (177, N'Repr�sentation pr�cise de la solution algorithmique retenue', 6, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (178, N'Pr�sence de toute l''information n�cessaire � l''interpr�tation de l''algorithme', 7, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (179, N'V�rification de la pertinence de la solution compte tenu de la situation initiale', 1, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (180, N'D�termination des erreurs et des lacunes de la solution algorithmique mise au point', 2, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (181, N'Modification appropri�e de la solution algorithmique', 3, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (182, N'Examen des caract�ristiques des utilisatrices et des utilisateurs li�es � l��ge, � la culture et � la scolarisation', 1, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (183, N'D�termination du degr� de familiarit� avec l�informatique en g�n�ral et avec l�application � utiliser', 2, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (184, N'D�termination du degr� de r�ceptivit� des utilisatrices et des utilisateurs par rapport � l�application � utiliser', 3, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (185, N'Pr�cision des attentes des utilisatrices et des utilisateurs', 4, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (186, N'Reconnaissance des caract�ristiques de l�environnement physique', 1, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (187, N'D�termination des modalit�s d�interaction', 2, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (188, N'D�finition des caract�ristiques des t�ches d�interaction', 3, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (189, N'V�rification de la coh�rence entre les modalit�s et les t�ches', 4, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (190, N'Prise en consid�ration des caract�ristiques des utilisatrices et des utilisateurs', 1, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (191, N'Prise en consid�ration des caract�ristiques de l�interaction', 2, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (192, N'Prise en consid�ration des caract�ristiques des exigences d�ergonomie', 3, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (193, N'Prise en consid�ration des contraintes de fiabilit�, de co�t et de maintenance', 4, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (194, N'Interpr�tation correcte des fiches techniques des produits offerts sur le march�', 5, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (195, N'�tablissement des actions et des exceptions li�es aux t�ches', 1, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (196, N'D�termination des �l�ments de pr�sentation des actions et des exceptions', 2, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (197, N'Organisation spatiale appropri�e des �l�ments', 3, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (198, N'D�termination des caract�ristiques de pr�sentation des �l�ments', 4, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (199, N'Organisation de l�interface conforme aux crit�res d�esth�tisme et d�efficacit�', 5, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (200, N'Consignation de l�information relative � l�interface', 6, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (201, N'Cr�ation des �l�ments selon les caract�ristiques de pr�sentation choisies', 1, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (202, N'Positionnement des �l�ments selon l�organisation spatiale retenue', 2, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (203, N'�tablissement des liens entre les �l�ments et les programmes de l�application', 3, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (204, N'Validation du fonctionnement de l�interface', 4, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (205, N'D�termination correcte des principales t�ches et de leur s�quence', 1, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (206, N'Estimation du temps n�cessaire � l�ex�cution des principales t�ches', 2, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (207, N'Prise en consid�ration des �ch�ances �tablies pour l�ex�cution du travail', 3, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (208, N'�tablissement correct de priorit�s', 1, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (209, N'Prise en consid�ration des points critiques', 2, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (210, N'Pr�vision d�une marge de man�uvre suffisante pour faire face aux impr�vus', 3, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (211, N'Utilisation appropri�e des m�thodes et des outils de planification', 4, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (212, N'�tablissement d�un calendrier des travaux r�aliste', 5, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (213, N'D�termination correcte des ressources humaines et mat�rielles n�cessaires � l�ex�cution du travail', 6, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (214, N'Communication efficace avec les personnes en cause', 7, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (215, N'Pr�sentation correcte du plan de travail pour approbation', 8, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (216, N'Utilisation d�une m�thode appropri�e de suivi des activit�s', 1, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (217, N'Gestion efficace du temps', 2, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (218, N'Respect du calendrier des travaux', 3, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (219, N'Adaptation r�guli�re du calendrier des travaux en fonction des impr�vus', 4, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (220, N'D�termination juste du support n�cessaire', 1, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (221, N'S�lection et utilisation correcte du logiciel de cr�ation du document', 2, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (222, N'�tablissement juste du plan de travail pour le document � produire', 1, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (223, N'Pr�paration appropri�e des �l�ments de contenu', 2, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (224, N'Application rigoureuse des r�gles grammaticales et orthographiques', 3, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (225, N'�tablissement correct du format de mise en page', 4, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (226, N'Adaptation correcte du niveau de langage en fonction du public cible', 5, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (227, N'Clart� du texte', 6, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (228, N'Utilisation efficace des logiciels de bureautique et de multim�dia', 7, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (229, N'Respect des normes de mise en page', 8, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (230, N'S�lection des �l�ments qui n�cessitent de l�aide en ligne', 1, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (231, N'Respect des normes de pr�sentation', 2, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (232, N'Application rigoureuse des r�gles grammaticales et orthographiques', 3, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (233, N'Adaptation correcte du niveau de langage en fonction du public cible', 4, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (234, N'Utilisation correcte du logiciel de cr�ation d�aide en ligne', 5, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (235, N'Facilit� d�utilisation de l�aide en ligne', 6, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (236, N'V�rification de la coh�rence de l�aide en ligne', 7, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (237, N'Prise en consid�ration des objectifs d�apprentissage en fonction du public cible et du contexte de formation', 1, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (238, N'Pr�paration appropri�e des �l�ments de contenu', 2, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (239, N'Utilisation correcte des outils de production du document', 3, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (240, N'Respect des normes de pr�sentation', 4, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (241, N'Application rigoureuse des r�gles grammaticales et orthographiques', 5, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (242, N'Adaptation correcte du niveau de langage en fonction du public cible', 6, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (243, N'V�rification minutieuse du document', 7, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (244, N'�tablissement juste de la liste de diffusion', 1, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (245, N'S�lection et utilisation du mode de diffusion', 2, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (246, N'V�rification syst�matique de la r�ception', 3, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (247, N'Respect des r�gles de conservation d�un document', 1, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (248, N'Attribution pr�cise d�un code � partir du plan de classification', 2, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (249, N'Pr�cision et concision du titre d�un document selon les normes', 3, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (250, N'Consignation minutieuse de l�information dans l�outil de rep�rage', 4, NULL, 58)
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
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (221, 'M�canique du b�timent')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (222, 'Am�nagement et urbanisme')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (235, 'G�nie m�canique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (241, 'G�nie m�canique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (243, '�lectronique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (260, 'Environnement, hygi�ne')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (300, 'Sciences humaines')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (322, '�ducation � l''enfance')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (351, '�ducation sp�cialis�e')
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
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (582, 'Int�gration multim�dia')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (589, 'Art et technologie des m�dias')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (700, 'Sciences, lettres et arts')
GO
-- Insertion des programmes
INSERT INTO Programme (annee, codeSpecialisation, nbUnite, nom, specialisation, nbHeurefrmGenerale, nbHeurefrmSpecifique, condition, sanction, commentaire, docMinistere_path, dateValidation, codeProgramme) VALUES
('2001','AA','91 2/3', 'Informatique', 'Informatique de gestion', '660', '1980', 'Math�matique 526/Math�matique 536', 'Dipl�me d��tudes coll�giales', NULL, NULL, NULL, '420'),
('2000','A1',NULL,'Int�gration multim�dia',NULL,NULL,NULL,NULL,'Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'582'),
('2001','A0',NULL,'Soins infirmiers',NULL,NULL,NULL,'Math�matique 536','Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'180'),
('2000','C0',NULL,'G�nie Chimique',NULL,NULL,NULL,'Math�matique 526','Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'210')
GO
--select * from EnteteProgramme
--select * from tblProgramme
SET IDENTITY_INSERT EnonceCompetence ON
GO
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (1, N'016N', N'Analyser les fonctions de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (2, N'016P', N'R�soudre des probl�mes math�matiques et
statistiques en informatique', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (3, N'016Q', N'Mettre � profit les possibilit�s d''un syst�me
d''exploitation propre � une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (4, N'016R', N'Installer des �l�ments physiques et logiques
dans une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (5, N'016S', N'Exploiter un langage de programmation
structur�e', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (6, N'016T', N'Appliquer une approche de d�veloppement par
objets', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (7, N'016U', N'Effectuer la recherche d�information', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (8, N'026V', N'Interagir et communiquer dans des situations de
travail vari�es', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (9, N'016W', N'Produire des algorithmes', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (10, N'016X', N'Produire une interface utilisateur', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (11, N'016Y', N'Planifier et g�rer des activit�s de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (12, N'016Z', N'Assurer la production et la gestion de
documents', NULL, 1, 1, NULL, 1)
SET IDENTITY_INSERT EnonceCompetence OFF
GO
SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (1, N'Caract�riser les fonctions de travail et leurs conditions d''exercise', 1, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (2, N'Examiner les t�ches et les op�rations li�es aux fonctions de travail', 2, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (3, N'Examiner les habilet�s et les comportements n�cessaire a l''exercice des fonctions de travail.', 3, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (4, N'Examiner la r�glementation relative � l''exercice de la profession en g�n�ral', 4, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (5, N'Effectuer des traitements sur des donn�es
internes de l�ordinateur', 1, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (6, N'Effectuer des op�rations logiques', 2, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (7, N'Organiser et traiter de l�information', 3, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (8, N'R�soudre des probl�mes de
programmation lin�aire', 4, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (9, N'R�soudre des probl�mes de
d�nombrement', 5, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (10, N'R�soudre des probl�mes de probabilit� et
de statistique', 6, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (11, N'Exploiter un syst�me de fichiers', 1, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (12, N'Automatiser des t�ches', 2, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (13, N'Utiliser les m�canismes de gestion de la
m�moire', 3, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (14, N'Personnaliser l''environnement de la station
de travail', 4, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (15, N'Analyser l''architecture interne de
l''ordinateur', 1, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (16, N'Planifier le travail', 2, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (17, N'Prot�ger l''environnement de la station de
travail', 3, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (18, N'Installer des �l�ments physiques', 4, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (19, N'D�sinstaller des �l�ments physiques', 5, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (20, N'Installer des �l�ments logiques', 6, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (21, N'D�sinstaller des �l�ments logiques', 7, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (22, N'V�rifier l''installation de la station de
travail dans l''environnement de
l''utilisatrice et de l''utilisateur', 8, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (23, N'Consigner l''information sur l''installation', 9, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (24, N'Pr�parer l�environnement de
programmation.', 1, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (25, N'Adapter l�algorithme aux contraintes du
langage de programmation.', 2, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (26, N'Traduire l�algorithme dans le langage de
programmation.', 3, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (27, N'Compiler le programme', 4, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (28, N'Valider le programme', 5, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (29, N'Cr�er un mod�le objet', 1, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (30, N'Perfectionner le mod�le objet', 2, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (31, N'Proc�der � la codification d�une classe', 3, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (32, N'Valider le fonctionnement d�une classe', 4, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (33, N'G�n�rer la version ex�cutable du
programme', 5, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (34, N'Pr�ciser le besoin d�information', 1, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (35, N'S�lectionner et utiliser les sources de
recherche', 2, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (36, N'Consulter et extraire l�information
n�cessaire', 3, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (37, N'Consigner les r�sultats de la recherche', 4, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (38, N'�tablir et entretenir des relations
interpersonnelles', 1, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (39, N'Communiquer avec des personnes �
l�interne et � l�externe', 2, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (40, N'Travailler au sein d�une �quipe
multidisciplinaire', 3, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (41, N'Appliquer une approche client', 4, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (42, N'Analyser la situation', 1, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (43, N'Mettre au point l''algorithme', 2, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (44, N'Valider l''algorithme', 3, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (45, N'Analyser les caract�ristiques des
utilisatrices et des utilisateurs', 1, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (46, N'�tablir les caract�ristiques d�interaction', 2, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (47, N'Choisir des p�riph�riques d�entr�e et de
sortie', 3, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (48, N'Planifier l�organisation globale de
l�interface', 4, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (49, N'Proc�der � la programmation de l�interface
utilisateur', 5, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (50, N'Analyser les caract�ristiques du travail �
effectuer', 1, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (51, N'Proc�der � la planification des activit�s', 2, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (52, N'Assurer le suivi des activit�s de travail', 3, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (53, N'Choisir le support du document', 1, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (54, N'Produire un document technique et
administratif', 2, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (55, N'Produire l�aide en ligne', 3, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (56, N'Produire un document de formation', 4, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (57, N'Diffuser un document', 5, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (58, N'Classer un document', 6, NULL, NULL, 12)
SET IDENTITY_INSERT ElementCompetence OFF
GO
SET IDENTITY_INSERT ContexteRealisation ON
GO
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (1, N'a l''aide d''une information r�cente sur les fonctions de travail suivantes : - programeuse-analyste et programeur-analyste dans les domaine de la gestion et de l''indutrie', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (2, N'� l''aide d''une information r�cente sur les entreprses dans lesquelles on trouve la programeuse-analyste et le programmeur-analyste et la et le gestionnaire de r�seaux informatique', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (3, N'� partir de situations propres au domaine de l''informatique', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (4, N'� partir d''une station de travail et d�un logiciel de statistiques', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (5, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (6, N'Dans des environnements utilisant des syst�mes d�exploitation vari�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (7, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (8, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (9, N'� partir des normes et des exigences de l''entreprise', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (10, N'En atelier et sur le lieu de travail de l''utilisatrice et de l''utilisateur', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (11, N'� partir d''une demande pr�autoris�e pr�cisant la nature de l''installation', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (12, N'� partir d''une station de travail', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (13, N'� l''aide des �l�ments physiques et logiques � installer et des outils appropri�s', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (14, N'� partir des normes et des exigences de l''entreprise', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (15, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (16, N'� partir d�une station de travail et des logiciels appropri�s', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (17, N'� partir d�algorithmes valides et repr�sentatifs du milieu de travail', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (18, N'� partir des normes et des exigences de l�entreprise', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (19, N'� l�aide des manuels de r�f�rences techniques appropri�s � l�environnement de programmation', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (20, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (21, N'� partir de situations repr�sentatives du milieu du travail et n�cessitant le d�veloppement d�applications comportant un nombre limit� de classes', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (22, N'� partir des normes et des exigences de l''entreprise', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (23, N'� l�aide de toute la documentation disponible sur les applications � d�velopper', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (24, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (25, N'� partir de besoins d�information pr�cis propres au milieu de travail', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (26, N'� partir de besoins d�information li�s � la veille technologique', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (27, N'� partir d�une station de travail et des logiciels appropri�s', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (28, N'� l�aide de manuels de r�f�rences en fran�ais et en anglais', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (29, N'Dans des situations de travail vari�es', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (30, N'En pr�sence des personnes en cause', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (31, N'� partir de situations vari�es repr�sentatives du milieu de travail', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (32, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (33, N'� partir des exigences de l''entreprise', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (34, N'� l�aide des manuels de r�f�rences techniques appropri�s', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (35, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (36, N'� partir d�applications vari�es n�cessitant la cr�ation d�interfaces', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (37, N'� partir des manuels de r�f�rences techniques appropri�s', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (38, N'� partir des exigences de l''entreprise et des standards de l�informatique', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (39, N'Dans des situations de travail propres � la profession', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (40, N'� l�aide des outils de planification appropri�s', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (41, N'� partir des exigences de l''entreprise', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (42, N'Pour des documents en fran�ais et en anglais', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (43, N'� partir d�une station de travail et des logiciels de bureautique, de multim�dia et de cr�ation d�aide en ligne', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (44, N'� l�aide de dictionnaires, de grammaires et d�outils de r�f�rence vari�s', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (45, N'� l�aide de l�inforoute et des services de t�l�communication', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (46, N'� partir des exigences de l�entreprise', NULL, 12)
SET IDENTITY_INSERT ContexteRealisation OFF
GO
SET IDENTITY_INSERT CriterePerformance ON
GO
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (1, N'Pertinence de l�information recueillie', 1, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (2, N'Examen complet des caract�ristiques g�n�rales des fonctions de travail et de leurs conditions d�exercice', 2, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (3, N'Reconnaissance des possibilit�s d�exercice des professions en entreprise et de pratique entrepreneuriale dans le domaine de l�informatique', 3, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (4, N'Reconnaissance des effets, sur le travail, de l��volution technologique rapide dans le domaine de l�informatique', 4, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (5, N'Examen complet des op�rations, ainsi que des conditions d�ex�cution et des crit�res de performance des t�ches associ�s aux diff�rentes fonctions de travail', 1, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (6, N'D�termination exacte de l�importance relative des activit�s', 2, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (7, N'Mise en relation des �tapes du processus de travail avec les t�ches des fonctions de travail', 3, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (8, N'Pertinence des liens �tablis entre les habilet�s et comportements et les diff�rentes t�ches des fonctions de travail', 1, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (9, N'Examen complet des exigences li�es � l��thique professionnelle', 2, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (10, N'Reconnaissance des droits et des responsabilit�s des personnes dans les relations employeur-employ� et client-fournisseur', 1, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (11, N'Reconnaissance des cons�quences des manquements aux lois et r�glements', 2, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (12, N'Repr�sentation correcte de nombres dans diff�rentes bases', 1, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (13, N'Conversion correcte de nombres d�une base � une autre', 2, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (14, N'Ex�cution correcte des op�rations arithm�tiques dans diff�rentes bases', 3, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (15, N'Repr�sentation juste de donn�es dans la m�moire de l�ordinateur', 4, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (16, N'Interpr�tation juste des limites de repr�sentation des donn�es dans la m�moire de l�ordinateur', 5, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (17, N'Formulation de propositions appropri�es � diff�rentes situations', 1, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (18, N'Construction d�une table de v�rit� conforme � une proposition', 2, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (19, N'Simplification correcte d�une proposition', 3, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (20, N'Utilisation appropri�e de la m�thode de preuve par induction', 4, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (21, N'Construction d�ensembles et de sous-ensembles appropri�s � diff�rentes situations', 1, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (22, N'Ex�cution correcte de toutes les op�rations dans les ensembles', 2, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (23, N'�tablissement de relations justes entre des ensembles', 3, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (24, N'Formulation de propositions appropri�es et dans leur forme la plus simple en vue de traiter l�information dans une situation donn�e', 4, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (25, N'Traduction correcte des propositions en langage ensembliste', 5, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (26, N'Repr�sentation d�une situation sous forme d�un syst�me d��quations lin�aires appropri�', 1, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (27, N'Ex�cution correcte des op�rations dans les matrices', 2, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (28, N'Repr�sentation juste d�un syst�me d��quations lin�aires sous forme matricielle', 3, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (29, N'Application correcte de m�thodes de r�solution de probl�mes d�un syst�me d��quations lin�aires', 4, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (30, N'Calcul exact du nombre de permutations dans un contexte donn�', 1, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (31, N'Calcul exact du nombre d�arrangements dans un contexte donn�', 2, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (32, N'Calcul exact du nombre de combinaisons dans un contexte donn�', 3, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (33, N'Calcul des probabilit�s d��v�nements li�es aux lois binomiale, normale et de Poisson', 1, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (34, N'D�termination de la nature des variables appropri�es � une situation donn�e', 2, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (35, N'Choix d��chelles de mesure appropri�es � une situation donn�e', 3, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (36, N'Choix des mesures statistiques appropri�es � une situation donn�e', 4, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (37, N'Choix judicieux du mode de repr�sentation de l�information', 5, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (38, N'Application rigoureuse des normes de pr�sentation des tableaux et des graphiques', 6, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (39, N'Utilisation efficace des fonctionnalit�s d�un logiciel de statistiques', 7, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (40, N'Choix des m�thodes d��chantillonnage appropri�es � une situation donn�e', 8, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (41, N'Estimation par intervalle d�une moyenne et d�une proportion pour des grands �chantillons', 9, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (42, N'Comparaison des possibilit�s et des limites des syst�mes de fichiers de diff�rents syst�mes d''exploitation', 1, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (43, N'Utilisation correcte des commandes de manipulation des fichiers', 2, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (44, N'Utilisation correcte des commandes de manipulation des r�pertoires', 3, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (45, N'Utilisation correcte des commandes visant � assurer la s�curit� des fichiers et des r�pertoires', 4, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (46, N'Utilisation correcte des outils visant le stockage et l''int�grit� des donn�es', 5, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (47, N'Analyse judicieuse des possibilit�s et des limites des diff�rents syst�mes d''exploitation au regard de l''ex�cution des t�ches', 1, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (48, N'Utilisation correcte du langage de commande propre au syst�me d''exploitation', 2, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (49, N'Utilisation appropri�e des commandes en vue d��tablir l�ordre de priorit� des t�ches', 3, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (50, N'Adaptation appropri�e des param�tres de s�curit� aux exigences des t�ches', 4, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (51, N'Application des techniques de d�bogage appropri�es au syst�me d''exploitation', 5, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (52, N'Consignation des commentaires pertinents', 6, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (53, N'Analyse judicieuse des possibilit�s et des limites des diff�rents syst�mes d''exploitation au regard de la gestion de la m�moire', 1, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (54, N'Allocation de la m�moire appropri�e aux besoins relatifs � l''ex�cution d''une t�che', 2, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (55, N'Comparaison des diff�rents types de fichiers de configuration propres au syst�me d''exploitation', 1, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (56, N'Utilisation correcte des commandes de configuration de base du poste de travail', 2, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (57, N'Utilisation correcte des commandes de d�marrage et de configuration des p�riph�riques', 3, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (58, N'D�marrage des programmes appropri�s aux besoins de l''utilisatrice et de l''utilisateur', 4, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (59, N'Adaptation des param�tres de configuration de l''environnement de travail aux exigences de l''utilisatrice et de l''utilisateur', 5, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (60, N'Consignation pr�cise des param�tres de personnalisation', 6, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (61, N'Distinction et rep�rage des �l�ments de la carte ma�tresse', 1, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (62, N'Reconnaissance des caract�ristiques et des fonctions propres aux processeurs, aux m�moires, aux bus et aux horloges', 2, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (63, N'Reconnaissance des caract�ristiques et des fonctions propres aux diff�rents ports de communication', 3, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (64, N'Reconnaissance des relations entre les diff�rents �l�ments', 4, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (65, N'Analyse judicieuse de la demande', 1, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (66, N'Pr�paration du mat�riel n�cessaire', 2, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (67, N'D�termination juste de la s�quence des op�rations', 3, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (68, N'Consignation compl�te de la configuration physique initiale', 1, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (69, N'Copie de l''ensemble des donn�es', 2, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (70, N'Prise des mesures de s�curit� appropri�es', 3, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (71, N'Interpr�tation correcte des fiches techniques', 1, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (72, N'D�termination appropri�e de chacun des param�tres d''installation', 2, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (73, N'Installation de l''�l�ment � l''endroit appropri�', 3, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (74, N'Configuration conforme � l''environnement du poste', 4, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (75, N'V�rification appropri�e du fonctionnement de l''�l�ment', 5, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (76, N'Interpr�tation judicieuse de l�information technique', 1, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (77, N'Respect du processus de d�sinstallation en fonction de l��l�ment � retirer', 2, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (78, N'Prise des pr�cautions appropri�es', 3, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (79, N'Interpr�tation judicieuse de l''information technique', 1, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (80, N'D�marrage appropri� de l''installation', 2, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (81, N'Choix des param�tres d''installation en fonction de l''environnement du poste', 3, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (82, N'V�rification appropri� du fonctionnement de l''�l�ment', 4, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (83, N'Personnalisation de l''�l�ment appropri�e aux besoins de l�utilisatrice et de l''utilisateur', 5, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (84, N'Copie correcte des disques', 1, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (85, N'Interpr�tation judicieuse de l''information technique', 2, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (86, N'Utilisation appropri�e des outils de d�sinstallation', 3, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (87, N'Respect du processus de d�sinstallation manuelle', 4, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (88, N'V�rification appropri�e du fonctionnement de l''ensemble des �l�ments', 1, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (89, N'R�solution efficace des probl�mes d''installation', 2, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (90, N'Installation de la station de travail conforme aux principes de l''ergonomie', 3, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (91, N'Prise en note de la nouvelle configuration', 1, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (92, N'R�daction claire et correcte des probl�mes �prouv�s et des solutions apport�es', 2, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (93, N'Mise � jour pr�cise de l''inventaire', 3, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (94, N'V�rification m�thodique de l�acc�s aux diff�rents �l�ments physiques et logiques de l�environnement', 1, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (95, N'Configuration de l�environnement appropri�e aux caract�ristiques de la situation', 2, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (96, N'Personnalisation de l�environnement efficace et conforme aux exigences de l�entreprise', 3, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (97, N'Modification appropri�e de la repr�sentation des donn�es', 1, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (98, N'Adaptation correcte des conditions d�ex�cution', 2, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (99, N'Modification appropri�e des structures de traitement', 3, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (100, N'Adaptation appropri�e de la s�quence des op�rations', 4, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (101, N'Utilisation efficace des fonctionnalit�s d��dition de l�environnement', 1, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (102, N'Application des r�gles de syntaxe et de s�mantique propres au langage utilis�', 2, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (103, N'Application rigoureuse des standards de codification', 3, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (104, N'Application judicieuse des principes de la programmation structur�e', 4, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (105, N'Mise � profit judicieuse des possibilit�s du langage', 5, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (106, N'Consignation des commentaires pertinents et conformes aux exigences de l�entreprise', 6, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (107, N'Utilisation efficace des fonctionnalit�s de compilation de l�environnement', 1, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (108, N'Rep�rage des erreurs de compilation', 2, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (109, N'Correction des erreurs de compilation', 3, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (110, N'Utilisation efficace des fonctionnalit�s d�ex�cution et de d�bogage de l�environnement', 1, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (111, N'Pr�paration correcte des jeux d�essai n�cessaires � la v�rification du fonctionnement du programme', 2, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (112, N'Interpr�tation juste des r�sultats', 3, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (113, N'D�bogage appropri� du programme selon l�algorithme', 4, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (114, N'�tablissement complet des domaines d�application', 1, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (115, N'D�termination des classes pertinentes', 2, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (116, N'�tablissement des relations hi�rarchiques appropri�es entre les classes', 3, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (117, N'D�termination des services de chacune des classes', 4, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (118, N'D�termination des attributs pertinents compte tenu de chacune des classes', 5, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (119, N'Repr�sentation graphique appropri�e du mod�le objet', 6, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (120, N'Mise au point de la s�quence des op�rations propres aux diff�rents services de la classe', 1, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (121, N'Repr�sentation graphique appropri�e du mod�le s�quentiel', 2, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (122, N'Modification appropri�e du mod�le objet', 3, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (123, N'Pr�paration appropri�e de l''environnement de programmation', 1, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (124, N'D�claration et d�finition de la classe respectant les r�gles de syntaxe et de s�mantique du langage', 2, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (125, N'Exploitation judicieuse des possibilit�s du langage dans l''application des principes d''encapsulation, d''h�ritage et de polymorphisme', 3, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (126, N'Application rigoureuse des standards de nomenclature et de documentation reconnus propres � l''entreprise', 4, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (127, N'Rep�rage et correction des erreurs de compilation de la classe', 5, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (128, N'Pr�paration correcte des jeux d''essai n�cessaires � la v�rification du bon fonctionnement de tous les services de la classe', 1, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (129, N'Cr�ation d''un environnement de test appropri�', 2, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (130, N'Interpr�tation juste des r�sultats', 3, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (131, N'D�bogage appropri� de la classe', 4, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (132, N'Utilisation des m�canismes de g�n�ration propres � l�outil employ�', 1, NULL, 33)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (133, N'Pr�cision juste du besoin de recherche', 1, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (134, N'D�termination des crit�res permettant de choisir correctement les sources de la recherche', 2, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (135, N'Manifestation d�initiative', 3, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (136, N'S�lection judicieuse des sources en fonction de la nature et des crit�res de la recherche', 1, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (137, N'Utilisation correcte et efficace des m�thodes et des outils de recherche conventionnels et informatiques', 2, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (138, N'Prise en consid�ration des risques de s��loigner du besoin initial', 3, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (139, N'Pertinence de l�information consult�e', 1, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (140, N'Interpr�tation juste de l�information en fran�ais et en anglais', 2, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (141, N'Pertinence de l�information extraite en fonction du besoin initial', 3, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (142, N'Manifestation de curiosit�', 4, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (143, N'Clart�, pr�cision et pertinence de l�information consign�e', 1, NULL, 37)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (144, N'Prise en consid�ration de ses forces et de ses faiblesses en mati�re de relations interpersonnelles', 1, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (145, N'Manifestation d�attitudes favorisant des relations interpersonnelles harmonieuses', 2, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (146, N'Application rigoureuse des r�gles de politesse et de courtoisie', 3, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (147, N'Adaptation de son approche selon les personnes et les situations', 4, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (148, N'Utilisation appropri�e des techniques de gestion des conflits interpersonnels', 5, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (149, N'Manifestation de comportements conformes � l��thique professionnelle', 6, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (150, N'Manifestation d�une attitude d��coute et de r�ceptivit�', 1, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (151, N'Adaptation du niveau de langage selon l�interlocutrice et l�interlocuteur', 2, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (152, N'Application correcte des techniques de communication verbale et non verbale', 3, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (153, N'Utilisation appropri�e des techniques de n�gociation et d�argumentation', 4, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (154, N'Distinction juste du r�le et des responsabilit�s des membres de l��quipe', 1, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (155, N'Prise de ses responsabilit�s au sein de l��quipe', 2, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (156, N'Contribution active aux activit�s de l��quipe', 3, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (157, N'Utilisation appropri�e des techniques de n�gociation et d�argumentation', 4, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (158, N'Manifestation d�attitudes favorisant le travail d��quipe', 5, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (159, N'Respect du mode d�action �tabli par l��quipe', 6, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (160, N'Respect des d�cisions prises par les membres de l��quipe', 7, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (161, N'Contribution efficace � la r�solution des probl�mes �prouv�s par les membres de l��quipe', 8, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (162, N'Interpr�tation juste des besoins', 1, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (163, N'Manifestation d�un souci constant de r�pondre aux besoins des clientes et des clients', 2, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (164, N'V�rification r�guli�re de la satisfaction des clientes et des clients', 3, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (165, N'R�action appropri�e devant les probl�mes soulev�s par les clientes et les clients', 4, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (166, N'Manifestation d�un souci constant d�am�liorer la qualit� des services et des produits', 5, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (167, N'Manifestation de comportements conformes � l��thique professionnelle', 6, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (168, N'�tablissement correcte des donn�es d''entr�e', 1, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (169, N'�tablissement correcte des donn�es de sortie', 2, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (170, N'�tablissement correcte de la nature des traitements', 3, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (171, N'D�termination correcte des conditions d�ex�cution de l''algorithme', 4, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (172, N'Choix d�un mode de repr�sentation de l''algorithme conforme aux exigences de l''entreprise', 1, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (173, N'D�termination d''une s�quence logique des op�rations', 2, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (174, N'D�termination des structures de traitement appropri�es � chacune des op�rations', 3, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (175, N'Application rigoureuse des r�gles de syntaxe propres au mode de repr�sentation retenu', 4, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (176, N'Recherche d''une solution algorithmique efficace', 5, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (177, N'Repr�sentation pr�cise de la solution algorithmique retenue', 6, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (178, N'Pr�sence de toute l''information n�cessaire � l''interpr�tation de l''algorithme', 7, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (179, N'V�rification de la pertinence de la solution compte tenu de la situation initiale', 1, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (180, N'D�termination des erreurs et des lacunes de la solution algorithmique mise au point', 2, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (181, N'Modification appropri�e de la solution algorithmique', 3, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (182, N'Examen des caract�ristiques des utilisatrices et des utilisateurs li�es � l��ge, � la culture et � la scolarisation', 1, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (183, N'D�termination du degr� de familiarit� avec l�informatique en g�n�ral et avec l�application � utiliser', 2, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (184, N'D�termination du degr� de r�ceptivit� des utilisatrices et des utilisateurs par rapport � l�application � utiliser', 3, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (185, N'Pr�cision des attentes des utilisatrices et des utilisateurs', 4, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (186, N'Reconnaissance des caract�ristiques de l�environnement physique', 1, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (187, N'D�termination des modalit�s d�interaction', 2, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (188, N'D�finition des caract�ristiques des t�ches d�interaction', 3, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (189, N'V�rification de la coh�rence entre les modalit�s et les t�ches', 4, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (190, N'Prise en consid�ration des caract�ristiques des utilisatrices et des utilisateurs', 1, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (191, N'Prise en consid�ration des caract�ristiques de l�interaction', 2, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (192, N'Prise en consid�ration des caract�ristiques des exigences d�ergonomie', 3, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (193, N'Prise en consid�ration des contraintes de fiabilit�, de co�t et de maintenance', 4, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (194, N'Interpr�tation correcte des fiches techniques des produits offerts sur le march�', 5, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (195, N'�tablissement des actions et des exceptions li�es aux t�ches', 1, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (196, N'D�termination des �l�ments de pr�sentation des actions et des exceptions', 2, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (197, N'Organisation spatiale appropri�e des �l�ments', 3, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (198, N'D�termination des caract�ristiques de pr�sentation des �l�ments', 4, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (199, N'Organisation de l�interface conforme aux crit�res d�esth�tisme et d�efficacit�', 5, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (200, N'Consignation de l�information relative � l�interface', 6, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (201, N'Cr�ation des �l�ments selon les caract�ristiques de pr�sentation choisies', 1, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (202, N'Positionnement des �l�ments selon l�organisation spatiale retenue', 2, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (203, N'�tablissement des liens entre les �l�ments et les programmes de l�application', 3, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (204, N'Validation du fonctionnement de l�interface', 4, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (205, N'D�termination correcte des principales t�ches et de leur s�quence', 1, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (206, N'Estimation du temps n�cessaire � l�ex�cution des principales t�ches', 2, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (207, N'Prise en consid�ration des �ch�ances �tablies pour l�ex�cution du travail', 3, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (208, N'�tablissement correct de priorit�s', 1, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (209, N'Prise en consid�ration des points critiques', 2, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (210, N'Pr�vision d�une marge de man�uvre suffisante pour faire face aux impr�vus', 3, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (211, N'Utilisation appropri�e des m�thodes et des outils de planification', 4, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (212, N'�tablissement d�un calendrier des travaux r�aliste', 5, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (213, N'D�termination correcte des ressources humaines et mat�rielles n�cessaires � l�ex�cution du travail', 6, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (214, N'Communication efficace avec les personnes en cause', 7, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (215, N'Pr�sentation correcte du plan de travail pour approbation', 8, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (216, N'Utilisation d�une m�thode appropri�e de suivi des activit�s', 1, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (217, N'Gestion efficace du temps', 2, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (218, N'Respect du calendrier des travaux', 3, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (219, N'Adaptation r�guli�re du calendrier des travaux en fonction des impr�vus', 4, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (220, N'D�termination juste du support n�cessaire', 1, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (221, N'S�lection et utilisation correcte du logiciel de cr�ation du document', 2, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (222, N'�tablissement juste du plan de travail pour le document � produire', 1, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (223, N'Pr�paration appropri�e des �l�ments de contenu', 2, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (224, N'Application rigoureuse des r�gles grammaticales et orthographiques', 3, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (225, N'�tablissement correct du format de mise en page', 4, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (226, N'Adaptation correcte du niveau de langage en fonction du public cible', 5, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (227, N'Clart� du texte', 6, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (228, N'Utilisation efficace des logiciels de bureautique et de multim�dia', 7, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (229, N'Respect des normes de mise en page', 8, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (230, N'S�lection des �l�ments qui n�cessitent de l�aide en ligne', 1, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (231, N'Respect des normes de pr�sentation', 2, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (232, N'Application rigoureuse des r�gles grammaticales et orthographiques', 3, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (233, N'Adaptation correcte du niveau de langage en fonction du public cible', 4, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (234, N'Utilisation correcte du logiciel de cr�ation d�aide en ligne', 5, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (235, N'Facilit� d�utilisation de l�aide en ligne', 6, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (236, N'V�rification de la coh�rence de l�aide en ligne', 7, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (237, N'Prise en consid�ration des objectifs d�apprentissage en fonction du public cible et du contexte de formation', 1, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (238, N'Pr�paration appropri�e des �l�ments de contenu', 2, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (239, N'Utilisation correcte des outils de production du document', 3, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (240, N'Respect des normes de pr�sentation', 4, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (241, N'Application rigoureuse des r�gles grammaticales et orthographiques', 5, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (242, N'Adaptation correcte du niveau de langage en fonction du public cible', 6, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (243, N'V�rification minutieuse du document', 7, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (244, N'�tablissement juste de la liste de diffusion', 1, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (245, N'S�lection et utilisation du mode de diffusion', 2, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (246, N'V�rification syst�matique de la r�ception', 3, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (247, N'Respect des r�gles de conservation d�un document', 1, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (248, N'Attribution pr�cise d�un code � partir du plan de classification', 2, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (249, N'Pr�cision et concision du titre d�un document selon les normes', 3, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (250, N'Consignation minutieuse de l�information dans l�outil de rep�rage', 4, NULL, 58)
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
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (221, 'M�canique du b�timent')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (222, 'Am�nagement et urbanisme')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (235, 'G�nie m�canique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (241, 'G�nie m�canique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (243, '�lectronique')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (260, 'Environnement, hygi�ne')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (300, 'Sciences humaines')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (322, '�ducation � l''enfance')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (351, '�ducation sp�cialis�e')
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
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (582, 'Int�gration multim�dia')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (589, 'Art et technologie des m�dias')
GO
INSERT [dbo].[EnteteProgramme] ([codeProgramme], [commentaire]) VALUES (700, 'Sciences, lettres et arts')
GO
-- Insertion des programmes
INSERT INTO Programme (annee, codeSpecialisation, nbUnite, nom, specialisation, nbHeurefrmGenerale, nbHeurefrmSpecifique, condition, sanction, commentaire, docMinistere_path, dateValidation, codeProgramme) VALUES
('2001','AA','91 2/3', 'Informatique', 'Informatique de gestion', '660', '1980', 'Math�matique 526/Math�matique 536', 'Dipl�me d��tudes coll�giales', NULL, NULL, NULL, '420'),
('2000','A1',NULL,'Int�gration multim�dia',NULL,NULL,NULL,NULL,'Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'582'),
('2001','A0',NULL,'Soins infirmiers',NULL,NULL,NULL,'Math�matique 536','Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'180'),
('2000','C0',NULL,'G�nie Chimique',NULL,NULL,NULL,'Math�matique 526','Dipl�me d��tudes coll�giales',NULL,NULL,NULL,'210')
GO
--select * from EnteteProgramme
--select * from tblProgramme
SET IDENTITY_INSERT EnonceCompetence ON
GO
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (1, N'016N', N'Analyser les fonctions de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (2, N'016P', N'R�soudre des probl�mes math�matiques et
statistiques en informatique', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (3, N'016Q', N'Mettre � profit les possibilit�s d''un syst�me
d''exploitation propre � une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (4, N'016R', N'Installer des �l�ments physiques et logiques
dans une station de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (5, N'016S', N'Exploiter un langage de programmation
structur�e', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (6, N'016T', N'Appliquer une approche de d�veloppement par
objets', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (7, N'016U', N'Effectuer la recherche d�information', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (8, N'026V', N'Interagir et communiquer dans des situations de
travail vari�es', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (9, N'016W', N'Produire des algorithmes', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (10, N'016X', N'Produire une interface utilisateur', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (11, N'016Y', N'Planifier et g�rer des activit�s de travail', NULL, 1, 1, NULL, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [enonceCompetence], [motClef], [obligatoire], [actif], [commentaire], [idProgramme]) VALUES (12, N'016Z', N'Assurer la production et la gestion de
documents', NULL, 1, 1, NULL, 1)
SET IDENTITY_INSERT EnonceCompetence OFF
GO
SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (1, N'Caract�riser les fonctions de travail et leurs conditions d''exercise', 1, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (2, N'Examiner les t�ches et les op�rations li�es aux fonctions de travail', 2, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (3, N'Examiner les habilet�s et les comportements n�cessaire a l''exercice des fonctions de travail.', 3, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (4, N'Examiner la r�glementation relative � l''exercice de la profession en g�n�ral', 4, NULL, NULL, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (5, N'Effectuer des traitements sur des donn�es
internes de l�ordinateur', 1, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (6, N'Effectuer des op�rations logiques', 2, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (7, N'Organiser et traiter de l�information', 3, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (8, N'R�soudre des probl�mes de
programmation lin�aire', 4, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (9, N'R�soudre des probl�mes de
d�nombrement', 5, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (10, N'R�soudre des probl�mes de probabilit� et
de statistique', 6, NULL, NULL, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (11, N'Exploiter un syst�me de fichiers', 1, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (12, N'Automatiser des t�ches', 2, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (13, N'Utiliser les m�canismes de gestion de la
m�moire', 3, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (14, N'Personnaliser l''environnement de la station
de travail', 4, NULL, NULL, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (15, N'Analyser l''architecture interne de
l''ordinateur', 1, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (16, N'Planifier le travail', 2, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (17, N'Prot�ger l''environnement de la station de
travail', 3, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (18, N'Installer des �l�ments physiques', 4, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (19, N'D�sinstaller des �l�ments physiques', 5, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (20, N'Installer des �l�ments logiques', 6, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (21, N'D�sinstaller des �l�ments logiques', 7, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (22, N'V�rifier l''installation de la station de
travail dans l''environnement de
l''utilisatrice et de l''utilisateur', 8, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (23, N'Consigner l''information sur l''installation', 9, NULL, NULL, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (24, N'Pr�parer l�environnement de
programmation.', 1, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (25, N'Adapter l�algorithme aux contraintes du
langage de programmation.', 2, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (26, N'Traduire l�algorithme dans le langage de
programmation.', 3, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (27, N'Compiler le programme', 4, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (28, N'Valider le programme', 5, NULL, NULL, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (29, N'Cr�er un mod�le objet', 1, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (30, N'Perfectionner le mod�le objet', 2, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (31, N'Proc�der � la codification d�une classe', 3, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (32, N'Valider le fonctionnement d�une classe', 4, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (33, N'G�n�rer la version ex�cutable du
programme', 5, NULL, NULL, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (34, N'Pr�ciser le besoin d�information', 1, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (35, N'S�lectionner et utiliser les sources de
recherche', 2, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (36, N'Consulter et extraire l�information
n�cessaire', 3, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (37, N'Consigner les r�sultats de la recherche', 4, NULL, NULL, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (38, N'�tablir et entretenir des relations
interpersonnelles', 1, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (39, N'Communiquer avec des personnes �
l�interne et � l�externe', 2, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (40, N'Travailler au sein d�une �quipe
multidisciplinaire', 3, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (41, N'Appliquer une approche client', 4, NULL, NULL, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (42, N'Analyser la situation', 1, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (43, N'Mettre au point l''algorithme', 2, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (44, N'Valider l''algorithme', 3, NULL, NULL, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (45, N'Analyser les caract�ristiques des
utilisatrices et des utilisateurs', 1, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (46, N'�tablir les caract�ristiques d�interaction', 2, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (47, N'Choisir des p�riph�riques d�entr�e et de
sortie', 3, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (48, N'Planifier l�organisation globale de
l�interface', 4, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (49, N'Proc�der � la programmation de l�interface
utilisateur', 5, NULL, NULL, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (50, N'Analyser les caract�ristiques du travail �
effectuer', 1, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (51, N'Proc�der � la planification des activit�s', 2, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (52, N'Assurer le suivi des activit�s de travail', 3, NULL, NULL, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (53, N'Choisir le support du document', 1, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (54, N'Produire un document technique et
administratif', 2, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (55, N'Produire l�aide en ligne', 3, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (56, N'Produire un document de formation', 4, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (57, N'Diffuser un document', 5, NULL, NULL, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [element], [numero], [motClef], [commentaire], [idCompetence]) VALUES (58, N'Classer un document', 6, NULL, NULL, 12)
SET IDENTITY_INSERT ElementCompetence OFF
GO
SET IDENTITY_INSERT ContexteRealisation ON
GO
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (1, N'a l''aide d''une information r�cente sur les fonctions de travail suivantes : - programeuse-analyste et programeur-analyste dans les domaine de la gestion et de l''indutrie', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (2, N'� l''aide d''une information r�cente sur les entreprses dans lesquelles on trouve la programeuse-analyste et le programmeur-analyste et la et le gestionnaire de r�seaux informatique', NULL, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (3, N'� partir de situations propres au domaine de l''informatique', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (4, N'� partir d''une station de travail et d�un logiciel de statistiques', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (5, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (6, N'Dans des environnements utilisant des syst�mes d�exploitation vari�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (7, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (8, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (9, N'� partir des normes et des exigences de l''entreprise', NULL, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (10, N'En atelier et sur le lieu de travail de l''utilisatrice et de l''utilisateur', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (11, N'� partir d''une demande pr�autoris�e pr�cisant la nature de l''installation', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (12, N'� partir d''une station de travail', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (13, N'� l''aide des �l�ments physiques et logiques � installer et des outils appropri�s', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (14, N'� partir des normes et des exigences de l''entreprise', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (15, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (16, N'� partir d�une station de travail et des logiciels appropri�s', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (17, N'� partir d�algorithmes valides et repr�sentatifs du milieu de travail', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (18, N'� partir des normes et des exigences de l�entreprise', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (19, N'� l�aide des manuels de r�f�rences techniques appropri�s � l�environnement de programmation', NULL, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (20, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (21, N'� partir de situations repr�sentatives du milieu du travail et n�cessitant le d�veloppement d�applications comportant un nombre limit� de classes', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (22, N'� partir des normes et des exigences de l''entreprise', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (23, N'� l�aide de toute la documentation disponible sur les applications � d�velopper', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (24, N'� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (25, N'� partir de besoins d�information pr�cis propres au milieu de travail', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (26, N'� partir de besoins d�information li�s � la veille technologique', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (27, N'� partir d�une station de travail et des logiciels appropri�s', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (28, N'� l�aide de manuels de r�f�rences en fran�ais et en anglais', NULL, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (29, N'Dans des situations de travail vari�es', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (30, N'En pr�sence des personnes en cause', NULL, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (31, N'� partir de situations vari�es repr�sentatives du milieu de travail', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (32, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (33, N'� partir des exigences de l''entreprise', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (34, N'� l�aide des manuels de r�f�rences techniques appropri�s', NULL, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (35, N'� partir d''une station de travail et des logiciels appropri�s', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (36, N'� partir d�applications vari�es n�cessitant la cr�ation d�interfaces', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (37, N'� partir des manuels de r�f�rences techniques appropri�s', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (38, N'� partir des exigences de l''entreprise et des standards de l�informatique', NULL, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (39, N'Dans des situations de travail propres � la profession', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (40, N'� l�aide des outils de planification appropri�s', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (41, N'� partir des exigences de l''entreprise', NULL, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (42, N'Pour des documents en fran�ais et en anglais', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (43, N'� partir d�une station de travail et des logiciels de bureautique, de multim�dia et de cr�ation d�aide en ligne', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (44, N'� l�aide de dictionnaires, de grammaires et d�outils de r�f�rence vari�s', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (45, N'� l�aide de l�inforoute et des services de t�l�communication', NULL, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [contexteRealisation], [commentaire], [idCompetence]) VALUES (46, N'� partir des exigences de l�entreprise', NULL, 12)
SET IDENTITY_INSERT ContexteRealisation OFF
GO
SET IDENTITY_INSERT CriterePerformance ON
GO
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (1, N'Pertinence de l�information recueillie', 1, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (2, N'Examen complet des caract�ristiques g�n�rales des fonctions de travail et de leurs conditions d�exercice', 2, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (3, N'Reconnaissance des possibilit�s d�exercice des professions en entreprise et de pratique entrepreneuriale dans le domaine de l�informatique', 3, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (4, N'Reconnaissance des effets, sur le travail, de l��volution technologique rapide dans le domaine de l�informatique', 4, NULL, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (5, N'Examen complet des op�rations, ainsi que des conditions d�ex�cution et des crit�res de performance des t�ches associ�s aux diff�rentes fonctions de travail', 1, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (6, N'D�termination exacte de l�importance relative des activit�s', 2, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (7, N'Mise en relation des �tapes du processus de travail avec les t�ches des fonctions de travail', 3, NULL, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (8, N'Pertinence des liens �tablis entre les habilet�s et comportements et les diff�rentes t�ches des fonctions de travail', 1, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (9, N'Examen complet des exigences li�es � l��thique professionnelle', 2, NULL, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (10, N'Reconnaissance des droits et des responsabilit�s des personnes dans les relations employeur-employ� et client-fournisseur', 1, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (11, N'Reconnaissance des cons�quences des manquements aux lois et r�glements', 2, NULL, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (12, N'Repr�sentation correcte de nombres dans diff�rentes bases', 1, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (13, N'Conversion correcte de nombres d�une base � une autre', 2, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (14, N'Ex�cution correcte des op�rations arithm�tiques dans diff�rentes bases', 3, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (15, N'Repr�sentation juste de donn�es dans la m�moire de l�ordinateur', 4, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (16, N'Interpr�tation juste des limites de repr�sentation des donn�es dans la m�moire de l�ordinateur', 5, NULL, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (17, N'Formulation de propositions appropri�es � diff�rentes situations', 1, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (18, N'Construction d�une table de v�rit� conforme � une proposition', 2, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (19, N'Simplification correcte d�une proposition', 3, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (20, N'Utilisation appropri�e de la m�thode de preuve par induction', 4, NULL, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (21, N'Construction d�ensembles et de sous-ensembles appropri�s � diff�rentes situations', 1, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (22, N'Ex�cution correcte de toutes les op�rations dans les ensembles', 2, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (23, N'�tablissement de relations justes entre des ensembles', 3, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (24, N'Formulation de propositions appropri�es et dans leur forme la plus simple en vue de traiter l�information dans une situation donn�e', 4, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (25, N'Traduction correcte des propositions en langage ensembliste', 5, NULL, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (26, N'Repr�sentation d�une situation sous forme d�un syst�me d��quations lin�aires appropri�', 1, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (27, N'Ex�cution correcte des op�rations dans les matrices', 2, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (28, N'Repr�sentation juste d�un syst�me d��quations lin�aires sous forme matricielle', 3, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (29, N'Application correcte de m�thodes de r�solution de probl�mes d�un syst�me d��quations lin�aires', 4, NULL, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (30, N'Calcul exact du nombre de permutations dans un contexte donn�', 1, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (31, N'Calcul exact du nombre d�arrangements dans un contexte donn�', 2, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (32, N'Calcul exact du nombre de combinaisons dans un contexte donn�', 3, NULL, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (33, N'Calcul des probabilit�s d��v�nements li�es aux lois binomiale, normale et de Poisson', 1, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (34, N'D�termination de la nature des variables appropri�es � une situation donn�e', 2, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (35, N'Choix d��chelles de mesure appropri�es � une situation donn�e', 3, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (36, N'Choix des mesures statistiques appropri�es � une situation donn�e', 4, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (37, N'Choix judicieux du mode de repr�sentation de l�information', 5, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (38, N'Application rigoureuse des normes de pr�sentation des tableaux et des graphiques', 6, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (39, N'Utilisation efficace des fonctionnalit�s d�un logiciel de statistiques', 7, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (40, N'Choix des m�thodes d��chantillonnage appropri�es � une situation donn�e', 8, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (41, N'Estimation par intervalle d�une moyenne et d�une proportion pour des grands �chantillons', 9, NULL, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (42, N'Comparaison des possibilit�s et des limites des syst�mes de fichiers de diff�rents syst�mes d''exploitation', 1, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (43, N'Utilisation correcte des commandes de manipulation des fichiers', 2, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (44, N'Utilisation correcte des commandes de manipulation des r�pertoires', 3, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (45, N'Utilisation correcte des commandes visant � assurer la s�curit� des fichiers et des r�pertoires', 4, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (46, N'Utilisation correcte des outils visant le stockage et l''int�grit� des donn�es', 5, NULL, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (47, N'Analyse judicieuse des possibilit�s et des limites des diff�rents syst�mes d''exploitation au regard de l''ex�cution des t�ches', 1, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (48, N'Utilisation correcte du langage de commande propre au syst�me d''exploitation', 2, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (49, N'Utilisation appropri�e des commandes en vue d��tablir l�ordre de priorit� des t�ches', 3, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (50, N'Adaptation appropri�e des param�tres de s�curit� aux exigences des t�ches', 4, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (51, N'Application des techniques de d�bogage appropri�es au syst�me d''exploitation', 5, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (52, N'Consignation des commentaires pertinents', 6, NULL, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (53, N'Analyse judicieuse des possibilit�s et des limites des diff�rents syst�mes d''exploitation au regard de la gestion de la m�moire', 1, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (54, N'Allocation de la m�moire appropri�e aux besoins relatifs � l''ex�cution d''une t�che', 2, NULL, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (55, N'Comparaison des diff�rents types de fichiers de configuration propres au syst�me d''exploitation', 1, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (56, N'Utilisation correcte des commandes de configuration de base du poste de travail', 2, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (57, N'Utilisation correcte des commandes de d�marrage et de configuration des p�riph�riques', 3, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (58, N'D�marrage des programmes appropri�s aux besoins de l''utilisatrice et de l''utilisateur', 4, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (59, N'Adaptation des param�tres de configuration de l''environnement de travail aux exigences de l''utilisatrice et de l''utilisateur', 5, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (60, N'Consignation pr�cise des param�tres de personnalisation', 6, NULL, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (61, N'Distinction et rep�rage des �l�ments de la carte ma�tresse', 1, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (62, N'Reconnaissance des caract�ristiques et des fonctions propres aux processeurs, aux m�moires, aux bus et aux horloges', 2, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (63, N'Reconnaissance des caract�ristiques et des fonctions propres aux diff�rents ports de communication', 3, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (64, N'Reconnaissance des relations entre les diff�rents �l�ments', 4, NULL, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (65, N'Analyse judicieuse de la demande', 1, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (66, N'Pr�paration du mat�riel n�cessaire', 2, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (67, N'D�termination juste de la s�quence des op�rations', 3, NULL, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (68, N'Consignation compl�te de la configuration physique initiale', 1, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (69, N'Copie de l''ensemble des donn�es', 2, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (70, N'Prise des mesures de s�curit� appropri�es', 3, NULL, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (71, N'Interpr�tation correcte des fiches techniques', 1, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (72, N'D�termination appropri�e de chacun des param�tres d''installation', 2, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (73, N'Installation de l''�l�ment � l''endroit appropri�', 3, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (74, N'Configuration conforme � l''environnement du poste', 4, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (75, N'V�rification appropri�e du fonctionnement de l''�l�ment', 5, NULL, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (76, N'Interpr�tation judicieuse de l�information technique', 1, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (77, N'Respect du processus de d�sinstallation en fonction de l��l�ment � retirer', 2, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (78, N'Prise des pr�cautions appropri�es', 3, NULL, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (79, N'Interpr�tation judicieuse de l''information technique', 1, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (80, N'D�marrage appropri� de l''installation', 2, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (81, N'Choix des param�tres d''installation en fonction de l''environnement du poste', 3, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (82, N'V�rification appropri� du fonctionnement de l''�l�ment', 4, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (83, N'Personnalisation de l''�l�ment appropri�e aux besoins de l�utilisatrice et de l''utilisateur', 5, NULL, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (84, N'Copie correcte des disques', 1, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (85, N'Interpr�tation judicieuse de l''information technique', 2, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (86, N'Utilisation appropri�e des outils de d�sinstallation', 3, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (87, N'Respect du processus de d�sinstallation manuelle', 4, NULL, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (88, N'V�rification appropri�e du fonctionnement de l''ensemble des �l�ments', 1, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (89, N'R�solution efficace des probl�mes d''installation', 2, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (90, N'Installation de la station de travail conforme aux principes de l''ergonomie', 3, NULL, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (91, N'Prise en note de la nouvelle configuration', 1, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (92, N'R�daction claire et correcte des probl�mes �prouv�s et des solutions apport�es', 2, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (93, N'Mise � jour pr�cise de l''inventaire', 3, NULL, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (94, N'V�rification m�thodique de l�acc�s aux diff�rents �l�ments physiques et logiques de l�environnement', 1, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (95, N'Configuration de l�environnement appropri�e aux caract�ristiques de la situation', 2, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (96, N'Personnalisation de l�environnement efficace et conforme aux exigences de l�entreprise', 3, NULL, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (97, N'Modification appropri�e de la repr�sentation des donn�es', 1, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (98, N'Adaptation correcte des conditions d�ex�cution', 2, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (99, N'Modification appropri�e des structures de traitement', 3, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (100, N'Adaptation appropri�e de la s�quence des op�rations', 4, NULL, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (101, N'Utilisation efficace des fonctionnalit�s d��dition de l�environnement', 1, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (102, N'Application des r�gles de syntaxe et de s�mantique propres au langage utilis�', 2, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (103, N'Application rigoureuse des standards de codification', 3, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (104, N'Application judicieuse des principes de la programmation structur�e', 4, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (105, N'Mise � profit judicieuse des possibilit�s du langage', 5, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (106, N'Consignation des commentaires pertinents et conformes aux exigences de l�entreprise', 6, NULL, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (107, N'Utilisation efficace des fonctionnalit�s de compilation de l�environnement', 1, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (108, N'Rep�rage des erreurs de compilation', 2, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (109, N'Correction des erreurs de compilation', 3, NULL, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (110, N'Utilisation efficace des fonctionnalit�s d�ex�cution et de d�bogage de l�environnement', 1, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (111, N'Pr�paration correcte des jeux d�essai n�cessaires � la v�rification du fonctionnement du programme', 2, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (112, N'Interpr�tation juste des r�sultats', 3, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (113, N'D�bogage appropri� du programme selon l�algorithme', 4, NULL, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (114, N'�tablissement complet des domaines d�application', 1, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (115, N'D�termination des classes pertinentes', 2, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (116, N'�tablissement des relations hi�rarchiques appropri�es entre les classes', 3, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (117, N'D�termination des services de chacune des classes', 4, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (118, N'D�termination des attributs pertinents compte tenu de chacune des classes', 5, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (119, N'Repr�sentation graphique appropri�e du mod�le objet', 6, NULL, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (120, N'Mise au point de la s�quence des op�rations propres aux diff�rents services de la classe', 1, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (121, N'Repr�sentation graphique appropri�e du mod�le s�quentiel', 2, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (122, N'Modification appropri�e du mod�le objet', 3, NULL, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (123, N'Pr�paration appropri�e de l''environnement de programmation', 1, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (124, N'D�claration et d�finition de la classe respectant les r�gles de syntaxe et de s�mantique du langage', 2, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (125, N'Exploitation judicieuse des possibilit�s du langage dans l''application des principes d''encapsulation, d''h�ritage et de polymorphisme', 3, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (126, N'Application rigoureuse des standards de nomenclature et de documentation reconnus propres � l''entreprise', 4, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (127, N'Rep�rage et correction des erreurs de compilation de la classe', 5, NULL, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (128, N'Pr�paration correcte des jeux d''essai n�cessaires � la v�rification du bon fonctionnement de tous les services de la classe', 1, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (129, N'Cr�ation d''un environnement de test appropri�', 2, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (130, N'Interpr�tation juste des r�sultats', 3, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (131, N'D�bogage appropri� de la classe', 4, NULL, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (132, N'Utilisation des m�canismes de g�n�ration propres � l�outil employ�', 1, NULL, 33)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (133, N'Pr�cision juste du besoin de recherche', 1, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (134, N'D�termination des crit�res permettant de choisir correctement les sources de la recherche', 2, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (135, N'Manifestation d�initiative', 3, NULL, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (136, N'S�lection judicieuse des sources en fonction de la nature et des crit�res de la recherche', 1, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (137, N'Utilisation correcte et efficace des m�thodes et des outils de recherche conventionnels et informatiques', 2, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (138, N'Prise en consid�ration des risques de s��loigner du besoin initial', 3, NULL, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (139, N'Pertinence de l�information consult�e', 1, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (140, N'Interpr�tation juste de l�information en fran�ais et en anglais', 2, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (141, N'Pertinence de l�information extraite en fonction du besoin initial', 3, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (142, N'Manifestation de curiosit�', 4, NULL, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (143, N'Clart�, pr�cision et pertinence de l�information consign�e', 1, NULL, 37)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (144, N'Prise en consid�ration de ses forces et de ses faiblesses en mati�re de relations interpersonnelles', 1, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (145, N'Manifestation d�attitudes favorisant des relations interpersonnelles harmonieuses', 2, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (146, N'Application rigoureuse des r�gles de politesse et de courtoisie', 3, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (147, N'Adaptation de son approche selon les personnes et les situations', 4, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (148, N'Utilisation appropri�e des techniques de gestion des conflits interpersonnels', 5, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (149, N'Manifestation de comportements conformes � l��thique professionnelle', 6, NULL, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (150, N'Manifestation d�une attitude d��coute et de r�ceptivit�', 1, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (151, N'Adaptation du niveau de langage selon l�interlocutrice et l�interlocuteur', 2, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (152, N'Application correcte des techniques de communication verbale et non verbale', 3, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (153, N'Utilisation appropri�e des techniques de n�gociation et d�argumentation', 4, NULL, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (154, N'Distinction juste du r�le et des responsabilit�s des membres de l��quipe', 1, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (155, N'Prise de ses responsabilit�s au sein de l��quipe', 2, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (156, N'Contribution active aux activit�s de l��quipe', 3, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (157, N'Utilisation appropri�e des techniques de n�gociation et d�argumentation', 4, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (158, N'Manifestation d�attitudes favorisant le travail d��quipe', 5, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (159, N'Respect du mode d�action �tabli par l��quipe', 6, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (160, N'Respect des d�cisions prises par les membres de l��quipe', 7, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (161, N'Contribution efficace � la r�solution des probl�mes �prouv�s par les membres de l��quipe', 8, NULL, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (162, N'Interpr�tation juste des besoins', 1, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (163, N'Manifestation d�un souci constant de r�pondre aux besoins des clientes et des clients', 2, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (164, N'V�rification r�guli�re de la satisfaction des clientes et des clients', 3, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (165, N'R�action appropri�e devant les probl�mes soulev�s par les clientes et les clients', 4, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (166, N'Manifestation d�un souci constant d�am�liorer la qualit� des services et des produits', 5, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (167, N'Manifestation de comportements conformes � l��thique professionnelle', 6, NULL, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (168, N'�tablissement correcte des donn�es d''entr�e', 1, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (169, N'�tablissement correcte des donn�es de sortie', 2, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (170, N'�tablissement correcte de la nature des traitements', 3, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (171, N'D�termination correcte des conditions d�ex�cution de l''algorithme', 4, NULL, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (172, N'Choix d�un mode de repr�sentation de l''algorithme conforme aux exigences de l''entreprise', 1, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (173, N'D�termination d''une s�quence logique des op�rations', 2, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (174, N'D�termination des structures de traitement appropri�es � chacune des op�rations', 3, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (175, N'Application rigoureuse des r�gles de syntaxe propres au mode de repr�sentation retenu', 4, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (176, N'Recherche d''une solution algorithmique efficace', 5, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (177, N'Repr�sentation pr�cise de la solution algorithmique retenue', 6, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (178, N'Pr�sence de toute l''information n�cessaire � l''interpr�tation de l''algorithme', 7, NULL, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (179, N'V�rification de la pertinence de la solution compte tenu de la situation initiale', 1, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (180, N'D�termination des erreurs et des lacunes de la solution algorithmique mise au point', 2, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (181, N'Modification appropri�e de la solution algorithmique', 3, NULL, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (182, N'Examen des caract�ristiques des utilisatrices et des utilisateurs li�es � l��ge, � la culture et � la scolarisation', 1, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (183, N'D�termination du degr� de familiarit� avec l�informatique en g�n�ral et avec l�application � utiliser', 2, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (184, N'D�termination du degr� de r�ceptivit� des utilisatrices et des utilisateurs par rapport � l�application � utiliser', 3, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (185, N'Pr�cision des attentes des utilisatrices et des utilisateurs', 4, NULL, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (186, N'Reconnaissance des caract�ristiques de l�environnement physique', 1, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (187, N'D�termination des modalit�s d�interaction', 2, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (188, N'D�finition des caract�ristiques des t�ches d�interaction', 3, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (189, N'V�rification de la coh�rence entre les modalit�s et les t�ches', 4, NULL, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (190, N'Prise en consid�ration des caract�ristiques des utilisatrices et des utilisateurs', 1, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (191, N'Prise en consid�ration des caract�ristiques de l�interaction', 2, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (192, N'Prise en consid�ration des caract�ristiques des exigences d�ergonomie', 3, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (193, N'Prise en consid�ration des contraintes de fiabilit�, de co�t et de maintenance', 4, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (194, N'Interpr�tation correcte des fiches techniques des produits offerts sur le march�', 5, NULL, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (195, N'�tablissement des actions et des exceptions li�es aux t�ches', 1, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (196, N'D�termination des �l�ments de pr�sentation des actions et des exceptions', 2, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (197, N'Organisation spatiale appropri�e des �l�ments', 3, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (198, N'D�termination des caract�ristiques de pr�sentation des �l�ments', 4, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (199, N'Organisation de l�interface conforme aux crit�res d�esth�tisme et d�efficacit�', 5, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (200, N'Consignation de l�information relative � l�interface', 6, NULL, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (201, N'Cr�ation des �l�ments selon les caract�ristiques de pr�sentation choisies', 1, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (202, N'Positionnement des �l�ments selon l�organisation spatiale retenue', 2, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (203, N'�tablissement des liens entre les �l�ments et les programmes de l�application', 3, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (204, N'Validation du fonctionnement de l�interface', 4, NULL, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (205, N'D�termination correcte des principales t�ches et de leur s�quence', 1, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (206, N'Estimation du temps n�cessaire � l�ex�cution des principales t�ches', 2, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (207, N'Prise en consid�ration des �ch�ances �tablies pour l�ex�cution du travail', 3, NULL, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (208, N'�tablissement correct de priorit�s', 1, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (209, N'Prise en consid�ration des points critiques', 2, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (210, N'Pr�vision d�une marge de man�uvre suffisante pour faire face aux impr�vus', 3, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (211, N'Utilisation appropri�e des m�thodes et des outils de planification', 4, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (212, N'�tablissement d�un calendrier des travaux r�aliste', 5, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (213, N'D�termination correcte des ressources humaines et mat�rielles n�cessaires � l�ex�cution du travail', 6, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (214, N'Communication efficace avec les personnes en cause', 7, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (215, N'Pr�sentation correcte du plan de travail pour approbation', 8, NULL, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (216, N'Utilisation d�une m�thode appropri�e de suivi des activit�s', 1, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (217, N'Gestion efficace du temps', 2, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (218, N'Respect du calendrier des travaux', 3, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (219, N'Adaptation r�guli�re du calendrier des travaux en fonction des impr�vus', 4, NULL, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (220, N'D�termination juste du support n�cessaire', 1, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (221, N'S�lection et utilisation correcte du logiciel de cr�ation du document', 2, NULL, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (222, N'�tablissement juste du plan de travail pour le document � produire', 1, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (223, N'Pr�paration appropri�e des �l�ments de contenu', 2, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (224, N'Application rigoureuse des r�gles grammaticales et orthographiques', 3, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (225, N'�tablissement correct du format de mise en page', 4, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (226, N'Adaptation correcte du niveau de langage en fonction du public cible', 5, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (227, N'Clart� du texte', 6, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (228, N'Utilisation efficace des logiciels de bureautique et de multim�dia', 7, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (229, N'Respect des normes de mise en page', 8, NULL, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (230, N'S�lection des �l�ments qui n�cessitent de l�aide en ligne', 1, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (231, N'Respect des normes de pr�sentation', 2, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (232, N'Application rigoureuse des r�gles grammaticales et orthographiques', 3, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (233, N'Adaptation correcte du niveau de langage en fonction du public cible', 4, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (234, N'Utilisation correcte du logiciel de cr�ation d�aide en ligne', 5, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (235, N'Facilit� d�utilisation de l�aide en ligne', 6, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (236, N'V�rification de la coh�rence de l�aide en ligne', 7, NULL, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (237, N'Prise en consid�ration des objectifs d�apprentissage en fonction du public cible et du contexte de formation', 1, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (238, N'Pr�paration appropri�e des �l�ments de contenu', 2, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (239, N'Utilisation correcte des outils de production du document', 3, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (240, N'Respect des normes de pr�sentation', 4, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (241, N'Application rigoureuse des r�gles grammaticales et orthographiques', 5, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (242, N'Adaptation correcte du niveau de langage en fonction du public cible', 6, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (243, N'V�rification minutieuse du document', 7, NULL, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (244, N'�tablissement juste de la liste de diffusion', 1, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (245, N'S�lection et utilisation du mode de diffusion', 2, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (246, N'V�rification syst�matique de la r�ception', 3, NULL, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (247, N'Respect des r�gles de conservation d�un document', 1, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (248, N'Attribution pr�cise d�un code � partir du plan de classification', 2, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (249, N'Pr�cision et concision du titre d�un document selon les normes', 3, NULL, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [criterePerformance], [numero], [commentaire], [idElement]) VALUES (250, N'Consignation minutieuse de l�information dans l�outil de rep�rage', 4, NULL, 58)
SET IDENTITY_INSERT CriterePerformance OFF
GO
