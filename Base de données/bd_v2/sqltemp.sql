USE master
IF EXISTS(select * from sys.databases where name='BDPlanCadreV2')
DROP DATABASE BDPlanCadreV2
GO

CREATE DATABASE BDPlanCadreV2
GO

USE BDPlanCadreV2
GO

-- --------------------------
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
        [nom] [nvarchar](50) NOT NULL,
        [prenom] [nvarchar](50) NOT NULL,
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
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [nom], [prenom]) VALUES (N'0c4b02f4-3c62-4030-b8e0-24aac3b87d5d', N'gauca1532715@etu.cegepjonquiere.ca', 0, N'ANbx0N9o/ZTfsvHCw/EvTUMGmHRFyd1EKMhXKFNk5JhLQNI8AWUq+Ho7UZ1q7YlhJg==', N'a06d14fc-8270-42f0-8a0d-8c600b9325cb', NULL, 0, 0, NULL, 1, 0, N'gauca1532715@etu.cegepjonquiere.ca', 'Gauthier', 'Carl')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [nom], [prenom]) VALUES (N'1950c7ef-d051-490d-84dc-1e2e8872d660', N'foned1530057@etu.cegepjonquiere.ca', 0, N'ALshSBLXPe+qLlE9k0SDkP2ylyWebaAAR3++HbNeAi6JhqO2qGUUnt0psbWgJ24BXQ==', N'46150be5-20da-448b-9e79-76e82d0806d4', NULL, 0, 0, NULL, 1, 0, N'foned1530057@etu.cegepjonquiere.ca', 'Fontaine', 'Eddy')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [nom], [prenom]) VALUES (N'4c194a5d-9ec8-4a9c-8994-7f91986cf480', N'larsa1432920@etu.cegepjonquiere.ca', 0, N'AOO/q2oMaxjNYF1sF8H7UMWVYv8vL7R6pOrt80/PVF1Gu1dDVIsGRdVZPk9V5RB/Yw==', N'0ad20b90-7166-4197-a93f-fc6b5e62ce61', NULL, 0, 0, NULL, 1, 0, N'larsa1432920@etu.cegepjonquiere.ca', 'Larouche', 'Samuel')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [nom], [prenom]) VALUES (N'ac2682c3-a26b-480a-83ec-b571b309a62a', N'cotfr1530860@etu.cegepjonquiere.ca', 0, N'AHEQtMJyh0h099STis/lvt8St8WZnYrJ/pf9LPIWtNT5GP4WDvgyIY6KJ6orrWt1hA==', N'34ecfb43-c36d-4ba8-9227-9964e95a605b', NULL, 0, 0, NULL, 1, 0, N'cotfr1530860@etu.cegepjonquiere.ca', 'C�t�', 'Fr�d�ric')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [nom], [prenom]) VALUES (N'de02a4d2-d6b1-4522-839c-342d5e446748', N'ducma1532694@etu.cegepjonquiere.ca', 0, N'AJiirWHrRF0C8skz4jL2mVGQmx41KedxAd8STYZJ0MsdTdA4Q23rpp5s2U8OR7Um9w==', N'bedc7731-2912-4355-8d5b-a4b55a8d8811', NULL, 0, 0, NULL, 1, 0, N'ducma1532694@etu.cegepjonquiere.ca', 'Duchesne', 'Marc-Antoine')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [nom], [prenom]) VALUES (N'efa8d199-9093-4ba5-824f-460ddb3ca4b9', N'hamfa1330387@etu.cegepjonquiere.ca', 0, N'AIKik20IEcYt6I25Tdbz2Ik4ONNx93HAQRY2+WwxWGoA9rI2LU+kLYenFktS8ujcXQ==', N'6973e3b8-1ef4-45b4-80ea-5442a8cd574b', NULL, 0, 0, NULL, 1, 0, N'hamfa1330387@etu.cegepjonquiere.ca', 'Hammond', 'Fabrice')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [nom], [prenom]) VALUES (N'eb364e3b-b9e5-406b-83eb-b2845acf3202', N'ericchose@outlook.ca', 0, N'ALWEsr41t9MzK/Ug02i2HDaij3MaytU+7/28tPtVYhtS+baXjg8dxZiefmE/SAU3lg==', N'33a123d0-029c-4e16-975e-91c7f64b3b28', NULL, 0, 0, NULL, 1, 0, N'ericchose@outlook.ca', 'Dallaire', '�ric')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [nom], [prenom]) VALUES (N'10a69245-2a83-4923-9482-f55551274033', N'aymentravail@outlook.ca', 0, N'AAHKoJqrLCNgFtvM5FEpS8Xu5OujMBtfbSXDwpVcT5xE+L+zAAFq6x+pAu8kx/9x0Q==', N'81f8bb06-ad14-42bd-92f1-80c2af97c542', NULL, 0, 0, NULL, 1, 0, N'aymentravail@outlook.ca', 'Sioud', 'Aymen')

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
IF OBJECT_ID ('EnonceCompetence') IS NOT NULL
DROP TABLE EnonceCompetence
GO
CREATE TABLE EnonceCompetence
(       
        idCompetence            INT                             NOT NULL        IDENTITY(1,1),

        codeCompetence          VARCHAR(4)              NOT NULL,
        description                     VARCHAR(300)    NOT NULL,
        obligatoire                     BIT                             NOT NULL        DEFAULT(1),
        actif                           BIT                             NOT NULL        DEFAULT(1),
        specifique                      BIT                             NOT NULL        DEFAULT(1),     --G�n�ral si 0

        idDevis                         INT                             NOT NULL,       --FK
        
        PRIMARY KEY(idCompetence)
)

IF OBJECT_ID ('ContexteRealisation') IS NOT NULL
DROP TABLE ContexteRealisation
GO
CREATE TABLE ContexteRealisation
(
        idContexte                      INT                             NOT NULL        IDENTITY(1,1),

        description                     VARCHAR(300)    NOT NULL,
        numero                          INT                             NOT NULL,

        idCompetence            INT                             NOT NULL,       --FK

        PRIMARY KEY(idContexte)
)

IF OBJECT_ID ('ElementCompetence') IS NOT NULL
DROP TABLE ElementCompetence
GO
CREATE TABLE ElementCompetence
(
        idElement                       INT                             NOT NULL        IDENTITY(1,1),

        description                     VARCHAR(300)    NOT NULL,
        numero                          INT                             NOT NULL,

        idCompetence            INT                             NOT NULL,       --FK

        PRIMARY KEY (idElement)
)

IF OBJECT_ID ('CriterePerformance') IS NOT NULL
DROP TABLE CriterePerformance
GO
CREATE TABLE CriterePerformance
(
        idCritere                       INT                             NOT NULL        IDENTITY(1,1),

        description                     VARCHAR(300)    NOT NULL,
        numero                          INT                             NOT NULL,

        idElement                       INT                             NOT NULL,       --FK

        PRIMARY KEY(idCritere)
)
IF OBJECT_ID ('DevisMinistere') IS NOT NULL
DROP TABLE DevisMinistere
GO
CREATE TABLE DevisMinistere
(
        idDevis                         INT             NOT NULL        IDENTITY(1,1),

        annee                   CHAR(4)         NOT NULL,
                codeSpecialisation      VARCHAR(3)      NOT NULL,
                specialisation                  VARCHAR(30)             NULL,
        nbUnite                                 VARCHAR(6)      NULL,
        nbHeureFrmGenerale      INT             NULL,
        nbHeureFrmSpecifique    INT             NULL,
        condition               VARCHAR(300)    NULL,
        sanction                VARCHAR(50)     NULL,
        docMinistere                    VARCHAR(200)    NULL,

        codeProgramme                   CHAR(3)         NOT NULL,       --FK

        PRIMARY KEY (idDevis)
);

IF OBJECT_ID ('Programme') IS NOT NULL
DROP TABLE Programme
GO
CREATE TABLE Programme
(
        idProgramme             INT             NOT NULL        IDENTITY(1,1),

        nom                                             VARCHAR(50)     NULL,
                annee                   CHAR(4)         NOT NULL,
        dateValidation          DATETIME        NULL,

        idDevis                         INT             NOT NULL,               --FK

        PRIMARY KEY (idProgramme)
);

IF OBJECT_ID ('EnteteProgramme') IS NOT NULL
DROP TABLE EnteteProgramme
GO
CREATE TABLE EnteteProgramme
(
        codeProgramme           CHAR(3)         NOT NULL,
        nom                                 VARCHAR(200)    NOT NULL,

        PRIMARY KEY(codeProgramme)
);
IF OBJECT_ID ('PlanCadre') IS NOT NULL
DROP TABLE PlanCadre
GO
CREATE TABLE PlanCadre
(
    idPlanCadre             INT             NOT NULL        IDENTITY(1,1),

    numeroCours             VARCHAR(10)     NULL,
    titreCours              VARCHAR(150)    NOT NULL,
    prealableAbs            VARCHAR(300)    NULL,
    prealableRel            VARCHAR(300)    NULL,
    indicationPedago        TEXT                        NULL,
    environnementPhys       TEXT                        NULL,
        ressource               TEXT                    NULL,
        nbHeureTheorie          INT             NULL,
        nbHeurePratique         INT             NULL,
        nbHeureDevoir           INT             NULL,

    idProgramme                         INT             NOT NULL,       --FK
        idType                                  INT                             NOT NULL,               --FK

    PRIMARY KEY(idPlanCadre)
);

IF OBJECT_ID ('PlanCadrePrealable') IS NOT NULL
DROP TABLE PlanCadrePrealable
GO
CREATE TABLE PlanCadrePrealable
(
    idPlanCadrePrealable        INT             NOT NULL        IDENTITY(1,1),

    idPlanCadre                     INT                         NOT NULL,               --FK
        idPrealable                         INT                         NOT NULL,               --FK
        idStatus                                INT                             NOT NULL,               --FK

        PRIMARY KEY(idPlanCadrePrealable)
);

IF OBJECT_ID ('StatusPrealable') IS NOT NULL
DROP TABLE StatusPrealable
GO
CREATE TABLE StatusPrealable
(
    idStatus                            INT             NOT NULL        IDENTITY(1,1),

    status                                      VARCHAR(20)             NOT NULL,

        PRIMARY KEY(idStatus)
);

IF OBJECT_ID ('TypePlanCadre') IS NOT NULL
DROP TABLE TypePlanCadre
GO
CREATE TABLE TypePlanCadre
(
    idType                                      INT             NOT NULL        IDENTITY(1,1),

    nom                             VARCHAR(20)     NOT NULL,

        PRIMARY KEY(idType)
);

IF OBJECT_ID ('PlanCadreElement') IS NOT NULL
DROP TABLE PlanCadreElement
GO
CREATE TABLE PlanCadreElement
(
    idPlanCadreElement      INT             NOT NULL        IDENTITY(1,1),

        elementsConnaissance    TEXT                    NULL,
    activiteApprentissage   TEXT                        NULL,

    idPlanCadre             INT             NOT NULL,       --FK
    idElement               INT             NOT NULL,       --FK
        idElementConnaissance   INT                             NOT NULL,               --FK

        PRIMARY KEY(idPlanCadreElement)
);

IF OBJECT_ID ('PlanCadreEnonce') IS NOT NULL
DROP TABLE PlanCadreEnonce
GO
CREATE TABLE PlanCadreEnonce
(
    idPlanCadreEnonce           INT             NOT NULL        IDENTITY(1,1),

        ponderationEnHeure      INT             NOT NULL,

    idPlanCadre             INT             NOT NULL,       --FK
    idCompetence                        INT                             NOT NULL,       --FK

        PRIMARY KEY(idPlanCadreEnonce)
);

IF OBJECT_ID ('ElementConnaissance') IS NOT NULL
DROP TABLE ElementConnaissance
GO
CREATE TABLE ElementConnaissance
(
    idElementConnaissance       INT             NOT NULL        IDENTITY(1,1),
        description                             TEXT            NOT NULL,

    idActivite                          INT                             NOT NULL,               --FK

        PRIMARY KEY(idElementConnaissance)
);

IF OBJECT_ID ('ActiviteApprentissage') IS NOT NULL
DROP TABLE ActiviteApprentissage
GO
CREATE TABLE ActiviteApprentissage
(
    idActivite                          INT             NOT NULL        IDENTITY(1,1),
        description                             TEXT            NOT NULL,

        PRIMARY KEY(idActivite)
);
--Cr�� par Eddy
--Le 01/11/2017

IF OBJECT_ID ('GrilleCours') IS NOT NULL
DROP TABLE GrilleCours
GO
CREATE TABLE GrilleCours
(
        idGrille                        INT                             NOT NULL        IDENTITY(1,1),

        nom                                     VARCHAR(50)             NOT NULL,

        PRIMARY KEY(idGrille)   
)

IF OBJECT_ID ('Session') IS NOT NULL
DROP TABLE Session
GO
CREATE TABLE Session
(
        idSession                       INT                             NOT NULL        IDENTITY(1,1),

        nom                                     VARCHAR(30)             NOT NULL,

        PRIMARY KEY(idSession)
)

IF OBJECT_ID ('Cours') IS NOT NULL
DROP TABLE Cours
GO
CREATE TABLE Cours
(
        idCours                         INT                             NOT NULL        IDENTITY(1,1),

        idPlanCadre                     INT                             NOT NULL,       --FK
        idGrille                        INT                             NOT NULL,       --FK
        idSession                       INT                             NOT NULL,       --FK

        PRIMARY KEY(idCours)
)
ALTER TABLE EnonceCompetence
ADD FOREIGN KEY(idDevis) REFERENCES DevisMinistere(idDevis)

ALTER TABLE ContexteRealisation
ADD FOREIGN KEY(idCompetence)REFERENCES EnonceCompetence(idCompetence)

ALTER TABLE ElementCompetence
ADD FOREIGN KEY(idCompetence) REFERENCES EnonceCompetence(idCompetence)

ALTER TABLE CriterePerformance
ADD FOREIGN KEY(idElement) REFERENCES ElementCompetence(idElement)
ALTER TABLE DevisMinistere
ADD FOREIGN KEY(codeProgramme) REFERENCES EnteteProgramme(codeProgramme)

ALTER TABLE Programme
ADD FOREIGN KEY(idDevis) REFERENCES DevisMinistere(idDevis)
ALTER TABLE PlanCadre
ADD FOREIGN KEY(idProgramme) REFERENCES Programme(idProgramme)

ALTER TABLE PlanCadre
ADD FOREIGN KEY(idType) REFERENCES TypePlanCadre(idType)

ALTER TABLE PlanCadrePrealable
ADD FOREIGN KEY(idPlanCadre) REFERENCES PlanCadre(idPlanCadre)

ALTER TABLE PlanCadrePrealable
ADD FOREIGN KEY(idPrealable) REFERENCES PlanCadre(idPlanCadre)

ALTER TABLE PlanCadrePrealable
ADD FOREIGN KEY(idStatus) REFERENCES StatusPrealable(idStatus)

ALTER TABLE PlanCadreElement
ADD FOREIGN KEY(idPlanCadre) REFERENCES PlanCadre(idPlanCadre)

ALTER TABLE PlanCadreElement
ADD FOREIGN KEY(idElement) REFERENCES ElementCompetence(idElement)

ALTER TABLE PlanCadreElement
ADD FOREIGN KEY(idElementConnaissance) REFERENCES ElementConnaissance(idElementConnaissance)

ALTER TABLE PlanCadreEnonce
ADD FOREIGN KEY(idPlanCadre) REFERENCES PlanCadre(idPlanCadre)

ALTER TABLE PlanCadreEnonce
ADD FOREIGN KEY(idCompetence) REFERENCES EnonceCompetence(idCompetence)

ALTER TABLE ElementConnaissance
ADD FOREIGN KEY (idActiviteApprentissage) REFERENCES ActiviteApprentissage(idActiviteApprentissage)

ALTER TABLE ElementConnaissance
ADD FOREIGN KEY (idActivite) REFERENCES ActiviteApprentissage(idActivite)
--Cr�� par Eddy
--Le 01/11/2017

ALTER TABLE Cours
ADD FOREIGN KEY(idPlanCadre) REFERENCES PlanCadre(idPlanCadre)

ALTER TABLE Cours
ADD FOREIGN KEY(idGrille) REFERENCES GrilleCours(idGrille)

ALTER TABLE Cours
ADD FOREIGN KEY(idSession) REFERENCES Session(idSession)
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
INSERT [dbo].[Programme] ([idProgramme], [nom], [annee], [dateValidation], [idDevis]) VALUES (1,'Le nouveau programme' , 2007, NULL, 1)
GO
SET IDENTITY_INSERT [Programme] OFF
GO
SET IDENTITY_INSERT EnonceCompetence ON
GO
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (1, N'016N', N'Analyser les fonctions de travail', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (2, N'016P', N'R�soudre des probl�mes math�matiques et
statistiques en informatique', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (3, N'016Q', N'Mettre � profit les possibilit�s d''un syst�me
d''exploitation propre � une station de travail', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (4, N'016R', N'Installer des �l�ments physiques et logiques
dans une station de travail', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (5, N'016S', N'Exploiter un langage de programmation
structur�e', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (6, N'016T', N'Appliquer une approche de d�veloppement par
objets', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (7, N'016U', N'Effectuer la recherche d�information', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (8, N'026V', N'Interagir et communiquer dans des situations de
travail vari�es', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (9, N'016W', N'Produire des algorithmes', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (10, N'016X', N'Produire une interface utilisateur', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (11, N'016Y', N'Planifier et g�rer des activit�s de travail', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (12, N'016Z', N'Assurer la production et la gestion de
documents', 1, 1, 1)
SET IDENTITY_INSERT EnonceCompetence OFF
GO
SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (1, N'Caract�riser les fonctions de travail et leurs conditions d''exercise', 1, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (2, N'Examiner les t�ches et les op�rations li�es aux fonctions de travail', 2, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (3, N'Examiner les habilet�s et les comportements n�cessaire a l''exercice des fonctions de travail.', 3, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (4, N'Examiner la r�glementation relative � l''exercice de la profession en g�n�ral', 4, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (5, N'Effectuer des traitements sur des donn�es internes de l�ordinateur', 1, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (6, N'Effectuer des op�rations logiques', 2, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (7, N'Organiser et traiter de l�information', 3, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (8, N'R�soudre des probl�mes de programmation lin�aire', 4, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (9, N'R�soudre des probl�mes de d�nombrement', 5, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (10, N'R�soudre des probl�mes de probabilit� et de statistique', 6, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (11, N'Exploiter un syst�me de fichiers', 1, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (12, N'Automatiser des t�ches', 2, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (13, N'Utiliser les m�canismes de gestion de la m�moire', 3, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (14, N'Personnaliser l''environnement de la station de travail', 4, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (15, N'Analyser l''architecture interne de l''ordinateur', 1, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (16, N'Planifier le travail', 2, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (17, N'Prot�ger l''environnement de la station de travail', 3, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (18, N'Installer des �l�ments physiques', 4, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (19, N'D�sinstaller des �l�ments physiques', 5, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (20, N'Installer des �l�ments logiques', 6, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (21, N'D�sinstaller des �l�ments logiques', 7, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (22, N'V�rifier l''installation de la station de travail dans l''environnement de l''utilisatrice et de l''utilisateur', 8, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (23, N'Consigner l''information sur l''installation', 9, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (24, N'Pr�parer l�environnement de programmation.', 1, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (25, N'Adapter l�algorithme aux contraintes du langage de programmation.', 2, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (26, N'Traduire l�algorithme dans le langage de programmation.', 3, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (27, N'Compiler le programme', 4, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (28, N'Valider le programme', 5, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (29, N'Cr�er un mod�le objet', 1, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (30, N'Perfectionner le mod�le objet', 2, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (31, N'Proc�der � la codification d�une classe', 3, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (32, N'Valider le fonctionnement d�une classe', 4, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (33, N'G�n�rer la version ex�cutable du programme', 5, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (34, N'Pr�ciser le besoin d�information', 1, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (35, N'S�lectionner et utiliser les sources de recherche', 2, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (36, N'Consulter et extraire l�information n�cessaire', 3, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (37, N'Consigner les r�sultats de la recherche', 4, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (38, N'�tablir et entretenir des relations interpersonnelles', 1, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (39, N'Communiquer avec des personnes � l�interne et � l�externe', 2, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (40, N'Travailler au sein d�une �quipe multidisciplinaire', 3, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (41, N'Appliquer une approche client', 4, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (42, N'Analyser la situation', 1, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (43, N'Mettre au point l''algorithme', 2, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (44, N'Valider l''algorithme', 3, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (45, N'Analyser les caract�ristiques des utilisatrices et des utilisateurs', 1, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (46, N'�tablir les caract�ristiques d�interaction', 2, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (47, N'Choisir des p�riph�riques d�entr�e et de sortie', 3, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (48, N'Planifier l�organisation globale de l�interface', 4, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (49, N'Proc�der � la programmation de l�interface utilisateur', 5, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (50, N'Analyser les caract�ristiques du travail � effectuer', 1, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (51, N'Proc�der � la planification des activit�s', 2, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (52, N'Assurer le suivi des activit�s de travail', 3, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (53, N'Choisir le support du document', 1, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (54, N'Produire un document technique et administratif', 2, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (55, N'Produire l�aide en ligne', 3, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (56, N'Produire un document de formation', 4, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (57, N'Diffuser un document', 5, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (58, N'Classer un document', 6, 12)
SET IDENTITY_INSERT ElementCompetence OFF
GO
SET IDENTITY_INSERT ContexteRealisation ON
GO
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (1, N'a l''aide d''une information r�cente sur les fonctions de travail suivantes : - programeuse-analyste et programeur-analyste dans les domaine de la gestion et de l''indutrie', 1, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (2, N'� l''aide d''une information r�cente sur les entreprses dans lesquelles on trouve la programeuse-analyste et le programmeur-analyste et la et le gestionnaire de r�seaux informatique', 2, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (3, N'� partir de situations propres au domaine de l''informatique', 1, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (4, N'� partir d''une station de travail et d�un logiciel de statistiques', 2, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (5, N'� l''aide des manuels de r�f�rences techniques appropri�s', 3, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (6, N'Dans des environnements utilisant des syst�mes d�exploitation vari�s', 1, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (7, N'� partir d''une station de travail et des logiciels appropri�s', 2, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (8, N'� l''aide des manuels de r�f�rences techniques appropri�s', 3, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (9, N'� partir des normes et des exigences de l''entreprise', 4, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (10, N'En atelier et sur le lieu de travail de l''utilisatrice et de l''utilisateur', 1, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (11, N'� partir d''une demande pr�autoris�e pr�cisant la nature de l''installation', 2, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (12, N'� partir d''une station de travail', 3, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (13, N'� l''aide des �l�ments physiques et logiques � installer et des outils appropri�s', 4, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (14, N'� partir des normes et des exigences de l''entreprise', 5, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (15, N'� l''aide des manuels de r�f�rences techniques appropri�s', 6, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (16, N'� partir d�une station de travail et des logiciels appropri�s', 1, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (17, N'� partir d�algorithmes valides et repr�sentatifs du milieu de travail', 2, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (18, N'� partir des normes et des exigences de l�entreprise', 3, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (19, N'� l�aide des manuels de r�f�rences techniques appropri�s � l�environnement de programmation', 4, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (20, N'� partir d''une station de travail et des logiciels appropri�s', 1, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (21, N'� partir de situations repr�sentatives du milieu du travail et n�cessitant le d�veloppement d�applications comportant un nombre limit� de classes', 2, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (22, N'� partir des normes et des exigences de l''entreprise', 3, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (23, N'� l�aide de toute la documentation disponible sur les applications � d�velopper', 4, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (24, N'� l''aide des manuels de r�f�rences techniques appropri�s', 5, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (25, N'� partir de besoins d�information pr�cis propres au milieu de travail', 1, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (26, N'� partir de besoins d�information li�s � la veille technologique', 2, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (27, N'� partir d�une station de travail et des logiciels appropri�s', 3, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (28, N'� l�aide de manuels de r�f�rences en fran�ais et en anglais', 4, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (29, N'Dans des situations de travail vari�es', 1, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (30, N'En pr�sence des personnes en cause', 2, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (31, N'� partir de situations vari�es repr�sentatives du milieu de travail', 1, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (32, N'� partir d''une station de travail et des logiciels appropri�s', 2, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (33, N'� partir des exigences de l''entreprise', 3, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (34, N'� l�aide des manuels de r�f�rences techniques appropri�s', 4, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (35, N'� partir d''une station de travail et des logiciels appropri�s', 1, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (36, N'� partir d�applications vari�es n�cessitant la cr�ation d�interfaces', 2, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (37, N'� partir des manuels de r�f�rences techniques appropri�s', 3, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (38, N'� partir des exigences de l''entreprise et des standards de l�informatique', 4, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (39, N'Dans des situations de travail propres � la profession', 1, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (40, N'� l�aide des outils de planification appropri�s', 2, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (41, N'� partir des exigences de l''entreprise', 3, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (42, N'Pour des documents en fran�ais et en anglais', 1, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (43, N'� partir d�une station de travail et des logiciels de bureautique, de multim�dia et de cr�ation d�aide en ligne', 2, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (44, N'� l�aide de dictionnaires, de grammaires et d�outils de r�f�rence vari�s', 3, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (45, N'� l�aide de l�inforoute et des services de t�l�communication', 4, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (46, N'� partir des exigences de l�entreprise', 5, 12)
SET IDENTITY_INSERT ContexteRealisation OFF
GO
SET IDENTITY_INSERT CriterePerformance ON
GO
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (1, N'Pertinence de l�information recueillie', 1, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (2, N'Examen complet des caract�ristiques g�n�rales des fonctions de travail et de leurs conditions d�exercice', 2, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (3, N'Reconnaissance des possibilit�s d�exercice des professions en entreprise et de pratique entrepreneuriale dans le domaine de l�informatique', 3, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (4, N'Reconnaissance des effets, sur le travail, de l��volution technologique rapide dans le domaine de l�informatique', 4, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (5, N'Examen complet des op�rations, ainsi que des conditions d�ex�cution et des crit�res de performance des t�ches associ�s aux diff�rentes fonctions de travail', 1, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (6, N'D�termination exacte de l�importance relative des activit�s', 2, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (7, N'Mise en relation des �tapes du processus de travail avec les t�ches des fonctions de travail', 3, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (8, N'Pertinence des liens �tablis entre les habilet�s et comportements et les diff�rentes t�ches des fonctions de travail', 1, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (9, N'Examen complet des exigences li�es � l��thique professionnelle', 2, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (10, N'Reconnaissance des droits et des responsabilit�s des personnes dans les relations employeur-employ� et client-fournisseur', 1, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (11, N'Reconnaissance des cons�quences des manquements aux lois et r�glements', 2, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (12, N'Repr�sentation correcte de nombres dans diff�rentes bases', 1, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (13, N'Conversion correcte de nombres d�une base � une autre', 2, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (14, N'Ex�cution correcte des op�rations arithm�tiques dans diff�rentes bases', 3, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (15, N'Repr�sentation juste de donn�es dans la m�moire de l�ordinateur', 4, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (16, N'Interpr�tation juste des limites de repr�sentation des donn�es dans la m�moire de l�ordinateur', 5, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (17, N'Formulation de propositions appropri�es � diff�rentes situations', 1, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (18, N'Construction d�une table de v�rit� conforme � une proposition', 2, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (19, N'Simplification correcte d�une proposition', 3, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (20, N'Utilisation appropri�e de la m�thode de preuve par induction', 4, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (21, N'Construction d�ensembles et de sous-ensembles appropri�s � diff�rentes situations', 1, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (22, N'Ex�cution correcte de toutes les op�rations dans les ensembles', 2, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (23, N'�tablissement de relations justes entre des ensembles', 3, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (24, N'Formulation de propositions appropri�es et dans leur forme la plus simple en vue de traiter l�information dans une situation donn�e', 4, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (25, N'Traduction correcte des propositions en langage ensembliste', 5, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (26, N'Repr�sentation d�une situation sous forme d�un syst�me d��quations lin�aires appropri�', 1, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (27, N'Ex�cution correcte des op�rations dans les matrices', 2, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (28, N'Repr�sentation juste d�un syst�me d��quations lin�aires sous forme matricielle', 3, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (29, N'Application correcte de m�thodes de r�solution de probl�mes d�un syst�me d��quations lin�aires', 4, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (30, N'Calcul exact du nombre de permutations dans un contexte donn�', 1, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (31, N'Calcul exact du nombre d�arrangements dans un contexte donn�', 2, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (32, N'Calcul exact du nombre de combinaisons dans un contexte donn�', 3, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (33, N'Calcul des probabilit�s d��v�nements li�es aux lois binomiale, normale et de Poisson', 1, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (34, N'D�termination de la nature des variables appropri�es � une situation donn�e', 2, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (35, N'Choix d��chelles de mesure appropri�es � une situation donn�e', 3, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (36, N'Choix des mesures statistiques appropri�es � une situation donn�e', 4, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (37, N'Choix judicieux du mode de repr�sentation de l�information', 5, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (38, N'Application rigoureuse des normes de pr�sentation des tableaux et des graphiques', 6, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (39, N'Utilisation efficace des fonctionnalit�s d�un logiciel de statistiques', 7, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (40, N'Choix des m�thodes d��chantillonnage appropri�es � une situation donn�e', 8, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (41, N'Estimation par intervalle d�une moyenne et d�une proportion pour des grands �chantillons', 9, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (42, N'Comparaison des possibilit�s et des limites des syst�mes de fichiers de diff�rents syst�mes d''exploitation', 1, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (43, N'Utilisation correcte des commandes de manipulation des fichiers', 2, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (44, N'Utilisation correcte des commandes de manipulation des r�pertoires', 3, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (45, N'Utilisation correcte des commandes visant � assurer la s�curit� des fichiers et des r�pertoires', 4, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (46, N'Utilisation correcte des outils visant le stockage et l''int�grit� des donn�es', 5, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (47, N'Analyse judicieuse des possibilit�s et des limites des diff�rents syst�mes d''exploitation au regard de l''ex�cution des t�ches', 1, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (48, N'Utilisation correcte du langage de commande propre au syst�me d''exploitation', 2, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (49, N'Utilisation appropri�e des commandes en vue d��tablir l�ordre de priorit� des t�ches', 3, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (50, N'Adaptation appropri�e des param�tres de s�curit� aux exigences des t�ches', 4, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (51, N'Application des techniques de d�bogage appropri�es au syst�me d''exploitation', 5, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (52, N'Consignation des commentaires pertinents', 6, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (53, N'Analyse judicieuse des possibilit�s et des limites des diff�rents syst�mes d''exploitation au regard de la gestion de la m�moire', 1, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (54, N'Allocation de la m�moire appropri�e aux besoins relatifs � l''ex�cution d''une t�che', 2, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (55, N'Comparaison des diff�rents types de fichiers de configuration propres au syst�me d''exploitation', 1, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (56, N'Utilisation correcte des commandes de configuration de base du poste de travail', 2, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (57, N'Utilisation correcte des commandes de d�marrage et de configuration des p�riph�riques', 3, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (58, N'D�marrage des programmes appropri�s aux besoins de l''utilisatrice et de l''utilisateur', 4, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (59, N'Adaptation des param�tres de configuration de l''environnement de travail aux exigences de l''utilisatrice et de l''utilisateur', 5, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (60, N'Consignation pr�cise des param�tres de personnalisation', 6, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (61, N'Distinction et rep�rage des �l�ments de la carte ma�tresse', 1, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (62, N'Reconnaissance des caract�ristiques et des fonctions propres aux processeurs, aux m�moires, aux bus et aux horloges', 2, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (63, N'Reconnaissance des caract�ristiques et des fonctions propres aux diff�rents ports de communication', 3, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (64, N'Reconnaissance des relations entre les diff�rents �l�ments', 4, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (65, N'Analyse judicieuse de la demande', 1, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (66, N'Pr�paration du mat�riel n�cessaire', 2, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (67, N'D�termination juste de la s�quence des op�rations', 3, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (68, N'Consignation compl�te de la configuration physique initiale', 1, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (69, N'Copie de l''ensemble des donn�es', 2, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (70, N'Prise des mesures de s�curit� appropri�es', 3, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (71, N'Interpr�tation correcte des fiches techniques', 1, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (72, N'D�termination appropri�e de chacun des param�tres d''installation', 2, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (73, N'Installation de l''�l�ment � l''endroit appropri�', 3, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (74, N'Configuration conforme � l''environnement du poste', 4, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (75, N'V�rification appropri�e du fonctionnement de l''�l�ment', 5, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (76, N'Interpr�tation judicieuse de l�information technique', 1, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (77, N'Respect du processus de d�sinstallation en fonction de l��l�ment � retirer', 2, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (78, N'Prise des pr�cautions appropri�es', 3, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (79, N'Interpr�tation judicieuse de l''information technique', 1, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (80, N'D�marrage appropri� de l''installation', 2, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (81, N'Choix des param�tres d''installation en fonction de l''environnement du poste', 3, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (82, N'V�rification appropri� du fonctionnement de l''�l�ment', 4, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (83, N'Personnalisation de l''�l�ment appropri�e aux besoins de l�utilisatrice et de l''utilisateur', 5, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (84, N'Copie correcte des disques', 1, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (85, N'Interpr�tation judicieuse de l''information technique', 2, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (86, N'Utilisation appropri�e des outils de d�sinstallation', 3, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (87, N'Respect du processus de d�sinstallation manuelle', 4, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (88, N'V�rification appropri�e du fonctionnement de l''ensemble des �l�ments', 1, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (89, N'R�solution efficace des probl�mes d''installation', 2, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (90, N'Installation de la station de travail conforme aux principes de l''ergonomie', 3, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (91, N'Prise en note de la nouvelle configuration', 1, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (92, N'R�daction claire et correcte des probl�mes �prouv�s et des solutions apport�es', 2, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (93, N'Mise � jour pr�cise de l''inventaire', 3, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (94, N'V�rification m�thodique de l�acc�s aux diff�rents �l�ments physiques et logiques de l�environnement', 1, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (95, N'Configuration de l�environnement appropri�e aux caract�ristiques de la situation', 2, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (96, N'Personnalisation de l�environnement efficace et conforme aux exigences de l�entreprise', 3, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (97, N'Modification appropri�e de la repr�sentation des donn�es', 1, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (98, N'Adaptation correcte des conditions d�ex�cution', 2, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (99, N'Modification appropri�e des structures de traitement', 3, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (100, N'Adaptation appropri�e de la s�quence des op�rations', 4, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (101, N'Utilisation efficace des fonctionnalit�s d��dition de l�environnement', 1, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (102, N'Application des r�gles de syntaxe et de s�mantique propres au langage utilis�', 2, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (103, N'Application rigoureuse des standards de codification', 3, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (104, N'Application judicieuse des principes de la programmation structur�e', 4, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (105, N'Mise � profit judicieuse des possibilit�s du langage', 5, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (106, N'Consignation des commentaires pertinents et conformes aux exigences de l�entreprise', 6, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (107, N'Utilisation efficace des fonctionnalit�s de compilation de l�environnement', 1, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (108, N'Rep�rage des erreurs de compilation', 2, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (109, N'Correction des erreurs de compilation', 3, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (110, N'Utilisation efficace des fonctionnalit�s d�ex�cution et de d�bogage de l�environnement', 1, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (111, N'Pr�paration correcte des jeux d�essai n�cessaires � la v�rification du fonctionnement du programme', 2, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (112, N'Interpr�tation juste des r�sultats', 3, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (113, N'D�bogage appropri� du programme selon l�algorithme', 4, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (114, N'�tablissement complet des domaines d�application', 1, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (115, N'D�termination des classes pertinentes', 2, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (116, N'�tablissement des relations hi�rarchiques appropri�es entre les classes', 3, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (117, N'D�termination des services de chacune des classes', 4, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (118, N'D�termination des attributs pertinents compte tenu de chacune des classes', 5, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (119, N'Repr�sentation graphique appropri�e du mod�le objet', 6, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (120, N'Mise au point de la s�quence des op�rations propres aux diff�rents services de la classe', 1, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (121, N'Repr�sentation graphique appropri�e du mod�le s�quentiel', 2, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (122, N'Modification appropri�e du mod�le objet', 3, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (123, N'Pr�paration appropri�e de l''environnement de programmation', 1, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (124, N'D�claration et d�finition de la classe respectant les r�gles de syntaxe et de s�mantique du langage', 2, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (125, N'Exploitation judicieuse des possibilit�s du langage dans l''application des principes d''encapsulation, d''h�ritage et de polymorphisme', 3, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (126, N'Application rigoureuse des standards de nomenclature et de documentation reconnus propres � l''entreprise', 4, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (127, N'Rep�rage et correction des erreurs de compilation de la classe', 5, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (128, N'Pr�paration correcte des jeux d''essai n�cessaires � la v�rification du bon fonctionnement de tous les services de la classe', 1, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (129, N'Cr�ation d''un environnement de test appropri�', 2, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (130, N'Interpr�tation juste des r�sultats', 3, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (131, N'D�bogage appropri� de la classe', 4, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (132, N'Utilisation des m�canismes de g�n�ration propres � l�outil employ�', 1, 33)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (133, N'Pr�cision juste du besoin de recherche', 1, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (134, N'D�termination des crit�res permettant de choisir correctement les sources de la recherche', 2, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (135, N'Manifestation d�initiative', 3, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (136, N'S�lection judicieuse des sources en fonction de la nature et des crit�res de la recherche', 1, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (137, N'Utilisation correcte et efficace des m�thodes et des outils de recherche conventionnels et informatiques', 2, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (138, N'Prise en consid�ration des risques de s��loigner du besoin initial', 3, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (139, N'Pertinence de l�information consult�e', 1, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (140, N'Interpr�tation juste de l�information en fran�ais et en anglais', 2, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (141, N'Pertinence de l�information extraite en fonction du besoin initial', 3, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (142, N'Manifestation de curiosit�', 4, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (143, N'Clart�, pr�cision et pertinence de l�information consign�e', 1, 37)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (144, N'Prise en consid�ration de ses forces et de ses faiblesses en mati�re de relations interpersonnelles', 1, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (145, N'Manifestation d�attitudes favorisant des relations interpersonnelles harmonieuses', 2, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (146, N'Application rigoureuse des r�gles de politesse et de courtoisie', 3, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (147, N'Adaptation de son approche selon les personnes et les situations', 4, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (148, N'Utilisation appropri�e des techniques de gestion des conflits interpersonnels', 5, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (149, N'Manifestation de comportements conformes � l��thique professionnelle', 6, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (150, N'Manifestation d�une attitude d��coute et de r�ceptivit�', 1, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (151, N'Adaptation du niveau de langage selon l�interlocutrice et l�interlocuteur', 2, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (152, N'Application correcte des techniques de communication verbale et non verbale', 3, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (153, N'Utilisation appropri�e des techniques de n�gociation et d�argumentation', 4, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (154, N'Distinction juste du r�le et des responsabilit�s des membres de l��quipe', 1, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (155, N'Prise de ses responsabilit�s au sein de l��quipe', 2, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (156, N'Contribution active aux activit�s de l��quipe', 3, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (157, N'Utilisation appropri�e des techniques de n�gociation et d�argumentation', 4, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (158, N'Manifestation d�attitudes favorisant le travail d��quipe', 5, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (159, N'Respect du mode d�action �tabli par l��quipe', 6, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (160, N'Respect des d�cisions prises par les membres de l��quipe', 7, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (161, N'Contribution efficace � la r�solution des probl�mes �prouv�s par les membres de l��quipe', 8, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (162, N'Interpr�tation juste des besoins', 1, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (163, N'Manifestation d�un souci constant de r�pondre aux besoins des clientes et des clients', 2, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (164, N'V�rification r�guli�re de la satisfaction des clientes et des clients', 3, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (165, N'R�action appropri�e devant les probl�mes soulev�s par les clientes et les clients', 4, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (166, N'Manifestation d�un souci constant d�am�liorer la qualit� des services et des produits', 5, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (167, N'Manifestation de comportements conformes � l��thique professionnelle', 6, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (168, N'�tablissement correcte des donn�es d''entr�e', 1, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (169, N'�tablissement correcte des donn�es de sortie', 2, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (170, N'�tablissement correcte de la nature des traitements', 3, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (171, N'D�termination correcte des conditions d�ex�cution de l''algorithme', 4, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (172, N'Choix d�un mode de repr�sentation de l''algorithme conforme aux exigences de l''entreprise', 1, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (173, N'D�termination d''une s�quence logique des op�rations', 2, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (174, N'D�termination des structures de traitement appropri�es � chacune des op�rations', 3, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (175, N'Application rigoureuse des r�gles de syntaxe propres au mode de repr�sentation retenu', 4, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (176, N'Recherche d''une solution algorithmique efficace', 5, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (177, N'Repr�sentation pr�cise de la solution algorithmique retenue', 6, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (178, N'Pr�sence de toute l''information n�cessaire � l''interpr�tation de l''algorithme', 7, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (179, N'V�rification de la pertinence de la solution compte tenu de la situation initiale', 1, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (180, N'D�termination des erreurs et des lacunes de la solution algorithmique mise au point', 2, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (181, N'Modification appropri�e de la solution algorithmique', 3, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (182, N'Examen des caract�ristiques des utilisatrices et des utilisateurs li�es � l��ge, � la culture et � la scolarisation', 1, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (183, N'D�termination du degr� de familiarit� avec l�informatique en g�n�ral et avec l�application � utiliser', 2, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (184, N'D�termination du degr� de r�ceptivit� des utilisatrices et des utilisateurs par rapport � l�application � utiliser', 3, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (185, N'Pr�cision des attentes des utilisatrices et des utilisateurs', 4, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (186, N'Reconnaissance des caract�ristiques de l�environnement physique', 1, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (187, N'D�termination des modalit�s d�interaction', 2, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (188, N'D�finition des caract�ristiques des t�ches d�interaction', 3, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (189, N'V�rification de la coh�rence entre les modalit�s et les t�ches', 4, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (190, N'Prise en consid�ration des caract�ristiques des utilisatrices et des utilisateurs', 1, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (191, N'Prise en consid�ration des caract�ristiques de l�interaction', 2, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (192, N'Prise en consid�ration des caract�ristiques des exigences d�ergonomie', 3, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (193, N'Prise en consid�ration des contraintes de fiabilit�, de co�t et de maintenance', 4, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (194, N'Interpr�tation correcte des fiches techniques des produits offerts sur le march�', 5, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (195, N'�tablissement des actions et des exceptions li�es aux t�ches', 1, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (196, N'D�termination des �l�ments de pr�sentation des actions et des exceptions', 2, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (197, N'Organisation spatiale appropri�e des �l�ments', 3, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (198, N'D�termination des caract�ristiques de pr�sentation des �l�ments', 4, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (199, N'Organisation de l�interface conforme aux crit�res d�esth�tisme et d�efficacit�', 5, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (200, N'Consignation de l�information relative � l�interface', 6, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (201, N'Cr�ation des �l�ments selon les caract�ristiques de pr�sentation choisies', 1, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (202, N'Positionnement des �l�ments selon l�organisation spatiale retenue', 2, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (203, N'�tablissement des liens entre les �l�ments et les programmes de l�application', 3, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (204, N'Validation du fonctionnement de l�interface', 4, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (205, N'D�termination correcte des principales t�ches et de leur s�quence', 1, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (206, N'Estimation du temps n�cessaire � l�ex�cution des principales t�ches', 2, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (207, N'Prise en consid�ration des �ch�ances �tablies pour l�ex�cution du travail', 3, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (208, N'�tablissement correct de priorit�s', 1, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (209, N'Prise en consid�ration des points critiques', 2, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (210, N'Pr�vision d�une marge de man�uvre suffisante pour faire face aux impr�vus', 3, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (211, N'Utilisation appropri�e des m�thodes et des outils de planification', 4, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (212, N'�tablissement d�un calendrier des travaux r�aliste', 5, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (213, N'D�termination correcte des ressources humaines et mat�rielles n�cessaires � l�ex�cution du travail', 6, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (214, N'Communication efficace avec les personnes en cause', 7, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (215, N'Pr�sentation correcte du plan de travail pour approbation', 8, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (216, N'Utilisation d�une m�thode appropri�e de suivi des activit�s', 1, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (217, N'Gestion efficace du temps', 2, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (218, N'Respect du calendrier des travaux', 3, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (219, N'Adaptation r�guli�re du calendrier des travaux en fonction des impr�vus', 4, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (220, N'D�termination juste du support n�cessaire', 1, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (221, N'S�lection et utilisation correcte du logiciel de cr�ation du document', 2, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (222, N'�tablissement juste du plan de travail pour le document � produire', 1, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (223, N'Pr�paration appropri�e des �l�ments de contenu', 2, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (224, N'Application rigoureuse des r�gles grammaticales et orthographiques', 3, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (225, N'�tablissement correct du format de mise en page', 4, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (226, N'Adaptation correcte du niveau de langage en fonction du public cible', 5, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (227, N'Clart� du texte', 6, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (228, N'Utilisation efficace des logiciels de bureautique et de multim�dia', 7, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (229, N'Respect des normes de mise en page', 8, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (230, N'S�lection des �l�ments qui n�cessitent de l�aide en ligne', 1, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (231, N'Respect des normes de pr�sentation', 2, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (232, N'Application rigoureuse des r�gles grammaticales et orthographiques', 3, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (233, N'Adaptation correcte du niveau de langage en fonction du public cible', 4, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (234, N'Utilisation correcte du logiciel de cr�ation d�aide en ligne', 5, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (235, N'Facilit� d�utilisation de l�aide en ligne', 6, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (236, N'V�rification de la coh�rence de l�aide en ligne', 7, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (237, N'Prise en consid�ration des objectifs d�apprentissage en fonction du public cible et du contexte de formation', 1, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (238, N'Pr�paration appropri�e des �l�ments de contenu', 2, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (239, N'Utilisation correcte des outils de production du document', 3, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (240, N'Respect des normes de pr�sentation', 4, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (241, N'Application rigoureuse des r�gles grammaticales et orthographiques', 5, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (242, N'Adaptation correcte du niveau de langage en fonction du public cible', 6, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (243, N'V�rification minutieuse du document', 7, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (244, N'�tablissement juste de la liste de diffusion', 1, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (245, N'S�lection et utilisation du mode de diffusion', 2, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (246, N'V�rification syst�matique de la r�ception', 3, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (247, N'Respect des r�gles de conservation d�un document', 1, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (248, N'Attribution pr�cise d�un code � partir du plan de classification', 2, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (249, N'Pr�cision et concision du titre d�un document selon les normes', 3, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (250, N'Consignation minutieuse de l�information dans l�outil de rep�rage', 4, 58)
SET IDENTITY_INSERT CriterePerformance OFF
GO
SET IDENTITY_INSERT [TypePlanCadre] ON
GO
INSERT [dbo].[TypePlanCadre] ([idType], [nom]) VALUES (1, 'Sp�cifique')
INSERT [dbo].[TypePlanCadre] ([idType], [nom]) VALUES (2, 'G�n�rale')
INSERT [dbo].[TypePlanCadre] ([idType], [nom]) VALUES (3, 'Contributif')
SET IDENTITY_INSERT [TypePlanCadre] OFF
GO

SET IDENTITY_INSERT [PlanCadre] ON
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [PrealableAbs], [PrealableRel], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (1, N'420-JAC-JQ', N'Informatique et technologie', 1, 2, 1, NULL, NULL,
N'Ce cours de premi�re session permettra � l''�l�ve de se familiariser avec le monde de l�informatique et aux fonctions de travail.  Plus pr�cis�ment, il vise � rendre l''�l�ve capable de faire un choix �clair� quant � l''orientation de sa carri�re.  De plus, il permettra un tour d''horizon des outils de base n�cessaires au travail de l''�l�ve en informatique.',
N'Laboratoire d''exploitation (un poste de travail par �l�ve).
Branchement Internet.
Suite bureautique.',
N'Sites Web :
� http://www.technocompetences.qc.ca
� http://www.directioninformatique.com
� http://www.w3schools.com
� http://siteduzero.com', 1, 1)
GO
SET IDENTITY_INSERT [PlanCadre] OFF
GO
SET IDENTITY_INSERT StatusPrealable ON
GO
INSERT [dbo].StatusPrealable (idStatus, status) VALUES (1, 'Relatif')
GO
INSERT [dbo].StatusPrealable (idStatus, status) VALUES (2, 'Absolu')
GO
SET IDENTITY_INSERT StatusPrealable OFF
GO
SET IDENTITY_INSERT [PlanCadreElement] ON
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[elementsConnaissance]) VALUES (1, 1, 1,N'Vision d�ensemble du monde de l�informatique:'+char(13)+char(10)+'place actuelle de l�informatique dans la soci�t�;'+char(13)+char(10)+'influences sur les entreprises;'+char(13)+char(10)+'influences sur les gens;'+char(13)+char(10)+'�volution technologique (rappel historique, situation actuelle, tendance).)')
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement]) VALUES (2, 1, 2)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement]) VALUES (3, 1, 3)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement]) VALUES (4, 1, 4)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement]) VALUES (5, 1, 53)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement]) VALUES (6, 1, 54)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement]) VALUES (7, 1, 55)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement]) VALUES (8, 1, 56)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement]) VALUES (9, 1, 57)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement]) VALUES (10, 1, 58)
GO
SET IDENTITY_INSERT [PlanCadreElement] OFF
GO
SET IDENTITY_INSERT [PlanCadreEnonce] ON
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (1, 1, 1, 20)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (2, 1, 12, 15)
GO
SET IDENTITY_INSERT [PlanCadreEnonce] OFF
GO
