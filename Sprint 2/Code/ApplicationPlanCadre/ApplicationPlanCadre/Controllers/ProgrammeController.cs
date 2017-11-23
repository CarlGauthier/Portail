using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
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
        public ActionResult _TreeView()
        {
            var programme = db.Programme.ToList();

            return PartialView(programme);
        }
        // GET: Programme

        public ActionResult PlanCadre()
        {
            return View("PlanCadre", db.Programme.ToList());
        }
    }
}