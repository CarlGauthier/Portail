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
    public class ConsoleDevisController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        public ActionResult _PartialList()
        {
            var devisMinistere = db.DevisMinistere.Include(p => p.EnteteProgramme);
            return PartialView(devisMinistere.ToList());
        }

        [Route("Admin-devisMinistere", Name = "creation-devisMinistere")]
        public ActionResult Create()
        {
            ViewBag.codeProgramme = GetCodeDevisMinistereSelectList();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "codeProgramme, annee, codeSpecialisation")] DevisMinistere devisMinistere)
        {
            bool existe;
            existe = db.DevisMinistere.Any(p => p.codeProgramme == devisMinistere.codeProgramme && p.annee == devisMinistere.annee && p.codeSpecialisation == devisMinistere.codeSpecialisation);
            if (!existe && ModelState.IsValid)
            {
                devisMinistere.codeSpecialisation = devisMinistere.codeSpecialisation.ToUpper();
                db.DevisMinistere.Add(devisMinistere);
                db.SaveChanges();
                return RedirectToAction("Create");
            }
            if (existe)
                ModelState.AddModelError("Duplique", "Erreur, ce devisMinistere existe déjà.");
            ViewBag.codeProgramme = GetCodeDevisMinistereSelectList();
            return View(devisMinistere);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DevisMinistere devisMinistere = db.DevisMinistere.Find(id);
            if (devisMinistere == null)
            {
                return HttpNotFound();
            }
            ViewBag.codeProgramme = GetCodeDevisMinistereSelectList(devisMinistere.codeProgramme);
            return View(devisMinistere);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idDevis, codeProgramme, annee, codeSpecialisation")] DevisMinistere devisMinistere)
        {
            bool existe;
            existe = db.DevisMinistere.Any(p => p.idDevis != devisMinistere.idDevis && p.codeProgramme == devisMinistere.codeProgramme && p.annee == devisMinistere.annee && p.codeSpecialisation == devisMinistere.codeSpecialisation);
            if (!existe && ModelState.IsValid)
            {
                devisMinistere.codeSpecialisation = devisMinistere.codeSpecialisation.ToUpper();
                db.Entry(devisMinistere).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Create");
            }
            if (existe)
                ModelState.AddModelError("Duplique", "Erreur, ce devisMinistere existe déjà.");
            ViewBag.codeProgramme = GetCodeDevisMinistereSelectList();
            return View(devisMinistere);
        }

        private SelectList GetCodeDevisMinistereSelectList(string codeProgramme = null)
        {
            var liste =
            db.EnteteProgramme
            .Select(ep => new
            {
                codeProgramme = ep.codeProgramme,
                texte = ep.codeProgramme + " - " + ep.codeProgramme,
            })
            .ToList();
            if(codeProgramme != null)
                return new SelectList(liste, "codeProgramme", "texte", codeProgramme);
            return new SelectList(liste, "codeProgramme", "texte");
        }

        public ActionResult DeleteConfirmed(int id)
        {
            DevisMinistere DevisMinistere = db.DevisMinistere.Find(id);
            db.DevisMinistere.Remove(DevisMinistere);
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
