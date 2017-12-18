using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Dynamic;
using System.Web.Mvc;
using System.Data.Entity;
using System.Configuration;
using ApplicationPlanCadre.Helpers;
using System.Linq.Expressions;
using ApplicationPlanCadre.Models;

namespace ApplicationPlanCadre.Controllers
{
    public class RechercheController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        public ActionResult Recherche()
        {
            return View();
        }

        //todo: la recherche ne support présentement pas la recherche avec les espaces
        [HttpPost]
        public ActionResult Rechercher(string searchStr, bool chkRecherche)
        {
            dynamic model = new ExpandoObject();
            if(searchStr != "")
            {
                if (chkRecherche)
                {
                    model.DevisMinistere = getDevis(searchStr);
                    model.EnonceCompetence = getEnonceCompetence(searchStr);
                    model.ElementCompetence = null;
                    model.CriterePerformance = null;
                    model.ContexteRealisation = null;
                }
                else
                {
                    model.EnonceCompetence = getEnonceCompetence(searchStr);
                    model.ElementCompetence = getElemCompetence(searchStr);
                    model.DevisMinistere = getDevis(searchStr);
                    model.CriterePerformance = getCriterePerformance(searchStr);
                    model.ContexteRealisation = getContexteRealisation(searchStr);

                }
            }
            else
            {
                model.EnonceCompetence = null;
                model.ElementCompetence = null;
                model.DevisMinistere = null;
                model.CriterePerformance = null;
                model.ContexteRealisation = null;
            }
            return PartialView("_afficherRecherche", model);
        }

        private List<SearchDevisMinistere> getDevis(string searchStr)
        {
            List<SearchDevisMinistere> devisList = new List<SearchDevisMinistere>();

            var devis = from a in db.DevisMinistere
                        where a.specialisation.Contains(searchStr) || a.codeSpecialisation.Contains(searchStr) || a.codeProgramme.Contains(searchStr) || a.annee.Contains(searchStr)
                        select a;

            foreach (DevisMinistere devisMins in devis)
            {
                devisList.Add(new SearchDevisMinistere
                {
                    idDevis = devisMins.idDevis,
                    annee = devisMins.annee.HighlightKeyWords(searchStr, "yellow", false),
                    codeSpecialisation = devisMins.codeSpecialisation.HighlightKeyWords(searchStr, "yellow", false),
                    specialisation = devisMins.specialisation.HighlightKeyWords(searchStr, "yellow", false),
                    nbUnite = devisMins.nbUnite,
                    nbHeureFrmGenerale = devisMins.nbHeureFrmGenerale,
                    nbHeureFrmSpecifique = devisMins.nbHeureFrmSpecifique,
                    condition = devisMins.condition.HighlightKeyWords(searchStr, "yellow", false),
                    sanction = devisMins.sanction.HighlightKeyWords(searchStr, "yellow", false),
                    codeProgramme = devisMins.codeProgramme.HighlightKeyWords(searchStr, "yellow", false),
                    total = Convert.ToInt32((devisMins.nbHeureFrmGenerale + devisMins.nbHeureFrmSpecifique))
                });
            }
            return devisList;
        }

        private List<SearchEnonceCompetence> getEnonceCompetence(string searchStr)
        {
            List<SearchEnonceCompetence> enonComptList = new List<SearchEnonceCompetence>();

            var enonce = from a in db.EnonceCompetence
                         where a.codeCompetence.Contains(searchStr) || a.description.Contains(searchStr)
                         select a;

            foreach (EnonceCompetence EnonceCmpt in enonce)
            {
                enonComptList.Add(new SearchEnonceCompetence
                {
                    idCompetence = EnonceCmpt.idCompetence,
                    idDevis = EnonceCmpt.idDevis,
                    codeCompetence = EnonceCmpt.codeCompetence.HighlightKeyWords(searchStr, "yellow", false),
                    description = EnonceCmpt.description.HighlightKeyWords(searchStr, "yellow", false)
                });
            }
            return enonComptList;
        }
        private List<SearchElementCompetence> getElemCompetence(string searchStr)
        {
            List<SearchElementCompetence> elementList = new List<SearchElementCompetence>();

            var enonce = from a in db.ElementCompetence
                         where a.description.Contains(searchStr)
                         orderby a.numero
                         select a;

            foreach (ElementCompetence a in enonce)
            {
                elementList.Add(new SearchElementCompetence
                {
                    idElement = a.idElement,
                    idCompetence = a.idCompetence,
                    description = a.description.HighlightKeyWords(searchStr, "yellow", false),

                });
            }
            return elementList;
        }

        private List<SearchProgramme> getProgram(string searchStr)
        {
           List<SearchProgramme> programme = new List<SearchProgramme>();

           var holding = from a in db.Programme
                              where a.annee.Contains(searchStr)||a.nom.Contains(searchStr)
                              select a;

           foreach (Programme prog in holding)
           {
                programme.Add(new SearchProgramme
                {
                    idProgramme = Convert.ToInt32(prog.idProgramme),
                    annee = prog.annee.HighlightKeyWords(searchStr, "yellow", false),
                    nom = prog.nom.HighlightKeyWords(searchStr, "yellow", false),
                    idDevis = prog.idDevis

                });
           }
           return programme;

        }
        private List<SearchCriterePerformance> getCriterePerformance(string searchStr)
        {
            List<SearchCriterePerformance> critereList = new List<SearchCriterePerformance>();

            var critere = from a in db.CriterePerformance
                          where a.description.Contains(searchStr)
                          orderby a.numero
                          select a;

            foreach (CriterePerformance a in critere)
            {
                critereList.Add(new SearchCriterePerformance
                {
                    idCritere = a.idCritere,
                    idElement = a.idElement,
                    description = a.description.HighlightKeyWords(searchStr, "yellow", false)
                });
            }
            return critereList;
        }
        private List<SearchContexteRealisation> getContexteRealisation(string searchStr)
        {
            List<SearchContexteRealisation> contextList = new List<SearchContexteRealisation>();

            var context = from a in db.ContexteRealisation
                          where a.description.Contains(searchStr)
                          orderby a.numero
                          select a;
            foreach (ContexteRealisation a in context)
            {
                contextList.Add(new SearchContexteRealisation
                {
                    idContexte = a.idContexte,
                    idCompetence = a.idCompetence,
                    description = a.description.HighlightKeyWords(searchStr, "yellow", false)

                });
            }
            return contextList;
        }
    }
}
