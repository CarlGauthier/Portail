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
            ViewBag.codeProgramme = GetCodeProgrammeSelectList();
            return View();
        }
        private SelectList GetCodeProgrammeSelectList()
        {
            var liste =
            db.Programme
            .Select(ep => new
            {
                codeProgramme = ep.idProgramme,
                texte = ep.nom
            })
            .ToList();
            return new SelectList(liste, "codeProgramme", "texte");
        }
        public ActionResult RapportProgramme([Bind(Include = "codeProgramme")] Programme programme)
        {
            int id = Convert.ToInt32(programme.codeProgramme); // c'est l'id programme ne vous fier pas au nom (A changé éventuellement)
            dynamic model = new ExpandoObject();
            List<SecondaryElementCompetence> elemCompList = new List<SecondaryElementCompetence>();
            List<SecondaryElementCompetence> elemCompListHolder = new List<SecondaryElementCompetence>();
            
            model.Programme = getProgram(id);
            model.EnonceCompetence = getEnonceCompetence(id);
            foreach(SecondaryEnonceCompetence x in model.EnonceCompetence)
            {
                elemCompListHolder = getElemCompetence(x.idCompetence);
                foreach(SecondaryElementCompetence a in elemCompListHolder)
                {
                    elemCompList.Add(new SecondaryElementCompetence
                    {
                        idElement = a.idElement,
                        idCompetence = a.idCompetence,
                        commentaire = a.commentaire,
                        element=a.element
                    });
                }
            }
            model.ElementCompetence = elemCompList;

            string header = Server.MapPath("~/Views/static/header.html");
            string customSwitches = string.Format("--header-html  \"{0}\" " +
                        "--header-spacing \"5\" " +
                        "--header-font-size \"10\" ", header);
            return new ViewAsPdf("RapportProgramme", model)
            {
                CustomSwitches = customSwitches,
                PageOrientation = Rotativa.Options.Orientation.Landscape,
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
                        nom = prog.nom
                    });
                }
                return programme;
        }
        private List<SecondaryEnonceCompetence>getEnonceCompetence(int x)
        {
            List<SecondaryEnonceCompetence> enonComptList = new List<SecondaryEnonceCompetence>();
            var enonce = from a in db.EnonceCompetence
                         where a.idProgramme == x
                         select a;

            foreach (EnonceCompetence EnonceCmpt in enonce)
            {
                enonComptList.Add(new SecondaryEnonceCompetence
                {
                    idCompetence = EnonceCmpt.idCompetence,
                    idProgramme = EnonceCmpt.idProgramme,
                    codeCompetence = EnonceCmpt.codeCompetence,
                    enonceCompetence1 = EnonceCmpt.enonceCompetence1
                });
            }
            return enonComptList;
        }
        private List<SecondaryElementCompetence>getElemCompetence(int x)
        {
            List<SecondaryElementCompetence> elementList = new List<SecondaryElementCompetence>();
            var enonce = from a in db.ElementCompetence
                         where a.idCompetence == x
                         select a;
            foreach(ElementCompetence a in enonce)
            {
                elementList.Add(new SecondaryElementCompetence
                {
                    idElement=a.idElement,
                    idCompetence=a.idCompetence,
                    element =a.element,
                    commentaire=a.commentaire
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
        //private List<SecondaryContexteRealisation>getContexteRealisation(int x)
        //{
        //    List<SecondaryContexteRealisation> contextList = new List<SecondaryContexteRealisation>();
        //    var context = from a in db.ContexteRealisation
        //                  where a.idCompetence == x
        //                  select a;
        //    foreach(ContexteRealisation a in context)
        //    {
        //        contextList.Add(new SecondaryContexteRealisation
        //        {
        //            idContexte = a.idContexte,
        //            idCompetence = a.idCompetence,
        //            contexteRealisation1 = a.contexteRealisation1

        //        });
        //    }
        //    return contextList;
        //}

        //action qui retourne le header
        [AllowAnonymous]
        public ActionResult _header()
        {
            return View();
        }


        
    }
}