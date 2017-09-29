using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using affichageCompt.Models;

namespace affichageCompt.Controllers
{
    public class EnonceCompetenceController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        // GET: EnonceCompetence
        public ActionResult Index()
        {
            var enonceCompetence = db.EnonceCompetence.Include(e => e.Programme);
            return View(enonceCompetence.ToList());
        }

        // GET: EnonceCompetence/Details/5
        public ActionResult Details(int? id)
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

        // GET: EnonceCompetence/Create
        public ActionResult Create()
        {
            ViewBag.idProgramme = new SelectList(db.Programme, "idProgramme", "code");
            return View();
        }

        // POST: EnonceCompetence/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idCompetence,codeCompetence,enonceCompetence1,motClef,obligatoire,actif,commentaire,idProgramme")] EnonceCompetence enonceCompetence)
        {
            if (ModelState.IsValid)
            {
                db.EnonceCompetence.Add(enonceCompetence);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idProgramme = new SelectList(db.Programme, "idProgramme", "code", enonceCompetence.idProgramme);
            return View(enonceCompetence);
        }

        // GET: EnonceCompetence/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.idProgramme = new SelectList(db.Programme, "idProgramme", "code", enonceCompetence.idProgramme);
            return View(enonceCompetence);
        }

        // POST: EnonceCompetence/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idCompetence,codeCompetence,enonceCompetence1,motClef,obligatoire,actif,commentaire,idProgramme")] EnonceCompetence enonceCompetence)
        {
            if (ModelState.IsValid)
            {
                db.Entry(enonceCompetence).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idProgramme = new SelectList(db.Programme, "idProgramme", "code", enonceCompetence.idProgramme);
            return View(enonceCompetence);
        }

        // GET: EnonceCompetence/Delete/5
        public ActionResult Delete(int? id)
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

        // POST: EnonceCompetence/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EnonceCompetence enonceCompetence = db.EnonceCompetence.Find(id);
            db.EnonceCompetence.Remove(enonceCompetence);
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
