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
            var programme = db.Programme.Include(p => p.DevisMinistere.EnteteProgramme);
            return PartialView(programme.ToList());
        }
        /*
        public ActionResult Create()
        {
            ViewBag.idDevis = GetDevisSelectList();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "codeProgramme, annee, codeSpecialisation")] Programme programme)
        {
            bool existe;
            existe = db.Programme.Any(p => p.codeProgramme == programme.codeProgramme && p.annee == programme.annee && p.codeSpecialisation == programme.codeSpecialisation);
            if (!existe && ModelState.IsValid)
            {
                programme.codeSpecialisation = programme.codeSpecialisation.ToUpper();
            if (ModelState.IsValid)
            {
                db.Programme.Add(programme);
                db.SaveChanges();
                return RedirectToAction("Create");
            }
            if (existe)
                ModelState.AddModelError("Duplique", "Erreur, ce programme existe déjà.");
            ViewBag.codeProgramme = GetCodeProgrammeSelectList();
            return View(programme);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Programme programme = db.Programme.Find(i
            ViewBag.idDevis = GetDevisSelectList();
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
            ViewBag.codeProgramme = GetCodeProgrammeSelectList(programme.codeProgramme);

            ViewBag.idDevis = GetDevisSelectList(programme.idDevis);

            return View(programme);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult Edit([Bind(Include = "idProgramme, codeProgramme, annee, codeSpecialisation")] Programme programme)
        {
            bool existe;
            existe = db.Programme.Any(p => p.idProgramme != programme.idProgramme && p.codeProgramme == programme.codeProgramme && p.annee == programme.annee && p.codeSpecialisation == programme.codeSpecialisation);
            if (!existe && ModelState.IsValid)
            {
                programme.codeSpecialisation = programme.codeSpecialisation.ToUpper();
        public ActionResult Edit([Bind(Include = "idProgramme,nom,annee,dateValidation,idDevis")] Programme programme)
        {
            if (ModelState.IsValid)
            {
                db.Entry(programme).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Create");
            }
            if (existe)
                ModelState.AddModelError("Duplique", "Erreur, ce programme existe déjà.");
            ViewBag.codeProgramme = GetCodeProgrammeSelectList();
            return View(programme);
        }

        private SelectList GetCodeProgrammeSelectList(string codeProgramme = null)
        {
            var liste =
            db.EnteteProgramme
            .Select(ep => new
            {
                codeProgramme = ep.codeProgramme,
                texte = ep.codeProgramme + " - " + ep.commentaire,
            })
            .ToList();
            if(codeProgramme != null)
                return new SelectList(liste, "codeProgramme", "texte", codeProgramme);
            return new SelectList(liste, "codeProgramme", "texte");
        }

        public ActionResult DeleteConfirmed(int id)
        {
            Programme Programme = db.Programme.Find(id);
            ViewBag.idDevis = GetDevisSelectList(programme.idDevis);
            return View(programme);
        }

        private SelectList GetDevisSelectList(int? idDevis = null)
        {
            var liste =
            db.DevisMinistere
            .Select(dm => new
            {
                idDevis = dm.idDevis,
                texte = dm.codeProgramme + "-" + dm.annee + "-" + dm.codeSpecialisation + " • " + dm.specialisation,
            })
            .ToList();
            if(idDevis != null)
                return new SelectList(liste, "idDevis", "texte", idDevis);
            return new SelectList(liste, "idDevis", "texte");
        }

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
        */
    }
}
