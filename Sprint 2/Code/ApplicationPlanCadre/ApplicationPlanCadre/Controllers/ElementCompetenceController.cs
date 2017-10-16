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
    public class ElementCompetenceController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();
        [Route("Element-Competence/{id:int?}",Name ="Info-elementComp")]
        public ActionResult Info(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ElementCompetence elementCompetence = db.ElementCompetence.Find(id);
            if (elementCompetence == null)
            {
                return HttpNotFound();
            }
            return View(elementCompetence);
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
