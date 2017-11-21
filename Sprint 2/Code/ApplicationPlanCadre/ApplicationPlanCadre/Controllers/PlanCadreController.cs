using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ApplicationPlanCadre.Models;

namespace ApplicationPlanCadre.Controllers
{
    public class PlanCadreController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        public ActionResult _TreeView()
        {
            var planCadre = db.PlanCadre.ToList();

            return PartialView(planCadre);
        }

        // GET: PCInstance
        public ActionResult IndexFabrice()
        {
            return View(db.PlanCadre.ToList());
        }
        public ActionResult Index()
        {
            return View(db.PlanCadre.ToList());
        }




        public ActionResult PlanCadreDetail(int id)

        {
            dynamic model = new ExpandoObject();
            List<PlanCadre> planListHolder = new List<PlanCadre>();
            List<Programme> progListHolder = new List<Programme>();
            List<DevisMinistere> devisListHolder = new List<DevisMinistere>();
            List<PlanCadreEnonce> planCadreEnonceHolder = new List<PlanCadreEnonce>();
            List<EnonceCompetence> enonceComptListHolder = new List<EnonceCompetence>();
            List<ContexteRealisation> contextRealListHolder = new List<ContexteRealisation>();
            List<ElementCompetence> elementComptHolder = new List<ElementCompetence>();
            List<CriterePerformance> criterePerfHolder = new List<CriterePerformance>();



            planListHolder.AddRange(getPlanCadre(id));
            foreach (PlanCadre a in planListHolder) // start de la boucle
            {
                progListHolder.AddRange(getProgram(a.idProgramme)); //cherche tout les programmes relier au plan cadre (1)
                planCadreEnonceHolder.AddRange(getPlanCadreEnonce(a.idPlanCadre)); // va chercher l'enonce du plan cadre
                foreach (Programme b in progListHolder) // pour chaque programme cherche son devis
                {
                    devisListHolder.AddRange(getDevis(a.idProgramme));
                }
                foreach (PlanCadreEnonce c in planCadreEnonceHolder)// va chercher chaque enonce compétence du plancadre
                {
                    enonceComptListHolder.AddRange(getEnonceCompetence(c.idCompetence));

                }
                foreach (EnonceCompetence d in enonceComptListHolder)// va chercher les contexte de réalisation pour chaque enonce de competence
                {
                    contextRealListHolder.AddRange(getContexteRealisation(d.idCompetence));
                    elementComptHolder.AddRange(getElemCompetence(d.idCompetence));

                }
                foreach (ElementCompetence e in elementComptHolder)
                {
                    criterePerfHolder.AddRange(getCriterePerformance(e.idElement));
                }

            }


            model.PlanCadre = planListHolder;
            model.Programme = progListHolder;
            model.DevisMinistere = devisListHolder;
            model.PlanCadreEnonce = planCadreEnonceHolder;
            model.EnonceCompetence = enonceComptListHolder;
            model.ContexteRealisation = contextRealListHolder;
            model.ElementCompetence = elementComptHolder;
            model.CriterePerformance = criterePerfHolder;
            return View(model);
        }

        private List<Programme> getProgram(int x)
        {
            List<Programme> programme = new List<Programme>();
            var holding = from a in db.Programme
                          where a.idProgramme == x
                          select a;
            foreach (Programme prog in holding)
            {
                programme.Add(new Programme
                {
                    idProgramme = Convert.ToInt32(prog.idProgramme),
                    annee = prog.annee,
                    nom = prog.nom,
                    idDevis = prog.idDevis

                });
            }
            return programme;
        }
        private List<DevisMinistere> getDevis(int x)
        {
            List<DevisMinistere> devisList = new List<DevisMinistere>();
            var devis = from a in db.DevisMinistere
                        where a.idDevis == x
                        select a;
            foreach (DevisMinistere devisMins in devis)
            {
                devisList.Add(new DevisMinistere
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
                    
                });
            }
            return devisList;
        }
        private List<EnonceCompetence> getEnonceCompetence(int x)
        {
            List<EnonceCompetence> enonComptList = new List<EnonceCompetence>();
            var enonce = from a in db.EnonceCompetence
                         where a.idDevis == x
                         select a;

            foreach (EnonceCompetence EnonceCmpt in enonce)
            {
                enonComptList.Add(new EnonceCompetence
                {
                    idCompetence = EnonceCmpt.idCompetence,
                    idDevis = EnonceCmpt.idDevis,
                    codeCompetence = EnonceCmpt.codeCompetence,
                    description = EnonceCmpt.description
                });
            }
            return enonComptList;
        }
        private List<ElementCompetence> getElemCompetence(int x)
        {
            List<ElementCompetence> elementList = new List<ElementCompetence>();
            var enonce = from a in db.ElementCompetence
                         where a.idCompetence == x
                         orderby a.numero
                         select a;
            foreach (ElementCompetence a in enonce)
            {
                elementList.Add(new ElementCompetence
                {
                    idElement = a.idElement,
                    idCompetence = a.idCompetence,
                    description = a.description,
                    numero = a.numero

                });
            }
            return elementList;


        }
        private List<CriterePerformance> getCriterePerformance(int x)
        {
            List<CriterePerformance> critereList = new List<CriterePerformance>();
            var critere = from a in db.CriterePerformance
                          where a.idElement == x
                          orderby a.numero
                          select a;
            foreach (CriterePerformance a in critere)
            {
                critereList.Add(new CriterePerformance
                {
                    idCritere = a.idCritere,
                    idElement = a.idElement,
                    description = a.description,
                    numero = a.numero,
                });
            }
            return critereList;
        }
        private List<PlanCadreEnonce> getPlanCadreEnonce(int x)
        {
            List<PlanCadreEnonce> planCadreEnonceList = new List<PlanCadreEnonce>();
            var planCadreEnonce = from a in db.PlanCadreEnonce
                                  where a.idPlanCadre == x
                                  select a;
            foreach (PlanCadreEnonce a in planCadreEnonce)
            {
                planCadreEnonceList.Add(new PlanCadreEnonce
                {
                    idPlanCadre = a.idPlanCadre,
                    idPlanCadreEnonce = a.idPlanCadreEnonce,
                    idCompetence = a.idCompetence,
                    ponderationEnHeure = a.ponderationEnHeure
                });
            }
            return planCadreEnonceList;
        }
        private List<ContexteRealisation> getContexteRealisation(int x)
        {
            List<ContexteRealisation> contextList = new List<ContexteRealisation>();
            var context = from a in db.ContexteRealisation
                          where a.idCompetence == x
                          orderby a.numero
                          select a;
            foreach (ContexteRealisation a in context)
            {
                contextList.Add(new ContexteRealisation
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
                        where id == a.idPlanCadre
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