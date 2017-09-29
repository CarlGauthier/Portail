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
    //[Authorize(Roles = "Admin,RCP")]
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
            ViewBag.codeProgramme = GetCodeProgrammeSelectList();
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "codeProgramme, annee, codeSpecialisation")] Programme programme)
        {
            programme.codeSpecialisation = programme.codeSpecialisation.ToUpper();
            ModelState.Clear();
            TryValidateModel(programme);
            bool existe = db.Programme.Any(p => p.codeProgramme == programme.codeProgramme && p.annee == programme.annee && p.codeSpecialisation == programme.codeSpecialisation);
            bool valide = ModelState.IsValid && !existe;
            if (valide)
            {
                db.Programme.Add(programme);
                db.SaveChanges();
                return RedirectToAction("Create");
            }
            if (existe)
                ViewBag.messageError = "Erreur, ce programme existe déjà.";
            ViewBag.codeProgramme = GetCodeProgrammeSelectList();
            return View(programme);
        }

        private SelectList GetCodeProgrammeSelectList()
        {
            var liste =
            db.EnteteProgramme
            .Select(ep => new
            {
                codeProgramme = ep.codeProgramme,
                texte = ep.codeProgramme + " - " + ep.commentaire
            })
            .ToList();
            return new SelectList(liste, "codeProgramme", "texte");
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
            ViewBag.codeProgramme = GetCodeProgrammeSelectList();
            return View(programme);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idProgramme, codeProgramme, annee, codeSpecialisation")] Programme programme)
        {
            programme.codeSpecialisation = programme.codeSpecialisation.ToUpper();
            if (ModelState.IsValid)
            {
                db.Programme.Add(programme);
                db.SaveChanges();
                return RedirectToAction("Create");
            }
            ViewBag.codeProgramme = GetCodeProgrammeSelectList();
            return View(programme);
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