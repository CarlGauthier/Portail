using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ApplicationPlanCadre.Helpers;

namespace ApplicationPlanCadre.Controllers
{
    public class CompetenceController : Controller
    {
        [customAuthorize(Roles ="RCP")]
        // GET: Competence
        public ActionResult indexCompetence()
        {
            return View();
        }
    }
}