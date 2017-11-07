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
    public class ProgrammeController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();
        public ActionResult _TreeView()
        {
            var programme = db.Programme
                          .Include(p => p.EnonceCompetence)
                          .ToList();
            return PartialView(programme);
        }

        [Route("Programme", Name = "Index-programme")]
        public ActionResult Index()
        {
            return View(db.Programme.ToList());
        }

        [Route("Programme/{id:int?}", Name = "Info-programme")]
        public ActionResult Info(int? id)
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
            ViewBag.total = programme.nbHeurefrmGenerale + programme.nbHeurefrmSpecifique;
            //ViewBag.dateValidation = checkValidation(programme);
            return View(programme);
        }

        public ActionResult Create()
        {
            ViewBag.codeProgramme = new SelectList(db.EnteteProgramme, "codeProgramme", "commentaire");
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idProgramme,annee,nom,nbUnite,codeSpecialisation,specialisation,nbHeurefrmGenerale,nbHeurefrmSpecifique,condition,sanction,commentaire,docMinistere_path,dateValidation,codeProgramme")] Programme programme)
        {
            if (ModelState.IsValid)
            {
                db.Programme.Add(programme);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.codeProgramme = new SelectList(db.EnteteProgramme, "codeProgramme", "commentaire", programme.codeProgramme);
            return View(programme);
        }

        [Route("Programme/editer/{id:int?}", Name = "Edit-prog")]
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
            ViewBag.codeProgramme = new SelectList(db.EnteteProgramme, "codeProgramme", "commentaire", programme.codeProgramme);
            return View(programme);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Route("Programme/editer/{id:int?}", Name = "Enredit-prog")]
        public ActionResult Edit([Bind(Include = "idProgramme, codeProgramme, annee, codeSpecialisation, nom, dateValidation, docMinistere_path, specialisation, sanction, nbUnite, condition, nbHeurefrmGenerale,nbHeurefrmSpecifique")] Programme programme)
        {
            if (ModelState.IsValid)
            {
                db.Entry(programme).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.codeProgramme = new SelectList(db.EnteteProgramme, "codeProgramme", "commentaire", programme.codeProgramme);
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

        public ActionResult ValiderProgramme(int? id)
        {
            var programme = db.Programme.Include(p => p.EnteteProgramme);
            Programme program = db.Programme.Find(id);

            var dateTime = DateTime.Now;
            var date = dateTime.Date;
            program.dateValidation = date;

            db.Entry(program).State = EntityState.Modified;
            db.SaveChanges();

            return RedirectToAction("Details", new { id = id });
        }

        public string checkValidation(Programme programme)
        {
            string statut;
            if (programme.dateValidation == null)
            {
                statut = "Programme non enregistré.";
            }
            else
            {
                string date = programme.dateValidation.ToString();
                date = date.Substring(0, 10);
                statut = "Programme enregistré le " + date + ".";
            }
            return statut;
        }

        public ActionResult _PartialEnonceCompetence(int? id)
        {
            var programme = db.Programme.Include(p => p.EnteteProgramme).SingleOrDefault(x => x.idProgramme == id);
            return PartialView(programme);
        }

       
    }
}
