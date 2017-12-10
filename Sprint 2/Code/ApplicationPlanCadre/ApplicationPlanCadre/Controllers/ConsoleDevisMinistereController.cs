﻿using System;
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
    public class ConsoleDevisMinistereController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        public ActionResult _PartialList()
        {
            var devisMinistere = db.DevisMinistere.Include(p => p.EnteteProgramme);
            return PartialView(devisMinistere.ToList());
        }

        public ActionResult Create()
        {
            ViewBag.codeProgramme = BuildCodeDevisMinistereSelectList();
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
                ModelState.AddModelError("Duplique", "Erreur, ce devis existe déjà.");
            ViewBag.codeProgramme = BuildCodeDevisMinistereSelectList();
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
            ViewBag.codeProgramme = BuildCodeDevisMinistereSelectList(devisMinistere.codeProgramme);
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
            ViewBag.codeProgramme = BuildCodeDevisMinistereSelectList();
            return View(devisMinistere);
        }

        private SelectList BuildCodeDevisMinistereSelectList(string codeProgramme = null)
        {
            var liste = db.EnteteProgramme
            .Select(e => new { codeProgramme = e.codeProgramme, texte = e.codeProgramme + " - " + e.nom }).ToList();
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
