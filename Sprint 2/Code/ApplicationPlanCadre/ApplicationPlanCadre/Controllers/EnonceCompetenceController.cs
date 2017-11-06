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

        public ActionResult Create(int? idProgramme)
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
            EnonceCompetence enonceCompetence = new EnonceCompetence();
            enonceCompetence.Programme = programme;
            enonceCompetence.idProgramme = programme.idProgramme;
            return View(enonceCompetence);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idCompetence,codeCompetence,enonceCompetence1,motClef,obligatoire,actif,commentaire,idProgramme")] EnonceCompetence enonceCompetence)
        {
            bool existe;
            existe = db.EnonceCompetence.Any(ec => ec.codeCompetence == enonceCompetence.codeCompetence && ec.idProgramme == enonceCompetence.idProgramme);
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
        public ActionResult Edit([Bind(Include = "idCompetence,codeCompetence,enonceCompetence1,motClef,obligatoire,actif,commentaire,idProgramme")] EnonceCompetence enonceCompetence)
        {
            bool existe;
            existe = db.EnonceCompetence.Any(ec => ec.idCompetence != enonceCompetence.idCompetence && ec.codeCompetence == enonceCompetence.codeCompetence && ec.idProgramme == enonceCompetence.idProgramme);
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
            return RedirectToAction("Info", "Programme", new { idProgramme = enonceCompetence.idProgramme });
        }

        private void Trim(EnonceCompetence enonceCompetence)
        {
            if (enonceCompetence.enonceCompetence1 != null) enonceCompetence.enonceCompetence1 = enonceCompetence.enonceCompetence1.Trim();
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
