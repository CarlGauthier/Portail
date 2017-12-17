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
    [Authorize(Roles = "Admin")]
    public class ConsoleProgrammeController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        public ActionResult _PartialList()
        {
            return PartialView(db.Programme.ToList());
        }

        public ActionResult Create()
        {
            ViewBag.idDevis = BuildDevisSelectList();
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
                return RedirectToAction("Create");
            }
            ViewBag.idDevis = BuildDevisSelectList();
            return View(programme);
        }

        public ActionResult Edit(int? idProgramme)
        {
            if (idProgramme == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Programme programme = db.Programme.Find(idProgramme);
            if (programme == null)
            {
                return HttpNotFound();
            }
            ViewBag.idDevis = BuildDevisSelectList(programme.idDevis);
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
                return RedirectToAction("Create");
            }
            ViewBag.idDevis = BuildDevisSelectList(programme.idDevis);
            return View(programme);
        }

        private SelectList BuildDevisSelectList(int? idDevis = null)
        {
            var devis = db.DevisMinistere;
            List<SelectListItem> liste = new List<SelectListItem>();
            foreach (DevisMinistere e in devis)
            {
                liste.Add(new SelectListItem { Value = e.idDevis.ToString(), Text = e.nom });
            }
            if (idDevis != null)
                return new SelectList(liste, "Value", "Text", idDevis);
            return new SelectList(liste, "Value", "Text");
        }

        [ActionName("Delete")]
        public ActionResult DeleteConfirmed(int idProgramme)
        {
            Programme Programme = db.Programme.Find(idProgramme);
            db.Programme.Remove(Programme);
            db.SaveChanges();
            return RedirectToAction("Create");
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
