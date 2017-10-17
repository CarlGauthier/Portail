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
    public class ContexteRealisationsController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        // GET: ContexteRealisations
        public ActionResult Index()
        {
            var contexteRealisation = db.ContexteRealisation.Include(c => c.EnonceCompetence);
            return View(contexteRealisation.ToList());
        }

        // GET: ContexteRealisations/Details/5
        public ActionResult Details(int? id)
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

        // GET: ContexteRealisations/Create
        public ActionResult Create()
        {
            ViewBag.idCompetence = new SelectList(db.EnonceCompetence, "idCompetence", "codeCompetence");
            return View();
        }

        // POST: ContexteRealisations/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idContexte,contexteRealisation1,commentaire,idCompetence")] ContexteRealisation contexteRealisation)
        {
            if (ModelState.IsValid)
            {
                db.ContexteRealisation.Add(contexteRealisation);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idCompetence = new SelectList(db.EnonceCompetence, "idCompetence", "codeCompetence", contexteRealisation.idCompetence);
            return View(contexteRealisation);
        }

        // GET: ContexteRealisations/Edit/5
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

        // POST: ContexteRealisations/Edit/5
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

        // GET: ContexteRealisations/Delete/5
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

        // POST: ContexteRealisations/Delete/5
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
