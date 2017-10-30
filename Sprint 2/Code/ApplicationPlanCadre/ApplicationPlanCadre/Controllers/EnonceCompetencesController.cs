using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Dynamic;
using System.Web.Mvc;
using ApplicationPlanCadre.Models;
using ApplicationPlanCadre.Helpers;

namespace ApplicationPlanCadre.Controllers
{
    [customAuthorize(Roles ="RCP")]
    public class EnonceCompetencesController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        // GET: EnonceCompetences
        public ActionResult Index()
        {
            var enonceCompetence = db.EnonceCompetence.Include(e => e.Programme);
            return View(enonceCompetence.ToList());
        }

        // GET: EnonceCompetences/Details/5
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

        // GET: EnonceCompetences/Create
        public ActionResult Create()
        {
            ViewBag.idProgramme = new SelectList(db.Programme, "idProgramme", "code");
            return View();
        }

        // POST: EnonceCompetences/Create
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

        // GET: EnonceCompetences/Edit/5
        [Route("Enoncer-Competence/Editer/{id:int?}",Name ="Edit-elemComp")]
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

        // POST: EnonceCompetences/Edit/5
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

        // GET: EnonceCompetences/Delete/5
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

        // POST: EnonceCompetences/Delete/5
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
