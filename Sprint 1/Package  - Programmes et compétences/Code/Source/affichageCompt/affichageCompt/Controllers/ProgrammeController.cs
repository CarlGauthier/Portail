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
    public class ProgrammeController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        // GET: Programme
        public ActionResult Index()
        {
            var programme = db.Programme
                .Include(p => p.EnonceCompetence)
                .ToList();
            return View(programme);
        }





        // GET: Programme/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnonceCompetence EnonceCompetence = db.EnonceCompetence.Find(id);
            if (EnonceCompetence == null)
            {
                return HttpNotFound();
            }
            return View(EnonceCompetence);
        }





        // GET: Programme/Create
        public ActionResult Create()
        {
            ViewBag.idEnteteProgramme = new SelectList(db.EnteteProgramme, "idEnteteProgramme", "code");
            return View();
        }

        // POST: Programme/Create
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idProgramme,code,annee,nom,nbUnite,codeSpecialisation,specialisation,nbHeurefrmGenerale,nbHeurefrmSpecifique,condition,sanction,commentaire,docMinistere_path,dateValidation,idEnteteProgramme")] Programme programme)
        {
            if (ModelState.IsValid)
            {
                db.Programme.Add(programme);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.idEnteteProgramme = new SelectList(db.EnteteProgramme, "idEnteteProgramme", "code", programme.idEnteteProgramme);
            return View(programme);
        }

        // GET: Programme/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.idEnteteProgramme = new SelectList(db.EnteteProgramme, "idEnteteProgramme", "code", programme.idEnteteProgramme);
            return View(programme);
        }

        // POST: Programme/Edit/5
        // Afin de déjouer les attaques par sur-validation, activez les propriétés spécifiques que vous voulez lier. Pour 
        // plus de détails, voir  https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idProgramme,code,annee,nom,nbUnite,codeSpecialisation,specialisation,nbHeurefrmGenerale,nbHeurefrmSpecifique,condition,sanction,commentaire,docMinistere_path,dateValidation,idEnteteProgramme")] Programme programme)
        {
            if (ModelState.IsValid)
            {
                db.Entry(programme).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.idEnteteProgramme = new SelectList(db.EnteteProgramme, "idEnteteProgramme", "code", programme.idEnteteProgramme);
            return View(programme);
        }

        // GET: Programme/Delete/5
        public ActionResult Delete(int? id)
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
            return View(programme);
        }

        // POST: Programme/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Programme programme = db.Programme.Find(id);
            db.Programme.Remove(programme);
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
