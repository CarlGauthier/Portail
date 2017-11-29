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
        public ActionResult Index()
        {
            return View(db.PlanCadre.ToList());
        }

        public ActionResult Info(int? id)
        {
            return View(db.PlanCadre.Find(id));
        }

        public ActionResult Create(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Programme programme = db.Programme.Find(id);
            if (programme == null)
            {
                return HttpNotFound();
            }
            PlanCadre planCadre = new PlanCadre();
            planCadre.idProgramme = programme.idProgramme;
            return View(planCadre);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idPlanCadre,numeroCours,titreCours,indicationPedago,environementPhys,ressource,nbHeureTheorie,nbHeurePratique,nbHeureDevoir,idProgramme")] PlanCadre planCadre)
        {
            bool existe;
            existe = db.PlanCadre.Any(pc => pc.titreCours == planCadre.titreCours && pc.idProgramme == planCadre.idProgramme);
            //Trim();
            if (!existe && ModelState.IsValid)
            {
                planCadre.titreCours = planCadre.titreCours.ToUpper();
                db.PlanCadre.Add(planCadre);
                db.SaveChanges();
                return RedirectToAction("info", "Programme", new { idProgramme = planCadre.idProgramme });
            }
            if (existe)
                ModelState.AddModelError("Duplique", "Erreur, un plan cadre avec ce nom existe déjà.");
            return View(planCadre);
        }
    }
}