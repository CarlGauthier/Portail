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
    public class CriterePerformanceController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        public ActionResult _PartialList(int? idElement)
        {
            ElementCompetence elementCompetence = db.ElementCompetence.Find(idElement);
            return PartialView(elementCompetence.CriterePerformance.OrderBy(cp => cp.numero));
        }

        public ActionResult Create(int? idElement)
        {
            if (idElement == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ElementCompetence elementCompetence = db.ElementCompetence.Find(idElement);
            if (elementCompetence == null)
            {
                return HttpNotFound();
            }
            CriterePerformance criterePerformance = new CriterePerformance();
            criterePerformance.ElementCompetence = elementCompetence;
            criterePerformance.idElement = elementCompetence.idElement;
            return View(criterePerformance);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "idCritere,criterePerformance1,numero,commentaire,idElement")] CriterePerformance criterePerformance)
        {
            AssignNo(criterePerformance);
            if (ModelState.IsValid)
            {
                Trim(criterePerformance);
                db.CriterePerformance.Add(criterePerformance);
                db.SaveChanges();
                return RedirectToAction("Create", new { idElement = criterePerformance.idElement });
            }
            criterePerformance.ElementCompetence = db.ElementCompetence.Find(criterePerformance.idElement);
            return View(criterePerformance);
        }

        public ActionResult Edit(int? idCritere)
        {
            if (idCritere == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CriterePerformance criterePerformance = db.CriterePerformance.Find(idCritere);
            if (criterePerformance == null)
            {
                return HttpNotFound();
            }
            return View(criterePerformance);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idCritere,criterePerformance1,numero,commentaire,idElement")] CriterePerformance criterePerformance)
        {
            if (ModelState.IsValid)
            {
                Trim(criterePerformance);
                db.Entry(criterePerformance).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Create", new { idElement = criterePerformance.idElement });
            }
            return View(criterePerformance);
        }

        [ActionName("Delete")]
        public ActionResult DeleteConfirmed(int idCritere)
        {
            CriterePerformance criterePerformance = db.CriterePerformance.Find(idCritere);
            db.CriterePerformance.Remove(criterePerformance);
            AjustNo(criterePerformance);
            db.SaveChanges();
            return RedirectToAction("Create", new { idElement = criterePerformance.idElement });
        }

        public ActionResult MoveUp(int idCritere)
        {
            return Move(-1, idCritere);
        }

        public ActionResult MoveDown(int idCritere)
        {
            return Move(1, idCritere);
        }

        private ActionResult Move(int v, int idCritere)
        {
            CriterePerformance criterePerformance = db.CriterePerformance.Find(idCritere);
            IQueryable<CriterePerformance> query = (from cp in db.CriterePerformance
                                                    where cp.idElement == criterePerformance.idElement && cp.numero == criterePerformance.numero + v
                                                    select cp);
            if (query.Count() > 0)
            {
                CriterePerformance cpAutre = query.First();
                criterePerformance.numero += v;
                cpAutre.numero -= v;
                db.SaveChanges();
            }
            return RedirectToAction("Create", new { idElement = criterePerformance.idElement });
        }

        private void AssignNo(CriterePerformance criterePerformance)
        {
            int lastNo = 0;
            IQueryable<int> query = (from cp in db.CriterePerformance
                                    where cp.idElement == criterePerformance.idElement
                                    select cp.numero);

            IEnumerable<int> list = query;

            if (query.Count() > 0)
            {
                lastNo = query.Max();
            }
            criterePerformance.numero = lastNo + 1;
        }

        private void AjustNo(CriterePerformance criterePerformance)
        {
            IQueryable<CriterePerformance> query = (from cp in db.CriterePerformance
                                                    where cp.idElement == criterePerformance.idElement && cp.numero > criterePerformance.numero
                                                    select cp);
            foreach(CriterePerformance cp in query)
            {
                cp.numero--;
            }
        }

        private void Trim(CriterePerformance criterePerformance)
        {
            criterePerformance.criterePerformance1.Trim();
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