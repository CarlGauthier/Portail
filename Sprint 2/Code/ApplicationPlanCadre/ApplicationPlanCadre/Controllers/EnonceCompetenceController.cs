﻿using System;
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
    [Authorize(Roles = "RCP")]
    public class EnonceCompetenceController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();
        
        [Route("Enoncer-Competence/{id:int?}",Name ="Info-enonceCompetence")]
        public ActionResult Info(int? idCompetence)
        {
            if (idCompetence == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnonceCompetence enonceCompetence = db.EnonceCompetence.Find(idCompetence);
            if (enonceCompetence == null)
            {
                return HttpNotFound();
            }
            return View(enonceCompetence);
        }

        public ActionResult Create(int? idDevis)
        {
            if (idDevis == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DevisMinistere devisMinistere = db.DevisMinistere.Find(idDevis);
            if (devisMinistere == null)
            {
                return HttpNotFound();
            }
            EnonceCompetence enonceCompetence = new EnonceCompetence();
	        enonceCompetence.DevisMinistere = devisMinistere;
            enonceCompetence.idDevis = devisMinistere.idDevis;
            enonceCompetence.obligatoire = true;
            enonceCompetence.actif = true;
            enonceCompetence.DevisMinistere = devisMinistere;
            enonceCompetence.idDevis = devisMinistere.idDevis;
            return View(enonceCompetence);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idCompetence,codeCompetence,description,motClef,obligatoire,actif,commentaire,idDevis")] EnonceCompetence enonceCompetence)
        {
            bool existe;
            existe = db.EnonceCompetence.Any(ec => ec.codeCompetence == enonceCompetence.codeCompetence && ec.idDevis == enonceCompetence.idDevis);
            Trim(enonceCompetence);
            if (!existe && ModelState.IsValid)
            {
                enonceCompetence.codeCompetence = enonceCompetence.codeCompetence.ToUpper();
                db.EnonceCompetence.Add(enonceCompetence);
                db.SaveChanges();
                return RedirectToAction("Create", "ContexteRealisation", new { idCompetence = enonceCompetence.idCompetence });
            }
            if (existe)
                ModelState.AddModelError("Duplique", "Erreur, un énoncé de compétence avec ce code existe déjà.");
            return View(enonceCompetence);
        }

        public ActionResult Edit(int? idCompetence)
        {
            if (idCompetence == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnonceCompetence enonceCompetence = db.EnonceCompetence.Find(idCompetence);
            if (enonceCompetence == null)
            {
                return HttpNotFound();
            }
            return View(enonceCompetence);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idCompetence,codeCompetence,description,motClef,obligatoire,actif,commentaire,idDevis")] EnonceCompetence enonceCompetence)
        {
            bool existe;
            existe = db.EnonceCompetence.Any(ec => ec.idCompetence != enonceCompetence.idCompetence && ec.codeCompetence == enonceCompetence.codeCompetence && ec.idDevis == enonceCompetence.idDevis);
            Trim(enonceCompetence);
            if (!existe && ModelState.IsValid)
            {
                db.Entry(enonceCompetence).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Create", "ContexteRealisation", new { idCompetence = enonceCompetence.idCompetence });
            }
            if (existe)
                ModelState.AddModelError("Duplique", "Erreur, un énoncé de compétence avec ce code existe déjà.");
            return View(enonceCompetence);
        }

        public ActionResult Delete(int? idCompetence)
        {
            if (idCompetence == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EnonceCompetence enonceCompetence = db.EnonceCompetence.Find(idCompetence);
            if (enonceCompetence == null)
            {
                return HttpNotFound();
            }
            return View(enonceCompetence);
        }

        public ActionResult DeleteConfirmed(int idCompetence)
        {
            EnonceCompetence enonceCompetence = db.EnonceCompetence.Find(idCompetence);
            foreach(ElementCompetence ec in enonceCompetence.ElementCompetence)
            {
                db.CriterePerformance.RemoveRange(ec.CriterePerformance);
            }
            db.ElementCompetence.RemoveRange(enonceCompetence.ElementCompetence);
            db.ContexteRealisation.RemoveRange(enonceCompetence.ContexteRealisation);
            db.EnonceCompetence.Remove(enonceCompetence);
            db.SaveChanges();
            return RedirectToAction("Info", "DevisMinistere", new { idDevis = enonceCompetence.idDevis });
        }

        private void Trim(EnonceCompetence enonceCompetence)
        {
            if (enonceCompetence.description != null) enonceCompetence.description = enonceCompetence.description.Trim();
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }


        //------------------- TEST AJAX -------------------\\
        List<ContexteRealisation> lstContexteTemporaire = new List<ContexteRealisation>();
        List<ElementCompetence> lstElementTemporaire = new List<ElementCompetence>();
        List<CriterePerformance> lstCritereTemporaire = new List<CriterePerformance>();
        public void Constructeur()
        {
            lstElementTemporaire = new List<ElementCompetence>();
            lstCritereTemporaire = new List<CriterePerformance>();
        }           

        public ActionResult CreateAJAX(int? idDevis)
        {
            if (idDevis == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DevisMinistere devisMinistere = db.DevisMinistere.Find(idDevis);
            if (devisMinistere == null)
            {
                return HttpNotFound();
            }
            Constructeur();
            EnonceCompetenceAJAX enonceCompetence = new EnonceCompetenceAJAX();
            enonceCompetence.enonce = new EnonceCompetence();
            enonceCompetence.contexte = new ContexteRealisation();
            enonceCompetence.element = new ElementCompetence();
            enonceCompetence.critere = new CriterePerformance();
            enonceCompetence.enonce.DevisMinistere = devisMinistere;
            enonceCompetence.enonce.idDevis = devisMinistere.idDevis;
            enonceCompetence.enonce.obligatoire = true;
            enonceCompetence.enonce.actif = true;
            enonceCompetence.enonce.DevisMinistere = devisMinistere;
            enonceCompetence.enonce.idDevis = devisMinistere.idDevis;

            return View("CreateAJAX", enonceCompetence);
        }
        [HttpPost]
        public ActionResult ContexteTemporaire(string contexte)
        {
            return Json(contexte, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public JsonResult ElementTemporaire(string element)
        {
            return Json(element, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult CritereTemporaire(string critere)
        {
            return Json(critere, JsonRequestBehavior.AllowGet);
        }

        [HttpPost]
        public ActionResult Create(string contexteElementCritere)
        {
            return Json(contexteElementCritere, JsonRequestBehavior.AllowGet);
        }
    }
}
