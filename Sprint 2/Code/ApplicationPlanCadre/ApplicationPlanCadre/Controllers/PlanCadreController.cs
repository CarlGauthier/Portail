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

        public ActionResult Index()
        {
            return View(db.PlanCadre.ToList());
        }

        public ActionResult Create(int? idProgramme)
        {
            if (idProgramme == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Programme programme = db.Programme.Find(idProgramme);
            if (programme == null)
            {
                return HttpNotFound();
            }
            PlanCadre planCadre = new PlanCadre();
            planCadre.idProgramme = programme.idProgramme;
            return View(planCadre);
        }
        //todo:pour l'instant les type de plan cadre ne son pas géré pour l'instant il sont automatique
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idPlanCadre,numeroCours,titreCours,indicationPedago,environnementPhys,ressource,nbHeureTheorie,nbHeurePratique,nbHeureDevoir,idProgramme")] PlanCadre planCadre)
        {
            bool existe;
            existe = db.PlanCadre.Any(pc => pc.titreCours == planCadre.titreCours && pc.idProgramme == planCadre.idProgramme);
            //Trim();
            if (!existe && ModelState.IsValid)
            {
                planCadre.titreCours = planCadre.titreCours.ToUpper();
                planCadre.idType = 1;
                db.PlanCadre.Add(planCadre);
                db.SaveChanges();
                return RedirectToAction("info", "Programme", new { idProgramme = planCadre.idProgramme });
            }
            if (existe)
                ModelState.AddModelError("Duplique", "Erreur, un plan cadre avec ce nom existe déjà.");
            return View(planCadre);
        }

        public ActionResult Edit(int? idPlanCadre)
        {
            if (idPlanCadre == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlanCadre planCadre = db.PlanCadre.Find(idPlanCadre);
            if (planCadre == null)
            {
                return HttpNotFound();
            }
            return View(planCadre);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idPlanCadre,numeroCours,titreCours,indicationPedago,environementPhys,ressource,nbHeureTheorie,nbHeurePratique,nbHeureDevoir,idProgramme")] PlanCadre planCadre)
        {
            bool existe;
            existe = db.PlanCadre.Any(pc => pc.idProgramme != planCadre.idProgramme && pc.titreCours == planCadre.titreCours);
            //Trim();
            if (!existe && ModelState.IsValid)
            {
                db.Entry(planCadre).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("info", new { idPlanCadre = planCadre.idPlanCadre });
            }
            if (existe)
                ModelState.AddModelError("Duplique", "Erreur, un plan cadre avec ce nom existe déjà.");
            return View(planCadre);
        }

        public ActionResult Info(int? idPlanCadre)
        {
            if (idPlanCadre == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlanCadre planCadre = db.PlanCadre.Find(idPlanCadre);
            if (planCadre == null)
            {
                return HttpNotFound();
            }
            return View(planCadre);
        }
    }
}