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

CREATE TABLE AccesProgramme
(
        idAcces                         INT             NOT NULL        IDENTITY(1,1),

        userMail                                NVARCHAR(256)   NOT NULL,
        
    codeProgramme                       CHAR(3)         NOT NULL,       --FK
)

ALTER TABLE AccesProgramme
ADD FOREIGN KEY(codeProgramme) REFERENCES EnteteProgramme(codeProgramme)
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
        specifique                      BIT                             NOT NULL        DEFAULT(1),     --Général si 0

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
                statusValider                   BIT                             NULL,
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
        idStatus                                INT                             NOT NULL                --FK                    DEFAULT(),

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

    idPlanCadre             INT             NOT NULL,       --FK
    idElement               INT             NOT NULL,       --FK
        idElementConnaissance   INT                             NULL,           --FK
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
);
IF OBJECT_ID ('ElementConnaissance') IS NOT NULL
DROP TABLE ElementConnaissance
GO
CREATE TABLE ElementConnaissance
(
    idElementConnaissance                               INT             NOT NULL        IDENTITY(1,1),
        description                                                     TEXT            NOT NULL,

    idActiviteApprentissage                             INT                             NULL,           --FK

        PRIMARY KEY(idElementConnaissance)
);

IF OBJECT_ID ('ActiviteApprentissage') IS NOT NULL
DROP TABLE ActiviteApprentissage
GO
CREATE TABLE ActiviteApprentissage
(
    idActiviteApprentissage                                     INT             NOT NULL        IDENTITY(1,1),
        description                                                             TEXT            NOT NULL,

        PRIMARY KEY(idActiviteApprentissage)
);
--Créé par Eddy
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

ALTER TABLE PlanCadreEnonce
ADD FOREIGN KEY(idPlanCadre) REFERENCES PlanCadre(idPlanCadre)

ALTER TABLE PlanCadreEnonce
ADD FOREIGN KEY(idCompetence) REFERENCES EnonceCompetence(idCompetence)

ALTER TABLE ElementConnaissance
ADD FOREIGN KEY (idActiviteApprentissage) REFERENCES ActiviteApprentissage(idActiviteApprentissage)

ALTER TABLE PlanCadreElement
ADD FOREIGN KEY(idElementConnaissance) REFERENCES ElementConnaissance(idElementConnaissance)
--Créé par Eddy
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
INSERT [dbo].[Programme] ([idProgramme],[nom], [annee], [dateValidation],[statusValider], [idDevis]) VALUES (1,'l''ancien programme', 2007, NULL, 0, 1)
GO
SET IDENTITY_INSERT [Programme] OFF
GO
SET IDENTITY_INSERT EnonceCompetence ON
GO
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (1, N'016N', N'Analyser les fonctions de travail', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (2, N'016P', N'Résoudre des problèmes mathématiques et
statistiques en informatique', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (3, N'016Q', N'Mettre à profit les possibilités d''un système
d''exploitation propre à une station de travail', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (4, N'016R', N'Installer des éléments physiques et logiques
dans une station de travail', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (5, N'016S', N'Exploiter un langage de programmation
structurée', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (6, N'016T', N'Appliquer une approche de développement par
objets', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (7, N'016U', N'Effectuer la recherche d’information', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (8, N'026V', N'Interagir et communiquer dans des situations de
travail variées', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (9, N'016W', N'Produire des algorithmes', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (10, N'016X', N'Produire une interface utilisateur', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (11, N'016Y', N'Planifier et gérer des activités de travail', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (12, N'016Z', N'Assurer la production et la gestion de
documents', 1, 1, 1)

/* Ajouté par Eddy le 2017 12 06 */
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
SET IDENTITY_INSERT ElementCompetence ON
GO
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (1, N'Caractériser les fonctions de travail et leurs conditions d''exercise', 1, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (2, N'Examiner les tâches et les opérations liées aux fonctions de travail', 2, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (3, N'Examiner les habiletés et les comportements nécessaire a l''exercice des fonctions de travail.', 3, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (4, N'Examiner la réglementation relative à l''exercice de la profession en général', 4, 1)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (5, N'Effectuer des traitements sur des données internes de l’ordinateur', 1, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (6, N'Effectuer des opérations logiques', 2, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (7, N'Organiser et traiter de l’information', 3, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (8, N'Résoudre des problèmes de programmation linéaire', 4, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (9, N'Résoudre des problèmes de dénombrement', 5, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (10, N'Résoudre des problèmes de probabilité et de statistique', 6, 2)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (11, N'Exploiter un système de fichiers', 1, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (12, N'Automatiser des tâches', 2, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (13, N'Utiliser les mécanismes de gestion de la mémoire', 3, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (14, N'Personnaliser l''environnement de la station de travail', 4, 3)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (15, N'Analyser l''architecture interne de l''ordinateur', 1, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (16, N'Planifier le travail', 2, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (17, N'Protéger l''environnement de la station de travail', 3, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (18, N'Installer des éléments physiques', 4, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (19, N'Désinstaller des éléments physiques', 5, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (20, N'Installer des éléments logiques', 6, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (21, N'Désinstaller des éléments logiques', 7, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (22, N'Vérifier l''installation de la station de travail dans l''environnement de l''utilisatrice et de l''utilisateur', 8, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (23, N'Consigner l''information sur l''installation', 9, 4)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (24, N'Préparer l’environnement de programmation.', 1, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (25, N'Adapter l’algorithme aux contraintes du langage de programmation.', 2, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (26, N'Traduire l’algorithme dans le langage de programmation.', 3, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (27, N'Compiler le programme', 4, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (28, N'Valider le programme', 5, 5)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (29, N'Créer un modèle objet', 1, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (30, N'Perfectionner le modèle objet', 2, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (31, N'Procéder à la codification d’une classe', 3, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (32, N'Valider le fonctionnement d’une classe', 4, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (33, N'Générer la version exécutable du programme', 5, 6)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (34, N'Préciser le besoin d’information', 1, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (35, N'Sélectionner et utiliser les sources de recherche', 2, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (36, N'Consulter et extraire l’information nécessaire', 3, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (37, N'Consigner les résultats de la recherche', 4, 7)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (38, N'Établir et entretenir des relations interpersonnelles', 1, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (39, N'Communiquer avec des personnes à l’interne et à l’externe', 2, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (40, N'Travailler au sein d’une équipe multidisciplinaire', 3, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (41, N'Appliquer une approche client', 4, 8)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (42, N'Analyser la situation', 1, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (43, N'Mettre au point l''algorithme', 2, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (44, N'Valider l''algorithme', 3, 9)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (45, N'Analyser les caractéristiques des utilisatrices et des utilisateurs', 1, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (46, N'Établir les caractéristiques d’interaction', 2, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (47, N'Choisir des périphériques d’entrée et de sortie', 3, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (48, N'Planifier l’organisation globale de l’interface', 4, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (49, N'Procéder à la programmation de l’interface utilisateur', 5, 10)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (50, N'Analyser les caractéristiques du travail à effectuer', 1, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (51, N'Procéder à la planification des activités', 2, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (52, N'Assurer le suivi des activités de travail', 3, 11)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (53, N'Choisir le support du document', 1, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (54, N'Produire un document technique et administratif', 2, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (55, N'Produire l’aide en ligne', 3, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (56, N'Produire un document de formation', 4, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (57, N'Diffuser un document', 5, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (58, N'Classer un document', 6, 12)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (59, N'Numériser des textes, des images et des sons', 1, 13)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (60, N'Créer et modifier des dessins à l’écran', 4, 13)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (61, N'Procéder à la saisie d’écrans', 5, 13)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (62, N'Établir le cadre technologique', 2, 14)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (63, N'Produire le prototype de présentation', 4, 14)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (64, N'Développer l’application', 6, 14)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (65, N'Corriger le problème', 3, 15)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (66, N'Valider la solution', 4, 15)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (67, N'Choisir et traiter des images.', 2, 20)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (68, N'Traiter des fichiers son, image et vidéo.', 3, 20)

SET IDENTITY_INSERT ElementCompetence OFF
GO
SET IDENTITY_INSERT ContexteRealisation ON
GO
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (1, N'a l''aide d''une information récente sur les fonctions de travail suivantes : - programeuse-analyste et programeur-analyste dans les domaine de la gestion et de l''indutrie', 1, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (2, N'À l''aide d''une information récente sur les entreprses dans lesquelles on trouve la programeuse-analyste et le programmeur-analyste et la et le gestionnaire de réseaux informatique', 2, 1)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (3, N'À partir de situations propres au domaine de l''informatique', 1, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (4, N'À partir d''une station de travail et d’un logiciel de statistiques', 2, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (5, N'À l''aide des manuels de références techniques appropriés', 3, 2)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (6, N'Dans des environnements utilisant des systèmes d’exploitation variés', 1, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (7, N'À partir d''une station de travail et des logiciels appropriés', 2, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (8, N'À l''aide des manuels de références techniques appropriés', 3, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (9, N'À partir des normes et des exigences de l''entreprise', 4, 3)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (10, N'En atelier et sur le lieu de travail de l''utilisatrice et de l''utilisateur', 1, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (11, N'À partir d''une demande préautorisée précisant la nature de l''installation', 2, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (12, N'À partir d''une station de travail', 3, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (13, N'À l''aide des éléments physiques et logiques à installer et des outils appropriés', 4, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (14, N'À partir des normes et des exigences de l''entreprise', 5, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (15, N'À l''aide des manuels de références techniques appropriés', 6, 4)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (16, N'À partir d’une station de travail et des logiciels appropriés', 1, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (17, N'À partir d’algorithmes valides et représentatifs du milieu de travail', 2, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (18, N'À partir des normes et des exigences de l’entreprise', 3, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (19, N'À l’aide des manuels de références techniques appropriés à l’environnement de programmation', 4, 5)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (20, N'À partir d''une station de travail et des logiciels appropriés', 1, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (21, N'À partir de situations représentatives du milieu du travail et nécessitant le développement d’applications comportant un nombre limité de classes', 2, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (22, N'À partir des normes et des exigences de l''entreprise', 3, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (23, N'À l’aide de toute la documentation disponible sur les applications à développer', 4, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (24, N'À l''aide des manuels de références techniques appropriés', 5, 6)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (25, N'À partir de besoins d’information précis propres au milieu de travail', 1, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (26, N'À partir de besoins d’information liés à la veille technologique', 2, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (27, N'À partir d’une station de travail et des logiciels appropriés', 3, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (28, N'À l’aide de manuels de références en français et en anglais', 4, 7)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (29, N'Dans des situations de travail variées', 1, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (30, N'En présence des personnes en cause', 2, 8)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (31, N'À partir de situations variées représentatives du milieu de travail', 1, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (32, N'À partir d''une station de travail et des logiciels appropriés', 2, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (33, N'À partir des exigences de l''entreprise', 3, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (34, N'À l’aide des manuels de références techniques appropriés', 4, 9)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (35, N'À partir d''une station de travail et des logiciels appropriés', 1, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (36, N'À partir d’applications variées nécessitant la création d’interfaces', 2, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (37, N'À partir des manuels de références techniques appropriés', 3, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (38, N'À partir des exigences de l''entreprise et des standards de l’informatique', 4, 10)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (39, N'Dans des situations de travail propres à la profession', 1, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (40, N'À l’aide des outils de planification appropriés', 2, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (41, N'À partir des exigences de l''entreprise', 3, 11)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (42, N'Pour des documents en français et en anglais', 1, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (43, N'À partir d’une station de travail et des logiciels de bureautique, de multimédia et de création d’aide en ligne', 2, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (44, N'À l’aide de dictionnaires, de grammaires et d’outils de référence variés', 3, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (45, N'À l’aide de l’inforoute et des services de télécommunication', 4, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (46, N'À partir des exigences de l’entreprise', 5, 12)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (47, N'À partir d''une station de travail multimédia, des logiciels graphiques et des utilitaires appropriés', 1, 13)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (48, N'À partir d’un numériseur', 2, 13)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (49, N'À partir de fichiers texte, son, image et vidéo', 3, 13)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (50, N'À l’aide des manuels de références techniques appropriés', 4, 13)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (51, N'À partir de situations représentatives du milieu de travail', 1, 14)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (52, N'À partir d’une station de travail et des outils de développement appropriés', 2, 14)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (53, N'À partir de réseaux internes et mondiaux', 3, 14)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (54, N'À partir d’une analyse des besoins', 4, 14)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (55, N'À partir des manuels de références techniques appropriés', 5, 14)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (56, N'À partir des exigences de l’entreprise et des standards de l’informatique', 6, 14)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (57, N'En collaboration avec les personnes participant au projet', 7, 14)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (58, N'À partir de programmes représentatifs du milieu de travail comportant des erreurs et des lacunes', 1, 15)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (59, N'À partir d''une station de travail et des logiciels appropriés', 2, 15)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (60, N'À partir des exigences de l''entreprise', 3, 15)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (61, N'À l''aide de documentation sur les programmes à corriger.', 4, 15)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (62, N'À l''aide des manuels de références techniques appropriés', 5, 15)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (63, N'À partir d''une station de travail multimédia, des logiciels graphiques et des utilitaires appropriés.', 1, 20)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (64, N'À partir d’un numériseur.', 2, 20)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (65, N'À partir de fichiers texte, son, image et vidéo.', 3, 20)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (66, N'À l’aide des manuels de références techniques appropriés.', 4, 20)


SET IDENTITY_INSERT ContexteRealisation OFF
GO
SET IDENTITY_INSERT CriterePerformance ON
GO
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (1, N'Pertinence de l’information recueillie', 1, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (2, N'Examen complet des caractéristiques générales des fonctions de travail et de leurs conditions d’exercice', 2, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (3, N'Reconnaissance des possibilités d’exercice des professions en entreprise et de pratique entrepreneuriale dans le domaine de l’informatique', 3, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (4, N'Reconnaissance des effets, sur le travail, de l’évolution technologique rapide dans le domaine de l’informatique', 4, 1)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (5, N'Examen complet des opérations, ainsi que des conditions d’exécution et des critères de performance des tâches associés aux différentes fonctions de travail', 1, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (6, N'Détermination exacte de l’importance relative des activités', 2, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (7, N'Mise en relation des étapes du processus de travail avec les tâches des fonctions de travail', 3, 2)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (8, N'Pertinence des liens établis entre les habiletés et comportements et les différentes tâches des fonctions de travail', 1, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (9, N'Examen complet des exigences liées à l’éthique professionnelle', 2, 3)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (10, N'Reconnaissance des droits et des responsabilités des personnes dans les relations employeur-employé et client-fournisseur', 1, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (11, N'Reconnaissance des conséquences des manquements aux lois et règlements', 2, 4)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (12, N'Représentation correcte de nombres dans différentes bases', 1, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (13, N'Conversion correcte de nombres d’une base à une autre', 2, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (14, N'Exécution correcte des opérations arithmétiques dans différentes bases', 3, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (15, N'Représentation juste de données dans la mémoire de l’ordinateur', 4, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (16, N'Interprétation juste des limites de représentation des données dans la mémoire de l’ordinateur', 5, 5)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (17, N'Formulation de propositions appropriées à différentes situations', 1, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (18, N'Construction d’une table de vérité conforme à une proposition', 2, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (19, N'Simplification correcte d’une proposition', 3, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (20, N'Utilisation appropriée de la méthode de preuve par induction', 4, 6)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (21, N'Construction d’ensembles et de sous-ensembles appropriés à différentes situations', 1, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (22, N'Exécution correcte de toutes les opérations dans les ensembles', 2, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (23, N'Établissement de relations justes entre des ensembles', 3, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (24, N'Formulation de propositions appropriées et dans leur forme la plus simple en vue de traiter l’information dans une situation donnée', 4, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (25, N'Traduction correcte des propositions en langage ensembliste', 5, 7)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (26, N'Représentation d’une situation sous forme d’un système d’équations linéaires approprié', 1, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (27, N'Exécution correcte des opérations dans les matrices', 2, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (28, N'Représentation juste d’un système d’équations linéaires sous forme matricielle', 3, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (29, N'Application correcte de méthodes de résolution de problèmes d’un système d’équations linéaires', 4, 8)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (30, N'Calcul exact du nombre de permutations dans un contexte donné', 1, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (31, N'Calcul exact du nombre d’arrangements dans un contexte donné', 2, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (32, N'Calcul exact du nombre de combinaisons dans un contexte donné', 3, 9)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (33, N'Calcul des probabilités d’événements liées aux lois binomiale, normale et de Poisson', 1, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (34, N'Détermination de la nature des variables appropriées à une situation donnée', 2, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (35, N'Choix d’échelles de mesure appropriées à une situation donnée', 3, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (36, N'Choix des mesures statistiques appropriées à une situation donnée', 4, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (37, N'Choix judicieux du mode de représentation de l’information', 5, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (38, N'Application rigoureuse des normes de présentation des tableaux et des graphiques', 6, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (39, N'Utilisation efficace des fonctionnalités d’un logiciel de statistiques', 7, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (40, N'Choix des méthodes d’échantillonnage appropriées à une situation donnée', 8, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (41, N'Estimation par intervalle d’une moyenne et d’une proportion pour des grands échantillons', 9, 10)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (42, N'Comparaison des possibilités et des limites des systèmes de fichiers de différents systèmes d''exploitation', 1, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (43, N'Utilisation correcte des commandes de manipulation des fichiers', 2, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (44, N'Utilisation correcte des commandes de manipulation des répertoires', 3, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (45, N'Utilisation correcte des commandes visant à assurer la sécurité des fichiers et des répertoires', 4, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (46, N'Utilisation correcte des outils visant le stockage et l''intégrité des données', 5, 11)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (47, N'Analyse judicieuse des possibilités et des limites des différents systèmes d''exploitation au regard de l''exécution des tâches', 1, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (48, N'Utilisation correcte du langage de commande propre au système d''exploitation', 2, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (49, N'Utilisation appropriée des commandes en vue d’établir l’ordre de priorité des tâches', 3, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (50, N'Adaptation appropriée des paramètres de sécurité aux exigences des tâches', 4, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (51, N'Application des techniques de débogage appropriées au système d''exploitation', 5, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (52, N'Consignation des commentaires pertinents', 6, 12)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (53, N'Analyse judicieuse des possibilités et des limites des différents systèmes d''exploitation au regard de la gestion de la mémoire', 1, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (54, N'Allocation de la mémoire appropriée aux besoins relatifs à l''exécution d''une tâche', 2, 13)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (55, N'Comparaison des différents types de fichiers de configuration propres au système d''exploitation', 1, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (56, N'Utilisation correcte des commandes de configuration de base du poste de travail', 2, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (57, N'Utilisation correcte des commandes de démarrage et de configuration des périphériques', 3, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (58, N'Démarrage des programmes appropriés aux besoins de l''utilisatrice et de l''utilisateur', 4, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (59, N'Adaptation des paramètres de configuration de l''environnement de travail aux exigences de l''utilisatrice et de l''utilisateur', 5, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (60, N'Consignation précise des paramètres de personnalisation', 6, 14)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (61, N'Distinction et repérage des éléments de la carte maîtresse', 1, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (62, N'Reconnaissance des caractéristiques et des fonctions propres aux processeurs, aux mémoires, aux bus et aux horloges', 2, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (63, N'Reconnaissance des caractéristiques et des fonctions propres aux différents ports de communication', 3, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (64, N'Reconnaissance des relations entre les différents éléments', 4, 15)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (65, N'Analyse judicieuse de la demande', 1, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (66, N'Préparation du matériel nécessaire', 2, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (67, N'Détermination juste de la séquence des opérations', 3, 16)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (68, N'Consignation complète de la configuration physique initiale', 1, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (69, N'Copie de l''ensemble des données', 2, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (70, N'Prise des mesures de sécurité appropriées', 3, 17)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (71, N'Interprétation correcte des fiches techniques', 1, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (72, N'Détermination appropriée de chacun des paramètres d''installation', 2, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (73, N'Installation de l''élément à l''endroit approprié', 3, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (74, N'Configuration conforme à l''environnement du poste', 4, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (75, N'Vérification appropriée du fonctionnement de l''élément', 5, 18)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (76, N'Interprétation judicieuse de l’information technique', 1, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (77, N'Respect du processus de désinstallation en fonction de l’élément à retirer', 2, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (78, N'Prise des précautions appropriées', 3, 19)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (79, N'Interprétation judicieuse de l''information technique', 1, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (80, N'Démarrage approprié de l''installation', 2, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (81, N'Choix des paramètres d''installation en fonction de l''environnement du poste', 3, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (82, N'Vérification approprié du fonctionnement de l''élément', 4, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (83, N'Personnalisation de l''élément appropriée aux besoins de l’utilisatrice et de l''utilisateur', 5, 20)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (84, N'Copie correcte des disques', 1, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (85, N'Interprétation judicieuse de l''information technique', 2, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (86, N'Utilisation appropriée des outils de désinstallation', 3, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (87, N'Respect du processus de désinstallation manuelle', 4, 21)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (88, N'Vérification appropriée du fonctionnement de l''ensemble des éléments', 1, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (89, N'Résolution efficace des problèmes d''installation', 2, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (90, N'Installation de la station de travail conforme aux principes de l''ergonomie', 3, 22)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (91, N'Prise en note de la nouvelle configuration', 1, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (92, N'Rédaction claire et correcte des problèmes éprouvés et des solutions apportées', 2, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (93, N'Mise à jour précise de l''inventaire', 3, 23)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (94, N'Vérification méthodique de l’accès aux différents éléments physiques et logiques de l’environnement', 1, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (95, N'Configuration de l’environnement appropriée aux caractéristiques de la situation', 2, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (96, N'Personnalisation de l’environnement efficace et conforme aux exigences de l’entreprise', 3, 24)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (97, N'Modification appropriée de la représentation des données', 1, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (98, N'Adaptation correcte des conditions d’exécution', 2, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (99, N'Modification appropriée des structures de traitement', 3, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (100, N'Adaptation appropriée de la séquence des opérations', 4, 25)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (101, N'Utilisation efficace des fonctionnalités d’édition de l’environnement', 1, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (102, N'Application des règles de syntaxe et de sémantique propres au langage utilisé', 2, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (103, N'Application rigoureuse des standards de codification', 3, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (104, N'Application judicieuse des principes de la programmation structurée', 4, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (105, N'Mise à profit judicieuse des possibilités du langage', 5, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (106, N'Consignation des commentaires pertinents et conformes aux exigences de l’entreprise', 6, 26)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (107, N'Utilisation efficace des fonctionnalités de compilation de l’environnement', 1, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (108, N'Repérage des erreurs de compilation', 2, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (109, N'Correction des erreurs de compilation', 3, 27)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (110, N'Utilisation efficace des fonctionnalités d’exécution et de débogage de l’environnement', 1, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (111, N'Préparation correcte des jeux d’essai nécessaires à la vérification du fonctionnement du programme', 2, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (112, N'Interprétation juste des résultats', 3, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (113, N'Débogage approprié du programme selon l’algorithme', 4, 28)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (114, N'Établissement complet des domaines d’application', 1, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (115, N'Détermination des classes pertinentes', 2, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (116, N'Établissement des relations hiérarchiques appropriées entre les classes', 3, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (117, N'Détermination des services de chacune des classes', 4, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (118, N'Détermination des attributs pertinents compte tenu de chacune des classes', 5, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (119, N'Représentation graphique appropriée du modèle objet', 6, 29)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (120, N'Mise au point de la séquence des opérations propres aux différents services de la classe', 1, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (121, N'Représentation graphique appropriée du modèle séquentiel', 2, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (122, N'Modification appropriée du modèle objet', 3, 30)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (123, N'Préparation appropriée de l''environnement de programmation', 1, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (124, N'Déclaration et définition de la classe respectant les règles de syntaxe et de sémantique du langage', 2, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (125, N'Exploitation judicieuse des possibilités du langage dans l''application des principes d''encapsulation, d''héritage et de polymorphisme', 3, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (126, N'Application rigoureuse des standards de nomenclature et de documentation reconnus propres à l''entreprise', 4, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (127, N'Repérage et correction des erreurs de compilation de la classe', 5, 31)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (128, N'Préparation correcte des jeux d''essai nécessaires à la vérification du bon fonctionnement de tous les services de la classe', 1, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (129, N'Création d''un environnement de test approprié', 2, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (130, N'Interprétation juste des résultats', 3, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (131, N'Débogage approprié de la classe', 4, 32)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (132, N'Utilisation des mécanismes de génération propres à l’outil employé', 1, 33)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (133, N'Précision juste du besoin de recherche', 1, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (134, N'Détermination des critères permettant de choisir correctement les sources de la recherche', 2, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (135, N'Manifestation d’initiative', 3, 34)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (136, N'Sélection judicieuse des sources en fonction de la nature et des critères de la recherche', 1, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (137, N'Utilisation correcte et efficace des méthodes et des outils de recherche conventionnels et informatiques', 2, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (138, N'Prise en considération des risques de s’éloigner du besoin initial', 3, 35)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (139, N'Pertinence de l’information consultée', 1, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (140, N'Interprétation juste de l’information en français et en anglais', 2, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (141, N'Pertinence de l’information extraite en fonction du besoin initial', 3, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (142, N'Manifestation de curiosité', 4, 36)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (143, N'Clarté, précision et pertinence de l’information consignée', 1, 37)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (144, N'Prise en considération de ses forces et de ses faiblesses en matière de relations interpersonnelles', 1, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (145, N'Manifestation d’attitudes favorisant des relations interpersonnelles harmonieuses', 2, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (146, N'Application rigoureuse des règles de politesse et de courtoisie', 3, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (147, N'Adaptation de son approche selon les personnes et les situations', 4, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (148, N'Utilisation appropriée des techniques de gestion des conflits interpersonnels', 5, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (149, N'Manifestation de comportements conformes à l’éthique professionnelle', 6, 38)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (150, N'Manifestation d’une attitude d’écoute et de réceptivité', 1, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (151, N'Adaptation du niveau de langage selon l’interlocutrice et l’interlocuteur', 2, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (152, N'Application correcte des techniques de communication verbale et non verbale', 3, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (153, N'Utilisation appropriée des techniques de négociation et d’argumentation', 4, 39)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (154, N'Distinction juste du rôle et des responsabilités des membres de l’équipe', 1, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (155, N'Prise de ses responsabilités au sein de l’équipe', 2, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (156, N'Contribution active aux activités de l’équipe', 3, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (157, N'Utilisation appropriée des techniques de négociation et d’argumentation', 4, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (158, N'Manifestation d’attitudes favorisant le travail d’équipe', 5, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (159, N'Respect du mode d’action établi par l’équipe', 6, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (160, N'Respect des décisions prises par les membres de l’équipe', 7, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (161, N'Contribution efficace à la résolution des problèmes éprouvés par les membres de l’équipe', 8, 40)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (162, N'Interprétation juste des besoins', 1, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (163, N'Manifestation d’un souci constant de répondre aux besoins des clientes et des clients', 2, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (164, N'Vérification régulière de la satisfaction des clientes et des clients', 3, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (165, N'Réaction appropriée devant les problèmes soulevés par les clientes et les clients', 4, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (166, N'Manifestation d’un souci constant d’améliorer la qualité des services et des produits', 5, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (167, N'Manifestation de comportements conformes à l’éthique professionnelle', 6, 41)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (168, N'Établissement correcte des données d''entrée', 1, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (169, N'Établissement correcte des données de sortie', 2, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (170, N'Établissement correcte de la nature des traitements', 3, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (171, N'Détermination correcte des conditions d’exécution de l''algorithme', 4, 42)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (172, N'Choix d’un mode de représentation de l''algorithme conforme aux exigences de l''entreprise', 1, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (173, N'Détermination d''une séquence logique des opérations', 2, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (174, N'Détermination des structures de traitement appropriées à chacune des opérations', 3, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (175, N'Application rigoureuse des règles de syntaxe propres au mode de représentation retenu', 4, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (176, N'Recherche d''une solution algorithmique efficace', 5, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (177, N'Représentation précise de la solution algorithmique retenue', 6, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (178, N'Présence de toute l''information nécessaire à l''interprétation de l''algorithme', 7, 43)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (179, N'Vérification de la pertinence de la solution compte tenu de la situation initiale', 1, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (180, N'Détermination des erreurs et des lacunes de la solution algorithmique mise au point', 2, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (181, N'Modification appropriée de la solution algorithmique', 3, 44)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (182, N'Examen des caractéristiques des utilisatrices et des utilisateurs liées à l’âge, à la culture et à la scolarisation', 1, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (183, N'Détermination du degré de familiarité avec l’informatique en général et avec l’application à utiliser', 2, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (184, N'Détermination du degré de réceptivité des utilisatrices et des utilisateurs par rapport à l’application à utiliser', 3, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (185, N'Précision des attentes des utilisatrices et des utilisateurs', 4, 45)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (186, N'Reconnaissance des caractéristiques de l’environnement physique', 1, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (187, N'Détermination des modalités d’interaction', 2, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (188, N'Définition des caractéristiques des tâches d’interaction', 3, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (189, N'Vérification de la cohérence entre les modalités et les tâches', 4, 46)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (190, N'Prise en considération des caractéristiques des utilisatrices et des utilisateurs', 1, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (191, N'Prise en considération des caractéristiques de l’interaction', 2, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (192, N'Prise en considération des caractéristiques des exigences d’ergonomie', 3, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (193, N'Prise en considération des contraintes de fiabilité, de coût et de maintenance', 4, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (194, N'Interprétation correcte des fiches techniques des produits offerts sur le marché', 5, 47)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (195, N'Établissement des actions et des exceptions liées aux tâches', 1, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (196, N'Détermination des éléments de présentation des actions et des exceptions', 2, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (197, N'Organisation spatiale appropriée des éléments', 3, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (198, N'Détermination des caractéristiques de présentation des éléments', 4, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (199, N'Organisation de l’interface conforme aux critères d’esthétisme et d’efficacité', 5, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (200, N'Consignation de l’information relative à l’interface', 6, 48)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (201, N'Création des éléments selon les caractéristiques de présentation choisies', 1, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (202, N'Positionnement des éléments selon l’organisation spatiale retenue', 2, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (203, N'Établissement des liens entre les éléments et les programmes de l’application', 3, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (204, N'Validation du fonctionnement de l’interface', 4, 49)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (205, N'Détermination correcte des principales tâches et de leur séquence', 1, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (206, N'Estimation du temps nécessaire à l’exécution des principales tâches', 2, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (207, N'Prise en considération des échéances établies pour l’exécution du travail', 3, 50)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (208, N'Établissement correct de priorités', 1, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (209, N'Prise en considération des points critiques', 2, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (210, N'Prévision d’une marge de manœuvre suffisante pour faire face aux imprévus', 3, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (211, N'Utilisation appropriée des méthodes et des outils de planification', 4, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (212, N'Établissement d’un calendrier des travaux réaliste', 5, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (213, N'Détermination correcte des ressources humaines et matérielles nécessaires à l’exécution du travail', 6, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (214, N'Communication efficace avec les personnes en cause', 7, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (215, N'Présentation correcte du plan de travail pour approbation', 8, 51)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (216, N'Utilisation d’une méthode appropriée de suivi des activités', 1, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (217, N'Gestion efficace du temps', 2, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (218, N'Respect du calendrier des travaux', 3, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (219, N'Adaptation régulière du calendrier des travaux en fonction des imprévus', 4, 52)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (220, N'Détermination juste du support nécessaire', 1, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (221, N'Sélection et utilisation correcte du logiciel de création du document', 2, 53)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (222, N'Établissement juste du plan de travail pour le document à produire', 1, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (223, N'Préparation appropriée des éléments de contenu', 2, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (224, N'Application rigoureuse des règles grammaticales et orthographiques', 3, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (225, N'Établissement correct du format de mise en page', 4, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (226, N'Adaptation correcte du niveau de langage en fonction du public cible', 5, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (227, N'Clarté du texte', 6, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (228, N'Utilisation efficace des logiciels de bureautique et de multimédia', 7, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (229, N'Respect des normes de mise en page', 8, 54)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (230, N'Sélection des éléments qui nécessitent de l’aide en ligne', 1, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (231, N'Respect des normes de présentation', 2, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (232, N'Application rigoureuse des règles grammaticales et orthographiques', 3, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (233, N'Adaptation correcte du niveau de langage en fonction du public cible', 4, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (234, N'Utilisation correcte du logiciel de création d’aide en ligne', 5, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (235, N'Facilité d’utilisation de l’aide en ligne', 6, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (236, N'Vérification de la cohérence de l’aide en ligne', 7, 55)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (237, N'Prise en considération des objectifs d’apprentissage en fonction du public cible et du contexte de formation', 1, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (238, N'Préparation appropriée des éléments de contenu', 2, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (239, N'Utilisation correcte des outils de production du document', 3, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (240, N'Respect des normes de présentation', 4, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (241, N'Application rigoureuse des règles grammaticales et orthographiques', 5, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (242, N'Adaptation correcte du niveau de langage en fonction du public cible', 6, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (243, N'Vérification minutieuse du document', 7, 56)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (244, N'Établissement juste de la liste de diffusion', 1, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (245, N'Sélection et utilisation du mode de diffusion', 2, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (246, N'Vérification systématique de la réception', 3, 57)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (247, N'Respect des règles de conservation d’un document', 1, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (248, N'Attribution précise d’un code à partir du plan de classification', 2, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (249, N'Précision et concision du titre d’un document selon les normes', 3, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (250, N'Consignation minutieuse de l’information dans l’outil de repérage', 4, 58)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (251, N'Réglage approprié des paramètres de résolution et de dimension de l’image', 1, 59)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (252, N'Réglage approprié des paramètres sonores', 2, 59)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (253, N'Application correcte de la procédure de numérisation', 3, 59)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (254, N'Sélection d’un format d’image, de son et de texte approprié aux besoins', 4, 59)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (255, N'Compression et décompression efficaces des fichiers', 5, 59)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (256, N'Utilisation efficace des logiciels de numérisation et des outils d’aide en ligne', 6, 59)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (257, N'Archivage approprié des fichiers dans une bibliothèque', 7, 59)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (258, N'Examen des caractéristiques des logiciels graphiques en mode vectoriel et bitmap', 1, 60)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (259, N'Mise à profit efficace des possibilités des logiciels de création et de modification de formes', 2, 60)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (260, N'Mise à profit efficace des possibilités de logiciels de sélection, de modification et d’application des couleurs et des textures', 3, 60)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (261, N'Application correcte des techniques de dessin', 4, 60)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (262, N'Manifestation de créativité et d’esthétisme', 5, 60)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (263, N'Configuration approprié d’un logiciel de saisie d’écrans', 1, 61)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (264, N'Mise à profit correcte des possibilités du logiciel de saisie d’écrans', 2, 61)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (265, N'Insertion et traitement approprié de l’objet saisi', 3, 61)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (266, N'Reconnaissances des facteurs influant sur les choix technologiques', 1, 62)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (267, N'Détermination de l’architecture appropriée', 2, 62)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (268, N'Prise en considération des possibilités d’évolution du contexte d’utilisation et des technologies', 3, 62)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (269, N'Choix du matériel et des logiciels appropriés à l’architecture retenue', 4, 62)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (270, N'Exploitation correcte des possibilités des outils de développement', 1, 63)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (271, N'Établissement approprié des caractéristiques de l’exploration', 3, 63)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (272, N'Représentation graphique correcte des écrans', 3, 63)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (273, N'Détermination des caractéristiques globales de présentation des écrans', 4, 63)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (274, N'Représentation de l’interface de l’application conformément aux exigences de l’ergonomie et de l’esthétisme', 5, 63)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (275, N'Présentation du prototype pour approbation aux personnes responsables', 6, 63)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (276, N'Codification appropriée des écrans', 1, 64)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (277, N'Codification des fonctions de l’application conformément aux exigences de l’entreprise', 2, 64)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (278, N'Résolution efficace des problèmes de conception de l''algorithme', 1, 65)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (279, N'Résolution efficace des problèmes de traduction de l''algorithme dans le langage de programmation', 2, 65)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (280, N'Résolution efficace des problèmes d''utilisation du langage de programmation', 3, 65)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (281, N'Analyse de l''effet de la solution sur l''ensemble du programme', 1, 66)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (282, N'Préparation des jeux d’essai appropriés', 2, 66)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (283, N'Interprétation juste des résultats', 3, 66)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (284, N'Fonctionnement correct du programme', 4, 66)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (285, N'Choix judicieux des images à partir des bibliothèques.', 1, 67)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (286, N'Mise à profit efficace des possibilités d’amélioration de la qualité d’une image.', 2, 67)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (287, N'Mise à profit efficace des possibilités de modification, de manipulation et d’assemblage des éléments d’une image.', 3, 67)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (288, N'Mise à profit efficace des possibilités de sélection, de modification et de calibration des couleurs et des textures.', 4, 67)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (289, N'Importation correcte des images d’une bibliothèque.', 5, 67)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (290, N'Archivage approprié des images dans une bibliothèque.', 6, 67)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (291, N'Détermination du format du fichier à convertir.', 1, 68)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (292, N'Détermination du format de conversion conformément aux exigences de compatibilité.', 2, 68)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (293, N'Application correcte de la procédure de conversion.', 3, 68)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (294, N'Utilisation correcte des utilitaires de compression et de décompression des fichiers son, image et vidéo.', 4, 68)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (295, N'Utilisation efficace des outils d’aide en ligne.', 5, 68)


SET IDENTITY_INSERT CriterePerformance OFF
GO
SET IDENTITY_INSERT [TypePlanCadre] ON
GO
INSERT [dbo].[TypePlanCadre] ([idType], [nom]) VALUES (1, 'Spécifique')
INSERT [dbo].[TypePlanCadre] ([idType], [nom]) VALUES (2, 'Générale')
INSERT [dbo].[TypePlanCadre] ([idType], [nom]) VALUES (3, 'Contributif')
SET IDENTITY_INSERT [TypePlanCadre] OFF
GO

SET IDENTITY_INSERT [PlanCadre] ON
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (1, N'420-JAC-JQ', N'Informatique et technologie', 1, 2, 1,
N'Ce cours de première session permettra à l''élève de se familiariser avec le monde de l’informatique et aux fonctions de travail.  Plus précisément, il vise à rendre l''élève capable de faire un choix éclairé quant à l''orientation de sa carrière.  De plus, il permettra un tour d''horizon des outils de base nécessaires au travail de l''élève en informatique.',
N'      <ul>
                <li>Laboratoire d''exploitation (un poste de travail par élève).</li>
                <li>Branchement Internet.</li>
                <li>Suite bureautique.</li>
        </ul>
',
N'      <ul>
                <li>Sites Web :</li>
                        <ul>
                                <li>http://www.technocompetences.qc.ca</li>
                                <li>http://www.directioninformatique.com</li>
                                <li>http://www.w3schools.com</li>
                                <li>http://siteduzero.com</li>
                        </ul>
        </ul>
', 1, 1)

/* Attention les [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir] sont fictivres => FIC dans le code*/
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource],  [idProgramme], [idType]) VALUES (2,'420-FIC-JQ','Conception d''interfaces', 1, 2, 2,
N'Ce cours offert à la première session s''inscrit dans l''axe de développement d’applications mobiles du programme. Il permettra à l''élève de connaître les concepts nécessaires à l’élaboration d’interfaces de qualité.

Un accent particulier sera mis sur la curiosité intellectuelle et la capacité de parfaire ses connaissances de façon autonome.',
N'Salle de classe théorique et laboratoire d''exploitation (Un poste de travail par élève).
Branchement Internet et réseau local.
Numériseur, appareil-photo et vidéo numérique.
Micro/écouteurs (un par élève). Périphériques non standards.
Logiciels :
de traitement d’image; de son; de dessin et de saisie d’écran.
Appareils mobiles (tablettes et/ou téléphones intelligents).',
N'      <ul>
                <li>Guides de l''utilisateur des logiciels.</li>
                <li>Manuels techniques des manufacturiers.</li>
                <li>Guides sur l’ergonomie,  spécifiques aux plates-formes utilisées.</li>
                <li>Revues diverses se rapportant au domaine de l’informatique, telles que : PC Expert, Science et vie micro ou L’ordinateur individuel.</li>
                <li>Sites Web :</li>
                        <ul>
                                <li>http://www.developpez.com</li>
                                <li>http://www.w3schools.com</li>
                                <li>http://fr.openclassrooms.com/</li>
                        </ul>
        </ul>'
, 1,1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [idProgramme], [idType]) VALUES (3,'420-FIC-JQ','Installation et configuration des ordinateurs',1, 2, 2, 1,1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours],[nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (4,'420-JBB-JQ','Programmation et introduction aux objets',2,4,2,
N'Ce cours, offert à la première session, s''inscrit dans l''axe Programmation de la formation. Il permettra à l''élève de développer son aptitude à résoudre des problèmes et à appliquer des principes de programmation structurée. À ce titre, il joue un rôle fondamental dans la formation.
Les principes qui y seront développés seront repris dans l''ensemble des cours comprenant une portion de programmation. 
Un accent particulier sera mis sur l''esprit de logique, d''analyse et de synthèse.  D''autre part, on initiera l''élève à évaluer la qualité de son travail, compétence essentielle en informatique.
Ce cours repose sur une approche par processus. L''élève réalisera des activités d''apprentissage qui couvriront toute la démarche de résolution de problèmes et de mise au point d''un programme, et ce, sur des situations de complexité crois-sante.
La formation souhaitée sera plus axée sur les méthodes de travail à développer que sur les multiples possibilités du langage de programmation',
N'      <ul>
                <li>Salle de classe théorique et laboratoire d''exploitation (Un poste de travail par élève).</li>
                <li>Logiciel du langage de programmation.</li>
        </ul>
',
N'      <ul>
                <li>Notes de cours.</li>
                <li>Sites Web :</li>
                        <ul>
                                <li>http://www.developpez.com</li>
                                <li>http://www.w3schools.com</li>
                                <li>http://siteduzero.com</li>
                        </ul>
        </ul>
',1,1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [idProgramme], [idType]) VALUES (5,'420-FIC-JQ','Conception et manipulation de base de données',1, 2, 2, 1, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (6,'420-JJA-JQ','Programmation mobile',1,2,2,
N'Ce cours offert à la deuxième session s''inscrit dans l''axe développement mobile du programme. Il permettra à l''élève de connaître les concepts nécessaires à l’élaboration d’application mobile.

Les attitudes visées dans ce cours sont la créativité, le travail en équipe et la tenacité.

Un accent particulier sera mis sur la curiosité intellectuelle et la capacité de parfaire ses connaissances de façon autonome.',
N'      <ul>
                <li>Salle de classe théorique et laboratoire d''exploitation (1 poste de travail par élève).</li>
                <li>Logiciel du langage de programmation.</li>
        </ul>
',
N'      <ul>
                <li>Des notes de cours et des références internet seront fournies durant la session par le professeur.</li>
                <li>Sites Web :</li>
                        <ul>
                                <li>http://www.w3schools.com/html/html5_intro.asp</li>
                                <li>http://www.w3.org/html/wg/drafts/html/master/</li>
                        </ul>
                <li>Manuels de référence pour consultation. Les manuels devront être actualisés dès qu’un nouveau logiciel est utilisé.</li>
                <li>Articles de revues, journaux sur la profession, sur le matériel et les logiciels.</li>
        </ul>
',1,1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours],[nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (7,'420-JFB-JQ','Système d''exploitation',1,3,1,
N'Ce cours, offert à la deuxième session, s''inscrit dans l''axe matériel informatique et soutien technique.  Il permettra à l''élève de développer son aptitude à installer, à configurer et à comprendre le fonctionnement des systèmes d''exploitation.

Un accent particulier sera mis sur les concepts des systèmes d''exploitation afin de permettre aux élèves d''effectuer les transferts à d''autres environnements informatiques.',
N'      <ul>
                <li>Salle de classe théorique et laboratoire d''exploitation et d''expérimentation (Un poste de travail par élève).</li>
                <li>Différents systèmes d''exploitation.</li>
                <li>Branchement Internet et réseau local.</li>
        </ul>
',
N'      <ul>
                <li>Sans suggérer de titre particulier, il est fortement recommandé d''utiliser un manuel de référence ou des notes de cours appartenant en propre à l''élève pour l''obliger à effectuer des lectures et à s''approprier la matière.</li>
                <li>Manuels de référence des systèmes d''exploitation.</li>
        </ul>
',1,1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [idProgramme], [idType]) VALUES (8,'420-FIC-JQ','Programmation orientée objet : concepts',2,1,3,1,1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [idProgramme], [idType]) VALUES (9,'420-FIC-JQ','Conception d’applications mobiles',1,1,4,1,1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [idProgramme], [idType]) VALUES (10,'420-FIC-JQ','Exploitation des réseaux',4,1,1,1,1)
GO
/* Ajout des plans cadre par Eddy : 2017-12-06 */
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (11,'420-JBB-JQ','Programmation et introduction aux objets_EF', 2, 4, 2, 'Spécifique',NULL,NULL, 1, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (12,'420-JAC-JQ','Informatique et technologie_EF', 3, 3, 2, 'Spécifique',NULL,NULL, 1, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (13,'420-KCC-JQ','Conception d''interface_EF', 1, 4, 1, 'Spécifique',NULL,NULL, 1, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (14,'420-KEB-JQ','POO Avancée_EF', 1, 4, 1, 'Spécifique',NULL,NULL, 1, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (15,'420-MAT-JQ','Maths_EF', 3, 3, 2, 'Contributif',NULL,NULL, 1, 3)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (16,'601-101-JQ','Écriture et littérature_EF', 2, 2, 3, 'Générale',NULL,NULL, 1, 2)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (17,'601-102-JQ','Littérature et inaginaire_EF', 3, 1, 3, 'Générale',NULL,NULL, 1, 2)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (18,'604-100-MQ','Anglais de base_EF', 2, 1, 3, 'Générale',NULL,NULL, 1, 2)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (19,'604-100-MQ','Anglais adapté_EF', 2, 1, 3, 'Générale',NULL,NULL, 1, 2)
GO
/* Fin ajout */

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
SET IDENTITY_INSERT [planCadrePrealable] ON
GO
INSERT [dbo].[PlanCadrePrealable] ([idPlanCadrePrealable],[idPlanCadre],[idPrealable],[idStatus]) VALUES(1,6,2,2)
GO
INSERT [dbo].[PlanCadrePrealable] ([idPlanCadrePrealable],[idPlanCadre],[idPrealable],[idStatus]) VALUES(2,6,4,2)
GO
INSERT [dbo].[PlanCadrePrealable] ([idPlanCadrePrealable],[idPlanCadre],[idPrealable],[idStatus]) VALUES(3,8,4,2)
GO
INSERT [dbo].[PlanCadrePrealable] ([idPlanCadrePrealable],[idPlanCadre],[idPrealable],[idStatus]) VALUES(4,7,3,1)
GO
INSERT [dbo].[PlanCadrePrealable] ([idPlanCadrePrealable],[idPlanCadre],[idPrealable],[idStatus]) VALUES(5,9,6,2)
GO
INSERT [dbo].[PlanCadrePrealable] ([idPlanCadrePrealable],[idPlanCadre],[idPrealable],[idStatus]) VALUES(7,10,7,2)
GO

SET IDENTITY_INSERT planCadrePrealable OFF

GO

GO
SET IDENTITY_INSERT [PlanCadreEnonce] ON
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (1, 1, 1, 20)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (2, 1, 12, 15)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (3, 6, 13, 15)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (4, 6, 14, 30)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (5, 7, 3, 45)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (6, 7, 4, 15)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (7, 4, 9, 45)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (8, 4, 5, 30)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (9, 4, 15, 15)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (10, 3, 4, 50)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (11, 3, 7, 10)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (12, 2, 10, 30)
GO
INSERT [dbo].[PlanCadreEnonce] ([idPlanCadreEnonce], [idPlanCadre], [idCompetence], [ponderationEnHeure]) VALUES (13, 2, 20, 15)
GO
SET IDENTITY_INSERT [PlanCadreEnonce] OFF
GO
SET IDENTITY_INSERT [ActiviteApprentissage] ON
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(1,
N'      <ul>
                <li>À partir de sources identifiées en classe, lire sur es fonctions de travail pour en identifier les différentes conditions d''exercices.</li>
                <li>Assister à des conférences et visiter des entreprises du domaine de l''informatique</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(2,
N'      <ul>
                <li>À partir de sources identifiées en classe, lire sur les différentes fonctions de travail pour mieux comprendre les tâches et les opérations qui s''y rattachent.</li>
                <li>Effectuer des recherches sur les différents types d''emplois.</li>
                <li>Assister à des conférences et à des présentations sur les types d''emplois et de formations.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(3,
N'      <ul>
                <li>À partir de sources identifiées en classe, lire sur l''éthique professionnel pour en saisir l''importance.</li>
                <li>À partir de mises en situation, identifier les habiletés, les attitudes et les comportements adéquats.</li>
                <li>Étudier différents codes d''éthique pour en relever les éléments significatifs.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(4,
N'      <ul>
                <li>À partir de sources identifiées en classe, lire sur les lois et règlements qui s''appliquent au domaine de l''informatique de gestion.</li>
                <li>À partir de mises en situation, identifier les lois ou règlements qui s''appliquent.</li>
                <li>À partir de cas vécus, identifier les manquements aux lois et aux règlements.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(5,
N'      <ul>
                <li>Effectuer des exercices pratiques permettant d''expérimenter les logiciels.</li>
                <li>À partir d''une recherche d''information et dans les contextes associés aux fonctions de travail, réaliser la production de documents :</li>
                        <ul>
                                <li>sélectionner le logiciel de production du document;</li>
                                <li>produire un document respectant les normes et les standarts de la profession.</li>
                        </ul>
                        
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(6,
N'      <ul>
                <li>Faire des lectures en lien avec la théorie et les concepts.</li>
                <li>Faire des exercices de résolution de problèmes.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(7,
N'      <ul>
                <li>Faire des lectures en lien avec la théorie et les concepts.</li>
                <li>Faire des rédactions d''algorithmes simples.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(8,
N'      <ul>
                <li>Effectuer des lectures en lien avec la théorie et les concepts.</li>
                <li>Faire des exercices de simulation du contenu de la mémoire et des sorties produites.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(9,
N'      <ul>
                <li>Effectuer des lectures en lien avec la théorie et les concepts.</li>
                <li>Faire des exercices de familiarisation avec l''environnement de développement.</li>
                <li>À partir de contextes spécifiques, réaliser le processus complet sur des situations de plus en plus complexes :</li>
                        <ul>
                                <li>analyse du problème;</li>
                                <li>élaboration du jeu d''essai;</li>
                                <li>conception d''une solution;</li>
                                <li>rédaction d’un algorithme;</li>
                                <li>traduction et saisie dans le langage de programmation;</li>
                                <li>mise au point du programme;</li>
                                <li>documentation du programme;</li>
                                <li>présentation du dossier de programmation;</li>
                                <li>autoévaluation du travail réalisé.</li>
                        </ul>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(10,
N'      <ul>
                <li>À partir d''un programme contenant des erreurs de compilation :</li>
                        <ul>
                                <li>identifier les erreurs;</li>
                                <li>les corriger;</li>
                                <li>compiler le programme;</li>
                                <li>vérifier l''exécution.</li>
                        </ul>
                <li>À partir du dossier de programmation d''un programme fait par quelqu’un d’autre et contenant des erreurs de logique déjà identifiées :</li>
                        <ul>
                                <li>corriger l''algorithme;</li>
                                <li>modifier le programme;</li>
                                <li>compiler le programme;</li>
                                <li>vérifier l''exécution.</li>
                        </ul>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(11,
N'<ul>
        <li>À partir de sources identifiées en classe, lire sur les composantes et leurs caractéristiques afin d’en comprendre le fonctionnement.</li>
        <li>Effectuer des exercices permettant de comprendre le fonctionnement des différents composants et de leurs interactions.</li>
</ul>




')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(12,
N'      <ul>
                <li>À partir d’une demande :</li>
                        <ul>
                                <li>planifier l’installation du nouveau matériel;</li>
                                <li>consigner l’information;</li>
                                <li>sauvegarder les données du système à modifier.</li>
                        </ul>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(13,
N'      <ul>
                <li>À partir de situations variées, réaliser le processus d''installation d’éléments physiques et de configuration nécessaires :</li>
                        <ul>
                                <li>planifier les étapes;</li>
                                <li>procéder à l’installation physique des composants;</li>
                                <li>configurer le système;</li>
                                <li>vérifier l''installation;</li>
                                <li>consigner l’information.</li>
                        </ul>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(14,
N'      <ul>
                <li>Procéder à la désinstallation de certains composants.</li>
        </ul>

')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(15,
N'      <ul>
                <li>Procéder à la désinstallation de certains composants logiques.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(16,
N'      <ul>
                <li>Procéder à la vérification minutieuse du fonctionnement de la station de travail de l’utilisatrice ou de l’utilisateur.</li>
                <li>À partir de situations, analyser l’ergonomie de postes de travail et suggérer des possibilités d’aménagements.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(17,
N'      <ul>
                <li>Consigner, selon les règles, les processus pratiqués précédemment.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(18,
N'      <ul>
                <li>À partir de contextes associés au matériel informatique et dans le but d’obtenir des précisions sur la démarche d’installation et de désinstallation, réaliser le processus de recherche d''information :</li>
                        <ul>
                                <li>préciser le besoin;</li>
                                <li>établir une stratégie de recherche;</li>
                                <li>réaliser la recherche;</li>
                                <li>sélectionner les informations pertinentes.</li>
                        </ul>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(19,
N'      <ul>
                <li>À partir d’une recherche d’information et dans des contextes associés aux fonctions de travail, réaliser la production de documents à l’aide d’un tableur en utilisant les formules, les valeurs relatives et absolues sur plusieurs feuilles dans un même tableur.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(20,
N'      <ul>
                <li>À partir de sources identifiées en classe, lire des textes se rapportant aux différents types d’usagers et aux contextes d’utilisation afin de relever leurs particularités. </li>
                <li>À partir de  mises en situation, évaluer le degré de familiarité et de réceptivité des utilisatrices ou des utilisateurs afin de préciser leurs attentes.</li>
        </ul>')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(21,
N'      <ul>
                <li>Effectuer des exercices pratiques sur différents types d’interfaces homme-machine.</li>
                <li>À partir de mises en situation, identifier les éléments à considérer dans la conception d’interfaces.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(22,
N'      <ul>
                <li>À partir de sources identifiées en classe, lire des textes se rapportant aux différents périphériques pour en établir les particularités en fonction de besoins précis.</li>
                <li>Utiliser des interfaces tactiles.</li>
                <li>Effectuer des recherches  pour identifier des périphériques d’entrée et de sortie correspondant aux besoins d’utilisatrices et d’utilisateurs.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(23,
N'      <ul>
                <li>Effectuer des exercices de prototypage d’écrans à partir de situations données.</li>
                <li>Effectuer des recherches sur l’organisation et les éléments d’interfaces (Web, revues spécialisées).</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(24,
N'      <ul>
                <li>Effectuer des exercices  de familiarisation avec l''environnement de développement.</li>
                <li>Mettre au point des programmes.</li>
                <li>Développer une interface utilisateur.</li>
                <li>Valider une interface et autoévaluer le travail effectué.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(25,
N'      <ul>
                <li>Effectuer des exercices de familiarisation avec un logiciel de traitement d’image.</li>
                <li>Dans un contexte de développement d’interface-utilisateur :</li>
                        <ul>
                                <li>importer des images par différentes  méthodes.</li>
                        </ul>
                <li>Analyser des images en fonction des  exigences du média et apporter les modifications requises.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(26,
N'      <ul>
                <li>Effectuer des conversions de fichiers.</li>
                <li>Compresser et décompresser des fichiers.</li>
                <li>Optimiser des fichiers en fonction de leur utilisation future.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(27,
N'      <ul>
                <li>Faire des lectures en lien avec les concepts et la théorie.</li>
                <li>Effectuer des exercices pratiques.</li>
                <li>Participer aux laboratoires pratiques portant sur :</li>
                        <ul>
                                <li>les partitions;</li>
                                <li>le formatage;</li>
                                <li>la gestion des fichiers et des répertoires;</li>
                                <li>la sécurité des données.</li>
                        </ul>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(28,
N'      <ul>
                <li>Faire des lectures en lien avec les concepts et la théorie.</li>
                <li>Effectuer des exercices pratiques.</li>
                <li>Participer aux laboratoires pratiques portant sur :</li>
                        <ul>
                                <li>identification d’une tâche en problème;</li>
                                <li>suppression d’une tâche;</li>
                                <li>automatisation d’un processus.</li>
                        </ul>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(29,
N'      <ul>
                <li>Faire des lectures en lien avec les concepts et la théorie.</li>
                <li>Effectuer des exercices pratiques.</li>
                <li>Participer aux laboratoires d’observation et d’analyse des paramètres de gestion de mémoire.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(30,
N'      <ul>
                <li>Faire des lectures en lien avec les concepts et la théorie.</li>
                <li>Effectuer des exercices pratiques.</li>
                <li>Participer aux laboratoires pratiques utilisant différentes configurations.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(31,
N'      <ul>
                <li>En laboratoire pratique:</li>
                        <ul>
                                <li>procéder à l’installation personnalisée d''au moins un système d''exploitation;</li>
                                <li>faire une mise à jour d''un système d''exploitation.</li>
                        </ul>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(32,
N'      <ul>
                <li>En laboratoire pratique:</li>
                        <ul>
                                <li>établir un retour à une version antérieure d''un système d''exploitation.</li>
                        </ul>
        </ul>
')

SET IDENTITY_INSERT ActiviteApprentissage OFF
SET IDENTITY_INSERT [ElementConnaissance] ON
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(1,
N'      <ul>
                <li>Vision d’ensemble du monde de l’informatique :</li>
                        <ul>
                                <li>place actuelle de l’informatique dans la socièté;</li>
                                <li>influences sur les entreprises;</li>
                                <li>influences sur les gens;</li>
                                <li>évolution technologique (rappel historique, situation actuelle, tendance).</li>
                        </ul>
                <li>Type d''emplois :</li>
                        <ul>
                                <li>analyse;</li>
                                <li>programmation;</li>
                                <li>gestion de réseau;</li>
                                <li>soutien technique;</li>
                                <li>autres profils d''emplois.</li>
                        </ul>
                <li>Particuliarités de chaque type d''emploi :</li>
                        <ul>
                                <li>possibilités et conditions d''exercices;</li>
                                <li>pratique professionnel;</li>
                                <li>rôles;</li>
                                <li>responsabilités;</li>
                                <li>organisation de travail.</li>
                        </ul>
                <li>Catégories d''entreprises :</li>
                        <ul>
                                <li>grande entreprise;</li>
                                <li>PME;</li>
                                <li>firmes de service.</li>
                        </ul>
                <li>Environnement informatique sur le marché.</li>
                <li>Environnement informatique au Cégep de Jonquière.</li>
        </ul>
',1)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(2,
N'      <ul>
                <li>Tâches associées aux type d''emplois :</li>
                        <ul>
                                <li>développement;</li>
                                <li>entretien;</li>
                                <li>soutien;</li>
                                <li>formation.</li>
                        </ul>
                <li>Type de formation :</li>
                        <ul>
                                <li>DEC;</li>
                                <li>AEC</li>
                                <li>BACC, DEC-BACC;</li>
                                <li>formation sur mesure;</li>
                                <li>certification.</li>
                        </ul>
                <li>Présentation de la voie de spécialisation Informatique de gestion.</li>
        </ul>
',2)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(3,
N'      <ul>
                <li>Habiletés à développer.</li>
                <li>Comportements à adopter.</li>
                <li>Attitudes.</li>
                <li>Code d''éthique :</li>
                        <ul>
                                <li>du Cégep de Jonquière;</li>
                                <li>du département;</li>
                                <li>du marché du travail.</li>
                        </ul>
                <li>Confidentialité de l''information.</li>
        </ul>
',3)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(4,
N'      <ul>
                <li>Lois touchant le domaine.</li>
                <li>Application des lois.</li>
                <li>Disciplines et sanctions.</li>
        </ul>
',4)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(5,
N'      <ul>
                <li>Buts et importance de la documentation.</li>
        </ul>
',5)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(6,
N'      <ul>
                <li>Type de documentation :</li>
                        <ul>
                                <li>de système;</li>
                                <li>technique;</li>
                                <li>utilisateur;</li>
                                <li>d''exploitation (journal de bord).</li>
                        </ul>
                <li>Utilisation des logiciels de création de documents :</li>
                        <ul>
                                <li>traitement de textes;</li>
                                <li>tableur;</li>
                                <li>logiciel de présentation.</li>
                        </ul>
        </ul>
',5)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(7,
N'      <ul>
                <li>Étapes de résolution de problèmes.</li>

                <li>Notion d''entrée-sortie.</li>

                <li>Types de données :</li>
                        <ul>
                                <li>caractères;</li>
                                <li>entières;</li>
                                <li>réelles.</li>
                        </ul>
        <ul>
',6)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(8,
N'      <ul>
                <li>Notion d''algorithme.</li>
                <li>Notion d''instruction.</li>
                <li>Normes de rédaction d''un algorithme.</li>
                <li>Structures alternatives binaires, imbriquées et multiples.</li>
                <li>Structures répétitives :</li>
                        <ul>
                                <li>boucle Pour;</li>
                                <li>boucle Tant que;</li>
                                <li>boucle Répéter jusqu''à.</li>
                        </ul>
                <li>Structures répétitives imbriquées.</li>
                <li>Choix de la structure appropriée pour un traitement.</li>
        </ul>
',7)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(9,
N'      <ul>
                <li>Techniques de simulation d''algorithmes.</li>
        </ul>
',8)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(10,
N'      <ul>
                <li>Fonctionnement général de l''environnement.</li>
                <li>Représentation des types de données dans le langage de programmation.</li>
                <li>Représentation des types de données dans le langage de programmation.</li>
                        <ul>
                        <li>classe;</li>
                        <li>attribut;</li>
                        <li>méthode.</li>
                        </ul>
                <li>Représentation de chacune des structures de base dans le langage de programmation.</li>
                <li>Principes de documentation de programmes.</li>
        </ul>
',9)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(11,
N'<ul>
<li>Distinction entre compilation et exécution.</li>
                <li>Environnement de développement :</li>
                        <ul>
                                <li>mode de compilation d''un programme;</li>
                                <li>types d''erreurs de compilation;</li>
                                <li>méthode de mise au point des erreurs de compilation.</li>
                        </ul>
        </ul>
',9)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(12,
N'      <ul>
                <li>Environnement de développement :</li>
                        <ul>
                                <li>mode d''exécution d''un programme;</li>
                                <li>fonctions de débogage.</li>
                        </ul>
                <li>Notion de jeux d''essai :</li>
                        <ul>
                                <li>principe d''élaboration;</li>
                                <li>vérification des cas limites.</li>
                        </ul>
        </ul>
',9)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(13,
N'      <ul>
                <li>Correspondance entre la méthode de résolution de problèmes en développement et en entretien.</li>
                <li>Techniques d''appropriation d''un dossier de programmation.</li>
        </ul>
',10)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(14,
N'      <ul>
                <li>Carte mère :</li>
                        <ul>
                                <li>fonctions principales;</li>
                                <li>composantes.</li>
                        </ul>
                <li>Processeur :</li>
                        <ul>
                                <li>fonctionnement général;</li>
                                <li>types et générations;</li>
                                <li>caractéristiques.</li>
                        </ul>
                <li>Mémoire :</li>
                        <ul>
                                <li>types de mémoire;</li>
                                <li>organisation logique;</li>
                                <li>compatibilité.</li>
                        </ul>
                <li>Mémoire auxiliaire :</li>
                        <ul>
                                <li>technologie de stockage;</li>
                                <li>principes et types de mémoires auxiliaires;</li>
                                <li>types de lecteurs optiques.</li>
                        </ul>
                <li>Matériel vidéo et audio :</li>
                        <ul>
                                <li>principes et caractéristiques;</li>
                                <li>types de cartes graphiques;</li>
                                <li>types de moniteurs;</li>
                                <li>types de cartes de son.</li>
                        </ul>
                <li>Matériel de communication :</li>
                        <ul>
                                <li>technologique de communication;</li>
                                <li>principes et caractéristiques;</li>
                                <li>types de cartes réseaux.</li>
                        </ul>
                <li>Matériel d''entrées-sorties :</li>
                        <ul>
                                <li>principes et caractéristiques des ports;</li>
                                <li>types de ports (série, parallèle, USB, PS2);</li>
                                <li>types de périphériques (imprimantes, scanners, clavier, souris).</li>
                        </ul>
        </ul>
',11)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(15,
N'      <ul>
                <li>Plan de travail.</li>
                <li>Reconnaissance du matériel.</li>
                <li>Procédure d''installation physique et logique.</li>
        </ul>
',12)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(16,
N'      <ul>
                <li>Méthodes de consignation.</li>
                <li>Sauvegarde :</li>
                        <ul>
                                <li>sauvegarde des paramètres;</li>
                                <li>sauvegarde des données;</li>
                                <li>disques de démarrage.</li>
                        </ul>
                <li>Protection électrostatique.</li>
        </ul>
',12)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(17,
N'      <ul>
                <li>Fiches techniques :</li>
                        <ul>
                                <li>vocabulaire technique et nomenclature;</li>
                                <li>représentation et codification;</li>
                                <li>normes.</li>
                        </ul>
                <li>Alimentation et boîtier.</li>
                <li>Câbles et connecteurs.</li>
                <li>Configuration physique.</li>
                <li>Démarrage et types d''erreurs.</li>
        </ul>
',13)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(18,
N'      <ul>
                <li>Procédure de désinstallation physique.</li>
        </ul>
',14)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(19,
N'      <ul>
                <li>Choix du logiciel d’installation, version.</li>
                <li>Pilotes de périphériques.</li>
                <li>Configuration logique.</li>
                <li>Démarrage et types d''erreurs.</li>
        </ul>
',13)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(20,
N'      <ul>
                <li>Procédure de désinstallation logique.</li>
        </ul>
',15)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(21,
N'      <ul>
                <li>Procédure de vérification globale.</li>
                <li>Concepts de base d''ergonomie.</li>
        </ul>
',16)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(22,
N'      <ul>
                <li>Règles de consignation de l’information.</li>
        </ul>
',17)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(23,
N'      <ul>
                <li>Démarche de précision d’un besoin de recherche lié au matériel informatique.</li>
        </ul>
',18)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(24,
N'      <ul>
                <li>Sources d''information particulières au domaine du matériel informatique.</li>
                <li>Sources d''information :</li>
                        <ul>
                                <li>pertinence;</li>
                                <li>qualité;</li>
                                <li>fiabilité.</li>
                        </ul>
        </ul>
',18)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(25,
N'      <ul>
                <li>Méthode d’évaluation de l’information.</li>
        </ul>
',19)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(26,
N'      <ul>
                <li>Types de classification des usagers.</li>
                <li>Méthodes de détermination des attentes des usagers.</li>
                <li>Contextes d’utilisation d’une interface homme-machine (IHM).</li>
                <li>Contextes d’utilisation d’interfaces mobiles.</li>
        </ul>
',20)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(27,
N'      <ul>
                <li>Types d’interfaces.</li>
                <li>Éléments déterminants dans la conception d’interfaces :</li>
                        <ul>
                                <li>public cible (besoins et habitudes);</li>
                                <li>type de produit;</li>
                                <li>domaine d’utilisation;</li>
                                <li>volume d’utilisation;</li>
                                <li>plateformes utilisées et compatibilité;</li>
                                <li>budget de conception;</li>
                                <li>coûts (développement, mise en marché, installation);</li>
                                <li>fiabilité et robustesse de l’interface.</li>
                        </ul>
        </ul>
',21)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(28,
N'      <ul>
                <li>Périphériques d’entrée et de sortie :</li>
                        <ul>
                                <li>types;</li>
                                <li>caractéristiques;</li>
                                <li>domaines d’utilisation.</li>
                        </ul>
        </ul>
',22)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(29,
N'      <ul>
                <li>Standards de développement :</li>
                        <ul>
                                <li>normes;</li>
                                <li>guides de styles;</li>
                                <li>navigation.</li>
                        </ul>
                <li>Notions de rétroaction graphique (sélection, clic).</li>
                <li>Gestion des exceptions et des actions.</li>
                <li>Techniques de prototypage d’écrans.</li>
                <li>Ergonomie d’écrans et d’utilisation. </li>
                <li>Adéquation de l’interface avec les :</li>
                        <ul>
                                <li>devis initiaux;</li>
                                <li>besoins de l’usager.</li>
                        </ul>
                
        </ul>
',23)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(30,
N'      <ul>
                <li>Concepts du langage choisi :</li>
                        <ul>
                                <li>types de données;</li>
                                <li>structures de base (séquence, itération, décision).</li>
                        </ul>
                <li>Outils et fonctions propres au langage :</li>
                        <ul>
                                <li>création d’éléments;</li>
                                <li>limites de la rétroaction graphique du langage;</li>
                                <li>positionnement des éléments;</li>
                                <li>liaison entre les éléments;</li>
                                <li>liaison entre les éléments et le programme de l’application.</li>
                        </ul>
                <li>Tests et validation de l’interface.</li>
        </ul>
',24)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(31,
N'      <ul>
                <li>Logiciel de traitement d’images :</li>
                        <ul>
                                <li>caractéristiques;</li>
                                <li>limites;</li>
                                <li>comparaison.</li>
                        </ul>
                <li>Traitement d''images :</li>
                        <ul>
                                <li>amélioration de la qualité;</li>
                                <li>modification;</li>
                                <li>manipulation;</li>
                                <li>assemblage;</li>
                                <li>sélection;</li>
                                <li>calibration des couleurs et des textures.</li>
                        </ul>
                <li>Méthodes d’importation d’images.</li>
                <li>Normes et standards de qualité.</li>
        </ul>
',25)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(32,
N'      <ul>
                <li>Formats de fichiers :</li>
                        <ul>
                                <li>d’image;</li>
                                <li>de son;</li>
                                <li>vidéo;</li>
                                <li>critères de choix.</li>
                        </ul>
                <li>Procédure de conversion.</li>
                <li>Utilitaires de compression et de décompression.</li>
        </ul>
',26)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(33,
N'      <ul>
                <li>Système d''exploitation :</li>
                        <ul>
                                <li>rôle;</li>
                                <li>principes;</li>
                                <li>familles;</li>
                                <li>objets;</li>
                                <li>fichiers de configuration;</li>
                                <li>comparaison.</li>
                        </ul>
                <li>Gestion du disque :</li>
                        <ul>
                                <li>formatage;</li>
                                <li>partition;</li>
                                <li>compression.</li>
                        </ul>
                <li>Gestion de fichiers et des répertoires :</li>
                        <ul>
                                <li>principes;</li>
                                <li>limites;</li>
                                <li>commandes;</li>
                                <li>partage.</li>
                        </ul>
                <li>Sécurité des données :</li>
                        <ul>
                                <li>accès;</li>
                                <li>intégrité;</li>
                                <li>récupération.</li>
                        </ul>
        </ul>

',27)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(34,
N'      <ul>
                <li>Gestion des tâches :</li>
                        <ul>
                                <li>méthodes;</li>
                                <li>principes multitâches;</li>
                                <li>limites;</li>
                                <li>priorité;</li>
                                <li>sécurité.</li>
                        </ul>
                <li>Automatisation des tâches :</li>
                        <ul>
                                <li>concepts;</li>
                                <li>limites.</li>
                        </ul>
        </ul>
',28)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(35,
N'      <ul>
                <li>Gestion de la mémoire :</li>
                        <ul>
                                <li>principes;</li>
                                <li>possibilités et limites;</li>
                                <li>allocation de la mémoire en fonction des tâches;</li>
                                <li>plages mémoires des périphériques.</li>
                        </ul>
        </ul>
',29)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(36,
N'      <ul>
                <li>Configuration d''un système d''exploitation :</li>
                        <ul>
                                <li>fichiers;</li>
                                <li>paramètres;</li>
                                <li>commandes;</li>
                                <li>droits d’utilisation.</li>
                        </ul>
        </ul>
',30)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(37,
N'      <ul>
                <li>Démarche d''installation d''un système d''exploitation :</li>
                        <ul>
                                <li>planification;</li>
                                <li>consignation de la configuration initiale;</li>
                                <li>prise de copies de sécurité;</li>
                                <li>choix des paramètres de configuration;</li>
                                <li>disquette de démarrage;</li>
                                <li>tests;</li>
                                <li>consignation de la configuration finale.</li>
                        </ul>
                <li>Distinction entre installation et mise à jour.</li>
        </ul>
',31)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(38,
N'      <ul>
                <li>Circonstances amenant une désinstallation.</li>
                <li>Processus de désinstallation :</li>
                        <ul>
                                <li>prise en charge par le système;</li>
                                <li>manuel;</li>
                                <li>limites et contraintes.</li>
                        </ul>
                <li>Types d''installations versus possibilités de désinstallation.</li>
        </ul>
',32)
SET IDENTITY_INSERT ElementConnaissance OFF
SET IDENTITY_INSERT [PlanCadreElement] ON
GO
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (1, 1, 1, 1)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (2, 1, 2, 2)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (3, 1, 3, 3)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (4, 1, 4, 4)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (5, 1, 53, 5)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (6, 1, 54, 6)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (7, 4, 42, 7)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (8, 4, 43, 8)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (9, 4, 44, 9)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (10, 4, 26, 10)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (11, 4, 27, 10)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (12, 4, 28, 12)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (13, 4, 65, 13)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (14, 4, 66, 13)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (15, 3, 15, 14)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (16, 3, 16, 15)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (17, 3, 17, 16)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (18, 3, 18, 17)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (18, 3, 19, 18)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (19, 3, 20, 19)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (20, 3, 21, 20)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (21, 3, 22, 21)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (22, 3, 23, 22)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (23, 3, 34, 23)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (24, 3, 35, 24)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (25, 3, 36, 25)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (26, 2, 45, 26)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (27, 2, 46, 27)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (28, 2, 47, 28)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (29, 2, 48, 29)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (30, 2, 49, 30)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (31, 2, 67, 31)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (32, 2, 68, 32)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (33, 7, 11, 33)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (34, 7, 12, 34)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (35, 7, 13, 35)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (36, 7, 14, 36)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (37, 7, 20, 37)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (38, 7, 21, 38)
GO
/* Insert par Eddy le 2017/12/06 Adapté sans voir la BD : idElementConnaissance repris sur Fred, donc en doublons */
/*
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (1, 1, 1, )
GO

INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (2, 1, 2, 1)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (3, 1, 3, 1)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (4, 1, 4, 1)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (5, 1, 53, 1)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (6, 1, 54, 1)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (7, 1, 55, 1)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (8, 1, 56, 1)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (9, 1, 57, 1)
GO
INSERT [dbo].[PlanCadreElement] ([idPlanCadreElement], [idPlanCadre], [idElement],[idElementConnaissance]) VALUES (10, 1, 58, 1)
GO
*/
SET IDENTITY_INSERT [PlanCadreElement] OFF



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





DELETE FROM AspNetUsers
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [nom], [prenom]) VALUES (N'0c4b02f4-3c62-4030-b8e0-24aac3b87d5d', N'gauca1532715@etu.cegepjonquiere.ca', 0, N'ANbx0N9o/ZTfsvHCw/EvTUMGmHRFyd1EKMhXKFNk5JhLQNI8AWUq+Ho7UZ1q7YlhJg==', N'a06d14fc-8270-42f0-8a0d-8c600b9325cb', NULL, 0, 0, NULL, 1, 0, N'gauca1532715@etu.cegepjonquiere.ca', 'Gauthier', 'Carl')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [nom], [prenom]) VALUES (N'1950c7ef-d051-490d-84dc-1e2e8872d660', N'foned1530057@etu.cegepjonquiere.ca', 0, N'ALshSBLXPe+qLlE9k0SDkP2ylyWebaAAR3++HbNeAi6JhqO2qGUUnt0psbWgJ24BXQ==', N'46150be5-20da-448b-9e79-76e82d0806d4', NULL, 0, 0, NULL, 1, 0, N'foned1530057@etu.cegepjonquiere.ca', 'Fontaine', 'Eddy')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [nom], [prenom]) VALUES (N'4c194a5d-9ec8-4a9c-8994-7f91986cf480', N'larsa1432920@etu.cegepjonquiere.ca', 0, N'AOO/q2oMaxjNYF1sF8H7UMWVYv8vL7R6pOrt80/PVF1Gu1dDVIsGRdVZPk9V5RB/Yw==', N'0ad20b90-7166-4197-a93f-fc6b5e62ce61', NULL, 0, 0, NULL, 1, 0, N'larsa1432920@etu.cegepjonquiere.ca', 'Larouche', 'Samuel')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [nom], [prenom]) VALUES (N'ac2682c3-a26b-480a-83ec-b571b309a62a', N'cotfr1530860@etu.cegepjonquiere.ca', 0, N'AHEQtMJyh0h099STis/lvt8St8WZnYrJ/pf9LPIWtNT5GP4WDvgyIY6KJ6orrWt1hA==', N'34ecfb43-c36d-4ba8-9227-9964e95a605b', NULL, 0, 0, NULL, 1, 0, N'cotfr1530860@etu.cegepjonquiere.ca', 'Côté', 'Frédéric')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [nom], [prenom]) VALUES (N'de02a4d2-d6b1-4522-839c-342d5e446748', N'ducma1532694@etu.cegepjonquiere.ca', 0, N'AJiirWHrRF0C8skz4jL2mVGQmx41KedxAd8STYZJ0MsdTdA4Q23rpp5s2U8OR7Um9w==', N'bedc7731-2912-4355-8d5b-a4b55a8d8811', NULL, 0, 0, NULL, 1, 0, N'ducma1532694@etu.cegepjonquiere.ca', 'Duchesne', 'Marc-Antoine')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [nom], [prenom]) VALUES (N'efa8d199-9093-4ba5-824f-460ddb3ca4b9', N'hamfa1330387@etu.cegepjonquiere.ca', 0, N'AIKik20IEcYt6I25Tdbz2Ik4ONNx93HAQRY2+WwxWGoA9rI2LU+kLYenFktS8ujcXQ==', N'6973e3b8-1ef4-45b4-80ea-5442a8cd574b', NULL, 0, 0, NULL, 1, 0, N'hamfa1330387@etu.cegepjonquiere.ca', 'Hammond', 'Fabrice')
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [nom], [prenom]) VALUES (N'eb364e3b-b9e5-406b-83eb-b2845acf3202', N'ericchose@outlook.ca', 0, N'ALWEsr41t9MzK/Ug02i2HDaij3MaytU+7/28tPtVYhtS+baXjg8dxZiefmE/SAU3lg==', N'33a123d0-029c-4e16-975e-91c7f64b3b28', NULL, 0, 0, NULL, 1, 0, N'ericchose@outlook.ca', 'Dallaire', 'Éric')
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
GO

DELETE FROM AccesProgramme
INSERT INTO AccesProgramme (UserMail, codeProgramme) VALUES
(N'ericchose@outlook.ca', '420') --ERIC

--select * from AspNetRoles
--select * from AspNetUserClaims
--select * from AspNetUserLogins
--select * from AspNetUserRoles
--select * from AspNetUsers
USE BDPlanCadreV2
GO 

CREATE TRIGGER DateTimeTrigger
ON [dbo].[Programme]
AFTER UPDATE
AS 
BEGIN
DECLARE @OldValue BIT, @NewValue BIT 
SELECT @OldValue = b.statusValider, @NewValue = a.statusValider
FROM inserted a, deleted b
   IF @NewValue != @OldValue
   UPDATE dbo.Programme
   SET dateValidation = GETDATE()
   FROM INSERTED stateValue
   WHERE stateValue.idProgramme = Programme.idProgramme 
END
