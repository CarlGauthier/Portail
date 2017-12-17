using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Dynamic;
using ApplicationPlanCadre.Models;

namespace ApplicationPlanCadre.Controllers
{
    public class GrilleCoursController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        // GET: GrilleCours
        public ActionResult Index()
        {
            return View(db.GrilleCours.ToList());
        }

        // GET: GrilleCours/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GrilleCours grilleCours = db.GrilleCours.Find(id);
            if (grilleCours == null)
            {
                return HttpNotFound();
            }
            return View(grilleCours);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idGrille,nom")] GrilleCours grilleCours)
        {
            if (ModelState.IsValid)
            {
                db.GrilleCours.Add(grilleCours);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(grilleCours);
        }

        public ActionResult _TreeView()
        {
            return PartialView(db.GrilleCours.ToList());
        }

        public ActionResult _Structure(int id)
        {
            return PartialView(db.GrilleCours.Find(id));
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GrilleCours grilleCours = db.GrilleCours.Find(id);
            if (grilleCours == null)
            {
                return HttpNotFound();
            }
            return View(grilleCours);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idGrille,nom")] GrilleCours grilleCours)
        {
            if (ModelState.IsValid)
            {
                db.Entry(grilleCours).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(grilleCours);
        }

        public ActionResult Info(int id)
        {
            return View(db.GrilleCours.Find(id));
        }

        public ActionResult infoHeure(int id) {
            return View(db.GrilleCours.Find(id));
        }

        public ActionResult _Heure(int id)
        {
            return PartialView(db.GrilleCours.Find(id));
        }

        public ActionResult infoPrealable(int id)
        {
            return View(db.GrilleCours.Find(id));
        }

        public ActionResult _Prealable(int id)
        {
            return PartialView(db.GrilleCours.Find(id));
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GrilleCours grilleCours = db.GrilleCours.Find(id);
            if (grilleCours == null)
            {
                return HttpNotFound();
            }
            return View(grilleCours);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            GrilleCours grilleCours = db.GrilleCours.Find(id);
            db.GrilleCours.Remove(grilleCours);
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

