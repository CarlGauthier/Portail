using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ApplicationPlanCadre.Models;
using ApplicationPlanCadre.Helpers;

namespace ApplicationPlanCadre.Controllers
{
    public class ProgrammeController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        public ActionResult Index()
        {
            
            
            return View(db.Programme.ToList());
        }

        public ActionResult Details(int? id)
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

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idProgramme,nom,annee,dateValidation,idDevis")] Programme programme)
        {
            if (ModelState.IsValid)
            {
                db.Programme.Add(programme);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(programme);
        }

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
            return View(programme);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idProgramme,nom,annee,dateValidation,idDevis")] Programme programme)
        {
            if (ModelState.IsValid)
            {
                db.Entry(programme).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(programme);
        }

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
