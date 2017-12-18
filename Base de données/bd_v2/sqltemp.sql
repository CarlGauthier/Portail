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

ALTER TABLE PlanCadreEnonce
ADD FOREIGN KEY(idPlanCadre) REFERENCES PlanCadre(idPlanCadre)

ALTER TABLE PlanCadreEnonce
ADD FOREIGN KEY(idCompetence) REFERENCES EnonceCompetence(idCompetence)

ALTER TABLE ElementConnaissance
ADD FOREIGN KEY (idActiviteApprentissage) REFERENCES ActiviteApprentissage(idActiviteApprentissage)

ALTER TABLE PlanCadreElement
ADD FOREIGN KEY(idElementConnaissance) REFERENCES ElementConnaissance(idElementConnaissance)
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
INSERT [dbo].[Programme] ([idProgramme],[nom], [annee], [dateValidation],[statusValider], [idDevis]) VALUES (1,'l''ancien programme', 2007, NULL, 0, 1)
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

/* Ajout� par Eddy le 2017 12 06 */
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (13, N'0170', N'Organiser et exploiter des donn�es', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (14, N'0171', N'Corriger des programmes', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (15, N'0173', N'D�velopper des mod�les conceptuels selon l�approche structur�e', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (16, N'0174', N'Mettre � profit les possibilit�s d�un environnement informatique en r�seau', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (17, N'0175', N'Cr�er et exploiter des bases de donn�es', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (18, N'0176', N'Apporter des am�liorations fonctionnelles � une application', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (19, N'0177', N'Assurer la qualit� d�une application', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (20, N'0178', N'Utiliser des outils de traitements multim�dias', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (21, N'0179', N'Assurer soutien technique et formation aux utilisatrices et utilisateurs', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (22, N'017A', N'Mettre en �uvre une application', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (23, N'017B', N'Concevoir et d�velopper une application dans un environnement de base de donn�es', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (24, N'017C', N'Concevoir et d�velopper une application dans un environnement graphique', 1, 1, 1)
INSERT [dbo].[EnonceCompetence] ([idCompetence], [codeCompetence], [description], [obligatoire], [actif], [idDevis]) VALUES (25, N'017D', N'Concevoir et d�velopper une application hyperm�dia dans des r�seaux internes et mondiaux', 1, 1, 1)

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
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (59, N'Num�riser des textes, des images et des sons', 1, 13)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (60, N'Cr�er et modifier des dessins � l��cran', 4, 13)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (61, N'Proc�der � la saisie d��crans', 5, 13)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (62, N'�tablir le cadre technologique', 2, 14)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (63, N'Produire le prototype de pr�sentation', 4, 14)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (64, N'D�velopper l�application', 6, 14)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (65, N'Corriger le probl�me', 3, 15)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (66, N'Valider la solution', 4, 15)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (67, N'Choisir et traiter des images.', 2, 20)
INSERT [dbo].[ElementCompetence] ([idElement], [description], [numero], [idCompetence]) VALUES (68, N'Traiter des fichiers son, image et vid�o.', 3, 20)

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
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (47, N'� partir d''une station de travail multim�dia, des logiciels graphiques et des utilitaires appropri�s', 1, 13)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (48, N'� partir d�un num�riseur', 2, 13)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (49, N'� partir de fichiers texte, son, image et vid�o', 3, 13)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (50, N'� l�aide des manuels de r�f�rences techniques appropri�s', 4, 13)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (51, N'� partir de situations repr�sentatives du milieu de travail', 1, 14)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (52, N'� partir d�une station de travail et des outils de d�veloppement appropri�s', 2, 14)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (53, N'� partir de r�seaux internes et mondiaux', 3, 14)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (54, N'� partir d�une analyse des besoins', 4, 14)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (55, N'� partir des manuels de r�f�rences techniques appropri�s', 5, 14)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (56, N'� partir des exigences de l�entreprise et des standards de l�informatique', 6, 14)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (57, N'En collaboration avec les personnes participant au projet', 7, 14)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (58, N'� partir de programmes repr�sentatifs du milieu de travail comportant des erreurs et des lacunes', 1, 15)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (59, N'� partir d''une station de travail et des logiciels appropri�s', 2, 15)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (60, N'� partir des exigences de l''entreprise', 3, 15)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (61, N'� l''aide de documentation sur les programmes � corriger.', 4, 15)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (62, N'� l''aide des manuels de r�f�rences techniques appropri�s', 5, 15)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (63, N'� partir d''une station de travail multim�dia, des logiciels graphiques et des utilitaires appropri�s.', 1, 20)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (64, N'� partir d�un num�riseur.', 2, 20)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (65, N'� partir de fichiers texte, son, image et vid�o.', 3, 20)
INSERT [dbo].[ContexteRealisation] ([idContexte], [description], [numero], [idCompetence]) VALUES (66, N'� l�aide des manuels de r�f�rences techniques appropri�s.', 4, 20)


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
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (251, N'R�glage appropri� des param�tres de r�solution et de dimension de l�image', 1, 59)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (252, N'R�glage appropri� des param�tres sonores', 2, 59)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (253, N'Application correcte de la proc�dure de num�risation', 3, 59)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (254, N'S�lection d�un format d�image, de son et de texte appropri� aux besoins', 4, 59)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (255, N'Compression et d�compression efficaces des fichiers', 5, 59)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (256, N'Utilisation efficace des logiciels de num�risation et des outils d�aide en ligne', 6, 59)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (257, N'Archivage appropri� des fichiers dans une biblioth�que', 7, 59)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (258, N'Examen des caract�ristiques des logiciels graphiques en mode vectoriel et bitmap', 1, 60)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (259, N'Mise � profit efficace des possibilit�s des logiciels de cr�ation et de modification de formes', 2, 60)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (260, N'Mise � profit efficace des possibilit�s de logiciels de s�lection, de modification et d�application des couleurs et des textures', 3, 60)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (261, N'Application correcte des techniques de dessin', 4, 60)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (262, N'Manifestation de cr�ativit� et d�esth�tisme', 5, 60)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (263, N'Configuration appropri� d�un logiciel de saisie d��crans', 1, 61)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (264, N'Mise � profit correcte des possibilit�s du logiciel de saisie d��crans', 2, 61)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (265, N'Insertion et traitement appropri� de l�objet saisi', 3, 61)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (266, N'Reconnaissances des facteurs influant sur les choix technologiques', 1, 62)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (267, N'D�termination de l�architecture appropri�e', 2, 62)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (268, N'Prise en consid�ration des possibilit�s d��volution du contexte d�utilisation et des technologies', 3, 62)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (269, N'Choix du mat�riel et des logiciels appropri�s � l�architecture retenue', 4, 62)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (270, N'Exploitation correcte des possibilit�s des outils de d�veloppement', 1, 63)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (271, N'�tablissement appropri� des caract�ristiques de l�exploration', 3, 63)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (272, N'Repr�sentation graphique correcte des �crans', 3, 63)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (273, N'D�termination des caract�ristiques globales de pr�sentation des �crans', 4, 63)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (274, N'Repr�sentation de l�interface de l�application conform�ment aux exigences de l�ergonomie et de l�esth�tisme', 5, 63)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (275, N'Pr�sentation du prototype pour approbation aux personnes responsables', 6, 63)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (276, N'Codification appropri�e des �crans', 1, 64)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (277, N'Codification des fonctions de l�application conform�ment aux exigences de l�entreprise', 2, 64)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (278, N'R�solution efficace des probl�mes de conception de l''algorithme', 1, 65)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (279, N'R�solution efficace des probl�mes de traduction de l''algorithme dans le langage de programmation', 2, 65)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (280, N'R�solution efficace des probl�mes d''utilisation du langage de programmation', 3, 65)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (281, N'Analyse de l''effet de la solution sur l''ensemble du programme', 1, 66)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (282, N'Pr�paration des jeux d�essai appropri�s', 2, 66)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (283, N'Interpr�tation juste des r�sultats', 3, 66)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (284, N'Fonctionnement correct du programme', 4, 66)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (285, N'Choix judicieux des images � partir des biblioth�ques.', 1, 67)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (286, N'Mise � profit efficace des possibilit�s d�am�lioration de la qualit� d�une image.', 2, 67)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (287, N'Mise � profit efficace des possibilit�s de modification, de manipulation et d�assemblage des �l�ments d�une image.', 3, 67)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (288, N'Mise � profit efficace des possibilit�s de s�lection, de modification et de calibration des couleurs et des textures.', 4, 67)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (289, N'Importation correcte des images d�une biblioth�que.', 5, 67)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (290, N'Archivage appropri� des images dans une biblioth�que.', 6, 67)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (291, N'D�termination du format du fichier � convertir.', 1, 68)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (292, N'D�termination du format de conversion conform�ment aux exigences de compatibilit�.', 2, 68)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (293, N'Application correcte de la proc�dure de conversion.', 3, 68)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (294, N'Utilisation correcte des utilitaires de compression et de d�compression des fichiers son, image et vid�o.', 4, 68)
INSERT [dbo].[CriterePerformance] ([idCritere], [description], [numero], [idElement]) VALUES (295, N'Utilisation efficace des outils d�aide en ligne.', 5, 68)


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
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (1, N'420-JAC-JQ', N'Informatique et technologie', 1, 2, 1,
N'Ce cours de premi�re session permettra � l''�l�ve de se familiariser avec le monde de l�informatique et aux fonctions de travail.  Plus pr�cis�ment, il vise � rendre l''�l�ve capable de faire un choix �clair� quant � l''orientation de sa carri�re.  De plus, il permettra un tour d''horizon des outils de base n�cessaires au travail de l''�l�ve en informatique.',
N'      <ul>
                <li>Laboratoire d''exploitation (un poste de travail par �l�ve).</li>
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
N'Ce cours offert � la premi�re session s''inscrit dans l''axe de d�veloppement d�applications mobiles du programme. Il permettra � l''�l�ve de conna�tre les concepts n�cessaires � l��laboration d�interfaces de qualit�.

Un accent particulier sera mis sur la curiosit� intellectuelle et la capacit� de parfaire ses connaissances de fa�on autonome.',
N'Salle de classe th�orique et laboratoire d''exploitation (Un poste de travail par �l�ve).
Branchement Internet et r�seau local.
Num�riseur, appareil-photo et vid�o num�rique.
Micro/�couteurs (un par �l�ve). P�riph�riques non standards.
Logiciels :
de traitement d�image; de son; de dessin et de saisie d��cran.
Appareils mobiles (tablettes et/ou t�l�phones intelligents).',
N'      <ul>
                <li>Guides de l''utilisateur des logiciels.</li>
                <li>Manuels techniques des manufacturiers.</li>
                <li>Guides sur l�ergonomie,  sp�cifiques aux plates-formes utilis�es.</li>
                <li>Revues diverses se rapportant au domaine de l�informatique, telles que : PC Expert, Science et vie micro ou L�ordinateur individuel.</li>
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
N'Ce cours, offert � la premi�re session, s''inscrit dans l''axe Programmation de la formation. Il permettra � l''�l�ve de d�velopper son aptitude � r�soudre des probl�mes et � appliquer des principes de programmation structur�e. � ce titre, il joue un r�le fondamental dans la formation.
Les principes qui y seront d�velopp�s seront repris dans l''ensemble des cours comprenant une portion de programmation. 
Un accent particulier sera mis sur l''esprit de logique, d''analyse et de synth�se.  D''autre part, on initiera l''�l�ve � �valuer la qualit� de son travail, comp�tence essentielle en informatique.
Ce cours repose sur une approche par processus. L''�l�ve r�alisera des activit�s d''apprentissage qui couvriront toute la d�marche de r�solution de probl�mes et de mise au point d''un programme, et ce, sur des situations de complexit� crois-sante.
La formation souhait�e sera plus ax�e sur les m�thodes de travail � d�velopper que sur les multiples possibilit�s du langage de programmation',
N'      <ul>
                <li>Salle de classe th�orique et laboratoire d''exploitation (Un poste de travail par �l�ve).</li>
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
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [idProgramme], [idType]) VALUES (5,'420-FIC-JQ','Conception et manipulation de base de donn�es',1, 2, 2, 1, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (6,'420-JJA-JQ','Programmation mobile',1,2,2,
N'Ce cours offert � la deuxi�me session s''inscrit dans l''axe d�veloppement mobile du programme. Il permettra � l''�l�ve de conna�tre les concepts n�cessaires � l��laboration d�application mobile.

Les attitudes vis�es dans ce cours sont la cr�ativit�, le travail en �quipe et la tenacit�.

Un accent particulier sera mis sur la curiosit� intellectuelle et la capacit� de parfaire ses connaissances de fa�on autonome.',
N'      <ul>
                <li>Salle de classe th�orique et laboratoire d''exploitation (1 poste de travail par �l�ve).</li>
                <li>Logiciel du langage de programmation.</li>
        </ul>
',
N'      <ul>
                <li>Des notes de cours et des r�f�rences internet seront fournies durant la session par le professeur.</li>
                <li>Sites Web :</li>
                        <ul>
                                <li>http://www.w3schools.com/html/html5_intro.asp</li>
                                <li>http://www.w3.org/html/wg/drafts/html/master/</li>
                        </ul>
                <li>Manuels de r�f�rence pour consultation. Les manuels devront �tre actualis�s d�s qu�un nouveau logiciel est utilis�.</li>
                <li>Articles de revues, journaux sur la profession, sur le mat�riel et les logiciels.</li>
        </ul>
',1,1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours],[nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (7,'420-JFB-JQ','Syst�me d''exploitation',1,3,1,
N'Ce cours, offert � la deuxi�me session, s''inscrit dans l''axe mat�riel informatique et soutien technique.  Il permettra � l''�l�ve de d�velopper son aptitude � installer, � configurer et � comprendre le fonctionnement des syst�mes d''exploitation.

Un accent particulier sera mis sur les concepts des syst�mes d''exploitation afin de permettre aux �l�ves d''effectuer les transferts � d''autres environnements informatiques.',
N'      <ul>
                <li>Salle de classe th�orique et laboratoire d''exploitation et d''exp�rimentation (Un poste de travail par �l�ve).</li>
                <li>Diff�rents syst�mes d''exploitation.</li>
                <li>Branchement Internet et r�seau local.</li>
        </ul>
',
N'      <ul>
                <li>Sans sugg�rer de titre particulier, il est fortement recommand� d''utiliser un manuel de r�f�rence ou des notes de cours appartenant en propre � l''�l�ve pour l''obliger � effectuer des lectures et � s''approprier la mati�re.</li>
                <li>Manuels de r�f�rence des syst�mes d''exploitation.</li>
        </ul>
',1,1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [idProgramme], [idType]) VALUES (8,'420-FIC-JQ','Programmation orient�e objet : concepts',2,1,3,1,1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [idProgramme], [idType]) VALUES (9,'420-FIC-JQ','Conception d�applications mobiles',1,1,4,1,1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [idProgramme], [idType]) VALUES (10,'420-FIC-JQ','Exploitation des r�seaux',4,1,1,1,1)
GO
/* Ajout des plans cadre par Eddy : 2017-12-06 */
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (11,'420-JBB-JQ','Programmation et introduction aux objets_EF', 2, 4, 2, 'Sp�cifique',NULL,NULL, 1, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (12,'420-JAC-JQ','Informatique et technologie_EF', 3, 3, 2, 'Sp�cifique',NULL,NULL, 1, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (13,'420-KCC-JQ','Conception d''interface_EF', 1, 4, 1, 'Sp�cifique',NULL,NULL, 1, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (14,'420-KEB-JQ','POO Avanc�e_EF', 1, 4, 1, 'Sp�cifique',NULL,NULL, 1, 1)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (15,'420-MAT-JQ','Maths_EF', 3, 3, 2, 'Contributif',NULL,NULL, 1, 3)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (16,'601-101-JQ','�criture et litt�rature_EF', 2, 2, 3, 'G�n�rale',NULL,NULL, 1, 2)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (17,'601-102-JQ','Litt�rature et inaginaire_EF', 3, 1, 3, 'G�n�rale',NULL,NULL, 1, 2)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (18,'604-100-MQ','Anglais de base_EF', 2, 1, 3, 'G�n�rale',NULL,NULL, 1, 2)
GO
INSERT [dbo].[PlanCadre] ([idPlanCadre], [numeroCours], [titreCours], [nbHeureTheorie], [nbHeurePratique], [nbHeureDevoir], [indicationPedago], [environnementPhys], [ressource], [idProgramme], [idType]) VALUES (19,'604-100-MQ','Anglais adapt�_EF', 2, 1, 3, 'G�n�rale',NULL,NULL, 1, 2)
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
                <li>� partir de sources identifi�es en classe, lire sur es fonctions de travail pour en identifier les diff�rentes conditions d''exercices.</li>
                <li>Assister � des conf�rences et visiter des entreprises du domaine de l''informatique</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(2,
N'      <ul>
                <li>� partir de sources identifi�es en classe, lire sur les diff�rentes fonctions de travail pour mieux comprendre les t�ches et les op�rations qui s''y rattachent.</li>
                <li>Effectuer des recherches sur les diff�rents types d''emplois.</li>
                <li>Assister � des conf�rences et � des pr�sentations sur les types d''emplois et de formations.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(3,
N'      <ul>
                <li>� partir de sources identifi�es en classe, lire sur l''�thique professionnel pour en saisir l''importance.</li>
                <li>� partir de mises en situation, identifier les habilet�s, les attitudes et les comportements ad�quats.</li>
                <li>�tudier diff�rents codes d''�thique pour en relever les �l�ments significatifs.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(4,
N'      <ul>
                <li>� partir de sources identifi�es en classe, lire sur les lois et r�glements qui s''appliquent au domaine de l''informatique de gestion.</li>
                <li>� partir de mises en situation, identifier les lois ou r�glements qui s''appliquent.</li>
                <li>� partir de cas v�cus, identifier les manquements aux lois et aux r�glements.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(5,
N'      <ul>
                <li>Effectuer des exercices pratiques permettant d''exp�rimenter les logiciels.</li>
                <li>� partir d''une recherche d''information et dans les contextes associ�s aux fonctions de travail, r�aliser la production de documents :</li>
                        <ul>
                                <li>s�lectionner le logiciel de production du document;</li>
                                <li>produire un document respectant les normes et les standarts de la profession.</li>
                        </ul>
                        
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(6,
N'      <ul>
                <li>Faire des lectures en lien avec la th�orie et les concepts.</li>
                <li>Faire des exercices de r�solution de probl�mes.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(7,
N'      <ul>
                <li>Faire des lectures en lien avec la th�orie et les concepts.</li>
                <li>Faire des r�dactions d''algorithmes simples.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(8,
N'      <ul>
                <li>Effectuer des lectures en lien avec la th�orie et les concepts.</li>
                <li>Faire des exercices de simulation du contenu de la m�moire et des sorties produites.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(9,
N'      <ul>
                <li>Effectuer des lectures en lien avec la th�orie et les concepts.</li>
                <li>Faire des exercices de familiarisation avec l''environnement de d�veloppement.</li>
                <li>� partir de contextes sp�cifiques, r�aliser le processus complet sur des situations de plus en plus complexes :</li>
                        <ul>
                                <li>analyse du probl�me;</li>
                                <li>�laboration du jeu d''essai;</li>
                                <li>conception d''une solution;</li>
                                <li>r�daction d�un algorithme;</li>
                                <li>traduction et saisie dans le langage de programmation;</li>
                                <li>mise au point du programme;</li>
                                <li>documentation du programme;</li>
                                <li>pr�sentation du dossier de programmation;</li>
                                <li>auto�valuation du travail r�alis�.</li>
                        </ul>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(10,
N'      <ul>
                <li>� partir d''un programme contenant des erreurs de compilation :</li>
                        <ul>
                                <li>identifier les erreurs;</li>
                                <li>les corriger;</li>
                                <li>compiler le programme;</li>
                                <li>v�rifier l''ex�cution.</li>
                        </ul>
                <li>� partir du dossier de programmation d''un programme fait par quelqu�un d�autre et contenant des erreurs de logique d�j� identifi�es :</li>
                        <ul>
                                <li>corriger l''algorithme;</li>
                                <li>modifier le programme;</li>
                                <li>compiler le programme;</li>
                                <li>v�rifier l''ex�cution.</li>
                        </ul>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(11,
N'<ul>
        <li>� partir de sources identifi�es en classe, lire sur les composantes et leurs caract�ristiques afin d�en comprendre le fonctionnement.</li>
        <li>Effectuer des exercices permettant de comprendre le fonctionnement des diff�rents composants et de leurs interactions.</li>
</ul>




')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(12,
N'      <ul>
                <li>� partir d�une demande :</li>
                        <ul>
                                <li>planifier l�installation du nouveau mat�riel;</li>
                                <li>consigner l�information;</li>
                                <li>sauvegarder les donn�es du syst�me � modifier.</li>
                        </ul>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(13,
N'      <ul>
                <li>� partir de situations vari�es, r�aliser le processus d''installation d��l�ments physiques et de configuration n�cessaires :</li>
                        <ul>
                                <li>planifier les �tapes;</li>
                                <li>proc�der � l�installation physique des composants;</li>
                                <li>configurer le syst�me;</li>
                                <li>v�rifier l''installation;</li>
                                <li>consigner l�information.</li>
                        </ul>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(14,
N'      <ul>
                <li>Proc�der � la d�sinstallation de certains composants.</li>
        </ul>

')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(15,
N'      <ul>
                <li>Proc�der � la d�sinstallation de certains composants logiques.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(16,
N'      <ul>
                <li>Proc�der � la v�rification minutieuse du fonctionnement de la station de travail de l�utilisatrice ou de l�utilisateur.</li>
                <li>� partir de situations, analyser l�ergonomie de postes de travail et sugg�rer des possibilit�s d�am�nagements.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(17,
N'      <ul>
                <li>Consigner, selon les r�gles, les processus pratiqu�s pr�c�demment.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(18,
N'      <ul>
                <li>� partir de contextes associ�s au mat�riel informatique et dans le but d�obtenir des pr�cisions sur la d�marche d�installation et de d�sinstallation, r�aliser le processus de recherche d''information :</li>
                        <ul>
                                <li>pr�ciser le besoin;</li>
                                <li>�tablir une strat�gie de recherche;</li>
                                <li>r�aliser la recherche;</li>
                                <li>s�lectionner les informations pertinentes.</li>
                        </ul>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(19,
N'      <ul>
                <li>� partir d�une recherche d�information et dans des contextes associ�s aux fonctions de travail, r�aliser la production de documents � l�aide d�un tableur en utilisant les formules, les valeurs relatives et absolues sur plusieurs feuilles dans un m�me tableur.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(20,
N'      <ul>
                <li>� partir de sources identifi�es en classe, lire des textes se rapportant aux diff�rents types d�usagers et aux contextes d�utilisation afin de relever leurs particularit�s. </li>
                <li>� partir de  mises en situation, �valuer le degr� de familiarit� et de r�ceptivit� des utilisatrices ou des utilisateurs afin de pr�ciser leurs attentes.</li>
        </ul>')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(21,
N'      <ul>
                <li>Effectuer des exercices pratiques sur diff�rents types d�interfaces homme-machine.</li>
                <li>� partir de mises en situation, identifier les �l�ments � consid�rer dans la conception d�interfaces.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(22,
N'      <ul>
                <li>� partir de sources identifi�es en classe, lire des textes se rapportant aux diff�rents p�riph�riques pour en �tablir les particularit�s en fonction de besoins pr�cis.</li>
                <li>Utiliser des interfaces tactiles.</li>
                <li>Effectuer des recherches  pour identifier des p�riph�riques d�entr�e et de sortie correspondant aux besoins d�utilisatrices et d�utilisateurs.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(23,
N'      <ul>
                <li>Effectuer des exercices de prototypage d��crans � partir de situations donn�es.</li>
                <li>Effectuer des recherches sur l�organisation et les �l�ments d�interfaces (Web, revues sp�cialis�es).</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(24,
N'      <ul>
                <li>Effectuer des exercices  de familiarisation avec l''environnement de d�veloppement.</li>
                <li>Mettre au point des programmes.</li>
                <li>D�velopper une interface utilisateur.</li>
                <li>Valider une interface et auto�valuer le travail effectu�.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(25,
N'      <ul>
                <li>Effectuer des exercices de familiarisation avec un logiciel de traitement d�image.</li>
                <li>Dans un contexte de d�veloppement d�interface-utilisateur :</li>
                        <ul>
                                <li>importer des images par diff�rentes  m�thodes.</li>
                        </ul>
                <li>Analyser des images en fonction des  exigences du m�dia et apporter les modifications requises.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(26,
N'      <ul>
                <li>Effectuer des conversions de fichiers.</li>
                <li>Compresser et d�compresser des fichiers.</li>
                <li>Optimiser des fichiers en fonction de leur utilisation future.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(27,
N'      <ul>
                <li>Faire des lectures en lien avec les concepts et la th�orie.</li>
                <li>Effectuer des exercices pratiques.</li>
                <li>Participer aux laboratoires pratiques portant sur :</li>
                        <ul>
                                <li>les partitions;</li>
                                <li>le formatage;</li>
                                <li>la gestion des fichiers et des r�pertoires;</li>
                                <li>la s�curit� des donn�es.</li>
                        </ul>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(28,
N'      <ul>
                <li>Faire des lectures en lien avec les concepts et la th�orie.</li>
                <li>Effectuer des exercices pratiques.</li>
                <li>Participer aux laboratoires pratiques portant sur :</li>
                        <ul>
                                <li>identification d�une t�che en probl�me;</li>
                                <li>suppression d�une t�che;</li>
                                <li>automatisation d�un processus.</li>
                        </ul>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(29,
N'      <ul>
                <li>Faire des lectures en lien avec les concepts et la th�orie.</li>
                <li>Effectuer des exercices pratiques.</li>
                <li>Participer aux laboratoires d�observation et d�analyse des param�tres de gestion de m�moire.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(30,
N'      <ul>
                <li>Faire des lectures en lien avec les concepts et la th�orie.</li>
                <li>Effectuer des exercices pratiques.</li>
                <li>Participer aux laboratoires pratiques utilisant diff�rentes configurations.</li>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(31,
N'      <ul>
                <li>En laboratoire pratique:</li>
                        <ul>
                                <li>proc�der � l�installation personnalis�e d''au moins un syst�me d''exploitation;</li>
                                <li>faire une mise � jour d''un syst�me d''exploitation.</li>
                        </ul>
        </ul>
')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActiviteApprentissage], [description])VALUES(32,
N'      <ul>
                <li>En laboratoire pratique:</li>
                        <ul>
                                <li>�tablir un retour � une version ant�rieure d''un syst�me d''exploitation.</li>
                        </ul>
        </ul>
')

SET IDENTITY_INSERT ActiviteApprentissage OFF
SET IDENTITY_INSERT [ElementConnaissance] ON
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(1,
N'      <ul>
                <li>Vision d�ensemble du monde de l�informatique :</li>
                        <ul>
                                <li>place actuelle de l�informatique dans la soci�t�;</li>
                                <li>influences sur les entreprises;</li>
                                <li>influences sur les gens;</li>
                                <li>�volution technologique (rappel historique, situation actuelle, tendance).</li>
                        </ul>
                <li>Type d''emplois :</li>
                        <ul>
                                <li>analyse;</li>
                                <li>programmation;</li>
                                <li>gestion de r�seau;</li>
                                <li>soutien technique;</li>
                                <li>autres profils d''emplois.</li>
                        </ul>
                <li>Particuliarit�s de chaque type d''emploi :</li>
                        <ul>
                                <li>possibilit�s et conditions d''exercices;</li>
                                <li>pratique professionnel;</li>
                                <li>r�les;</li>
                                <li>responsabilit�s;</li>
                                <li>organisation de travail.</li>
                        </ul>
                <li>Cat�gories d''entreprises :</li>
                        <ul>
                                <li>grande entreprise;</li>
                                <li>PME;</li>
                                <li>firmes de service.</li>
                        </ul>
                <li>Environnement informatique sur le march�.</li>
                <li>Environnement informatique au C�gep de Jonqui�re.</li>
        </ul>
',1)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(2,
N'      <ul>
                <li>T�ches associ�es aux type d''emplois :</li>
                        <ul>
                                <li>d�veloppement;</li>
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
                <li>Pr�sentation de la voie de sp�cialisation Informatique de gestion.</li>
        </ul>
',2)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(3,
N'      <ul>
                <li>Habilet�s � d�velopper.</li>
                <li>Comportements � adopter.</li>
                <li>Attitudes.</li>
                <li>Code d''�thique :</li>
                        <ul>
                                <li>du C�gep de Jonqui�re;</li>
                                <li>du d�partement;</li>
                                <li>du march� du travail.</li>
                        </ul>
                <li>Confidentialit� de l''information.</li>
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
                                <li>de syst�me;</li>
                                <li>technique;</li>
                                <li>utilisateur;</li>
                                <li>d''exploitation (journal de bord).</li>
                        </ul>
                <li>Utilisation des logiciels de cr�ation de documents :</li>
                        <ul>
                                <li>traitement de textes;</li>
                                <li>tableur;</li>
                                <li>logiciel de pr�sentation.</li>
                        </ul>
        </ul>
',5)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(7,
N'      <ul>
                <li>�tapes de r�solution de probl�mes.</li>

                <li>Notion d''entr�e-sortie.</li>

                <li>Types de donn�es :</li>
                        <ul>
                                <li>caract�res;</li>
                                <li>enti�res;</li>
                                <li>r�elles.</li>
                        </ul>
        <ul>
',6)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(8,
N'      <ul>
                <li>Notion d''algorithme.</li>
                <li>Notion d''instruction.</li>
                <li>Normes de r�daction d''un algorithme.</li>
                <li>Structures alternatives binaires, imbriqu�es et multiples.</li>
                <li>Structures r�p�titives :</li>
                        <ul>
                                <li>boucle Pour;</li>
                                <li>boucle Tant que;</li>
                                <li>boucle R�p�ter jusqu''�.</li>
                        </ul>
                <li>Structures r�p�titives imbriqu�es.</li>
                <li>Choix de la structure appropri�e pour un traitement.</li>
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
                <li>Fonctionnement g�n�ral de l''environnement.</li>
                <li>Repr�sentation des types de donn�es dans le langage de programmation.</li>
                <li>Repr�sentation des types de donn�es dans le langage de programmation.</li>
                        <ul>
                        <li>classe;</li>
                        <li>attribut;</li>
                        <li>m�thode.</li>
                        </ul>
                <li>Repr�sentation de chacune des structures de base dans le langage de programmation.</li>
                <li>Principes de documentation de programmes.</li>
        </ul>
',9)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(11,
N'<ul>
<li>Distinction entre compilation et ex�cution.</li>
                <li>Environnement de d�veloppement :</li>
                        <ul>
                                <li>mode de compilation d''un programme;</li>
                                <li>types d''erreurs de compilation;</li>
                                <li>m�thode de mise au point des erreurs de compilation.</li>
                        </ul>
        </ul>
',9)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(12,
N'      <ul>
                <li>Environnement de d�veloppement :</li>
                        <ul>
                                <li>mode d''ex�cution d''un programme;</li>
                                <li>fonctions de d�bogage.</li>
                        </ul>
                <li>Notion de jeux d''essai :</li>
                        <ul>
                                <li>principe d''�laboration;</li>
                                <li>v�rification des cas limites.</li>
                        </ul>
        </ul>
',9)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(13,
N'      <ul>
                <li>Correspondance entre la m�thode de r�solution de probl�mes en d�veloppement et en entretien.</li>
                <li>Techniques d''appropriation d''un dossier de programmation.</li>
        </ul>
',10)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(14,
N'      <ul>
                <li>Carte m�re :</li>
                        <ul>
                                <li>fonctions principales;</li>
                                <li>composantes.</li>
                        </ul>
                <li>Processeur :</li>
                        <ul>
                                <li>fonctionnement g�n�ral;</li>
                                <li>types et g�n�rations;</li>
                                <li>caract�ristiques.</li>
                        </ul>
                <li>M�moire :</li>
                        <ul>
                                <li>types de m�moire;</li>
                                <li>organisation logique;</li>
                                <li>compatibilit�.</li>
                        </ul>
                <li>M�moire auxiliaire :</li>
                        <ul>
                                <li>technologie de stockage;</li>
                                <li>principes et types de m�moires auxiliaires;</li>
                                <li>types de lecteurs optiques.</li>
                        </ul>
                <li>Mat�riel vid�o et audio :</li>
                        <ul>
                                <li>principes et caract�ristiques;</li>
                                <li>types de cartes graphiques;</li>
                                <li>types de moniteurs;</li>
                                <li>types de cartes de son.</li>
                        </ul>
                <li>Mat�riel de communication :</li>
                        <ul>
                                <li>technologique de communication;</li>
                                <li>principes et caract�ristiques;</li>
                                <li>types de cartes r�seaux.</li>
                        </ul>
                <li>Mat�riel d''entr�es-sorties :</li>
                        <ul>
                                <li>principes et caract�ristiques des ports;</li>
                                <li>types de ports (s�rie, parall�le, USB, PS2);</li>
                                <li>types de p�riph�riques (imprimantes, scanners, clavier, souris).</li>
                        </ul>
        </ul>
',11)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(15,
N'      <ul>
                <li>Plan de travail.</li>
                <li>Reconnaissance du mat�riel.</li>
                <li>Proc�dure d''installation physique et logique.</li>
        </ul>
',12)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(16,
N'      <ul>
                <li>M�thodes de consignation.</li>
                <li>Sauvegarde :</li>
                        <ul>
                                <li>sauvegarde des param�tres;</li>
                                <li>sauvegarde des donn�es;</li>
                                <li>disques de d�marrage.</li>
                        </ul>
                <li>Protection �lectrostatique.</li>
        </ul>
',12)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(17,
N'      <ul>
                <li>Fiches techniques :</li>
                        <ul>
                                <li>vocabulaire technique et nomenclature;</li>
                                <li>repr�sentation et codification;</li>
                                <li>normes.</li>
                        </ul>
                <li>Alimentation et bo�tier.</li>
                <li>C�bles et connecteurs.</li>
                <li>Configuration physique.</li>
                <li>D�marrage et types d''erreurs.</li>
        </ul>
',13)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(18,
N'      <ul>
                <li>Proc�dure de d�sinstallation physique.</li>
        </ul>
',14)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(19,
N'      <ul>
                <li>Choix du logiciel d�installation, version.</li>
                <li>Pilotes de p�riph�riques.</li>
                <li>Configuration logique.</li>
                <li>D�marrage et types d''erreurs.</li>
        </ul>
',13)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(20,
N'      <ul>
                <li>Proc�dure de d�sinstallation logique.</li>
        </ul>
',15)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(21,
N'      <ul>
                <li>Proc�dure de v�rification globale.</li>
                <li>Concepts de base d''ergonomie.</li>
        </ul>
',16)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(22,
N'      <ul>
                <li>R�gles de consignation de l�information.</li>
        </ul>
',17)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(23,
N'      <ul>
                <li>D�marche de pr�cision d�un besoin de recherche li� au mat�riel informatique.</li>
        </ul>
',18)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(24,
N'      <ul>
                <li>Sources d''information particuli�res au domaine du mat�riel informatique.</li>
                <li>Sources d''information :</li>
                        <ul>
                                <li>pertinence;</li>
                                <li>qualit�;</li>
                                <li>fiabilit�.</li>
                        </ul>
        </ul>
',18)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(25,
N'      <ul>
                <li>M�thode d��valuation de l�information.</li>
        </ul>
',19)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(26,
N'      <ul>
                <li>Types de classification des usagers.</li>
                <li>M�thodes de d�termination des attentes des usagers.</li>
                <li>Contextes d�utilisation d�une interface homme-machine (IHM).</li>
                <li>Contextes d�utilisation d�interfaces mobiles.</li>
        </ul>
',20)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(27,
N'      <ul>
                <li>Types d�interfaces.</li>
                <li>�l�ments d�terminants dans la conception d�interfaces :</li>
                        <ul>
                                <li>public cible (besoins et habitudes);</li>
                                <li>type de produit;</li>
                                <li>domaine d�utilisation;</li>
                                <li>volume d�utilisation;</li>
                                <li>plateformes utilis�es et compatibilit�;</li>
                                <li>budget de conception;</li>
                                <li>co�ts (d�veloppement, mise en march�, installation);</li>
                                <li>fiabilit� et robustesse de l�interface.</li>
                        </ul>
        </ul>
',21)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(28,
N'      <ul>
                <li>P�riph�riques d�entr�e et de sortie :</li>
                        <ul>
                                <li>types;</li>
                                <li>caract�ristiques;</li>
                                <li>domaines d�utilisation.</li>
                        </ul>
        </ul>
',22)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(29,
N'      <ul>
                <li>Standards de d�veloppement :</li>
                        <ul>
                                <li>normes;</li>
                                <li>guides de styles;</li>
                                <li>navigation.</li>
                        </ul>
                <li>Notions de r�troaction graphique (s�lection, clic).</li>
                <li>Gestion des exceptions et des actions.</li>
                <li>Techniques de prototypage d��crans.</li>
                <li>Ergonomie d��crans et d�utilisation. </li>
                <li>Ad�quation de l�interface avec les :</li>
                        <ul>
                                <li>devis initiaux;</li>
                                <li>besoins de l�usager.</li>
                        </ul>
                
        </ul>
',23)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(30,
N'      <ul>
                <li>Concepts du langage choisi :</li>
                        <ul>
                                <li>types de donn�es;</li>
                                <li>structures de base (s�quence, it�ration, d�cision).</li>
                        </ul>
                <li>Outils et fonctions propres au langage :</li>
                        <ul>
                                <li>cr�ation d��l�ments;</li>
                                <li>limites de la r�troaction graphique du langage;</li>
                                <li>positionnement des �l�ments;</li>
                                <li>liaison entre les �l�ments;</li>
                                <li>liaison entre les �l�ments et le programme de l�application.</li>
                        </ul>
                <li>Tests et validation de l�interface.</li>
        </ul>
',24)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(31,
N'      <ul>
                <li>Logiciel de traitement d�images :</li>
                        <ul>
                                <li>caract�ristiques;</li>
                                <li>limites;</li>
                                <li>comparaison.</li>
                        </ul>
                <li>Traitement d''images :</li>
                        <ul>
                                <li>am�lioration de la qualit�;</li>
                                <li>modification;</li>
                                <li>manipulation;</li>
                                <li>assemblage;</li>
                                <li>s�lection;</li>
                                <li>calibration des couleurs et des textures.</li>
                        </ul>
                <li>M�thodes d�importation d�images.</li>
                <li>Normes et standards de qualit�.</li>
        </ul>
',25)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(32,
N'      <ul>
                <li>Formats de fichiers :</li>
                        <ul>
                                <li>d�image;</li>
                                <li>de son;</li>
                                <li>vid�o;</li>
                                <li>crit�res de choix.</li>
                        </ul>
                <li>Proc�dure de conversion.</li>
                <li>Utilitaires de compression et de d�compression.</li>
        </ul>
',26)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(33,
N'      <ul>
                <li>Syst�me d''exploitation :</li>
                        <ul>
                                <li>r�le;</li>
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
                <li>Gestion de fichiers et des r�pertoires :</li>
                        <ul>
                                <li>principes;</li>
                                <li>limites;</li>
                                <li>commandes;</li>
                                <li>partage.</li>
                        </ul>
                <li>S�curit� des donn�es :</li>
                        <ul>
                                <li>acc�s;</li>
                                <li>int�grit�;</li>
                                <li>r�cup�ration.</li>
                        </ul>
        </ul>

',27)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(34,
N'      <ul>
                <li>Gestion des t�ches :</li>
                        <ul>
                                <li>m�thodes;</li>
                                <li>principes multit�ches;</li>
                                <li>limites;</li>
                                <li>priorit�;</li>
                                <li>s�curit�.</li>
                        </ul>
                <li>Automatisation des t�ches :</li>
                        <ul>
                                <li>concepts;</li>
                                <li>limites.</li>
                        </ul>
        </ul>
',28)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(35,
N'      <ul>
                <li>Gestion de la m�moire :</li>
                        <ul>
                                <li>principes;</li>
                                <li>possibilit�s et limites;</li>
                                <li>allocation de la m�moire en fonction des t�ches;</li>
                                <li>plages m�moires des p�riph�riques.</li>
                        </ul>
        </ul>
',29)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(36,
N'      <ul>
                <li>Configuration d''un syst�me d''exploitation :</li>
                        <ul>
                                <li>fichiers;</li>
                                <li>param�tres;</li>
                                <li>commandes;</li>
                                <li>droits d�utilisation.</li>
                        </ul>
        </ul>
',30)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(37,
N'      <ul>
                <li>D�marche d''installation d''un syst�me d''exploitation :</li>
                        <ul>
                                <li>planification;</li>
                                <li>consignation de la configuration initiale;</li>
                                <li>prise de copies de s�curit�;</li>
                                <li>choix des param�tres de configuration;</li>
                                <li>disquette de d�marrage;</li>
                                <li>tests;</li>
                                <li>consignation de la configuration finale.</li>
                        </ul>
                <li>Distinction entre installation et mise � jour.</li>
        </ul>
',31)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActiviteApprentissage]) VALUES(38,
N'      <ul>
                <li>Circonstances amenant une d�sinstallation.</li>
                <li>Processus de d�sinstallation :</li>
                        <ul>
                                <li>prise en charge par le syst�me;</li>
                                <li>manuel;</li>
                                <li>limites et contraintes.</li>
                        </ul>
                <li>Types d''installations versus possibilit�s de d�sinstallation.</li>
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
/* Insert par Eddy le 2017/12/06 Adapt� sans voir la BD : idElementConnaissance repris sur Fred, donc en doublons */
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

/* Valid� !!!!!!!!!!!!!!!!!!! */


/* Cl�s primaires idPlanCadre chang�es par rapport � mon premier modele  */


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

/* Ajout des donn�es PlanCadreEnonce pour les PC ins�r�s par Fred  

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
