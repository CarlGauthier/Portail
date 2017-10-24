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

        public ActionResult List(int? id)
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
            ContexteRealisation contexteRealisation = new ContexteRealisation();
            contexteRealisation.EnonceCompetence = enonceCompetence;
            contexteRealisation.idCompetence = enonceCompetence.idCompetence;
            return View(contexteRealisation);
        }

        public ActionResult _PartialList(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var contexteRealisation = db.EnonceCompetence.Find(id).ContexteRealisation;
            if (contexteRealisation == null)
            {
                return HttpNotFound();
            }
            return PartialView("_PartialList", contexteRealisation);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idContexte,contexteRealisation1,commentaire,idCompetence")] ContexteRealisation contexteRealisation)
        {
            if (ModelState.IsValid)
            {
                db.ContexteRealisation.Add(contexteRealisation);
                db.SaveChanges();
            }
            return _PartialList(contexteRealisation.idCompetence);
        }

        // GET: ContexteRealisation/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ContexteRealisation contexteRealisation = db.ContexteRealisation.Find(id);
            if (contexteRealisation == null)
            {
                return HttpNotFound();
            }
            ViewBag.idCompetence = new SelectList(db.EnonceCompetence, "idCompetence", "codeCompetence", contexteRealisation.idCompetence);
            return View(contexteRealisation);
        }

        // POST: ContexteRealisation/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idContexte,contexteRealisation1,commentaire,idCompetence")] ContexteRealisation contexteRealisation)
        {
            if (ModelState.IsValid)
            {
                db.Entry(contexteRealisation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idCompetence = new SelectList(db.EnonceCompetence, "idCompetence", "codeCompetence", contexteRealisation.idCompetence);
            return View(contexteRealisation);
        }

        // GET: ContexteRealisation/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ContexteRealisation contexteRealisation = db.ContexteRealisation.Find(id);
            if (contexteRealisation == null)
            {
                return HttpNotFound();
            }
            return View(contexteRealisation);
        }

        // POST: ContexteRealisation/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ContexteRealisation contexteRealisation = db.ContexteRealisation.Find(id);
            db.ContexteRealisation.Remove(contexteRealisation);
            db.SaveChanges();
            return RedirectToAction("Index");
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
