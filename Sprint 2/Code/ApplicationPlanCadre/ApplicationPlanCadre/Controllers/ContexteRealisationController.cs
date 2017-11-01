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
    public class ContexteRealisationController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        public ActionResult _PartialList(int? idCompetence)
        {
            EnonceCompetence enonceCompetence = db.EnonceCompetence.Find(idCompetence);
            return PartialView(enonceCompetence.ContexteRealisation);
        }

        public ActionResult Create(int? idCompetence)
        {
            if (idCompetence == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnonceCompetence enonceCompetence = db.EnonceCompetence.Find(idCompetence);
            if (enonceCompetence == null)
            {
                return HttpNotFound();
            }
            ContexteRealisation contexteRealisation = new ContexteRealisation();
            contexteRealisation.EnonceCompetence = enonceCompetence;
            contexteRealisation.idCompetence = enonceCompetence.idCompetence;
            return View(contexteRealisation);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idContexte,contexteRealisation1,commentaire,idCompetence")] ContexteRealisation contexteRealisation)
        {
            if (ModelState.IsValid)
            {
                Trim(contexteRealisation);
                db.ContexteRealisation.Add(contexteRealisation);
                db.SaveChanges();
                return RedirectToAction("Create", new { idCompetence = contexteRealisation.idCompetence });
            }
            contexteRealisation.EnonceCompetence = db.EnonceCompetence.Find(contexteRealisation.idCompetence);
            return View(contexteRealisation);
        }

        public ActionResult Edit(int? idContexte)
        {
            if (idContexte == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ContexteRealisation contexteRealisation = db.ContexteRealisation.Find(idContexte);
            if (contexteRealisation == null)
            {
                return HttpNotFound();
            }
            return View(contexteRealisation);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idContexte,contexteRealisation1,commentaire,idCompetence")] ContexteRealisation contexteRealisation)
        {
            if (ModelState.IsValid)
            {
                Trim(contexteRealisation);
                db.Entry(contexteRealisation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Create", new { idCompetence = contexteRealisation.idCompetence });
            }
            return View(contexteRealisation);
        }

        [ActionName("Delete")]
        public ActionResult DeleteConfirmed(int idContexte)
        {
            ContexteRealisation contexteRealisation = db.ContexteRealisation.Find(idContexte);
            db.ContexteRealisation.Remove(contexteRealisation);
            db.SaveChanges();
            return RedirectToAction("Create", new { idCompetence = contexteRealisation.idCompetence });
        }

        private void Trim(ContexteRealisation contexteRealisation)
        {
            contexteRealisation.contexteRealisation1.Trim();
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
