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
    [RCPContexteRealisationAuthorize]
    public class ContexteRealisationController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        public ActionResult _PartialList(int? idCompetence)
        {
            EnonceCompetence enonceCompetence = db.EnonceCompetence.Find(idCompetence);
            return PartialView(enonceCompetence.ContexteRealisation.OrderBy(e => e.numero));
        }

        [RCPEnonceCompetenceAuthorize]
        public ActionResult Create(int? idCompetence)
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
            ContexteRealisation contexteRealisation = new ContexteRealisation();
            contexteRealisation.EnonceCompetence = enonceCompetence;
            contexteRealisation.idCompetence = enonceCompetence.idCompetence;
            return View(contexteRealisation);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [RCPEnonceCompetenceAuthorize]
        public ActionResult Create([Bind(Include = "idContexte,description,commentaire,idCompetence")] ContexteRealisation contexteRealisation)
        {
            Trim(contexteRealisation);
            AssignNo(contexteRealisation);
            if (ModelState.IsValid)
            {
                db.ContexteRealisation.Add(contexteRealisation);
                db.SaveChanges();
                return RedirectToAction("Create", new { idCompetence = contexteRealisation.idCompetence });
            }
            contexteRealisation.EnonceCompetence = db.EnonceCompetence.Find(contexteRealisation.idCompetence);
            return View(contexteRealisation);
        }

        public ActionResult Edit(int? idContexte)
        {
            if (idContexte == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ContexteRealisation contexteRealisation = db.ContexteRealisation.Find(idContexte);
            if (contexteRealisation == null)
            {
                return HttpNotFound();
            }
            return View(contexteRealisation);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idContexte,numero,description,commentaire,idCompetence")] ContexteRealisation contexteRealisation)
        {
            Trim(contexteRealisation);
            if (ModelState.IsValid)
            {
                db.Entry(contexteRealisation).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Create", new { idCompetence = contexteRealisation.idCompetence });
            }
            return View(contexteRealisation);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int idContexte)
        {
            ContexteRealisation contexteRealisation = db.ContexteRealisation.Find(idContexte);
            db.ContexteRealisation.Remove(contexteRealisation);
            AjustNo(contexteRealisation);
            db.SaveChanges();
            return RedirectToAction("Create", new { idCompetence = contexteRealisation.idCompetence });
        }

        public ActionResult MoveUp(int idContexte)
        {
            return Move(-1, idContexte);
        }

        public ActionResult MoveDown(int idContexte)
        {
            return Move(1, idContexte);
        }

        private ActionResult Move(int v, int idContexte)
        {
            ContexteRealisation contexteRealisation = db.ContexteRealisation.Find(idContexte);
            IQueryable<ContexteRealisation> query = (from cp in db.ContexteRealisation
                                                    where cp.idCompetence == contexteRealisation.idCompetence && cp.numero == contexteRealisation.numero + v
                                                    select cp);
            if (query.Count() > 0)
            {
                ContexteRealisation cpAutre = query.First();
                contexteRealisation.numero += v;
                cpAutre.numero -= v;
                db.SaveChanges();
            }
            return RedirectToAction("Create", new { idCompetence = contexteRealisation.idCompetence });
        }

        private void AssignNo(ContexteRealisation contexteRealisation)
        {
            int lastNo = 0;
            IQueryable<int> query = (from cp in db.ContexteRealisation
                                     where cp.idCompetence == contexteRealisation.idCompetence
                                     select cp.numero);

            IEnumerable<int> list = query;

            if (query.Count() > 0)
            {
                lastNo = query.Max();
            }
            contexteRealisation.numero = lastNo + 1;
        }

        private void AjustNo(ContexteRealisation contexteRealisation)
        {
            IQueryable<ContexteRealisation> query = (from cp in db.ContexteRealisation
                                                    where cp.idCompetence == contexteRealisation.idCompetence && cp.numero > contexteRealisation.numero
                                                    select cp);
            foreach (ContexteRealisation cp in query)
            {
                cp.numero--;
            }
        }

        private void Trim(ContexteRealisation contexteRealisation)
        {
            if (contexteRealisation.description != null) contexteRealisation.description = contexteRealisation.description.Trim();
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
