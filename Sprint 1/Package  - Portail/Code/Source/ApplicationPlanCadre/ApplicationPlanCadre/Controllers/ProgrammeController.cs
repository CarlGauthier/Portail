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
