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
using ApplicationPlanCadre.Helpers;

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
                    idPlanCadre=plan.idPlanCadre,
                    idType=plan.idType,
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
            string header = Server.MapPath("~/Views/static/header.html");
            string footer = Server.MapPath("~/Views/static/footer.html");
            string customSwitches = string.Format(
                                  "--header-html  \"{0}\" " +
                                  "--header-spacing \"3\" " +
                                  "--footer-html \"{1}\" " +
                                  "--footer-spacing \"10\" " +
                                  "--footer-font-size \"10\" " +
                                  "--header-font-size \"10\" ", header, footer);

            return new ViewAsPdf("RapportPlanCadre",db.PlanCadre.Find(id))
            {
                CustomSwitches = customSwitches,
                PageSize = Size.A4,
                PageOrientation = Orientation.Landscape
            };
        }
        
        public ActionResult RapportProgramme(int id)
        {
            string header = Server.MapPath("~/Views/static/header.html");
            string footer = Server.MapPath("~/Views/static/footer.html");
            string customSwitches = string.Format(
                                  "--header-html  \"{0}\" " +
                                  "--header-spacing \"0\" " +
                                  "--footer-html \"{1}\" " +
                                  "--footer-spacing \"10\" " +
                                  "--footer-font-size \"10\" " +
                                  "--header-font-size \"10\" ", header, footer);
            return new ViewAsPdf("RapportProgramme", db.Programme.Find(id))
            {
                CustomSwitches = customSwitches,
                PageSize = Size.A4
            };
        }
        
        



    }
}