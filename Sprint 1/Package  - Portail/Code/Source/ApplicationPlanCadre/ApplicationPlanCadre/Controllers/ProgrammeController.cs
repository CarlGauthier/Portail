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
    [customAuthorize(Roles ="Admin")]
    public class ProgrammeController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        public ActionResult Index()
        {
            var programme = db.Programme
                          .Include(p => p.EnonceCompetence)
                          .ToList();
            return View(programme);
        }

        public ActionResult TreeView()
        {
            var programme = db.Programme
                          .Include(p => p.EnonceCompetence)
                          .ToList();
            return View(programme);
        }

        public ActionResult Create()
        {
            ViewBag.codeProgramme = new SelectList(db.EnteteProgramme, "codeProgramme", "codeProgramme");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "codeProgramme, annee, codeSpecialisation")] Programme programme)
        {
            if (db.Programme.Any(p => p.codeProgramme == programme.codeProgramme && p.annee == programme.annee && p.codeSpecialisation == programme.codeSpecialisation))
            {
                ViewBag.codeProgramme = new SelectList(db.EnteteProgramme, "codeProgramme", "codeProgramme");
                ViewBag.messageError = "Erreur, ce programme existe déjà.";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    db.Programme.Add(programme);
                    db.SaveChanges();
                }
                return RedirectToAction("Create");
            }
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
            ViewBag.codeProgramme = new SelectList(db.EnteteProgramme, "CodeProgramme", "CodeProgramme", programme.codeProgramme);
            return View(programme);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idProgramme, codeProgramme, annee, codeSpecialisation")] Programme programme)
        {
            if (db.Programme.Any(p => p.codeProgramme == programme.codeProgramme && p.annee == programme.annee && p.codeSpecialisation == programme.codeSpecialisation))
            {
                ViewBag.codeProgramme = new SelectList(db.EnteteProgramme, "codeProgramme", "codeProgramme");
                ViewBag.messageError = "Erreur, ce programme existe déjà.";
                return View();
            }
            else
            {
                if (ModelState.IsValid)
                {
                    db.Entry(programme).State = EntityState.Modified;
                    db.SaveChanges();
                }
                return RedirectToAction("Create");
            }
        }

        public ActionResult DeleteConfirmed(int id)
        {
            Programme Programme = db.Programme.Find(id);
            db.Programme.Remove(Programme);
            db.SaveChanges();
            return RedirectToAction("Create");
        }

        public ActionResult _PartialList()
        {
            var programme = db.Programme.Include(p => p.EnteteProgramme);
            return PartialView(programme.ToList());
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