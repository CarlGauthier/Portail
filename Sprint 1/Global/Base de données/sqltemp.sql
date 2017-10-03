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
INSERT EnonceCompetence (idCompetence, codeCompetence, enonceCompetence, motClef, obligatoire, actif, commentaire, idProgramme) VALUES (1, '016N', 'Analyser les fonctions de travail', NULL, 1, 1, NULL, 1)
GO
INSERT EnonceCompetence (idCompetence, codeCompetence, enonceCompetence, motClef, obligatoire, actif, commentaire, idProgramme) VALUES (2, '016P', 'R�soudre des probl�mes math�matiques et statistiques en informatique', NULL, 1, 1, NULL, 1)
GO
INSERT EnonceCompetence (idCompetence, codeCompetence, enonceCompetence, motClef, obligatoire, actif, commentaire, idProgramme) VALUES (3, '016Q', 'Mettre � profit les possibilit�s d''un syst�me d''exploitation propre � une station de travail', NULL, 1, 1, NULL, 1)
GO
INSERT EnonceCompetence (idCompetence, codeCompetence, enonceCompetence, motClef, obligatoire, actif, commentaire, idProgramme) VALUES (4, '016R', 'Installer des �l�ments physiques et logiques dans une station de travail', NULL, 1, 1, NULL, 1)
GO
INSERT EnonceCompetence (idCompetence, codeCompetence, enonceCompetence, motClef, obligatoire, actif, commentaire, idProgramme) VALUES (5, '016S', 'Exploiter un langage de programmation structur�e', NULL, 1, 1, NULL, 1)
GO
INSERT EnonceCompetence (idCompetence, codeCompetence, enonceCompetence, motClef, obligatoire, actif, commentaire, idProgramme) VALUES (6, '016T', 'Appliquer une approche de d�veloppement par objets', NULL, 1, 1, NULL, 1)
GO
INSERT EnonceCompetence (idCompetence, codeCompetence, enonceCompetence, motClef, obligatoire, actif, commentaire, idProgramme) VALUES (7, '016U', 'Effectuer la recherche d''information', NULL, 1, 1, NULL, 1)
GO
INSERT EnonceCompetence (idCompetence, codeCompetence, enonceCompetence, motClef, obligatoire, actif, commentaire, idProgramme) VALUES (8, '026V', 'Interagir et communiquer dans des situations de travail vari�es', NULL, 1, 1, NULL, 1)
GO
SET IDENTITY_INSERT EnonceCompetence OFF
GO
SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (1, 'Caract�riser les fonctions de travail et leurs conditions d''exercise', 1, NULL, NULL, 1)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (2, 'Examiner les t�ches et les op�rations li�es aux fonctions de travail', 2, NULL, NULL, 1)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (3, 'Examiner les habilet�s et les comportements n�cessaire a l''exercice des fonctions de travail.', 3, NULL, NULL, 1)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (4, 'Examiner la r�glementation relative � l''exercice de la profession en g�n�ral', 4, NULL, NULL, 1)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (5, 'Effectuer des traitements sur des donn�es internes de l''ordinateur', 1, NULL, NULL, 2)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (6, 'Effectuer des op�rations logiques', 2, NULL, NULL, 2)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (7, 'Organiser et traiter de l''information', 3, NULL, NULL, 2)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (8, 'R�soudre des probl�mes de programmation lin�aire', 4, NULL, NULL, 2)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (9, 'R�soudre des probl�mes de d�nombrement', 5, NULL, NULL, 2)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (10, 'R�soudre des probl�mes de probabilit� et de statistique', 6, NULL, NULL, 2)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (11, 'Exploiter un syst�me de fichiers', 1, NULL, NULL, 3)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (12, 'Automatiser des t�ches', 2, NULL, NULL, 3)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (13, 'Utiliser les m�canismes de gestion de la m�moire', 3, NULL, NULL, 3)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (14, 'Personnaliser l''environnement de la station de travail', 4, NULL, NULL, 3)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (15, 'Analyser l''architecture interne de l''ordinateur', 1, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (16, 'Planifier le travail', 2, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (17, 'Prot�ger l''environnement de la station de travail', 3, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (18, 'Installer des �l�ments physiques', 4, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (19, 'D�sinstaller des �l�ments physiques', 5, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (20, 'Installer des �l�ments logiques', 6, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (21, 'D�sinstaller des �l�ments logiques', 7, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (22, 'V�rifier l''installation de la station de travail dans l''environnement de l''utilisatrice et de l''utilisateur', 8, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (23, 'Consigner l''information sur l''installation', 9, NULL, NULL, 4)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (24, 'Pr�parer l''environnement de programmation.', 1, NULL, NULL, 5)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (25, 'Adapter l''algorithme aux contraintes du langage de programmation.', 2, NULL, NULL, 5)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (26, 'Traduire l''algorithme dans le langage de programmation.', 3, NULL, NULL, 5)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (27, 'Compiler le programme', 4, NULL, NULL, 5)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (28, 'Valider le programme', 5, NULL, NULL, 5)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (29, 'Cr�er un mod�le objet', 1, NULL, NULL, 6)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (30, 'Perfectionner le mod�le objet', 2, NULL, NULL, 6)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (31, 'Proc�der � la codification d''une classe', 3, NULL, NULL, 6)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (32, 'Valider le fonctionnement d''une classe', 4, NULL, NULL, 6)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (33, 'G�n�rer la version ex�cutable du programme', 5, NULL, NULL, 6)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (34, 'Pr�ciser le besoin d''information', 1, NULL, NULL, 7)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (35, 'S�lectionner et utiliser les sources de recherche', 2, NULL, NULL, 7)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (36, 'Consulter et extraire l''information n�cessaire', 3, NULL, NULL, 7)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (37, 'Consigner les r�sultats de la recherche', 4, NULL, NULL, 7)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (38, '�tablir et entretenir des relations interpersonnelles', 1, NULL, NULL, 8)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (39, 'Communiquer avec des personnes � l''interne et � l''externe', 2, NULL, NULL, 8)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (40, 'Travailler au sein d''une �quipe multidisciplinaire', 3, NULL, NULL, 8)
GO
INSERT ElementCompetence (idElement, element, numero, motClef, commentaire, idCompetence) VALUES (41, 'Appliquer une approche client', 4, NULL, NULL, 8)
GO
SET IDENTITY_INSERT ElementCompetence OFF
GO
SET IDENTITY_INSERT ContexteRealisation ON
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (1, 'a l''aide d''une information r�cente sur les fonctions de travail suivantes : - programeuse-analyste et programeur-analyste dans les domaine de la gestion et de l''indutrie', NULL, 1)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (2, '� l''aide d''une information r�cente sur les entreprses dans lesquelles on trouve la programeuse-analyste et le programmeur-analyste et la et le gestionnaire de r�seaux informatique', NULL, 1)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (3, '� partir de situations propres au domaine de l''informatique', NULL, 2)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (4, '� partir d''une station de travail et d''un logiciel de statistiques', NULL, 2)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (5, '� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 2)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (6, 'Dans des environnements utilisant des syst�mes d''exploitation vari�s', NULL, 3)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (7, '� partir d''une station de travail et des logiciels appropri�s', NULL, 3)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (8, '� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 3)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (9, '� partir des normes et des exigences de l''entreprise', NULL, 3)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (10, 'En atelier et sur le lieu de travail de l''utilisatrice et de l''utilisateur', NULL, 4)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (11, '� partir d''une demande pr�autoris�e pr�cisant la nature de l''installation', NULL, 4)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (12, '� partir d''une station de travail', NULL, 4)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (13, '� l''aide des �l�ments physiques et logiques � installer et des outils appropri�s', NULL, 4)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (14, '� partir des normes et des exigences de l''entreprise', NULL, 4)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (15, '� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 4)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (16, '� partir d''une station de travail et des logiciels appropri�s', NULL, 5)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (17, '� partir d''algorithmes valides et repr�sentatifs du milieu de travail', NULL, 5)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (18, '� partir des normes et des exigences de l''entreprise', NULL, 5)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (19, '� l''aide des manuels de r�f�rences techniques appropri�s � l''environnement de programmation', NULL, 5)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (20, '� partir d''une station de travail et des logiciels appropri�s', NULL, 6)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (21, '� partir de situations repr�sentatives du milieu du travail et n�cessitant le d�veloppement d''applications comportant un nombre limit� de classes', NULL, 6)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (22, '� partir des normes et des exigences de l''entreprise', NULL, 6)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (23, '� l''aide de toute la documentation disponible sur les applications � d�velopper', NULL, 6)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (24, '� l''aide des manuels de r�f�rences techniques appropri�s', NULL, 6)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (25, '� partir de besoins d''information pr�cis propres au milieu de travail', NULL, 7)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (26, '� partir de besoins d''information li�s � la veille technologique', NULL, 7)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (27, '� partir d''une station de travail et des logiciels appropri�s', NULL, 7)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (28, '� l''aide de manuels de r�f�rences en fran�ais et en anglais', NULL, 7)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (29, 'Dans des situations de travail vari�es', NULL, 8)
GO
INSERT ContexteRealisation (idContexte, contexteRealisation, commentaire, idCompetence) VALUES (30, 'En pr�sence des personnes en cause', NULL, 8)
GO
SET IDENTITY_INSERT ContexteRealisation OFF
GO
SET IDENTITY_INSERT CriterePerformance ON
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (1, 'Pertinence de l''information recueillie', 1, NULL, 1)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (2, 'Examen complet des caract�ristiques g�n�rales des fonctions de travail et de leurs conditions d''exercice', 2, NULL, 1)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (3, 'Reconnaissance des possibilit�s d''exercice des professions en entreprise et de pratique entrepreneuriale dans le domaine de l''informatique', 3, NULL, 1)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (4, 'Reconnaissance des effets, sur le travail, de l''�volution technologique rapide dans le domaine de l''informatique', 4, NULL, 1)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (5, 'Examen complet des op�rations, ainsi que des conditions d''ex�cution et des crit�res de performance des t�ches associ�s aux diff�rentes fonctions de travail', 1, NULL, 2)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (6, 'D�termination exacte de l''importance relative des activit�s', 2, NULL, 2)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (7, 'Mise en relation des �tapes du processus de travail avec les t�ches des fonctions de travail', 3, NULL, 2)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (8, 'Pertinence des liens �tablis entre les habilet�s et comportements et les diff�rentes t�ches des fonctions de travail', 1, NULL, 3)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (9, 'Examen complet des exigences li�es � l''�thique professionnelle', 2, NULL, 3)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (10, 'Reconnaissance des droits et des responsabilit�s des personnes dans les relations employeur-employ� et client-fournisseur', 1, NULL, 4)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (11, 'Reconnaissance des cons�quences des manquements aux lois et r�glements', 2, NULL, 4)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (12, 'Repr�sentation correcte de nombres dans diff�rentes bases', 1, NULL, 5)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (13, 'Conversion correcte de nombres d''une base � une autre', 2, NULL, 5)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (14, 'Ex�cution correcte des op�rations arithm�tiques dans diff�rentes bases', 3, NULL, 5)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (15, 'Repr�sentation juste de donn�es dans la m�moire de l''ordinateur', 4, NULL, 5)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (16, 'Interpr�tation juste des limites de repr�sentation des donn�es dans la m�moire de l''ordinateur', 5, NULL, 5)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (17, 'Formulation de propositions appropri�es � diff�rentes situations', 1, NULL, 6)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (18, 'Construction d''une table de v�rit� conforme � une proposition', 2, NULL, 6)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (19, 'Simplification correcte d''une proposition', 3, NULL, 6)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (20, 'Utilisation appropri�e de la m�thode de preuve par induction', 4, NULL, 6)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (21, 'Construction d''ensembles et de sous-ensembles appropri�s � diff�rentes situations', 1, NULL, 7)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (22, 'Ex�cution correcte de toutes les op�rations dans les ensembles', 2, NULL, 7)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (23, '�tablissement de relations justes entre des ensembles', 3, NULL, 7)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (24, 'Formulation de propositions appropri�es et dans leur forme la plus simple en vue de traiter l''information dans une situation donn�e', 4, NULL, 7)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (25, 'Traduction correcte des propositions en langage ensembliste', 5, NULL, 7)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (26, 'Repr�sentation d''une situation sous forme d''un syst�me d''�quations lin�aires appropri�', 1, NULL, 8)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (27, 'Ex�cution correcte des op�rations dans les matrices', 2, NULL, 8)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (28, 'Repr�sentation juste d''un syst�me d''�quations lin�aires sous forme matricielle', 3, NULL, 8)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (29, 'Application correcte de m�thodes de r�solution de probl�mes d''un syst�me d''�quations lin�aires', 4, NULL, 8)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (30, 'Calcul exact du nombre de permutations dans un contexte donn�', 1, NULL, 9)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (31, 'Calcul exact du nombre d''arrangements dans un contexte donn�', 2, NULL, 9)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (32, 'Calcul exact du nombre de combinaisons dans un contexte donn�', 3, NULL, 9)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (33, 'Calcul des probabilit�s d''�v�nements li�es aux lois binomiale, normale et de Poisson', 1, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (34, 'D�termination de la nature des variables appropri�es � une situation donn�e', 2, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (35, 'Choix d''�chelles de mesure appropri�es � une situation donn�e', 3, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (36, 'Choix des mesures statistiques appropri�es � une situation donn�e', 4, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (37, 'Choix judicieux du mode de repr�sentation de l''information', 5, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (38, 'Application rigoureuse des normes de pr�sentation des tableaux et des graphiques', 6, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (39, 'Utilisation efficace des fonctionnalit�s d''un logiciel de statistiques', 7, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (40, 'Choix des m�thodes d''�chantillonnage appropri�es � une situation donn�e', 8, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (41, 'Estimation par intervalle d''une moyenne et d''une proportion pour des grands �chantillons', 9, NULL, 10)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (42, 'Comparaison des possibilit�s et des limites des syst�mes de fichiers de diff�rents syst�mes d''exploitation', 1, NULL, 11)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (43, 'Utilisation correcte des commandes de manipulation des fichiers', 2, NULL, 11)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (44, 'Utilisation correcte des commandes de manipulation des r�pertoires', 3, NULL, 11)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (45, 'Utilisation correcte des commandes visant � assurer la s�curit� des fichiers et des r�pertoires', 4, NULL, 11)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (46, 'Utilisation correcte des outils visant le stockage et l''int�grit� des donn�es', 5, NULL, 11)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (47, 'Analyse judicieuse des possibilit�s et des limites des diff�rents syst�mes d''exploitation au regard de l''ex�cution des t�ches', 1, NULL, 12)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (48, 'Utilisation correcte du langage de commande propre au syst�me d''exploitation', 2, NULL, 12)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (49, 'Utilisation appropri�e des commandes en vue d''�tablir l''ordre de priorit� des t�ches', 3, NULL, 12)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (50, 'Adaptation appropri�e des param�tres de s�curit� aux exigences des t�ches', 4, NULL, 12)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (51, 'Application des techniques de d�bogage appropri�es au syst�me d''exploitation', 5, NULL, 12)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (52, 'Consignation des commentaires pertinents', 6, NULL, 12)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (53, 'Analyse judicieuse des possibilit�s et des limites des diff�rents syst�mes d''exploitation au regard de la gestion de la m�moire', 1, NULL, 13)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (54, 'Allocation de la m�moire appropri�e aux besoins relatifs � l''ex�cution d''une t�che', 2, NULL, 13)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (55, 'Comparaison des diff�rents types de fichiers de configuration propres au syst�me d''exploitation', 1, NULL, 14)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (56, 'Utilisation correcte des commandes de configuration de base du poste de travail', 2, NULL, 14)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (57, 'Utilisation correcte des commandes de d�marrage et de configuration des p�riph�riques', 3, NULL, 14)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (58, 'D�marrage des programmes appropri�s aux besoins de l''utilisatrice et de l''utilisateur', 4, NULL, 14)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (59, 'Adaptation des param�tres de configuration de l''environnement de travail aux exigences de l''utilisatrice et de l''utilisateur', 5, NULL, 14)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (60, 'Consignation pr�cise des param�tres de personnalisation', 6, NULL, 14)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (61, 'Distinction et rep�rage des �l�ments de la carte ma�tresse', 1, NULL, 15)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (62, 'Reconnaissance des caract�ristiques et des fonctions propres aux processeurs, aux m�moires, aux bus et aux horloges', 2, NULL, 15)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (63, 'Reconnaissance des caract�ristiques et des fonctions propres aux diff�rents ports de communication', 3, NULL, 15)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (64, 'Reconnaissance des relations entre les diff�rents �l�ments', 4, NULL, 15)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (65, 'Analyse judicieuse de la demande', 1, NULL, 16)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (66, 'Pr�paration du mat�riel n�cessaire', 2, NULL, 16)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (67, 'D�termination juste de la s�quence des op�rations', 3, NULL, 16)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (68, 'Consignation compl�te de la configuration physique initiale', 1, NULL, 17)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (69, 'Copie de l''ensemble des donn�es', 2, NULL, 17)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (70, 'Prise des mesures de s�curit� appropri�es', 3, NULL, 17)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (71, 'Interpr�tation correcte des fiches techniques', 1, NULL, 18)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (72, 'D�termination appropri�e de chacun des param�tres d''installation', 2, NULL, 18)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (73, 'Installation de l''�l�ment � l''endroit appropri�', 3, NULL, 18)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (74, 'Configuration conforme � l''environnement du poste', 4, NULL, 18)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (75, 'V�rification appropri�e du fonctionnement de l''�l�ment', 5, NULL, 18)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (76, 'Interpr�tation judicieuse de l''information technique', 1, NULL, 19)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (77, 'Respect du processus de d�sinstallation en fonction de l''�l�ment � retirer', 2, NULL, 19)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (78, 'Prise des pr�cautions appropri�es', 3, NULL, 19)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (79, 'Interpr�tation judicieuse de l''information technique', 1, NULL, 20)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (80, 'D�marrage appropri� de l''installation', 2, NULL, 20)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (81, 'Choix des param�tres d''installation en fonction de l''environnement du poste', 3, NULL, 20)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (82, 'V�rification appropri� du fonctionnement de l''�l�ment', 4, NULL, 20)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (83, 'Personnalisation de l''�l�ment appropri�e aux besoins de l''utilisatrice et de l''utilisateur', 5, NULL, 20)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (84, 'Copie correcte des disques', 1, NULL, 21)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (85, 'Interpr�tation judicieuse de l''information technique', 2, NULL, 21)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (86, 'Utilisation appropri�e des outils de d�sinstallation', 3, NULL, 21)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (87, 'Respect du processus de d�sinstallation manuelle', 4, NULL, 21)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (88, 'V�rification appropri�e du fonctionnement de l''ensemble des �l�ments', 1, NULL, 22)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (89, 'R�solution efficace des probl�mes d''installation', 2, NULL, 22)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (90, 'Installation de la station de travail conforme aux principes de l''ergonomie', 3, NULL, 22)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (91, 'Prise en note de la nouvelle configuration', 1, NULL, 23)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (92, 'R�daction claire et correcte des probl�mes �prouv�s et des solutions apport�es', 2, NULL, 23)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (93, 'Mise � jour pr�cise de l''inventaire', 3, NULL, 23)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (94, 'V�rification m�thodique de l''acc�s aux diff�rents �l�ments physiques et logiques de l''environnement', 1, NULL, 24)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (95, 'Configuration de l''environnement appropri�e aux caract�ristiques de la situation', 2, NULL, 24)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (96, 'Personnalisation de l''environnement efficace et conforme aux exigences de l''entreprise', 3, NULL, 24)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (97, 'Modification appropri�e de la repr�sentation des donn�es', 1, NULL, 25)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (98, 'Adaptation correcte des conditions d''ex�cution', 2, NULL, 25)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (99, 'Modification appropri�e des structures de traitement', 3, NULL, 25)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (100, 'Adaptation appropri�e de la s�quence des op�rations', 4, NULL, 25)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (101, 'Utilisation efficace des fonctionnalit�s d''�dition de l''environnement', 1, NULL, 26)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (102, 'Application des r�gles de syntaxe et de s�mantique propres au langage utilis�', 2, NULL, 26)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (103, 'Application rigoureuse des standards de codification', 3, NULL, 26)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (104, 'Application judicieuse des principes de la programmation structur�e', 4, NULL, 26)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (105, 'Mise � profit judicieuse des possibilit�s du langage', 5, NULL, 26)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (106, 'Consignation des commentaires pertinents et conformes aux exigences de l''entreprise', 6, NULL, 26)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (107, 'Utilisation efficace des fonctionnalit�s de compilation de l''environnement', 1, NULL, 27)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (108, 'Rep�rage des erreurs de compilation', 2, NULL, 27)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (109, 'Correction des erreurs de compilation', 3, NULL, 27)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (110, 'Utilisation efficace des fonctionnalit�s d''ex�cution et de d�bogage de l''environnement', 1, NULL, 28)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (111, 'Pr�paration correcte des jeux d''essai n�cessaires � la v�rification du fonctionnement du programme', 2, NULL, 28)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (112, 'Interpr�tation juste des r�sultats', 3, NULL, 28)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (113, 'D�bogage appropri� du programme selon l''algorithme', 4, NULL, 28)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (114, '�tablissement complet des domaines d''application', 1, NULL, 29)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (115, 'D�termination des classes pertinentes', 2, NULL, 29)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (116, '�tablissement des relations hi�rarchiques appropri�es entre les classes', 3, NULL, 29)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (117, 'D�termination des services de chacune des classes', 4, NULL, 29)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (118, 'D�termination des attributs pertinents compte tenu de chacune des classes', 5, NULL, 29)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (119, 'Repr�sentation graphique appropri�e du mod�le objet', 6, NULL, 29)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (120, 'Mise au point de la s�quence des op�rations propres aux diff�rents services de la classe', 1, NULL, 30)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (121, 'Repr�sentation graphique appropri�e du mod�le s�quentiel', 2, NULL, 30)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (122, 'Modification appropri�e du mod�le objet', 3, NULL, 30)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (123, 'Pr�paration appropri�e de l''environnement de programmation', 1, NULL, 31)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (124, 'D�claration et d�finition de la classe respectant les r�gles de syntaxe et de s�mantique du langage', 2, NULL, 31)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (125, 'Exploitation judicieuse des possibilit�s du langage dans l''application des principes d''encapsulation, d''h�ritage et de polymorphisme', 3, NULL, 31)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (126, 'Application rigoureuse des standards de nomenclature et de documentation reconnus propres � l''entreprise', 4, NULL, 31)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (127, 'Rep�rage et correction des erreurs de compilation de la classe', 5, NULL, 31)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (128, 'Pr�paration correcte des jeux d''essai n�cessaires � la v�rification du bon fonctionnement de tous les services de la classe', 1, NULL, 32)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (129, 'Cr�ation d''un environnement de test appropri�', 2, NULL, 32)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (130, 'Interpr�tation juste des r�sultats', 3, NULL, 32)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (131, 'D�bogage appropri� de la classe', 4, NULL, 32)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (132, 'Utilisation des m�canismes de g�n�ration propres � l''outil employ�', 1, NULL, 33)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (133, 'Pr�cision juste du besoin de recherche', 1, NULL, 34)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (134, 'D�termination des crit�res permettant de choisir correctement les sources de la recherche', 2, NULL, 34)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (135, 'Manifestation d''initiative', 3, NULL, 34)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (136, 'S�lection judicieuse des sources en fonction de la nature et des crit�res de la recherche', 1, NULL, 35)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (137, 'Utilisation correcte et efficace des m�thodes et des outils de recherche conventionnels et informatiques', 2, NULL, 35)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (138, 'Prise en consid�ration des risques de s''�loigner du besoin initial', 3, NULL, 35)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (139, 'Pertinence de l''information consult�e', 1, NULL, 36)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (140, 'Interpr�tation juste de l''information en fran�ais et en anglais', 2, NULL, 36)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (141, 'Pertinence de l''information extraite en fonction du besoin initial', 3, NULL, 36)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (142, 'Manifestation de curiosit�', 4, NULL, 36)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (143, 'Clart�, pr�cision et pertinence de l''information consign�e', 1, NULL, 37)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (144, 'Prise en consid�ration de ses forces et de ses faiblesses en mati�re de relations interpersonnelles', 1, NULL, 38)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (145, 'Manifestation d''attitudes favorisant des relations interpersonnelles harmonieuses', 2, NULL, 38)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (146, 'Application rigoureuse des r�gles de politesse et de courtoisie', 3, NULL, 38)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (147, 'Adaptation de son approche selon les personnes et les situations', 4, NULL, 38)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (148, 'Utilisation appropri�e des techniques de gestion des conflits interpersonnels', 5, NULL, 38)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (149, 'Manifestation de comportements conformes � l''�thique professionnelle', 6, NULL, 38)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (150, 'Manifestation d''une attitude d''�coute et de r�ceptivit�', 1, NULL, 39)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (151, 'Adaptation du niveau de langage selon l''interlocutrice et l''interlocuteur', 2, NULL, 39)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (152, 'Application correcte des techniques de communication verbale et non verbale', 3, NULL, 39)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (153, 'Utilisation appropri�e des techniques de n�gociation et d''argumentation', 4, NULL, 39)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (154, 'Distinction juste du r�le et des responsabilit�s des membres de l''�quipe', 1, NULL, 40)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (155, 'Prise de ses responsabilit�s au sein de l''�quipe', 2, NULL, 40)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (156, 'Contribution active aux activit�s de l''�quipe', 3, NULL, 40)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (157, 'Utilisation appropri�e des techniques de n�gociation et d''argumentation', 4, NULL, 40)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (158, 'Manifestation d''attitudes favorisant le travail d''�quipe', 5, NULL, 40)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (159, 'Respect du mode d''action �tabli par l''�quipe', 6, NULL, 40)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (160, 'Respect des d�cisions prises par les membres de l''�quipe', 7, NULL, 40)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (161, 'Contribution efficace � la r�solution des probl�mes �prouv�s par les membres de l''�quipe', 8, NULL, 40)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (162, 'Interpr�tation juste des besoins', 1, NULL, 41)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (163, 'Manifestation d''un souci constant de r�pondre aux besoins des clientes et des clients', 2, NULL, 41)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (164, 'V�rification r�guli�re de la satisfaction des clientes et des clients', 3, NULL, 41)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (165, 'R�action appropri�e devant les probl�mes soulev�s par les clientes et les clients', 4, NULL, 41)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (166, 'Manifestation d''un souci constant d''am�liorer la qualit� des services et des produits', 5, NULL, 41)
GO
INSERT CriterePerformance (idCritere, criterePerformance, numero, commentaire, idElement) VALUES (167, 'Manifestation de comportements conformes � l''�thique professionnelle', 6, NULL, 41)
GO
SET IDENTITY_INSERT CriterePerformance OFF
GO
