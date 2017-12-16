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
    [RCPElementCompetenceAuthorize]
    public class ElementCompetenceController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();
        public ActionResult Info(int? idElement)
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
            return View(elementCompetence);
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
            ElementCompetence elementCompetence = new ElementCompetence();
            elementCompetence.EnonceCompetence = enonceCompetence;
            elementCompetence.idCompetence = enonceCompetence.idCompetence;
            return View(elementCompetence);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [RCPEnonceCompetenceAuthorize]
        public ActionResult Create([Bind(Include = "idElement,description,numero,motClef,commentaire,idCompetence")] ElementCompetence elementCompetence)
        {
            AssignNo(elementCompetence);
            Trim(elementCompetence);
            if (ModelState.IsValid)
            {
                db.ElementCompetence.Add(elementCompetence);
                db.SaveChanges();
                return RedirectToAction("Create", "CriterePerformance", new { idElement = elementCompetence.idElement });
            }
            return View(elementCompetence);
        }

        public ActionResult Edit(int? idElement)
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
            return View(elementCompetence);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "idElement,description,numero,motClef,commentaire,idCompetence")] ElementCompetence elementCompetence)
        {
            Trim(elementCompetence);
            if (ModelState.IsValid)
            {
                db.Entry(elementCompetence).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Create", "CriterePerformance", new { idElement = elementCompetence.idElement });
            }
            return View(elementCompetence);
        }

        public ActionResult Delete(int? idElement)
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
            return View(elementCompetence);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int idElement)
        {
            ElementCompetence elementCompetence = db.ElementCompetence.Find(idElement);
            db.CriterePerformance.RemoveRange(elementCompetence.CriterePerformance);
            db.ElementCompetence.Remove(elementCompetence);
            AjustNo(elementCompetence);
            db.SaveChanges();
            return RedirectToAction("Info", "EnonceCompetence", new { idCompetence = elementCompetence.idCompetence });
        }

        public ActionResult Order(int? idCompetence)
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

        public ActionResult MoveUp(int idElement)
        {
            return Move(-1, idElement);
        }

        public ActionResult MoveDown(int idElement)
        {
            return Move(1, idElement);
        }

        private ActionResult Move(int v, int idElement)
        {
            ElementCompetence elementCompetence = db.ElementCompetence.Find(idElement);
            IQueryable<ElementCompetence> query = (from cp in db.ElementCompetence
                                                    where cp.idCompetence == elementCompetence.idCompetence && cp.numero == elementCompetence.numero + v
                                                    select cp);
            if (query.Count() > 0)
            {
                ElementCompetence cpAutre = query.First();
                elementCompetence.numero += v;
                cpAutre.numero -= v;
                db.SaveChanges();
            }
            return RedirectToAction("Order", new { idCompetence = elementCompetence.idCompetence });
        }

        private void AssignNo(ElementCompetence elementCompetence)
        {
            int lastNo = 0;
            IQueryable<int> query = (from ec in db.ElementCompetence
                                     where ec.idCompetence == elementCompetence.idCompetence
                                     select ec.numero);

            IEnumerable<int> list = query;

            if (query.Count() > 0)
            {
                lastNo = query.Max();
            }
            elementCompetence.numero = lastNo + 1;
        }

        private void AjustNo(ElementCompetence elementCompetence)
        {
            IQueryable<ElementCompetence> query = (from ec in db.ElementCompetence
                                                    where ec.idCompetence == elementCompetence.idCompetence && ec.numero > elementCompetence.numero
                                                    select ec);
            foreach (ElementCompetence ec in query)
            {
                ec.numero--;
            }
        }

        private void Trim(ElementCompetence elementCompetence)
        {
            if (elementCompetence.description != null) elementCompetence.description = elementCompetence.description.Trim();
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
