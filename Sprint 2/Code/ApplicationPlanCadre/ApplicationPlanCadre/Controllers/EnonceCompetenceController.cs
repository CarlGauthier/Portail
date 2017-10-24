using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ApplicationPlanCadre.Models;

namespace ApplicationPlanCadre.Controllers
{
    [Authorize(Roles = "RCP")]
    public class EnonceCompetenceController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        public ActionResult Info(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnonceCompetence enonceCompetence = db.EnonceCompetence.Find(id);
            if (enonceCompetence == null)
            {
                return HttpNotFound();
            }
            return View(enonceCompetence);
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
            EnonceCompetence enonceCompetence = new EnonceCompetence();
            enonceCompetence.Programme = programme;
            enonceCompetence.idProgramme = programme.idProgramme;
            return View(enonceCompetence);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idCompetence,codeCompetence,enonceCompetence1,motClef,obligatoire,actif,commentaire,idProgramme")] EnonceCompetence enonceCompetence)
        {
            if (ModelState.IsValid)
            {
                db.EnonceCompetence.Add(enonceCompetence);
                db.SaveChanges();
                return RedirectToAction("List", "ContexteRealisation", new { id = enonceCompetence.idCompetence });
            }
            return View(enonceCompetence);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
