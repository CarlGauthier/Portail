using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using System.Dynamic;
using System.Net;
using System.Data.Entity;
using ApplicationPlanCadre.Models;
using Rotativa;
using Rotativa.Options;

namespace ApplicationPlanCadre.Controllers
{
    public class RapportController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();
        // GET: Rapport
        public ActionResult Index()
        {
            dynamic model = new ExpandoObject();
            model.Programme = GetCodeProgrammeSelectList();
            model.PlanCadre = getPlanCadreSelectList();
            return View(model);
        }
        private List<PlanCadre> getPlanCadreSelectList()
        {
            List<PlanCadre> planList = new List<PlanCadre>();
            var liste = from a in db.PlanCadre
                        select a;
            foreach(PlanCadre plan in liste )
            {
                planList.Add(new PlanCadre {
                    numeroCours=plan.numeroCours,
                    titreCours=plan.titreCours,
                    idPlanCadre=plan.idPlanCadre
                });
            }
            return planList;
        }
        private List<Programme> GetCodeProgrammeSelectList()
        {
            List<Programme> progList = new List<Programme>();
            var liste = from a in db.Programme
                       select a;
            foreach(Programme prog in liste)
            {
                progList.Add(new Programme {
                    nom = prog.nom,
                    idProgramme=prog.idProgramme
                });
            }
            return progList;
            
            
            
        }
        public ActionResult RapportPlanCadre (int id)
        {
            List<PlanCadre> planListHolder = new List<PlanCadre>();
            planListHolder.AddRange(getPlanCadre(id));
            

            return new ViewAsPdf("RapportProgramme")
            {
                //CustomSwitches = customSwitches,
                PageSize = Size.A4
            };
        }
        public ActionResult RapportProgramme(int id)
        {
             
            dynamic model = new ExpandoObject();
            
            List<SecondaryEnonceCompetence> enonceComptListHolder = new List<SecondaryEnonceCompetence>();
            List<SecondaryElementCompetence> elemCompListHolder = new List<SecondaryElementCompetence>();
            
            List<SecondaryContexteRealisation> contextRealListHolder = new List<SecondaryContexteRealisation>();
            
            List<SecondaryDevisMinistere> devisListHolder = new List<SecondaryDevisMinistere>();

            model.Programme = getProgram(id);
            
            foreach(SecondaryProgramme prog in model.Programme)
            {
                devisListHolder.AddRange(getDevis(prog.idDevis));
                foreach(SecondaryDevisMinistere devis in devisListHolder)
                {
                    enonceComptListHolder.AddRange(getEnonceCompetence(devis.idDevis));
                    foreach(SecondaryEnonceCompetence enonceCompt in enonceComptListHolder)
                    {
                        elemCompListHolder.AddRange(getElemCompetence(enonceCompt.idCompetence));
                        contextRealListHolder.AddRange(getContexteRealisation(enonceCompt.idCompetence));
                    }
                }
            }
            model.DevisMinistere = devisListHolder;
            model.EnonceCompetence = enonceComptListHolder;
            model.ElementCompetence = elemCompListHolder;
            model.ContexteRealisation = contextRealListHolder;

            string header = Server.MapPath("~/Views/static/header.html");
            string footer = Server.MapPath("~/Views/static/footer.html");
            string customSwitches = string.Format("--header-html  \"{0}\" " +
                                  "--header-spacing \"0\" " +
                                  "--footer-html \"{1}\" " +
                                  "--footer-spacing \"10\" " +
                                  "--footer-font-size \"10\" " +
                                  "--header-font-size \"10\" ", header, footer);
            return new ViewAsPdf("RapportProgramme", model)
            {
                CustomSwitches = customSwitches,
                PageSize=Size.A4
            };
        }
        private List <SecondaryProgramme> getProgram(int x)
        {
                List<SecondaryProgramme> programme = new List<SecondaryProgramme>();
                var holding = from a in db.Programme
                              where a.idProgramme == x
                              select a;
                foreach (Programme prog in holding)
                {
                    programme.Add(new SecondaryProgramme
                    {
                        idProgramme = Convert.ToInt32(prog.idProgramme),
                        annee=prog.annee,
                        nom = prog.nom,
                        idDevis=prog.idDevis
                        
                    });
                }
                return programme;
        }
        private List<SecondaryDevisMinistere> getDevis(int x)
        {
            List<SecondaryDevisMinistere> devisList = new List<SecondaryDevisMinistere>();
            var devis = from a in db.DevisMinistere
                        where a.idDevis == x
                        select a;
            foreach(DevisMinistere devisMins in devis)
            {
                devisList.Add(new SecondaryDevisMinistere
                {
                    idDevis = devisMins.idDevis,
                    codeSpecialisation = devisMins.codeSpecialisation,
                    specialisation = devisMins.specialisation,
                    nbUnite = devisMins.nbUnite,
                    nbHeureFrmGenerale = devisMins.nbHeureFrmGenerale,
                    nbHeureFrmSpecifique = devisMins.nbHeureFrmSpecifique,
                    condition = devisMins.condition,
                    sanction = devisMins.sanction,
                    codeProgramme = devisMins.codeProgramme,
                    total =Convert.ToInt32((devisMins.nbHeureFrmGenerale + devisMins.nbHeureFrmSpecifique))
                });
            }
            return devisList;
        } 
        private List<SecondaryEnonceCompetence>getEnonceCompetence(int x)
        {
            List<SecondaryEnonceCompetence> enonComptList = new List<SecondaryEnonceCompetence>();
            var enonce = from a in db.EnonceCompetence
                         where a.idDevis == x
                         select a;

            foreach (EnonceCompetence EnonceCmpt in enonce)
            {
                enonComptList.Add(new SecondaryEnonceCompetence
                {
                    idCompetence = EnonceCmpt.idCompetence,
                    idDevis = EnonceCmpt.idDevis,
                    codeCompetence = EnonceCmpt.codeCompetence,
                    description= EnonceCmpt.description
                });
            }
            return enonComptList;
        }
        private List<SecondaryElementCompetence>getElemCompetence(int x)
        {
            List<SecondaryElementCompetence> elementList = new List<SecondaryElementCompetence>();
            var enonce = from a in db.ElementCompetence
                         where a.idCompetence == x
                         orderby a.numero
                         select a;
            foreach(ElementCompetence a in enonce)
            {
                elementList.Add(new SecondaryElementCompetence
                {
                    idElement=a.idElement,
                    idCompetence=a.idCompetence,
                    description =a.description,
                    
                 });
            }
            return elementList;
                

        }
        //private List<SecondaryCriterePerformance>getCriterePerformance(int x)
        //{
        //    List<SecondaryCriterePerformance> critereList = new List<SecondaryCriterePerformance>();
        //    var critere = from a in db.CriterePerformance
        //                  where a.idElement == x
        //                  select a;
        //    foreach(CriterePerformance a in critere)
        //    {
        //        critereList.Add(new SecondaryCriterePerformance
        //        {
        //            idCritere = a.idCritere,
        //            idElement =a.idElement,
        //            criterePerformance1 =a.criterePerformance1
        //        });
        //    }
        //    return critereList;
        //}
        private List<SecondaryContexteRealisation> getContexteRealisation(int x)
        {
            List<SecondaryContexteRealisation> contextList = new List<SecondaryContexteRealisation>();
            var context = from a in db.ContexteRealisation
                          where a.idCompetence == x
                          orderby a.numero
                          select a;
            foreach (ContexteRealisation a in context)
            {
                contextList.Add(new SecondaryContexteRealisation
                {
                    idContexte = a.idContexte,
                    idCompetence = a.idCompetence,
                    description = a.description

                });
            }
            return contextList;
        }
        private List<PlanCadre> getPlanCadre(int id)
        {
            List<PlanCadre> planList = new List<PlanCadre>();
            var liste = from a in db.PlanCadre
                        where id==a.idPlanCadre
                        select a;
            foreach (PlanCadre plan in liste)
            {
                planList.Add(new PlanCadre
                {
                    idPlanCadre = plan.idPlanCadre,
                    numeroCours = plan.numeroCours,
                    titreCours = plan.titreCours,
                    prealableAbs = plan.prealableAbs,
                    prealableRel = plan.prealableRel,
                    indicationPedago = plan.indicationPedago,
                    elementsConnaissance = plan.elementsConnaissance,
                    activiteApprentissage = plan.activiteApprentissage,
                    environnementPhys = plan.environnementPhys,
                    ressource = plan.ressource,
                    nbHeureTheorie = plan.nbHeureTheorie,
                    nbHeurePratique = plan.nbHeurePratique,
                    nbHeureDevoir = plan.nbHeureDevoir,
                    idProgramme = plan.idProgramme,
                    
                });
            }
            return planList;
        }

        


        
    }
}