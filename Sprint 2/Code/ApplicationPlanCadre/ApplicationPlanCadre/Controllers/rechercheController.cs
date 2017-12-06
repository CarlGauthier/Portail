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
        // GET: recherche
        public ActionResult Index()
        {
            return View("recherche");
        }

        [HttpPost]
        public ActionResult Rechercher(string searchStr, bool chkRecherche)
        {
            dynamic model = new ExpandoObject();
            if (chkRecherche)
            {
                model.Programme = getProgram(searchStr);
                model.EnonceCompetence = getEnonceCompetence(searchStr);
            }
            else
            {
                model.EnonceCompetence = getEnonceCompetence(searchStr);
                model.ElementCompetence = getElemCompetence(searchStr);
                
                model.Programme = getProgram(searchStr);
                model.CriterePerformance = getCriterePerformance(searchStr);
                model.ContexteRealisation = getContexteRealisation(searchStr);
                model.DevisMinistere = getDevis(searchStr);
            }
            return PartialView("_afficherRecherche", model);
        }


        private List<SecondaryDevisMinistere> getDevis(string searchStr)
        {
            
            List<SecondaryDevisMinistere> devisList = new List<SecondaryDevisMinistere>();
            var devis = from a in db.DevisMinistere
                        where a.specialisation.Contains(searchStr)||a.codeSpecialisation.Contains(searchStr)||a.codeProgramme.Contains(searchStr)
                        select a;
            foreach (DevisMinistere devisMins in devis)
            {
                devisList.Add(new SecondaryDevisMinistere
                {
                    idDevis = devisMins.idDevis,
                    annee=devisMins.annee.HighlightKeyWords(searchStr, "yellow", false),
                    codeSpecialisation = devisMins.codeSpecialisation.HighlightKeyWords(searchStr, "yellow", false),
                    specialisation = devisMins.specialisation.HighlightKeyWords(searchStr, "yellow", false),
                    nbUnite = devisMins.nbUnite,
                    //nbHeureFrmGenerale = devisMins.nbHeureFrmGenerale,
                    //nbHeureFrmSpecifique = devisMins.nbHeureFrmSpecifique,
                    condition = devisMins.condition.HighlightKeyWords(searchStr, "yellow", false),
                    sanction = devisMins.sanction.HighlightKeyWords(searchStr, "yellow", false),
                    codeProgramme = devisMins.codeProgramme.HighlightKeyWords(searchStr, "yellow", false),
                    total = Convert.ToInt32((devisMins.nbHeureFrmGenerale + devisMins.nbHeureFrmSpecifique))
                });
            }
            return devisList;
        }
        //
        private List<SecondaryEnonceCompetence> getEnonceCompetence(string searchStr)
        {
            List<SecondaryEnonceCompetence> enonComptList = new List<SecondaryEnonceCompetence>();
            var enonce = from a in db.EnonceCompetence
                         where a.codeCompetence.Contains(searchStr)||a.description.Contains(searchStr)
                         select a;

            foreach (EnonceCompetence EnonceCmpt in enonce)
            {
                enonComptList.Add(new SecondaryEnonceCompetence
                {
                    idCompetence = EnonceCmpt.idCompetence,
                    idDevis = EnonceCmpt.idDevis,
                    codeCompetence = EnonceCmpt.codeCompetence.HighlightKeyWords(searchStr, "yellow", false),
                    description = EnonceCmpt.description.HighlightKeyWords(searchStr, "yellow", false)
                });
            }
            return enonComptList;
        }
        private List<SecondaryElementCompetence> getElemCompetence(string searchStr)
        {
            List<SecondaryElementCompetence> elementList = new List<SecondaryElementCompetence>();
            var enonce = from a in db.ElementCompetence
                         where a.description.Contains(searchStr)
                         orderby a.numero
                         select a;
            foreach (ElementCompetence a in enonce)
            {
                elementList.Add(new SecondaryElementCompetence
                {
                    idElement = a.idElement,
                    idCompetence = a.idCompetence,
                    description = a.description.HighlightKeyWords(searchStr, "yellow", false),

                });
            }
            return elementList;
        }

        private List<SecondaryProgramme> getProgram(string searchStr)
        {
            List<SecondaryProgramme> programme = new List<SecondaryProgramme>();
            var holding = from a in db.Programme
                            where a.annee.Contains(searchStr)||a.nom.Contains(searchStr)
                            select a;
            foreach (Programme prog in holding)
            {
                programme.Add(new SecondaryProgramme
                {
                    idProgramme = Convert.ToInt32(prog.idProgramme),
                    annee = prog.annee.HighlightKeyWords(searchStr, "yellow", false),
                    nom = prog.nom.HighlightKeyWords(searchStr, "yellow", false),
                    idDevis = prog.idDevis

                });
            }
            return programme;
        }
        private List<SecondaryCriterePerformance> getCriterePerformance(string searchStr)
        {
            List<SecondaryCriterePerformance> critereList = new List<SecondaryCriterePerformance>();
            var critere = from a in db.CriterePerformance
                          where a.description.Contains(searchStr)
                          orderby a.numero
                          select a;
            foreach (CriterePerformance a in critere)
            {
                critereList.Add(new SecondaryCriterePerformance
                {
                    idCritere = a.idCritere,
                    idElement = a.idElement,
                    description = a.description.HighlightKeyWords(searchStr, "yellow", false)
                });
            }
            return critereList;
        }
        private List<SecondaryContexteRealisation> getContexteRealisation(string searchStr)
        {
            List<SecondaryContexteRealisation> contextList = new List<SecondaryContexteRealisation>();
            var context = from a in db.ContexteRealisation
                          where a.description.Contains(searchStr)
                          orderby a.numero
                          select a;
            foreach (ContexteRealisation a in context)
            {
                contextList.Add(new SecondaryContexteRealisation
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
