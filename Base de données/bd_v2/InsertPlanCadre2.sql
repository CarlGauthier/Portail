SET IDENTITY_INSERT [ElementConnaissance] ON
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActivite]) VALUES(1,
N'Vision d’ensemble du monde de l’informatique :
'+CHAR(9)+'• place actuelle de l’informatique dans la socièté;
'+CHAR(9)+'• influences sur les entreprises;
'+CHAR(9)+'• influences sur les gens;
'+CHAR(9)+'• évolution technologique (rappel historique, situation actuelle, tendance).

Type d''emplois :
'+CHAR(9)+'•  analyse;
'+CHAR(9)+'•  programmation;
'+CHAR(9)+'•  gestion de réseau;
'+CHAR(9)+'•  soutien technique;
'+CHAR(9)+'•  autres profils d''emplois.

Particuliarités de chaque type d''emploi :
'+CHAR(9)+'•  possibilités et conditions d''exercices;
'+CHAR(9)+'•  pratique professionnel;
'+CHAR(9)+'•  rôles;
'+CHAR(9)+'•  responsabilités;
'+CHAR(9)+'•  organisation de travail.

Catégories d''entreprises :
'+CHAR(9)+'•  grande entreprise;
'+CHAR(9)+'•  PME;
'+CHAR(9)+'•  firmes de service.

Environnement informatique sur le marché.
Environnement informatique au Cégep de Jonquière.',1)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActivite]) VALUES(2,
N'Tâches associées aux type d''emplois :
'+CHAR(9)+'• développement;
'+CHAR(9)+'• entretien;
'+CHAR(9)+'• soutien;
'+CHAR(9)+'• formation.

Type de formation :
'+CHAR(9)+'• DEC;
'+CHAR(9)+'• AEC
'+CHAR(9)+'• BACC, DEC-BACC;
'+CHAR(9)+'• formation sur mesure;
'+CHAR(9)+'• certification.

Présentation de la voie de spécialisation Informatique de gestion.',2)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActivite]) VALUES(3,
N'Habiletés à développer.

Comportements à adopter.

Attitudes.

Code d''éthique :
'+CHAR(9)+'• du Cégep de Jonquière;
'+CHAR(9)+'• du département;
'+CHAR(9)+'• du marché du travail.

Confidentialité de l''information.',3)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActivite]) VALUES(4,
N'Lois touchant le domaine.

Application des lois.

Disciplines et sanctions.',4)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActivite]) VALUES(5,
N'Buts et importance de la documentation.',5)
GO
INSERT [dbo].[ElementConnaissance] ([idElementConnaissance], [description], [idActivite]) VALUES(6,
N'Type de documentation :
'+CHAR(9)+'• de système;
'+CHAR(9)+'• technique;
'+CHAR(9)+'• utilisateur;
'+CHAR(9)+'• d''exploitation (journal de bord).

Utilisation des logiciels de création de documents :
'+CHAR(9)+'• traitement de textes;
'+CHAR(9)+'• tableur;
'+CHAR(9)+'• logiciel de présentation.',5)
SET IDENTITY_INSERT ElementConnaissance OFF

SET IDENTITY_INSERT [ActiviteApprentissage] ON
INSERT [dbo].[ActiviteApprentissage] ([idActivite], [description])VALUES(1,
N'• À partir de sources identifiées en classe, lire sur es fonctions de travail pour en identifier les différentes conditions d''exercices.

• Assister à des conférences et visiter des entreprises du domaine de l''informatique')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActivite], [description])VALUES(2,
N'• À partir de sources identifiées en classe, lire sur les différentes fonctions de travail pour mieux comprendre les tâches et les opérations qui s''y rattachent.

• Effectuer des recherches sur les différents types d''emplois.

• Assister à des conférences et à des présentations sur les types d''emplois et de formations.')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActivite], [description])VALUES(3,
N'• À partir de sources identifiées en classe, lire sur l''éthique professionnel pour en saisir l''importance.

• À partir de mises en situation, identifier les habiletés, les attitudes et les comportements adéquats.

• Étudier différents codes d''éthique pour en relever les éléments significatifs.')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActivite], [description])VALUES(4,
N'• À partir de sources identifiées en classe, lire sur les lois et règlements qui s''appliquent au domaine de l''informatique de gestion.
• À partir de mises en situation, identifier les lois ou règlements qui s''appliquent.

• À partir de cas vécus, identifier les manquements aux lois et aux règlements.')
GO
INSERT [dbo].[ActiviteApprentissage] ([idActivite], [description])VALUES(5,
N'• Effectuer des exercices pratiques permettant d''expérimenter les logiciels.

• À partir d''une recherche d''information et dans les contextes associés aux fonctions de travail, réaliser la production de documents :
'+CHAR(9)+'- sélectionner le logiciel de production du document:
'+CHAR(9)+'- produire un document respectant les normes et les standarts de la profession.')

SET IDENTITY_INSERT ActiviteApprentissage OFF

SET IDENTITY_INSERT [PlanCadreElement] ON
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
SET IDENTITY_INSERT PlanCadreElement OFF
