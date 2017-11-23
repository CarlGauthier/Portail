using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ApplicationPlanCadre.Models;

namespace ApplicationPlanCadre.Controllers
{
    public class PlanCadreController : Controller
    {
        private BDPlanCadre db = new BDPlanCadre();

        public ActionResult _TreeView()
        {
            var planCadre = db.PlanCadre.ToList();

            return PartialView(planCadre);
        }

        // GET: PCInstance
        public ActionResult Index()
        {
            return View(db.PlanCadre.ToList());
        }

        public ActionResult Info(int? id)
        {
            return View(db.PlanCadre.Find(id));
        }

        public ActionResult Create()
        {
            return View();
        }
    }
}