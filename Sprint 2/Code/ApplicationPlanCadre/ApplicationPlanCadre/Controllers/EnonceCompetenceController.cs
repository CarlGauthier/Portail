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
    [RCPEnonceCompetenceAuthorize]
    public class EnonceCompetenceController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

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

        [RCPDevisMinistereAuthorize]
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
            enonceCompetence.obligatoire = true;
            enonceCompetence.actif = true;
            enonceCompetence.idDevis = devisMinistere.idDevis;
            return View(enonceCompetence);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [RCPDevisMinistereAuthorize]
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

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int idCompetence)
        {
            var PlanCadreEnonce = from pc in db.PlanCadreEnonce
                                  where pc.idCompetence == idCompetence
                                  select pc;

            if(PlanCadreEnonce.Count() == 0)
            {
                EnonceCompetence enonceCompetence = db.EnonceCompetence.Find(idCompetence);
                foreach (ElementCompetence ec in enonceCompetence.ElementCompetence)
                {
                    db.CriterePerformance.RemoveRange(ec.CriterePerformance);
                }
                db.ElementCompetence.RemoveRange(enonceCompetence.ElementCompetence);
                db.ContexteRealisation.RemoveRange(enonceCompetence.ContexteRealisation);
                db.EnonceCompetence.Remove(enonceCompetence);
                db.SaveChanges();
            }
            
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
    }
}
