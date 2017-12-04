using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Configuration;
using System.Dynamic;
using System.Net;
using System.Data.Entity;
using ApplicationPlanCadre.Models;
using Rotativa;
using Rotativa.Options;

namespace ApplicationPlanCadre.Controllers
{
    public class RapportController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();
        // GET: Rapport
        public ActionResult Index()
        {
            return View(db.PlanCadre.ToList());
        }
    }
}