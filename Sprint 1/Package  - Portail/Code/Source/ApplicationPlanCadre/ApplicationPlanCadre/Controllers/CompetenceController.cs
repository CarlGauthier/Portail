﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ApplicationPlanCadre.Controllers
{
    public class CompetenceController : Controller
    {
        [Authorize(Roles ="RCP")]
        // GET: Competence
        public ActionResult indexCompetence()
        {
            return View();
        }
    }
}