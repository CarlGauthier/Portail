﻿using System;
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


        public ActionResult Create(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlanCadre planCadre = db.PlanCadre.Find(id);
            if (planCadre == null)
            {
                return HttpNotFound();
            }
            return View(planCadre);
        }

        public ActionResult Info(int? id)
        {
            List<PlanCadre> planList = new List<PlanCadre>();
            var planCadre = from a in db.PlanCadre
                            join b in db.PlanCadrePrealable on a.idPlanCadre equals b.idPlanCadre
                            where b.idPrealable == id
                            select a;
            foreach (PlanCadre plan in planCadre)
            {
                planList.Add(plan);
            }

            ViewData["listPcPrealableA"] = planList;
            return View(db.PlanCadre.Find(id));
        }

        public ActionResult Create()
        {
            ViewBag.PlanCadre = new SelectList(db.PlanCadre, "idPlanCadre", "titreCours");
            return View();
        }
    }
}